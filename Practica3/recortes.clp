
(deffunction obtener_frase_rechazo (?caracteristica ?valor)
    (Frase ?caracteristica ?valor ?frase)
    return ?frase
)

(deffunction obtener_mensaje_motivos ($?motivos)
    (bind ?mensaje "porque ")
    (bind ?tam (length$ ?motivos))
    (bind ?i 1)
    (while (< i (- ?tam 2)) do
        (bind ?mensaje (str-cat ?mensaje (obtener_frase_rechazo ?caracteristica ?valor) ", "))
        (bind ?i (+ ?i 2))
    )

    (if (eq ?mensaje "porque ")
    then
        (bind ?mensaje (str-cat ?mensaje (obtener_frase_rechazo ?caracteristica ?valor)))
    else
        (bind ?mensaje (str-cat ?mensaje "y " (obtener_frase_rechazo?caracteristica ?valor)))
    )

    return ?mensaje
)



(deffunction aceptar_rama (?rama $?motivos)
    (bind ?mensaje (str-cat "Te sugiero que eligas la rama " (obtener_nombre_rama ?rama) " " (obtener_mensaje_motivos ?motivos)))

    return ?mensaje
)





















(deffunction lanzarSiguientesPreguntas (?caracteristica ?valor)
    (bind ?terminar FALSE)
    (while (eq ?terminar FALSE) do
        (SiguientePregunta (Caracteristica ?caracteristica) (Valor ?valor) (Requisitos $?requisitos) (Siguientes ?siguientes))
        (lanzarSiguiente ?caracteristica ?valor ?requisitos ?siguientes)
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















;;;;;;;;;;; Registro para representar las sugerencias

(deftemplate Sugerencia
    (field Calificacion_media (default nil))
    (field Trabajador (default nil))
    (field Matematicas (default nil))
    (field Hardware (default nil))
    (field Programar (default nil))
    (field Ambito_trabajo (default nil))
    (field Lugar_trabajo (default nil))
    (field Asignaturas (default nil))
    (field Nivel_abstraccion (default nil))
    (field Rama (default ?NONE)) )


;;;;;;;;;;; Registro para representar las sugerencias

(deftemplate Sugerencia
    (field Calificacion_media (default nil))
    (field Trabajador (default nil))
    (field Matematicas (default nil))
    (field Hardware (default nil))
    (field Programar (default nil))
    (field Ambito_trabajo (default nil))
    (field Lugar_trabajo (default nil))
    (field Asignaturas (default nil))
    (field Nivel_abstraccion (default nil))
    (field Rama (default ?NONE)) )


;;;;;;;;;;; Sugerencias

(deffacts Sugerencias
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Teoricas)
        (Matematicas Si)
        (Calificacion_media Alta)
        (Rama Computación_y_Sistemas_Inteligentes))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Teoricas)
        (Matematicas Si)
        (Calificacion_media Media)
        (Rama Computación_y_Sistemas_Inteligentes))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Teoricas)
        (Matematicas Si)
        (Calificacion_media Baja)
        (Nivel_abstraccion Alto)
        (Trabajador Mucho)
        (Rama Computación_y_Sistemas_Inteligentes))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Teoricas)
        (Matematicas No)
        (Hardware Si)
        (Trabajador Mucho)
        (Rama Ingeniería_de_Computadores))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Teoricas)
        (Matematicas No)
        (Hardware No)
        (Nivel_abstraccion Alto)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Teoricas)
        (Matematicas No)
        (Hardware No)
        (Nivel_abstraccion Medio)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Teoricas)
        (Matematicas No)
        (Hardware No)
        (Nivel_abstraccion Bajo)
        (Rama Tecnologías_de_la_Información))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Practicas)
        (Programar Si)
        (Calificacion_media Alta)
        (Rama Ingeniería_del_Software))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Practicas)
        (Programar Si)
        (Calificacion_media Media)
        (Rama Ingeniería_del_Software))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Practicas)
        (Programar Si)
        (Calificacion_media Baja)
        (Rama Tecnologías_de_la_Información))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Practicas)
        (Programar No)
        (Nivel_abstraccion Alto)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Practicas)
        (Programar No)
        (Nivel_abstraccion Medio)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Docencia)
        (Asignaturas Practicas)
        (Programar No)
        (Nivel_abstraccion Bajo)
        (Rama Tecnologías_de_la_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_publica)
        (Programar Si)
        (Calificacion_media Alta)
        (Rama Ingeniería_del_Software))
    (Sugerencia 
        (Ambito_trabajo Empresa_publica)
        (Programar Si)
        (Calificacion_media Media)
        (Rama Ingeniería_del_Software))
    (Sugerencia 
        (Ambito_trabajo Empresa_publica)
        (Programar Si)
        (Calificacion_media Baja)
        (Rama Tecnologías_de_la_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_publica)
        (Programar No)
        (Nivel_abstraccion Alto)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_publica)
        (Programar No)
        (Nivel_abstraccion Medio)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_publica)
        (Programar No)
        (Nivel_abstraccion Bajo)
        (Hardware Si)
        (Rama Ingeniería_de_Computadores))
    (Sugerencia 
        (Ambito_trabajo Empresa_publica)
        (Programar No)
        (Nivel_abstraccion Bajo)
        (Hardware No)
        (Rama Tecnologías_de_la_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo España)
        (Programar Si)
        (Calificacion_media Alta)
        (Rama Ingeniería_del_Software))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo España)
        (Programar Si)
        (Calificacion_media Media)
        (Rama Ingeniería_del_Software))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo España)
        (Programar Si)
        (Calificacion_media Baja)
        (Rama Tecnologías_de_la_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo España)
        (Programar No)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo Extranjero)
        (Matematicas Si)
        (Nivel_abstraccion Alto)
        (Rama Computación_y_Sistemas_Inteligentes))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo Extranjero)
        (Matematicas Si)
        (Nivel_abstraccion Medio)
        (Rama Computación_y_Sistemas_Inteligentes))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo Extranjero)
        (Matematicas Si)
        (Nivel_abstraccion Bajo)
        (Rama Ingeniería_del_Software))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo Extranjero)
        (Matematicas No)
        (Nivel_abstraccion Alto)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo Extranjero)
        (Matematicas No)
        (Nivel_abstraccion Medio)
        (Rama Sistemas_de_Información))
    (Sugerencia 
        (Ambito_trabajo Empresa_privada)
        (Lugar_trabajo Extranjero)
        (Matematicas No)
        (Nivel_abstraccion Bajo)
        (Rama Ingeniería_del_Software))
)


