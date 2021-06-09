;;;;;;; INDICAR SI UN ANIMAL VUELA O NO ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(deffacts Hechos_iniciales
    (ave gorrion)
    (ave paloma)
    (ave aguila)
    (ave pinguino)
    (mamifero vaca)
    (mamifero perro)
    (mamifero caballo)
    (vuela pinguino no seguro)
)


(defrule aves_son_animales
(ave ?x)
=>
(assert (animal ?x))
(bind ?expl (str-cat "Sabemos que un " ?x " es un animal porque las aves son un tipo de animal"))
(assert (explicacion animal ?x ?expl))
)

(defrule mamiferos_son_animales
(mamifero ?x)
=>
(assert (animal ?x))
(bind ?expl (str-cat "Sabemos que un " ?x " es un animal porque los mamiferos son un tipo de animal"))
(assert (explicacion animal ?x ?expl))
)


(defrule ave_vuela_por_defecto
(declare (salience -1))
(ave ?x)
=>
(assert (vuela ?x si por_defecto))
(bind ?expl (str-cat "Asumo que un " ?x " vuela, porque casi todas las aves vuelan"))
(assert (explicacion vuela ?x ?expl))
)


(defrule retracta_vuela_por_defecto
(declare (salience 1))
?f <- (vuela ?x ?r por_defecto)
(vuela ?x ?s seguro)
=>
(retract ?f)
(bind ?expl (str-cat "Retractamos que un " ?x " " ?r " vuela por defecto, porque sabemos que " ?x " " ?s " vuela"))
(assert (explicacion retracta_vuela ?x ?expl))
)


(defrule mayor_parte_animales_no_vuela
(declare (salience -2))
(animal ?x)
(not (vuela ?x ? ?))
=>
(assert (vuela ?x no por_defecto))
(bind ?expl (str-cat "Asumo que " ?x " no vuela, porque la mayor parte de los animales no vuelan"))
(assert (explicacion vuela ?x ?expl))
)


(defrule pregunta_1
=>
(printout t "Sobre que animal esta interado en obtener informacion? ")
(bind ?respuesta (read))
(bind ?respuesta (lowcase ?respuesta))
(assert (pregunta 1 ?respuesta))
)

(defrule respuesta_1
(declare (salience -3))
(pregunta 1 ?respuesta)
(animal ?respuesta)
(explicacion ? ?respuesta ?expl)
=>
(printout t ?expl)
(printout t crlf)
)

(defrule animal_desconocido
?X <- (pregunta 1 ?animal)
(not (exists (animal ?animal)))
=>
(assert (pregunta 2))
(retract ?X)
)

(defrule pregunta_2
?X <- (pregunta 2)
=>
(printout t "El animal que has indicado es un mamifero o un ave? ")
(bind ?respuesta (read))
(bind ?respuesta (lowcase ?respuesta))
(if (eq ?respuesta mamifero) then
    (assert (mamifero animal_desconocido))
else (if (eq ?respuesta ave) then
        (assert (ave animal_desconocido))
    else (if (eq ?respuesta nsnc) then
            (assert (animal animal_desconocido))
        else (assert (volver_a_preguntar))
        )
    )
)
(retract ?X)
)

(defrule volver_a_preguntar_2
?X <- (volver_a_preguntar)
=>
(printout t "La respuesta a la pregunta no es correcta. ")
(assert (pregunta 2))
(retract ?X)
)

(defrule respuesta_2
(declare (salience -3))
(explicacion ? animal_desconocido ?expl)
=>
(printout t ?expl)
(printout t crlf)
)