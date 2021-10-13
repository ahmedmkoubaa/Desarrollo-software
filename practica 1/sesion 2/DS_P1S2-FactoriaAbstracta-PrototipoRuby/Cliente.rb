require('./Trabajo.rb');

module DSPrototype
public
class Cliente

	protected
  def clone
      return Cliente.new(@nombre,@importancia)
  end

	private
	def initialize(nombre)
		# @AttributeType Trabajo
		# # @AssociationType Trabajo
		# # @AssociationMultiplicity 1..*
		@trabajos = Array.new()
		@nombre = nombre
		@importancia = 1
	end
	
	public
	def to_string()
	  return "Cliente > [Nombre : #{@nombre} ; Importancia : #{@importancia} ; Trabajos creados : #{@trabajos} ]"
	end
	
	def crear_trabajo(descripcion, presupuesto)
	  trabajos.push(Trabajo.new(self,descripcion,presupuesto))
	end
	
	
	attr_accessor :trabajos, :nombre, :importancia
end
end