;;;;;;;;;;; Retractar sugerencia

(defrule retractar_sugerencia_calificacion_media
(declare (salience 9999))
?X <- (Sugerencia (Calificacion_media ?valorSuge))
(Calificacion_media ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)

(defrule retractar_sugerencia_trabajador
(declare (salience 9999))
?X <- (Sugerencia (Trabajador ?valorSuge))
(Trabajador ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)

(defrule retractar_sugerencia_matematicas
(declare (salience 9999))
?X <- (Sugerencia (Matematicas ?valorSuge))
(Matematicas ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)

(defrule retractar_sugerencia_hardware
(declare (salience 9999))
?X <- (Sugerencia (Hardware ?valorSuge))
(Hardware ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)

(defrule retractar_sugerencia_programar
(declare (salience 9999))
?X <- (Sugerencia (Programar ?valorSuge))
(Programar ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)

(defrule retractar_sugerencia_ambito_trabajo
(declare (salience 9999))
?X <- (Sugerencia (Ambito_trabajo ?valorSuge))
(Ambito_trabajo ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)

(defrule retractar_sugerencia_lugar_trabajo
(declare (salience 9999))
?X <- (Sugerencia (Lugar_trabajo ?valorSuge))
(Lugar_trabajo ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)

(defrule retractar_sugerencia_asignaturas
(declare (salience 9999))
?X <- (Sugerencia (Asignaturas ?valorSuge))
(Asignaturas ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)

(defrule retractar_sugerencia_nivel_abstraccion
(declare (salience 9999))
?X <- (Sugerencia (Nivel_abstraccion ?valorSuge))
(Nivel_abstraccion ?valor)
(test (and (neq (?valorSuge nil)) (neq (?valorSuge ?valor))))
=>
(retract ?X)
)


;;;;;;;;;;; Reglas de las preguntas

(defrule pregunta_ambito_trabajo
?X <- (SiguientePregunta Ambito_trabajo)
=>
(retract ?X)
(assert (Respuesta Ambito_trabajo))
)

(defrule respuesta_ambito_trabajo
(declare (salience 1))
?X <- (Respuesta Ambito_trabajo)
(Caracteristica Ambito_trabajo ?valor)
=>
(retract ?X)
(switch ?valor
    (case Docencia then (assert (SiguientePregunta Asignaturas)))
    (case Empresa_publica then (assert (SiguientePregunta Programar)))
    (case Empresa_privada then (assert (SiguientePregunta Lugar_trabajo)))
)
)





(defrule pregunta_asignatura
?X <- (SiguientePregunta Asignaturas)
=>
(retract ?X)
(assert (Respuesta Asignaturas))
)

(defrule respuesta_asignatura
(declare (salience 1))
?X <- (Respuesta Asignaturas)
(Caracteristica Asignaturas ?valor)
=>
(retract ?X)
(switch ?valor
    (case Teoricas then (assert (SiguientePregunta Matematicas)))
    (case Practicas then (assert (SiguientePregunta Programar)))
    (case Ambas then 
        (assert (SiguientePregunta Matematicas))
        (assert (SiguientePregunta Programar))
    )
)
)







(defrule pregunta_programar
?X <- (SiguientePregunta Programar)
=>
(retract ?X)
(assert (Respuesta Programar))
)

(defrule respuesta_programar
(declare (salience 1))
?X <- (Respuesta Programar)
(Caracteristica Programar ?valor)
=>
(retract ?X)
(switch ?valor
    (case Si then (assert (SiguientePregunta Calificacion_media)))
    (case No then (assert (SiguientePregunta Nivel_abstraccion)))
)
)






(defrule pregunta_lugar_trabajo
?X <- (SiguientePregunta Lugar_trabajo)
=>
(retract ?X)
(assert (Respuesta Lugar_trabajo))
)

(defrule respuesta_lugar_trabajo
(declare (salience 1))
?X <- (Respuesta Lugar_trabajo)
(Caracteristica Lugar_trabajo ?valor)
=>
(retract ?X)
(switch ?valor
    (case España then (assert (SiguientePregunta Programar)))
    (case Extranjero then (assert (SiguientePregunta Matematicas)))
)
)





(defrule pregunta_matematicas
?X <- (SiguientePregunta Matematicas)
=>
(retract ?X)
(assert (Respuesta Matematicas))
)

(defrule respuesta_matematicas
(declare (salience 1))
?X <- (Respuesta Matematicas)
(Caracteristica Matematicas ?valor)
=>
(retract ?X)
(switch ?valor
    (case Si then 
        (assert (SiguientePregunta Calificacion_media))
        (assert (SiguientePregunta Nivel_abstraccion))
    )
    (case No then 
        (assert (SiguientePregunta Hardware))
        (assert (SiguientePregunta Nivel_abstraccion))
    )
)
)








(defrule pregunta_calificacion_media
?X <- (SiguientePregunta Calificacion_media)
=>
(retract ?X)
(assert (Respuesta Calificacion_media))
)

(defrule respuesta_calificacion_media
(declare (salience 1))
?X <- (Respuesta Calificacion_media)
(Caracteristica Calificacion_media ?valor)
=>
(retract ?X)
(switch ?valor
    (case Alta then nil)
    (case Media then nil)
    (case Baja then 
        (assert (SiguientePregunta Nivel_abstraccion))
    )
)
)







(defrule pregunta_nivel_abstraccion
?X <- (SiguientePregunta Nivel_abstraccion)
=>
(retract ?X)
(assert (Respuesta Nivel_abstraccion))
)

(defrule respuesta_nivel_abstraccion
(declare (salience 1))
?X <- (Respuesta Nivel_abstraccion)
(Caracteristica Nivel_abstraccion ?valor)
=>
(retract ?X)
(switch ?valor
    (case Alto then 
        (assert (SiguientePregunta Trabajador))
    )
    (case Medio then 
        (assert (SiguientePregunta Hardware))
    )
    (case Bajo then 
        (assert (SiguientePregunta Hardware))
    )
)
)







(defrule pregunta_trabajador
?X <- (SiguientePregunta Trabajador)
=>
(retract ?X)
(assert (Respuesta Trabajador))
)

(defrule respuesta_trabajador
(declare (salience 1))
?X <- (Respuesta Trabajador)
(Caracteristica Trabajador ?valor)
=>
(retract ?X)
(switch ?valor
    (case Mucho then nil)
    (case Normal then 
        (assert (SiguientePregunta Hardware))
        (assert (SiguientePregunta Nivel_abstraccion))
    )
    (case Poco then 
        (assert (SiguientePregunta Hardware))
        (assert (SiguientePregunta Nivel_abstraccion))
    )
)
)






(defrule pregunta_hardware
?X <- (SiguientePregunta Hardware)
=>
(retract ?X)
(assert (Respuesta Hardware))
)

(defrule respuesta_hardware
(declare (salience 1))
?X <- (Respuesta Hardware)
(Caracteristica Hardware ?valor)
=>
(retract ?X)
(switch ?valor
    (case Si then 
        (assert (SiguientePregunta Trabajador))
    )
    (case No then 
        (assert (SiguientePregunta Nivel_abstraccion))
    )
)
)