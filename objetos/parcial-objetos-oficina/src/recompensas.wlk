// Para agregar una simplemente hay que tener un objeto que entienda el metodo puntaje
// Una clase abstracta solo con ese metodo no esnecesaria
object queSeaAfuera {

	method puntaje(tarea) = if (tarea.esAlExterior()) 50 else 0

}

object dependeLaFecha {

	const puntosPorDia = 30

	method calcularDiasAntes(tarea) {
		const fechaFinal = if (tarea.estaFinalizada()) tarea.fechaFinalizacion() else new Date()
		return tarea.fechaLimite() - fechaFinal
	}

	method diasValidosParaPuntaje(tarea) = 0.max(self.calcularDiasAntes(tarea))

	method puntaje(tarea) = puntosPorDia * self.diasValidosParaPuntaje(tarea)

}

object cohesion {

	// otra vez falta la cantidad de participantes
	method puntaje(tarea) = if (tarea.participantes().size() >= 3) 20 else 10

}

object microManagement {

	method calcularMinutosDeMenos(tarea) = tarea.duracionEstimada() - tarea.duracionFinal()

	method tardaronMenos(tarea) = self.calcularMinutosDeMenos(tarea) > 0

	method calcularPuntoPorMinutoMenos(tarea) = 5 * (0.max(self.calcularMinutosDeMenos(tarea)))

	// era hasta un máximo de 100 (falta el 100.min...)
	method puntaje(tarea) = if (self.tardaronMenos(tarea)) self.calcularPuntoPorMinutoMenos(tarea) else 0

}
