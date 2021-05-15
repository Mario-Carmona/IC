;;;;;;; JUGADOR DE 4 en RAYA ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;; Version de 4 en raya clásico: Tablero de 6x7, donde se introducen fichas por arriba
;;;;;;;;;;;;;;;;;;;;;;; y caen hasta la posicion libre mas abajo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;; Hechos para representar un estado del juego

;;;;;;; (Turno M|J)   representa a quien corresponde el turno (M maquina, J jugador)
;;;;;;; (Tablero Juego ?i ?j _|M|J) representa que la posicion i,j del tablero esta vacia (_), o tiene una ficha propia (M) o tiene una ficha del jugador humano (J)

;;;;;;;;;;;;;;;; Hechos para representar estado del analisis
;;;;;;; (Tablero Analisis Posicion ?i ?j _|M|J) representa que en el analisis actual la posicion i,j del tablero esta vacia (_), o tiene una ficha propia (M) o tiene una ficha del jugador humano (J)
;;;;;;; (Sondeando ?n ?i ?c M|J)  ; representa que estamos analizando suponiendo que la ?n jugada h sido ?i ?c M|J
;;;

;;;;;;;;;;;;; Hechos para representar una jugadas

;;;;;;; (Juega M|J ?columna) representa que la jugada consiste en introducir la ficha en la columna ?columna 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INICIALIZAR ESTADO


(deffacts Estado_inicial
(Tablero Juego 1 1 _) (Tablero Juego 1 2 _) (Tablero Juego 1 3 _) (Tablero Juego  1 4 _) (Tablero Juego  1 5 _) (Tablero Juego  1 6 _) (Tablero Juego  1 7 _)
(Tablero Juego 2 1 _) (Tablero Juego 2 2 _) (Tablero Juego 2 3 _) (Tablero Juego 2 4 _) (Tablero Juego 2 5 _) (Tablero Juego 2 6 _) (Tablero Juego 2 7 _)
(Tablero Juego 3 1 _) (Tablero Juego 3 2 _) (Tablero Juego 3 3 _) (Tablero Juego 3 4 _) (Tablero Juego 3 5 _) (Tablero Juego 3 6 _) (Tablero Juego 3 7 _)
(Tablero Juego 4 1 _) (Tablero Juego 4 2 _) (Tablero Juego 4 3 _) (Tablero Juego 4 4 _) (Tablero Juego 4 5 _) (Tablero Juego 4 6 _) (Tablero Juego 4 7 _)
(Tablero Juego 5 1 _) (Tablero Juego 5 2 _) (Tablero Juego 5 3 _) (Tablero Juego 5 4 _) (Tablero Juego 5 5 _) (Tablero Juego 5 6 _) (Tablero Juego 5 7 _)
(Tablero Juego 6 1 _) (Tablero Juego 6 2 _) (Tablero Juego 6 3 _) (Tablero Juego 6 4 _) (Tablero Juego 6 5 _) (Tablero Juego 6 6 _) (Tablero Juego 6 7 _)
(Jugada 0)
)

(defrule Elige_quien_comienza
=>
(printout t "Quien quieres que empieze: (escribre M para la maquina o J para empezar tu) ")
(assert (Turno (read)))
)

;;;;;;;;;;;;;;;;;;;;;;; MUESTRA POSICION ;;;;;;;;;;;;;;;;;;;;;;;
(defrule muestra_posicion
(declare (salience 10))
(muestra_posicion)
(Tablero Juego 1 1 ?p11) (Tablero Juego 1 2 ?p12) (Tablero Juego 1 3 ?p13) (Tablero Juego 1 4 ?p14) (Tablero Juego 1 5 ?p15) (Tablero Juego 1 6 ?p16) (Tablero Juego 1 7 ?p17)
(Tablero Juego 2 1 ?p21) (Tablero Juego 2 2 ?p22) (Tablero Juego 2 3 ?p23) (Tablero Juego 2 4 ?p24) (Tablero Juego 2 5 ?p25) (Tablero Juego 2 6 ?p26) (Tablero Juego 2 7 ?p27)
(Tablero Juego 3 1 ?p31) (Tablero Juego 3 2 ?p32) (Tablero Juego 3 3 ?p33) (Tablero Juego 3 4 ?p34) (Tablero Juego 3 5 ?p35) (Tablero Juego 3 6 ?p36) (Tablero Juego 3 7 ?p37)
(Tablero Juego 4 1 ?p41) (Tablero Juego 4 2 ?p42) (Tablero Juego 4 3 ?p43) (Tablero Juego 4 4 ?p44) (Tablero Juego 4 5 ?p45) (Tablero Juego 4 6 ?p46) (Tablero Juego 4 7 ?p47)
(Tablero Juego 5 1 ?p51) (Tablero Juego 5 2 ?p52) (Tablero Juego 5 3 ?p53) (Tablero Juego 5 4 ?p54) (Tablero Juego 5 5 ?p55) (Tablero Juego 5 6 ?p56) (Tablero Juego 5 7 ?p57)
(Tablero Juego 6 1 ?p61) (Tablero Juego 6 2 ?p62) (Tablero Juego 6 3 ?p63) (Tablero Juego 6 4 ?p64) (Tablero Juego 6 5 ?p65) (Tablero Juego 6 6 ?p66) (Tablero Juego 6 7 ?p67)
=>
(printout t crlf)
(printout t ?p11 " " ?p12 " " ?p13 " " ?p14 " " ?p15 " " ?p16 " " ?p17 crlf)
(printout t ?p21 " " ?p22 " " ?p23 " " ?p24 " " ?p25 " " ?p26 " " ?p27 crlf)
(printout t ?p31 " " ?p32 " " ?p33 " " ?p34 " " ?p35 " " ?p36 " " ?p37 crlf)
(printout t ?p41 " " ?p42 " " ?p43 " " ?p44 " " ?p45 " " ?p46 " " ?p47 crlf)
(printout t ?p51 " " ?p52 " " ?p53 " " ?p54 " " ?p55 " " ?p56 " " ?p57 crlf)
(printout t ?p61 " " ?p62 " " ?p63 " " ?p64 " " ?p65 " " ?p66 " " ?p67 crlf)
(printout t  crlf)
)


;;;;;;;;;;;;;;;;;;;;;;; RECOGER JUGADA DEL CONTRARIO ;;;;;;;;;;;;;;;;;;;;;;;
(defrule mostrar_posicion
(declare (salience 9999))
(Turno J)
=>
(assert (muestra_posicion))
)

(defrule jugada_contrario
?f <- (Turno J)
=>
(printout t "en que columna introduces la siguiente ficha? ")
(assert (Juega J (read)))
(retract ?f)
)

(defrule juega_contrario_check_entrada_correcta
(declare (salience 1))
?f <- (Juega J ?c)
(test (and (neq ?c 1) (and (neq ?c 2) (and (neq ?c 3) (and (neq ?c 4) (and (neq ?c 5) (and (neq ?c 6) (neq ?c 7))))))))
=>
(printout t "Tienes que indicar un numero de columna: 1,2,3,4,5,6 o 7" crlf)
(retract ?f)
(assert (Turno J))
)

(defrule juega_contrario_check_columna_libre
(declare (salience 1))
?f <- (Juega J ?c)
(Tablero Juego 1 ?c ?X) 
(test (neq ?X _))
=>
(printout t "Esa columna ya esta completa, tienes que jugar en otra" crlf)
(retract ?f)
(assert (Turno J))
)

(defrule juega_contrario_actualiza_estado
?f <- (Juega J ?c)
?g <- (Tablero Juego ?i ?c _)
(Tablero Juego ?j ?c ?X) 
(test (= (+ ?i 1) ?j))
(test (neq ?X _))
=>
(retract ?f ?g)
(assert (Turno M) (Tablero Juego ?i ?c J))
)

(defrule juega_contrario_actualiza_estado_columna_vacia
?f <- (Juega J ?c)
?g <- (Tablero Juego 6 ?c _)
=>
(retract ?f ?g)
(assert (Turno M) (Tablero Juego 6 ?c J))
)


