package Modelo;

/**
 * Clase que representa un equipo concreto de los dos de un partido, es una relacion de Partido y Equipo
 * Partido 2
 * @author Grupo 3
 * @version 1.0
 * @since 23/05/2023
 * @see Equipo
 * @see Partido
 */

public class PartidoEquipo2 {

    private int goles;
    private Equipo equipo2;
    private Partido partido;

    public PartidoEquipo2() {
    }

    public PartidoEquipo2(int goles, Equipo equipo2, Partido partido) {
        this.goles = goles;
        this.equipo2 = equipo2;
        this.partido = partido;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public Equipo getEquipo2() {
        return equipo2;
    }

    public void setEquipo2(Equipo equipo2) {
        this.equipo2 = equipo2;
    }

    public Partido getPartido() {
        return partido;
    }

    public void setPartido(Partido partido) {
        this.partido = partido;
    }
}


