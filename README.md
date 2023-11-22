# Configurar entorno de forma local
  - Instalar y configurar Oracle Database 21c xe: https://www.oracle.com/cl/database/technologies/xe-downloads.html
  - Descargar SQL Developer: https://www.oracle.com/database/sqldeveloper/technologies/download/

# Configurar entorno con Docker

  - ## Crear Contenedor de base de datos Oracle con Docker
    - Ejecutar `docker run --name oracle-database-server -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=duoc123456 -v .:/opt/oracle/oradata container-registry.oracle.com/database/express:21.3.0-xe`
    - Verás esto cuando se haya terminado de crear contenedor con la BDD: ![image](https://github.com/IsWladi/eGESVEN-Gestion-Ventas-Duoc/assets/133131317/d707e351-a8f4-4627-990e-c7d6e981fb43)
    - Documentación Oracle:
      - Oracle Container Registry: https://container-registry.oracle.com/ords/f?p=113:1:101530791102226:::1:P1_BUSINESS_AREA:3&cs=3OAELIbGji-jz8hHz5XjNk3c5xsOHsJ4srUmRF8yDZ2yy71cUbVQNnE3WmuYWB-8uR2brkpIDS3xkI2w9Qs0nZw
      - Oracle Database Express Edition: https://container-registry.oracle.com/ords/f?p=113:4:101530791102226:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:803,803,Oracle%20Database%20Express%20Edition,Oracle%20Database%20Express%20Edition,1,0&cs=3vt5-9zEZbUQpF7pN2n8lJyrytRHehdxKcBAiYEZPP1ci_nNzJpiO_Th297WetjS-R4yplaYHFEQK_UO723SWzw
    
# Conectarse a la base de datos con SQL Developer (Para Docker y BD local aplica)
- Descargar SQL Developer: Descargar SQL Developer: https://www.oracle.com/database/sqldeveloper/technologies/download/
- Crear una nueva conexión
- user: system (depende de como hayas instalado la BD, tambien puedes probar con sys)
- password: duoc123456
- Imagen de referencia: ![image](https://github.com/IsWladi/eGESVEN-Gestion-Ventas-Duoc/assets/133131317/f9ece179-8d1c-45da-8c78-906e92d986b4)

