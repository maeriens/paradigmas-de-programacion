import personas.*
import regalos.*

object giftDealer {

	var property personasQueConoce = #{ stefan, justina, pedro }
	var property listaDeRegalos = [ pistaScalextric, yoyo, balero ]
	var property regaloSiNoLeGustaNada = new Voucher()
	var property historicoDelDealer = historico
// ---------------->
	// TP3
	var property metodoSeleccionDeRegalo = regaloMasBarato

// <----------------
	method agregarConocido(persona) {
		personasQueConoce.add(persona)
	}

	method agregarRegalo(regalo) {
		listaDeRegalos.add(regalo)
	}

	method leGustaAlgunRegalo(persona) = listaDeRegalos.any({ regalo => persona.elegirRegalo(regalo) })

	method obtenerInconformistas() = personasQueConoce.filter({ persona => not self.leGustaAlgunRegalo(persona) })

	// TP 2
	method seleccionarRegalo(persona_) {
		const regaloElegido = self.mejorRegalo(persona_)
			// Si no hubiera regalo, tiraría una excepción acá
		const registro = new Registro(persona = persona_, regalo = regaloElegido)
		historicoDelDealer.agregarRegistro(registro)
	}

	// ---------------->
	// TP3
	// Debería haber algún error si no hay regalos, o si no le gusta nada? No son 
	method mejorRegalo(persona) = metodoSeleccionDeRegalo.seleccionRegalo(persona, self)

// le paso el self para que el objeto del metodoSeleccionDeRegalo sepa que dealer es y de donde tomar la lista de regalos 
// Es por si hay más de un dealer (Quizas un dealaer tiene unos regalos que el otro no)
// <----------------
	method filtrarPorCriterio(criterio) = listaDeRegalos.filter(criterio)
	
	method elPrimerRegaloQuecumple(criterio) = listaDeRegalos.find(criterio)

}

// ---------------->
// TP3
object regaloMasBarato {

	// Infalible, el método más piola
	method seleccionRegalo(persona, dealer) = if (dealer.leGustaAlgunRegalo(persona)) self.regaloBarato(persona, dealer) else dealer.regaloSiNoLeGustaNada()

	// Esto porque está el "Le gusta algún regalo", si no revienta
	method regaloBarato(persona, dealer) = self.regalosQueLeGusta(persona, dealer).min({ regalo => regalo.precio() })

	method regalosQueLeGusta(persona, dealer) = dealer.filtrarPorCriterio({ regalo => persona.elegirRegalo(regalo) })

}

object regaloRandom {

	// Si no hay regalos, falla con Exception: Illegal operation
	method seleccionRegalo(persona, dealer) = dealer.listaDeRegalos().anyOne()

}

object regaloQueNoLeGusta {

	// Si no encuentra nada, tira un ElementNotFoundException
	method seleccionRegalo(persona, dealer) = dealer.elPrimerRegaloQueCumple({ regalo => not persona.elegirRegalo(regalo) })

}

// <----------------
class Registro {

	const property fecha = new Date()
	const property persona
	const property regalo
	const property precio = regalo.precio()

}

object historico {

	var property registros = []

	method agregarRegistro(registro) {
		registros.add(registro)
	}

	// Max da error cuando la lista está vacía
	method personaQueMasPlataRecibio() = self.personasEnRegistros().max({ persona => self.totalDeUnaPersona(persona) })

	method personasEnRegistros() = registros.map({ registro => registro.persona() }).asSet()

	method totalDeUnaPersona(persona_) = self.registrosDeUnaPersona(persona_).sum({ registro => registro.precio() })

	method registrosDeUnaPersona(persona_) = registros.filter({ registro => registro.persona() == persona_ })

}

