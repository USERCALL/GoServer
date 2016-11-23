#Cargar base de datos

Deben estar creada el usuario y rol admin y pass admin

psql -U admin -f Modelo2Juego.sql

# Configuracion bases api

 bee  api juegoApi -driver=postgres -conn=postgres://postgres:postgres2016@127.0.0.1/juego?sslmode=disable

 bee  api nameApi -driver=postgres -conn=postgres://user:password@127.0.0.1/BDname?sslmode=disable




