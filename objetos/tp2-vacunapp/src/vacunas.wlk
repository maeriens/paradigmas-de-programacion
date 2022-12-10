class Vacuna {

	var property costoBase = 1000
	var property costoPorAnioExtra = 50

	method esMayorA(persona, edad) = persona.edad() > edad

	method esMenorA(persona, edad) = persona.edad() < edad

	method calcularAumentoAnticuerpos(persona)

	method calcularFechaInmunidad(persona)

	method costoExtraVacuna(persona)

	method calcularCosto(persona) = self.costoBase(persona) + self.costoExtraVacuna(persona)

	method costoBase(persona) = costoBase + (if (self.esMayorA(persona, 30)) ((persona.edad() - 30) * costoPorAnioExtra) else 0)

}

object paifer inherits Vacuna {

	override method calcularAumentoAnticuerpos(persona) = persona.anticuerpos() * 10

	override method calcularFechaInmunidad(persona) {
		const mesesDeInmunidad = if (self.esMayorA(persona, 40)) 6 else 9
		return (new Date()).plusMonths(mesesDeInmunidad)
	}

	override method costoExtraVacuna(persona) = if (self.esMenorA(persona, 18)) 400 else 100

}

class Larussa inherits Vacuna {

	var property multiplicador
	const maximoMultiplicador = 20
	const fechaInmunidad = new Date(year = 2022, month = 3, day = 3)

	method multiplicadorPorComponentes() = #{ multiplicador, maximoMultiplicador }.min()

	override method calcularAumentoAnticuerpos(persona) = persona.anticuerpos() * self.multiplicadorPorComponentes()

	override method calcularFechaInmunidad(persona) = fechaInmunidad

	override method costoExtraVacuna(persona) = 100 * self.multiplicadorPorComponentes()

}

object astraLaVistaZeneca inherits Vacuna {

	const aumentoDeAnticuerpos = 10000

	method tieneNombreDeLargoPar(persona) = persona.nombre().size().even()

	override method calcularAumentoAnticuerpos(persona) = persona.anticuerpos() + aumentoDeAnticuerpos

	override method calcularFechaInmunidad(persona) {
		const mesesDeInmunidad = if (self.tieneNombreDeLargoPar(persona)) 6 else 7
		return (new Date()).plusMonths(mesesDeInmunidad)
	}

	override method costoExtraVacuna(persona) = if (persona.esEspecial()) 2000 else 0

}

class Combineta inherits Vacuna {

	const property dosis

	method minimoAnticuerposDeDosis(persona) = dosis.min({ vacuna => vacuna.calcularAumentoAnticuerpos(persona) }).calcularAumentoAnticuerpos(persona)

	method maximaFechaInmunidad(persona) = dosis.max({ vacuna => vacuna.calcularFechaInmunidad(persona) }).calcularFechaInmunidad(persona)

	method totalCostosExtra(persona) = dosis.sum({ vacuna => vacuna.calcularCosto(persona) })

	override method calcularAumentoAnticuerpos(persona) = self.minimoAnticuerposDeDosis(persona)

	override method calcularFechaInmunidad(persona) = self.maximaFechaInmunidad(persona)

	override method calcularCosto(persona) = self.costoExtraVacuna(persona)

	override method costoExtraVacuna(persona) = self.totalCostosExtra(persona) + (100 * dosis.size())

}

