/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import javax.swing.JTextField;

/**
 *
 * @author Ahmed El Moukhtari
 */
public class TecnicoPujador extends Tecnico {
    private Trabajo trabajoActual;
    private float pujaActual = -1;

    // constructor, recibe trabajo por el cual pujar
//    public TecnicoPujador(JTextField panel, Trabajo trabajo) {
//        super(panel);
//        this.trabajoActual = trabajo;
//    }
    
    public TecnicoPujador(Trabajo trabajo) {
        super();
        this.trabajoActual = trabajo;
    }
    
    /*-----------------------------------------------------------------------*/
    // Hacer oferta a trabajo
    public void pujar(float nuevaOferta) {
        // Comprobamos que vamos a mejorar nuestra oferta anterior
        if ((pujaActual < 0 || nuevaOferta < pujaActual) && nuevaOferta >= 0){
            
            System.out.println("ESTAMOS PUJANDO");
            // Actualizamos la oferta que tenemos hecha y la hacemos
            pujaActual = nuevaOferta;
            trabajoActual.setOferta(nuevaOferta);
        }
    }
    
    
}
