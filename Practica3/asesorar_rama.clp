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
    (Sugerencia 37 Lugar_trabajo "España")
    (Sugerencia 37 Programar "Si")
    (Sugerencia 37 Calificacion_media "Alta")
    (Sugerencia 37 Rama Ingeniería_del_Software)
    
    (Sugerencia 38 Ambito_trabajo "Empresa_privada")
    (Sugerencia 38 Lugar_trabajo "España")
    (Sugerencia 38 Programar "Si")
    (Sugerencia 38 Calificacion_media "Media")
    (Sugerencia 38 Rama Ingeniería_del_Software)
    
    (Sugerencia 39 Ambito_trabajo "Empresa_privada")
    (Sugerencia 39 Lugar_trabajo "España")
    (Sugerencia 39 Programar "Si")
    (Sugerencia 39 Calificacion_media "Baja")
    (Sugerencia 39 Rama Tecnologías_de_la_Información)
    
    (Sugerencia 40 Ambito_trabajo "Empresa_privada")
    (Sugerencia 40 Lugar_trabajo "España")
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

;;;;;  Regla para añadir el contador a cada sugerencia

(defrule aniadir_contador
(declare (salience 2))
(Sugerencia ?id Rama ?)
(not (Sugerencia ?id Contador ?num))
=>
(assert (Sugerencia ?id Contador 0))
)

(defrule aumentar_contador
(declare (salience 2))
(Caracteristica ?caracteristica ?valor)
(Sugerencia ?id ?caracteristica ?valorSuge)
(test (or (eq ?valor "nil") (eq ?valor ?valorSuge)))
=>
(assert (IncreContador ?id))
)

(defrule incremento_contador
(declare (salience 2))
?X <- (IncreContador ?id)
?Y <- (Sugerencia ?id Contador ?num)
=>
(retract ?X ?Y)
(assert (Sugerencia ?id Contador (+ ?num 1)))
)

;;;;;  Regla para añadir el número necesario a cada sugerencia

(defrule aniadir_necesario
(declare (salience 2))
(Sugerencia ?id Rama ?)
(not (Sugerencia ?id Necesario ?num))
=>
(assert (Sugerencia ?id Necesario 0))
)

(defrule aumentar_necesario
(declare (salience 2))
(Sugerencia ?id ?caracteristica ?valor)
(test (neq ?caracteristica Rama))
(test (neq ?caracteristica Necesario))
(test (neq ?caracteristica Contador))
=>
(assert (IncreNecesario ?id))
)

