package ds_p1_sesion2;

public class TecnicoLite extends Tecnico {

    public TecnicoLite(boolean enActivo, String unNombre) {
        super(enActivo, unNombre);
        this.valoracion = (float) 0.0 ;
    }
}