class Actividad {

	var property idiomas = []
	var property socio = []

	method agregarIdioma(unIdioma) {
		idiomas.add(unIdioma)
	}

	method implicaEsfuerzo() {
		return false
	}

	method sirveParaBroncearse() {
		return false
	}

	method cantidadDias() {
		return 0
	}

	method esInteresante() {
		return idiomas.size() > 1
	}

	method esRecomendada(unaActividad, unSocio) {
		return true
	}

}

class ViajeDePlaya inherits Actividad {

	var property largoPlaya

	override method cantidadDias() {
		return largoPlaya / 500
	}

	override method implicaEsfuerzo() {
		return largoPlaya > 1200
	}

	override method sirveParaBroncearse() {
		return true
	}

	override method esRecomendada(unaActividad, unSocio) {
		return self.esInteresante() and socio.actividadLeAtrae(unaActividad) and unSocio.actividadesRealizadas().isEmpty()
	}

}

class ExcursionACiudad inherits Actividad {

	var property cantidadDeAtraccionesAVisitar

	override method cantidadDias() {
		return cantidadDeAtraccionesAVisitar / 2
	}

	override method implicaEsfuerzo() {
		return cantidadDeAtraccionesAVisitar >= 5
	}

	override method sirveParaBroncearse() {
		return false
	}

	override method esInteresante() {
		return super() or cantidadDeAtraccionesAVisitar == 5
	}

	override method esRecomendada(unaActividad, unSocio) {
		return self.esInteresante() and socio.actividadLeAtrae(unaActividad) and unSocio.actividadesRealizadas().isEmpty()
	}

}

class ExcursionACiudadTropical inherits ExcursionACiudad {

	override method cantidadDias() {
		return super() + 1
	}

	override method sirveParaBroncearse() {
		return true
	}

}

class SalidaTrekking inherits Actividad {

	var property kilometrosDeSenderosARecorrer
	var property cantidadDiasDeSolPorAnio

	override method cantidadDias() {
		return kilometrosDeSenderosARecorrer / 50
	}

	override method implicaEsfuerzo() {
		return kilometrosDeSenderosARecorrer >= 80
	}

	override method sirveParaBroncearse() {
		return cantidadDiasDeSolPorAnio > 200 or (cantidadDiasDeSolPorAnio.between(100, 200) and kilometrosDeSenderosARecorrer > 120)
	}

	override method esInteresante() {
		return super() and cantidadDiasDeSolPorAnio > 140
	}

	override method esRecomendada(unaActividad, unSocio) {
		return self.esInteresante() and socio.actividadLeAtrae(unaActividad) and unSocio.actividadesRealizadas().isEmpty()
	}

}

class ClaseDeGimnasia inherits Actividad {

	const property cantidadDias = 1

	override method idiomas() {
		return [ 'espaniol' ]
	}

	override method implicaEsfuerzo() {
		return true
	}

	override method sirveParaBroncearse() {
		return false
	}

	override method esRecomendada(unaActividad, unSocio) {
		return socio.edad().between(20, 30)
	}

}

class TallerLiterario inherits Actividad {

	var property libros = []

	method comprarLibros(unLibro) {
		libros.add(unLibro)
	}

	method idiomasUsados() {
		return libros.map{ l => l.idiomas() }
	}

	override method cantidadDias() {
		return libros.size() + 1
	}

	override method implicaEsfuerzo() {
		return libros.any{ l => l.cantidadPaginas() > 500 or libros.any{ c => c.nombreAutor() and self.hayMasDeUnLibro() } }
	}

	method hayMasDeUnLibro() {
		return libros.size() > 1
	}

	override method sirveParaBroncearse() {
		return false
	}

	override method esRecomendada(unaActividad, unSocio) {
		return unSocio.idiomas().size() > 1
	}

}

