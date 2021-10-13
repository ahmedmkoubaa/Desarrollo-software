require('./Cliente.rb');
require('./Tecnico.rb');

module DSPrototype
  public
  class Trabajo
  
  	public
  	
  	attr_accessor :solicitante, :nombre, :precio, :solicita
  	
  	def subastar()
  		raise "NYI"
  	end
  
  	public
  	def asignar(tecnicoAsignado)
  		solicita.add(tecnicoAsignado)
  	end
  	
  	def abrir_subasta()
  	  @en_subasta = true
  	  puts "Se comienza a subastar el trabajo " + @nombre
  	end
  	
  	def recibir_puja(tecnico_pujador, presupuesto)
  	  if (@en_subasta == true)
  	    if (presupuesto < @precio)
  	      @precio = presupuesto
  	      @solicita.insert(0, tecnico_pujador)
  	      puts "Recibiendo puja del tecnico #{tecnico_pujador.nombre} su oferta es la mejor: #{presupuesto}" 
  	    else 
  	      solicita.push(tecnico_pujador)
  	      puts "La oferta no fue la mejor que se ha recibido, pero se tendra en cuenta"
  	    end  	    
  	  end
  	end
  
  	def cerrar_subasta
  	  if @en_subasta == true
  	    @en_subasta = false
  	    @solicita[0].set_trabajo(self)
  	    
  	    tecnico_ganador = @solicita[0]
  	    
  	    puts "El tecnico #{tecnico_ganador.nombre} ha ganado la puja"
  	  end
  	end
  	
  	def self.createTrabajoCliente(solicitante, nombre, precio)
  	  return Trabajo.new(solicitante,nombre,precio)
  	end
  	
  	def self.createTrabajoFactoria(factoria, nombre_cliente, nombre_trabajo, precio)
  	  solicitante = factoria.crearCliente(nombre_cliente)
  	  trabajo = Trabajo.new(solicitante, nombre_trabajo, precio)
  	  solicitante._crea.push(trabajo);
  	  return trabajo
  	end
  	
  	def toString()
  	  return "Trabajo > [Solicitante : #{@solicitante.toString()} ; Nombre : #{@nombre} ; Solicitan : #{@solicita} ; Precio : #{@precio}]"
  	end
  	
  	public
  	def initialize(solicitante,nombre,precio)
  		@solicitante = solicitante
  		@nombre = nombre
  		@precio = precio
  		@solicita = Array.new()
  		@en_subasta = false
  	end
  	

  	
  	
  end
end