;;;;;;;;;;; ACTUALIZAR  ESTADO TRAS JUGADA DE CLISP ;;;;;;;;;;;;;;;;;;

(defrule juega_clisp_actualiza_estado
?f <- (Juega M ?c)
?g <- (Tablero Juego ?i ?c _)
(Tablero Juego ?j ?c ?X) 
(test (= (+ ?i 1) ?j))
(test (neq ?X _))
=>
(retract ?f ?g)
(assert (Turno J) (Tablero Juego ?i ?c M))
)

(defrule juega_clisp_actualiza_estado_columna_vacia
?f <- (Juega M ?c)
?g <- (Tablero Juego 6 ?c _)
=>
(retract ?f ?g)
(assert (Turno J) (Tablero Juego 6 ?c M))
)

;;;;;;;;;;; CLISP JUEGA SIN CRITERIO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule elegir_jugada_aleatoria
(declare (salience -9998))
?f <- (Turno M)
=>
(assert (Jugar (random 1 7)))
(retract ?f)
)

(defrule comprobar_posible_jugada_aleatoria
?f <- (Jugar ?c)
(Tablero Juego 1 ?c M|J)
=>
(retract ?f)
(assert (Turno M))
)

(defrule clisp_juega_sin_criterio
(declare (salience -9999))
?f<- (Jugar ?c)
=>
(printout t "JUEGO en la columna (sin criterio) " ?c crlf)
(retract ?f)
(assert (Juega M ?c))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;  Comprobar si hay 4 en linea ;;;;;;;;;;;;;;;;;;;;;

(defrule cuatro_en_linea_horizontal
(declare (salience 9999))
(Tablero ?t ?i ?c1 ?jugador)
(Tablero ?t ?i ?c2 ?jugador) 
(test (= (+ ?c1 1) ?c2))
(Tablero ?t ?i ?c3 ?jugador)
(test (= (+ ?c1 2) ?c3))
(Tablero ?t ?i ?c4 ?jugador)
(test (= (+ ?c1 3) ?c4))
(test (or (eq ?jugador M) (eq ?jugador J) ))
=>
(assert (Cuatro_en_linea ?t ?jugador horizontal ?i ?c1))
)

(defrule cuatro_en_linea_vertical
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i1 ?c ?jugador)
(Tablero ?t ?i2 ?c ?jugador)
(test (= (+ ?i1 1) ?i2))
(Tablero ?t ?i3 ?c  ?jugador)
(test (= (+ ?i1 2) ?i3))
(Tablero ?t ?i4 ?c  ?jugador)
(test (= (+ ?i1 3) ?i4))
(test (or (eq ?jugador M) (eq ?jugador J) ))
=>
(assert (Cuatro_en_linea ?t ?jugador vertical ?i1 ?c))
)

(defrule cuatro_en_linea_diagonal_directa
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i ?c ?jugador)
(Tablero ?t ?i1 ?c1 ?jugador)
(test (= (+ ?i 1) ?i1))
(test (= (+ ?c 1) ?c1))
(Tablero ?t ?i2 ?c2  ?jugador)
(test (= (+ ?i 2) ?i2))
(test (= (+ ?c 2) ?c2))
(Tablero ?t ?i3 ?c3  ?jugador)
(test (= (+ ?i 3) ?i3))
(test (= (+ ?c 3) ?c3))
(test (or (eq ?jugador M) (eq ?jugador J) ))
=>
(assert (Cuatro_en_linea ?t ?jugador diagonal_directa ?i ?c))
)

(defrule cuatro_en_linea_diagonal_inversa
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i ?c ?jugador)
(Tablero ?t ?i1 ?c1 ?jugador)
(test (= (+ ?i 1) ?i1))
(test (= (- ?c 1) ?c1))
(Tablero ?t ?i2 ?c2  ?jugador)
(test (= (+ ?i 2) ?i2))
(test (= (- ?c 2) ?c2))
(Tablero ?t ?i3 ?c3  ?jugador)
(test (= (+ ?i 3) ?i3))
(test (= (- ?c 3) ?c3))
(test (or (eq ?jugador M) (eq ?jugador J) ))
=>
(assert (Cuatro_en_linea ?t ?jugador diagonal_inversa ?i ?c))
)

;;;;;;;;;;;;;;;;;;;; DESCUBRE GANADOR
(defrule gana_fila
(declare (salience 9999))
?f <- (Turno ?X)
(Cuatro_en_linea Juego ?jugador horizontal ?i ?c)
=>
(printout t ?jugador " ha ganado pues tiene cuatro en linea en la fila " ?i crlf)
(retract ?f)
(assert (muestra_posicion))
) 

(defrule gana_columna
(declare (salience 9999))
?f <- (Turno ?X)
(Cuatro_en_linea Juego ?jugador vertical ?i ?c)
=>
(printout t ?jugador " ha ganado pues tiene cuatro en linea en la columna " ?c crlf)
(retract ?f)
(assert (muestra_posicion))
) 

(defrule gana_diagonal_directa
(declare (salience 9999))
?f <- (Turno ?X)
(Cuatro_en_linea Juego ?jugador diagonal_directa ?i ?c)
=>
(printout t ?jugador " ha ganado pues tiene cuatro en linea en la diagonal que empieza la posicion " ?i " " ?c   crlf)
(retract ?f)
(assert (muestra_posicion))
) 

(defrule gana_diagonal_inversa
(declare (salience 9999))
?f <- (Turno ?X)
(Cuatro_en_linea Juego ?jugador diagonal_inversa ?i ?c)
=>
(printout t ?jugador " ha ganado pues tiene cuatro en linea en la diagonal hacia arriba que empieza la posicin " ?i " " ?c   crlf)
(retract ?f)
(assert (muestra_posicion))
) 


;;;;;;;;;;;;;;;;;;;;;;;  DETECTAR EMPATE

(defrule empate
(declare (salience 9999))
?X <- (Turno ?j)
(Tablero Juego 1 1 M|J)
(Tablero Juego 1 2 M|J)
(Tablero Juego 1 3 M|J)
(Tablero Juego 1 4 M|J)
(Tablero Juego 1 5 M|J)
(Tablero Juego 1 6 M|J)
(Tablero Juego 1 7 M|J)
=>
(retract ?X)
(printout t "EMPATE! Se ha llegado al final del juego sin que nadie gane" crlf)
)

;;;;;;;;;;;;;;;;;;;;;; CONOCIMIENTO EXPERTO ;;;;;;;;;;

;; Antes de nada he tenido que modificar la regla empate, ya que tenía un prioridad muy baja,
;; y cuando se llegaba a un empate saltaban antes reglas como donde debe colocar la ficha el jugador, 
;; y esto hacía que se quedase en bucle y nunca se ejecutase la regla empate, por ello le he puesto
;; la máxima prioridad y elimino el hecho Turno para dejar de lanzar reglas después de lanzar la regla
;; empate.

;; La extensión del sistema experto que he creado, se divide en tres módulos principales:
;;
;; 1) Deduciones básicas. En esta parte se deducen hechos que nos serán útiles en las siguientes 
;; dos partes, como puede ser deducir cuando dos fichas están conectadas, cuál es la ficha siguiente
;; a una dada siguiendo una dirección, etc.
;;
;; En las deduciones de las conexiones se indica la posición de inicio y fin para evitar
;; diferenciar las distintas conexiones.
;; 
;; 2) Análisis. En esta parte se deducen situaciones que pueden ocurrir al colocar una ficha de 
;; la Máquina o del Jugador en cierta posición. En concreto se deducen las siguientes situaciones:
;;
;;   - Si la Máquina coloca una ficha se crean dos posibles cuatro en raya
;;   - Si la Máquina coloca una ficha se posibilita la victoria del Jugador
;;   - Si el Jugador coloca una ficha se crean dos posibles cuatro en raya
;;   - Se obtiene cual es la columna que nos da más posibilidades de juego
;;
;; 3) Toma de decisiones. En esta parte se elige la columna en la que se introducirá la ficha, 
;; esta elección se basa en todos los hechos deducidos y de las situaciones deducidas del análisis.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  DEDUCIONES BÁSICAS  ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR LA POSICIÓN SIGUIENTE

