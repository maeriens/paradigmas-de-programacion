# Parcial Objetos - La Oficina

__El parcial está tal cuál se entregó, con las correcciones correspondientes__

Queremos modelar la dinámica de trabajo que ocurre en una particular oficina ~~para un cliente muy importante~~ porque tetnemos ganas de tomar un parcial de The Office y listo, qué tanto

# Punto 1: Qué tarea le gusta a quién
Queremos saber qué tarea le gusta hacer a qué persona. A todo el mundo le gusta hacer un trabajo corto (estimado en menos de 30 minutos), y además
- A Pam le gusta la tarea que involucre a Jim
- A Jim le gusta la tarea si hay que hacerla en el exterior
- A Dwight le gusta la tarea si tiene más de 100 puntos de recompensa (ver punto 2).
- Al resto le gusta si hay más de 3 personas involucradas en la tarea

# Punto 2: Trabajás, te cansas, ¿Qué ganás?
Como habrán visto, vada tarea involucra
- Personas que la realizan
- Una descripción
- El tiempo estimado de realización (en minutos)
- El tiempo en el que efectivamente se hizo (también en minutos)
- Si se debe hacer en la oficina o en el exterior
- La fecha límite que debe realizarse
- Más información que va a necesitar modelar vos

Las tareas pueden tener diferentes puntos de recompensa:
- Algunas tareas suman 50 puntos de recompensa si se hacen en el exterior
- Otras tareas suman 30 puntos de recompensa por cada día en el que se haya hecho la tarea antes de la fecha límite en la que debería realizarse. Ej.: si la fecha límite era el 26/12 y se realizó el 22/12, se recompensa con 120 puntos = (4 * 30). Si se cumple a tiempo, no tiene recompensa, lo mismo que si se pasa de la fecha límite. Si la tarea no está hecha, asumir la fecha del día para hacer el cálculo.
- Otras tareas suman 20 puntos de recompensa si se hacen entre 3 o más personas (como premio a cohesión de equipo), o 10 en caso contrario.
- Por último algunas tareas suman 5 puntos por cada minuto menos que tardaron en hacer la tarea, hasta un máximo de 100. Por ejemplo, si la tarea estaba estimada en 60 minutos y lo hicieron en 52 minutos, tienen 5 * (60 - 52) = 5 * 8 = 40 puntos. Si en cambio lo hicieron en 30, tienen 5 * (60 - 30) = 5 * 30 = 150, quedan 100 puntos.

Nos interesa poder agregar o eliminar a futuro nuevos tipos de recompensa. Al preguntar por los puntos de recompensa de una tarea, debe devolver la sumatoria.

# Punto 3: Asignar una persona a una tarea
Queremos poder asignar una persona a una tarea, para lo cual
- Debe gustarle la tarea en cuestión
- La tarea debe tenr al menos un punto de recompensa
- No debe estar cumplida

Si no se cumple cualquiera de esos casos se puede agregar a la persona. En caso contrario debemos poder asociar la tarea y la persona.

# Punto 4: Al final de cuentas él era mi recompensa
Queremos saber los nombres de las personas que hicieron alguna tarea con una recompensa mayor a 100 puntos

# Punto 5: Equipos
Por último queremos permitir que una tarea se asigne a personas o equipos de forma indistinta. Un equipo se compone de una persona que coordina y las otras que hacen el trabajo. Para saber si a un equipo le gusta la tarea, eso depende de que a todas las personas les guste esa tarea (incluyendo a la persona que coordina). Realice los cambios necesarios para que los puntos 1 a 4 se puedan resolver.