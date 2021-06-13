;;;;;;; ASESORAR RAMA DE INGENIERIA INFORMATICA A UN ESTUDIANTE ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule iniciarProceso
(initial-fact)
=>
(focus ModuloEleccionModo)
)


;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

(defmodule ModuloEleccionModo)

(deffacts ModuloEleccionModo::HechosIniciales
    (PreguntarModo)
)

(defrule ModuloEleccionModo::eleccionModo
?X <- (PreguntarModo)
=>
(printout t "Que modo del SBC quieres utilizar (1: Asesorar, 2: Aconsejar, 3: Mostrar info): ")
(bind ?respuesta (read))
(if (eq ?respuesta 1)
    then
        (assert (Modo Asesorar))
    else
        (if (eq ?respuesta 2)
        then
            (assert (Modo Aconsejar))
        else
            (if (eq ?respuesta 3)
            then
                (assert (MostrarInfo))
            else
                (assert (volver_a_preguntar))
            )
        )
)
(retract ?X)
)

(defrule ModuloEleccionModo::mostrarInfo
?X <- (MostrarInfo)
=>
(printout t "Info:")
(printout t crlf)
(printout t "  - Asesorar consiste en obtener sugerencias sobre que rama escoger en base a unas preguntas.")
(printout t crlf)
(printout t "  - Aconsejar consiste en obtener un consejo sobre que rama elegir entre dos que sugiere el usuario.")
(printout t crlf)
(assert (PreguntarModo))
(retract ?X)
)

(defrule ModuloEleccionModo::volverAPregunta
?X <- (volver_a_preguntar)
=>
(printout t "La respuesta no es correcta vuelva a responder.")
(assert (PreguntarModo))
(retract ?X)
)

(defrule ModuloEleccionModo::siguienteModulo
(Modo ?modo)
=>
(if (eq ?modo Asesorar)
    then
        (focus ModuloPregunta)
    else
        (if (eq ?modo Aconsejar)
        then
            (focus ModuloPregunta)
        )
)
)


;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$




(defmodule ModuloPregunta 
    (export deftemplate Respuesta)
)

(deftemplate Respuesta
    (field caracteristica (default ?NONE))
    (field valor (default ?NONE))
)

(deffacts ModuloPregunta::HechosIniciales
    (Ultimo Ninguno)
    (Anterior Ninguno)
    (Pregunta Ambito_trabajo)
    (Pregunta Calificacion_media)
    (Pregunta Trabajador)
    (Pregunta Matematicas)
    (Pregunta Programar)
    (Pregunta Hardware)
    (Pregunta Lugar_trabajo)
    (Pregunta Asignaturas)
    (Pregunta Nivel_abstraccion)
)

;;;;;;;;;;;;;;;; Hechos para representar las frases utilizadas en la comunicación
;;;;;;;;;;;;;;;; con el estudiante

;; Estas frases son las introductorias a la pregunta. Se emprezará la introducción a la pregunta
;; de diferente manera dependiendo de si es la primera pregunta o no, y de el valor obtenido 
;; en la ultima pregunta

(deffacts ModuloPregunta::Frases
    (Frase Inicio "En primer lugar" "Bien vamos a comenzar")
    (Frase Resto "Ya que" "Como")
    (Frase Calificacion_media "Alta" "tu calificacion media es alta")
    (Frase Calificacion_media "Media" "tu calificacion media es media")
    (Frase Calificacion_media "Baja" "tu calificacion media es baja")
    (Frase Trabajador "Mucho" "tu esfuerzo trabajando es mucho")
    (Frase Trabajador "Normal" "tu esfuerzo trabajando es normal")
    (Frase Trabajador "Poco" "tu esfuerzo trabajando es poco")
    (Frase Matematicas "Si" "te gustan las matemáticas")
    (Frase Matematicas "No" "no te gustan las matemáticas")
    (Frase Programar "Si" "te gusta programar")
    (Frase Programar "No" "no te gusta programar")
    (Frase Hardware "Si" "te gusta el hardware")
    (Frase Hardware "No" "no te gusta el hardware")
    (Frase Ambito_trabajo "Docencia" "el ambito en el que quieres trabajar es la docencia")
    (Frase Ambito_trabajo "Empresa_publica" "el ambito en el que quieres trabajar es la empresa publica")
    (Frase Ambito_trabajo "Empresa_privada" "el ambito en el que quieres trabajar es la empresa privada")
    (Frase Lugar_trabajo "Espania" "el lugar donde quieres trabajar es España")
    (Frase Lugar_trabajo "Extranjero" "el lugar donde quieres trabajar es en el extranjero")
    (Frase Asignaturas "Practicas" "prefieres las asignaturas practicas")
    (Frase Asignaturas "Teoricas" "prefieres las asignaturas teoricas")
    (Frase Asignaturas "Ambas" "te gustan tanto las asignaturas teoricas como practicas")
    (Frase Nivel_abstraccion "Alto" "tu nivel de abstraccion es alto")
    (Frase Nivel_abstraccion "Medio" "tu nivel de abstraccion es medio")
    (Frase Nivel_abstraccion "Bajo" "tu nivel de abstraccion es bajo")
)

;; Estas frases son las preguntas de cada caractarística.

(deffacts ModuloPregunta::Preguntas
    (FrasePregunta Calificacion_media "que nota media tienes?")
    (FrasePregunta Trabajador "me puedes decir como de trabajador eres (Mucho, Normal, Poco o NSNC)?")
    (FrasePregunta Matematicas "me puedes decir si te gustan las matematicas (Si, No o NSNC)?")
    (FrasePregunta Programar "me puedes decir si te gusta programar (Si, No o NSNC)?")
    (FrasePregunta Hardware "me puedes decir si te gusta el hardware (Si, No o NSNC)?")
    (FrasePregunta Ambito_trabajo "en que ambito del trabajo te gustaria trabajar (Docencia, Empresa publica, Empresa privada o NSNC)?")
    (FrasePregunta Lugar_trabajo "en que lugar te gustaria trabajar (Espania, Extranjero o NSNC)?")
    (FrasePregunta Asignaturas "que tipo de asignaturas prefieres (Teoricas, Practicas, Ambas o NSNC)?")
    (FrasePregunta Nivel_abstraccion "que nivel de abstraccion tienes (Alto, Medio, Bajo o NSNC)?")
)



;;;;;;;;;;;;;;;; Preguntas

;;;;;;;;;;;;;;;; Reglas para obtener la frase de la primera pregunta

(deffunction ModuloPregunta::obtenerFrasePreguntaInicio(?intro $?frases)
    (bind ?frase (nth$ (random 1 (length$ ?frases)) ?frases))
    (bind ?frase (str-cat ?frase ", " ?intro " "))

    return ?frase
)

