/*-- TRIGGERS - BEFORE UPDATE --*/
DROP TABLE control;
DROP TABLE empleados;
SELECT * FROM control;
SELECT * FROM empleados;

--creacion tabla empleados
CREATE TABLE empleados (
    documento CHAR(8),
    apellido  VARCHAR2(20),
    nombre    VARCHAR2(20),
    seccion   VARCHAR2(30),
    sueldo    NUMBER(8, 2)
);
--creacion tala control
CREATE TABLE control (
    usuario VARCHAR2(30),
    fecha   DATE
);

--ingreso de datos
insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);

--Creando el trigger
CREATE OR REPLACE TRIGGER tr_actualiza_empleado
BEFORE UPDATE
ON empleados
FOR EACH ROW
    BEGIN
        INSERT INTO control(usuario, fecha)
        VALUES(USER, SYSDATE);
    END tr_actualiza_empleado;

--Actualizando registro para que se dispare el trigger 
UPDATE empleados
SET sueldo = sueldo * 1.10
WHERE seccion = 'Secretaria';