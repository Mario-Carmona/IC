;;;;;;; ASESORAR RAMA DE INGENIERIA INFORMATICA A UN ESTUDIANTE ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;; Hechos para representar las ramas

(deffacts Ramas
    (Rama Computación_y_Sistemas_Inteligentes)
    (Rama Ingeniería_del_Software)
    (Rama Ingeniería_de_Computadores)
    (Rama Sistemas_de_Información)
    (Rama Tecnologías_de_la_Información)
)


;;;;;;;;;;; Características a usar en el asesoramiento

;; El sistema utiliza las siguientes características:
;;
;; - Calificación media obtenida, tomando valores de Alta, Media
;;   ó Baja, y se representa por (Calificacion_media Alta|Media|Baja)
;;
;; - Es trabajador, tomando valores de Poco, Normal ó Mucho, y se
;;   representa por (Trabajador Poco|Normal|Mucho)
;;
;; - Le gustan las matemáticas, tomando valores de Si ó No, y se
;;   representa por (Matematicas Si|No)
;;
;; - Le gusta hardware, tomando valores de Si ó No, y se representa
;;   por (Hardware Si|No)
;;
;; - Le gusta programar, tomando valores de Si ó No, y se representa
;;   por (Programar Si|No)
;;
;; - En que ámbito quiere trabajar, tomando valores de Docencia, Empresa pública
;;   ó Empresa privada, y se presenta por (Ambito_trabajo Docencia|EmpresaPública|
;;   EmpresaPrivada)
;;
;; - En que lugar quiere trabajar, tomando valores de España ó Extranjero,
;;   y se representa por (Lugar_trabajo España|Extranjero)
;;
;; - Prefiere asignaturas teóricas o prácticas, tomando valores de
;;   Teóricas, Prácticas ó Ambas, y se representa por
;;   (Asignaturas Teóricas|Prácticas|Ambas)
;;
;; - Nivel de abstración, tomando valores de Bajo, Medio ó Alto, y
;;   se representa por (Nivel_abstraccion Alto|Medio|Bajo)


;;;;;;;;;;; Sugerencias

