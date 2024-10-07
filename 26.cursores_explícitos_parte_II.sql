/*-- CURSORES - EXPLÍCITOS - PARTE II --*/

/*EJERCICIO 01.*/
SET SERVEROUTPUT ON;

DECLARE
    /*empleados%rowtype;, signfica que la variable v_empleados contendrá
    todos los tipos de datos de la tabla empleados. De tal forma que 
    se pueda acceder a cada columna de la tabla*/
    v_empleados empleados%rowtype; 

BEGIN
    FOR v_empleados IN(SELECT * FROM empleados) LOOP
        DBMS_OUTPUT.PUT_LINE(v_empleados.nombre || ' '  || v_empleados.sueldo);
    END LOOP;        
END;

/*EJERCICIO 02. */
BEGIN
    UPDATE empleados 
    SET sueldo = 10000
    WHERE documento = '23333334';
    
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe registro para modificar');
    END IF;
END;