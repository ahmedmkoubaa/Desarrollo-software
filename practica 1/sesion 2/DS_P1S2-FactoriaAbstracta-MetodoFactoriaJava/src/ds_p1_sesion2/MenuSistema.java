/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ds_p1_sesion2;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Vector;

/**
 *
 * @author Ahmed El Moukhtari
 */
public class MenuSistema {
    
    private ArrayList<Tecnico> tecnicos = new ArrayList<Tecnico>();
    private ArrayList<Cliente> clientes = new ArrayList<Cliente>();
    
    private Cliente clienteActual = null;
    private Tecnico tecnicoActual = null;
    private Trabajo trabajoActual = null;
    
    private AutoSubastador autoSubastador;
    
    private Vector<Trabajo> trabajosActuales = null;
    private Vector<Trabajo> trabajosSubastados = new Vector<Trabajo>();;
    
    private Scanner scanner = new Scanner (System.in);
    private FactoriaUsuarios factoria;
    
    public MenuSistema(){
        System.out.println("*Menu del sistema creado*");
        tecnicos.add(new Tecnico(true,"AutoBidder"));
    }
    
    // Seleccionar una de nuestras lineas de productos, por ahora tenemos 2, lite y premium
    private void seleccionarLinea(){
        mensajeEleccion();
        System.out.println("\t 1) Linea lite");
        System.out.println("\t 2) Linea Premium");
        
        int eleccion = leerOpcion(1, 2);
        
        switch(eleccion) {
            case 1: factoria = new FactoriaUsuariosLite();      break;
            case 2: factoria = new FactoriaUsuariosPremium();   break;
            default: System.out.println("Error");               break;
        }
    }
    
    // Menu inicial con el que se controlará todo el sistema
    public void menuInicial(){
       
        // Antes de comenzar a ejecutar instrucciones escogeremos el tipo de línea
        seleccionarLinea(); 
        Boolean atras = false;
        while (!atras){
            // Mostramos principales opciones
            mensajeEleccion();
            System.out.println("\t 1) Añadir cliente");
            System.out.println("\t 2) Añadir tecnico");
            System.out.println("\t 3) Seleccionar cliente");
            System.out.println("\t 4) Seleccionar tecnico");
            System.out.println("\t 5) Mostrar trabajos en subasta");
            System.out.println("\t 6) Atras");

            int eleccion = leerOpcion(1, 6);

            switch(eleccion){
                case 1: aniadirCliente();             break;
                case 2: aniadirTecnico();             break;
                case 3: seleccionarCliente();         break;
                case 4: seleccionarTecnico();         break;
                case 5: listarTrabajosSubastados();   break;
                case 6: atras = true;                 break;
                default: System.out.println("Error"); break;
            }
        }
       
    }
    
    // Lee un enetero entre min y max ambos incluidos
    private int leerOpcion(int min, int max){
        Boolean leer = true;
        
        int eleccion = min - 1;
        while (leer && (min <= max)) {
            eleccion = scanner.nextInt();
            leer = (eleccion < min || eleccion > max);
            
            if (leer){
                System.out.println("Número erróneo, introduzca un dígito entre " +  min + " - " + max);
            }
        }
        
        return eleccion;
    }
    
    // Mensaje que se mostrará para informar al usuario de que debe elegir
    private void mensajeEleccion(){
        System.out.println("Elija una opción");
    }
    
    // Aniadir cliente de la linea correspondiente
    private void aniadirCliente(){
        System.out.print("Introduzca el nombre del cliente: ");
        
        scanner.nextLine(); // pasar a la siguiente linea
        String nombreCliente = scanner.nextLine();
        
        clientes.add(factoria.crearCliente(nombreCliente));
        System.out.println("Cliente añadido exitosamente");
        
    }
    
    // Aniadir tecnico de la linea correspondiente
    private void aniadirTecnico(){
        System.out.print("Introduzca el nombre del tecnico: ");
        
        scanner.nextLine(); // pasar a la siguiente linea
        String nombreTecnico = scanner.nextLine();
        
        tecnicos.add(factoria.crearTecnico(true, nombreTecnico));
        System.out.println("Tecnico añadido exitosamente");
    }
    
