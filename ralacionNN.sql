spool C:\Users\escom\Desktop\nuevodata\salidann.txt

--clear screen;
set linesize 150
set PAGESIZE 99
set COLSEP '|*|'

--Borrado de tablas
DROP TABLE autobus CASCADE CONSTRAINT;
DROP TABLE conductor CASCADE CONSTRAINT;
DROP TABLE autocondu CASCADE CONSTRAINT;

--Tablas
CREATE TABLE autobus(
    matricula NUMBER(20),
    licencia VARCHAR(45),
    categoria VARCHAR(45)
);

CREATE TABLE conductor(
    carnet VARCHAR(20),
    nombre VARCHAR(45),
    experiencia VARCHAR(45)
);

CREATE TABLE autocondu(
    matricula NUMBER(20),
    carnet VARCHAR(45),
    trayecto VARCHAR(45),
);

--Restricciones
PROMPT Creating Primary Key on 'autobus'

-- Crear una clave primaria en la tabla autobus
ALTER TABLE autobus
ADD CONSTRAINT matricula_pk PRIMARY KEY (matricula);

-- Crear una clave primaria en la tabla conductor
ALTER TABLE conductor
ADD CONSTRAINT carnet_pk PRIMARY KEY (carnet);

-- Crear una clave foranea en la relacion de autocondu
ALTER TABLE autocondu
ADD CONSTRAINT matricula_fk FOREIGN KEY (matricula) REFERENCES autobus(matricula);

ALTER TABLE autocondu
ADD CONSTRAINT carnet_FK FOREIGN KEY (carnet) REFERENCES conductor(carnet);

--Insertar datos para las tablas 


--Desplega las tablas
SELECT * from autobus;
SELECT * from conductor;
SELECT * from autocondu;

--Da formato a la salida de datos 
rem desplegar por TABLE_NAME & CONSTRAINT
col owner FORMAT A12
col CONSTRAINT_NAME FORMAT A31
col CONSTRAINT_TYPE FORMAT A10
col table_name FORMAT A25
col status  FORMAT A10

--Despliega las restricciones 
SELECT owner, CONSTRAINT_NAME,
    CONSTRAINT_TYPE, status
    from user_constraints
    where table_name in ('autobus', 'conductor', 'autocondu');

spool off