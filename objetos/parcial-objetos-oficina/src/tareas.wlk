import exception.*

class Tarea {

	var property participantes = #{}
	var property descripcion
	var property duracionEstimada
	var property duracionFinal
	var property esAlExterior
	var property fechaLimite
	var property fechaFinalizacion = null
	const property tiposDeRecompensa = #{}

	method esCorta() = duracionEstimada < 30

	method calcularPuntosDeRecompensa() = tiposDeRecompensa.sum({ tipo => tipo.puntaje(self) })

	method estaFinalizada() = fechaFinalizacion !== null

	method finalizar() {
		fechaFinalizacion = new Date()
	}

	method agregarRecompensa(recompensa) = tiposDeRecompensa.add(recompensa)

	method agregarParticipante(persona) {
		if (not persona.leGustaHacerLaTarea(self)) {
			throw new UserException(message = "A la persona no le gusta hacer esta tarea, no puede ser agregada")
		}
		if (self.calcularPuntosDeRecompensa() < 1) {
			throw new UserException(message = "La tarea no ofrece puntos de recompensa, no puede agregarsele una persona")
		}
		if (self.estaFinalizada()) {
			throw new UserException(message = "No se pueden agregar personas a tareas finalizadas")
		}
		participantes.add(persona)
	}

}

