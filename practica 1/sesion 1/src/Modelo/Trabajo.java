package Modelo;
import java.util.Observable;

public class Trabajo extends Observable {        
    private float oferta = -1;
    
    public Trabajo(float oferta){
        super();
        this.oferta = oferta;
    }
    
    public float getOferta() {
	return this.oferta;
    }

    // Method to change the oferta's value
    public void setOferta(float nuevaOferta) {
            
        // The critery used is the lower the better
        if ((oferta < 0 || nuevaOferta < oferta) && nuevaOferta >= 0){
            System.out.println("Hemos pujado"); 
            this.oferta = nuevaOferta;
            this.setChanged();
            this.notifyObservers(this);
        }
    }
}