require('./ClientePremium.rb');
require("./TecnicoPremium")
require('./FactoriaPrincipal.rb');

module DSPrototype
public

# La siguiente clase crea prototipos de productos de la línea premium
class FactoriaPrototipoPremium < FactoriaPrincipal

  public
  
    # Crea un prototipo de un cliente premium
    def crearCliente(nombre)
      cliente = ClientePremium.clone
      cliente.nombre = nombre
      return cliente
    end
    
    # Crea un prototipo de un tecnico premium
    def crearTecnico(enActivo, nombre)
      tecnico = TecnicoPremium.clone
      tecnico.nombre=(nombre)
      tecnico.enActivo=(enActivo)
      return tecnico
    end
    
end
end
