require('./FactoriaPrincipal.rb');
require('./FactoriaPrototipoLite.rb');
require('./FactoriaPrototipoPremium.rb');
require('./Cliente.rb');
require('./Tecnico.rb');
require('./Trabajo.rb')

module DSPrototype
public
class Sistema

	public
	def self.configurarTrabajoPremium(nombre_cliente,nombre_empleo, precio, nombre_tecnico, enActivo)
    factoria = FactoriaPrototipoPremium.new()
	  trabajo = Trabajo.createTrabajoFactoria(factoria,nombre_cliente,nombre_empleo,precio)
	  trabajo.solicita.push(factoria.crearTecnico(enActivo, nombre_tecnico))
	  return trabajo
	end
	
  def self.configurarTrabajoLite(nombre_cliente,nombre_empleo, precio, nombre_tecnico, enActivo)
    factoria = FactoriaPrototipoLite.new()
    trabajo = Trabajo.createTrabajoFactoria(factoria,nombre_cliente,nombre_tecnico,precio)
    trabajo.solicita().push(factoria.crearTecnico(enActivo, nombre_tecnico))
    return trabajo
  end	
	
	def initialize()
		@_unnamed_FactoriaPrincipal_
		@_unnamed_Cliente_
		@_unnamed_Tecnico_
	end
	
	def self.main
    print("\nCreando Premium")
	  premium = self.configurarTrabajoPremium("Ahmed","Arreglar lavabo", 2000.0, "Juan", true)
    print("\nCreando Lite")
	  lite = self.configurarTrabajoLite("Iván","Alicatar", 5000.0, "Ignacio", false)
	  print("\n#{premium.toString()}")
    print("\n#{lite.toString()}")
	end
end
end

DSPrototype::Sistema.main
