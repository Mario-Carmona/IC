;   (load "H:/clase/ic/practicas/entrega1/practica3/ejercicio3.clp")

;;;;; PRACTICA 3
;; SISTEMA EXPERTO SIMPLE

;;  Estructura en if-else del programa
;   if (nota alta) {
;       if (prefiere teoricas) {
;           Recomiendo CSI
;       } else if (prefiere practicas) {
;           Recomiendo IS
;       } else {
;           if (gusta mates) {
;               Recomiendo CSI
;           } else if (no gusta mates) {
;               Recomiendo IS
;           } else {
;               Recomiendo IS
;           }
;       }
;   } else if (nota media) {
;       if (gusta mates) {
;           if (prefiere teoricas) {
;               Recomiendo CSI
;           } else {
;               if (trabaja mucho) {
;                   Recomiendo CSI
;               } else {
;                   Recomiendo IS
;               }
;           }
;       } else {
;           if (gusta hardware) {
;               Recomiendo IC
;           } else {
;               if (prefiere practicas) {
;                   Recomiendo TI
;               } else {
;                   Recomiendo SI
;               }
;           }
;       }
;   } else if (nota baja) {
;       if (gusta hardware) {
;           Recomiendo IC
;       } else {
;           Recomiendo TI
;       }
;   } else if (suspenso) {
;       No recomiendo hacer una rama
;   }


;Cada regla tiene como antecedentes las condiciones de los ifs. Por ejemplo, si tiene nota media, no le gustan las mates, no le gusta el hardware y prefiere prácticas, la regla es asi:

;(defrule NotaMedia_NoGustaMates_NoGustaHardware_PrefierePracticas
;    (GustaInformatica SI)
;    (Nota MEDIA)
;    (GustaMates NO)
;    (GustaHardware NO)
;    (Prefiere PRACTICAS)
;=>
;    ...
;)




(deffacts Estado_inicial
    (PrimeraPregunta)
)


;; Pregunta si le gusta la informatica
(defrule GustaInformatica
    ?r <- (PrimeraPregunta)
=>
    (retract ?r)
    (printout t "Te gusta la informatica? (SI/NO/NSNC): ")
    (assert (GustaInformatica (read)))
)

;; Se asegura que la respuesta es valida
(defrule GustaInformatica_NoValida
    ?r <- (GustaInformatica ?ans)
    (test (neq ?ans SI))
    (test (neq ?ans NO))
    (test (neq ?ans NSNC))
=>
    (printout t "Lo siento, no entiendo la respuesta. Responde (SI/NO/NSNC): ")
    (retract ?r)
    (assert (GustaInformatica (read)))
)



; SI LE GUSTA LA INFORMATICA

;; Pregunta por la nota
(defrule QueNotaTiene
    (GustaInformatica SI)
=>
    (printout t "Que nota media tienes? ")
    (assert (Media (read)))
)

;; Se asegura que la respuesta es valida
(defrule QueNotaTieneNoValida
    ?f <- (Media ?c)
    (test (or (< ?c 0) (> ?c 10)))
=>
    (printout t "Esa nota no me vale, dame una nota del 1 al 10 (o NC (No Contesta)): ")
)

;; Clasifica la nota en ALTA MEDIA BAJA
(defrule QueNotaTieneAlta
    (Media ?c)
    (test (>= ?c 8))
=>
    (assert (Nota ALTA))
)

(defrule QueNotaTieneMedia
    (Media ?c)
    (test (and (>= ?c 6.5) (< ?c 8)))
=>
    (assert (Nota MEDIA))
)

(defrule QueNotaTieneBaja
    (Media ?c)
    (test (and (>= ?c 5) (< ?c 6.5)))
=>
    (assert (Nota BAJA))
)

;; Si no tiene más de 5 de media, no recomiendo ninguna rama
(defrule MenosDeCinco
    (Media ?c)
    (test (< ?c 5))
=>
    (printout t "No creo que sea buena elegir una rama..." crlf)
)



;;;;; TIENE NOTA ALTA

;; Pregunta si prefiere asignaturas practicas o teoricas
(defrule NotaAlta
    (GustaInformatica SI)
    (Nota ALTA)
=>
    (printout t "Prefieres asignaturas teoricas o practicas? (TEORICAS/PRACTICAS/NSNC): ")
    (assert (Prefiere (read)))
)

;; Se asegura que la respuesta es valida
(defrule NotaAlta_NoValida
    (GustaInformatica SI)
    (Nota ALTA)
    ?f <- (Prefiere ?p)
    (test (neq ?p TEORICAS))
    (test (neq ?p PRACTICAS))
    (test (neq ?p NSNC))
=>
    (printout t "Perdona, no te entiendo. Por favor, responde (TEORICAS/PRACTICAS/NSNC): ")
    (retract ?f)
    (assert (Prefiere (read)))
)

