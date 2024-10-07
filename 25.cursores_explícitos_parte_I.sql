/*-- CURSORES - EXPLÍCITOS - PARTE I --*/
SET SERVEROUTPUT ON;

DECLARE
    v_docu empleados.documento%type;
    v_nom empleados.nombre%type;
    v_ape empleados.apellido%type;
    v_suel empleados.sueldo%type;
    
CURSOR c_cursor2 
IS SELECT documento, nombre, apellido, sueldo
    FROM  empleados
    WHERE documento = '22222222';
    
BEGIN
    OPEN c_cursor2;
    
    FETCH c_cursor2 INTO v_docu, v_nom, v_ape, v_suel;
    
    CLOSE c_cursor2;
    
    DBMS_OUTPUT.PUT_LINE('Documento: ' || v_docu);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nom);
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || v_ape);
    DBMS_OUTPUT.PUT_LINE('Sueldo: ' || v_suel);
END;