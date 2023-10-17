import aparatos.*

class Paciente{
	var property edad
	var nivelDeDolor
	var nivelDeFortaleza
	var rutina
	
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
	
	method realizarRutina(){
		rutina.realizarRutina(self)
	}
}

class Residente inherits Paciente{
	
	override method realizarRutina(){
		super()
		rutina.rutinaAsignada().forEach({aparato => nivelDeFortaleza += rutina.cantDeVecesQueAparece(aparato)})
	}
}