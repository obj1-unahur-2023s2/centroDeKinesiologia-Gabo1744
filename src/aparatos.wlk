class Magneto {
	const property color = "Blanco"
	var imantacion = 800
	
	method necesitaMantenimiento() = imantacion < 100
	
	method realizarMantenimiento(){
		imantacion += 500
	}
	
	method puedeSerUsadoPor(paciente) = true
	
	method usar(paciente){
		paciente.nivelDeDolor(paciente.nivelDeDolor() * 0.1)
		imantacion = 0.max(imantacion - 1)
	}
}

class Bicicleta {
	const property color = "Blanco"
	var cantDeTornillosDesajustados = 0
	var cantVecesQuePierdeAceite = 0
	
	method cantTornillos() = cantDeTornillosDesajustados
	method cantAceite() = cantVecesQuePierdeAceite
	
	method necesitaMantenimiento(){
		return cantDeTornillosDesajustados >= 10 or cantVecesQuePierdeAceite >= 5
	}
	
	method realizarMantenimiento(){
		cantDeTornillosDesajustados = 0
		cantVecesQuePierdeAceite = 0
	}
	
	method puedeSerUsadoPor(paciente) = paciente.edad() > 8
	
	method unoSiCeroSino(condicion){
		return if(condicion){1}else{0}
	}
	
	method usar(paciente){
		if(not self.puedeSerUsadoPor(paciente)){
			self.error("No puede ser usado por el paciente")
		}
		cantDeTornillosDesajustados += self.unoSiCeroSino(paciente.nivelDeDolor() > 30)
		cantVecesQuePierdeAceite += self.unoSiCeroSino(paciente.nivelDeFortaleza().between(30,50))
		paciente.nivelDeDolor(4)
		paciente.nivelDeFortaleza(3)
	}
	
}

class Minitramp {
	const property color = "Blanco"
	
	method necesitaMantenimiento() = false
	
	method realizarMantenimiento(){}
	
	method puedeSerUsadoPor(paciente) = paciente.nivelDeDolor() < 20
	
	method usar(paciente){
		if(not self.puedeSerUsadoPor(paciente)){
			self.error("No puede ser usado por el paciente")
		}
		paciente.nivelDeFortaleza(paciente.edad() * 0.1)
	}
}
