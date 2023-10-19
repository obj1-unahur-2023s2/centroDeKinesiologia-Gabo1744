import pacientes.*
import aparatos.*

object centroKinesiologia {
	const property aparatos = #{}
	const property pacientes = #{}
	
	method agregarAparato(aparato){
		aparatos.add(aparato)
	}
	
	method agregarPaciente(paciente){
		pacientes.add(paciente)
	}
	
	method agregarAparatos(coleccionAparatos){
		aparatos.addAll(coleccionAparatos)
	}
	
	method agregarPacientes(coleccionPacientes){
		pacientes.addAll(coleccionPacientes)
	}
	
	method quitarPaciente(paciente){
		pacientes.remove(paciente)
	}
	
	method quitarAparato(aparato){
		aparatos.remove(aparato)
	}
	
	method coloresDeAparatos(){
		return aparatos.map({aparato => aparato.color()}).asSet()
	}
	
	method pacientesMenoresA(anios){
		return pacientes.filter({paciente => paciente.edad() < 8})
	}
	
	method pacientesQueNoPuedenRealizarRutina(){
		return pacientes.filter({paciente => not paciente.puederealizarRutina()})
	}
	
	method realizarRutinas(){
		if(not self.pacientesQueNoPuedenRealizarRutina().isEmpty()){
			self.error("algunos pacientes no pueden realizar sus rutinas")
		}
		pacientes.forEach({paciente => paciente.realizarRutina()})
	}
	
	method estanLosAparatosEnOptimasCondiciones(){
		return aparatos.all({aparato => not aparato.necesitaMantenimiento()})
	}
	
	method aparatosComplicados(){
		return aparatos.filter({aparato => aparato.necesitaMantenimiento()})
	}
	
	method estaComplicado(){
		return self.aparatosComplicados().size() >= aparatos.size() / 2
	}
	
	method realizarVisitaTecnica(){
		self.aparatosComplicados().forEach({aparato => aparato.realizarMantenimiento()})
	}
}
