-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2023-11-22 15:18:48 CLST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



DROP TABLE administrativo CASCADE CONSTRAINTS;

DROP TABLE categoria CASCADE CONSTRAINTS;

DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE detalle_producto CASCADE CONSTRAINTS;

DROP TABLE medio_de_pago CASCADE CONSTRAINTS;

DROP TABLE pedido CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE relation_4 CASCADE CONSTRAINTS;

DROP TABLE rol_trabajador CASCADE CONSTRAINTS;

DROP TABLE trabajador CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE administrativo (
    salario        INTEGER NOT NULL,
    trabajador_run VARCHAR2(9) NOT NULL
);

ALTER TABLE administrativo ADD CONSTRAINT administrativo_pk PRIMARY KEY ( trabajador_run );

CREATE TABLE categoria (
    cod_categoria VARCHAR2(40) NOT NULL,
    descripcion   VARCHAR2(100) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( cod_categoria );

CREATE TABLE cliente (
    run            VARCHAR2(9) NOT NULL,
    username       VARCHAR2(40) NOT NULL,
    password       VARCHAR2(100) NOT NULL,
    tipo_cliente   NUMBER NOT NULL,
    primer_nombre  VARCHAR2(60) NOT NULL,
    apaterno       VARCHAR2(60) NOT NULL,
    amaterno       VARCHAR2(60) NOT NULL,
    idioma         VARCHAR2(60) NOT NULL,
    telefono       NUMBER(9) NOT NULL,
    correo         VARCHAR2(60) NOT NULL,
    fecha_registro DATE NOT NULL
);

COMMENT ON COLUMN cliente.tipo_cliente IS
    'consumidor o externo';

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( run );

CREATE TABLE detalle_producto (
    id_detalle_producto  INTEGER NOT NULL,
    precio_total_sin_iva INTEGER NOT NULL,
    precio_total_con_iva INTEGER NOT NULL,
    pedido_run           VARCHAR2(9) NOT NULL,
    pedido_numero_pedido INTEGER NOT NULL,
    producto_id_ficha    INTEGER,
    cantidad_producto    INTEGER NOT NULL
);

ALTER TABLE detalle_producto
    ADD CONSTRAINT detalle_producto_pk PRIMARY KEY ( id_detalle_producto,
                                                     pedido_run,
                                                     pedido_numero_pedido );

CREATE TABLE medio_de_pago (
    cod_medio_pago VARCHAR2(10) NOT NULL,
    descripcion    VARCHAR2(50) NOT NULL
);

ALTER TABLE medio_de_pago ADD CONSTRAINT medio_de_pago_pk PRIMARY KEY ( cod_medio_pago );

CREATE TABLE pedido (
    numero_pedido        INTEGER NOT NULL,
    fecha_pedido         DATE NOT NULL,
    precio_final_sin_iva INTEGER NOT NULL,
    precio_final_con_iva INTEGER NOT NULL,
    cliente_run          VARCHAR2(9) NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( cliente_run,
                                                          numero_pedido );

CREATE TABLE producto (
    id_ficha                INTEGER NOT NULL,
    alto                    FLOAT NOT NULL,
    ancho                   FLOAT NOT NULL,
    descripcion             VARCHAR2(200) NOT NULL,
    stock                   INTEGER NOT NULL,
    categoria_cod_categoria VARCHAR2(40),
    nombre_producto         VARCHAR2(60) NOT NULL,
    precio_unidad_sin_iva   INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_ficha );

CREATE TABLE relation_4 (
    cliente_run                  VARCHAR2(9) NOT NULL,
    medio_de_pago_cod_medio_pago VARCHAR2(10) NOT NULL
);

ALTER TABLE relation_4 ADD CONSTRAINT relation_4_pk PRIMARY KEY ( cliente_run,
                                                                  medio_de_pago_cod_medio_pago );

CREATE TABLE rol_trabajador (
    cod_rol           VARCHAR2(20) NOT NULL,
    descripcion_cargo VARCHAR2(500) NOT NULL
);

ALTER TABLE rol_trabajador ADD CONSTRAINT rol_trabajador_pk PRIMARY KEY ( cod_rol );

CREATE TABLE trabajador (
    run                    VARCHAR2(9) NOT NULL,
    username               VARCHAR2(40) NOT NULL,
    password               VARCHAR2(100) NOT NULL,
    primer_nombre          VARCHAR2(60) NOT NULL,
    apaterno               VARCHAR2(60) NOT NULL,
    amaterno               VARCHAR2(60) NOT NULL,
    telefono               NUMBER(9) NOT NULL,
    correo_electronico     VARCHAR2(40) NOT NULL,
    fecha_registro         DATE NOT NULL,
    salario                INTEGER NOT NULL,
    rol_trabajador_cod_rol VARCHAR2(20)
);

ALTER TABLE trabajador ADD CONSTRAINT trabajador_pk PRIMARY KEY ( run );

ALTER TABLE administrativo
    ADD CONSTRAINT administrativo_trabajador_fk FOREIGN KEY ( trabajador_run )
        REFERENCES trabajador ( run );

ALTER TABLE detalle_producto
    ADD CONSTRAINT detalle_producto_pedido_fk FOREIGN KEY ( pedido_run,
                                                            pedido_numero_pedido )
        REFERENCES pedido ( cliente_run,
                            numero_pedido );

ALTER TABLE detalle_producto
    ADD CONSTRAINT detalle_producto_producto_fk FOREIGN KEY ( producto_id_ficha )
        REFERENCES producto ( id_ficha );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_cliente_fk FOREIGN KEY ( cliente_run )
        REFERENCES cliente ( run );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_cod_categoria )
        REFERENCES categoria ( cod_categoria );

ALTER TABLE relation_4
    ADD CONSTRAINT relation_4_cliente_fk FOREIGN KEY ( cliente_run )
        REFERENCES cliente ( run );

ALTER TABLE relation_4
    ADD CONSTRAINT relation_4_medio_de_pago_fk FOREIGN KEY ( medio_de_pago_cod_medio_pago )
        REFERENCES medio_de_pago ( cod_medio_pago );

ALTER TABLE trabajador
    ADD CONSTRAINT trabajador_rol_trabajador_fk FOREIGN KEY ( rol_trabajador_cod_rol )
        REFERENCES rol_trabajador ( cod_rol );



-- Informe de Resumen de Oracle SQL Developer Data Modeler:
--
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   0
-- WARNINGS                                 0