(deffacts Sugerencias
    (Sugerencia 1 Ambito_trabajo Docencia)
    (Sugerencia 1 Asignaturas Teoricas)
    (Sugerencia 1 Matematicas Si)
    (Sugerencia 1 Calificacion_media Alta)
    (Sugerencia 1 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 2 Ambito_trabajo Docencia)
    (Sugerencia 2 Asignaturas Teoricas)
    (Sugerencia 2 Matematicas Si)
    (Sugerencia 2 Calificacion_media Media)
    (Sugerencia 2 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 3 Ambito_trabajo Docencia)
    (Sugerencia 3 Asignaturas Teoricas)
    (Sugerencia 3 Matematicas Si)
    (Sugerencia 3 Calificacion_media Baja)
    (Sugerencia 3 Nivel_abstraccion Alto)
    (Sugerencia 3 Trabajador Mucho)
    (Sugerencia 3 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 4 Ambito_trabajo Docencia)
    (Sugerencia 4 Asignaturas Teoricas)
    (Sugerencia 4 Matematicas No)
    (Sugerencia 4 Hardware Si)
    (Sugerencia 4 Trabajador Mucho)
    (Sugerencia 4 Rama Ingeniería_de_Computadores)
    
    (Sugerencia 5 Ambito_trabajo Docencia)
    (Sugerencia 5 Asignaturas Teoricas)
    (Sugerencia 5 Matematicas No)
    (Sugerencia 5 Hardware No)
    (Sugerencia 5 Nivel_abstraccion Alto)
    (Sugerencia 5 Rama Sistemas_de_Información)
    
    (Sugerencia 6 Ambito_trabajo Docencia)
    (Sugerencia 6 Asignaturas Teoricas)
    (Sugerencia 6 Matematicas No)
    (Sugerencia 6 Hardware No)
    (Sugerencia 6 Nivel_abstraccion Medio)
    (Sugerencia 6 Rama Sistemas_de_Información)
    
    (Sugerencia 7 Ambito_trabajo Docencia)
    (Sugerencia 7 Asignaturas Teoricas)
    (Sugerencia 7 Matematicas No)
    (Sugerencia 7 Hardware No)
    (Sugerencia 7 Nivel_abstraccion Bajo)
    (Sugerencia 7 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 8 Ambito_trabajo Docencia)
    (Sugerencia 8 Asignaturas Practicas)
    (Sugerencia 8 Programar Si)
    (Sugerencia 8 Calificacion_media Alta)
    (Sugerencia 8 Rama Ingeniería_del_Software)
    
    (Sugerencia 9 Ambito_trabajo Docencia)
    (Sugerencia 9 Asignaturas Practicas)
    (Sugerencia 9 Programar Si)
    (Sugerencia 9 Calificacion_media Media)
    (Sugerencia 9 Rama Ingeniería_del_Software)
    
    (Sugerencia 10 Ambito_trabajo Docencia)
    (Sugerencia 10 Asignaturas Practicas)
    (Sugerencia 10 Programar Si)
    (Sugerencia 10 Calificacion_media Baja)
    (Sugerencia 10 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 11 Ambito_trabajo Docencia)
    (Sugerencia 11 Asignaturas Practicas)
    (Sugerencia 11 Programar No)
    (Sugerencia 11 Nivel_abstraccion Alto)
    (Sugerencia 11 Rama Sistemas_de_Información)
    
    (Sugerencia 12 Ambito_trabajo Docencia)
    (Sugerencia 12 Asignaturas Practicas)
    (Sugerencia 12 Programar No)
    (Sugerencia 12 Nivel_abstraccion Medio)
    (Sugerencia 12 Rama Sistemas_de_Información)
    
    (Sugerencia 13 Ambito_trabajo Docencia)
    (Sugerencia 13 Asignaturas Practicas)
    (Sugerencia 13 Programar No)
    (Sugerencia 13 Nivel_abstraccion Bajo)
    (Sugerencia 13 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 14 Ambito_trabajo Empresa_publica)
    (Sugerencia 14 Programar Si)
    (Sugerencia 14 Calificacion_media Alta)
    (Sugerencia 14 Rama Ingeniería_del_Software)
    
    (Sugerencia 15 Ambito_trabajo Empresa_publica)
    (Sugerencia 15 Programar Si)
    (Sugerencia 15 Calificacion_media Media)
    (Sugerencia 15 Rama Ingeniería_del_Software)

    (Sugerencia 16 Ambito_trabajo Empresa_publica)
    (Sugerencia 16 Programar Si)
    (Sugerencia 16 Calificacion_media Baja)
    (Sugerencia 16 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 17 Ambito_trabajo Empresa_publica)
    (Sugerencia 17 Programar No)
    (Sugerencia 17 Nivel_abstraccion Alto)
    (Sugerencia 17 Rama Sistemas_de_Información)
    
    (Sugerencia 18 Ambito_trabajo Empresa_publica)
    (Sugerencia 18 Programar No)
    (Sugerencia 18 Nivel_abstraccion Medio)
    (Sugerencia 18 Rama Sistemas_de_Información)
    
    (Sugerencia 19 Ambito_trabajo Empresa_publica)
    (Sugerencia 19 Programar No)
    (Sugerencia 19 Nivel_abstraccion Bajo)
    (Sugerencia 19 Hardware Si)
    (Sugerencia 19 Rama Ingeniería_de_Computadores)
    
    (Sugerencia 20 Ambito_trabajo Empresa_publica)
    (Sugerencia 20 Programar No)
    (Sugerencia 20 Nivel_abstraccion Bajo)
    (Sugerencia 20 Hardware No)
    (Sugerencia 20 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 21 Ambito_trabajo Empresa_privada)
    (Sugerencia 21 Lugar_trabajo España)
    (Sugerencia 21 Programar Si)
    (Sugerencia 21 Calificacion_media Alta)
    (Sugerencia 21 Rama Ingeniería_del_Software)
    
    (Sugerencia 22 Ambito_trabajo Empresa_privada)
    (Sugerencia 22 Lugar_trabajo España)
    (Sugerencia 22 Programar Si)
    (Sugerencia 22 Calificacion_media Media)
    (Sugerencia 22 Rama Ingeniería_del_Software)
    
    (Sugerencia 23 Ambito_trabajo Empresa_privada)
    (Sugerencia 23 Lugar_trabajo España)
    (Sugerencia 23 Programar Si)
    (Sugerencia 23 Calificacion_media Baja)
    (Sugerencia 23 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 24 Ambito_trabajo Empresa_privada)
    (Sugerencia 24 Lugar_trabajo España)
    (Sugerencia 24 Programar No)
    (Sugerencia 24 Rama Sistemas_de_Información)
    
    (Sugerencia 25 Ambito_trabajo Empresa_privada)
    (Sugerencia 25 Lugar_trabajo Extranjero)
    (Sugerencia 25 Matematicas Si)
    (Sugerencia 25 Nivel_abstraccion Alto)
    (Sugerencia 25 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 26 Ambito_trabajo Empresa_privada)
    (Sugerencia 26 Lugar_trabajo Extranjero)
    (Sugerencia 26 Matematicas Si)
    (Sugerencia 26 Nivel_abstraccion Medio)
    (Sugerencia 26 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 27 Ambito_trabajo Empresa_privada)
    (Sugerencia 27 Lugar_trabajo Extranjero)
    (Sugerencia 27 Matematicas Si)
    (Sugerencia 27 Nivel_abstraccion Bajo)
    (Sugerencia 27 Rama Ingeniería_del_Software)
    
    (Sugerencia 28 Ambito_trabajo Empresa_privada)
    (Sugerencia 28 Lugar_trabajo Extranjero)
    (Sugerencia 28 Matematicas No)
    (Sugerencia 28 Nivel_abstraccion Alto)
    (Sugerencia 28 Rama Sistemas_de_Información)
    
    (Sugerencia 29 Ambito_trabajo Empresa_privada)
    (Sugerencia 29 Lugar_trabajo Extranjero)
    (Sugerencia 29 Matematicas No)
    (Sugerencia 29 Nivel_abstraccion Medio)
    (Sugerencia 29 Rama Sistemas_de_Información)
    
    (Sugerencia 30 Ambito_trabajo Empresa_privada)
    (Sugerencia 30 Lugar_trabajo Extranjero)
    (Sugerencia 30 Matematicas No)
    (Sugerencia 30 Nivel_abstraccion Bajo)
    (Sugerencia 30 Rama Ingeniería_del_Software)
)

