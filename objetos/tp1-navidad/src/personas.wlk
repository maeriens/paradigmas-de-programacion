import regalos.*

class PersonaRegalo {
	method elegirRegalo(regalo) = regalo.esInteresante() and self.condicionParticularParaElegirRegalo(regalo)
	method condicionParticularParaElegirRegalo(regalo)
}


object stefan inherits PersonaRegalo {

	var precioTope = 6000

	method configurarValor(nuevoValor) {
		precioTope = nuevoValor
	}

	method regaloBarato(regalo) = regalo.precio() < precioTope

	override method condicionParticularParaElegirRegalo(regalo) = (not regalo.esRegaloValioso()) && self.regaloBarato(regalo)

}

object justina inherits PersonaRegalo {

	var edad = 11

	method cambiarEdad(nuevaEdad) {
		edad = nuevaEdad
	}

	// Esto es por si a futuro hay regalos con precio con coma
	method eligeRegaloPorPrecio(regalo) = regalo.precio() >= 1000 && regalo.precio() < 10000

	override method condicionParticularParaElegirRegalo(regalo) = if (edad.even()) (self.eligeRegaloPorPrecio(regalo)) else regalo.esRegaloValioso()

}

object pedro inherits PersonaRegalo {

	var mejorAmigue = justina

	method cambiarMejorAmigue(nuevoAmigue) {
		mejorAmigue = nuevoAmigue
	}

	override method condicionParticularParaElegirRegalo(regalo) =  mejorAmigue.elegirRegalo(regalo)

}

// ================================================================
// TP 2
object nazarena inherits PersonaRegalo {

	var property desde = 1
	var property hasta = 7
	var property tope = 4
	var property numerador = numeroRandom

	override method condicionParticularParaElegirRegalo(regalo) = numerador.randomDeHasta(desde, hasta) > tope

}

object numeroRandom {

	method randomDeHasta(desde, hasta) = desde.randomUpTo(hasta)

}

class Persona inherits PersonaRegalo {

	const nombre
	const fechaDeNacimiento
	var property precioMinimoViejo = 25000
	var property precioMaximoJoven = 50000

	override method condicionParticularParaElegirRegalo(regalo) =  if (self.esViejo()) regalo.precio() > precioMinimoViejo else regalo.precio() < precioMaximoJoven

	method esViejo() = fechaDeNacimiento.year() < 1990

}

