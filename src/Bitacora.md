#Crear API
[Mira el Video](https://www.youtube.com/watch?v=lxvLxgmdSRc)

#Cadena creacion

Recomendación utilizar interprete bash

    bee api juegoApiV1 -driver=postgres -conn=postgres://admin:admin@127.0.0.1/admin?sslmode=disable


#Backup base de datos
 se accede  a usuario postgres
    sudo su postgres

peticion

    pg_dummp nameDB > nameDB-backup.sql

# restaurar base de datos

    psql nameDB < nameDB-backup.sql


#Acceder y comprobar funcionamiento
Para revisar si funciona entonces se debe llenar datos en la base de datos

   bee run juegoApiV1

luego se accede a

    localhost:8080/v1/juego


v1 es una cadena de acceso y juego el nombre de una tabla, como resultado debe aparecernos algo como un json con información de la tabla juego