(defrule aniadir_contador
(declare (salience 1))
(Sugerencia ?id $?)
(not (Sugerencia ?id Contador ?num))
=>
(assert (Sugerencia ?id Contador 0))
)

(defrule aniadir_necesario
(declare (salience 1))
(Sugerencia ?id $?)
(not (Sugerencia ?id Necesario ?num))
=>
(assert (Sugerencia ?id Necesario 0))
)

(defrule aumentar_necesario
(declare (salience 1))
(Sugerencia ?id ?caracteristica ?valor)
(test (neq ?caracteristica Rama))
=>
(assert (IncreNecesario ?id))
)

(defrule incremento_necesario
(declare (salience 1))
?X <- (IncreNecesario ?id)
?Y <- (Sugerencia ?id Necesario ?num)
=>
(retract ?X ?Y)
(assert (Sugerencia ?id Necesario (+ ?num 1)))
)


;;;;;;;;;;; Retractar sugerencia


(defrule retractar_sugerencia
(declare (salience 9999))
?X <- (Sugerencia ?id ?nombre ?valorSuge)
(test (neq ?nombre Rama))
(Caracteristica ?nombre ?valor)
(test (neq ?valor Ambas))
(test (and (neq ?valorSuge ?valor) (neq ?valor nil)))
(Sugerencia ?id Rama ?rama)
?Y <- (Rechazo ?rama $?motivos)
=>
(assert (Rechazo ?rama ?motivos ?nombre ?valor))
(retract ?X ?Y)
)


;;;;;;;;;;; Hechos de la siguiente pregunta

;; Para indicar la siguiente pregunta que se debe realizar en base a las sugerencias
;; que siguen activas, y a las respuestas recibidas de preguntas anteriores.
;; Este hecho se representa por (SiguientePregunta Característica).
;;
;; Al realizar una pregunta se añaden los hechos de las preguntas que van después
;; de la pregunta actual en todas las reglas.
;;
;; Se añade la pregunta inicial para iniciar la conversación.

(deffacts Pregunta_inicial
(Pregunta Ambito_trabajo)
)


