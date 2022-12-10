import vacunas.*
import personas.*

const larussa2 = new Larussa(multiplicador = 2)

const larussa5 = new Larussa(multiplicador = 5)

const cocktailCombineta = new Combineta(dosis = #{ larussa2, paifer })

const gente = new Persona(nombre = "Messi", edad = 34, anticuerpos = 30000, inmunidadHasta = new Date(), ubicacion = "Rosario", eleccionDeVacunas = cualquierosa)

object planDeVacunacion {

	var personas = #{  }
	var property vacunas = #{ paifer, larussa2, larussa5, astraLaVistaZeneca, cocktailCombineta }

	method agregarPersona(persona) {
		personas.add(persona)
	}

	method leGustaAlgunaVacuna(persona) = vacunas.any({ vacuna => persona.aceptaVacuna(vacuna) })

	method personasQueSeAplicanVacunas() = personas.filter({ persona => self.leGustaAlgunaVacuna(persona) })

	method vacunasQueSeAplicaria(persona) = vacunas.filter({ vacuna => persona.aceptaVacuna(vacuna) })

	method vacunaMasBarataQueElige(persona) = self.vacunasQueSeAplicaria(persona).min({ vacuna => vacuna.calcularCosto(persona) })

	method costoVacunaMasBarataQueElige(persona) = self.vacunaMasBarataQueElige(persona).calcularCosto(persona)

	method costoDelPlan() = self.personasQueSeAplicanVacunas().sum({ persona => self.costoVacunaMasBarataQueElige(persona) })

}