;; En todas las reglas se pone como antecedente una posición (f,c) y su posible
;; posición siguiente (f1,c1). Para comprobar que si existe esta relación, se realizan
;; unos calculos y unas comprobaciones según la dirección que se haya elegido. Los
;; cálculos consisten en sumar ó restar una unidad a f, ó sumar una unidad a c. Yo 
;; considero que la posición siguiente siempre será la que siga la dirección hacia la
;; derecha del tablero, y en el caso de la dirección vertical la que se encuentre arriba de (f,c).

;;;;;;;;;;;;;;;; Hechos para representar la posición siguiente

;;;;;;; (Siguiente ?f ?c ?direccion ?f1 ?c1)   representa que la posicion (f1,c1) es la siguiente posición a (f,c) 
;;;;;;;                                        siguiendo la dirección ?direccion

(defrule siguiente_posicion_horizontal
(Tablero Juego ?f ?c _)
(Tablero Juego ?f ?c1 _)
(test (= (+ ?c 1) ?c1))
=>
(assert (Siguiente ?f ?c horizontal ?f ?c1))
)

(defrule siguiente_posicion_vertical
(Tablero Juego ?f ?c _)
(Tablero Juego ?f1 ?c _)
(test (= (- ?f 1) ?f1))
=>
(assert (Siguiente ?f ?c vertical ?f1 ?c))
)

(defrule siguiente_posicion_diagonal_directa
(Tablero Juego ?f ?c _)
(Tablero Juego ?f1 ?c1 _)
(test (= (- ?f 1) ?f1))
(test (= (+ ?c 1) ?c1))
=>
(assert (Siguiente ?f ?c diagonal_directa ?f1 ?c1))
)

