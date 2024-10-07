/*-- TRIGGERS - WHEN / IF --*/
DROP TABLE empleados;
DROP TABLE control;

CREATE TABLE empleados (
    documento CHAR(8),
    apellido  VARCHAR2(20),
    nombre    VARCHAR2(20),
    seccion   VARCHAR2(30),
    sueldo    NUMBER(8, 2)
);

CREATE TABLE control (
    usuario       VARCHAR2(30),
    fecha         DATE,
    documento     CHAR(8),
    antiguosueldo NUMBER(8, 2),
    nuevosueldo   NUMBER(8, 2)
);

insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);

SELECT * FROM empleados;
SELECT * FROM control;

--Creando trigger
CREATE OR REPLACE TRIGGER tr_aumenta_sueldo
BEFORE UPDATE OF sueldo
ON empleados
FOR EACH ROW WHEN (NEW.sueldo > OLD.sueldo)
    BEGIN
        INSERT INTO control(usuario, fecha, documento, antiguosueldo, nuevosueldo)
        VALUES(USER, SYSDATE, :OLD.documento, :OLD.sueldo, :NEW.sueldo);
    END tr_aumenta_sueldo;

--Desencadenando trigger
UPDATE empleados
SET sueldo = 800 
WHERE documento = '22333444';

--Creando otro trigger
CREATE OR REPLACE TRIGGER tr_actualiza_datos
BEFORE INSERT 
ON empleados
FOR EACH ROW 
    BEGIN
        :NEW.apellido := UPPER(:NEW.apellido);
        IF (:NEW.sueldo IS NULL) THEN
            :NEW.sueldo := 0;
        END IF;
    END tr_actualiza_datos;

--Desencadenando trigger
SELECT * FROM empleados;
SELECT * FROM control;

INSERT INTO empleados(documento ,apellido,nombre,seccion)
VALUES('45725876','Díaz','Martín','Sistemas');



