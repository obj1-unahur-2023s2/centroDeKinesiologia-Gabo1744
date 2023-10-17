import pacientes.*
import aparatos.*

class Rutina{
	const property rutinaAsignada = []
	
	method quitarRutina(){
		rutinaAsignada.clear()
	}
	
	method agregarRutina(aparatos){
		rutinaAsignada.addAll(aparatos)
	}
	
	method quitarAparatoDeRutina(aparato){
		rutinaAsignada.remove(aparato)
	}
	
	method puedeUtilizarAparatosAsignados(paciente) = rutinaAsignada.all({aparato => paciente.puedeUsar(aparato)})
	
	method realizarRutina(paciente){
		if (not self.puedeUtilizarAparatosAsignados(paciente)){
			self.error("No puede realizar la rutina")
		}
		rutinaAsignada.forEach({aparato => paciente.usar(aparato)})
	}
	
	method cantDeVecesQueAparece(aparato){
		rutinaAsignada.count({a => a == aparato})
	}
}