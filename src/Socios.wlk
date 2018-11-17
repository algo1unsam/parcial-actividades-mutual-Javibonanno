import Actividades.*

class Socio {

	var property actividades = []
	var property actividadesRealizadas = []
	var property maximoDeActividadesQuePuedeRealizar
	var property idiomas = []
	var property edad

	method agregarActividad(unaActividad) {
		actividades.add(unaActividad)
	}

	method agregarIdioma(unIdioma) {
		idiomas.add(unIdioma)
	}

	method realizarActividad(unaActividad) {
		if (actividades.size() <= maximoDeActividadesQuePuedeRealizar) {
			actividadesRealizadas.add(unaActividad)
		} else {
			self.error("No puede realizar la actividad porque supero su maximo permitido")
		}
	}

	method esAdoradorDelSol() {
		return actividadesRealizadas.all{ a => a.sirveParaBroncearse() }
	}

	method actividadesEsforzadas() {
		return actividadesRealizadas.filter{ a => a.implicaEsfuerzo() }
	}

	method actividadLeAtrae(unaActividad) {
		return true
	}

}

class SocioTranquilo inherits Socio {

	override method actividadLeAtrae(unaActividad) {
		return unaActividad.cantidadDias() >= 4
	}

}

class SocioCoherente inherits Socio {

	override method actividadLeAtrae(unaActividad) {
		if (self.esAdoradorDelSol()) {
			return unaActividad.sirveParaBroncearse()
		} else {
			return unaActividad.implicaEsfuerzo()
		}
	}

}

class SocioRelajado inherits Socio {

	override method actividadLeAtrae(unaActividad) {
		return unaActividad.idiomas().contains(idiomas)
	}

}

