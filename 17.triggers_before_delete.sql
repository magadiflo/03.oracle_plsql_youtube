/*-- TRIGGERS - BEFORE DELETE --*/
SELECT * FROM empleados;
SELECT * FROM control;
TRUNCATE TABLE control;

--Creando el trigger
CREATE OR REPLACE TRIGGER tr_borrado_empleados
BEFORE DELETE
ON empleados
FOR EACH ROW
    BEGIN
        INSERT INTO control(usuario, fecha)
        VALUES(USER, SYSDATE);
    END tr_borrado_empleados;

--Eliminando registro para que se dispare el trigger 
DELETE FROM empleados
WHERE documento = '22999000';