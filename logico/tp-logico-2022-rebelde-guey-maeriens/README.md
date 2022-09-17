# Resolución Rebelde Güey

## Potencial rebelde

**Es el año 2222 en un lugar muy lejano al planeta Tierra. El líder supremo, de nombre impronunciable e imposible de escribir, gobierna su planeta a puño de hierro. Su población es mayormente mano de obra esclava que utiliza para fabricar gran cantidad de naves con las que planea dominar toda la galaxia.**

Para poder mantenerse en el poder, destina una parte importante de sus recursos a monitorear a sus habitantes y a detectar tanto crímenes como posibles focos de disidencia. Para esto cuenta con un programa hecho en Prolog que tiene información sobre todos y cada uno de los habitantes. Si bien parece contener millones y millones de líneas de código, nuestro objetivo va a ser reimplementar ciertas partes centrales del sistema para entender cómo funcionan y, en un futuro, lanzar una ofensiva para rescatar a toda la población.

## Punto 1: Personas
Hicimos un ataque de intermediario y logramos conseguir algunas fichas de los ciudadanos, que asumimos se utilizaron para generar la base de conocimientos del sistema:

Nombre: **bakunin**
Trabaja en la aviación militar. No parece tener gustos, pero se sabe que es bueno conduciendo autos. Su historial criminal es extenso: robo de aeronaves, fraude, tenencia de cafeína. 

Nombre: **ravachol**
Trabaja en inteligencia militar. Es muy bueno en tiro al blanco; ama los juegos de azar, el ajedrez y también el tiro al blanco. En su historial criminal se encuentra la falsificación de vacunas y fraude.

Nombre: **rosaDubovsky**
Cuando sea grande quiere ser recolector de basura o asesina a sueldo. Es buena construyendo puentes y mirando Peppa Pig. Ama construir puentes, mirar Peppa Pig y la física cuántica.

Nombre: **emmaGoldman**
Trabaja de profesora de judo y cineasta. Es buena en lo que es buena judithButler y también en lo que es buena elisaBachofen. Le gusta todo lo que le gusta a judithButler. No tiene historial criminal.

Nombre: **judithButler**
Trabaja de profesora de judo y en inteligencia militar. Es buena en judo. Le gusta el judo y las carreras de automovilismo. En su historial criminal se encuentra la falsificación de cheques y fraude.

Nombre: **elisaBachofen**
Trabaja de ingeniera mecánica en la Universidad Tecnológica Intergaláctica. Le gusta el fuego y la destrucción. Es buena armando bombas. No tiene historial criminal.

Nombre: **juanSuriano**
No sabemos de qué trabaja. Le gusta y es experto tanto en el judo, como en armar bombas y en el ring-raje. Tiene como antecedentes criminales falsificación de dinero y fraude.

Se pide que genere la base de conocimientos de las personas y de **sebastienFaure**, del que no tenemos información exacta sobre su profesión, gustos o en lo que es bueno. Justifique sus decisiones de diseño.

### Casos de prueba a implementar
 - Las habilidades de Emma Goldman deben ser armar bombas y el judo.
 - Los gustos de Emma Goldman deben ser carreras de automovilismo y el judo.

## Punto 2: Viviendas
La actividad política se encuentra fuertemente restringida, por lo que las agrupaciones que pretenden modificar el orden reinante debieron volverse clandestinas y son buscadas intensamente. Para llevar a cabo sus actividades, utilizan pasadizos y túneles ocultos en las viviendas, utilizando nanotecnología para esconderse.

Sabemos además que
 - bakunin vive en la misma casa con elisaBachofen y rosaDubovsky. A esa casa le suelen decir “La Severino” y tiene un cuarto secreto de 4 x 8, un pasadizo y 3 túneles secretos: uno de 8 metros de largo, uno de 5 metros de largo y uno de 1 metro de largo que parecía estar aún en construcción. 
 - ravachol vive en la Comisaría 48 y es el único que vive allí. La Comisaría 48 no tiene cuartos secretos, ni pasadizos ni túneles secretos.
 - emmaGoldman, juanSuriano y judithButler viven en la casa de papel, que tiene 2 pasadizos, 2 cuartos secretos (uno de 5 x 3 y otro de 4 x 7) y 2 túneles secretos (uno de 9 metros y otro de 2, ambos ya construidos).
 - la casaDelSolNaciente tiene un pasadizo y un túnel secreto de 3 metros sin construir. 
