// ---------------->
// TP3
class Regalo {

	var property marca

	method marcaConCantidadParDeLetras() = marca.size().even()

	// Esto es porque si quiero cambiar el criterio de interesante, lo cambio en un sólo lugar
	method esInteresante() = self.marcaConCantidadParDeLetras() and self.condicionParaElegirRegalo()
	
	method condicionParaElegirRegalo()

}

// <----------------
object pistaScalextric inherits Regalo (marca = "scalextric") {

	var precio = 27300
	var cantidadDeAutos = 2
	const costoAuto = 5250
	const precioValioso = 27500

	method precio() = precio

	method agregarAutos(autos) {
		precio = precio + costoAuto * autos
		cantidadDeAutos = cantidadDeAutos + autos
	}

	method esRegaloValioso() = precio > precioValioso

// ---------------->
	// TP3
	override method condicionParaElegirRegalo() = self.esRegaloValioso()

// <----------------
}

object yoyo inherits Regalo (marca = "rusell") {

	var color = "azul"
	const precioBase = 5000
	const precioExtra = 1500
	const coloresCaros = [ "rojo", "azul" ]
	const coloresValiosos = [ "amarillo", "azul" ]
	const colorNoInteresante = 'rojo'

	method pintarDe(nuevoColor) {
		color = nuevoColor
	}

	method precio() = if (coloresCaros.contains(color)) (precioBase + precioExtra) else precioBase

	method esRegaloValioso() = coloresValiosos.contains(color)

// ---------------->
	// TP3
	override method condicionParaElegirRegalo() = color != colorNoInteresante

// <----------------
}

object balero inherits Regalo (marca = "balerino") {

	const precioBase = 14100
	const precioAdorno = 1900
	const precioConAdorno = precioBase + precioAdorno
	var property tieneAdornoMetalico = false
	const precioCaro = 15000

	method precio() = if (tieneAdornoMetalico) precioConAdorno else precioBase

	method esRegaloValioso() = tieneAdornoMetalico

// ---------------->
	// TP3
	method esCaro() = self.precio() > precioCaro

	override method condicionParaElegirRegalo() =  self.esCaro()

// <----------------
}

const marcasCaras = #{ 'Jordache', 'Feraldy', 'Charro' }

// No aclara si la ropa es valiosa.
class Ropa inherits Regalo {

	const fechaDeConfeccion
	const precioBase
	const property precioExtraMarcaCara = 5000
	const porcentajeEnLiquidacion = 0.8

	method precioPorMarca() = precioBase + if (self.esDeMarcaCara()) precioExtraMarcaCara else 0

	method esDeMarcaCara() = marcasCaras.contains(marca)

	method precio() = self.precioPorMarca() * if (self.enLiquidacion()) porcentajeEnLiquidacion else 1

	method enLiquidacion() = (new Date() - fechaDeConfeccion) > 90

// ---------------->
	// TP3
	method totalValorExtra() = self.precio() - precioBase

	override method condicionParaElegirRegalo() =  self.totalValorExtra() < 5000

// <----------------	
}

class Voucher inherits Regalo (marca = "boxbig") {

	var property precio = 5000
	var property fechaDeVencimiento = (new Date()).plusMonths(3)
	var property esRegaloValioso = true

// ---------------->
	// TP3
	method vencido() = fechaDeVencimiento < new Date()

	override method condicionParaElegirRegalo() =  not self.vencido()

// <----------------	
}

