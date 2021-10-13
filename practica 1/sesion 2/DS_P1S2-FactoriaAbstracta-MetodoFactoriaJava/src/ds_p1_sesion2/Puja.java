/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ds_p1_sesion2;

/**
 *
 * @author Ahmed El Moukhtari
 */
public class Puja {
    private Tecnico tecnicoPujador;
    private Trabajo trabajoPujado;
    private float presupuestoPuja;

    // Datos necesarios para crear la puja
    public Puja(Tecnico tecnicoPujador, Trabajo trabajoPujado, float presupuestoPuja) {
        this.tecnicoPujador = tecnicoPujador;
        this.trabajoPujado = trabajoPujado;
        this.presupuestoPuja = presupuestoPuja;
    }
    
    
    public float getPresupuestoPuja() {
        return presupuestoPuja;
    }

    public Trabajo getTrabajoPujado() {
        return trabajoPujado;
    }

    public Tecnico getTecnicoPujador() {
        return tecnicoPujador;
    }
    
    // Devuelve una cadena de carcter con todos los datos
    public String toString(){
        return tecnicoPujador + " " + trabajoPujado + " " + presupuestoPuja;
    }
    
    
}
