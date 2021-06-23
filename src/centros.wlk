import vendedores.*
import ciudades.*
import provincias.*
import certificaciones.*

class Centro {
	var property ciudad
	var property vendedores = []
	
	method agregarVendedor(vendedor) = 
		if (vendedores.contains(vendedor)) self.error("Ya se encuentra el vendedor")
		else vendedores.add(vendedor)
		
	method vendedorEstrella() = vendedores.max({ vendedor => vendedor.puntajeTotal() })
	
	method puedeCubrir(laCiudad) = vendedores.any({ vendedor => vendedor.puedeTrabajar(laCiudad) })
	
	method vendedoresGenericos() = vendedores.filter({ vendedor => vendedor.certificacionesNoTieneProducto() })
	
	method esRobusto() = vendedores.count({ vendedor => vendedor.esFirme() }) >= 3
	
	method repartirCertificacion(certificacion) = vendedores.forEach({ vendedor => vendedor.agregarCertificaion(certificacion) })
	
	method esCandidato(vendedor) = vendedor.esVersatil() and vendedor.tieneAfinidad(self)
	
}