;;;;;;;;;;;;;;;; Función para obtener el valor discreto de una característica
;;;;;;;;;;;;;;;; a partir de su valor continuo

(deffunction ModuloPregunta::obtenerValorNumerico (?caracteristica ?valor)
    (switch ?caracteristica
        (case Calificacion_media then
            (if (and (<= 5 ?valor) (< ?valor 7))
            then
                return "Baja"
            else (if (and (<= 7 ?valor) (< ?valor 9))
            then
                return "Media"
            else
                return "Alta"
            ) )
        )
    )
)


;;;;;;;;;;;;;;;; Funciones para comprobar si el valor obtenido en la pregunta
;;;;;;;;;;;;;;;; es correcto respecto del rango continuo de la característica

(deffunction ModuloPregunta::perteneceAlRangoContinuo (?palabra ?min ?max)
    (bind ?salida nil)
    (if (and (<= ?min ?palabra) (<= ?palabra ?max))
    then (bind ?salida ?palabra)
    )

    ?salida
)

;; Primero se comprueba si está en su rango continuo, y si lo está se obtiene
;; el valor discreto a partir del valor continuo obtenido y se devuelve

(deffunction ModuloPregunta::obtenerValorDiscretoCarac (?caracteristica ?min ?max ?mensaje)
    (bind ?valor "Repetir")
    (if (eq (lowcase (str-cat ?mensaje)) "nsnc")
    then
        (bind ?valor "nil")
    else
        (bind ?salida (perteneceAlRangoContinuo ?mensaje ?min ?max))
        (if (neq ?salida nil)
        then
            (bind ?valor ?salida)
            (bind ?valor (obtenerValorNumerico ?caracteristica ?valor))
        )
    )
    
    return ?valor
)


;;;;;;;;;;;;;;;; Reglas para obtener la frase del resto de preguntas

(deffunction ModuloPregunta::obtenerFrasePreguntaResto(?intro ?pregunta $?frases)
    (bind ?frase (nth$ (random 1 (length$ ?frases)) ?frases))
    (bind ?frase (str-cat ?frase " " ?intro ", " ?pregunta " "))

    (printout t ?frase)
)


;;;;;;;;;;;;;;;; Función para comprobar si el valor obtenido en la pregunta
;;;;;;;;;;;;;;;; es correcto respecto del rango discreto de la característica

(deffunction ModuloPregunta::perteneceAlRangoDiscreto (?palabra $?rango)
    (bind ?valor "Repetir")
    (if (eq (lowcase ?palabra) "nsnc")
    then
        (bind ?valor "nil")
    else
        (bind ?i 1)
        (bind ?tam (length$ ?rango))
        (while (<= ?i ?tam) do
            (bind ?aux (nth$ ?i ?rango))
            (if (eq (lowcase ?aux) (lowcase ?palabra))
            then
                (bind ?valor ?aux)
                (bind ?i (+ ?tam 1))
            else
                (bind ?i (+ ?i 1))
            )
        )
    )

    return ?valor
)





;;;;;;;;;;;;;;;; Función para obtener la introducción a la frase en el caso 
;;;;;;;;;;;;;;;; de que se haya respodido de forma parcial a una pregunta, es
;;;;;;;;;;;;;;;; decir, ha respondido NSNC

(deffunction ModuloPregunta::obtener_nombre_caracteristica (?caracteristica)
    (switch ?caracteristica
        (case Ambito_trabajo then 
            return "no has sabido responder a la pregunta del ambito de trabajo"
        )
        (case Calificacion_media then 
            return "no has sabido responder a la pregunta de la nota media"
        )
        (case Nivel_abstraccion then 
            return "no has sabido responder a la pregunta del nivel de abstraccion"
        )
        (case Matematicas then 
            return "no has sabido responder a la pregunta del gusto a las matemeticas"
        )
        (case Hardware then 
            return "no has sabido responder a la pregunta del gusto al hardware"
        )
        (case Programar then 
            return "no has sabido responder a la pregunta del gusto a programar"
        )
        (case Asignaturas then 
            return "no has sabido responder a la pregunta de las asignaturas preferidas"
        )
        (case Lugar_trabajo then 
            return "no has sabido responder a la pregunta del lugar de trabajo"
        )
        (case Trabajador then 
            return "no has sabido responder a la pregunta de tu esfuerzo en el trabajo"
        )
    )
)

;;;;;;;;;;;;;;;; Hechos para representar los rangos discretos de las características

(deffacts ModuloPregunta::Rangos_discretos
(Rango Calificacion_media "Alta" "Media" "Baja")
(Rango Trabajador "Mucho" "Normal" "Poco")
(Rango Matematicas "Si" "No")
(Rango Hardware "Si" "No")
(Rango Programar "Si" "No")
(Rango Ambito_trabajo "Docencia" "Empresa_publica" "Empresa_privada")
(Rango Lugar_trabajo "Espania" "Extranjero")
(Rango Asignaturas "Teoricas" "Practicas" "Ambas")
(Rango Nivel_abstraccion "Alto" "Medio" "Bajo")
)

;;;;;;;;;;;;;;;; Hechos para representar los rangos continuos de las características
;;;;;;;;;;;;;;;; cuyo valor recibido por la entrada sea continuo

(deffacts ModuloPregunta::Rangos_numericos
(RangoNumerico Calificacion_media 5 10)
)

;; En el caso de ser la primera pregunta y ser sobre una característica de la que se
;; obtiene un valor continuo

(defrule ModuloPregunta::pregunta_inicio_continuo
(Anterior Ninguno)
?X <- (Pregunta ?caracteristica)
?Y <- (Ultimo ?)
(Frase Inicio $?frases)
(FrasePregunta ?caracteristica ?restoFrase)
(RangoNumerico ?caracteristica ?min ?max)
=>
(bind ?frase (obtenerFrasePreguntaInicio ?restoFrase ?frases))
(printout t ?frase)
(bind ?mensaje (read))
(bind ?valor (obtenerValorDiscretoCarac ?caracteristica ?min ?max ?mensaje))
(assert (Respuesta (caracteristica ?caracteristica)(valor ?valor)))
(assert (Ultimo ?caracteristica))
(retract ?X ?Y)
)

;; En el caso de ser la primera pregunta y ser sobre una característica de la que se
;; obtiene un valor discreto

(defrule ModuloPregunta::pregunta_inicio_discreto
(Anterior Ninguno)
?X <- (Pregunta ?caracteristica)
?Y <- (Ultimo ?)
(Frase Inicio $?frases)
(FrasePregunta ?caracteristica ?restoFrase)
(not (RangoNumerico ?caracteristica ? ?))
(Rango ?caracteristica $?rango)
=>
(bind ?frase (obtenerFrasePreguntaInicio ?restoFrase ?frases))
(printout t ?frase)
(bind ?mensaje (readline))
(bind ?valor (perteneceAlRangoDiscreto ?mensaje ?rango))
(assert (Respuesta (caracteristica ?caracteristica)(valor ?valor)))
(assert (Ultimo ?caracteristica))
(retract ?X ?Y)
)

