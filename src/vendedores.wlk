import ciudades.*
import provincias.*
import certificaciones.*
import centros.*


class Vendedor {
	var property certificaciones = []
	var property esPersonaFisica 
	
	method puedeTrabajar(enCiudad)
	
	method esVersatil() = certificaciones.size() >= 3 and self.certificacionesSiEsVersatil()
	
	method certificacionesSiEsVersatil() {
		 return
		 	self.certificacionesTieneProducto() and self.certificacionesNoTieneProducto()
		 	
	}
	
	method certificacionesTieneProducto() = certificaciones.any({ certificacion => certificacion.sonProductos() })
	
	method certificacionesNoTieneProducto() = certificaciones.any({ certificacion => not certificacion.sonProductos() })
	
	method esFirme() = self.puntajeTotal() >= 30
	
	method esInfluyente()
	
	method puntajeTotal() =  certificaciones.sum({ certificacion => certificacion.puntos() })
	
	method agregarCertificaion(certificacion) = certificaciones.add(certificacion)
	
	method tieneAfinidad(centro) = self.puedeTrabajar(centro.ciudad())
	
}

class VendedorFijo inherits Vendedor {
		var property ciudad
	
	override method puedeTrabajar(enCiudad) = ciudad == enCiudad
	
	override method esInfluyente() = false
	
	override method esPersonaFisica() = true
	
}

class VendedorViajante inherits Vendedor {
	var property provincias = []
	
	override method puedeTrabajar(enCiudad) = provincias.any({ provincia => enCiudad.provincia() == provincia })
	
	override method esInfluyente() = provincias.sum({ provincia => provincia.poblacion() }) >= 10000000
	
	override method esPersonaFisica() = true
	
}

class VendedorComercio inherits Vendedor {
	var property ciudades = []
	
	override method puedeTrabajar(enCiudad) = ciudades.any({ ciudad => enCiudad == ciudad })
	
	override method esInfluyente() = ciudades.size() >= 5 or ciudades.filter({ ciudad => ciudad.provincia() }).asSet().size() >= 3
	
	override method tieneAfinidad(centro) = super(centro.ciudad()) and ciudades.any({ ciudad => not centro.puedeCubrir(ciudad) })
	
	override method esPersonaFisica() = false

}