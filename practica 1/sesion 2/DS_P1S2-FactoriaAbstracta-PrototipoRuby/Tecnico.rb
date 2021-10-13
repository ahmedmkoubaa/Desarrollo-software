require('./Trabajo.rb');

module DSPrototype
public
class Tecnico

	protected
	def self.clone()
		return Tecnico.new(@enActivo,@nombre)
	end

	private
	def initialize(enActivo,unNombre)
		@_solicita = nil
		@enActivo = enActivo
		@nombre = unNombre
		@valoracion
	end
	

	
	public
	def to_string()
    return "\nTecnico > [Nombre : #{@nombre} ; Valoración : #{@valoracion} ; ¿Es en activo? : #{@enActivo} ; Trabajos pedidos : #{@_solicita} ]"
	end
	
	# Metodo para asignar el trabajo que realizará el tecnico
	def set_trabajo(trabajo_a_realizar)
	  @_solicita = trabajo_a_realizar
	end
	
	attr_accessor :_solicita, :enActivo, :nombre, :valoracion
end
end
