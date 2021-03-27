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
(declare (salience -9999))
(Turno ?X)
(Tablero Juego 1 1 M|J)
(Tablero Juego 1 2 M|J)
(Tablero Juego 1 3 M|J)
(Tablero Juego 1 4 M|J)
(Tablero Juego 1 5 M|J)
(Tablero Juego 1 6 M|J)
(Tablero Juego 1 7 M|J)
=>
(printout t "EMPATE! Se ha llegado al final del juego sin que nadie gane" crlf)
)

;;;;;;;;;;;;;;;;;;;;;; CONOCIMIENTO EXPERTO ;;;;;;;;;;


;; En este sistema experto he creado unas cuántas reglas que realizan deduciones básicas
;; sobre el estado del juego todo el rato. En estas deduciones básicas se detectan los casos
;; en que nos falta una ficha para ganar ó una ficha para perder, por lo que actuán sobre el 
;; estado de juego más inmediato.
;;
;; Además durante el turno de la máquina se realiza una proceso de análisis, que deduce situaciones
;; que no son tan inmediatas. En el caso de mi análisis, se comprueba el estado de juego tras jugar
;; una ficha de la máquina. Con este análisis es posible prevenir a la máquina de situaciones en las
;; que el jugador contrario tiene dos posibles 4 en raya, por lo que es imposible salvar la partida;
;; de situaciones en las que colocando una ficha se posibilita la victoria del jugador contrario, al
;; darle acceso a posiciones nuevas donde colocar la ficha, en concreto la posición de encima de la ficha
;; colocada. No todos los escenarios de encontrarse con dos posibles victorias del jugador contrario
;; se pueden prevenir, ya que sólo se analiza hasta cierto nivel de juego, sin profundizar demasiado.
;; Además de prevenir, el análisis le sirve a la máquina para saber en que posición es más recomendable
;; colocar la ficha en base al número de posibles conexiones con la nueva ficha.


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  DEDUCIONES  ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR LA POSICIÓN SIGUIENTE

;; En todas las reglas se pone como antecedente una posición (f,c) y su posible
;; posición siguiente (f1,c1). Para comprobar que si existe esta relación, se realizan
;; unos calculos y unas comprobaciones según la dirección que se haya elegido. Los
;; cálculos consisten en sumar o restar una unidad a f, ó sumar una unidad a c. Yo 
;; considero que la posición siguiente siempre será la que siga la dirección hacia la
;; derecha del tablero, y en el caso de la dirección vertical la que se encuentre arriba de (f,c).
;; Con el test explícitamente se comprueba si la posición siguiente forma parte del tablero, porque
;; si no el antecedente del hecho de tipo Tablero de la posición siguiente sería falso.

;;;;;;;;;;;;;;;; Hechos para representar la posición siguiente

;;;;;;; (Siguiente ?f ?c ?direccion ?f1 ?c1)   representa que la posicion f1,c1 es la siguiente posición a f,c siguiendo la direccion indicada en el hecho

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
;; posición anterior (f1,c1). Para comprobar que si existe esta relación, se realizan
;; unos calculos y unas comprobaciones según la dirección que se haya elegido. Los
;; cálculos consisten en sumar o restar una unidad a f, ó restar una unidad a c. Yo 
;; considero que la posición anterior siempre será la que siga la dirección hacia la
;; izquierda del tablero, y en el caso de la dirección vertical la que se encuentre abajo de (f,c).
;; Con el test explícitamente se comprueba si la posición anterior forma parte del tablero, porque
;; si no el antecedente del hecho de tipo Tablero de la posición anterior sería falso.

;;;;;;;;;;;;;;;; Hechos para representar la posición anterior

;;;;;;; (Anterior ?f ?c ?direccion ?f1 ?c1)   representa que la posicion f1,c1 es la siguiente posición a f,c siguiendo la direccion indicada en el hecho

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
;; en la posición que indicó, para lanzar la actualización se añade un hecho que lanza 
;; la regla correspondientes, se hace de esta manera para evitar bucles infinitos. Una
;; vez que se cambia se posibilita la ejecución de la regla posicion_caida, que consiste
;; en mover una posición hacia arriba la posición de caida de la ficha en cierta columna.

