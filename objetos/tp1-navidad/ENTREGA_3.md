# **Navidades - Entrega** 3

¡Las iteraciones son un éxito! Nuestro cliente está muy contento con los resultados, y luego de un relevamiento consensuamos los siguientes agregados.

## Persona

Queremos que todas las personas que modelamos hasta el momento les guste un regalo si el mismo es interesante (ver punto 2), **además de la condición que cada uno definió previamente**. Por ejemplo, a Stefan le va a gustar un regalo si el regalo

- es interesante
- es valioso
- y si el costo es menor que el costo máximo

Lo mismo para Justina, Pedro, Nazarena y la persona genérica.

## Regalos interesantes

A partir de ahora queremos agregar la marca para todos los regalos, que es un valor que se define inicialmente y luego puede cambiar. Scalextric tiene como marca "scalextric", el yo-yo tiene como marca "rusell" (atención que para el TP hay que escribirlo con una sola _s_), el balero tiene como marca "balerino". El Voucher tiene como marca "boxbig". La ropa ya tenía marca.

También nos interesa modelar si un regalo es interesante, esto se da

- si la marca tiene una cantidad par de letras y además
- para el caso del scalextric, si es valioso
- para el caso del yo-yo, si tiene un color distinto de rojo
- para el caso del balero, si su costo es \> 15000
- para el caso del voucher, si no está vencido
- para el caso de la ropa, si el costo - el valor base es menor a 5000

## Parametrización del proceso general de selección de regalos

Nuestro cliente quiere poder parametrizar la forma en que se ejecuta el proceso general de selección de regalos. En particular nos pidió definir diferentes criterios para seleccionar el regalo:

- actualmente elegíamos el regalo más barato entre todos los que le gustaban a la persona
- tro es seleccionar cualquier regalo al azar, independientemente de que le guste a la persona o no
- y uno más podría ser elegir el primer regalo de los que no le gusten a la persona.

Este criterio tiene que configurarse **antes** de ejecutar el proceso, por defecto se asume que toma el regalo más barato entre todos los que le gustan a la persona.
