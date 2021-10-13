package ds_p1_sesion2;
import java.util.Vector;

public class Trabajo {
    private Cliente solicitante;
    private String descripcion;
    private Vector<Tecnico> tecnicosInteresados = new Vector<Tecnico>();
    
    private  float precio;
    private Boolean subastando; 
    
    public Trabajo(Cliente solicitante, String nombre, float precio) {
        this.solicitante = solicitante;
        this.descripcion = nombre;
        this.precio = precio;
        subastando = false;
    }
    
    public Trabajo(FactoriaUsuarios factoria, String nombre_cliente, String nombreTrabajo,  float precio) {
        this.solicitante = factoria.crearCliente(nombre_cliente);
        this.descripcion = nombreTrabajo;
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Trabajo ---> {" + "Descripción: " + descripcion + ", Presupuesto: " + precio + "}";
    }
    
    public Cliente getSolicitante() {
        return solicitante;
    }

    public void setSolicitante(Cliente solicitante) {
        this.solicitante = solicitante;
    }

    public String getNombre() {
        return descripcion;
    }

    public void setNombre(String nombre) {
        this.descripcion = nombre;
    }

    public Vector<Tecnico> getTecnicosInteresados() {
        return tecnicosInteresados;
    }

    public void setTecnicosInteresados(Vector<Tecnico> _solicita) {
        this.tecnicosInteresados = _solicita;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
        
    public void subastar() {
        subastando = true;
        System.out.println("En subasta");
    }

    public void asignar(Tecnico asignado) {
	this.tecnicosInteresados.add(asignado);
        asignado.setTrabajo(this);
    }
    
    // Asignar un nuevo tecnico con una nueva oferta solo si se está en el 
    // periodo de subasta y si la oferta mejora a la anterior, si no mejora
    // se tiene en cuenta al técnico añadiendolo al final de la lista.
    public void recibirPuja(Tecnico nuevoTecnico, float oferta) {
        if (subastando){
            if (oferta < precio) {
               tecnicosInteresados.insertElementAt(nuevoTecnico, 0);
               precio = oferta;
           } else {
               tecnicosInteresados.add(nuevoTecnico);
           }
        }
    }
    
    // Para indicar que se terminó el período de subasta
    public void finSubasta(){
        subastando = false;
        System.out.println("Finaliza la subasta");
        Tecnico ganadorPuja = tecnicosInteresados.get(0); // Cogemos el cero porque el vector está ordenado por ofertas
        ganadorPuja.setTrabajo(this);
    }
}