package Modelo;

public class Staff extends Persona {
    public Staff() {
    }

    public Staff(String dni, String apellidos, String nombre) {
        super(dni, apellidos, nombre);
    }

    public Staff(String id, String dni, String apellidos, String nombre) {
        super(id, dni, apellidos, nombre);
    }
}