;;;;;;;;;;; Reglas de las preguntas

(deffacts Rangos_discretos
(Rango Calificacion_media Alta Media Baja)
(Rango Trabajador Mucho Normal Poco)
(Rango Matematicas Si No)
(Rango Hardware Si No)
(Rango Programar Si No)
(Rango Ambito_trabajo Docencia Empresa_publica Empresa_privada)
(Rango Lugar_trabajo España Extranjero)
(Rango Asignaturas Teoricas Practicas Ambas)
)

(deffacts Rangos_numericos
(RangoNumerico Calificacion_media 5 10)
)


(deftemplate SiguientePregunta
    (field Caracteristica (default ?NONE))
    (field Valor (default ?NONE))
    (multifield Requisitos)
    (multifield Siguientes)
)

(deffacts SiguientesPreguntas
    (SiguientePregunta
        (Caracteristica Ambito_trabajo)
        (Valor Docencia)
        (Requisitos)
        (Siguientes Asignaturas))
    (SiguientePregunta
        (Caracteristica Ambito_trabajo)
        (Valor Empresa_publica)
        (Requisitos)
        (Siguientes Programar))
    (SiguientePregunta
        (Caracteristica Ambito_trabajo)
        (Valor Empresa_privada)
        (Requisitos)
        (Siguientes Lugar_trabajo))
    (SiguientePregunta
        (Caracteristica Asignaturas)
        (Valor Teoricas)
        (Requisitos Ambito_trabajo)
        (Siguientes Matematicas))
    (SiguientePregunta
        (Caracteristica Asignaturas)
        (Valor Practicas)
        (Requisitos Ambito_trabajo)
        (Siguientes Programar))
    (SiguientePregunta
        (Caracteristica Asignaturas)
        (Valor Ambas)
        (Requisitos Ambito_trabajo)
        (Siguientes Matematicas Programar))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor Si)
        (Requisitos Asignaturas)
        (Siguientes Calificacion_media))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor No)
        (Requisitos Asignaturas)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor Si)
        (Requisitos Ambito_trabajo)
        (Siguientes Calificacion_media))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor No)
        (Requisitos Ambito_trabajo)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor Si)
        (Requisitos Lugar_trabajo)
        (Siguientes Calificacion_media))
    (SiguientePregunta
        (Caracteristica Matematicas)
        (Valor Si)
        (Requisitos Asignaturas)
        (Siguientes Calificacion_media))
    (SiguientePregunta
        (Caracteristica Matematicas)
        (Valor No)
        (Requisitos Asignaturas)
        (Siguientes Hardware))
    (SiguientePregunta
        (Caracteristica Matematicas)
        (Valor Si)
        (Requisitos Lugar_trabajo)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Matematicas)
        (Valor No)
        (Requisitos Lugar_trabajo)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Calificacion_media)
        (Valor Baja)
        (Requisitos Matematicas)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Nivel_abstraccion)
        (Valor Alto)
        (Requisitos Calificacion_media)
        (Siguientes Trabajador))
    (SiguientePregunta
        (Caracteristica Nivel_abstraccion)
        (Valor Medio)
        (Requisitos Calificacion_media)
        (Siguientes Hardware))
    (SiguientePregunta
        (Caracteristica Nivel_abstraccion)
        (Valor Bajo)
        (Requisitos Calificacion_media)
        (Siguientes Hardware))
    (SiguientePregunta
        (Caracteristica Nivel_abstraccion)
        (Valor Bajo)
        (Requisitos Programar)
        (Siguientes Hardware))
    (SiguientePregunta
        (Caracteristica Trabajador)
        (Valor Normal)
        (Requisitos Nivel_abstraccion)
        (Siguientes Hardware))
    (SiguientePregunta
        (Caracteristica Trabajador)
        (Valor Poco)
        (Requisitos Nivel_abstraccion)
        (Siguientes Hardware))
    (SiguientePregunta
        (Caracteristica Trabajador)
        (Valor Normal)
        (Requisitos Hardware)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Trabajador)
        (Valor Poco)
        (Requisitos Hardware)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Hardware)
        (Valor Si)
        (Requisitos Matematicas)
        (Siguientes Trabajador))
    (SiguientePregunta
        (Caracteristica Hardware)
        (Valor No)
        (Requisitos Matematicas)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Lugar_trabajo)
        (Valor España)
        (Requisitos Ambito_trabajo)
        (Siguientes Programar))
    (SiguientePregunta
        (Caracteristica Lugar_trabajo)
        (Valor Extrajero)
        (Requisitos Ambito_trabajo)
        (Siguientes Matematicas))
)

