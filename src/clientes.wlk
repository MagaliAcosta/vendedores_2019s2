import vendedores.*
import certificaciones.*

class Cliente {
	
	method puedeSerAtendidoPor(vendedor)
}

class ClienteInseguro inherits Cliente {
	
	override method puedeSerAtendidoPor(vendedor) = vendedor.esVersatil() and vendedor.esFirme()
	
}

class ClienteDetallista inherits Cliente {
	
	override method puedeSerAtendidoPor(vendedor) = vendedor.certificaciones().count({ certificacion => certificacion.sonProductos() }) >= 3
	
}

class ClienteHumanista inherits Cliente {
	
	override method puedeSerAtendidoPor(vendedor) = vendedor.esPersonaFisica()
	
}