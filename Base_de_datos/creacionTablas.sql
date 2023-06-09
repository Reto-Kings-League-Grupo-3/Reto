Drop table login;
Drop table Partidos;
Drop table Jornadas;
Drop table Split;
Drop table asistenteEquipos;
Drop table entrenadorEquipos;
Drop table jugadoresEquipos;
Drop table Equipos;
Drop table Duenyos;
Drop table Entrenadores;
Drop table Asistentes;
Drop table Jugadores;
Drop table Personas;



--Tabla PERSONA

Create table Personas(
    id number(3) 
    generated always as identity primary key ,
    dni varchar(9),
    nombre varchar(20),
    apellido varchar(20)
);

--Tabla JUGADOR

Create table Jugadores(
    id number(3) primary key,
    posicion varchar2(20),
    numDraft varchar2(3) null,
    tipo varchar2(10),
    constraint jug_tip_ck check ( tipo in ('draft' , 'wildcard')),
	constraint jug_id_fk foreign key (id) references PERSONAS(ID) on delete cascade
);


--Tabla ASISTENTE

Create table Asistentes(
    id number(3)  primary key,
	constraint asi_id_fk foreign key (id) references PERSONAS(ID)on delete cascade
);
-- Tabla entrenador
Create table Entrenadores(
    id number(3) primary key,
	constraint ent_id_fk foreign key (id) references PERSONAS(ID)on delete cascade
);


--Tabla DUEÑO

Create table Duenyos(
    id number(3) primary key,
	constraint due_id_fk foreign key (id) references PERSONAs(ID)on delete cascade
);



-- Tabla EQUIPO

Create table Equipos(
    id number(2) 
    generated always as identity primary key ,
    nombre varchar2(20),
    presupuesto number(9),
    sponsor VARCHAR2(20),
    idDuenyo number(3),
  	constraint equ_idD_fk foreign key (idDuenyo) references Duenyos(ID) on delete cascade,
    constraint equi_pres_ck check(presupuesto<=200000000)

);



Create table jugadoresEquipos(
    idJugador number(3),
    idEquipo number(2),
    sueldo number (8),
    fechaInicio date,
    fechaFin date null,
    clausula number(8) default 1000000,
    primary key(idJugador,idEquipo),
    constraint jugeq_suel_ck check ( sueldo in (10000000 , 10500000 ,15000000 ,22500000)),
    constraint jugeq_idJ_fk foreign key (idJugador) references JUGADORES(ID),
    constraint jugeq_idE_fk foreign key (idEquipo) references EQUIPOS(ID)
);

Create table entrenadorEquipos(
    idEntrenador number(3),
    idEquipo number(2),
    sueldo number (8),
    fechaInicio date,
    fechaFin date null,
    primary key(idEntrenador,idEquipo),
    constraint jueq_idJ_fk foreign key (idEntrenador) references ENTRENADORES(ID) on delete cascade,
    constraint jueq_idE_fk foreign key (idEquipo) references EQUIPOS(ID) on delete cascade
);

Create table asistenteEquipos(
    idAsistente number(3),
    idEquipo number(2),
    sueldo number (8),
    fechaInicio date,
    fechaFin date null,
    primary key(idAsistente,idEquipo),
    constraint asiseq_idJ_fk foreign key (idAsistente) references ASISTENTEs(ID) on delete cascade,
    constraint eq_idE_fk foreign key (idEquipo) references EQUIPOS(ID)
);



Create table Split(
id number(4) 
generated always as identity primary key,
tipo varchar2(10),
fechaInicio date,
fechaFin date,
constraint spl_tip_ck check (tipo in ('abierto' , 'cerrado'))
);

Create table Jornadas(
id number(2) 
generated always as identity primary key ,
fecha date,
tipo varchar2(10),
idSplit number(4), 
constraint jor_tip_ck check (tipo in ('regular' , 'playoff')),
constraint jor_idS_fk foreign key (idSplit) references Split(ID) on delete cascade
);



Create table partidos(
id number(3) 
generated always as identity primary key ,
hora varchar2(5),
idEquipoGana number(2),
idJornada number(2),
golesEquipo2 number(2) null,
golesEquipo1 number(2),
idEquipo1 number(2),
idEquipo2 number(2),
constraint part_idE_fk foreign key (idEquipoGana) references EQUIPOS(ID) on delete cascade,
constraint part_jor_fk foreign key (idJornada) references JORNADAS(ID) on delete cascade,
constraint part_idEq1_fk foreign key (idEquipo1) references EQUIPOS(id) on delete cascade,
constraint part_idEq2_fk foreign key (idEquipo2) references EQUIPOS(id) on delete cascade

);






Create table login(
id number(4) 
generated always as identity primary key,
tipo varchar2(10),
usuario varchar2 (20),
contrasenya varchar2 (10),
constraint log_tip_ck check (tipo in ('admin' , 'usuario'))
);




