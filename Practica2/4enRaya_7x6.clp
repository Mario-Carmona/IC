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
;; sobre el estado del juego en todo momento. En estas deduciones básicas se detectan los casos
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
;; sino el antecedente del hecho de tipo Tablero de la posición siguiente sería falso.

;;;;;;;;;;;;;;;; Hechos para representar la posición siguiente

;;;;;;; (Siguiente ?f ?c ?direccion ?f1 ?c1)   representa que la posicion f1,c1 es la siguiente posición a f,c 
;;;;;;;                                        siguiendo la direccion indicada en el hecho

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
;; cálculos consisten en sumar o restar una unidad a f, ó restar una unidad a c. Yo 
;; considero que la posición anterior siempre será la que siga la dirección hacia la
;; izquierda del tablero, y en el caso de la dirección vertical la que se encuentre abajo de (f,c).
;; Con el test explícitamente se comprueba si la posición anterior forma parte del tablero, porque
;; sino el antecedente del hecho de tipo Tablero de la posición anterior sería falso.

;;;;;;;;;;;;;;;; Hechos para representar la posición anterior

;;;;;;; (Anterior ?f ?c ?direccion ?f1 ?c1)   representa que la posicion f1,c1 es la siguiente posición a f,c 
;;;;;;;                                       siguiendo la direccion indicada en el hecho

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
;; en la posición que indicó, debido a la prioridad igual a 1, para que antes de empezar 
;; el turno siguiente ya esté actualizada para las nuevas deduciones. Para lanzar la 
;; actualización se añade un hecho que lanza la regla correspondiente, se hace de esta 
;; manera para evitar bucles infinitos.

;;;;;;;;;;;;;;;; Hechos para representar la posición en que caería la ficha en cierta columna

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

;; Estas reglas se lanzan cuando en cierta posición del tablero hay una ficha de un
;; jugador, y en la posición siguiente ó anterior a esa posición hay una ficha del
;; mismo jugador. Estas dos fichas forman una conexión de dos en linea. Las conexiones
;; siempre empiezan por la posición más a la izquierda, y terminan en la posición más
;; a la derecha. En el caso de la dirección vertical, empiezan abajo y terminan arriba.

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


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR SITUACION EN QUE ESTAMOS A UNA FICHA DE GANAR

;; Estas reglas se lanzan cuando existe una de estas cuatro situaciones (las reglas que tienen en cuenta cada
;; situación están en el mismo orden en que se descirben las distintas situaciones):
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

;;;;;;;;;;;;;;;; Hecho para representar la situación en que un jugador se puede convertir en ganador

;;;;;;; (PosibleVictoria ?j ?c)    representa la posibilidad de ganar del jugador ?j, si introduce
;;;;;;;                            una ficha en la columna ?c

(defrule comprobar_posible_victoria_delante
(Tres_en_linea ?t ?d ?f1 ?c1 ?f3 ?c3 ?j)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero ?t ?f4 ?c4 _)
(Caeria ?f4 ?c4)
=>
(assert (PosibleVictoria ?t ?d ?f1 ?c1 ?f4 ?c4 ?j ?c4))
)

(defrule comprobar_posible_victoria_detras
(Tres_en_linea ?t ?d ?f1 ?c1 ?f3 ?c3 ?j)
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero ?t ?f0 ?c0 _)
(Caeria ?f0 ?c0)
=>
(assert (PosibleVictoria ?t ?d ?f0 ?c0 ?f3 ?c3 ?j ?c0))
)

(defrule comprobar_posible_victoria_en_medio_delante
(Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Tablero ?t ?f3 ?c3 _)
(Caeria ?f3 ?c3)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero ?t ?f4 ?c4 ?j)
=>
(assert (PosibleVictoria ?t ?d ?f1 ?c1 ?f4 ?c4 ?j ?c3))
)

(defrule comprobar_posible_victoria_en_medio_detras
(Conectado ?t ?d ?f2 ?c2 ?f3 ?c3 ?j)
(Anterior ?f2 ?c2 ?d ?f1 ?c1)
(Tablero ?t ?f1 ?c1 _)
(Caeria ?f1 ?c1)
(Anterior ?f1 ?c1 ?d ?f0 ?c0)
(Tablero ?t ?f0 ?c0 ?j)
=>
(assert (PosibleVictoria ?t ?d ?f0 ?c0 ?f3 ?c3 ?j ?c1))
)


