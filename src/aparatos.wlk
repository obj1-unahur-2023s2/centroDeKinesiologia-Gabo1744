class Magneto {
	
	method puedeSerUsadoPor(paciente) = true
	
	method usar(paciente){
		paciente.nivelDeDolor(paciente.nivelDeDolor() * 0.1)
	}
}

class Bicicleta {
	
	method puedeSerUsadoPor(paciente) = paciente.edad() > 8
	
	method usar(paciente){
		if(not self.puedeSerUsadoPor(paciente)){
			self.error("No puede ser usado por el paciente")
		}
		paciente.nivelDeDolor(4)
		paciente.nivelDeFortaleza(3)
	}
	
}

class Minitramp {
	
	method puedeSerUsadoPor(paciente) = paciente.nivelDeDolor() < 20
	
	method usar(paciente){
		if(not self.puedeSerUsadoPor(paciente)){
			self.error("No puede ser usado por el paciente")
		}
		paciente.nivelDeFortaleza(paciente.edad() * 0.1)
	}
}