;; Si prefiere teoricas, recomienda CSI
(defrule NotaAlta_PrefiereTeoricas
    (GustaInformatica SI)
    (Nota ALTA)
    (Prefiere TEORICAS)
=>
    (printout t "Te recomiendo la rama de CSI porque tienes buena nota (que la necesitas para entrar) y te gustan las asignaturas teóricas (como Aprendizaje Automatico :D)" crlf)
)

;; Si prefiere practicas, recomienda IS
(defrule NotaAlta_PrefierePracticas
    (GustaInformatica SI)
    (Nota ALTA)
    (Prefiere PRACTICAS)
=>
    (printout t "Te recomiendo la rama de IS, ya que tienes buena nota (la necesitas para poder entrar) y te gustan las asignaturas prácticas!" crlf)
)

;; Si no sabe lo que prefiere, pregunta si le gustan las mates
(defrule NotaAlta_PrefiereNSNC
    (GustaInformatica SI)
    (Nota ALTA)
    (Prefiere NSNC)
=>
    (printout t "Te gustan las mates? (SI/NO/NSNC): ")
    (assert (GustaMates (read)))
)

;; Se asegura que la respuesta es valida
(defrule NotaAlta_PrefiereNSNC_NoValida
    (GustaInformatica SI)
    (Nota ALTA)
    (Prefiere NSNC)
    ?f <- (GustaMates ?p)
    (test (neq ?p SI))
    (test (neq ?p NO))
    (test (neq ?p NSNC))
=>
    (printout t "Perdona, no te entiendo. Por favor, responde (SI/NO/NSNC): ")
    (assert (GustaMates (read)))
)

;; Si le gustan las mates, recomienda CSI
(defrule NotaAlta_PrefiereNSNC_GustaMates
    (GustaInformatica SI)
    (Nota ALTA)
    (Prefiere NSNC)
    (GustaMates SI)
=>
    (printout t "Te recomiendo la rama de CSI. Tienes buena nota, asi que no vas a tener problema para entrar y como te gustan las mates, creo que te puede ir bien en esta rama" crlf)
)

;; Si no le gustan las mates, recomienda IS
(defrule NotaAlta_PrefiereNSNC_NoGustaMates
    (GustaInformatica SI)
    (Nota ALTA)
    (Prefiere NSNC)
    (GustaMates NO)
=>
    (printout t "Te recomiendo la rama de IS. Tienes buena nota, asi que no vas a tener problema para entrar y en principio no hay muchas matematicas..." crlf)
)

;; Si no sabe si le gustan las mates, recomienda IS
(defrule NotaAlta_PrefiereNSNC_NSNCGustaMates
    (GustaInformatica SI)
    (Nota ALTA)
    (Prefiere NSNC)
    (GustaMates NSNC)
=>
    (printout t "Te recomiendo la rama de IS. Tienes buena nota, asi que no vas a tener problema para entrar." crlf)
)



;;;;; TIENE NOTA MEDIA
;; Pregunta si le gustan las mates
(defrule NotaMedia
    (GustaInformatica SI)
    (Nota MEDIA)
=>
    (printout t "Te gustan las mates? (SI/NO/NSNC): ")
    (assert (GustaMates (read)))
)

;; Se asegura que la respuesta es valida
(defrule NotaMedia_NoValida
    (GustaInformatica SI)
    (Nota MEDIA)
    ?f <- (GustaMates ?x)
    (test (neq ?x SI))
    (test (neq ?x NO))
    (test (neq ?x NSNC))
=>
    (printout t "Lo siento, no te he entendido. Por favor, responde (SI/NO/NSNC): ")
    (retract ?f)
    (assert (GustaMates (read)))
)

;; Pregunta si prefiere asignaturas teoricas o practicas
(defrule NotaMedia_GustaMates
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
=>
    (printout t "Prefieres las asignaturas teoricas o practicas? (TEORICAS/PRACTICAS/NSNC): ")
    (assert (Prefiere (read)))
)

;; Se asegura que la respuesta es valida
(defrule NotaMedia_GustaMates_NoValida
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
    ?f <- (Prefiere ?x)
    (test (neq ?x TEORICAS))
    (test (neq ?x PRACTICAS))
    (test (neq ?x NSNC))
=>
    (printout t "Lo siento, no te he entendido. Por favor, responde (TEORICAS/PRACTICAS/NSNC): ")
    (retract ?f)
    (assert (Prefiere (read)))
)

;; Si prefiere las asignaturas teoricas, recomienda CSI
(defrule NotaMedia_GustaMates_PrefiereTeoricas
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
    (Prefiere TEORICAS)
=>
    (printout t "Te recomiendo CSI. Seguramente tengas nota suficiente para entrar y te gustan las mates y las asignaturas teoricas, asi que te lo pasaras bien (:" crlf)
)