;;;;;;;;;;;;;;;;;;;;;;;  RETRACTAR UN HECHO QUE INDICA QUE UN JUGADOR ESTÁ A UNA FICHA DE GANAR

;; Esta regla se lanza cuando existe un hecho "PosibleVictoria ?jugador ?columna", y en la posición
;; que faltaba para completar el 4 en raya, se ha colocado una ficha del jugador contrario.
;; Esto es posible que pase ya que este hecho se está deduciendo todo el rato, sin importar
;; de que jugador sea el turno en ese momento. Al lanzarse la regla, como consecuencia se
;; borra el hecho que indica la posibilidad de ganar. Esta regla tiene la máxima prioridad para
;; evitar errores en la toma de decisiones a la hora de colocar la ficha por parte de la máquina.

;; Se comprueba si la columna donde hay que colocar la ficha ?pos su posición de caida sigue 
;; siendo la misma de cuando se creo el hecho posible victoria, este es el caso en que se ha colocado
;; una ficha del jugador contrario y por eso ha dejado de ser posible victoria

(defrule retractar_posible_victoria_M
(declare (salience 9999))
?X <- (PosibleVictoria ?t ?d ?f1 ?c1 ?f4 ?c4 M ?pos)
(Caeria ?f ?pos)
(Siguiente ?f1 ?c1 ?d ?f2 ?c2)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Tablero ?t ?f1 ?c1 ?j1)
(Tablero ?t ?f2 ?c2 ?j2)
(Tablero ?t ?f3 ?c3 ?j3)
(Tablero ?t ?f4 ?c4 ?j4)
(test (or (or (eq ?j1 J) (eq ?j2 J)) (or (eq ?j3 J) (eq ?j4 J))))
=>
(retract ?X)
)

(defrule retractar_posible_victoria_J
(declare (salience 9999))
?X <- (PosibleVictoria ?t ?d ?f1 ?c1 ?f4 ?c4 J ?pos)
(Caeria ?f ?pos)
(Siguiente ?f1 ?c1 ?d ?f2 ?c2)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Tablero ?t ?f1 ?c1 ?j1)
(Tablero ?t ?f2 ?c2 ?j2)
(Tablero ?t ?f3 ?c3 ?j3)
(Tablero ?t ?f4 ?c4 ?j4)
(test (or (or (eq ?j1 M) (eq ?j2 M)) (or (eq ?j3 M) (eq ?j4 M))))
=>
(retract ?X)
)

;; Aqui se trata de eliminar las posibles victorias que han dejado de serlo al cambiar
;; de iteración en el análisis, al mover la ficha que se introduce en el análisis.

(defrule retractar_posible_victoria_temporal
(declare (salience 9999))
?X <- (PosibleVictoria ?t ?d ?f1 ?c1 ?f4 ?c4 ?j ?pos)
(Siguiente ?f1 ?c1 ?d ?f2 ?c2)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Tablero ?t ?f1 ?c1 ?j1)
(Tablero ?t ?f2 ?c2 ?j2)
(Tablero ?t ?f3 ?c3 ?j3)
(Tablero ?t ?f4 ?c4 ?j4)
(test (or (or (and (neq ?pos ?c1) (eq ?f1 _)) (and (neq ?pos ?c2) (eq ?f2 _))) (or (and (neq ?pos ?c3) (eq ?f3 _)) (and (neq ?pos ?c4) (eq ?f4 _)))))
=>
(retract ?X)
)

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

