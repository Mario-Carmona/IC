;;;;;;; DIAGNOSTICO SOBRE LA AVERIA DE COCHE ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(deffacts Problemas
    (Problema problema_starter)
    (Problema problema_bujias)
    (Problema problema_bateria)
    (Problema motor_llega_gasolina)
)

(deffacts Evidencias
    (Evidencia hace_intentos_arrancar)
    (Evidencia hay_gasolina_en_deposito)
    (Evidencia encienden_las_luces)
    (Evidencia gira_motor)
)

(deffacts PreguntasEvidencias
    (Pregunta hace_intentos_arrancar "El coche hace intentos de arrancar (Si o No)? ")
    (Pregunta hay_gasolina_en_deposito "Hay gasolina en el deposito (Si o No)? ")
    (Pregunta encienden_las_luces "El coche enciende las luces (Si o No)? ")
    (Pregunta gira_motor "Gira el motor del coche (Si o No)? ")
)

(defrule pregunta_evidencias
?X <- (Evidencia ?e)
(Pregunta ?e ?pregunta)
=>
(printout t ?pregunta)
(bind ?respuesta (read))
(bind ?respuesta (lowcase ?respuesta))
(if (or (eq ?respuesta si) (eq ?respuesta no))
    then 
        (assert (Evidencia ?e ?respuesta))
    else
        (assert (volver_a_preguntar_evidencia ?e))  
)
(retract ?X)
)

(defrule volver_a_preguntar_evidencia
(declare (salience 1))
?X <- (volver_a_preguntar_evidencia ?e)
=>
(printout t "La respuesta no es correcta. ")
(assert (Evidencia ?e))
(retract ?X)
)

(defrule preguntar_grado_certeza
?X <- (Evidencia ?e ?r)
=>
(printout t "Con que grado de certeza lo afirmas [0,1]? ")
(bind ?certeza (read))
(if (and (<= 0 ?certeza) (<= ?certeza 1))
    then
        (assert (FactorCerteza ?e ?r ?certeza))
    else
        (assert (volver_a_preguntar_certeza ?e ?r))
)
(retract ?X)
)

(defrule volver_a_preguntar_certeza
(declare (salience 1))
?X <- (volver_a_preguntar_certeza ?e ?r)
=>
(printout t "El valor de certeza no es correcto. ")
(assert (Evidencia ?e ?r))
(retract ?X)
)



(deffunction encadenado (?fc_antecedente ?fc_regla)
(if (> ?fc_antecedente 0)
    then
        (bind ?rv (* ?fc_antecedente ?fc_regla))
    else
        (bind ?rv 0)
)
return ?rv
)

(defrule R1
(FactorCerteza motor_llega_gasolina si ?f1)
(FactorCerteza gira_motor si ?f2)
(test (and (> ?f1 0) (> ?f2 0)))
=>
(assert (FactorCerteza problema_bujias si (encadenado (* ?f1 ?f2) 0.7)))
(bind ?expl (str-cat "Como al motor llega gasolina con una certeza de " ?f1 " y gira el motor con un certeza de " ?f2 " entonces hay un problema con la bujias con una certeza de " (encadenado (* ?f1 ?f2) 0.7)))
(assert (explicacion problema_bujias ?expl))
)

(defrule R2
(FactorCerteza gira_motor no ?f1)
(test (> ?f1 0))
=>
(assert (FactorCerteza problema_starter si (encadenado ?f1 0.8)))
(bind ?expl (str-cat "Como no gira el motor con un certeza de " ?f1 " entonces hay un problema con el starter con una certeza de " (encadenado ?f1 0.8)))
(assert (explicacion problema_starter ?expl))
)

(defrule R3
(FactorCerteza encienden_las_luces no ?f1)
(test (> ?f1 0))
=>
(assert (FactorCerteza problema_bateria si (encadenado ?f1 0.9)))
(bind ?expl (str-cat "Como el coche no enciende las luces con un certeza de " ?f1 " entonces hay un problema con la bateria con una certeza de " (encadenado ?f1 0.9)))
(assert (explicacion problema_bateria ?expl))
)

