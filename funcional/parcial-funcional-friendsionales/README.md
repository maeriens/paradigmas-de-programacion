# Parcial Friendsionales

Las personas tenemos nombre y edad (claro está) pero además, como somos seres de energía, tenemos un nivel de energía que nos representa. La misma se mide en *yulius*. Este nivel está dado en función de varias cosas, como por ejemplo el nivel de alegría de una persona (que se mide en *alegronios*), el nivel de amsiedad (que se mide en *nerviofrinas*) y las tareas que tiene que hacer una persona. Estas últimas afectan siempre a la persona modificando ciertos valores dependiendo cada caso.

Para las personas que son más alegres que ansiosas, es decr que su nivel de *alegronios* es superior al de *nerviofrinas*, su energía es el doble de los *alegronios* y no mas de 340 *yulius*.
Si por el contrario es más ansioso que alegre y es jóven (es decir menos de 40 años), la energía es de 300 *yulisu* menos el nivel de estrés de la persona. El mismo equivale al nivel de amsiedad de la persona pero se multiplica por 1.5 si es que tiene más de 5 tareas pendientes.
Por el contrario, si no cumple con estas condiciones, la energía es directamente el nivel de alegría mas 10 *yulius*.

### Punto 1
Se pide modelar a la persona y poder obtener su nivel de energía.

### Punto 2
Dado un grupo de amigos, queremos saber
- Si **viejosSonLosTrapos**, que ocurre para un grupo cuando todos los jovatos (osea de 40 o más años) son vitales, es decir, tienen más de 100 *yulius* de energía.
- El **nivelTotalDeAmsiedad** que es la sumatoria del nivel de amsiedad de los jovatos del grupo
- Los nombres de **losMasCriticados**. Son las primeras dos personas que cumplen con algún criterio. Dar un ejemplo de cómo invocar a **losMasCriticados** para
 - Los que tienen un nivel de amsiedad > 50
 - Los que tienen un nivel de energía par

### Punto 3
Vamos a modelar las tareas. Cada vez que se realiza una tarea, se descomprime a la persona. Esto hace que baje en 10 *nerviofrinas* su nivel de amsieda luego de realizar la misma. El mínimo valor de amsiedad es 0.
- **codearUnProyectoNuevo** incrementa la alegía en 110 *alegronios* y también aumenta la amsiedad  en 50 *nerviofrinas*. Por ejemplo, si Jua, que tiene 100 *alegronios* y 100 *nerviofrinas*, luego de **codearUnProyectoNuevo** tiene 210 *alegronios* y 140 *nerviofrinas* (el valor inicial de 100 = 50 que se adicionan, pero luego 10 que se pierden por haber realizado la tarea).
- **hacerTramitesEnAfip** que como mínimo deja 300 *nerviofrinas* y resulta de multiplicar el nivel de amsiedad de la persona por la cantidad de trámites que debe realizar. Si por ejemplo Cecilia tiene que hacer 2 trámites y tiene 40 *nerviofrinas*, pasa a tener 290 *nerviofrinas* (40 * 2 = 80 *nerviofrinas*, pero el mínimo es posible es 300, y luego se le descuentan 10 por terminar la tarea). En el caso de Juan que tieneamsiedad de 250 *nerviofrinas*, luego de hacer 2 trámites queda con 490 *nerviofrinas* (250 * 2 = 500, y le quitamos 10 al descomprimir).
- **andarEnBici** que nos quita toda la amsiedad y nos da 50 *alegronios* por cada kilómetro recorrido. Si por ejemplo Cecilia que tiene 90 *alegronios* y 65 *nerviofrinas*, tras andar en bici un kilómetro queda con 140 *alegronios* y 0 *nervofrinas* (no debe quedar en menos de 0).
- **escucharMusica** que nos descomprime. Si Santiago tiene 30 *nervofrinas* y escucha música, queda con 10 *nervofrinas* (resta 10 por escuchar y 10 por descomprimir al realizar la tarea).

### Punto 4
Queremos saber la **energiaResultante** que dad una persona y una lista de tareas es la energía recalculada para una persona luego de hacer todas las tareas. No se puede utilizar recursividad en este punto.

### Punto 5
Modelar **hiceLoQuePude** para una persona y una serie de tareas. La persona intenta tomar de a una las tareas y realizarlas, siempre y cuando la tarea lo deje con más de 100 *yulius* de energía. Si cumple con la condición, la ejecuta y pasa al caso siguiente, pero si no supera este valor, deja de hacer tareas y la persona queda en dicho estado. Resolver este punto con recursividad.

### Punto 6
Dada una lisat de personas infinitas, ¿Podemos determinar el **nivelTotalDeAmsiedad** o si **viejosSonLosTrapos**? Justifique.