/*-- TRIGGERS - MULTIPLES EVENTOS --*/

CREATE TABLE control_empleados(
    usuario VARCHAR2(20),
    fecha DATE,
    accion VARCHAR2(20)
);

--Creación de trigger
CREATE OR REPLACE TRIGGER tr_control_empleados
BEFORE INSERT OR UPDATE OR DELETE
ON empleados
FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            INSERT INTO control_empleados(usuario, fecha, accion)
            VALUES(USER, SYSDATE, 'INSERT');
        ELSIF DELETING THEN
            INSERT INTO control_empleados(usuario, fecha, accion)
            VALUES(USER, SYSDATE, 'DELETE');
        ELSIF UPDATING THEN
            INSERT INTO control_empleados(usuario, fecha, accion)
            VALUES(USER, SYSDATE, 'UPDATE');
        END IF;
    END tr_control_empleados;
    
--Trabajando con la tabla empleados
SELECT * FROM control_empleados;
SELECT * FROM empleados;

INSERT INTO empleados(documento, apellido, nombre, seccion, sueldo)
VALUES('45725876', 'Díaz', 'Flores', 'Sistemas', 2100);

UPDATE empleados
SET sueldo = sueldo * 1.50
WHERE seccion = 'Sistemas';

DELETE FROM empleados
WHERE documento = '45725876';