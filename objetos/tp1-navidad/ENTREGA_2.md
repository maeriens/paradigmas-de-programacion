# **Navidades - Entrega 2**

La primera iteración gustó mucho, así que nuestro cliente nos solicitó que hagamos algunos agregados a la aplicación.

## Nazarena

Queremos modelar a Nazarena que le puede gustar o no un regalo en base a un número al azar de 1 a 7: si el número es mayor a 4 le gustará, en caso contrario no le gustará. Sí, el regalo no importa.

## Persona genérica

Queremos modelar a una persona genérica, que tiene las siguientes características:

- conocen su nombre y la fecha de nacimiento
- a una persona nacida antes de los '90 le gusta que el regalo cueste más de $25.000 o menos de $50.000 en caso contrario.

## Ropa como regalo

Nos interesa modelar la ropa (zapatillas, jeans, remeras, vestidos, etc.) como regalo que tiene el siguiente comportamiento

- tienen una marca
- una fecha de confección
- un valor base

Al valor base le agregan $5.000 si la marca es "Jordache", "Feraldy" o "Charro" (pueden agregarse nuevas marcas a futuro). Luego, si la fecha de confección tiene más de 90 días, se le descuenta el 20% como "liquidación".

## Proceso general de selección de regalos

Queremos modelar el proceso general que debe ocurrir año a año, en donde:

- se selecciona el regalo más barato que le gusta a la persona, en caso de que ningún regalo le guste debe generarse un nuevo tipo de regalo: un Voucher por $5.000 con fecha de vencimiento a 3 meses de la ejecución del proceso. Un Voucher siempre se considera valioso. Debe modelar esta nueva abstracción como crea conveniente. No hay inconveniente en que un regalo se entregue a dos personas distintas, el manejo de stock de regalos está fuera del alcance.
- se debe registrar entonces el histórico, donde aparezca: la persona, el regalo y la fecha en la que se hizo la operación. Dado que el costo de un regalo puede variar con el tiempo, necesitamos guardar también el costo en el momento en que se ejecutó el proceso.

## A persona regalada se le mira el historial

Queremos poder determinar cuál fue la persona que recibió más plata en regalos. Tener en cuenta que a lo largo de la historia puede haber más de un registro en el histórico de regalos recibidos. Dado este ejemplo:

- Pedro recibió $5.000 en regalos el 15/12/2017
- Stefan recibió $15.000 en regalos el 20/12/2017
- Pedro recibió $13.000 en regalos el 16/12/2018
- Stefan recibió $2.000 en regalos el 18/12/2018

Debe indicar que Pedro es la persona que más plata en regalos recibió ($18.000 vs. $17.000 de Stefan).

# Casos de prueba a implementar

Cada integrante debe encargarse de los casos de prueba. Algunos tips:

- En el caso de Nazarena, para poder tener predictibilidad es necesario separar la generación del número random y utilizar un **stub** (implementable por ejemplo con un [objeto anónimo](https://docs.google.com/document/d/1j2VoBNczPsMXrIjJ4tycYU982CZahReTvzkWS9TTKV0/edit#heading=h.oat887kcx3kh)). De lo contrario los tests pueden funcionar en algunos casos y fallar en otro (lo que se conoce como **flaky test** ).
- Recordar cubrir todas las clases de equivalencia.
- Los nombres de los tests tienen que aclarar qué clase de equivalencia se está probando más que la implementación del test.