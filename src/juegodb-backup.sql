--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: juego; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE juego (
    id_juego integer NOT NULL,
    nombre_juego character varying(30) NOT NULL
);


ALTER TABLE juego OWNER TO admin;

--
-- Name: jugador; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE jugador (
    id_jugador integer NOT NULL,
    nombre_jugador character varying(30) NOT NULL
);


ALTER TABLE jugador OWNER TO admin;

--
-- Name: puntaje; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE puntaje (
    id_puntuacion integer NOT NULL,
    id_juego integer NOT NULL,
    id_jugador integer NOT NULL,
    valor_puntuacion integer NOT NULL,
    fecha_puntuacion date NOT NULL
);


ALTER TABLE puntaje OWNER TO admin;

--
-- Data for Name: juego; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY juego (id_juego, nombre_juego) FROM stdin;
1	snake
2	space
3	flappy bird
\.


--
-- Data for Name: jugador; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY jugador (id_jugador, nombre_jugador) FROM stdin;
1	alejandro
2	daniel
3	carlos
\.


--
-- Data for Name: puntaje; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY puntaje (id_puntuacion, id_juego, id_jugador, valor_puntuacion, fecha_puntuacion) FROM stdin;
1	1	1	200	2016-12-21
\.


--
-- Name: pk_juego; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY juego
    ADD CONSTRAINT pk_juego PRIMARY KEY (id_juego);


--
-- Name: pk_jugador; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY jugador
    ADD CONSTRAINT pk_jugador PRIMARY KEY (id_jugador);


--
-- Name: pk_puntaje; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY puntaje
    ADD CONSTRAINT pk_puntaje PRIMARY KEY (id_puntuacion);


--
-- Name: juego_pk; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX juego_pk ON juego USING btree (id_juego);


--
-- Name: jugador_pk; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX jugador_pk ON jugador USING btree (id_jugador);


--
-- Name: puntaje_pk; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX puntaje_pk ON puntaje USING btree (id_puntuacion);


--
-- Name: puntajejuego_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX puntajejuego_fk ON puntaje USING btree (id_juego);


--
-- Name: puntajejugador_fk; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX puntajejugador_fk ON puntaje USING btree (id_jugador);


--
-- Name: fk_puntaje_puntajeju_juego; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY puntaje
    ADD CONSTRAINT fk_puntaje_puntajeju_juego FOREIGN KEY (id_juego) REFERENCES juego(id_juego) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_puntaje_puntajeju_jugador; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY puntaje
    ADD CONSTRAINT fk_puntaje_puntajeju_jugador FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