(defrule incremento_necesario
(declare (salience 2))
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
(test (and (neq ?valorSuge ?valor) (neq ?valor nil)))
(Sugerencia ?id Rama ?rama)
=>
(assert (Rechazo ?rama ?nombre ?valor))
(retract ?X)
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
(Rango Calificacion_media "Alta" "Media" "Baja")
(Rango Trabajador "Mucho" "Normal" "Poco")
(Rango Matematicas "Si" "No")
(Rango Hardware "Si" "No")
(Rango Programar "Si" "No")
(Rango Ambito_trabajo "Docencia" "Empresa_publica" "Empresa_privada")
(Rango Lugar_trabajo "España" "Extranjero")
(Rango Asignaturas "Teoricas" "Practicas" "Ambas")
(Rango Nivel_abstraccion "Alto" "Medio" "Bajo")
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
        (Valor "Docencia")
        (Requisitos)
        (Siguientes Asignaturas))
    (SiguientePregunta
        (Caracteristica Ambito_trabajo)
        (Valor "Empresa_publica")
        (Requisitos)
        (Siguientes Programar))
    (SiguientePregunta
        (Caracteristica Ambito_trabajo)
        (Valor "Empresa_privada")
        (Requisitos)
        (Siguientes Lugar_trabajo))
    (SiguientePregunta
        (Caracteristica Asignaturas)
        (Valor "Teoricas")
        (Requisitos Ambito_trabajo)
        (Siguientes Matematicas))
    (SiguientePregunta
        (Caracteristica Asignaturas)
        (Valor "Practicas")
        (Requisitos Ambito_trabajo)
        (Siguientes Programar))
    (SiguientePregunta
        (Caracteristica Asignaturas)
        (Valor "Ambas")
        (Requisitos Ambito_trabajo)
        (Siguientes Programar))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor "Si")
        (Requisitos Asignaturas)
        (Siguientes Calificacion_media))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor "No")
        (Requisitos Asignaturas)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor "Si")
        (Requisitos Ambito_trabajo)
        (Siguientes Calificacion_media))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor "No")
        (Requisitos Ambito_trabajo)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Programar)
        (Valor "Si")
        (Requisitos Lugar_trabajo)
        (Siguientes Calificacion_media))
    (SiguientePregunta
        (Caracteristica Matematicas)
        (Valor "Si")
        (Requisitos Asignaturas)
        (Siguientes Calificacion_media))
    (SiguientePregunta
        (Caracteristica Matematicas)
        (Valor "No")
        (Requisitos Asignaturas)
        (Siguientes Hardware))
    (SiguientePregunta
        (Caracteristica Matematicas)
        (Valor "Si")
        (Requisitos Lugar_trabajo)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Matematicas)
        (Valor "No")
        (Requisitos Lugar_trabajo)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Calificacion_media)
        (Valor "Baja")
        (Requisitos Matematicas)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Nivel_abstraccion)
        (Valor "Alto")
        (Requisitos Calificacion_media)
        (Siguientes Trabajador))
    (SiguientePregunta
        (Caracteristica Nivel_abstraccion)
        (Valor "Bajo")
        (Requisitos Programar)
        (Siguientes Hardware))
    (SiguientePregunta
        (Caracteristica Trabajador)
        (Valor "Normal")
        (Requisitos Hardware)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Trabajador)
        (Valor "Poco")
        (Requisitos Hardware)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Hardware)
        (Valor "Si")
        (Requisitos Matematicas)
        (Siguientes Trabajador))
    (SiguientePregunta
        (Caracteristica Hardware)
        (Valor "No")
        (Requisitos Matematicas)
        (Siguientes Nivel_abstraccion))
    (SiguientePregunta
        (Caracteristica Lugar_trabajo)
        (Valor "España")
        (Requisitos Ambito_trabajo)
        (Siguientes Programar))
    (SiguientePregunta
        (Caracteristica Lugar_trabajo)
        (Valor "Extranjero")
        (Requisitos Ambito_trabajo)
        (Siguientes Matematicas))
)

(deffacts Frases
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
    (Frase Lugar_trabajo "España" "el lugar donde quieres trabajar es España")
    (Frase Lugar_trabajo "Extranjero" "el lugar donde quieres trabajar es en el extranjero")
    (Frase Asignaturas "Practicas" "prefieres las asignaturas practicas")
    (Frase Asignaturas "Teoricas" "prefieres las asignaturas teoricas")
    (Frase Asignaturas "Ambas" "te gustan tanto las asignaturas teoricas como practicas")
    (Frase Nivel_abstraccion "Alto" "tu nivel de abstraccion es alto")
    (Frase Nivel_abstraccion "Medio" "tu nivel de abstraccion es medio")
    (Frase Nivel_abstraccion "Bajo" "tu nivel de abstraccion es bajo")
)

(deffacts Preguntas
    (FrasePregunta Calificacion_media "que nota media tienes?")
    (FrasePregunta Trabajador "me puedes decir como de trabajador eres (Mucho, Normal, Poco o NSNC)?")
    (FrasePregunta Matematicas "me puedes decir si te gustan las matematicas (Si, No o NSNC)?")
    (FrasePregunta Programar "me puedes decir si te gusta programar (Si, No o NSNC)?")
    (FrasePregunta Hardware "me puedes decir si te gusta el hardware (Si, No o NSNC)?")
    (FrasePregunta Ambito_trabajo "en que ambito del trabajo te gustaria trabajar (Docencia, Empresa publica, Empresa privada o NSNC)?")
    (FrasePregunta Lugar_trabajo "en que lugar te gustaria trabajar (España, Extranjero o NSNC)?")
    (FrasePregunta Asignaturas "que tipo de asignaturas prefieres (Teoricas, Practicas, Ambas o NSNC)?")
    (FrasePregunta Nivel_abstraccion "que nivel de abstraccion tienes (Alto, Medio, Bajo o NSNC)?")
)