(defrule siguiente_posicion_diagonal_inversa
(Tablero Juego ?f ?c _)
(Tablero Juego ?f1 ?c1 _)
(test (= (+ ?f 1) ?f1))
(test (= (+ ?c 1) ?c1))
=>
(assert (Siguiente ?f ?c diagonal_inversa ?f1 ?c1))
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR LA POSICIÓN ANTERIOR

;; En todas las reglas se pone como antecedente una posición (f,c) y su posible
;; posición anterior (f1,c1). Para comprobar que sí existe esta relación, se realizan
;; unos calculos y unas comprobaciones según la dirección que se haya elegido. Los
;; cálculos consisten en sumar ó restar una unidad a f, ó restar una unidad a c. Yo 
;; considero que la posición anterior siempre será la que siga la dirección hacia la
;; izquierda del tablero, y en el caso de la dirección vertical la que se encuentre abajo de (f,c).

;;;;;;;;;;;;;;;; Hechos para representar la posición anterior

;;;;;;; (Anterior ?f ?c ?direccion ?f1 ?c1)   representa que la posicion (f1,c1) es la anterior posición a (f,c) 
;;;;;;;                                       siguiendo la dirección ?direccion

(defrule anterior_posicion_horizontal
(Tablero Juego ?f ?c _)
(Tablero Juego ?f ?c1 _)
(test (= (- ?c 1) ?c1))
=>
(assert (Anterior ?f ?c horizontal ?f ?c1))
)

(defrule anterior_posicion_vertical
(Tablero Juego ?f ?c _)
(Tablero Juego ?f1 ?c _)
(test (= (+ ?f 1) ?f1))
=>
(assert (Anterior ?f ?c vertical ?f1 ?c))
)

(defrule anterior_posicion_diagonal_directa
(Tablero Juego ?f ?c _)
(Tablero Juego ?f1 ?c1 _)
(test (= (+ ?f 1) ?f1))
(test (= (- ?c 1) ?c1))
=>
(assert (Anterior ?f ?c diagonal_directa ?f1 ?c1))
)

(defrule anterior_posicion_diagonal_inversa
(Tablero Juego ?f ?c _)
(Tablero Juego ?f1 ?c1 _)
(test (= (- ?f 1) ?f1))
(test (= (- ?c 1) ?c1))
=>
(assert (Anterior ?f ?c diagonal_inversa ?f1 ?c1))
)


;;;;;;;;;;;;;;;;;;;;;;;  MANTENER POSICIONES DE CAIDA

;; Al empezar el programa se cargan por defecto los hechos que indican que la
;; ficha caerá en la última fila, ya que todas las posiciones del tablero están
;; en blanco.

(deffacts Posiciones_de_caida_inicial
(Caeria 6 1) (Caeria 6 2) (Caeria 6 3) (Caeria 6 4)
(Caeria 6 5) (Caeria 6 6) (Caeria 6 7)
)

;; Esta regla se lanzará siempre antes de que alguno de los jugadores coloque la ficha
;; en la posición que indicó, debido a la prioridad igual a 1; para que antes de empezar 
;; el turno siguiente ya esté actualizada para las nuevas deduciones. Para lanzar la 
;; actualización se añade un hecho que lanza la regla correspondiente, se hace de esta 
;; manera para evitar bucles infinitos.

;;;;;;;;;;;;;;;; Hechos para representar la actualización de la posición de caida

;;;;;;; (posicion_caida ?c)    representa que se debe realizar la actualización, y que la 
;;;;;;;                        ficha va a ser introducida en la columna ?c

(defrule actualizar_caida
(declare (salience 1))
(Juega ?j ?c)
=>
(assert (posicion_caida ?c))
)

;; Esta regla consiste en mover una posición hacia arriba la posición de caida de la 
;; ficha en cierta columna.

;;;;;;;;;;;;;;;; Hechos para representar la posición en que caería la ficha en cierta columna

;;;;;;; (Caeria ?f ?c)       representa que si se coloca la ficha en la columna ?c, la ficha se 
;;;;;;;                      quedará en la fila ?f. Si la fila vale 0 quiere decir que la columna
;;;;;;;                      está completa

(defrule posicion_caida
(declare (salience 1))
?Y <- (posicion_caida ?c)
?X <- (Caeria ?f ?c)
=>
(bind ?r (- ?f 1))
(retract ?X ?Y)
(assert (Caeria ?r ?c))
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR CONEXIONES DE DOS FICHAS DEL MISMO JUGADOR

;; Estas reglas se lanzan cuando en cierta posición del tablero ?t hay una ficha de un
;; jugador ?j, y en la posición siguiente ó anterior a esa posición hay una ficha del
;; mismo jugador. Estas dos fichas forman una conexión de dos en linea. Para definir la 
;; conexión de dos fichas se indica la posición de su ficha más a la izquierda y después 
;; la posición de su ficha más a la derecha. En el caso de la dirección vertical, se indica 
;; la posición de la ficha que está abajo y después la posición de la ficha que está arriba.

;;;;;;;;;;;;;;;; Hechos para representar la conexión de dos fichas del mismo jugador

;;;;;;; (Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j)    representa la conexión de dos fichas del jugador ?j en el tablero ?t
;;;;;;;                                         que empieza en la posición (?f1,?c1) y termina en la posición (?f2,?c2)
;;;;;;;                                         siguiendo la dirección ?d

(defrule comprobar_conectado_delante
(Tablero ?t ?f1 ?c1 ?j)
(test (neq ?j _))
(Siguiente ?f1 ?c1 ?d ?f2 ?c2)
(Tablero ?t ?f2 ?c2 ?j)
=>
(assert (Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j))
)

(defrule comprobar_conectado_detras
(Tablero ?t ?f2 ?c2 ?j)
(test (neq ?j _))
(Anterior ?f2 ?c2 ?d ?f1 ?c1)
(Tablero ?t ?f1 ?c1 ?j)
=>
(assert (Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR UN HECHO QUE INDICA LA CONEXIÓN DE DOS FICHAS DEL MISMO JUGADOR

;; Esta regla se lanza cuando existe un hecho Conectado que ha dejado de ser verdad, esta situación 
;; sólo puede suceder si el Conectado ha sido deducido de los tableros de análisis, ya que al mover 
;; la ficha de una columan a otra queda una posición en blanco en el Conectado; por lo que hay que 
;; detectar si algún Conectado tiene posiciones en blanco.

(defrule retractar_conectado
(declare (salience 9999))
?X <- (Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j)
(Tablero ?t ?f1 ?c1 ?j1)
(Tablero ?t ?f2 ?c2 ?j2)
(test (or (neq ?j1 ?j) (neq ?j2 ?j)))
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR CONEXIONES DE TRES FICHAS DEL MISMO JUGADOR

;; Estas reglas se lanzan cuando en cierta posición del tablero ?t hay conectadas dos 
;; fichas de un jugador ?j, y en la posición siguiente ó anterior a esa posición hay 
;; una ficha del mismo jugador. Estas tres fichas forman una conexión de tres en linea. 
;; Para definir la conexión de tres fichas se indica la posición de su ficha más a la 
;; izquierda y después la posición de su ficha más a la derecha. En el caso de la dirección 
;; vertical, se indica la posición de la ficha que está más abajo y después la posición 
;; de la ficha que está más arriba.

;;;;;;;;;;;;;;;; Hechos para representar la conexión de tres fichas del mismo jugador

;;;;;;; (Tres_en_linea ?t ?d ?f1 ?c1 ?f3 ?c3 ?j)    representa la conexión de tres fichas del jugador ?j en el tablero ?t,
;;;;;;;                                             que empieza en la posición (?f1,?c1) y termina en la posición (?f3,?c3)
;;;;;;;                                             siguiendo la dirección ?d

(defrule comprobar_3_en_linea_delante
(Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Tablero ?t ?f3 ?c3 ?j)
=>
(assert (Tres_en_linea ?t ?d ?f1 ?c1 ?f3 ?c3 ?j))
)

(defrule comprobar_3_en_linea_detras
(Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j)
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero ?t ?f0 ?c0 ?j)
=>
(assert (Tres_en_linea ?t ?d ?f0 ?c0 ?f2 ?c2 ?j))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR UN HECHO QUE INDICA LA CONEXIÓN DE TRES FICHAS DEL MISMO JUGADOR

;; Esta regla se lanza cuando existe un hecho Tres_en_linea que ha dejado de ser verdad, esta situación 
;; sólo puede suceder si el Tres_en_linea ha sido deducido de los tableros de análisis, ya que al mover 
;; la ficha de una columan a otra queda una posición en blanco en el Tres_en_linea; por lo que hay que 
;; detectar si algún Tres_en_linea tiene posiciones en blanco.

(defrule retractar_tres_en_linea
(declare (salience 9999))
?X <- (Tres_en_linea ?t ?d ?f1 ?c1 ?f3 ?c3 ?j)
(Siguiente ?f1 ?c1 ?d ?f2 ?c2)
(Tablero ?t ?f1 ?c1 ?j1)
(Tablero ?t ?f2 ?c2 ?j2)
(Tablero ?t ?f3 ?c3 ?j3)
(test (or (or (neq ?j1 ?j) (neq ?j2 ?j)) (neq ?j3 ?j)))
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR SITUACION EN QUE ESTAMOS A UNA FICHA DE GANAR

;; Estas reglas se lanzan cuando existe una de estas cuatro situaciones (las reglas que tienen en cuenta cada
;; situación están en el mismo orden en que se describen las distintas situaciones):
;;
;; - Existe una conexión de tres fichas del mismo jugador y en la posición siguiente
;;   hay una posición en blanco y que además es la posición de caída de la ficha
;;   si se introduce en la columna del espacio en blanco. Ej: MMM_
;; - Existe una conexión de tres fichas del mismo jugador y en la posición anterior
;;   hay una posición en blanco y que además es la posición de caída de la ficha
;;   si se introduce en la columna del espacio en blanco. Ej: _MMM
;; - Existe una conexión de dos fichas del mismo jugador, la siguiente posición a la
;;   conexión, es una posición en blanco, que además en la posición de caida de la
;;   ficha en esa columna; y además la siguiente posición a la posición en blanco está
;;   ocupada por una ficha del mismo jugador que tiene la conexión de dos. Ej: MM_M
;; - Existe una conexión de dos fichas del mismo jugador, la anterior posición a la
;;   conexión, es una posición en blanco, que además en la posición de caida de la
;;   ficha en esa columna; y además la anterior posición a la posición en blanco está
;;   ocupada por una ficha del mismo jugador que tiene la conexión de dos. Ej: M_MM


;; En el caso de que se deduzca del tablero de juego

;;;;;;;;;;;;;;;; Hecho para representar la situación en que un jugador se puede convertir en ganador
;;;;;;;;;;;;;;;; en el tablero de juego

;;;;;;; (PosibleVictoria ?f1 ?c1 ?f4 ?c4 ?j ?f ?c)   representa la posibilidad de ganar del jugador ?j, si introduce
;;;;;;;                                              una ficha en la columna ?c en el tablero de juego. Además se indica
;;;;;;;                                              información del posible cuatro en linea, como la posición de 
;;;;;;;                                              inicio (?f1, ?c1) y la posición final (?f4, ?c4), y la fila ?f donde 
;;;;;;;                                              debe colocarse la ficha

(defrule comprobar_posible_victoria_delante
(Tres_en_linea Juego ?d ?f1 ?c1 ?f3 ?c3 ?j)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero Juego ?f4 ?c4 _)
(Caeria ?f4 ?c4)
=>
(assert (PosibleVictoria ?f1 ?c1 ?f4 ?c4 ?j ?f4 ?c4))
)

(defrule comprobar_posible_victoria_detras
(Tres_en_linea Juego ?d ?f1 ?c1 ?f3 ?c3 ?j)
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero Juego ?f0 ?c0 _)
(Caeria ?f0 ?c0)
=>
(assert (PosibleVictoria ?f0 ?c0 ?f3 ?c3 ?j ?f0 ?c0))
)

(defrule comprobar_posible_victoria_en_medio_delante
(Conectado Juego ?d ?f1 ?c1 ?f2 ?c2 ?j)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Tablero Juego ?f3 ?c3 _)
(Caeria ?f3 ?c3)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero Juego ?f4 ?c4 ?j)
=>
(assert (PosibleVictoria ?f1 ?c1 ?f4 ?c4 ?j ?f3 ?c3))
)

(defrule comprobar_posible_victoria_en_medio_detras
(Conectado Juego ?d ?f2 ?c2 ?f3 ?c3 ?j)
(Anterior ?f2 ?c2 ?d ?f1 ?c1)
(Tablero Juego ?f1 ?c1 _)
(Caeria ?f1 ?c1)
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero Juego ?f0 ?c0 ?j)
=>
(assert (PosibleVictoria ?f0 ?c0 ?f3 ?c3 ?j ?f1 ?c1))
)

;; En el caso de que se deduzca de alguno de los tablero de análisis

;;;;;;;;;;;;;;;; Hecho para representar la situación en que un jugador se puede convertir en ganador
;;;;;;;;;;;;;;;; en el tablero de análisis

;;;;;;; (PosibleVictoriaTemporal ?t ?f1 ?c1 ?f4 ?c4 ?j ?f ?c ?num)   representa la posibilidad de ganar del jugador ?j, si introduce
;;;;;;;                                                              una ficha en la columna ?c en el tablero de análisis ?t. Además 
;;;;;;;                                                              se indica información del posible cuatro en linea, como la posición de 
;;;;;;;                                                              inicio (?f1, ?c1) y la posición final (?f4, ?c4), la iteración ?num
;;;;;;;                                                              en que se generó, y la fila ?f donde debe colocarse la ficha

(defrule comprobar_posible_victoria_temporal_delante
(Contador ?num)
(Tres_en_linea ?t ?d ?f1 ?c1 ?f3 ?c3 ?j)
(test (neq ?t Juego))
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero ?t ?f4 ?c4 _)
(Caeria ?f4 ?c4)
(not (Tablero Analisis_J ?f ?c ?j2))
=>
(assert (PosibleVictoriaTemporal ?t ?f1 ?c1 ?f4 ?c4 ?j ?f4 ?c4 ?num))
)

(defrule comprobar_posible_victoria_temporal_detras
(Contador ?num)
(Tres_en_linea ?t ?d ?f1 ?c1 ?f3 ?c3 ?j)
(test (neq ?t Juego))
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero ?t ?f0 ?c0 _)
(Caeria ?f0 ?c0)
=>
(assert (PosibleVictoriaTemporal ?t ?f0 ?c0 ?f3 ?c3 ?j ?f0 ?c0 ?num))
)