;;;;;;;;;;;;;;;; Hechos para representar la posición en que caería la ficha en cierta columna

;;;;;;; (posicion_caida ?c)    representa que se debe realizar la actualización, y que la ficha va a ser introducida en la
;;;;;;;                        columna ?c
;;;;;;;
;;;;;;; (Caeria ?f ?c)       representa que si se coloca la ficha en la columna ?c, la ficha se quedará en la fila ?f. Si la 
;;;;;;;                      fila vale 0 quiere decir que la columna está completa

(defrule actualizar_caida
(declare (salience 1))
(Juega ?j ?c)
=>
(assert (posicion_caida ?c))
)

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

;; Estas reglas se lanzan cuando en cierta posición del tablero hay una ficha de un
;; jugador, y en la posición siguiente ó anterior a esa posición hay una ficha del
;; mismo jugador. Estas dos fichas forman una conexión de dos en linea. Las conexiones
;; siempre empiezan por la posición más a la izquierda, y terminan en la posición más
;; a la derecha. En el caso de la dirección vertical, empiezan abajo y terminan arriba.

;;;;;;;;;;;;;;;; Hechos para representar la conexión de dos fichas del mismo jugador

;;;;;;; (Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j)    representa la conexión de dos fichas del jugador ?j en el tablero ?t
;;;;;;;                                         que empieza en la posición (?f1,?c1) y termina en la posición (?f2,?c2)
;;;;;;;                                         siguiendo la dirección ?d