    // Si hay trabjos en suubasta los muestra, en otro caso informa que aun no hay
    private void listarTrabajosSubastados() {
        if (trabajosSubastados.size() > 0){
            System.out.println("Los trabajos en subasta son: ");
            for (int i = 0; i < trabajosSubastados.size(); i++)
            System.out.println("\t " + i + ") " + trabajosSubastados.get(i));
        } else {
            System.out.println("Aun no hay trabajos en subasta");
        }
    }
    // Listar todos los clientes
    private void listarClientes(){
        if (clientes.size() > 0) {
            System.out.println("Los clientes son: ");
            for (int i = 0; i < clientes.size(); i++)
            System.out.println("\t " + i + ") " + clientes.get(i));
        } else {
            System.out.println("Aún no hay clientes en la lista");
        }       
    }
    
    // Listar todos los tecnicos
    private void listarTecnicos(){
        if (tecnicos.size() > 0) System.out.println("Los tecnicos son: ");
        else System.out.println("Aún no hay tecnicos en la lista");
        
        for (int i = 0; i < tecnicos.size(); i++)
            System.out.println("\t " + i + ") " + tecnicos.get(i));
    }
    
    // Muestra todos los clientes y permite seleccionar uno
    private void seleccionarCliente(){
        mensajeEleccion();
        listarClientes();
        
        if (clientes.size() > 0) {
            int indiceCliente = leerOpcion(0, clientes.size() - 1);
            clienteActual = clientes.get(indiceCliente);
            trabajosActuales = clienteActual.getTrabajos();

            menuCliente();
        }
    }
    
    // Muesta todos los tecnicos y permite seleccionar uno
    private void seleccionarTecnico(){
        mensajeEleccion();
        listarTecnicos();
        
        if (tecnicos.size() > 0){
            int eleccion = leerOpcion(0, tecnicos.size() - 1);
            tecnicoActual = tecnicos.get(eleccion);
            trabajoActual = tecnicoActual.getTrabajo();
            
            menuTecnico();
        }
    }
    
    // Muestra un menu con algunas operaciones que puede realizar el cliente
    private void menuCliente(){
        Boolean atras = false;
        while (!atras){
            mensajeEleccion();
            System.out.println("\t 1) Añadir trabajo");
            System.out.println("\t 2) Seleccionar trabajo");
            System.out.println("\t 3) Atras");

            int eleccion = leerOpcion(1, 3);

            switch(eleccion){
                case 1: aniadirTrabajo();             break;
                case 2: seleccionarTrabajoCliente();  break;
                case 3: atras = true;                 break;
                default: System.out.println("Error"); break;
            }
        }
    }
    
    // Menu en el que se muestran todos los datos y 
    //operaciones que es capaz de llevar a cabo un tecnico
    private void menuTecnico(){
        Boolean atras = false;
        System.out.println("Estamos en menu tecnico");
    
        while (!atras){
            mensajeEleccion();
            System.out.println("\t 1) Mostrar trabajo actual");
            System.out.println("\t 2) Solicitar/pujar por un nuevo trabajo");
            System.out.println("\t 3) Atras");

            int eleccion = leerOpcion(1, 3);

            switch (eleccion){
                case 1: 
                    if (tecnicoActual.getTrabajo() != null) 
                        System.out.println(tecnicoActual.getTrabajo()); 
                    else 
                        System.out.println("Este tecnico no tiene trabajos asigandos todavia");
                    break;
                    
                case 2: pujarPorTrabajoSubastado(); break;
                case 3: atras = true; break;
                default: System.out.println("Error"); break;
            }
        }
        
    }
    
