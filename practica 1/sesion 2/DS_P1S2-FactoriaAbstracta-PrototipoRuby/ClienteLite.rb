require('./Cliente.rb');

module DSPrototype
public
class ClienteLite < Cliente

  protected
   def self.clone
       return ClienteLite.new(@nombre)
   end
 
   public
   def initialize(nombre)
     # @AttributeType Trabajo
     # # @AssociationType Trabajo
     # # @AssociationMultiplicity 1..*
     super(nombre)
   end
	
   public
  attr_accessor :trabajos, :nombre, :importancia
end
end
