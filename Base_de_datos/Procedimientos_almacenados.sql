
CREATE OR REPLACE PROCEDURE INFO_JUGADORES_DRAFT
(

	V_CURSOR_DRAFT OUT SYS_REFCURSOR

)
AS
BEGIN

	OPEN V_CURSOR_DRAFT FOR

	SELECT P.ID AS "ID JUGADOR", P.DNI AS "DNI", P.NOMBRE AS "NOMBRE", P.APELLIDO AS "APELLIDO", J.POSICION AS "POSICION",
	J.NUMDRAFT AS "NUMERO DEL DRAFT", E.ID AS "ID EQUIPO", E.NOMBRE AS "EQUIPO", JE.SUELDO AS "SUELDO", JE.CLAUSULA AS "CLAUSULA"
	FROM JUGADORES_DRAFT J, JUGADORESEQUIPOS JE, PERSONAS P, EQUIPOS E
	WHERE P.ID = J.ID AND J.ID = JE.IDJUGADOR AND JE.IDEQUIPO = E.ID
	ORDER BY P.ID;

END INFO_JUGADORES_DRAFT;


--------------------------------------------------------------------------------
--****************************************************************************--
--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE INFO_JUGADORES_WILDCARD
(

	V_CURSOR_WILDCARD OUT SYS_REFCURSOR

)
AS
BEGIN

	OPEN V_CURSOR_WILDCARD FOR

	SELECT P.ID AS "ID JUGADOR", P.DNI AS "DNI", P.NOMBRE AS "NOMBRE", P.APELLIDO AS "APELLIDO", J.POSICION AS "POSICION",
    E.ID AS "ID EQUIPO", E.NOMBRE AS "EQUIPO", JE.SUELDO AS "SUELDO"
	FROM JUGADORES_WILDCARD J, JUGADORESEQUIPOS JE, PERSONAS P, EQUIPOS E
	WHERE P.ID = J.ID AND J.ID = JE.IDJUGADOR AND JE.IDEQUIPO = E.ID
	ORDER BY P.ID;

END INFO_JUGADORES_WILDCARD;