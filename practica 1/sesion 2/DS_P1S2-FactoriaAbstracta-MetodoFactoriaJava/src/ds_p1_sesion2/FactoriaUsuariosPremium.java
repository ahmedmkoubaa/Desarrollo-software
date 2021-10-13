package ds_p1_sesion2;

public class FactoriaUsuariosPremium extends FactoriaUsuarios {

        @Override
	public Cliente crearCliente(String nombre) {
		return new ClientePremium(nombre) ;
	}

        @Override
	public Tecnico crearTecnico(boolean enActivo, String unNombre) {
		return new TecnicoPremium(enActivo,unNombre) ;
	}
}