;; En el caso de no ser la primera pregunta y ser sobre una característica de la que se
;; obtiene un valor continuo

;; Hay dos reglas, una para manejar los casos en que la pregunta del requisito de la pregunta
;; que vamos a realizar, fue respondida con NSNC

(defrule ModuloPregunta::pregunta_resto_continuo_nil
(Anterior ?nombre)
(test (neq ?nombre Ninguno))
?X <- (Pregunta ?caracteristica)
?Y <- (Ultimo ?)
(RangoNumerico ?caracteristica ?min ?max)
(Respuesta (caracteristica ?nombre)(valor "nil"))
(Frase Resto $?frases)
(FrasePregunta ?caracteristica ?restoFrase)
=>
(bind ?frase (obtenerFrasePreguntaResto (obtener_nombre_caracteristica ?nombre) ?restoFrase ?frases))
(printout t ?frase)
(bind ?mensaje (read))
(bind ?valor (obtenerValorDiscretoCarac ?caracteristica ?min ?max ?mensaje))
(assert (Respuesta (caracteristica ?caracteristica)(valor ?valor)))
(assert (Ultimo ?caracteristica))
(retract ?X ?Y)
)

(defrule ModuloPregunta::pregunta_resto_continuo
(Anterior ?nombre)
(test (neq ?nombre Ninguno))
?X <- (Pregunta ?caracteristica)
?Y <- (Ultimo ?)
(RangoNumerico ?caracteristica ?min ?max)
(Respuesta (caracteristica ?nombre)(valor ?valor))
(test (neq ?valor "nil"))
(Frase Resto $?frases)
(Frase ?nombre ?valor ?restoFrase1)
(FrasePregunta ?caracteristica ?restoFrase2)
=>
(bind ?frase (obtenerFrasePreguntaResto ?restoFrase1 ?restoFrase2 ?frases))
(printout t ?frase)
(bind ?mensaje (read))
(bind ?valor (obtenerValorDiscretoCarac ?caracteristica ?min ?max ?mensaje))
(assert (Respuesta (caracteristica ?caracteristica)(valor ?valor)))
(assert (Ultimo ?caracteristica))
(retract ?X ?Y)
)

;; En el caso de no ser la primera pregunta y ser sobre una característica de la que se
;; obtiene un valor discreto

;; Hay dos reglas, una para manejar los casos en que la pregunta del requisito de la pregunta
;; que vamos a realizar, fue respondida con NSNC

(defrule ModuloPregunta::pregunta_resto_discreto_nil
(Anterior ?nombre)
(test (neq ?nombre Ninguno))
?X <- (Pregunta ?caracteristica)
?Y <- (Ultimo ?)
(Respuesta (caracteristica ?nombre)(valor "nil"))
(Frase Resto $?frases)
(FrasePregunta ?caracteristica ?restoFrase)
(not (RangoNumerico ?caracteristica ? ?))
(Rango ?caracteristica $?rango)
=>
(bind ?frase (obtenerFrasePreguntaResto (obtener_nombre_caracteristica ?nombre) ?restoFrase ?frases))
(printout t ?frase)
(bind ?mensaje (readline))
(bind ?valor (perteneceAlRangoDiscreto ?mensaje ?rango))
(assert (Respuesta (caracteristica ?caracteristica)(valor ?valor)))
(assert (Ultimo ?caracteristica))
(retract ?X ?Y)
)

(defrule ModuloPregunta::pregunta_resto_discreto
(Anterior ?nombre)
(test (neq ?nombre Ninguno))
?X <- (Pregunta ?caracteristica)
?Y <- (Ultimo ?)
(Respuesta (caracteristica ?nombre)(valor ?valor))
(test (neq ?valor "nil"))
(Frase Resto $?frases)
(Frase ?nombre ?valor ?restoFrase1)
(FrasePregunta ?caracteristica ?restoFrase2)
(not (RangoNumerico ?caracteristica ? ?))
(Rango ?caracteristica $?rango)
=>
(bind ?frase (obtenerFrasePreguntaResto ?restoFrase1 ?restoFrase2 ?frases))
(printout t ?frase)
(bind ?mensaje (readline))
(bind ?valor (perteneceAlRangoDiscreto ?mensaje ?rango))
(assert (Respuesta (caracteristica ?caracteristica)(valor ?valor)))
(assert (Ultimo ?caracteristica))
(retract ?X ?Y)
)


;;;;;;;;;;;;;;;; Regla para volver a preguntar

;; Se vuelve a realizar la pregunta si el valor obtenido no está contenido
;; en el rango de la característica. El rango no se tiene en cuenta si se
;; responde NSNC.

(defrule ModuloPregunta::volver_a_preguntar
(declare (salience 9999))
?X <- (Respuesta (caracteristica ?caracteristica)(valor ?valor))
?Y <- (Ultimo ?ultimo)
(test (eq ?valor "Repetir"))
(Anterior ?anterior)
=>
(assert (Pregunta ?caracteristica))
(assert (Ultimo ?anterior))
(retract ?X ?Y)
)

(defrule gestionarRespuesta
(declare (salience 1))
?X <- (Anterior ?nombre)
(Ultimo ?carac)
(Respuesta (caracteristica ?caracteristica)(valor ?valor))
(test (neq ?nombre ?caracteristica))
(test (eq ?carac ?caracteristica))
=>
(assert (Anterior ?caracteristica))
(retract ?X)
)

(defrule ModuloPregunta::siguienteModulo
(not (exists (Pregunta ?)))
=>
(focus ModuloSBCMario)
)


;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

(defmodule ModuloSBCMario
    (import ModuloPregunta deftemplate Respuesta)
    (export deftemplate RecomendacionMario)
)

(deftemplate RecomendacionMario
    (field rama (default ?NONE))
    (field motivo (default ?NONE))
)

(defrule ModuloSBCMario::recibirRespuesta
(declare (salience 2))
(Respuesta (caracteristica ?caracteristica)(valor ?valor))
=>
(assert (Caracteristica ?caracteristica ?valor))
)


;;;;;;;;;;;;;;;; Hechos para representar las ramas a sugerir

