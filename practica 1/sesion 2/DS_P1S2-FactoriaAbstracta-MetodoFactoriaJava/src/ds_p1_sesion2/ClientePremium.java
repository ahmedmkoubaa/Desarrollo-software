package ds_p1_sesion2;

public class ClientePremium extends Cliente {

    public ClientePremium(String nombre) {
        super(nombre);
        this.importancia = (float) 1.5;
    }
}