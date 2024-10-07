/*-- REF_CURSORS --*/
SELECT * FROM empleados;

CREATE OR REPLACE FUNCTION f_dato_empleados(v_doc_1 IN NUMBER, v_doc_2 IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_ref SYS_REFCURSOR;
BEGIN
    OPEN v_ref 
    FOR SELECT * 
        FROM empleados
        WHERE documento IN(v_doc_1, v_doc_2);
    RETURN v_ref;    
END;

--Ejecutar la función
SELECT f_dato_empleados(22222222, 23333333) FROM DUAL;

--Obtenemos de una forma adecuada los datos
VAR rc1 REFCURSOR
EXEC :rc1 := f_dato_empleados(22222222, 23333333);
PRINT rc1;