(deffacts ModuloSBCMario::Ramas
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
;;   ó Baja, y se representa por (Caracteristica Calificacion_media Alta|Media|Baja)
;;
;; - Es trabajador, tomando valores de Poco, Normal ó Mucho, y se
;;   representa por (Caracteristica Trabajador Poco|Normal|Mucho)
;;
;; - Le gustan las matemáticas, tomando valores de Si ó No, y se
;;   representa por (Caracteristica Matematicas Si|No)
;;
;; - Le gusta hardware, tomando valores de Si ó No, y se representa
;;   por (Caracteristica Hardware Si|No)
;;
;; - Le gusta programar, tomando valores de Si ó No, y se representa
;;   por (Caracteristica Programar Si|No)
;;
;; - En que ámbito quiere trabajar, tomando valores de Docencia, Empresa pública
;;   ó Empresa privada, y se presenta por (Caracteristica Ambito_trabajo Docencia|EmpresaPública|
;;   EmpresaPrivada)
;;
;; - En que lugar quiere trabajar, tomando valores de España ó Extranjero,
;;   y se representa por (Caracteristica Lugar_trabajo Espania|Extranjero)
;;
;; - Prefiere asignaturas teóricas o prácticas, tomando valores de
;;   Teóricas, Prácticas ó Ambas, y se representa por
;;   (Caracteristica Asignaturas Teóricas|Prácticas|Ambas)
;;
;; - Nivel de abstración, tomando valores de Bajo, Medio ó Alto, y
;;   se representa por (Caracteristica Nivel_abstraccion Alto|Medio|Bajo)


;;;;;;;;;;;;;;;; Hechos para representar las distintas sugerencias, formadas
;;;;;;;;;;;;;;;; por las combinación de distintos valores de las característica.

;; Cada hecho no debe contener el valor de todas las características, se puede
;; dejar sin valor, lo que significa que no se tiene en cuenta en la aceptación de esa sugerencia.
;;
;; Cada sugerencia está compuesta de varios hechos (Sugerencia ?id ?caracteristica ?valor),
;; que representan el ?valor necesario en la ?caracteristica para aceptar la sugerencia con
;; identificador igual a ?id.
;;
;; Además contiene un hecho (Sugerencia ?id Rama ?valor_rama), que representa la rama que se sugiere
;; es en la sugerencia con identificador igual a ?id.

(deffacts ModuloSBCMario::Sugerencias
    (Sugerencia 1 Ambito_trabajo "Docencia")
    (Sugerencia 1 Asignaturas "Teoricas")
    (Sugerencia 1 Matematicas "Si")
    (Sugerencia 1 Calificacion_media "Alta")
    (Sugerencia 1 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 2 Ambito_trabajo "Docencia")
    (Sugerencia 2 Asignaturas "Teoricas")
    (Sugerencia 2 Matematicas "Si")
    (Sugerencia 2 Calificacion_media "Media")
    (Sugerencia 2 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 3 Ambito_trabajo "Docencia")
    (Sugerencia 3 Asignaturas "Teoricas")
    (Sugerencia 3 Matematicas "Si")
    (Sugerencia 3 Calificacion_media "Baja")
    (Sugerencia 3 Nivel_abstraccion "Alto")
    (Sugerencia 3 Trabajador "Mucho")
    (Sugerencia 3 Rama Computación_y_Sistemas_Inteligentes)

    (Sugerencia 4 Ambito_trabajo "Docencia")
    (Sugerencia 4 Asignaturas "Teoricas")
    (Sugerencia 4 Matematicas "Si")
    (Sugerencia 4 Calificacion_media "Baja")
    (Sugerencia 4 Nivel_abstraccion "Alto")
    (Sugerencia 4 Trabajador "Normal")
    (Sugerencia 4 Rama Tecnologías_de_la_Información)

    (Sugerencia 5 Ambito_trabajo "Docencia")
    (Sugerencia 5 Asignaturas "Teoricas")
    (Sugerencia 5 Matematicas "Si")
    (Sugerencia 5 Calificacion_media "Baja")
    (Sugerencia 5 Nivel_abstraccion "Alto")
    (Sugerencia 5 Trabajador "Poco")
    (Sugerencia 5 Rama Tecnologías_de_la_Información)

    (Sugerencia 6 Ambito_trabajo "Docencia")
    (Sugerencia 6 Asignaturas "Teoricas")
    (Sugerencia 6 Matematicas "Si")
    (Sugerencia 6 Calificacion_media "Baja")
    (Sugerencia 6 Nivel_abstraccion "Medio")
    (Sugerencia 6 Rama Tecnologías_de_la_Información)

    (Sugerencia 7 Ambito_trabajo "Docencia")
    (Sugerencia 7 Asignaturas "Teoricas")
    (Sugerencia 7 Matematicas "Si")
    (Sugerencia 7 Calificacion_media "Baja")
    (Sugerencia 7 Nivel_abstraccion "Bajo")
    (Sugerencia 7 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 8 Ambito_trabajo "Docencia")
    (Sugerencia 8 Asignaturas "Teoricas")
    (Sugerencia 8 Matematicas "No")
    (Sugerencia 8 Hardware "Si")
    (Sugerencia 8 Trabajador "Mucho")
    (Sugerencia 8 Rama Ingeniería_de_Computadores)

    (Sugerencia 9 Ambito_trabajo "Docencia")
    (Sugerencia 9 Asignaturas "Teoricas")
    (Sugerencia 9 Matematicas "No")
    (Sugerencia 9 Hardware "Si")
    (Sugerencia 9 Trabajador "Normal")
    (Sugerencia 9 Nivel_abstraccion "Alto")
    (Sugerencia 9 Rama Sistemas_de_Información)

    (Sugerencia 10 Ambito_trabajo "Docencia")
    (Sugerencia 10 Asignaturas "Teoricas")
    (Sugerencia 10 Matematicas "No")
    (Sugerencia 10 Hardware "Si")
    (Sugerencia 10 Trabajador "Normal")
    (Sugerencia 10 Nivel_abstraccion "Medio")
    (Sugerencia 10 Rama Sistemas_de_Información)

    (Sugerencia 11 Ambito_trabajo "Docencia")
    (Sugerencia 11 Asignaturas "Teoricas")
    (Sugerencia 11 Matematicas "No")
    (Sugerencia 11 Hardware "Si")
    (Sugerencia 11 Trabajador "Normal")
    (Sugerencia 11 Nivel_abstraccion "Bajo")
    (Sugerencia 11 Rama Tecnologías_de_la_Información)

    (Sugerencia 12 Ambito_trabajo "Docencia")
    (Sugerencia 12 Asignaturas "Teoricas")
    (Sugerencia 12 Matematicas "No")
    (Sugerencia 12 Hardware "Si")
    (Sugerencia 12 Trabajador "Poco")
    (Sugerencia 12 Nivel_abstraccion "Alto")
    (Sugerencia 12 Rama Sistemas_de_Información)

    (Sugerencia 13 Ambito_trabajo "Docencia")
    (Sugerencia 13 Asignaturas "Teoricas")
    (Sugerencia 13 Matematicas "No")
    (Sugerencia 13 Hardware "Si")
    (Sugerencia 13 Trabajador "Poco")
    (Sugerencia 13 Nivel_abstraccion "Medio")
    (Sugerencia 13 Rama Sistemas_de_Información)

    (Sugerencia 14 Ambito_trabajo "Docencia")
    (Sugerencia 14 Asignaturas "Teoricas")
    (Sugerencia 14 Matematicas "No")
    (Sugerencia 14 Hardware "Si")
    (Sugerencia 14 Trabajador "Poco")
    (Sugerencia 14 Nivel_abstraccion "Bajo")
    (Sugerencia 14 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 15 Ambito_trabajo "Docencia")
    (Sugerencia 15 Asignaturas "Teoricas")
    (Sugerencia 15 Matematicas "No")
    (Sugerencia 15 Hardware "No")
    (Sugerencia 15 Nivel_abstraccion "Alto")
    (Sugerencia 15 Rama Sistemas_de_Información)
    
    (Sugerencia 16 Ambito_trabajo "Docencia")
    (Sugerencia 16 Asignaturas "Teoricas")
    (Sugerencia 16 Matematicas "No")
    (Sugerencia 16 Hardware "No")
    (Sugerencia 16 Nivel_abstraccion "Medio")
    (Sugerencia 16 Rama Sistemas_de_Información)
    
    (Sugerencia 17 Ambito_trabajo "Docencia")
    (Sugerencia 17 Asignaturas "Teoricas")
    (Sugerencia 17 Matematicas "No")
    (Sugerencia 17 Hardware "No")
    (Sugerencia 17 Nivel_abstraccion "Bajo")
    (Sugerencia 17 Rama Tecnologías_de_la_Información)

    (Sugerencia 18 Ambito_trabajo "Docencia")
    (Sugerencia 18 Asignaturas "Ambas")
    (Sugerencia 18 Programar "Si")
    (Sugerencia 18 Calificacion_media "Alta")
    (Sugerencia 18 Rama Ingeniería_del_Software)

    (Sugerencia 19 Ambito_trabajo "Docencia")
    (Sugerencia 19 Asignaturas "Ambas")
    (Sugerencia 19 Programar "Si")
    (Sugerencia 19 Calificacion_media "Media")
    (Sugerencia 19 Rama Ingeniería_del_Software)

    (Sugerencia 20 Ambito_trabajo "Docencia")
    (Sugerencia 20 Asignaturas "Ambas")
    (Sugerencia 20 Programar "Si")
    (Sugerencia 20 Calificacion_media "Baja")
    (Sugerencia 20 Rama Tecnologías_de_la_Información)

    (Sugerencia 21 Ambito_trabajo "Docencia")
    (Sugerencia 21 Asignaturas "Ambas")
    (Sugerencia 21 Programar "No")
    (Sugerencia 21 Nivel_abstraccion "Alto")
    (Sugerencia 21 Rama Sistemas_de_Información)

    (Sugerencia 22 Ambito_trabajo "Docencia")
    (Sugerencia 22 Asignaturas "Ambas")
    (Sugerencia 22 Programar "No")
    (Sugerencia 22 Nivel_abstraccion "Medio")
    (Sugerencia 22 Rama Sistemas_de_Información)

    (Sugerencia 23 Ambito_trabajo "Docencia")
    (Sugerencia 23 Asignaturas "Ambas")
    (Sugerencia 23 Programar "No")
    (Sugerencia 23 Nivel_abstraccion "Bajo")
    (Sugerencia 23 Rama Tecnologías_de_la_Información)

    (Sugerencia 24 Ambito_trabajo "Docencia")
    (Sugerencia 24 Asignaturas "Practicas")
    (Sugerencia 24 Programar "Si")
    (Sugerencia 24 Calificacion_media "Alta")
    (Sugerencia 24 Rama Ingeniería_del_Software)
    
    (Sugerencia 25 Ambito_trabajo "Docencia")
    (Sugerencia 25 Asignaturas "Practicas")
    (Sugerencia 25 Programar "Si")
    (Sugerencia 25 Calificacion_media "Media")
    (Sugerencia 25 Rama Ingeniería_del_Software)
    
    (Sugerencia 26 Ambito_trabajo "Docencia")
    (Sugerencia 26 Asignaturas "Practicas")
    (Sugerencia 26 Programar "Si")
    (Sugerencia 26 Calificacion_media "Baja")
    (Sugerencia 26 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 27 Ambito_trabajo "Docencia")
    (Sugerencia 27 Asignaturas "Practicas")
    (Sugerencia 27 Programar "No")
    (Sugerencia 27 Nivel_abstraccion "Alto")
    (Sugerencia 27 Rama Sistemas_de_Información)
    
    (Sugerencia 28 Ambito_trabajo "Docencia")
    (Sugerencia 28 Asignaturas "Practicas")
    (Sugerencia 28 Programar "No")
    (Sugerencia 28 Nivel_abstraccion "Medio")
    (Sugerencia 28 Rama Sistemas_de_Información)

    (Sugerencia 29 Ambito_trabajo "Docencia")
    (Sugerencia 29 Asignaturas "Practicas")
    (Sugerencia 29 Programar "No")
    (Sugerencia 29 Nivel_abstraccion "Bajo")
    (Sugerencia 29 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 30 Ambito_trabajo "Empresa_publica")
    (Sugerencia 30 Programar "Si")
    (Sugerencia 30 Calificacion_media "Alta")
    (Sugerencia 30 Rama Ingeniería_del_Software)
    
    (Sugerencia 31 Ambito_trabajo "Empresa_publica")
    (Sugerencia 31 Programar "Si")
    (Sugerencia 31 Calificacion_media "Media")
    (Sugerencia 31 Rama Ingeniería_del_Software)

    (Sugerencia 32 Ambito_trabajo "Empresa_publica")
    (Sugerencia 32 Programar "Si")
    (Sugerencia 32 Calificacion_media "Baja")
    (Sugerencia 32 Rama Tecnologías_de_la_Información)

    (Sugerencia 33 Ambito_trabajo "Empresa_publica")
    (Sugerencia 33 Programar "No")
    (Sugerencia 33 Nivel_abstraccion "Alto")
    (Sugerencia 33 Rama Sistemas_de_Información)

    (Sugerencia 34 Ambito_trabajo "Empresa_publica")
    (Sugerencia 34 Programar "No")
    (Sugerencia 34 Nivel_abstraccion "Medio")
    (Sugerencia 34 Rama Sistemas_de_Información)

    (Sugerencia 35 Ambito_trabajo "Empresa_publica")
    (Sugerencia 35 Programar "No")
    (Sugerencia 35 Nivel_abstraccion "Bajo")
    (Sugerencia 35 Hardware "Si")
    (Sugerencia 35 Rama Ingeniería_de_Computadores)
    
    (Sugerencia 36 Ambito_trabajo "Empresa_publica")
    (Sugerencia 36 Programar "No")
    (Sugerencia 36 Nivel_abstraccion "Bajo")
    (Sugerencia 36 Hardware "No")
    (Sugerencia 36 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 37 Ambito_trabajo "Empresa_privada")
    (Sugerencia 37 Lugar_trabajo "Espania")
    (Sugerencia 37 Programar "Si")
    (Sugerencia 37 Calificacion_media "Alta")
    (Sugerencia 37 Rama Ingeniería_del_Software)
    
    (Sugerencia 38 Ambito_trabajo "Empresa_privada")
    (Sugerencia 38 Lugar_trabajo "Espania")
    (Sugerencia 38 Programar "Si")
    (Sugerencia 38 Calificacion_media "Media")
    (Sugerencia 38 Rama Ingeniería_del_Software)
    
    (Sugerencia 39 Ambito_trabajo "Empresa_privada")
    (Sugerencia 39 Lugar_trabajo "Espania")
    (Sugerencia 39 Programar "Si")
    (Sugerencia 39 Calificacion_media "Baja")
    (Sugerencia 39 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 40 Ambito_trabajo "Empresa_privada")
    (Sugerencia 40 Lugar_trabajo "Espania")
    (Sugerencia 40 Programar "No")
    (Sugerencia 40 Rama Sistemas_de_Información)
    
    (Sugerencia 41 Ambito_trabajo "Empresa_privada")
    (Sugerencia 41 Lugar_trabajo "Extranjero")
    (Sugerencia 41 Matematicas "Si")
    (Sugerencia 41 Nivel_abstraccion "Alto")
    (Sugerencia 41 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 42 Ambito_trabajo "Empresa_privada")
    (Sugerencia 42 Lugar_trabajo "Extranjero")
    (Sugerencia 42 Matematicas "Si")
    (Sugerencia 42 Nivel_abstraccion "Medio")
    (Sugerencia 42 Rama Computación_y_Sistemas_Inteligentes)
    
    (Sugerencia 43 Ambito_trabajo "Empresa_privada")
    (Sugerencia 43 Lugar_trabajo "Extranjero")
    (Sugerencia 43 Matematicas "Si")
    (Sugerencia 43 Nivel_abstraccion "Bajo")
    (Sugerencia 43 Rama Ingeniería_del_Software)
    
    (Sugerencia 44 Ambito_trabajo "Empresa_privada")
    (Sugerencia 44 Lugar_trabajo "Extranjero")
    (Sugerencia 44 Matematicas "No")
    (Sugerencia 44 Nivel_abstraccion "Alto")
    (Sugerencia 44 Rama Sistemas_de_Información)
    
    (Sugerencia 45 Ambito_trabajo "Empresa_privada")
    (Sugerencia 45 Lugar_trabajo "Extranjero")
    (Sugerencia 45 Matematicas "No")
    (Sugerencia 45 Nivel_abstraccion "Medio")
    (Sugerencia 45 Rama Sistemas_de_Información)
    
    (Sugerencia 46 Ambito_trabajo "Empresa_privada")
    (Sugerencia 46 Lugar_trabajo "Extranjero")
    (Sugerencia 46 Matematicas "No")
    (Sugerencia 46 Nivel_abstraccion "Bajo")
    (Sugerencia 46 Rama Ingeniería_del_Software)
)

(defrule ModuloSBCMario::aniadir_motivos
(declare (salience 2))
(Sugerencia ?id Rama ?)
=>
(assert (Sugerencia ?id Motivos))
)

;;;;;;;;;;;;;;;; Regla para añadir el contador a cada sugerencia

;; Este contador aumenta cada vez que se obtiene un valor de una característica que coincide
;; con el valor de esa característica en la sugerencia, o cuando se obtiene se responde NSNC
;; al valor de la característica.

(defrule ModuloSBCMario::aniadir_contador
(declare (salience 1))
(Sugerencia ?id Rama ?)
=>
(assert (Sugerencia ?id Contador 0))
)

;;;;;;;;;;;;;;;; Regla para aumentar el contador de una sugerencia

;; Se activa cuando se cumplen se obtiene como resultado de la pregunta
;; nil ó el valor que se indica en la sugerencia para esa característica

(defrule ModuloSBCMario::aumentar_contador_nil
(declare (salience 1))
(Caracteristica ?caracteristica ?valor)
(Sugerencia ?id ?caracteristica ?)
(test (eq ?valor "nil"))
=>
(assert (IncreContador ?id))
)

(deffunction crear_motivo (?caracteristica ?valor)
    (bind ?frase "")
    (if (eq ?caracteristica Calificacion_media)
    then
        (if (eq ?valor "Alta")
        then
            (bind ?frase "tu calificacion media es alta")
        )
        (if (eq ?valor "Media")
        then
            (bind ?frase "tu calificacion media es media")
        )
        (if (eq ?valor "Baja")
        then
            (bind ?frase "tu calificacion media es baja")
        )
    )
    (if (eq ?caracteristica Trabajador)
    then
        (if (eq ?valor "Mucho")
        then
            (bind ?frase "tu esfuerzo trabajando es mucho")
        )
        (if (eq ?valor "Normal")
        then
            (bind ?frase "tu esfuerzo trabajando es normal")
        )
        (if (eq ?valor "Poco")
        then
            (bind ?frase "tu esfuerzo trabajando es poco")
        )
    )
    (if (eq ?caracteristica Matematicas)
    then
        (if (eq ?valor "Si")
        then
            (bind ?frase "te gustan las matemáticas")
        else
            (bind ?frase "no te gustan las matemáticas")
        )
    )
    (if (eq ?caracteristica Programar)
    then
        (if (eq ?valor "Si")
        then
            (bind ?frase "te gusta programar")
        else
            (bind ?frase "no te gusta programar")
        )
    )
    (if (eq ?caracteristica Hardware)
    then
        (if (eq ?valor "Si")
        then
            (bind ?frase "te gusta el hardware")
        else
            (bind ?frase "no te gusta el hardware")
        )
    )
    (if (eq ?caracteristica Ambito_trabajo)
    then
        (if (eq ?valor "Docencia")
        then
            (bind ?frase "el ambito en el que quieres trabajar es la docencia")
        )
        (if (eq ?valor "Empresa_publica")
        then
            (bind ?frase "el ambito en el que quieres trabajar es la empresa publica")
        )
        (if (eq ?valor "Empresa_privada")
        then
            (bind ?frase "el ambito en el que quieres trabajar es la empresa privada")
        )
    )
    (if (eq ?caracteristica Lugar_trabajo)
    then
        (if (eq ?valor "Espania")
        then
            (bind ?frase "el lugar donde quieres trabajar es España")
        )
        (if (eq ?valor "Extranjero")
        then
            (bind ?frase "el lugar donde quieres trabajar es en el extranjero")
        )
    )
    (if (eq ?caracteristica Asignaturas)
    then
        (if (eq ?valor "Practicas")
        then
            (bind ?frase "prefieres las asignaturas practicas")
        )
        (if (eq ?valor "Teoricas")
        then
            (bind ?frase "prefieres las asignaturas teoricas")
        )
        (if (eq ?valor "Ambas")
        then
            (bind ?frase "te gustan tanto las asignaturas teoricas como practicas")
        )
    )
    (if (eq ?caracteristica Nivel_abstraccion)
    then
        (if (eq ?valor "Alto")
        then
            (bind ?frase "tu nivel de abstraccion es alto")
        )
        (if (eq ?valor "Medio")
        then
            (bind ?frase "tu nivel de abstraccion es medio")
        )
        (if (eq ?valor "Bajo")
        then
            (bind ?frase "tu nivel de abstraccion es bajo")
        )
    )
    
    return ?frase
)

(defrule ModuloSBCMario::aumentar_contador
(declare (salience 1))
(Caracteristica ?caracteristica ?valor)
(Sugerencia ?id ?caracteristica ?valorSuge)
(test (eq ?valor ?valorSuge))
=>
(assert (IncreContador ?id ?caracteristica ?valor))
)

;; El incremento se hace en otra regla, para no entrar en un bucle infinito

(defrule ModuloSBCMario::incremento_contador_nil
(declare (salience 1))
?X <- (IncreContador ?id)
?Y <- (Sugerencia ?id Contador ?num)
=>
(retract ?X ?Y)
(assert (Sugerencia ?id Contador (+ ?num 1)))
)

(defrule ModuloSBCMario::incremento_contador
(declare (salience 1))
?X <- (IncreContador ?id ?caracteristica ?valor)
?Y <- (Sugerencia ?id Contador ?num)
?Z <- (Sugerencia ?id Motivos $?motivos)
=>
(retract ?X ?Y ?Z)
(assert (Sugerencia ?id Contador (+ ?num 1)))
(bind ?nuevo_motivo (crear_motivo ?caracteristica ?valor))
(assert (Sugerencia ?id Motivos ?motivos ?nuevo_motivo))
)


;;;;;;;;;;;;;;;; Regla para añadir el número necesario de características de cada sugerencia

;; El número necesario de características es igual al número de hechos (Sugerencia ?id ?caracteristica ?valor)
;; que tiene una sugerencia. Este hecho se utiliza para comprobar cuando se han cumplido todos los
;; requisitos de una sugerencia, es decir, cuando el contador tenga el mismo valor que este hecho, quiere
;; decir que todos los valores obtenidos de las características son iguales en esta sugerencia, por lo que es
;; aceptada como sugerencia.

(defrule ModuloSBCMario::aniadir_necesario
(declare (salience 2))
(Sugerencia ?id Rama ?)
=>
(assert (Sugerencia ?id Necesario 0))
)

;;;;;;;;;;;;;;;; Regla para aumentar el contador de una sugerencia

;; Se activa por cada valor de características indicado en la sugerencia

(defrule ModuloSBCMario::aumentar_necesario
(declare (salience 2))
(Sugerencia ?id ?caracteristica ?valor)
(test (neq ?caracteristica Rama))
(test (neq ?caracteristica Necesario))
(test (neq ?caracteristica Contador))
(test (neq ?caracteristica Motivos))
=>
(assert (IncreNecesario ?id))
)

;; El incremento se hace en otra regla, para no entrar en un bucle infinito

(defrule ModuloSBCMario::incremento_necesario
(declare (salience 2))
?X <- (IncreNecesario ?id)
?Y <- (Sugerencia ?id Necesario ?num)
=>
(retract ?X ?Y)
(assert (Sugerencia ?id Necesario (+ ?num 1)))
)

(defrule ModuloSBCMario::aceptar_sugerencia
(Sugerencia ?id Contador ?num1)
(Sugerencia ?id Necesario ?num2)
(test (eq ?num1 ?num2))
=>
(assert (CrearRecomendacion ?id))
)

(deffunction crear_recomendacion_sugerencia ($?motivos)
    (bind ?mensaje "")
    (bind ?i 1)
    (bind ?tam (length$ ?motivos))
    (while (< ?i (- ?tam 1)) do
        (bind ?mensaje (str-cat ?mensaje (nth$ ?i ?motivos) ", "))
        (bind ?i (+ ?i 1))
    )

    (if (eq ?i 1)
    then
        (bind ?mensaje (str-cat ?mensaje (nth$ ?i ?motivos)))
    else
        (bind ?mensaje (str-cat ?mensaje "y " (nth$ ?i ?motivos)))
    )
    
    return ?mensaje
)

(defrule ModuloSBCMario::crear_recomendacion
?X <- (CrearRecomendacion ?id)
(Sugerencia ?id Motivos $?motivos)
(Sugerencia ?id Rama ?rama)
=>
(bind ?mensaje (crear_recomendacion_sugerencia ?motivos))
(assert (RecomendacionMario (rama ?rama) (motivo ?mensaje)))
(retract ?X)
)

(defrule ModuloSBCMario::siguienteModulo
(declare (salience -1))
=>
(focus ModuloSBCSergio)
)


;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


(defmodule ModuloSBCSergio
    (import ModuloPregunta deftemplate Respuesta)
    (export deftemplate RecomendacionSergio)
)

(deftemplate RecomendacionSergio
    (field rama (default ?NONE))
    (field motivo (default ?NONE))
)

(defrule ModuloSBCSergio::recibirRespuesta
(declare (salience -10))
    (Respuesta (caracteristica ?caracteristica)(valor ?valor))
=>
    (assert (Caracteristica ?caracteristica ?valor))
)

(defrule ModuloSBCSergio::NotaAltaAsignaturasTeoricas
    (Caracteristica Calificacion_media "Alta")
    (Caracteristica Asignaturas "Teoricas")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (RecomendacionSergio
        (rama Computación_y_Sistemas_Inteligentes)
        (motivo "tienes buena nota (que la necesitas para entrar) y te gustan las asignaturas teoricas como aprendizaje automatico")
    ))
)