(defrule retractar_conectado
(declare (salience 9999))
?X <- (Conectado ?t ?d ?f1 ?c1 ?f2 ?c2 ?j)
(Tablero ?t ?f1 ?c1 ?j1)
(Tablero ?t ?f2 ?c2 ?j2)
(test (or (neq ?j1 ?j) (neq ?j2 ?j)))
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;  ANALISIS DEL TABLERO  ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;  CREAR LOS HECHOS QUE COMPONEN EL TABLERO DE ANALISIS

;; En esta regla se van creando los hechos Tablero para el analisis, copiando el valor de la
;; casilla equivalente del tablero de Juego. Sólo se crea esta posición en el tablero de
;; análisis si todavía no existe una posición con ese valor de fila y columna en el tablero de
;; análisis.

;;;;;;;;;;;;;;;; Hechos para representar la posición en el tablero de análisis

;;;;;;; (Tablero Analisis ?f ?c ?j)   representa que en la posicion con fila f y columna c, hay una
;;;;;;;                               ficha del tipo ?j, que puede ser de la máquina, del jugador, ó
;;;;;;;                               estar en blanco. 

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


;;;;;;;;;;;;;;;;;;;;;;;  DEDUCIR Y RETRACTAR LOS HECHOS DE LAS POSICIONES DEL TABLERO DE ANALISIS

;; Con esta regla se va actualizando el valor del tablero de análisis, en función de los cambios que
;; se hagan en el tablero de Juego. Si una posición en el tablero de Juego cambia de valor, lanza el
;; antecedente, y como consecuencia se borra el valor actual de esa posición en el tablero de análisis, 
;; y se añade el hecho que indica el nuevo valor.

;;;;;;;;;;;;;;;; Hechos para representar la posición siguiente

;;;;;;; (Tablero Analisis ?f ?c ?j)   representa que en la posicion con fila f y columna c, hay una
;;;;;;;                               ficha del tipo ?j, que puede ser de la máquina, del jugador, ó
;;;;;;;                               estar en blanco. 

(defrule actualizar_tablero_analisis_J
(Tablero Juego ?f ?c ?j1)
?X <- (Tablero Analisis_J ?f ?c ?j2)
(test (and (neq ?j1 _) (neq ?j1 ?j2)))
=>
(retract ?X)
(assert (Tablero Analisis_J ?f ?c ?j1))
)

(defrule actualizar_tablero_analisis_M
(Tablero Juego ?f ?c ?j1)
?X <- (Tablero Analisis_M ?f ?c ?j2)
(test (and (neq ?j1 _) (neq ?j1 ?j2)))
=>
(retract ?X)
(assert (Tablero Analisis_M ?f ?c ?j1))
)


;;;;;;;;;;;;;;;;;;;;;;;  INICIAR EL PROCESO DE ANALISIS

;; Con esta regla se inicia el proceso de análisis por primera vez, en el cuál 
;; se simula los efectos de colocar una ficha de un jugador en cierta posición. En 
;; cada iteración se coloca una ficha del Jugador en cada una de las columnas,
;; por lo que hay tantas iteraciones como columnas en las que se pueda colocar
;; una ficha. Al colocar la ficha del Jugador se puede observar si se generarían
;; nuevos posibles cuatro en raya para el Jugador si la máquina no coloca la ficha 
;; en esa columna y el Jugador coloca su ficha en esa columna. Además para saber en que
;; columna introducir la ficha en el caso de que no exista una jugada peligrosa
;; del Jugador, se comprueba cuántas conexiones posibles de la Máquina hay en
;; cada posición donde se puede colocar una ficha. Se empieza por la columna 1,
;; por lo que se pone una ficha del Jugador en la posición de caida de la columna 1.

;;;;;;;;;;;;;;;; Hechos para representar el proceso de análisis

;;;;;;; (Analizando)                  representa que se está realizando el análisis
;;;;;;; (Contador ?num)               representa la columna que se está simulando
;;;;;;; (Tablero Analisis ?f ?c ?j)   representa una posición del tablero de análisis con valor de fila ?f
;;;;;;;                               , valor de columna ?c y que contiene la ficha ?j
;;;;;;; (PuntosNegativos ?num ?contador)   representa el número ?num de posibles cuatro en raya encontrados
;;;;;;;                                    en la simulación de la columna ?contador
;;;;;;; (PuntosPositivos ?num ?contador)   representa el número ?num de conexiones posibles de la máquina 
;;;;;;;                                    en la posición de caída en la columna ?contador

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
(assert (PuntosNegativos 0 1))
(assert (PuntosPositivos 0 1))
(assert (Puntuacion 0 1))
)

;; Esta regla inicia el proceso de análisis desde el segundo turno de la máquina en adelante.
;; Esta regla hace lo mismo que la anterior, pero añadiendo la eliminación de ciertas deduciones
;; realizadas en el análisis del turno anterior. Estas deduciones eliminadas son el contador
;; , la posición con mayor número de 4 en raya posibles del jugador contrario y la posición con 
;; mayor número de conexiones de la máquina del análisis anterior. Se empieza por la columna 1,
;; por lo que se pone una ficha del Jugador en la posición de caida de la columna 1.