(defrule comprobar_posible_victoria_temporal_en_medio_delante
(Contador ?num)
(Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j)
(test (neq ?t Juego))
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Tablero ?t ?f3 ?c3 _)
(Caeria ?f3 ?c3)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero ?t ?f4 ?c4 ?j)
=>
(assert (PosibleVictoriaTemporal ?t ?f1 ?c1 ?f4 ?c4 ?j ?f3 ?c3 ?num))
)

(defrule comprobar_posible_victoria_temporal_en_medio_detras
(Contador ?num)
(Conectado ?t ?d ?f2 ?c2 ?f3 ?c3 ?j)
(test (neq ?t Juego))
(Anterior ?f2 ?c2 ?d ?f1 ?c1)
(Tablero ?t ?f1 ?c1 _)
(Caeria ?f1 ?c1)
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero ?t ?f0 ?c0 ?j)
=>
(assert (PosibleVictoriaTemporal ?t ?f0 ?c0 ?f3 ?c3 ?j ?f1 ?c1 ?num))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR UN HECHO QUE INDICA QUE UN JUGADOR ESTÁ A UNA FICHA DE GANAR

;; Estas reglas se lanzan cuando existe un hecho PosibleVictoria ó PosibleVictoriaTemporal que han 
;; dejado de ser verdad, esto puede ser debido a dos situaciones:

;; 1) En la posición que faltaba para completar el 4 en raya, se ha colocado una ficha del jugador 
;; contrario. Esto es posible que pase ya que este hecho se está deduciendo todo el rato, sin importar
;; de que jugador sea el turno en ese momento. Para comprobarlo se comprueba el valor de la casilla
;; que falta para completar el cuatro en raya.

(defrule retractar_posible_victoria_M
(declare (salience 9999))
?X <- (PosibleVictoria ?f1 ?c1 ?f4 ?c4 M ?f ?c)
(Tablero ?t ?f ?c J)
=>
(retract ?X)
)

(defrule retractar_posible_victoria_J
(declare (salience 9999))
?X <- (PosibleVictoria ?f1 ?c1 ?f4 ?c4 J ?f ?c)
(Tablero ?t ?f ?c M)
=>
(retract ?X)
)

;; 2) En este caso se trata de hechos PosibleVictoriaTemporal que han sido creado como consecuencia
;; de colocar una ficha en el análisis para comprobar como afectaría a la partida. Al mover
;; esta ficha de columna este hecho se convertirá en falso, pero esta vez no porque el jugador
;; contrario haya colocado una ficha para pararlo, sino porque hay dos posiciones en blanco
;; en la posible conexión de cuatro en línea. Por ello se comprueba si el valor del contador es
;; distinto al valor de la columna en que se generó el hecho, porque esto quiere decir que hemos
;; pasado de iteración y a dejado de ser verdad el hecho.

(defrule retractar_posible_victoria_temporal
(declare (salience 9999))
(Contador ?num)
?X <- (PosibleVictoriaTemporal ?t ?f1 ?c1 ?f4 ?c4 ?j ?f ?c ?cont)
(test (neq ?num ?cont))
=>
(retract ?X)
)

;; Estas reglas tiene la máxima prioridad para evitar errores en la toma de decisiones a la hora de colocar la 
;; ficha por parte de la máquina.



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  ANALISIS DEL TABLERO  ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Para el análisis se han creado dos tableros, uno para la máquina y otro para el Jugador.
;; El análisis consiste en comprobar que sucede si colocamos la ficha de un jugador en cierta
;; posición. En cada análisis se realizan 8 iteraciones, una por cada columna más la última 
;; iteración que es para extraer la información más relevente del análisis para la posterior 
;; toma de decisiones. En cada iteración se coloca un ficha de la Máquina en el tablero de 
;; análisis de la Máquina y lo mismo se hace con el Jugador pero en su tablero de análisis.


;;;;;;;;;;;;;;;;;;;;;;;  CREAR LOS HECHOS QUE COMPONEN LOS TABLEROS DE ANALISIS

;; En esta regla se van creando los hechos Tablero para el tablero Analisis_J y Analisis_M, copiando el valor 
;; de la casilla equivalente del tablero de Juego. Sólo se crea esta posición en el tablero Analisis_J ó Analisis_M
;; si todavía no existe una posición con ese valor de fila y columna en el tablero Analisis_J ó Analisis_M.

;;;;;;;;;;;;;;;; Hechos para representar la posición en el tablero de análisis del Jugador

;;;;;;; (Tablero ?t ?f ?c ?j)   representa que en la posicion con fila ?f y columna ?c del tablero 
;;;;;;;                         ?t hay una ficha del tipo ?j. 

(defrule crear_tablero_analisis_J
(Tablero Juego ?f ?c ?j1)
(not (Tablero Analisis_J ?f ?c ?j2))
=>
(assert (Tablero Analisis_J ?f ?c ?j1))
)

(defrule crear_tablero_analisis_M
(Tablero Juego ?f ?c ?j1)
(not (Tablero Analisis_M ?f ?c ?j2))
=>
(assert (Tablero Analisis_M ?f ?c ?j1))
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR Y RETRACTAR LOS HECHOS DE LAS POSICIONES DE LOS TABLEROS DE ANALISIS

;; Con esta regla se va actualizando el tablero de análisis del Jugador y de la Máquina, en función de los 
;; cambios que se hagan en el tablero de Juego. Si una posición en el tablero de Juego cambia de valor, lanza el
;; antecedente, y como consecuencia se borra el valor actual de esa posición en el tablero de análisis
;; del Jugador ó de la Máquina, y se añade el hecho que indica el nuevo valor.

;;;;;;;;;;;;;;;; Hechos para representar la posición en el tablero de análisis del Jugador

;;;;;;; (Tablero ?t ?f ?c ?j)   representa que en la posicion con fila ?f y columna ?c del tablero 
;;;;;;;                         ?t hay una ficha del tipo ?j.

(defrule actualizar_tablero_analisis
(Tablero Juego ?f ?c ?j1)
?X <- (Tablero ?t ?f ?c ?j2)
(test (and (neq ?j1 _) (neq ?j1 ?j2)))
=>
(retract ?X)
(assert (Tablero ?t ?f ?c ?j1))
)


;;;;;;;;;;;;;;;;;;;;;;;  INICIAR EL PRIMER PROCESO DE ANALISIS

;; Con esta regla se inicia el proceso de análisis por primera vez. Para iniciar el proceso
;; se añade el hecho Analizando, para indicar su ejecución; se añade el hecho Contador, para
;; indicar la iteración que se está ejecutando, se añaden las fichas correspondientes en la
;; primera columna de cada tablero de análisis, en el tablero del Jugador una ficha del Jugador
;; , y en el de la Máquina una ficha de la Máquina; y por último se añade la puntuación de una 
;; columna, en este caso la columan 1.

;;;;;;;;;;;;;;;; Hechos para representar el inicio del proceso de análisis

;;;;;;; (Analizando)                       representa que se está realizando el análisis
;;;;;;; (Contador ?num)                    representa la columna que se está simulando
;;;;;;; (Tablero Analisis_J ?f ?c ?j)      representa que en la posicion con fila ?f y columna ?c del tablero 
;;;;;;;                                    Analisis_J hay una ficha del tipo ?j.
;;;;;;; (Tablero Analisis_M ?f ?c ?j)      representa que en la posicion con fila ?f y columna ?c del tablero 
;;;;;;;                                    Analisis_M hay una ficha del tipo ?j. 
;;;;;;; (Puntuacion ?num ?contador)        representa el número ?num de posibilidades de construir un cuatro en linea
;;;;;;;                                    de la Máquina, que pasan por la columna ?contador

(defrule iniciar_primer_analisis
(Turno M)
(not (Analizando))
(not (Contador ?num))
(Caeria ?f 1)
?X <- (Tablero Analisis_J ?f 1 _)
?Y <- (Tablero Analisis_M ?f 1 _)
=>
(retract ?X ?Y)
(assert (Analizando))
(assert (Contador 1))
(assert (Tablero Analisis_J ?f 1 J))
(assert (Tablero Analisis_M ?f 1 M))
(assert (Puntuacion 0 1))
)


;;;;;;;;;;;;;;;;;;;;;;;  INICIAR EL RESTO DE PROCESOS DE ANALISIS

;; La única diferencia entre el primer análisis y el resto de análisis es la necesidad de borrar cierta
;; información del análisis de la jugada anterior. La información a borrar es el Contador.
;;
;; Además pueden ocurrir dos situaciones:
;;
;; 1) La primera columna del tablero está completa, por lo que no es posible colocar ni la ficha de la Máquina,
;;    ni la ficha del Jugador. Para esta situación se lanza la regla llamada "iniciar_resto_analisis_saltando".
;;    En esta situación no se añaden los hechos Tablero de ambas fichas, ni los hechos Puntuacion; sólo se añade 
;;    el Contador y el hecho Analizando.
;;
;; 2) La primera columna del tablero no está completa, por lo que se añade la misma información que en el 
;;    primer análisis.

