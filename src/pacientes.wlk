import aparatos.*

class Paciente{
	var property edad
	var nivelDeDolor
	var nivelDeFortaleza
	const property rutinaAsignada = []
	
	method quitarRutina(){
		rutinaAsignada.clear()
	}
	
	method agregarRutina(aparatos){
		rutinaAsignada.addAll(aparatos)
	}
	
	method nivelDeFortaleza() = nivelDeFortaleza
	method nivelDeDolor() = nivelDeDolor
	
	method nivelDeDolor(cant){
		nivelDeDolor = 0.max(nivelDeDolor - cant)
	}
	
	method nivelDeFortaleza(cant){
		nivelDeFortaleza += cant
	}
	
	method puedeUsar(aparato) = aparato.puedeSerUsadoPor(self)
	
	method usar(aparato){
		aparato.usar(self)
	}
	
	method puederealizarRutina() = rutinaAsignada.all({aparato => self.puedeUsar(aparato)})
	
	method realizarRutina(){
		if (not self.puederealizarRutina()){
			self.error("No puede realizar la rutina")
		}
		rutinaAsignada.forEach({aparato => self.usar(aparato)})
	}
	
}

class PacienteResidente inherits Paciente{
	
	override method realizarRutina(){
		super()
		nivelDeFortaleza = rutinaAsignada.size()
	}
	
}

class PacienteCaprichoso inherits Paciente{
	
	method alMenosUnoEsDeColor(color){
		return rutinaAsignada.any({aparato => aparato.color() == color})
	}
	
	override method puederealizarRutina(){
		return super() and self.alMenosUnoEsDeColor("Rojo")
	}
	
	override method realizarRutina(){
		super()
		super()
	}	
}

class PacienteRapidaRecuperacion inherits Paciente{
	var property valorDecremento = 3
	
	override method realizarRutina(){
		super()
		nivelDeDolor -= valorDecremento
	}	
}