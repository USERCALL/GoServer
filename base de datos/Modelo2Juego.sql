/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     7/11/2016 6:37:58 p. m.                      */
/*==============================================================*/


drop index JUEGO_PK;

drop table JUEGO;

drop index JUGADOR_PK;

drop table JUGADOR;

drop index PUNTAJEJUGADOR_FK;

drop index PUNTAJEJUEGO_FK;

drop index PUNTAJE_PK;

drop table PUNTAJE;

/*==============================================================*/
/* Table: JUEGO                                                 */
/*==============================================================*/
create table JUEGO (
   ID_JUEGO             INT4                 not null,
   NOMBRE_JUEGO         VARCHAR(30)          not null,
   constraint PK_JUEGO primary key (ID_JUEGO)
);

/*==============================================================*/
/* Index: JUEGO_PK                                              */
/*==============================================================*/
create unique index JUEGO_PK on JUEGO (
ID_JUEGO
);

/*==============================================================*/
/* Table: JUGADOR                                               */
/*==============================================================*/
create table JUGADOR (
   ID_JUGADOR           INT4                 not null,
   NOMBRE_JUGADOR       VARCHAR(30)          not null,
   constraint PK_JUGADOR primary key (ID_JUGADOR)
);

/*==============================================================*/
/* Index: JUGADOR_PK                                            */
/*==============================================================*/
create unique index JUGADOR_PK on JUGADOR (
ID_JUGADOR
);

/*==============================================================*/
/* Table: PUNTAJE                                               */
/*==============================================================*/
create table PUNTAJE (
   ID_PUNTUACION        INT4                 not null,
   ID_JUEGO             INT4                 not null,
   ID_JUGADOR           INT4                 not null,
   VALOR_PUNTUACION     INT4                 not null,
   FECHA_PUNTUACION     DATE                 not null,
   constraint PK_PUNTAJE primary key (ID_PUNTUACION)
);

/*==============================================================*/
/* Index: PUNTAJE_PK                                            */
/*==============================================================*/
create unique index PUNTAJE_PK on PUNTAJE (
ID_PUNTUACION
);

/*==============================================================*/
/* Index: PUNTAJEJUEGO_FK                                       */
/*==============================================================*/
create  index PUNTAJEJUEGO_FK on PUNTAJE (
ID_JUEGO
);

/*==============================================================*/
/* Index: PUNTAJEJUGADOR_FK                                     */
/*==============================================================*/
create  index PUNTAJEJUGADOR_FK on PUNTAJE (
ID_JUGADOR
);

alter table PUNTAJE
   add constraint FK_PUNTAJE_PUNTAJEJU_JUEGO foreign key (ID_JUEGO)
      references JUEGO (ID_JUEGO)
      on delete restrict on update restrict;

alter table PUNTAJE
   add constraint FK_PUNTAJE_PUNTAJEJU_JUGADOR foreign key (ID_JUGADOR)
      references JUGADOR (ID_JUGADOR)
      on delete restrict on update restrict;

