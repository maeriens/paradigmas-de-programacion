# **Navidades - Entrega 1**

Parece mentira, cuando te das cuenta se viene la navidad... así que un conocido empresario del mundo de los regalos nos pidió que modelemos su negocio, que por el momento tiene estas definiciones:

## Regalos

- Una pista de [Scalextric](https://es.wikipedia.org/wiki/Scalextric), que sale $27.300 pesos por ahora (se ajusta con la inflación), y viene con 2 autos. Se le puede agregar autos extra y cada uno tiene un costo adicional de $5.250 pesos. Este regalo es valioso si el costo total excede los $27.500 pesos (considerando los autos extra).
- Un [Yo-Yo](https://es.wikipedia.org/wiki/Yo-yo) Russell, de color azul, aunque se puede pintar de otros colores. El Yo-Yo de color azul o amarillo es valioso. El costo de un yo-yo es de $5.000, al que se le suman $1.500 si es rojo o azul.
- Un [balero](https://es.wikipedia.org/wiki/Balero) de madera al que le podemos agregar o quitar un adorno metálico (solo uno). Los baleros con adornos son valiosos. El costo de un balero es de $14.100, al que se le suman $1.900 si tiene adorno metálico.

## Personas

- Stefan es desprendido y busca que el regalo no sea valioso pero que además cueste menos de un valor que él quiere configurar (por ejemplo $6.000).
- Justina tiene 11 años. La edad es importante porque si es impar define que le gustan los regalos valiosos, en caso contrario cualquier regalo que cueste un valor que tenga 4 dígitos (por ejemplo un yo-yo que cueste $5.000 ó $6.500, el Scalextric base de $27.300 no le gustaría).
- tenemos a Pedro, que tiene amistades como a Justina y a Stefan. A la hora de elegir regalos elige el mismo regalo que su mejor amigo (en este caso, Justina es la mejor amiga, deben poder modificar la persona que es mejor amiga).

## Gift Dealer

Nuestro personaje conoce a Pedro, Justina y Stefan, y a futuro quizás a más personas. Le interesa saber cuáles son los **inconformistas** , que son las personas a las que no les gusta ningún regalo.

# Casos de prueba a implementar

## Regalos

- Una pista de Scalextric sin autos extra cuesta $27.300
- Una pista de Scalextric con 3 autos extra cuesta $43.050
- Una pista de Scalextric sin autos extra no es valiosa
- Una pista de Scalextric con 1 auto extra es valiosa

- Un yo-yo de color amarillo cuesta $5.000
- Un yo-yo de color azul cuesta $6.500
- Un yo-yo de color rojo no es valioso
- Un yo-yo de color azul es valioso

- Un balero sin adorno metálico cuesta $14.100
- Un balero con adorno metálico cuesta $16.000
- Un balero que no tiene adornos no es valioso
- Un balero que tiene adornos es valioso

## Personas

- Stefan eligiendo regalos de menos de $6.000 no elige a un yo-yo pintado de amarillo porque es valioso.
- Stefan eligiendo regalos de menos de $6.000 no elige a un yo-yo pintado de rojo porque es muy caro.
- Stefan eligiendo regalos de menos de $6.000 elige a un yo-yo pintado de verde porque no es valioso y es barato.
- Justina con edad impar elige al scalextric con un auto extra porque es valioso.
- Justina con edad impar no elige a un scalextric estándar porque no es valioso.
- Justina con edad par no elige a un scalextric estándar porque no tiene 4 dígitos.
- Justina con edad par elige a cualquier yo-yo porque tiene 4 dígitos.
- Pedro tiene de mejor amiga a Justina, también le gusta el scalextric con un auto extra.
- Pedro tiene de mejor amigo a Stefan, entonces también le gusta el yo-yo verde.

## Gift Dealer

- Al preguntar por las personas inconformistas nos devuelve una colección donde está solamente Stefan, ya que Justina elige al yo-yo azul que es valioso y Pedro tiene a Justina como mejor amiga, coincide en ese punto.