Se pide modelar la base de conocimientos con las viviendas y sus ocupantes.

## Punto 3: Guaridas rebeldes
Uno de nuestros objetivos es encontrar viviendas que sean utilizadas como guaridas de potenciales rebeliones, antes que lo hagan las fuerzas del régimen. Por nuestras estimaciones, se consideran viviendas con potencial rebelde si vive en ella algún posible disidente (ver punto 5) y su superficie destinada a actividad clandestinas supera 50 metros cuadrados, lo que se calcula sumando los metros de cada cuarto, calculados de la siguiente forma:
 - Para los cuartos secretos, que siempre se consideran rectangulares, la superficie cubierta
 - Para los túneles, el doble de su longitud, excepto cuando están en construcción, que no se consideran.
 - Los pasadizos siempre tienen un metro cuadrado de superficie
Resolver este requerimiento de la manera que crea conveniente.

### Casos de prueba a implementar
 - La superficie destinada a actividades clandestinas de La Severino es de 59.
 - La superficie destinada a actividades clandestinas de la Comisaría 48 es de 0.
 - Tanto la casa de papel como la Severino tienen potencial rebelde.

## Punto 4: Aquí no hay quien viva
 - Detectar si en una vivienda no vive nadie.
 - Detectar si en una vivienda todos los que viven tienen al menos un gusto en común.

### Casos de prueba a implementar
 - En la casa del sol naciente no vive nadie.
 - La casa de papel es una vivienda donde todas las personas que viven en ella (emmaGoldman, juanSuriano y judithButler) tienen un gusto en común. También la comisaría 48 donde vive una sola persona (si querés cambiar esa definición hacelo y también modificá el caso de prueba).
 - **BONUS:** si eliminamos el gusto de juanSuriano por el judo, la casaDePapel no debería ser una vivienda con gustos en común

## Punto 5: Rebelde (tal vez)
Poder saber quiénes son posibles disidentes. Una persona se considera posible disidente si cumple todos estos requisitos:
 - Tener una habilidad en algo considerado terrorista. Se considera terrorista armar bombas, tirar al blanco o mirar Peppa Pig.
 - No tener gustos registrados en el sistema o que le guste todo en lo que es bueno.
 - Tener más de un registro en su historial criminal o vivir junto con alguien que sí lo tenga.

### Casos de prueba a implementar
 - elisaBachofen, emmaGoldman, juanSuriano, ravachol y rosaDubovsky tienen habilidades en algo considerado terrorista
 - bakunin, juanSuriano, judithButler, ravachol, rosaDubovsky, sebastienFaure no tienen gustos registrados o bien le gusta todo en lo que son buenos
 - bakunin, elisaBachofen, emmaGoldman, juanSuriano, judithButler, ravachol, rosaDubovsky tienen más de un registro en su historial criminal o viven junto con alguien que sí lo tiene
 - rosaDubovsky, juanSuriano y ravachol son posibles disidentes

## Punto 6: Bunkers
Si en algún momento se agregara algún tipo nuevo de ambiente en las viviendas, por ejemplo bunkers que tienen un perímetro de acceso y una superficie interna, de manera de que la superficie total sea superficie interna + perímetro de acceso. ¿Qué debe modificar de su solución actu|al?
 - Implemente la vivienda laCasaDePatricia que tenga un pasadizo y un bunker de superficie interna 10 y 2 de perímetro de acceso (para no afectar los casos de prueba) y genere un test unitario mostrando cómo calcular la superficie. Haga que en esa casaDePatricia viva sebastienFaure.
 - Relacionarla en términos de acoplamiento.

## Punto 7: Batallón de rebeldes
Queremos saber todas las posibilidades que tenemos a la hora de formar un batallón de rebeldes, las restricciones son:
 - las personas tienen que tener más de un registro en su historial criminal o vivir junto con alguien que sí lo tenga
 - tienen que sumar en total más de 3 habilidades (esto es, incluyendo todas las habilidades de las personas que conformen el batallón).

Indique qué conceptos entran en juego para resolver este requerimiento. 