(deffacts Frases
    (Frase Inicio "En primer lugar" "Bien vamos a comenzar")
    (Frase Resto "Ya que" "Como")
    (Frase Calificacion_media Alta "tu calificacion media es alta")
    (Frase Calificacion_media Media "tu calificacion media es media")
    (Frase Calificacion_media Baja "tu calificacion media es baja")
    (Frase Trabajador Mucho "tu esfuerzo trabajando es mucho")
    (Frase Trabajador Normal "tu esfuerzo trabajando es normal")
    (Frase Trabajador Poco "tu esfuerzo trabajando es poco")
    (Frase Matematicas Si "te gustan las matemáticas")
    (Frase Matematicas No "no te gustan las matemáticas")
    (Frase Programar Si "te gusta programar")
    (Frase Programar No "no te gusta programar")
    (Frase Hardware Si "te gusta el hardware")
    (Frase Hardware No "no te gusta el hardware")
    (Frase Ambito_trabajo Docencia "el ambito en el que quieres trabajar es la docencia")
    (Frase Ambito_trabajo Empresa_publica "el ambito en el que quieres trabajar es la empresa publica")
    (Frase Ambito_trabajo Empresa_privada "el ambito en el que quieres trabajar es la empresa privada")
    (Frase Lugar_trabajo España "el lugar donde quieres trabajar es España")
    (Frase Lugar_trabajo Extranjero "el lugar donde quieres trabajar es en el extranjero")
    (Frase Asignaturas Practicas "prefieres las asignaturas practicas")
    (Frase Asignaturas Teoricas "prefieres las asignaturas teoricas")
    (Frase Asignaturas Ambas "te gustan tanto las asignaturas teoricas como practicas")
    (Frase Nivel_abstraccion Alto "tu nivel de abstraccion es alto")
    (Frase Nivel_abstraccion Medio "tu nivel de abstraccion es medio")
    (Frase Nivel_abstraccion Bajo "tu nivel de abstraccion es bajo")
)

(deffacts Preguntas
    (FrasePregunta Calificacion_media "¿que nota media tienes?")
    (FrasePregunta Trabajador "¿me puedes decir como de trabajador eres (Mucho, Normal o Poco)?")
    (FrasePregunta Matematicas "¿me puedes decir si te gustan las matematicas (Si o No)?")
    (FrasePregunta Programar "¿me puedes decir si te gusta programar (Si o No)?")
    (FrasePregunta Hardware "¿me puedes decir si te gusta el hardware (Si o No)?")
    (FrasePregunta Ambito_trabajo "¿en que ambito del trabajo te gustaria trabajar (Docencia, Empresa publica o Empresa privada)?")
    (FrasePregunta Lugar_trabajo "¿en que lugar te gustaria trabajar (España o Extrajero)?")
    (FrasePregunta Asignaturas "¿que tipo de asignaturas prefieres (Teoricas, Practicas, Ambas)?")
    (FrasePregunta Nivel_abstraccion "¿que nivel de abstraccion tienes (Alto, Medio o Bajo)?")
)


(deffunction obtenerFrasePreguntaResto(?resto_frase1 ?resto_frase2 $?frases)
    (bind ?frase (nth$ (random 1 (length$ ?frases)) ?frases))
    (bind ?frase (str-cat ?frase " " ?resto_frase1 ", " ?resto_frase2 " "))

    (printout t ?frase)
)

(deffunction obtenerFrasePreguntaInicio(?resto_frase $?frases)
    (bind ?frase (nth$ (random 1 (length$ ?frases)) ?frases))
    (bind ?frase (str-cat ?frase ", " ?resto_frase " "))

    (printout t ?frase)
)