;;;;;;;; Reglas para obtener la frase de la primera preguntas

(deffunction obtenerFrasePreguntaInicio(?resto_frase $?frases)
    (bind ?frase (nth$ (random 1 (length$ ?frases)) ?frases))
    (bind ?frase (str-cat ?frase ", " ?resto_frase " "))

    return ?frase
)


;;;;;;;; Reglas para obtener la frase del resto de preguntas

(deffunction obtenerFrasePreguntaResto(?resto_frase1 ?resto_frase2 $?frases)
    (bind ?frase (nth$ (random 1 (length$ ?frases)) ?frases))
    (bind ?frase (str-cat ?frase " " ?resto_frase1 ", " ?resto_frase2 " "))

    (printout t ?frase)
)


;;;;;;;;; Comprobaciones de la pregunta para características no numéricas

(deffunction perteneceAlRango (?palabra $?rango)
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


;;;;;;;;; Comprobaciones de la pregunta para características numéricas

(deffunction obtenerValorNumerico (?caracteristica ?valor)
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

(deffunction perteneceAlRangoNumerico (?palabra ?min ?max)
    (bind ?salida nil)
    (if (and (<= ?min ?palabra) (<= ?palabra ?max))
    then (bind ?salida ?palabra)
    )

    ?salida
)

(deffunction obtenerValorCaracNumerico (?caracteristica ?min ?max ?mensaje)
    (bind ?valor "Repetir")
    (if (eq (lowcase (str-cat ?mensaje)) "nsnc")
    then
        (bind ?valor "nil")
    else
        (bind ?salida (perteneceAlRangoNumerico ?mensaje ?min ?max))
        (if (neq ?salida nil)
        then
            (bind ?valor ?salida)
            (bind ?valor (obtenerValorNumerico ?caracteristica ?valor))
        )
    )
    
    return ?valor
)



;;;;;;;;;;;;;;; Preguntas

;;;;;;;;;;; Primera pregunta

;;;;;; Característica numérica

(defrule pregunta_inicio_numerico
?X <- (Pregunta ?caracteristica)
(not (AnteriorPregunta ?nombre))
(Frase Inicio $?frases)
(FrasePregunta ?caracteristica ?restoFrase)
(RangoNumerico ?caracteristica ?min ?max)
=>
(bind ?frase (obtenerFrasePreguntaInicio ?restoFrase ?frases))
(printout t ?frase)
(bind ?mensaje (read))
(bind ?valor (obtenerValorCaracNumerico ?caracteristica ?min ?max ?mensaje))
(assert (Respuesta ?caracteristica ?valor))
(retract ?X)
)

;;;;;; Característica no numérica

(defrule pregunta_inicio_no_numerico
?X <- (Pregunta ?caracteristica)
(not (AnteriorPregunta ?nombre))
(Frase Inicio $?frases)
(FrasePregunta ?caracteristica ?restoFrase)
(not (RangoNumerico ?caracteristica ? ?))
(Rango ?caracteristica $?rango)
=>
(bind ?frase (obtenerFrasePreguntaInicio ?restoFrase ?frases))
(printout t ?frase)
(bind ?mensaje (readline))
(bind ?valor (perteneceAlRango ?mensaje ?rango))
(assert (Respuesta ?caracteristica ?valor))
(retract ?X)
)

;;;;;;;;;;; Resto de preguntas

;;;;;; Característica numérica



(defrule pregunta_resto_numerico
?X <- (Pregunta ?caracteristica)
(RangoNumerico ?carac ?min ?max)
(test (eq ?caracteristica ?carac))
(AnteriorPregunta ?nombre)
(Caracteristica ?nombre ?valor)
(Frase Resto $?frases)
(Frase ?nombre ?valor ?restoFrase1)
(FrasePregunta ?caracteristica ?restoFrase2)
=>
(bind ?frase (obtenerFrasePreguntaResto ?restoFrase1 ?restoFrase2 ?frases))
(printout t ?frase)
(bind ?mensaje (read))
(bind ?valor (obtenerValorCaracNumerico ?caracteristica ?min ?max ?mensaje))
(assert (Respuesta ?caracteristica ?valor))
(retract ?X)
)

;;;;;; Característica no numérica

(defrule pregunta_resto_no_numerico
?X <- (Pregunta ?caracteristica)
(AnteriorPregunta ?nombre)
(Caracteristica ?nombre ?valor)
(Frase Resto $?frases)
(Frase ?nombre ?valor ?restoFrase1)
(FrasePregunta ?caracteristica ?restoFrase2)
(not (RangoNumerico ?caracteristica ? ?))
(Rango ?caracteristica $?rango)
=>
(bind ?frase (obtenerFrasePreguntaResto ?restoFrase1 ?restoFrase2 ?frases))
(printout t ?frase)
(bind ?mensaje (readline))
(bind ?valor (perteneceAlRango ?mensaje ?rango))
(assert (Respuesta ?caracteristica ?valor))
(retract ?X)
)


;;;;;;; Regla para volver a preguntas

(defrule volver_a_preguntar
(declare (salience 9999))
?X <- (Respuesta ?caracteristica ?valor)
(test (eq ?valor "Repetir"))
=>
(assert (Pregunta ?caracteristica))
(retract ?X)
)

;;;;;;;; Regla para seguir con la obtención de las siguientes preguntas


(defrule gestionar_respuesta
(declare (salience 9999))
?X <- (Respuesta ?caracteristica ?valor)
(test (neq ?valor "Repetir"))
=>
(assert (Caracteristica ?caracteristica ?valor))
(assert (ObtenerSiguientesPreguntas ?caracteristica))
(retract ?X)
)


;;;;;;; Regla para obtener un elemento de una lista

(deffunction obtener_elem_lista (?indice $?lista)
    return (nth$ ?indice ?lista)
)


;;;;;;;; Regla para obtener las siguientes preguntas a la realiza como primera pregunta

(defrule siguientes_preguntas_primero
(declare (salience 1))
?X <- (ObtenerSiguientesPreguntas ?caracteristica)
(Caracteristica ?caracteristica ?valor)
(not (AnteriorPregunta ?))
(SiguientePregunta (Caracteristica ?caracteristica) (Valor ?valor) (Requisitos $?requisitos) (Siguientes $?siguientes))
=>
(retract ?X)
(bind ?i 1)
(bind ?tam (length$ ?siguientes))
(while (<= ?i ?tam) do
    (bind ?aux (obtener_elem_lista ?i ?siguientes))
    (assert (Pregunta ?aux))
    (bind ?i (+ ?i 1))
)

(assert (AnteriorPregunta ?caracteristica))
)

;;;;;;;; Regla para obtener las siguientes preguntas a la realiza en el resto de preguntas

(defrule siguientes_preguntas_resto
(declare (salience 1))
?X <- (ObtenerSiguientesPreguntas ?caracteristica)
(Caracteristica ?caracteristica ?valor)
?Y <- (AnteriorPregunta ?anterior)
(SiguientePregunta (Caracteristica ?caracteristica) (Valor ?valor) (Requisitos $?requisitos) (Siguientes $?siguientes))
(test (member ?anterior ?requisitos))
=>
(retract ?X ?Y)
(bind ?i 1)
(bind ?tam (length$ ?siguientes))
(while (<= ?i ?tam) do
    (bind ?aux (obtener_elem_lista ?i ?siguientes))
    (assert (Pregunta ?aux))
    (bind ?i (+ ?i 1))
)

(assert (AnteriorPregunta ?caracteristica))
)


;;;;;;;;; Sugerir rama

(defrule sugerir_rama
(declare (salience 1))
(Sugerencia ?id Contador ?num1)
(Sugerencia ?id Necesario ?num2)
(test (eq ?num1 ?num2))
=>
(assert (Elegido ?id))
)


;;;;;;;;;;; Terminar dedución e indicar las sugerencias aceptadas

(defrule terminar_deducion
(declare (salience -1))
(not (Pregunta ?))
(SugeAceptada ?mensaje)
=>
(printout t ?mensaje crlf)
)


;;;;;;; Función para obtener el nombre de una rama como String

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

;;;;; Regla para crear el hecho Motivos de una sugerencia de rama

(defrule mostrar_sugerencia
(Elegido ?id)
=>
(assert (Motivos ?id))
)

;;;;; Regla que va a añadiendo los motivos por los que es sugerida la rama

(defrule añadir_motivo_sugerencia
(declare (salience 1))
?X <- (Motivos ?id $?motivos)
?Y <- (Sugerencia ?id ?nombre ?valor)
(test (neq ?nombre Rama))
(test (neq ?nombre Contador))
(test (neq ?nombre Necesario))
(Frase ?nombre ?valor ?frase)
=>
(retract ?X ?Y)
(assert (Motivos ?id ?motivos ?frase))
)

;;;;;; Función para crear el String que será el mensaje de sugerencia de una rama
;;;;;; con sus motivos de sugerencia

(deffunction crear_mensaje_sugerencia (?rama $?motivos)
    (bind ?mensaje (str-cat "Te sugiero que eligas la rama " (obtener_nombre_rama ?rama) " porque "))
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

;;;;; Regla que crea el mensaje de sugerencia de una rama con sus motivos

(defrule mostrar_mensaje_sugerencia
?X <- (Motivos ?id $?motivos)
?Y <- (Elegido ?id)
(Sugerencia ?id Rama ?rama)
=>
(retract ?X ?Y)
(bind ?mensaje (crear_mensaje_sugerencia ?rama ?motivos))
(assert (SugeAceptada ?mensaje))
)



;;;;;;;;;;; Retractar pregunta realizada anteriormente

(defrule retractar_pregunta
(declare (salience 9999))
?X <- (Pregunta ?nombre)
(Caracteristica ?nombre ?)
=>
(retract ?X)
)


;;;;;;;;;;; Retractar rama, y se crea el hecho MotivosRechazo

(defrule retractar_rama
(declare (salience 9999))
(Rechazo ?rama $?)
(not (Sugerencia ? Rama ?rama))
=>
(assert (MotivosRechazo ?rama))
)

(defrule retractar_rama_al_terminar
(declare (salience -1))
(Rechazo ?rama $?)
(not (Pregunta ?))
=>
(assert (MotivosRechazo ?rama))
)

;;;;;; Regla para añadir los motivos del rechazo de la rama

(defrule añadir_motivo_rechazo_rama
?X <- (MotivosRechazo ?rama $?motivos)
?Y <- (Rechazo ?rama ?nombre ?valor)
(Frase ?nombre ?valor ?frase)
=>
(retract ?X ?Y)
(assert (MotivosRechazo ?rama ?motivos ?frase))
)

;;;;;; Función para crear el String que será el mensaje de un rechazo de una rama
;;;;;; con sus motivos de rechazo

(deffunction crear_mensaje_rechazo_rama (?rama $?motivos)
    (bind ?mensaje (str-cat "La rama " (obtener_nombre_rama ?rama) " ha sido rechazada porque "))
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

;;;;; Regla que crea y muestra el mensaje de rechazo de una rama con sus motivos

(defrule mostrar_mensaje_rechazo_rama
?X <- (MotivosRechazo ?rama $?motivos)
(not (Rechazo ?rama ? ?))
=>
(retract ?X)
(bind ?mensaje (crear_mensaje_rechazo_rama ?rama ?motivos))
(printout t ?mensaje crlf)
)