;;;;;;;;;;;;;;;; Hechos para representar el inicio del proceso de análisis

;;;;;;; (Analizando)                       representa que se está realizando el análisis
;;;;;;; (Contador ?num)                    representa la columna que se está simulando
;;;;;;; (Tablero Analisis_J ?f ?c ?j)      representa que en la posicion con fila ?f y columna ?c del tablero 
;;;;;;;                                    Analisis_J hay una ficha del tipo ?j.
;;;;;;; (Tablero Analisis_M ?f ?c ?j)      representa que en la posicion con fila ?f y columna ?c del tablero 
;;;;;;;                                    Analisis_M hay una ficha del tipo ?j. 
;;;;;;; (Puntuacion ?num ?contador)        representa el número ?num de posibilidades de construir un cuatro en linea
;;;;;;;                                    de la Máquina encontrados en la simulación de la columna ?contador

(defrule iniciar_resto_analisis_sin_saltar
(Turno M)
(not (Analizando))
?X <- (Contador ?num)
(Caeria ?f 1)
?Y <- (Tablero Analisis_J ?f 1 _)
?Z <- (Tablero Analisis_M ?f 1 _)
(test (<> ?f 0))
=>
(retract ?X ?Y ?Z)
(assert (Analizando))
(assert (Contador 1))
(assert (Tablero Analisis_J ?f 1 J))
(assert (Tablero Analisis_M ?f 1 M))
(assert (Puntuacion 0 1))
)

