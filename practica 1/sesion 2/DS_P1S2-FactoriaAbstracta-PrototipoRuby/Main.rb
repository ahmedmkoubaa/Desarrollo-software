require('./FactoriaPrototipoLite.rb');
require('./FactoriaPrototipoPremium.rb');

module DSPrototype
  class Main

    #####################################################################
    # Eleccion del tipo de factoria 
    print "Escoja el tipo de factoria (0 lite, 1 premium): "
    eleccion = gets.chomp.to_i
    
    if (eleccion == 0)
      factoria = FactoriaPrototipoLite.new()
      puts "la factoria es de tipo lite"
    else 
      factoria = FactoriaPrototipoPremium.new()
      puts "la factoria es de tipo premium"
    end
    
    puts "\n\n"
    
    #####################################################################
    # Añadir nuevo cliente
    print "Vamos a añadir un nuevo cliente, introduzca el nombre del nuevo cliente: "
    nombre = gets.chomp
    cliente = factoria.crearCliente(nombre)
    
    puts "el nuevo cliente es: " + cliente.to_string
    
    puts "\n\n"
    
    #####################################################################
    # Añadir un nuevo tecnico
    print "Vamos a añadir un nuevo técnico, introduzca el nombre del nuevo técnico: "
    nombre = gets.chomp
    tecnico = factoria.crearTecnico(false, nombre)
    
    puts "el nuevo tecnico es: " + tecnico.to_string
    
    puts "\n\n"

    #####################################################################
    # Cliente crea nuevo trabajo
    print "El cliente " + cliente.nombre + " va a añadir un nuevo trabajo, introduzca la descripción del trabajo: "
    descripcion = gets.chomp
    
    print "Introduzca el precio máximo que pagaría usted por dicho trabajo: "
    presupuesto = gets.chomp.to_f
    cliente.crear_trabajo(descripcion, presupuesto)
    trabajo = cliente.trabajos[0].nombre
    
    puts "El nuevo trabajo es:  " + trabajo
  
    puts "\n\n"
    
    #####################################################################
    # Añadir un nuevo tecnico
    print "Vamos a añadir un técnico pujador, introduzca el nombre del técnico pujador: "
    nombre = gets.chomp
    tecnico_pujador = factoria.crearTecnico(false, nombre)
    
    puts "el tecnico pujador es: " + tecnico_pujador.to_string
    
    puts "\n\n"
    
    #####################################################################
    puts "Vamos a sacar un trabajo a subasta"
    cliente.trabajos[0].abrir_subasta
    
    print"El tecnico #{tecnico_pujador.nombre} va a hacer una oferta, introduzca la oferta: " 
    presupuesto = gets.chomp.to_f
    cliente.trabajos[0].recibir_puja(tecnico_pujador, presupuesto)
    
    puts "\n\n"
    
    #####################################################################
    print "El tecnico #{tecnico.nombre} va a hacer una oferta, introduzca la oferta " 
    presupuesto = gets.chomp.to_f
    cliente.trabajos[0].recibir_puja(tecnico_pujador, presupuesto)
    
    puts "\n\n"
    
    #####################################################################
    puts "Vamos a cerrar la subasta"
    cliente.trabajos[0].cerrar_subasta
    
    
    
  end
end