;;;;;;;;;;;;;;;; Hechos para representar el proceso de análisis

;;;;;;; (Analizando)                       representa que se está realizando el análisis
;;;;;;; (Contador ?num)                    representa la columna que se está simulando
;;;;;;; (Tablero Analisis ?f ?c ?j)        representa una posición del tablero de análisis con valor de fila ?f
;;;;;;;                                    , valor de columna ?c y que contiene la ficha ?j
;;;;;;; (PuntosNegativos ?num ?contador)   representa el número ?num de posibles cuatro en raya encontrados
;;;;;;;                                    en la simulación de la columna ?contador
;;;;;;; (PuntosPositivos ?num ?contador)   representa el número ?num de conexiones posibles en la posición
;;;;;;;                                    de caída en la columna ?contador

(defrule iniciar_resto_analisis_sin_saltar
(Turno M)
(not (Analizando))
?X <- (Contador ?num)
?Y <- (PuntosNegativos ?aux1 ?num1)
?Z <- (PuntosPositivos ?aux2 ?num2)
?T <- (Puntuacion ?aux3 ?num3)
(Caeria ?f 1)
?R <- (Tablero Analisis_J ?f 1 _)
?C <- (Tablero Analisis_M ?f 1 _)
(test (<> ?f 0))
=>
(retract ?X ?Y ?Z ?T ?R ?C)
(assert (Analizando))
(assert (Contador 1))
(assert (Tablero Analisis_J ?f 1 J))
(assert (Tablero Analisis_M ?f 1 M))
(assert (PuntosNegativos 0 1))
(assert (PuntosPositivos 0 1))
(assert (Puntuacion 0 1))
)

(defrule iniciar_resto_analisis_saltando
(Turno M)
(not (Analizando))
?X <- (Contador ?num)
?Y <- (PuntosNegativos ?aux1 ?num1)
?Z <- (PuntosPositivos ?aux2 ?num2)
?T <- (Puntuacion ?aux3 ?num3)
(Caeria ?f 1)
(test (= ?f 0))
=>
(retract ?X ?Y ?Z ?T)
(assert (Analizando))
(assert (Contador 2))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule aumentar_puntuacion
(Analizando)
(Contador ?num)
(Caeria ?f ?num)
(Tablero Analisis_M ?f1 ?c1 M|_)
(Siguiente ?f1 ?c1 ?d ?f2 ?c2)
(Siguiente ?f2 ?c2 ?d ?f3 ?c3)
(Siguiente ?f3 ?c3 ?d ?f4 ?c4)
(Tablero Analisis_M ?f2 ?c2 M|_)
(Tablero Analisis_M ?f3 ?c3 M|_)
(Tablero Analisis_M ?f4 ?c4 M|_)
(test (or (or (and (eq ?f ?f1) (eq ?num ?c1)) (and (eq ?f ?f2) (eq ?num ?c2))) (or (and (eq ?f ?f3) (eq ?num ?c3)) (and (eq ?f ?f4) (eq ?num ?c4)))))
=>
(assert (IncrePuntuacion))
)