;; Si prefiere las asignaturas practicas, pregunta si es trabajador
(defrule NotaMedia_GustaMates_PrefierePracticas
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
    (Prefiere PRACTICAS)
=>
    (printout t "Te consideras trabajador? (MUCHO/POCO/NSNC): ")
    (assert (Trabajador (read)))
)

;; Si no sabe si prefiere practicas o teoricas, le hago las mismas preguntas que si le gustan las practicas
(defrule NotaMedia_GustaMates_PrefiereNSNC
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
    ?f <- (Prefiere NSNC)
=>
    (retract ?f)
    (assert (Prefiere PRACTICAS))
)

;; Se asegura que la respuesta es valida
(defrule NotaMedia_GustaMates_PrefierePracticas_NoValida
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
    (Prefiere PRACTICAS)
    ?f <- (Trabajador ?x)
    (test (neq ?x MUCHO))
    (test (neq ?x POCO))
    (test (neq ?x NSNC))
=>
    (printout t "Lo siento, no te he entendido. Por favor, responde (MUCHO/POCO/NSNC): ")
    (retract ?f)
    (assert (Trabajador (read)))
)

;; Si es muy trabajador, recomienda la rama de CSI
(defrule NotaMedia_GustaMates_PrefierePracticas_MuyTrabajador
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
    (Prefiere PRACTICAS)
    (Trabajador MUCHO)
=>
    (printout t "Te recomiendo la rama de CSI. Tienes suficiente nota para entrar, te gustan las mates y eres muy trabajador." crlf)
)

;; Si es poco trabajador, recomienda IS
(defrule NotaMedia_GustaMates_PrefierePracticas_PocoTrabajador
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
    (Prefiere PRACTICAS)
    (Trabajador POCO)
=>
    (printout t "Te recomiendo la rama de IS. Tienes nota para entrar y te gustan las practicas. Solo tienes que apretar un poco al trabajar!" crlf)
)

;; Si no es ni muy trabajador ni poco trabajador, recomienda IS
(defrule NotaMedia_GustaMates_PrefierePracticas_NSNCTrabajador
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates SI)
    (Prefiere PRACTICAS)
    (Trabajador NSNC)
=>
    (printout t "Te recomiendo la rama de IS. Tienes suficiente nota para entrar y te gustan las asignaturas practicas." crlf)
)

;; No sabe si le gustan las mates, le pregunto como si no le gustaran
(defrule NotaMedia_NSNCMates
    (GustaInformatica SI)
    (Nota MEDIA)
    ?f <- (GustaMates NSNC)
=>
    (retract ?f)
    (assert (GustaMates NO))
)

;; Si no le gustan las mates, pregunto si le gusta el hardware
(defrule NotaMedia_NoGustaMates
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates NO)
=>
    (printout t "Te gusta el hardware? (SI/NO/NSNC): ")
    (assert (GustaHardware (read)))
)

;; Se asegura que la respuesta es valida
(defrule NotaMedia_NoGustaMates_NoValida
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates NO)
    ?f <- (GustaHardware ?x)
    (test (neq ?x SI))
    (test (neq ?x NO))
    (test (neq ?x NSNC))
=>
    (printout t "Lo siento, no te he entendido. Por favor, responde (SI/NO/NSNC): ")
    (retract ?f)
    (assert (GustaHardware (read)))
)

;; Si le gusta el hardware, le recomiendo IC
(defrule NotaMedia_NoGustaMates_GustaHardware
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates NO)
    (GustaHardware SI)
=>
    (printout t "Te recomiendo IC porque te gusta el hardware!" crlf)
)

;; Si no sabe si le gusta el hardware, recomienda IC de una forma sutil
(defrule NotaMedia_NoGustaMates_NSNCGustaHardware
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates NO)
    (GustaHardware NSNC)
=>
    (printout t "Podrias darle una oportunidad a la rama de IC..." crlf)

)

;; Si no le gusta el hardware, pregunta si prefiere asignaturas teoricas o practicas
(defrule NotaMedia_NoGustaMates_NoGustaHardware
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates NO)
    (GustaHardware NO)
=>
    (printout t "Prefieres asignaturas teoricas o practicas? (TEORICAS/PRACTICAS): ")
    (assert (Prefiere (read)))
)

;; Se asegura que la respuesta es valida
(defrule NotaMedia_NoGustaMates_NoGustaHardware_NoValida
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates NO)
    (GustaHardware NO)
    ?f <- (Prefiere ?x)
    (test (neq ?x TEORICAS))
    (test (neq ?x PRACTICAS))
=>
    (printout t "Lo siento, no te he entendido. Por favor, responde (TEORICAS/PRACTICAS): ")
    (retract ?f)
    (assert (Prefiere (read)))
)

