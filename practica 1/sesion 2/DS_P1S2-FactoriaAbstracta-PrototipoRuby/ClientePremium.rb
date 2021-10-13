require('./Cliente.rb');

module DSPrototype
public
class ClientePremium < Cliente

  protected
     def self.clone
         return ClientePremium.new(@nombre)
     end
   
     public
     def initialize(nombre)
       # @AttributeType Trabajo
       # # @AssociationType Trabajo
       # # @AssociationMultiplicity 1..*
       super(nombre)
       @importancia = 2.0
     end
    
     public
    attr_accessor :trabajos, :nombre, :importancia
    
end
end