(defrule incre_puntuacion
(Contador ?num)
?X <- (IncrePuntuacion)
?Y <- (Puntuacion ?aux ?num)
=>
(retract ?X ?Y)
(bind ?newaux (+ ?aux 1))
(assert (Puntuacion ?newaux ?num))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;  AUMENTAR EL NUMERO DE PUNTOS POSITIVOS DE UNA COLUMNA

;; Esta regla consiste en sumar cierto número al hecho que almacena el número de puntos
;; positivos de una columna en el análisis.

;;;;;;;;;;;;;;;; Hechos para representar la cantidad de puntos positivos

;;;;;;; (PuntosPositivos ?num ?contador)   representa el número ?num de conexiones posibles en la posición
;;;;;;;                                    de caída en la columna ?contador

(defrule aumentar_puntos_positivos
(Analizando)
(PosibleVictoria Analisis_M ?d ?f1 ?c1 ?f4 ?c4 M ?pos)
(Contador ?num)
=>
(assert (IncrePuntosPositivos))
)

(defrule incre_puntos_positivos
(Contador ?num)
?X <- (IncrePuntosPositivos)
?Y <- (PuntosPositivos ?aux ?num)
=>
(retract ?X ?Y)
(bind ?newaux (+ ?aux 1))
(assert (PuntosPositivos ?newaux ?num))
)


;;;;;;;;;;;;;;;;;;;;;;;  AUMENTAR EL NUMERO DE PUNTOS NEGATIVOS DE UNA COLUMNA

;; Esta regla consiste en sumar cierto número al hecho que almacena el número de 
;; puntos negativos de la columna simulada

;;;;;;;;;;;;;;;; Hechos para representar la cantidad de puntos negativos

;;;;;;; (PuntosNegativos ?num ?contador)   representa el número ?num de posibles victorias cuando se simula
;;;;;;;                                    la columna ?contador

(defrule aumentar_puntos_negativos
(Analizando)
(PosibleVictoria Analisis_J ?d ?f1 ?c1 ?f4 ?c4 J ?pos)
(Contador ?num)
=>
(assert (IncrePuntosNegativos))
)

(defrule incre_puntos_negativos
(Contador ?num)
?X <- (IncrePuntosNegativos)
?Y <- (PuntosNegativos ?aux ?num)
=>
(retract ?X ?Y)
(bind ?newaux (+ ?aux 1))
(assert (PuntosNegativos ?newaux ?num))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Estas reglas impide que al colocar una ficha de la Máquina, se cree una posible
;; victoria del Jugador al poder colocar una ficha en una nueva posición. Si sucede 
;; esto se elimina el hecho que indica los puntos positivos de la columna, para que no 
;; se encuentre entre las columnas a elegir como mejor columna donde colocar la ficha. 
;; Pero no se elimina el hecho de los puntos negativos, ya que si la columna tiene 2 o 
;; más puntos negativos, se deberá colocar ahí la ficha para imposibilitar la creación 
;; de dos posibles victorias del Jugador. Tiene una prioridad de 3 para que se lanze 
;; antes que la regla que indica el final del proceso de eliminación.

(defrule vetar_jugada_analisis_sigui
(declare (salience 1))
(Analizando)
(Contador ?num)
(Caeria ?f5 ?num)
(Decre ?f5 ?f4)
(Tres_en_linea Analisis_M ?d ?f1 ?c1 ?f3 ?c3 J)
(Siguiente ?f3 ?c3 ?d ?f4 ?num)
(Tablero Analisis_M ?f4 ?num _)
?X <- (Puntuacion ?aux1 ?num)
?Y <- (PuntosPositivos ?aux2 ?num)
=>
(retract ?X ?Y)
)

(defrule vetar_jugada_analisis_ante
(declare (salience 1))
(Analizando)
(Contador ?num)
(Caeria ?f5 ?num)
(Decre ?f5 ?f4)
(Tres_en_linea Analisis_M ?d ?f1 ?c1 ?f3 ?c3 J)
(Anterior ?f1 ?c1 ?d ?f4 ?num)
(Tablero Analisis_M ?f4 ?num _)
?X <- (Puntuacion ?aux1 ?num)
?Y <- (PuntosPositivos ?aux2 ?num)
=>
(retract ?X ?Y)
)

(defrule vetar_jugada_analisis_en_medio_sigui
(declare (salience 1))
(Analizando)
(Contador ?num)
(Caeria ?f5 ?num)
(Decre ?f5 ?f3)
(Conectado Analisis_M ?d ?f1 ?c1 ?f2 ?c2 J)
(Siguiente ?f2 ?c2 ?d ?f3 ?num)
(Tablero Analisis_M ?f3 ?num _)
(Siguiente ?f3 ?num ?d ?f4 ?c4)
(Tablero Analisis_M ?f4 ?c4 J)
?X <- (Puntuacion ?aux1 ?num)
?Y <- (PuntosPositivos ?aux2 ?num)
=>
(retract ?X ?Y)
)

(defrule vetar_jugada_analisis_en_medio_ante
(declare (salience 1))
(Analizando)
(Contador ?num)
(Caeria ?f5 ?num)
(Decre ?f5 ?f1)
(Conectado Analisis_M ?d ?f2 ?c2 ?f3 ?c3 J)
(Anterior ?f2 ?c2 ?d ?f1 ?num)
(Tablero Analisis_M ?f1 ?num _)
(Anterior ?f1 ?num ?d ?f0 ?c0)
(Tablero Analisis_M ?f0 ?c0 J)
?X <- (Puntuacion ?aux1 ?num)
?Y <- (PuntosPositivos ?aux2 ?num)
=>
(retract ?X ?Y)
)


;; Estas reglas eliminan los hechos IncrementarPuntuacion ó IncrementarPuntosPositivos 
;; que se pueden crear después de haber vetado esa columna

(defrule eliminar_incre_puntuacion_de_columna_vetada
(declare (salience 1))
(Contador ?num)
?X <- (IncrePuntuacion)
(not (Puntuacion ?aux ?num))
=>
(retract ?X)
)

(defrule eliminar_incre_puntos_posi_de_columna_vetada
(declare (salience 1))
(Contador ?num)
?X <- (IncrePuntosPositivos)
(not (PuntosPositivos ?aux ?num))
=>
(retract ?X)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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

;; Esta regla cambia de iteración, lo cuál conlleva el incremento del contador en 
;; una unidad y el cambio de posición de la ficha del Jugador introducida en la 
;; iteración anterior. Para cambiar la ficha se elimina la ficha introducida en la
;; iteración anterior y se añade otra en la posición de caida del nuevo contador.
;; Esta regla sólo se lanza si el contador al incrementarlo es distinto de 8, ya que
;; si esto se cumple quiere decir que hemos terminado el proceso de análisis. Tiene
;; prioridad -2 para que se lanze después de haber realizado el proceso de eliminación
;; de la iteración actual.

;;;;;;;;;;;;;;;; Hechos para representar el cambio de iteración

;;;;;;; (Tablero Analisis ?f1 ?num _)      representa una posición del tablero de análisis con valor de fila ?f1
;;;;;;;                                    , valor de columna ?num y que está en blanco. Esta es la posición
;;;;;;;                                    que en la anterior iteración tenía la ficha del Jugador.
;;;;;;; (Tablero Analisis ?f2 ?i J)        representa una posición del tablero de análisis con valor de fila ?f2
;;;;;;;                                    , valor de columna ?i y que contiene una ficha del Jugador. Esta es la posición
;;;;;;;                                    que contiene en esta iteración la ficha del Jugador.
;;;;;;; (Contador ?i)                      representa el nuevo contador del análisis. Se está iterando la columna ?i
;;;;;;; (PuntosNegativos 0 ?i)             representa los puntos negativos de la iteración actual. Se inicializan a cero.
;;;;;;; (PuntosNegativos 0 ?i)             representa los puntos positivos de la iteración actual. Se inicializan a cero.

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
(assert (PuntosNegativos 0 ?i))
(assert (PuntosPositivos 0 ?i))
(assert (Puntuacion 0 ?i))
)

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
;; última iteración al valer el contador iterado 8. En esta regla no se mueve la ficha 
;; del jugador introducida en la anterior iteración, sino que sólo se elimina, y tampoco 
;; se añaden las reglas de los puntos positivos y negativo. Solo se añade el nuevo 
;; contador y se añade el hecho "Eliminar" para empezar el proceso de eliminación, ya que
;; si dejamos que lo inicie la regla "iniciar_eliminar", nunca se lanzará al tener prioridad -1,
;; ya que el resto de reglas que se ejecutan cuando el contador es 8 tienen una mayor prioridad.
;; Tiene prioridad -2 para que se lanze después de haber realizado el proceso de eliminación
;; de la iteración actual.

;;;;;;;;;;;;;;;; Hechos para representar el cambio de iteración

;;;;;;; (Tablero Analisis ?f ?num _)       representa una posición del tablero de análisis con valor de fila ?f
;;;;;;;                                    , valor de columna ?num y que está en blanco. Esta es la posición
;;;;;;;                                    que en la anterior iteración tenía la ficha del Jugador.
;;;;;;; (Contador ?i)                      representa el nuevo contador del análisis. Se está iterando la columna ?i

(defrule ultimo_contador
(declare (salience -1))
(Analizando)
?X <- (Contador ?num)
(Incre ?num ?i)
(test (= ?i 8))
(Caeria ?f ?num)
?Y <- (Tablero Analisis_J ?f ?num J)
?Z <- (Tablero Analisis_M ?f ?num M)
=>
(retract ?X ?Y ?Z)
(assert (Tablero Analisis_J ?f ?num _))
(assert (Tablero Analisis_M ?f ?num _))
(assert (Contador ?i))
)

;; Esta regla cambia de iteración para saltarse una iteración en la que no hace falta simular
;; una columna porque se encuentra completa, esto se puede comprobar con la posición de caida
;; de la columan, que debe ser 0 si está completa. Tiene prioridad 1 para que se lanze antes 
;; que cualquiera de las deduciones y además elimina los puntos positivos y negativos de la columna
;; para esta no pueda ser elegida para introducir la ficha.

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
(assert (PuntosNegativos 0 ?i))
(assert (PuntosPositivos 0 ?i))
(assert (Puntuacion 0 ?i))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(defrule obtener_jugada_con_mas_puntos_negativos
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

(defrule obtener_jugada_con_mas_puntos_positivos
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


;;;;;;  ACCIONES A REALIZAR EN BASE A LOS HECHOS



(defrule ganar_partida
(declare (salience -2))
?Y <- (Turno M)
(PosibleVictoria Juego ?d ?f1 ?c1 ?f4 ?c4 M ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)

(defrule salvar_partida
(declare (salience -3))
?Y <- (Turno M)
(PosibleVictoria Juego ?d ?f1 ?c1 ?f4 ?c4 J ?c)
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)

(defrule ganar_partida_analisis
(declare (salience -4))
?Y <- (Turno M)
(PuntosPositivos ?num ?c)
(test (>= ?num 2))
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)

(defrule salvar_partida_analisis
(declare (salience -5))
?Y <- (Turno M)
(PuntosNegativos ?num ?c)
(test (>= ?num 2))
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)


(defrule mejor_posicion_analisis
(declare (salience -6))
?Y <- (Turno M)
(Puntuacion ?num ?c)
(test (neq ?num 0))
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (Juega M ?c))
)

(defrule colocar_en_el_centro_cuando_no_hay_fichas_M
(declare (salience -7))
?Y <- (Turno M)
?X <- (Analizando)
(not (Tablero Juego ?f ?c M))
(Tablero Juego 6 4 _)
=>
(retract ?X ?Y)
(assert (Juega M 4))
)

;; Si PuntosPositivos y ya hay fichas en el tablero se ejecuta la elección al azar

(defrule eleccion_al_azar
(declare (salience -8))
?Y <- (Turno M)
?X <- (Analizando)
=>
(retract ?X ?Y)
(assert (AlAzar))
(assert (Juega M (random 1 7)))
)

(defrule comprobar_posicion_invalida
(declare (salience 9999))
(AlAzar)
?X <- (Juega M ?num)
(Caeria ?f ?num)
(test (eq ?f 0))
=>
(retract ?X)
(assert (VolverAElegir))
)

(defrule volver_a_elegir_al_azar
(declare (salience 9999))
?X <- (VolverAElegir)
=>
(retract ?X)
(assert (Juega M (random 1 7)))
)

;; Esta regla tiene 1 de priorida menos que las comprobaciones de si la posición
;; al azar es buena, con esta regla se elimina el hecho que indica que la elección
;; se ha hecho al azar, y que posibilita que se pueda comprobar si la posición al azar es
;; buena, e impide que si la posición no se ha elegido al azar se lanze la regla de comprobación
;; después de haber aumentado la posición de caida, estas situaciones pueden ocurrir cuando 
;; la posición que no ha sido elegida al azar es la última posición de un columna, por lo que
;; al aumentar la posición de caida y ponerse a 0, podría hacer que salte la regla de comprobación
;; y cambie la columna en la que se introduce la ficha, pero para eso está el hecho "AlAzar",
;; para indicar a la comprobación cuando debe lanzarse, que es después de haber elegido una posición
;; al azar.

(defrule eliminar_hecho_al_azar
(declare (salience 9998))
?X <- (AlAzar)
=>
(retract ?X)
)

(defrule mensaje_eleccion
(declare (salience 9998))
(Juega M ?num)
=>
(printout t "JUEGO en la columna (con criterio) " ?num crlf)
)