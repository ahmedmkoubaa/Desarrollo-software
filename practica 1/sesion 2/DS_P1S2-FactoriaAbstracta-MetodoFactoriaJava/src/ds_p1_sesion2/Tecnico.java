package ds_p1_sesion2;

import java.util.Vector;


public class Tecnico {
    protected Trabajo trabajoActual = null;
    protected String nombre;
    
    protected boolean enActivo;
    protected float valoracion;
    
    protected Vector<Puja> pujas = new Vector<Puja>();
    
    // Hace una oferta al trabajo actual y lo guarda en un vector de pujas para manter un registro
    public void pujar(Trabajo trabajoSubastado, float presupuesto){
        trabajoSubastado.recibirPuja(this, presupuesto);
        pujas.add(new Puja(this, trabajoSubastado, presupuesto));
    }

    public Tecnico(boolean enActivo, String unNombre) {
        this.enActivo = enActivo;
        this.nombre = unNombre;
    }

    public Trabajo getTrabajo() {
        return trabajoActual;
    }

    public void setTrabajo(Trabajo nuevoTrabajo) {
        this.trabajoActual = nuevoTrabajo;
    }

    public boolean isEnActivo() {
        return enActivo;
    }

    public void setEnActivo(boolean enActivo) {
        this.enActivo = enActivo;
    }

    public float getValoracion() {
        return valoracion;
    }

    public void setValoracion(float valoracion) {
        this.valoracion = valoracion;
    }

    public void solicitarAsignacionTrabajo() {
	throw new UnsupportedOperationException();
    }

    public void cancelarTrabajo() {
        throw new UnsupportedOperationException();
    }

    @Override
    public String toString() {
        return "Tecnico{" + "trabajoActual=" + trabajoActual + ", nombre=" + nombre + ", enActivo=" + enActivo + ", valoracion=" + valoracion + '}';
    }
}