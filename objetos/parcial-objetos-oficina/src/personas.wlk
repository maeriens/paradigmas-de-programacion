import exception.*

// NOTA: 9 (nueve)

// PUNTO 1: 3 puntos
// PUNTO 2: 3,75 puntos
// PUNTO 3: 2 puntos
// PUNTO 4: 0,5 puntos
// PUNTO 5: 2 puntos

/*
 * EL PUNTO 4 ES EL ULTIMO TEST EN TESTSPERSONAS
 */
class ElementoQueHaceTareas {

	const property tareas = #{}

	method leGustaHacerLaTarea(tarea) = tarea.esCorta() and self.condicionParaGustarleLaTarea(tarea)

	method condicionParaGustarleLaTarea(tarea)

	method agregarTarea(tarea) {
		tareas.add(tarea)
	}

}

class PersonaBase inherits ElementoQueHaceTareas {

	var property nombre

	method hizoUnaTareaConMasDe(puntaje) = tareas.any({ tarea => tarea.calcularPuntosDeRecompensa() > puntaje })

}

class Equipo inherits ElementoQueHaceTareas {

	var property coordinador
	var property involucrados = #{}

	method leGustaLaTareaALosInvolucrados(tarea) = involucrados.all({ persona => persona.leGustaHacerLaTarea(tarea) })

	method leGustaLaTareaAlCoordinador(tarea) = coordinador.leGustaHacerLaTarea(tarea)

	override method condicionParaGustarleLaTarea(tarea) = self.leGustaLaTareaAlCoordinador(tarea) and self.leGustaLaTareaALosInvolucrados(tarea)

	// el método no está bien ubicado, tenías que armar un objeto que conociera todas las tareas
	method hicieronMasQuePuntosBuscados() = involucrados.filter({ persona => persona.hizoUnaTareaConMasDe(100) })

	method nombresDeLosQueHicieronTareasConMuchosPuntos() = self.hicieronMasQuePuntosBuscados().map({ persona => persona.nombre() })

}

class PersonaGenerica inherits PersonaBase {

	// Podrías haber delegado a la tarea la cantidad de participantes
	override method condicionParaGustarleLaTarea(tarea) = tarea.participantes().size() > 3

}

object jim inherits PersonaBase(nombre = "Jim") {

	override method condicionParaGustarleLaTarea(tarea) = tarea.esAlExterior()

}

object pam inherits PersonaBase(nombre = "Pam") {

	// jim no debería estar hardcodeado, debería ser una referencia
	// delegar a tarea: tarea.asignadaA(personaDeInteres)
	override method condicionParaGustarleLaTarea(tarea) = tarea.participantes().contains(jim)

}

object dwight inherits PersonaBase(nombre = "Dwight") {

	override method condicionParaGustarleLaTarea(tarea) = tarea.calcularPuntosDeRecompensa() > 100

}

class Persona inherits PersonaBase {

	// se repite la necesidad de delegar
	override method condicionParaGustarleLaTarea(tarea) = tarea.participantes().size() > 3

}
