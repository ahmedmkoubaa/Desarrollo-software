require('./Tecnico.rb');

module DSPrototype
public
class TecnicoPremium < Tecnico

	protected
	def self.clone()
		return TecnicoPremium.new(@enActivo,@nombre)
	end

	public
	def initialize(enActivo,unNombre)
    super(enActivo,unNombre)
	  @_solicita = Array.new()
    @valoracion = 3.0
	end
	
	public
	def to_string()
	  return super
	end
	
  attr_accessor :_solicita, :enActivo, :nombre, :valoracion
end
end
