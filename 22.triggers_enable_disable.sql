/*-- TRIGGERS - ENABLE, DISABLE --*/
SELECT * FROM empleados;
SELECT * FROM control;
TRUNCATE TABLE control;

--Triggers que tiene la tabla empleados
SELECT trigger_name, triggering_event, table_name, status
FROM USER_TRIGGERS
WHERE table_name = 'EMPLEADOS';

--Deshabilitando el trigger tr_aumenta_sueldo
ALTER TRIGGER tr_aumenta_sueldo DISABLE;

--Actualizar registro y ver 
--que no se ejecuta dicho trigger por que lo deshabilitamos
UPDATE empleados
SET sueldo = 1000
WHERE documento = '22333444';

--Habilitando el trigger tr_aumenta_sueldo
ALTER TRIGGER tr_aumenta_sueldo ENABLE;