(defrule ModuloSBCSergio::NotaAltaAsignaturasPracticas
    (Caracteristica Calificacion_media "Alta")
    (Caracteristica Asignaturas "Practicas")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Ingeniería_del_Software))
    (assert (RecomendacionSergio
        (rama Ingeniería_del_Software)
        (motivo "tienes buena nota (la necesitas para poder entrar) y te gustan las asignaturas practicas")
    ))
)

(defrule ModuloSBCSergio::NotaAltaAsignaturasAmbasMatematicasSi
    (Caracteristica Calificacion_media "Alta")
    (Caracteristica Asignaturas "Ambas")
    (Caracteristica Matematicas "Si")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Computación_y_Sistemas_Inteligentes))
    (assert (RecomendacionSergio
        (rama Computación_y_Sistemas_Inteligentes)
        (motivo "tienes buena nota (la necesitas para poder entrar) y te gustan las mates")
    ))
)

(defrule ModuloSBCSergio::NotaAltaAsignaturasAmbasMatematicasNo
    (Caracteristica Calificacion_media "Alta")
    (Caracteristica Asignaturas "Ambas")
    (Caracteristica Matematicas "No")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Ingeniería_del_Software))
    (assert (RecomendacionSergio
        (rama Ingeniería_del_Software)
        (motivo "tienes buena nota (la necesitas para poder entrar) y no te gustan las mates")
    ))
)

