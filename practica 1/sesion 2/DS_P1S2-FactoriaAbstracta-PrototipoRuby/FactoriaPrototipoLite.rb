require('./FactoriaPrincipal.rb');
require "./ClienteLite.rb"
require "./TecnicoLite.rb"

module DSPrototype
public

  # La siguiente clase crea prototipos de productos de la línea Lite
class FactoriaPrototipoLite < FactoriaPrincipal

	public
	
	def initialize()
	  puts "creando factoria prototipo lite"
	end
	
	# Crea un cliente con el nombre pasado como parámetro
	def crearCliente(nombre)
    cliente = ClienteLite.clone
    cliente.nombre = nombre
    return cliente
	end
	
	# Crea un tecnico con los parámetros pasados por parametro
	def crearTecnico(enActivo,nombre)
    tecnico = TecnicoLite.clone
    tecnico.nombre = nombre
    tecnico.enActivo = enActivo
    return tecnico
	end
end
 end
