/*-- TRIGGERS - FOR EACH ROW / BEFORE INSERT --*/
DROP TABLE empleados;

CREATE TABLE empleados (
    documento CHAR(8),
    apellido  VARCHAR2(30),
    nombre    VARCHAR2(30),
    seccion   VARCHAR2(20)
);

insert into empleados values('22333444','ACOSTA','Ana','Secretaria');
insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria');
insert into empleados values('22999000','FUENTES','Federico','Sistemas');
insert into empleados values('22555666','CASEROS','Carlos','Contaduria');
insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas');
insert into empleados values('23666777','JUAREZ','Juan','Contaduria');

TRUNCATE TABLE control;
SELECT * FROM control;

CREATE OR REPLACE TRIGGER tr_ingresa_empleados
BEFORE INSERT 
ON empleados
FOR EACH ROW
    BEGIN
        INSERT INTO control(usuario, fecha)
        VALUES(USER, SYSDATE);
    END tr_ingresa_empleados;
    
DROP TRIGGER tr_ingresa_empleados;
    