(defrule pregunta_resto
?X <- (Pregunta ?caracteristica)
(AnteriorPregunta ?nombre)
(Caracteristica ?nombre ?valor)
(Frase Resto $?frases)
(Frase ?caracteristica ?valor ?restoFrase1)
(FrasePregunta ?caracteristica ?restoFrase2)
=>
(obtenerFrasePreguntaResto ?restoFrase1 ?restoFrase2 ?frases)
(bind ?mensaje (read))
(retract ?X)
(assert (Respuesta ?caracteristica ?mensaje))
)

(defrule pregunta_inicio
?X <- (Pregunta ?caracteristica)
(not (AnteriorPregunta ?nombre))
(Frase Inicio $?frases)
(FrasePregunta ?caracteristica ?restoFrase)
=>
(obtenerFrasePreguntaInicio ?restoFrase ?frases)
(bind ?mensaje (read))
(retract ?X)
(assert (Respuesta ?caracteristica ?mensaje))
)




(deffunction obtenerValorCaracNoNumerico (?caracteristica $?rango_valores $?mensaje)
    (bind ?valor nil)
    (if (neq (length$ ?mensaje) 0)
        (progn$ (?palabra ?mensaje)
            (bind ?salida (perteneceAlRango(?palabra ?rango_valores)))
            (if (neq ?salida nil)
            then
                (bind ?valor ?salida)
            )
        )
    )
    
    (assert (Caracteristica ?caracteristica ?valor))
)


(deffunction obtenerValorCaracNumerico (?caracteristica ?min ?max $?mensaje)
    (bind ?valor nil)
    (if (neq (length$ ?mensaje) 0)
        (progn$ (?palabra ?mensaje)
            (bind ?salida (perteneceAlRangoNumerico(?palabra ?min ?max)))
            (if (neq ?salida nil)
            then
                (bind ?valor ?salida)
                (bind ?valor (obtenerValorCaracNume(?caracteristica ?valor)))
            )
        )
    )
    
    (assert (Caracteristica ?caracteristica ?valor))
)



(defrule respuesta_rango_numerico
(declare (salience 1))
(Respuesta ?caracteristica ?mensaje)
(RangoNumerico ?caracteristica ?min ?max)
=>
(obtenerValorCaracNumerico ?caracteristica ?min ?max ?mensaje)
)


(defrule respuesta_rango_no_numerico
(declare (salience 1))
(Respuesta ?caracteristica ?mensaje)
(not (RangoNumerico ?caracteristica ?min ?max))
(Rango ?caracteristica $?rango_valores)
=>
(obtenerValorCaracNoNumerico ?caracteristica ?rango_valores ?mensaje)
)






(deffunction perteneceAlRango (?palabra $?rango_valores)
    (bind ?salida nil)
    (progn$ (?valor ?rango_valores)
        (if (eq (lowcase ?palabra) (lowcase ?valor))
        then (bind ?salida ?valor)
        )
    )

    ?salida
)

(deffunction perteneceAlRangoNumerico (?palabra ?min ?max)
    (bind ?salida nil)
    (if (and (<= ?min ?palabra) (<= ?palabra ?max))
    then (bind ?salida ?palabra)
    )

    ?salida
)

(deffunction obtenerValorCaracNume (?caracteristica ?valor)
    (switch ?caracteristica
        (case Calificacion_media then
            (if (and (<= 5 ?valor) (< ?valor 7))
            then
                return Baja
            else (if (and (<= 7 ?num) (< ?num 9))
            then
                return Media
            else
                return Alta
            ) )
        )
    )
)




(defrule siguientes_preguntas
(declare (salience 1))
?X <- (Respuesta ?caracteristica ?)
(Caracteristica ?caracteristica ?valor)
=>
(retract ?X)
(lanzarSiguientesPreguntas ?caracteristica ?valor)
(if (exists (AnteriorPregunta ?nombre))
then (retract (AnteriorPregunta ?nombre))
)
(assert (AnteriorPregunta ?caracteristica))
)

(deffunction lanzarSiguientesPreguntas (?caracteristica ?valor)
    (bind ?terminar FALSE)
    (while (eq ?terminar FALSE) do
        (SiguientePregunta (Caracteristica ?caracteristica) (Valor ?valor) (Requisitos $?requisitos) (Siguientes ?siguientes))
        (lanzarSiguiente (?caracteristica ?valor ?requisitos ?siguientes))
    )
)

