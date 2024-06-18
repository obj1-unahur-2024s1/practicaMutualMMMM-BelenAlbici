import viajes.*

class Socio {
	const actividades = []
	var property maximoActividades
	var property edad
	const property idiomas = #{}
	
	method esAdoradorDelSol() = actividades.all({a=>a.paraBroncearse()})
	
	method actividadesEsforzadas() = actividades.filter({a=>a.implicaEsfuerzo()})
	
	method realizarActividad(unaActividad){
		if (actividades.size()< maximoActividades){
			actividades.add(unaActividad)}
		else {self.error("Llegaste a tu maximo de actividades ")
		}
	}
	
	method leAtrae(unaActividad)
	
	
	method realizoActividad(unaActividad){
		actividades.contains(unaActividad)
	}
	
}

class SocioTranquilo inherits Socio{
	
	override method leAtrae(unaActividad){
		return unaActividad.diasActividad() >= 4
	}
}

class SocioCoherente inherits Socio{
	
	override method leAtrae(unaActividad){
		return if (self.esAdoradorDelSol()){
			unaActividad.paraBroncearse()
		}
		else {unaActividad.implicaEsfuerzo()}
	}
}

class SocioRelajado inherits Socio{
	
	override method leAtrae(unaActividad){
		return not idiomas.intersection(unaActividad.idiomas()).isEmpty()
	}
}