(defrule ModuloSBCSergio::NotaMediaMatematicasSiAsignaturasTeoricas
    (Caracteristica Calificacion_media "Media")
    (Caracteristica Matematicas "Si")
    (Caracteristica Asignaturas "Teoricas")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Computación_y_Sistemas_Inteligentes))
    (assert (RecomendacionSergio
        (rama Computación_y_Sistemas_Inteligentes)
        (motivo "seguramente tengas nota suficiente para entrar, te gustan las mates y las asignaturas teoricas")
    ))
)

(defrule ModuloSBCSergio::NotaMediaMatematicasSiTrabajadorMucho
    (Caracteristica Calificacion_media "Media")
    (Caracteristica Matematicas "Si")
    (Caracteristica Trabajador "Mucho")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Computación_y_Sistemas_Inteligentes))
    (assert (RecomendacionSergio
        (rama Computación_y_Sistemas_Inteligentes)
        (motivo "seguramente tengas nota suficiente para entrar, te gustan las mates y te consideras muy trabajador")
    ))
)

(defrule ModuloSBCSergio::NotaMediaMatematicasSi
    (Caracteristica Calificacion_media "Media")
    (Caracteristica Matematicas "Si")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Ingeniería_del_Software))
    (assert (RecomendacionSergio
        (rama Ingeniería_del_Software)
        (motivo "seguramente tengas nota suficiente para entrar y te gustan las matematicas")
    ))
)