(defrule R4
(FactorCerteza hay_gasolina_en_deposito si ?f1)
(test (> ?f1 0))
=>
(assert (FactorCerteza motor_llega_gasolina si (encadenado ?f1 0.9)))
(bind ?expl (str-cat "Como hay gasolina en el deposito con un certeza de " ?f1 " entonces llega gasolina al motor con una certeza de " (encadenado ?f1 0.9)))
(assert (explicacion motor_llega_gasolina ?expl))
)

(defrule R5
(FactorCerteza hace_intentos_arrancar si ?f1)
(test (> ?f1 0))
=>
(assert (FactorCerteza problema_starter si (encadenado ?f1 0.6)))
(bind ?expl (str-cat "Como el coche hace intentos de arrancar con un certeza de " ?f1 " entonces hay un problema con el starter con una certeza de " (encadenado ?f1 0.6)))
(assert (explicacion problema_starter ?expl))
)

(defrule R6
(FactorCerteza hace_intentos_arrancar si ?f1)
(test (> ?f1 0))
=>
(assert (FactorCerteza problema_bateria si (encadenado ?f1 0.5)))
(bind ?expl (str-cat "Como el coche hace intentos de arrancar con un certeza de " ?f1 " entonces hay un problema con la bateria con una certeza de " (encadenado ?f1 0.5)))
(assert (explicacion problema_bateria ?expl))
)


(deffunction combinacion (?fc1 ?fc2)
(if (and (> ?fc1 0) (> ?fc2 0))
    then
        (bind ?rv (- (+ ?fc1 ?fc2) (* ?fc1 ?fc2)))
    else
        (if (and (< ?fc1 0) (< ?fc2 0))
            then
                (bind ?rv (+ (+ ?fc1 ?fc2) (* ?fc1 ?fc2)))
            else 
                (bind ?rv (/ (+ ?fc1 ?fc2) (- 1 (min (abs ?fc1) (abs ?fc2)))))
        )
)
return ?rv
)

(defrule combinar
(declare (salience 1))
?f <- (FactorCerteza ?h ?r ?fc1)
?g <- (FactorCerteza ?h ?r ?fc2)
(test (neq ?fc1 ?fc2))
=>
(retract ?f ?g)
(assert (FactorCerteza ?h ?r (combinacion ?fc1 ?fc2)))
)


(defrule combinar_signo
(declare (salience 2))
(FactorCerteza ?h si ?fc1)
(FactorCerteza ?h no ?fc2)
(Problema ?h)
=>
(assert (Certeza ?h (- ?fc1 ?fc2)))
)

(defrule obtener_certeza
(declare (salience -1))
(FactorCerteza ?h ? ?fc)
(Problema ?h)
=>
(assert (Certeza ?h ?fc))
)


(defrule eliminar_evidencias_con_menor_certeza
(Certeza ?h1 ?fc1)
?X <- (Certeza ?h2 ?fc2)
(test (neq ?h1 ?h2))
(test (< ?fc2 ?fc1))
=>
(retract ?X)
)

(deffacts NombreProblemas
    (NombreProblema problema_starter "un problema en el starter")
    (NombreProblema problema_bujias "un problema en la bujias")
    (NombreProblema problema_bateria "un problema en la bateria")
    (NombreProblema motor_llega_gasolina "que llega gasolina al motor")
)

(defrule respuesta
(declare (salience -2))
(Certeza ?h ?fc)
(NombreProblema ?h ?nombre)
=>
(printout t "La hipotesis mas probable es " ?nombre)
(printout t crlf)
(assert (Explicar ?h))
)

(deffacts Causas
    (Causas problema_bujias motor_llega_gasolina)
)

(defrule obtener_causas
(Explicar ?h)
(Causas ?h $?causas)
=>
(loop-for-count (?i 1 (length ?causas))
    (assert (Explicar (nth$ ?i ?causas)))
)
)


(defrule dar_explicaciones
(Explicar ?h)
(explicacion ?h ?expl)
=>
(printout t ?expl)
(printout t crlf)
)
