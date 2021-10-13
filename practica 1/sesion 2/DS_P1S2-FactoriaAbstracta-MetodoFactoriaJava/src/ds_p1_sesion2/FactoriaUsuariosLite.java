package ds_p1_sesion2;

public class FactoriaUsuariosLite extends FactoriaUsuarios {

        @Override
	public Cliente crearCliente(String nombre) {
		return new ClienteLite(nombre) ;
	}

        @Override
	public Tecnico crearTecnico(boolean enActivo, String unNombre) {
		return new TecnicoLite(enActivo,unNombre) ;
	}
}