(defrule ModuloSBCSergio::NotaMediaHardwareSi
    (Caracteristica Calificacion_media "Media")
    (Caracteristica Hardware "Si")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Ingeniería_de_Computadores))
    (assert (RecomendacionSergio
        (rama Ingeniería_de_Computadores)
        (motivo "te gusta el hardware")
    ))
)

(defrule ModuloSBCSergio::NotaMediaAsignaturasPracticas
    (Caracteristica Calificacion_media "Media")
    (Caracteristica Asignaturas "Practicas")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Tecnologías_de_la_Información))
    (assert (RecomendacionSergio
        (rama Tecnologías_de_la_Información)
        (motivo "tienes nota suficiente y te gustan las asignaturas practicas")
    ))
)

(defrule ModuloSBCSergio::NotaMedia
    (Caracteristica Calificacion_media "Media")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Sistemas_de_Información))
    (assert (RecomendacionSergio
        (rama Sistemas_de_Información)
        (motivo "no vas a tener problemas para entrar")
    ))
)

(defrule ModuloSBCSergio::NotaBajaHardwareSi
    (Caracteristica Calificacion_media "Baja")
    (Caracteristica Hardware "Si")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Ingeniería_de_Computadores))
    (assert (RecomendacionSergio
        (rama Ingeniería_de_Computadores)
        (motivo "te gusta el hardware")
    ))
)

