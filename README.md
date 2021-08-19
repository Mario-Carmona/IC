# IC
**Contiene todas la prácticas realizadas en la asignatura IC en la UGR durante el curso 20/21**

**No todas las prácticas están terminadas**

## [Práctica 1: Introducción a los sistemas basados en reglas](./Practica1)

Realiza un sistema en CLIPS que recoja el conocimiento sobre los miembros de un familia y que indique quiénes sin los miembros que están relacionados por una relación concreta R con un miembro concreto de la familia M.

En el caso de que no haya ningún miembro de la familia relacionado mediante R con M, el sistema debe indicarlo.

## [Práctica 2: Ejercicios con sistemas basados en reglas](./Practica2)

Realizar un sistema basado en reglas para jugar al 4 en raya en un tablero de 6x7, donde se introducen fichas por arriba y caen hasta la posicion libre mas abajo.

## [Práctica 3: Sistema experto simple](./Practica3)

El problema consiste en diseñar un sistema experto que asesore a un estudiante de ingeniería informática sobre qué rama elegir de forma que el sistema actúe tal y como lo haríais vosotros.

Así, la práctica consiste en crear un programa en CLIPS que:

1. Le pregunte al usuario que pide asesoramiento lo que le preguntaríais a alguien que os pida consejo en ese sentido, y de forma y orden en que lo preguntaríais vosotros.
2. Razone y tome decisiones cómo lo haríais vosotros para esta tarea.
3. Le aconseje la rama o las ramas que le aconsejaríais vosotros, junto con los motivos por los que se le aconseja.

## Práctica 4

### [Parte 1: Diseño de una estructura de bloques para crear un sistema](./Practica4/Parte1)

La práctica consiste en modularizar en CLIPS el sistema creado en la práctica 3.

### [Parte 2: Tarea de Protègé](./Practica4/Parte2)

Se trata de desarrollar en Protègé una Ontología.

Concretamente, habrá que:

- Crear las clases primarias necesarias, incluyendo los axiomas básicos de la definición semántica de las mismas
- Crear los slots necesarios (propiedad de tipo datos), creando en algún caso nuevos tipos de datos, e incluyendo los axiomas básicos asociados a su definición semántica
- Crear las propiedades de tipo objeto, incluyendo los axiomas básicos asociados a su definición semántica
- Crear instancias para cada una de las clases incluyendo solamente los valores de las propiedades que no se puedan deducir
- Introducir valores a los slots al nivel de la jerarquía que se estime apropiado
- Aplicar el razonador para chequear la consistencia
- Definir al menos tres clases a partir de las clases primarias y aplicar el razonador
- Generar un documento con:
    - 1 ejemplo de valor deducido y por el razonador y la explicación dada
    - 1 ejemplo de axioma de una clase deducido por el razonador y la explicación dada
    - 1 ejemplo de relación de jerarquía deducida por el razonador y la explicación dada
    
El documento que recoja estos ejemplos puede mostrar los ejemplos y explicaciones mediante una captura de pantalla o mediante la recogida del texto.

## Práctica 5

### [Parte 1: Diseño de una estructura de bloques para crear un sistema](./Practica5/Parte1)

Esta práctica tiene dos objetivos:

- Implementar en CLIPS un sistema que pregunte por un animal y responda si ese animal vuela o no, basado en cierto conocimiento que se tiene por defecto.
- Implementar en CLIPS un sistema que haga un diagnóstico sobre la avería de un coche que no arranca de acuerdo a unas reglas con ciertos factores de certeza.

### [Parte 2: Tarea de Protègé](./Practica5/Parte2)

Esta práctica consiste en la implementación de un sistema difuso y de un sistema de razonamiento probabilístico.

## [Práctica 6: Desarrollo de un sistema basado en el conocimiento](./Practica6)

En esta práctica se trata de desarrollar un sistema basado en el conocimiento que asesore a un estudiante de Ingeniería Informática, y que debe incluir al menos dos tipos de asesoramiento:

- Asesorar a una alumno en qué rama matricularse
- Dadas dos asignaturas entre las que se está dudando, aconsejar al alumno cuál debería elegir y por qué.
