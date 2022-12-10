class NoMeVacunoException inherits Exception {

}

const mensajeSiNoElijeVacuna = "A la persona no le pinta la vacuna provista"

const ubicacionesEspeciales = #{ 'Tierra del Fuego', 'Santa Cruz', 'Neuquén' }

class Persona {

	const property nombre
	const property edad
	var property anticuerpos
	var property inmunidadHasta
	const ubicacion
	var property eleccionDeVacunas
	const property historialDeVacunas = []

	method esEspecial() = ubicacionesEspeciales.contains(ubicacion)

	method aceptaVacuna(vacuna) = eleccionDeVacunas.elijeVacuna(vacuna, self)

	method aceptaTurno(vacuna) {
		if (!self.aceptaVacuna(vacuna)) throw new NoMeVacunoException(message = mensajeSiNoElijeVacuna)
		self.aplicar(vacuna)
		historialDeVacunas.add(vacuna)
	}

	method aplicar(vacuna) {
		anticuerpos = vacuna.calcularAumentoAnticuerpos(self)
		inmunidadHasta = vacuna.calcularFechaInmunidad(self)
	}

}

object cualquierosa {

	method elijeVacuna(vacuna, persona) = true

}

object anticuerposa {

	method elijeVacuna(vacuna, persona) = vacuna.calcularAumentoAnticuerpos(persona) > 100000

}

object inmunidosaFija {

	const fechaLimite = new Date(year = 2022, month = 3, day = 5)

	method elijeVacuna(vacuna, persona) = vacuna.calcularFechaInmunidad(persona) >= fechaLimite

}

class InmunidosaVariable {

	const mesesDeInmunidad

	method elijeVacuna(vacuna, persona) = vacuna.calcularFechaInmunidad(persona) >= (new Date()).plusMonths(mesesDeInmunidad)

}