(defrule ModuloSBCSergio::NotaBaja
    (Caracteristica Calificacion_media "Baja")
    (not (RecomendacionSergio (rama ?)(motivo ?)))
=>
    (assert (Recomienda Tecnologías_de_la_Información))
    (assert (RecomendacionSergio
        (rama Tecnologías_de_la_Información)
        (motivo "no vas a tener problemas para entrar")
    ))
)

(defrule ModuloSBCSergio::tieneRespuesta
(declare (salience 100))
    (RecomendacionSergio (rama ?)(motivo ?))
=>
    (focus ModuloRecomendacion)
)




;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


(defmodule ModuloRecomendacion
    (import ModuloSBCSergio deftemplate RecomendacionSergio)
    (import ModuloSBCMario deftemplate RecomendacionMario)
)

;; Convierte a texto bonito
(deffacts Ramas
    (Rama Computación_y_Sistemas_Inteligentes "Computacion y Sistemas Inteligentes")
    (Rama Ingeniería_del_Software "Ingenieria del Software")
    (Rama Ingeniería_de_Computadores "Ingenieria de Computadores")
    (Rama Sistemas_de_Información "Sistemas de la Informacion")
    (Rama Tecnologías_de_la_Información "Tecnologias de la informacion")
)

;; Si se recomienda la misma rama, se unifica la respuesta y los motivos
(defrule ModuloRecomendacion::coincideRecomendacion
(declare (salience 1))
    ?X <- (RecomendacionSergio (rama ?r)(motivo ?motivoS))
    ?Y <- (RecomendacionMario (rama ?r)(motivo ?motivoM))
    (Rama ?r ?rama)
=>
    (bind ?mensaje (str-cat "El sistema te recomienda " ?rama " porque " ?motivoM))
    (assert (Recomendacion ?mensaje))
    (retract ?X ?Y)
)

;; Si las ramas no coinciden, cada subsistema da su propia respuesta
(defrule ModuloRecomendacion::recomendacionSergio
    (RecomendacionSergio (rama ?r)(motivo ?motivo))
    (Rama ?r ?rama)
=>
    (bind ?mensaje (str-cat "Sergio recomienda " ?rama  " porque " ?motivo))
    (assert (Recomendacion ?mensaje))
)

(defrule ModuloRecomendacion::recomendacionMario
    (RecomendacionMario (rama ?r)(motivo ?motivo))
    (Rama ?r ?rama)
=>
    (bind ?mensaje (str-cat "Mario recomienda " ?rama " porque " ?motivo))
    (assert (Recomendacion ?mensaje))
)

(defrule ModuloRecomendacion::recomendacion
    (Recomendacion ?mensaje)
=>
    (printout t ?mensaje crlf)
)






































;##############################################################################################;
;##############################################################################################;
;##############################################################################################;
;##############################################################################################;























