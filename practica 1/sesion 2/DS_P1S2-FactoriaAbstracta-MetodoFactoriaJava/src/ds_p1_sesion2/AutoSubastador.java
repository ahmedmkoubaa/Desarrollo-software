/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ds_p1_sesion2;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ivan
 */
public class AutoSubastador implements Runnable {
    
    private Trabajo aPujar;
    private Tecnico autoPujador;
    
    public AutoSubastador(Trabajo aPujar, Tecnico beneficiario){
        this.aPujar = aPujar;
        this.autoPujador = beneficiario;
    }

    @Override
    public void run() {
        while(true){
            float precio_actual = aPujar.getPrecio();
            autoPujador.pujar(aPujar, precio_actual - 1);
            System.out.println("El autoPujador ha pujado.");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException ex) {
                Logger.getLogger(AutoSubastador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    
    
}
