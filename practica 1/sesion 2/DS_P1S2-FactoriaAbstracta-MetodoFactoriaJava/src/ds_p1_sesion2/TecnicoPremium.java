package ds_p1_sesion2;

public class TecnicoPremium extends Tecnico {

    public TecnicoPremium(boolean enActivo, String unNombre) {
        super(enActivo, unNombre);
        this.valoracion = (float) 3.0 ;
    }
}