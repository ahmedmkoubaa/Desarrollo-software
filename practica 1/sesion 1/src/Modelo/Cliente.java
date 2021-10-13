package Modelo ;

public class Cliente {
	private Trabajo sujetoObservable;
        
        // constructor recibe trabajo, aunque realmente 
        // es cliente quien crea los trabajo
        public Cliente (Trabajo trabajo){
            this.setTrabajo(trabajo);
        }
        
        // extraer información del sujeto observable
	public float pull() {
//            	public float pull(Trabajo aO, Object aArg) {
//		throw new UnsupportedOperationException();
            return sujetoObservable.getOferta();
	}
        
        // Asignar un trabajo, no haría falta, realmente cliente
        // es quien crea el objeto en cuestión
        public void setTrabajo(Trabajo trabajo){
            sujetoObservable = trabajo;
        }
}