(deffunction lanzarSiguiente (?caracteristica ?valor $?requisitos $?siguientes)
    (AnteriorPregunta ?anterior)
    (if (member ?anterior ?requisitos)
    then 
        (progn$ (?siguiente ?siguientes)
            (assert (Pregunta ?siguiente))
        )
    )

    return TRUE
)



;;;;;;;;;;; Terminar dedución

(defrule terminar_deducion
(declare (salience 1))
(Sugerencia ?id Contador ?num1)
(Sugerencia ?id Necesario ?num2)
(test (eq ?num1 ?num2))
=>
(borrar_hechos_pregunta)
(assert Elegido ?id)
)

(defrule borrar_preguntas
(declare (salience 9999))
(borrar_hechos_pregunta)
?X <- (Pregunta ?)
=>
(retract ?X)
)

(defrule terminar_borrar_preguntas
(declare (salience 9999))
(not (Pregunta ?))
?X <- (borrar_hechos_pregunta)
=>
(retract ?X)
)

(defrule obtener_motivos_aceptacion
(declare (salience 1))
?elegido <- (Elegido ?id $?motivos)
?X <- (Sugerencia ?id ?nombre ?valor)
(test (neq ?nombre Rama))
=>
(retract ?X)
(insert$ ?elegido (+ (length$ ?rechazo) 1) (?nombre ?valor))
)

(defrule mostrar_sugerencia
(Elegido ?id $?motivos)
(Sugerencia ?id Rama ?rama)
(bind ?mensaje (aceptar_rama (?rama ?motivos)))
=>
(printout t ?mensaje)
)

(deffunction aceptar_rama (?rama $?motivos)
    (bind ?mensaje (str-cat "Te sugiero que eligas la rama " (obtener_nombre_rama(?rama)) " " (obtener_mensaje_motivos(?motivos))))

    return ?mensaje
)


;;;;;;;;;;; Retractar pregunta realizada anteriormente

(defrule retractar_pregunta
(declare (salience 9999))
?X <- (SiguientePregunta (Caracteristica ?nombre))
(Caracteristica ?nombre ?valor)
=>
(retract ?X)
)


;;;;;;;;;;; Retractar rama

(defrule crear_hechos_rechazo
(declare (salience 9999))
(Rama ?rama)
(not (Rechazo ?rama $?))
=>
(assert (Rechazo ?rama))
)


(defrule retractar_rama
(declare (salience 9999))
(Rechazo ?rama $?motivos)
(not (Sugerencia ?id Rama ?rama))
(bind ?mensaje (rechazar_rama(?rama ?motivos)))
=>
(printout t ?mensaje)
)

(deffunction obtener_nombre_rama (?rama)
    (switch ?rama
        (case Computación_y_Sistemas_Inteligentes then 
            return "Computacion y Sistemas Inteligentes"
        )
        (case Ingeniería_del_Software then 
            return "Ingenieria del Software"
        )
        (case Ingeniería_de_Computadores then 
            return "Ingenieria de Computadores"
        )
        (case Sistemas_de_Información then 
            return "Sistemas de Informacion"
        )
        (case Tecnologías_de_la_Información then 
            return "Tecnologias de la Informacion"
        )
    )
)

(deffunction rechazar_rama (?rama $?motivos)
    (bind ?mensaje (str-cat "La rama " (obtener_nombre_rama(?rama)) " ha sido rechazada " (obtener_mensaje_motivos(?motivos))))

    return ?mensaje
)

(deffunction obtener_frase_rechazo (?caracteristica ?valor)
    (Frase ?caracteristica ?valor ?frase)
    return ?frase
)

(deffunction obtener_mensaje_motivos ($?motivos)
    (bind ?mensaje "porque ")
    (bind ?tam (length$ ?motivos))
    (bind ?i 1)
    (while (< i (- ?tam 2)) do
        (bind ?mensaje (str-cat ?mensaje (obtener_frase_rechazo(?caracteristica ?valor)) ", "))
        (bind ?i (+ ?i 2))
    )

    (if (eq ?mensaje "porque ")
    then
        (bind ?mensaje (str-cat ?mensaje (obtener_frase_rechazo(?caracteristica ?valor))))
    else
        (bind ?mensaje (str-cat ?mensaje "y " (obtener_frase_rechazo(?caracteristica ?valor))))
    )

    return ?mensaje
)