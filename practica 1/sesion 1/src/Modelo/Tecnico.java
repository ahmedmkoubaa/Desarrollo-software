package Modelo;
import java.util.Observable;
import java.util.Observer ;
import javax.swing.JTextField;

public class Tecnico implements Observer {
    // ofertaActual que se sabe que el trabajo tiene
    private float ofertaActual = -1;
    
    // Metodo update usado por NotifyObservers
    @Override
    public void update(Observable o, Object o1) {
        ofertaActual = ((Trabajo)o1).getOferta();
    }
    
    public float getOferta(){ return ofertaActual; }
}