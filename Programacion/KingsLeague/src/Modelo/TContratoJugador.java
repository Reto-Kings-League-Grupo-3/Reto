package Modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.time.LocalDate;

/**
 * Clase encargada de relacionar la clase ContratoJugador con la base de datos
 * @author Grupo 3
 * @version 1.0
 * @since 23/05/2023
 * @see ContratoJugador
 */

public class TContratoJugador {

    public static void crearContratoJugador(ContratoJugador cj) throws Exception {
        BaseDatos.abrirConexion();
        PreparedStatement ps = BaseDatos.getCon().prepareStatement("insert into jugadoresequipos values (?,?,?,?,?,?)");
        ps.setString(1, cj.getJugador().getId());
        ps.setString(2, cj.getEquipo().getId());
        ps.setDouble(3, cj.getSueldo());
        ps.setDate(4, Date.valueOf(LocalDate.now()));
        ps.setDate(5, Date.valueOf(LocalDate.now().plusYears(1)));
        ps.setDouble(6, cj.getClausula());
        int n = ps.executeUpdate();
        BaseDatos.cerrarConexion();
    }

    public static void modificarJugador(ContratoJugador cj) throws Exception {
        BaseDatos.abrirConexion();
        PreparedStatement ps = BaseDatos.getCon().prepareStatement("update jugadoresequipos set idequipo = ?, sueldo = ?, clausula = ? where idjugador = ?");
        ps.setString(1, cj.getEquipo().getId());
        ps.setDouble(2, cj.getSueldo());
        ps.setDouble(3, cj.getClausula());
        ps.setString(4, cj.getJugador().getId());
        int n = ps.executeUpdate();
        BaseDatos.cerrarConexion();
    }
}
