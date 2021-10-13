require('./Tecnico.rb');

module DSPrototype
public
class TecnicoLite < Tecnico

  protected
    def self.clone()
      return TecnicoLite.new(@enActivo,@nombre)
    end
  
    public
    def initialize(enActivo,unNombre)
      super(enActivo,unNombre)
      @_solicita = Array.new()
      @valoracion = 0.0
    end
    
  attr_accessor :_solicita, :enActivo, :nombre, :valoracion
end
end