(defrule comprobar_conectaniveldo_delante
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


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR CONEXIONES DE TRES FICHAS DEL MISMO JUGADOR

;; Estas reglas se lanzan cuando en cierta posición del tablero hay conectadas dos fichas de un
;; jugador, y en la posición siguiente ó anterior a esa posición hay una ficha del
;; mismo jugador. Estas tres fichas forman una conexión de tres en linea. Las conexiones
;; siempre empiezan por la posición más a la izquierda, y terminan en la posición más
;; a la derecha. En el caso de la dirección vertical, empiezan abajo y terminan arriba.

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


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR QUE CONEXIONES DE DOS ELEMENTOS ESTAN INCLUIDAS EN CONEXIONES DE TRES ELEMENTOS

;; Esta regla se lanza cuando existe una conexión de dos elementos, cuyos elementos
;; también forman parte de otra conexión de tres elementos del mismo jugador. Al
;; lanzarse la regla, como consecuencia se elimina la conexión de dos elementos.

(defrule eliminar_conexion_inclu_en_otra
?X <- (Conectado ?t ?d ?fa1 ?ca1 ?fa2 ?ca2 ?j)
(Tres_en_linea ?t ?d ?fb1 ?cb1 ?fb3 ?cb3 ?j)
(test (and (<= ?fb1 ?fa1) (<= ?fa1 ?fb3)))
(test (and (<= ?cb1 ?ca1) (<= ?ca1 ?cb3)))
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR SITUACION EN QUE ESTAMOS A UNA FICHA DE GANAR

;; Estas reglas se lanzan cuando existe una conexión de tres fichas del mismo jugador,
;; y además la posición siguiente o anterior, siguiendo la dirección de la conexión de
;; tres fichas, está en blanco. Además esa posición en blanco debe ser la posición en la
;; que caería la ficha si se introduce en la columna de la posición en blanco.

;;;;;;;;;;;;;;;; Hecho para representar la situación en que un jugador se puede convertir en ganador

;;;;;;; (PosibleVictoria ?j ?c)    representa la posibilidad de ganar del jugador ?j, si introduce
;;;;;;;                            una ficha en la columna ?c

(defrule comprobar_posible_victoria_delante
(Tres_en_linea Juego ?d ?f1 ?c1 ?f3 ?c3 ?j)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero Juego ?f4 ?c4 _)
(Caeria ?f4 ?c4)
=>
(assert (PosibleVictoria ?j ?c4))
)

(defrule comprobar_posible_victoria_detras
(Tres_en_linea Juego ?d ?f1 ?c1 ?f3 ?c3 ?j)
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero Juego ?f0 ?c0 _)
(Caeria ?f0 ?c0)
=>
(assert (PosibleVictoria ?j ?c0))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR UN HECHO QUE INDICA QUE UN JUGADOR ESTÁ A UNA FICHA DE GANAR

;; Esta regla se lanza cuando existe un hecho "PosibleVictoria ?jugador ?columna", y en la posición
;; que faltaba para completar el 4 en raya, se ha colocado una ficha del jugador contrario.
;; Esto es posible que pase ya que este hecho se está deduciendo todo el rato, sin importar
;; de que jugador se ha el turno en ese momento. Al lanzarse la regla, como consecuencia se
;; borra el hecho que indica la posibilidad de ganar. 

(defrule retractar_posible_victoria
(declare (salience 9999))
?X <- (PosibleVictoria ?j1 ?c4)
(Tres_en_linea ?t ?d ?f1 ?c1 ?f3 ?c3 ?j1)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero ?t ?f4 ?c4 ?j2)
(test (and (neq ?j2 ?j1) (neq ?j2 _)))
=>
(retract ?X)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  ANALISIS DEL TABLERO  ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;  CREAR LOS HECHOS QUE COMPONEN EL TABLERO DE ANALISIS

;; En esta regla se van creando los hechos Tablero para el analisis, copiando el valor de la
;; casilla equivalente en el tablero de Juego. Sólo se crea esta posición en el tablero de
;; análisis, si todavía no existe una posición con ese valor de fila y columna en el tablero de
;; análisis.

;;;;;;;;;;;;;;;; Hechos para representar la posición en el tablero de análisis

;;;;;;; (Tablero Analisis ?f ?c ?j)   representa que en la posicion con fila f y columna c, hay una
;;;;;;;                               ficha del tipo ?j, que puede ser de la máquina, del jugador, ó
;;;;;;;                               estar en blanco. 

(defrule crear_tablero_analisis
(Tablero Juego ?f ?c ?j1)
(not (Tablero Analisis ?f ?c ?j2))
=>
(assert (Tablero Analisis ?f ?c ?j1))
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR Y RETRACTAR LOS HECHOS DE LAS POSICIONES DEL TABLERO DE ANALISIS

;; Con esta regla se va actualizando el valor del tablero de análisis, en función de los cambios que
;; se hagan en el tablero de Juego. Si una posición en el tablero de Juego cambia de valor, lanza el
;; antecedente, y como consecuencia se borra el valor actual de esa posición en el tablero de análisis, 
;; y se añade el hecho que indica el nuevo valor.

;;;;;;;;;;;;;;;; Hechos para representar la posición siguiente

;;;;;;; (Tablero Analisis ?f ?c ?j)   representa que en la posicion con fila f y columna c, hay una
;;;;;;;                               ficha del tipo ?j, que puede ser de la máquina, del jugador, ó
;;;;;;;                               estar en blanco. 

(defrule actualizar_tablero_analisis
(Tablero Juego ?f ?c ?j1)
?X <- (Tablero Analisis ?f ?c ?j2)
(test (and (neq ?j1 _) (neq ?j1 ?j2)))
=>
(retract ?X)
(assert (Tablero Analisis ?f ?c ?j1))
)


;;;;;;;;;;;;;;;;;;;;;;;  INICIAR EL PROCESO DE ANALISIS

;; Con esta regla se inicia el proceso de análisis por primera vez, en el cuál 
;; se simula los efectos de colocar una ficha de un jugador en cierta posición. En 
;; cada iteración se coloca una ficha del Jugador en cada una de las columnas,
;; por lo que hay tantas iteraciones como columnas en las que se pueda colocar
;; una ficha. Al colocar la ficha del Jugador se puede observar si se generarían
;; nuevos posibles cuatro en raya para el Jugador. Además para saber en que
;; columna introducir la ficha en el caso de que no exista una jugada peligrosa
;; del Jugador, se comprueba cuántas conexiones posibles de la máquina hay en
;; cada posición donde se puede colocar una ficha.

;;;;;;;;;;;;;;;; Hechos para representar el proceso de análisis

;;;;;;; (Analizando)                  representa que se está realizando el análisis
;;;;;;; (Contador ?num)               representa la columna que se está simulando
;;;;;;; (Tablero Analisis ?f ?c ?j)   representa una posición del tablero de análisis con valor de fila ?f
;;;;;;;                               , valor de columna ?c y que contiene la ficha ?j
;;;;;;; (PuntosNegativos ?num ?contador)   representa el número ?num de posibles cuatro en raya encontrados
;;;;;;;                               en la simulación de la columna ?contador
;;;;;;; (PuntosPositivos ?num ?contador)    representa el número ?num de conexiones posibles de la máquina 
;;;;;;;                               en la posición de caída en la columna ?contador

(defrule iniciar_primer_analisis
(Turno M)
(not (Analizando))
(not (Contador ?num))
(Caeria ?f 1)
=>
(assert (Analizando))
(assert (Contador 1))
(assert (Tablero Analisis ?f 1 J))
(assert (PuntosNegativos 0 1))
(assert (PuntosPositivos 0 1))
)

;; Esta regla inicia el proceso de análisis desde el segundo turno de la máquina en adelante.
;; Esta regla hace lo mismo que la anterior, pero añadiendo la eliminación de ciertas deduciones
;; realizadas en el análisis del turno anterior. Estas deduciones eliminadas son el contador
;; , la posición con mayor número de 4 en raya posibles del jugador contrario y la posición con 
;; mayor número de conexiones de la máquina del análisis anterior.

;;;;;;;;;;;;;;;; Hechos para representar el proceso de análisis

;;;;;;; (Analizando)                       representa que se está realizando el análisis
;;;;;;; (Contador ?num)                    representa la columna que se está simulando
;;;;;;; (Tablero Analisis ?f ?c ?j)        representa una posición del tablero de análisis con valor de fila ?f
;;;;;;;                                    , valor de columna ?c y que contiene la ficha ?j
;;;;;;; (PuntosNegativos ?num ?contador)   representa el número ?num de posibles cuatro en raya encontrados
;;;;;;;                                    en la simulación de la columna ?contador
;;;;;;; (PuntosPositivos ?num ?contador)   representa el número ?num de conexiones posibles en la posición
;;;;;;;                                    de caída en la columna ?contador

(defrule iniciar_resto_analisis
(Turno M)
(not (Analizando))
?X <- (Contador ?num)
?Y <- (PuntosNegativos ?aux1 ?num1)
?Z <- (PuntosPositivos ?aux2 ?num2)
(Caeria ?f 1)
=>
(retract ?X ?Y ?Z)
(assert (Analizando))
(assert (Contador 1))
(assert (Tablero Analisis ?f 1 J))
(assert (PuntosNegativos 0 1))
(assert (PuntosPositivos 0 1))
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR EL NÚMERO DE CONEXIONES POSIBLES DE LA MÁQUINA SI SE COLOCA LA FICHA EN LA COLUMNA DEL CONTADOR

;; Estas reglas se activan si estamos analizando y el contador todavía no ha llegado a 8
;; Con estas reglas se comprueba si existe alguna conexión de dos elementos de la máquina que tenga
;; como siguiente ó anterior posición en su misma dirección, la posición de caída de la ficha
;; en la columna que se está simulando. Si alguna conexión de dos elementos de la máquina cumple
;; estas condicciones, se crea un hecho que aumenta el número que representa estas conexiones en
;; dos unidades.

;;;;;;;;;;;;;;;; Hecho para representar el aumento de puntos positivos

;;;;;;; (AumentarPuntosPositivos ?num)    representa que se debe aumentar en ?num unidades el hecho que indica
;;;;;;;                                   el número de posibles conexiones en la columna simulada

(defrule comprobar_perimetro_conectado_sigui
(Analizando)
(Contador ?num)
(test (neq ?num 8))
(Caeria ?f ?num)
(Siguiente ?f ?num ?d ?f1 ?c1)
(Conectado Analisis ?d ?f1 ?c1 ?f2 ?c2 M)
=>
(assert (AumentarPuntosPositivos 2))
)

(defrule comprobar_perimetro_conectado_ante
(Analizando)
(Contador ?num)
(test (neq ?num 8))
(Caeria ?f ?num)
(Anterior ?f ?num ?d ?f2 ?c2)
(Conectado Analisis ?d ?f1 ?c1 ?f2 ?c2 M)
=>
(assert (AumentarPuntosPositivos 2))
)

;; Estas reglas se activan si estamos analizando y el contador todavía no ha llegado a 8
;; Con estas reglas se comprueba si existe alguna posición que contenga una ficha de la máquina y que
;; tenga como siguiente ó anterior posición en su misma dirección, la posición de caída de la ficha
;; en la columna que se está simulando. Si alguna posición que contiene una ficha de la de la máquina cumple
;; estas condicciones, se crea un hecho que aumenta el número que representa estas conexiones en
;; una unidad. En el caso de que la posición elegida pertenezca a una conexión de dos elementos, no se
;; tendrá en cuenta, ya que su valor como conexión ya habría sumado en la anterior regla.

;;;;;;;;;;;;;;;; Hecho para representar el aumento de puntos positivos

;;;;;;; (AumentarPuntosPositivos ?num)    representa que se debe aumentar en ?num unidades el hecho que indica
;;;;;;;                                   el número de posibles conexiones en la columna simulada

(defrule comprobar_perimetro_solitario_sigui
(Analizando)
(Contador ?num)
(test (neq ?num 8))
(Caeria ?f ?num)
(Siguiente ?f ?num ?d ?f1 ?c1)
(not (Conectado Analisis ?d ?f1 ?c1 ?f2 ?c2 M))
(Tablero Juego ?f1 ?c1 M)
=>
(assert (AumentarPuntosPositivos 1))
)

(defrule comprobar_perimetro_solitario_ante
(Analizando)
(Contador ?num)
(test (neq ?num 8))
(Caeria ?f ?num)
(Anterior ?f ?num ?d ?f2 ?c2)
(not (Conectado Analisis ?d ?f1 ?c1 ?f2 ?c2 M))
(Tablero Juego ?f2 ?c2 M)
=>
(assert (AumentarPuntosPositivos 1))
)

;;;;;;;;;;;;;;;;;;;;;;;  AUMENTAR EL NUMERO DE PUNTOS POSITIVOS DE UNA COLUMNA

;; Esta regla consiste en sumar cierto número al hecho que almacena el número de puntos
;; positivos de un columna en el análisis.

;;;;;;;;;;;;;;;; Hechos para representar la cantidad de puntos positivos

;;;;;;; (PuntosPositivos ?num ?contador)   representa el número ?num de conexiones posibles en la posición
;;;;;;;                                    de caída en la columna ?contador

(defrule aumentar_perimetro
(Analizando)
?Y <- (AumentarPuntosPositivos ?incre)
(Contador ?num)
?X <- (PuntosPositivos ?aux ?num)
=>
(retract ?X ?Y)
(bind ?newaux (+ ?aux ?incre))
(assert (PuntosPositivos ?newaux ?num))
)


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR EL NÚMERO DE POSIBLES VISTORIAS DEL JUGADOR CONTRARIO SI NO SE COLOCA LA FICHA EN LA COLUMNA DEL CONTADOR

;; Estas reglas se activan si al suponer que la máquina no pone la ficha en la posición que indica el contador
;; y que el jugador contrario coloca en esa posición su ficha, se encuentra una posible victoria del jugador contrario.

;;;;;;;;;;;;;;;; Hecho para representar el aumento de puntos negativos

;;;;;;; (AumentarPuntosNegativos ?num)    representa que se debe aumentar en ?num unidades el hecho que indica
;;;;;;;                                   el número de posibles victorias del jugador contrario si se coloca una
;;;;;;;                                   ficha de él en la columna simulada

(defrule comprobar_posible_victoria_delante_analisis
(Analizando)
(Contador ?num)
(test (neq ?num 8))
(Tres_en_linea Analisis ?d ?f1 ?c1 ?f3 ?c3 J)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero Analisis ?f4 ?c4 _)
(Caeria ?f4 ?c4)
=>
(assert (AumentarPuntosNegativos 1))
)

(defrule comprobar_posible_victoria_detras_analisis
(Analizando)
(Contador ?num)
(test (neq ?num 8))
(Tres_en_linea Analisis ?d ?f1 ?c1 ?f3 ?c3 J)
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero Analisis ?f0 ?c0 _)
(Caeria ?f0 ?c0)
=>
(assert (AumentarPuntosNegativos 1))
)


;;;;;;;;;;;;;;;;;;;;;;;  AUMENTAR EL NUMERO DE PUNTOS NEGATIVOS DE UNA COLUMNA

;; Esta regla consiste en sumar cierto número al hecho que almacena el número de posibles 
;; victorias del jugador contrario si se coloca una ficha de él en la columna simulada

;;;;;;;;;;;;;;;; Hechos para representar la cantidad de puntos negativos

;;;;;;; (PuntosNegativos ?num ?contador)   representa el número ?num de posibles victorias cuando se simula
;;;;;;;                                    la columna ?contador

(defrule aumentar_encontrado
(Analizando)
?Y <- (AumentarPuntosNegativos ?incre)
(Contador ?num)
?X <- (PuntosNegativos ?aux ?num)
=>
(retract ?X ?Y)
(bind ?newaux (+ ?aux ?incre))
(assert (PuntosNegativos ?newaux ?num))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Se el pone -1 de prioridad para que sucedan antes que el aumento del contador
;; para no tener que hacer -1 al contador.


(defrule iniciar_eliminar
(declare (salience -1))
(Analizando)
(Contador ?num)
=>
(assert (Eliminar))

)



;; Por si al colocar una ficha en cierta posición
;; posibilito que el contrario pueda hacer 4 en linea
;; Sólo se borra el perimetro porque si el encuentro es mayor
;; o igual a dos si que habría que colocarla, aunque ya estariamos
;; ante una derrota asegurada, si estas dos cosas ocurres, PuntosNegativos >= 2
;; y se tenga que vetar es columna


(defrule vetar_jugada_analisis_sigui
(declare (salience 3))
(Analizando)
(Contador ?num)
(Caeria ?f5 ?num)
(Decre ?f5 ?f4)
(Tres_en_linea Analisis ?d ?f1 ?c1 ?f3 ?c3 J)
(Siguiente ?f3 ?c3 ?d ?f4 ?num)
(Tablero Analisis ?f4 ?num _)
?X <- (PuntosPositivos ?aux ?num)
=>
(retract ?X)
)

(defrule vetar_jugada_analisis_ante
(declare (salience 3))
(Analizando)
(Contador ?num)
(Caeria ?f5 ?num)
(Decre ?f5 ?f4)
(Tres_en_linea Analisis ?d ?f1 ?c1 ?f3 ?c3 J)
(Anterior ?f1 ?c1 ?d ?f4 ?num)
(Tablero Analisis ?f4 ?num _)
?X <- (PuntosPositivos ?aux ?num)
=>
(retract ?X)
)



(defrule eliminar_conectados_contador
(declare (salience 3))
(Analizando)
(Eliminar)
(Contador ?num)
(Caeria ?f ?num)
?X <- (Conectado Analisis ?d ?f1 ?c1 ?f2 ?c2 J)
(test (or (and (= ?f1 ?f) (= ?c1 ?num)) (and (= ?f2 ?f) (= ?c2 ?num))))
=>
(retract ?X)
)



(defrule eliminar_3_en_linea_contador
(declare (salience 3))
(Analizando)
(Eliminar)
(Contador ?num)
(Caeria ?f ?num)
?X <- (Tres_en_linea Analisis ?d ?f1 ?c1 ?f3 ?c3 J)
(Siguiente ?f1 ?c1 ?d ?f2 ?c2)
(test (or (or (and (= ?f1 ?f) (= ?c1 ?num)) (and (= ?f2 ?f) (= ?c2 ?num))) (and (= ?f3 ?f) (= ?c3 ?num))))
=>
(retract ?X)
)


;; pongo 2 de prioridad porque tiene que ocurrir antes que un posible salto de iteración
;; por culpa de un columna completa


(defrule eliminar_elementos
(declare (salience 2))
(Analizando)
?X <- (Eliminar)
(Contador ?num)
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(deffacts Valores_de_incremento
(Incre 1 2) (Incre 2 3) (Incre 3 4) (Incre 4 5) 
(Incre 5 6) (Incre 6 7) (Incre 7 8)
)

(deffacts Valores_de_decremento
(Decre 6 5) (Decre 5 4) (Decre 4 3) 
(Decre 3 2) (Decre 2 1) (Decre 1 0)
)


(defrule aumentar_contador
(declare (salience -2))
(Analizando)
?X <- (Contador ?num)
(Incre ?num ?i)
(test (<> ?i 8))
(Caeria ?f1 ?num)
(Caeria ?f2 ?i)
?Y <- (Tablero Analisis ?f1 ?num J)
?Z <- (Tablero Analisis ?f2 ?i _)
=>
(retract ?X ?Y ?Z)
(assert (Tablero Analisis ?f1 ?num _))
(assert (Tablero Analisis ?f2 ?i J))
(assert (Contador ?i))
(assert (PuntosNegativos 0 ?i))
(assert (PuntosPositivos 0 ?i))
)


(defrule ultimo_contador
(declare (salience -2))
(Analizando)
?X <- (Contador ?num)
(Incre ?num ?i)
(test (= ?i 8))
(Caeria ?f ?num)
?Y <- (Tablero Analisis ?f ?num ?j)
=>
(retract ?X ?Y)
(assert (Tablero Analisis ?f ?num _))
(assert (Contador ?i))
(assert (Eliminar))
)

(defrule saltar_iteracion
(declare (salience 1))
(Analizando)
?X <- (Contador ?num)
(Caeria ?f ?num)
(test (= ?f 0))
(Incre ?num ?i)
=>
(retract ?X)
(assert (Contador ?i))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(defrule obtener_jugada_analisis
(Analizando)
(Contador ?num)
(test (= ?num 8))
?X <- (PuntosNegativos ?aux1 ?num1)
(PuntosNegativos ?aux2 ?num2)
(test (neq ?num1 ?num2))
(test (<= ?aux1 ?aux2))
=>
(retract ?X)
)


(defrule obtener_perimetro_analisis
(Analizando)
(Contador ?num)
(test (= ?num 8))
?X <- (PuntosPositivos ?aux1 ?num1)
(PuntosPositivos ?aux2 ?num2)
(test (neq ?num1 ?num2))
(test (<= ?aux1 ?aux2))
=>
(retract ?X)
)


;;;;;;  ACCIONES A REALIZAR EN BASE A LOS HECHOS



(defrule ganar_partida
(declare (salience 9998))
?Y <- (Turno M)
(PosibleVictoria M ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(printout t "JUEGO en la columna (con criterio) " ?c crlf)
(assert (Juega M ?c))
)

(defrule salvar_partida
(declare (salience -2))
?Y <- (Turno M)
(PosibleVictoria J ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(printout t "JUEGO en la columna (con criterio) " ?c crlf)
(assert (Juega M ?c))
)


(defrule salvar_partida_analisis
(declare (salience -3))
?Y <- (Turno M)
(PuntosNegativos ?num ?c)
(test (>= ?num 2))
?X <- (Analizando)
=>
(retract ?X ?Y)
(printout t "JUEGO en la columna (con criterio) " ?c crlf)
(assert (Juega M ?c))
)


(defrule mejor_posicion_analisis
(declare (salience -4))
?Y <- (Turno M)
(PuntosPositivos ?num ?c)
(test (neq ?num 0))
?X <- (Analizando)
=>
(retract ?X ?Y)
(printout t "JUEGO en la columna (con criterio) " ?c crlf)
(assert (Juega M ?c))
)

(defrule mejor_posicion_analisis_cuando_todo_blanco
(declare (salience -5))
?Y <- (Turno M)
(PuntosPositivos ?num ?c)
(test (eq ?num 0))
?X <- (Analizando)
=>
(retract ?X ?Y)
(printout t "JUEGO en la columna (con criterio) " 4 crlf)
(assert (Juega M 4))
)