;; Si prefiere las asignaturas teoricas, recomiendo SI
(defrule NotaMedia_NoGustaMates_NoGustaHardware_PrefiereTeoricas
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates NO)
    (GustaHardware NO)
    (Prefiere TEORICAS)
=>
    (printout t "Te recomiendo SI porque tienes nota suficiente, no te gustan las mates, no te gusta el hardware y prefieres las asignaturas teoricas" crlf)
)

;; Si prefiere las asignaturas practicas, recomiendo TI
(defrule NotaMedia_NoGustaMates_NoGustaHardware_PrefierePracticas
    (GustaInformatica SI)
    (Nota MEDIA)
    (GustaMates NO)
    (GustaHardware NO)
    (Prefiere PRACTICAS)
=>
    (printout t "Te recomiendo TI porque tienes nota suficiente, no te gustan las mates, no te gusta el hardware y prefieres las asignaturas practicas" crlf)
)



;;;;; TIENE NOTA BAJA

;; Pregunta si le gusta el hardware
(defrule NotaBaja
    (GustaInformatica SI)
    (Nota BAJA)
=>
    (printout t "Te gusta el hardware? (SI/NO/NSNC): ")
    (assert (GustaHardware (read)))
)

;; Se asegura que la respuesta es valida
(defrule NotaBaja_NoValida
    (GustaInformatica SI)
    (Nota BAJA)
    ?f <- (GustaHardware ?x)
    (test (neq ?x SI))
    (test (neq ?x NO))
    (test (neq ?x NSNC))
=>
    (printout t "Lo siento, no te he entendido. Por favor, responde (SI/NO/NSNC): ")
    (assert (GustaHardware (read)))
)

;; Si le gusta el hardware, recomienda IC
(defrule NotaBaja_GustaHardware
    (GustaInformatica SI)
    (Nota BAJA)
    (GustaHardware SI)
=>
    (printout t "IC! IC! IC!" crlf)
)

;; Si no sabe si le gusta el hardware, hace propaganda de IC
(defrule NotaBaja_NSNCGustaHardware
    (GustaInformatica SI)
    (Nota BAJA)
    (GustaHardware NSNC)
=>
    (printout t "Puedes darle una oportunidad a IC..." crlf)
)

;; Si no le gusta el hardware, recomienda TI
(defrule NotaBaja_NoGustaHardware
    (GustaInformatica SI)
    (Nota BAJA)
    (GustaHardware NO)
=>
    (printout t "Te recomiendo TI. No vas a tener problemas para entrar y tiene menos hardware que IC...")
)



;; Tonterias

; NO LE GUSTA LA INFORMATICA
(defrule QueHacesAquiEntonces
    (GustaInformatica NO)
=>
    (printout t "Por que estas haciendo el test entonces?" crlf)
)

; NO SABE SI LE GUSTA LA INFORMATICA
(defrule Assembly
    (GustaInformatica NSNC)
=>
    (printout t "section	.text" crlf)
    (printout t "   global_start   ;must be declared for linker (ld)" crlf)
    (printout t "	" crlf)
    (printout t "_start:	          ;tells linker entry point" crlf)
    (printout t "   mov	edx,len   ;message length" crlf)
    (printout t "   mov	ecx,msg   ;message to write" crlf)
    (printout t "   mov	ebx,1     ;file descriptor (stdout)" crlf)
    (printout t "   mov	eax,4     ;system call number (sys_write)" crlf)
    (printout t "   int	0x80      ;call kernel" crlf)
    (printout t "	" crlf)
    (printout t "   mov	eax,1     ;system call number (sys_exit)" crlf)
    (printout t "   int	0x80      ;call kernel" crlf)
    (printout t "" crlf)
    (printout t "section	.data" crlf)
    (printout t "msg db 'Hello, world!', 0xa  ;string to be printed" crlf)
    (printout t "len equ $ - msg     ;length of the string" crlf crlf)
    
    (printout t "Te he asustado? (SI/NO): ")
    (assert (Asustado (read)))
)


(defrule AssemblyNoValida
(declare (salience -1))
    ?r <- (Asustado ?)
=>
    (printout t "Lo siento, no entiendo la respuesta. Responde (SI/NO): ")
    (retract ?r)
    (assert (Asustado (read)))
)

(defrule AssemblyAsustado
    (Asustado SI)
=>
    (printout t "No te preocupes, yo tambien." crlf)
    (printout t "Haz otra carrera mejor" crlf)
)

(defrule AssemblyNoAsustado
    ?f <- (GustaInformatica NSNC)
    ?g <- (Asustado NO)
=>
    (printout t "Bueno, bueno, entonces te invito a que hagas el test" crlf)
    (retract ?f ?g)
    (assert (GustaInformatica SI))
)