package ds_p1_sesion2;

public class Sistema {
	public FactoriaUsuarios factoriaUsuarios;
	public Cliente cliente;
	public Tecnico tecnico;
        private static MenuSistema menu = new MenuSistema();
        
        private static Trabajo configurarTrabajoPremium(String nombre_cliente, String descripcion_trabajo, float precio, String nombre_tecnico, boolean enActivo){
           FactoriaUsuarios creadorusuario;
           creadorusuario = new FactoriaUsuariosPremium();
           Trabajo trabajo = new Trabajo(creadorusuario.crearCliente(nombre_cliente), descripcion_trabajo, precio);
           
           return trabajo;
        }
        
        private static Trabajo configurarTrabajoLite(String nombre_cliente, String descripcion_trabajo, float precio, String nombre_tecnico, boolean enActivo){
           FactoriaUsuarios creadorusuario;
           creadorusuario = new FactoriaUsuariosLite();
           Trabajo trabajo = new Trabajo(creadorusuario.crearCliente(nombre_cliente), descripcion_trabajo, precio);
           return trabajo;
        }
        
        public static void main(String[] args) {
            Trabajo premium = configurarTrabajoPremium("Ahmed","Arreglar lavabo", (float) 2000.0, "Juan", true);
            Trabajo lite = configurarTrabajoLite("Iván","Alicatar", (float) 5000.0, "Ignacio", false);
            System.out.println(premium.toString());
            System.out.println(lite.toString());
            
            menu.menuInicial();
        }
}