    // Hacer una oferta por un trabajo en subasta
    private void pujarPorTrabajoSubastado(){
        if (trabajosSubastados.size() > 0){
            mensajeEleccion();
            listarTrabajosSubastados();

            int eleccion = leerOpcion(0, trabajosSubastados.size() - 1);
            trabajoActual = trabajosSubastados.get(eleccion);

            System.out.println("\t " + trabajoActual);
          

            float ofertaPresupuesto = leerOferta();
            if (tecnicoActual == null ){
                System.out.println("es null");
                System.out.println("El tamaño del vector de tecnicos: " + tecnicos.size());
            } else {
                tecnicoActual.pujar(trabajoActual, ofertaPresupuesto);
            }
            
       } else {
           System.out.println("Todavía no hay trabajos en subasta, vuelva más tarde");
       }
        
    }
    
    // Lee numeros reales entre 0 y el precio del trabajo actual 
    // de manera correcta y segura
    private float leerOferta(){
        float nuevaOferta = trabajoActual.getPrecio() + 1;
        Boolean correcto = false;
        System.out.print("Introduce la cantidad que vayas a pujar (menor que la actual): ");
        
        while (!correcto){
            nuevaOferta = scanner.nextFloat();
            correcto = (nuevaOferta > 0 && nuevaOferta < trabajoActual.getPrecio());
            
            if (!correcto) {
                System.out.print("Cantidad incorrecta, debe ser menor a " + trabajoActual.getPrecio() + ": ");
            }
        }
        
        return nuevaOferta;
    }
    
    // Mostrar todos los trabajos de los clientes y operaciones relacionadas con ellos
    private void seleccionarTrabajoCliente (){
        
        mensajeEleccion();
        listarTrabajosCliente();
        
        if (trabajosActuales.size() > 0){
            int indiceTrabajo = leerOpcion(0, trabajosActuales.size()-1);
            trabajoActual = trabajosActuales.get(indiceTrabajo);
            menuTrabajo();
        }        
    }
    
    // Menu que muestra operaciones relacionadas con un cliente
    private void menuTrabajo(){
        Boolean atras = false;
        while (!atras){
            mensajeEleccion();
            System.out.println("\t 1) Abrir subasta trabajo");
            System.out.println("\t 2) Cerrar subasta trabajo");
            System.out.println("\t 3) Atras");
            
            int eleccion = leerOpcion(1, 3);
            switch(eleccion) {
                case 1: abrirSubastaTrabajoActual();      break;
                case 2: cerrarSubastaTrabajoActual(); break;
                case 3: atras = true;                 break;
                default: System.out.println("Error"); break;
            }
        }
    }
    
    // Pasa al vector de subastas el trabajo actual, dicho vector se 
    // mostrará a técncos que podrán solicitarlo y pujar por el si lo desean
    public void abrirSubastaTrabajoActual(){
        trabajosSubastados.add(trabajoActual);
        trabajoActual.subastar();
        autoSubastador = new AutoSubastador(trabajoActual,tecnicos.get(0));
        Thread hiloAutoBidder = new Thread(autoSubastador);
        hiloAutoBidder.start();
    }
    
    // Finalizar la subasta de un trabajo, quedarse con el mejor de los solicitantes
    private void cerrarSubastaTrabajoActual(){
        trabajosSubastados.remove(trabajoActual);
        trabajoActual.finSubasta();
    }
    
    // Muestra por pantalla los trabajos del cliente actual
    private void listarTrabajosCliente(){
      if (clienteActual.getTrabajos().size() > 0) {
            trabajosActuales = clienteActual.getTrabajos();
            for (int i = 0; i < trabajosActuales.size(); i++)
                System.out.println("\t "+ i + ") " + trabajosActuales.get(i));
      } else {
          System.out.println("El cliente " + clienteActual.getNombre() + 
                             " aun no tiene trabajos");
      }
    }
    
   
    // Aniadir trabajo a un cliente 
    private void aniadirTrabajo(){
        scanner.nextLine();  // limpiar entrada

        System.out.print("Introduzca descripción del trabajo: ");
        String descripcion = scanner.nextLine();
        

        System.out.print("Introduzca precio maximo del trabajo: ");
        float presupuesto = scanner.nextFloat();
        
        clienteActual.crearTrabajo(descripcion, presupuesto);
    }

}