(defrule iniciar_resto_analisis_saltando
(Turno M)
(not (Analizando))
?X <- (Contador ?num)
(Caeria ?f 1)
(test (= ?f 0))
=>
(retract ?X)
(assert (Analizando))
(assert (Contador 1))
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR LAS CONEXIONES DE CUATRO POSICIONES SIN FICHAS DEL JUGADOR

;; Esta regla consisten en crear un hecho por cada posicion que forme parte de una conexión
;; de cuatro posiciones en las que no hay fichas del Jugador, por lo que si se completan esas
;; cuatro posiciones con fichas de la Máquina, la Máquina podría ganar.

;;;;;;;;;;;;;;;; Hecho para representar una conexión de cuatro posiciones

;;;;;;; (LineaLibre ?d ?f_ini ?c_ini ?f ?c)    representa una posición de una conexión
;;;;;;;                                        de cuatro posiciones que empiezan en la
;;;;;;;                                        posición (?f_ini, ?c_ini) y que tiene la 
;;;;;;;                                        dirección ?d

(defrule obtener_linea_libre
(Contador ?num)
(Caeria ?f ?num)
(Tablero Analisis_M ?f1 ?c1 M|_)
(Siguiente ?f1 ?c1 ?d ?f2 ?c2)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero Analisis_M ?f2 ?c2 M|_)
(Tablero Analisis_M ?f3 ?c3 M|_)
(Tablero Analisis_M ?f4 ?c4 M|_)
=>
(assert (LineaLibre ?d ?f1 ?c1 ?f1 ?c1))
(assert (LineaLibre ?d ?f1 ?c1 ?f2 ?c2))
(assert (LineaLibre ?d ?f1 ?c1 ?f3 ?c3))
(assert (LineaLibre ?d ?f1 ?c1 ?f4 ?c4))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR LAS CONEXIONES DE CUATRO POSICIONES SIN FICHAS DEL JUGADOR

;; Esta regla elimina los hechos cuando se ha colocado una ficha del Jugador
;; en alguna de las cuatro posiciones de la conexión, se eliminan los cuatro 
;; hechos que representan la conexión.

(defrule retractar_linea_libre
(declare (salience 9999))
(Tablero Analisis_M ?f1 ?c1 J)
(LineaLibre ?d ?f_ini ?c_ini ?f1 ?c1)
(Siguiente ?f_ini ?c_ini ?d ?f2 ?c2)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
?X <- (LineaLibre ?d ?f_ini ?c_ini ?f_ini ?c_ini)
?Y <- (LineaLibre ?d ?f_ini ?c_ini ?f2 ?c2)
?Z <- (LineaLibre ?d ?f_ini ?c_ini ?f3 ?c3)
?T <- (LineaLibre ?d ?f_ini ?c_ini ?f4 ?c4)
=>
(retract ?X ?Y ?Z ?T)
)


;;;;;;;;;;;;;;;;;;;;;;;  AUMENTAR LA PUNTUACION DE UNA COLUMNA

;; Esta regla consiste en sumar una unidad al hecho que almacena la puntuación de una columna 
;; en el análisis, si existen cuatro posiciones consecutivas con fichas de la Máquina o en blanco
;; y que además pasen por la posición donde se ha colocado la ficha de la Máquina en la iteración 
;; actual. Esta puntuación se tiene para elegir la mejor posición, ya que yo como experto 
;; eligo siempre la columna que me permite tener mayor posibilidades de formar un 4 en raya.
;; Por ejemplo: al empezar la partida la posición central será la más valorada, ya que es muy
;; importante para manejar la partida después.

;;;;;;;;;;;;;;;; Hecho para representar el incremento en una unidad de la puntuación

;;;;;;; (IncrePuntuacion)   representa el incremento en una unidad de la puntuación de la
;;;;;;;                     columna de la iteración actual

(defrule aumentar_puntuacion
(Analizando)
(Contador ?num)
(Caeria ?f ?num)
(LineaLibre ?d ?f_ini ?c_ini ?f ?num)
=>
(assert (IncrePuntuacion))
)

;; Esta regla consiste en realizar el incremento en una unidad de la puntuación de la
;; columna de la iteración actual.

;;;;;;;;;;;;;;;; Hecho para representar la puntuación de una columna

;;;;;;; (Puntuacion ?num ?contador)    representa el número ?num de posibilidades de construir un cuatro en linea
;;;;;;;                                de la Máquina encontrados en la simulación de la columna ?contador

(defrule incre_puntuacion
(Contador ?num)
?X <- (IncrePuntuacion)
?Y <- (Puntuacion ?aux ?num)
=>
(retract ?X ?Y)
(bind ?newaux (+ ?aux 1))
(assert (Puntuacion ?newaux ?num))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR LA PUNTUACION DE UNA COLUMNA

;; Esta regla elimina el hecho puntuación del análisis de la Máquina durante el turno del Jugador

(defrule retractar_puntuacion
(declare (salience 9999))
(Turno J)
?X <- (Puntuacion ?num ?c)
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR UNA FUTURA VICTORIA DE LA MÁQUINA

;; Esta regla consiste en comprobar si en el tablero de análisis de la Máquina
;; se han generado al menos dos posibles victorias de la Máquina al colocar la ficha de la Máquina.
;; Si se encuentra esto indica que si la Máquina coloca la ficha en esa columna se 
;; ganará seguro ya que el Jugador no podrá parar dos posible cuatro en raya a la vez.

;;;;;;;;;;;;;;;; Hecho para representar una futura victoria de la Máquina

;;;;;;; (FuturaPosibleVictoria M ?num)   representa la futura victoria de la Máquina
;;;;;;;                                  si se coloca la ficha de la Máquina en la columna
;;;;;;;                                  ?num

(defrule obtener_futura_victoria
(Analizando)
(Contador ?num)
(PosibleVictoriaTemporal Analisis_M ?f1_a ?c1_a ?f4_a ?c4_a M ?f_a ?c_a ?num)
(PosibleVictoriaTemporal Analisis_M ?f1_b ?c1_b ?f4_b ?c4_b M ?f_b ?c_b ?num)
(test (or (neq ?f1_a ?f1_b) (neq ?c1_a ?c1_b)))
=>
(assert (FuturaPosibleVictoria M ?num))
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR UNA FUTURA VICTORIA DEL JUGADOR

;; Esta regla consiste en comprobar si en el tablero de análisis del Jugador
;; se han generado al menos dos posibles victorias del Jugador al colocar la ficha del Jugador.
;; Si se encuentra esto indica que si el Jugador coloca la ficha en esa columna se 
;; deberá impedir que el Jugador coloque la ficha en esa columna, ya que sino la 
;; Máquina no podrá evitar la derrota.

;;;;;;;;;;;;;;;; Hecho para representar una futura victoria del Jugador

;;;;;;; (FuturaPosibleVictoria J ?num)   representa la futura victoria del Jugador
;;;;;;;                                  si se coloca la ficha del Jugador en la columna
;;;;;;;                                  ?num

(defrule aumentar_puntos_negativos
(Analizando)
(Contador ?num)
(PosibleVictoriaTemporal Analisis_J ?f1_a ?c1_a ?f4_a ?c4_a J ?f_a ?c_a ?num)
(PosibleVictoriaTemporal Analisis_J ?f1_b ?c1_b ?f4_b ?c4_b J ?f_b ?c_b ?num)
(test (or (neq ?f1_a ?f1_b) (neq ?c1_a ?c1_b)))
=>
(assert (FuturaPosibleVictoria J ?num))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR UNA FUTURA VICTORIA

;; Esta regla elimina los hechos de una futura victoria deducida en el análisis
;; de la Máquina. Se eliminan en el turno del Jugador.

(defrule retractar_futura_posible_victoria
(declare (salience 9999))
(Turno J)
?X <- (FuturaPosibleVictoria ?j ?c)
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;  VETAR COLUMNA EN EL PROCESO DE ANALISIS

;; Estas reglas consisten en eliminar una columna del proceso de análisis. Una columna es 
;; vetada si al colocar la ficha de la Máquina en el tablero de análisis de la Máquina, se
;; crea una PosibleVictoria del Jugador, y la posición en la que tiene que colocar el Jugador
;; la ficha para ganar es la posición encima de la ficha de la Máquina, colocada en la iteración 
;; actual. Vetar una columna consiste en eliminar la Puntuacion columna, para que sólo pueda
;; ser elegida si hay una futura victoria del Jugador. Tiene una prioridad de 1 
;; para vetar antes de que algunas deduciones se lanzen.

(defrule vetar_jugada_analisis
(declare (salience 1))
(Analizando)
(Contador ?num)
(Caeria ?f5 ?num)
(PosibleVictoria ?f1 ?c1 ?f4 ?c4 J ?f5 ?num ?num)
?X <- (Puntuacion ?aux ?num)
=>
(retract ?X)
(assert (Vetar ?num))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR VETO DE UNA COLUMNA

;; Esta columna elimina el hecho que indica que se ha vetado una columna, 
;; se elimina el hecho al cambiar de iteración.

(defrule retractar_vetar
(declare (salience 9999))
(Contador ?num1)
?X <- (Vetar ?num2)
(test (neq ?num1 ?num2))
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR HECHOS INCREMENTAR PUNTUACION

;; Estas reglas eliminan los hechos IncrementarPuntuacion ó FuturaPosibleVictoria
;; que se pueden crear después de haber vetado esa columna

(defrule eliminar_incre_puntuacion_de_columna_vetada
(Contador ?num)
(Vetar ?num)
?X <- (IncrePuntuacion)
=>
(retract ?X)
)

(defrule eliminar_futura_posible_victoria
(Contador ?num)
(Vetar ?num)
(Contador ?num)
?X <- (FuturaPosibleVictoria ?j ?num)
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;  ITERAR EN EL ANALISIS

;; Al empezar el programa se cargan por defecto los hechos que indican cúal es
;; el resultado de incrementar o decrementar en uno un número. He creado estos hechos
;; porque me estaban dando errores algunos cálculos dentro de las reglas.

(deffacts Valores_de_incremento
(Incre 1 2) (Incre 2 3) (Incre 3 4) (Incre 4 5) 
(Incre 5 6) (Incre 6 7) (Incre 7 8)
)

(deffacts Valores_de_decremento
(Decre 6 5) (Decre 5 4) (Decre 4 3) 
(Decre 3 2) (Decre 2 1) (Decre 1 0)
)

;; Al ahora de pasar de una iteración a otra nos podemos encontrar con diferentes situaciones,
;; las cuáles he divido en diferentes grupos, teniendo cada uno su regla:
;;
;;   - Cuando se pasa de una columna sin completar, a otra columna sin completar
;;   - Cuando se pasa de una columna sin completar, a una columna completa
;;   - Cuando se pasa de una columna sin completar, a la iteración final
;;   - Cuando se pasa de una columna completa, a la iteración final
;;   - Cuando se pasa de una columna en la que se encuentra una futura victoria
;;     de la Máquina, a la iteración final
;;   - Cuando se pasa de una columna completa, a otra columna completa
;;   - Cuando se pasa de una columna completa, a una columna sin completar
;;   
;; Las siguientes reglas implementan estas situaciones en el mismo orden en el que aparecen.


;; Esta regla cambia de iteración, lo cuál conlleva el incremento del contador en 
;; una unidad y el cambio de posición de la ficha del Jugador introducida en la 
;; iteración anterior. Para cambiar la ficha se elimina la ficha introducida en la
;; iteración anterior y se añade otra en la posición de caida del nuevo contador.
;; Esta regla sólo se lanza si el contador al incrementarlo es distinto de 8, ya que
;; si esto se cumple quiere decir que hemos terminado el proceso de análisis, y cuando
;; la columna a la que vamos a pasar no está completa. Tiene prioridad -1 para que se 
;; lanze después de haber realizado todas deduciones de la iteración.

;;;;;;;;;;;;;;;; Hechos para representar el cambio de iteración

;;;;;;; (Tablero Analisis ?f1 ?num _)      representa una posición del tablero de análisis con valor de fila ?f1
;;;;;;;                                    , valor de columna ?num y que está en blanco. Esta es la posición
;;;;;;;                                    que en la anterior iteración tenía la ficha del Jugador.
;;;;;;; (Tablero Analisis ?f2 ?i J)        representa una posición del tablero de análisis con valor de fila ?f2
;;;;;;;                                    , valor de columna ?i y que contiene una ficha del Jugador. Esta es la posición
;;;;;;;                                    que contiene en esta iteración la ficha del Jugador.
;;;;;;; (Contador ?i)                      representa el nuevo contador del análisis. Se está iterando la columna ?i

(defrule aumentar_contador_sin_saltar_iter
(declare (salience -1))
(Analizando)
?X <- (Contador ?num)
(Incre ?num ?i)
(test (<> ?i 8))
(Caeria ?f1 ?num)
(Caeria ?f2 ?i)
(test (<> ?f2 0))
?Y <- (Tablero Analisis_J ?f1 ?num J)
?Z <- (Tablero Analisis_J ?f2 ?i _)
?T <- (Tablero Analisis_M ?f1 ?num M)
?R <- (Tablero Analisis_M ?f2 ?i _)
=>
(retract ?X ?Y ?Z ?T ?R)
(assert (Tablero Analisis_J ?f1 ?num _))
(assert (Tablero Analisis_J ?f2 ?i J))
(assert (Tablero Analisis_M ?f1 ?num _))
(assert (Tablero Analisis_M ?f2 ?i M))
(assert (Contador ?i))
(assert (Puntuacion 0 ?i))
)

;; Esta regla se lanza cuando la columna a la que se pasa está completa, por
;; lo que sólo se elimina la ficha introducida en la iteración anterior y 
;; no se añade una nueva ficha.

(defrule aumentar_contador_con_saltar_iter
(declare (salience -1))
(Analizando)
?X <- (Contador ?num)
(Incre ?num ?i)
(test (<> ?i 8))
(Caeria ?f1 ?num)
(Caeria ?f2 ?i)
(test (= ?f2 0))
?Y <- (Tablero Analisis_J ?f1 ?num J)
?Z <- (Tablero Analisis_M ?f1 ?num M)
=>
(retract ?X ?Y ?Z)
(assert (Tablero Analisis_J ?f1 ?num _))
(assert (Tablero Analisis_M ?f1 ?num _))
(assert (Contador ?i))
)

;; Esta regla cambia de iteración, pero se trata de un caso especial, ya que es la 
;; última iteración. En esta regla no se mueve la ficha del jugador introducida en la 
;; anterior iteración, sino que sólo se elimina.

;;;;;;;;;;;;;;;; Hechos para representar el cambio de iteración

;;;;;;; (Tablero Analisis ?f ?num _)       representa una posición del tablero de análisis con valor de fila ?f
;;;;;;;                                    , valor de columna ?num y que está en blanco. Esta es la posición
;;;;;;;                                    que en la anterior iteración tenía la ficha del Jugador.
;;;;;;; (Contador ?i)                      representa el nuevo contador del análisis. Se está iterando la columna ?i

(defrule ultimo_contador_sin_saltar
(declare (salience -1))
(Analizando)
?X <- (Contador ?num)
(Incre ?num ?i)
(test (= ?i 8))
(Caeria ?f ?num)
(test (neq ?f 0))
?Y <- (Tablero Analisis_J ?f ?num J)
?Z <- (Tablero Analisis_M ?f ?num M)
=>
(retract ?X ?Y ?Z)
(assert (Tablero Analisis_J ?f ?num _))
(assert (Tablero Analisis_M ?f ?num _))
(assert (Contador ?i))
)

;; Esta regla se lanza cuando antes de llegar a la iteración 8 se ha estado
;; saltando por columnas llenas, por lo que no se elimina ni se añade ninguna ficha.

(defrule ultimo_contador_saltando
(declare (salience -1))
(Analizando)
?X <- (Contador ?num)
(Incre ?num ?i)
(test (= ?i 8))
(Caeria ?f ?num)
(test (eq ?f 0))
=>
(retract ?X)
(assert (Contador ?i))
)

;; Esta regla no lleva a la última iteración cuando se ha generado el hecho
;; que indica una futura victoria de la Máquina, es la mejor opción que encontraremos
;; en el análisis.

(defrule saltar_a_ultimo_contador
(declare (salience -1))
(Analizando)
?X <- (Contador ?num)
(Caeria ?f ?num)
(FuturaPosibleVictoria M ?num)
?Y <- (Tablero Analisis_J ?f ?num J)
?Z <- (Tablero Analisis_M ?f ?num M)
=>
(retract ?X ?Y ?Z)
(assert (Tablero Analisis_J ?f ?num _))
(assert (Tablero Analisis_M ?f ?num _))
(assert (Contador 8))
)

;; Esta regla cambia de iteración para saltarse una iteración en la que no hace falta simular
;; una columna porque se encuentra completa, esto se puede comprobar con la posición de caida
;; de la columna, que debe ser 0 si está completa. Tiene prioridad 1 para que se lanze antes 
;; que cualquiera de las deduciones.

;;;;;;;;;;;;;;;; Hechos para representar el cambio de iteración

;;;;;;; (Contador ?i)     representa el nuevo contador del análisis. Se está iterando la columna ?i

(defrule saltar_iteracion_no_final_caso_1
(declare (salience 1))
(Analizando)
?X <- (Contador ?num)
(test (<> ?num 8))
(Caeria ?f1 ?num)
(test (= ?f1 0))
(Incre ?num ?i)
(Caeria ?f2 ?i)
(test (= ?f2 0))
=>
(retract ?X)
(assert (Contador ?i))
)

;; Esta regla se lanza a diferencia de la anterior cuando se salta de una columna completa
;; a una que no lo está, por lo que si que habrá que añadir las fichas a los tableros y
;; la puntuación de la columna.

(defrule saltar_iteracion_no_final_caso_2
(declare (salience 1))
(Analizando)
?X <- (Contador ?num)
(test (<> ?num 8))
(Caeria ?f1 ?num)
(test (= ?f1 0))
(Incre ?num ?i)
(Caeria ?f2 ?i)
(test (<> ?f2 0))
?Y <- (Tablero Analisis_J ?f2 ?i _)
?Z <- (Tablero Analisis_M ?f2 ?i _)
=>
(retract ?X ?Y ?Z)
(assert (Tablero Analisis_J ?f2 ?i J))
(assert (Tablero Analisis_M ?f2 ?i M))
(assert (Contador ?i))
(assert (Puntuacion 0 ?i))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;  Obtener la mejor posición del tablero

;; Esta regla elimina las puntuaciones más bajas, y se queda con
;; columna que tenga una puntuación mayor, ya que la máquina
;; siempre pondrá la ficha en la posición con más posibilidades de
;; creación, cuando no tenga evitar una derrota o generar una victoria.

(defrule obtener_jugada_con_mayor_puntuacion
(Analizando)
(Contador ?num)
(test (= ?num 8))
?X <- (Puntuacion ?aux1 ?num1)
(Puntuacion ?aux2 ?num2)
(test (neq ?num1 ?num2))
(test (<= ?aux1 ?aux2))
=>
(retract ?X)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  ACCIONES A REALIZAR EN BASE A LOS HECHOS  ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Esta regla se lanza cuando colocando una ficha gana la Máquina

(defrule ganar_partida
(declare (salience -2))
?Y <- (Turno M)
(PosibleVictoria ?f1 ?c1 ?f4 ?c4 M ?f ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)

;; Esta regla se lanza cuando colocando una ficha evita perder la Máquina

(defrule salvar_partida
(declare (salience -3))
?Y <- (Turno M)
(PosibleVictoria ?f1 ?c1 ?f4 ?c4 J ?f ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)

;; Esta regla se lanza cuando colocando una ficha la Máquina
;; genera una futura victoria asegurada para ella

(defrule ganar_partida_analisis
(declare (salience -4))
?Y <- (Turno M)
(FuturaPosibleVictoria M ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)

;; Esta regla se lanza cuando colocando una ficha la Máquina
;; evita una futura victoria asegurada del Jugador

(defrule salvar_partida_analisis
(declare (salience -5))
?Y <- (Turno M)
(FuturaPosibleVictoria J ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)

;; Esta regla coloca la ficha en posición mejor valorada según
;; los criterios del experto

(defrule mejor_posicion_analisis
(declare (salience -6))
?Y <- (Turno M)
(Puntuacion ?num ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)


(defrule mensaje_eleccion
(declare (salience 9998))
(Juega M ?num)
=>
(printout t "JUEGO en la columna (con criterio) " ?num crlf)
)






