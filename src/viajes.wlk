class Viaje {
	const property idiomas = #{}
	
	
	
	method implicaEsfuerzo()
	method paraBroncearse()
	method diasActividad()
	method esInteresante()= idiomas.size()>=2
	
	method esRecomendadaPara(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) and not unSocio.realizoActividad(self)
	}
	

}

class ViajesDePlaya inherits Viaje {
	const largoPlaya 
	
	override method diasActividad() = largoPlaya/500
	override method implicaEsfuerzo()=  largoPlaya> 1200
	override method paraBroncearse()= true
}

class ExcursionCiudad inherits Viaje{
	const atracciones
	
	override method diasActividad()= atracciones /2
	override method implicaEsfuerzo()= atracciones.between(5,8)
	override method paraBroncearse()= false
	override method esInteresante()= super() or atracciones == 5
		
}

class ExcursionCiudadTropical inherits ExcursionCiudad {
	override method diasActividad()= super() + 1
	override method paraBroncearse() = true
}

class SalidaTrekking inherits Viaje{
	var kmSendero 
	var diasDeSol
	
	override method diasActividad()= kmSendero/50
	override method implicaEsfuerzo()= kmSendero > 80
	override method paraBroncearse()= diasDeSol > 200 or (diasDeSol.between(100,200) and kmSendero>120)
	

	override method esInteresante()= super() and diasDeSol > 140
}

class Gimnasia inherits Viaje{
	method initialize(){
		if (idiomas != #{"Espaniol"}){
			self.error("Solo se permiten clases de gimnasia en Español.")
		}
	} 
	override method diasActividad() = 1
	override method implicaEsfuerzo ()= true
	override method paraBroncearse()= false
	
	override method esRecomendadaPara(unSocio){
		return unSocio.edad().between(20,30)
	}
}


class TallerLiterario{
	const librosQueSeTrabaja = #{}
	
	method idiomasUsados() = librosQueSeTrabaja.map({l => l.idioma()}).asSet()
	method diasQueLleva() = librosQueSeTrabaja.size() + 1
	method implicaEsFuerzo() = librosQueSeTrabaja.
	
}

class Libro {
	const property idioma = #{}
	const property cantidadPaginas
	const property nombreAutor
}










