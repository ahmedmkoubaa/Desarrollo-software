/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import GUI.SosemadoFrame;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTextField;

/**
 *
 * @author Ivan
 */
//public class DS_Sesion1 extends Thread {
//    
//    private static Trabajo trabajoObservable = new Trabajo(10000);
//    private static Tecnico tecnicoObservador = new Tecnico(new JTextField());
//    private static SosemadoFrame sosemado;
//    private static Thread t1, t2;
//
//    /**
//     * @param args the command line arguments
//     */
//    public static void main(String[] args) {
//        System.out.println("En main: vamos a añadir un observador");
//        trabajoObservable.addObserver(tecnicoObservador);
//        
//        System.out.println("Current number of observers is: " + trabajoObservable.countObservers());
//        
//        trabajoObservable.setOferta(1000);
//        trabajoObservable.setOferta(500);
//        
//        sosemado = new SosemadoFrame();
//        
//
//        
////         /* Create and display the form */
////        java.awt.EventQueue.invokeLater(sosemado);
//        
//        // Tasks to do:
//        // 1.- Design the classes diagram adding the GUI
//        // 2.- Implement the graphic interface
//        // 3.- Use threads to give concurrency to our code  
//    }    
//}

public class DS_Sesion1 extends Thread {
    
    public static void main (String [] args) {
        SosemadoFrame sosemado = new SosemadoFrame();
        TecnicoPujador tecnicoAuto = sosemado.getTecnicoPujador();
        
        // La primera hebra se encarga de ejecutar la parte gráfica
        Runnable hebra1 = new Runnable() {
            @Override
            public void run() {
                java.awt.EventQueue.invokeLater(sosemado);
                sosemado.setVisible(true);
                System.out.println("Ejecutado sosemado run en main");
            }
        };
        
        // La segunda hebra, ejecuta un proceso continuo, en el que se va actualizando 
        // automatica y aleatoriamente la cantidad pujada, siempre a menor
        Runnable hebra2 = new Runnable() {
            @Override
            public void run() {
                Random rand = new Random();
                final int maxSleep = 5000; // 5 segundos en milisegundos
                int aleat = 0;
                
                try {
                    while (true) {
                       aleat = rand.nextInt(maxSleep);
                       System.out.println("dormir: " + aleat);
                       sleep(aleat);
                       float ofertaActual = sosemado.getOfertaActual() - aleat/1000;
                       tecnicoAuto.pujar(ofertaActual);
                   }
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        };
        
        hebra1.run();
        hebra2.run();
        
        System.out.println("Termina thread main");
    }
}
