package ds_p1_sesion2;
import java.util.Vector;

public class Cliente {
    public Vector<Trabajo> trabajos = new Vector<Trabajo>();
    public String nombre;
    public float importancia;

    public Cliente(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Cliente{" + "trabajos=" + trabajos + ", nombre=" + nombre + ", importancia=" + importancia + '}';
    }

    public Vector<Trabajo> getTrabajos() {
        return trabajos;
    }

    public void setTrabajos(Vector<Trabajo> trabajos) {
        this.trabajos = trabajos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getImportancia() {
        return importancia;
    }

    public void setImportancia(float importancia) {
        this.importancia = importancia;
    }

    public void crearTrabajo(String nombre, float presupuesto) {
        Trabajo trabajoCreado = new Trabajo(this, nombre, presupuesto);
        trabajos.add(trabajoCreado);
    }

    public void editarTrabajo() {
        throw new UnsupportedOperationException();
    }

    public void cancelarTrabajo(Trabajo aCancelar) {
        int indice = trabajos.indexOf(aCancelar);
        trabajos.remove(indice);
    }
}