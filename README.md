# Configurar entorno de forma local
Instalar Oracle Database 21c xe: https://www.oracle.com/cl/database/technologies/xe-downloads.html
Descargar SQL Developer: https://www.oracle.com/database/sqldeveloper/technologies/download/

# Configurar entorno con Docker

## Crear Base de datos
ejecutar `docker run --name oracle-database-server -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=wladi123456 -v .:/opt/oracle/oradata container-registry.oracle.com/database/express:21.3.0-xe`

## Conectarse a la base de datos con SQL Developer
- Descargar SQL Developer: Descargar SQL Developer: https://www.oracle.com/database/sqldeveloper/technologies/download/
- Crear una nueva conexión
- user: sys
- password: wladi123456
