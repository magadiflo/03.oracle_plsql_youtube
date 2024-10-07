/*-- BUCLE FOR --*/

/*EJERCICIO 01. */
SET SERVEROUTPUT ON;

DECLARE
    numero NUMBER(2);
    
BEGIN
    --El primer valor del bucle es el valor inicial configurado, o sea 10
    --Se va incrementando de uno en uno
    FOR numero IN 10..20 LOOP 
        DBMS_OUTPUT.PUT_LINE('Valor de número: ' || numero);
    END LOOP;
END;

/*EJERCICIO 02. */
BEGIN
    --El primer valor del bucle es el valor inicial configurado, o sea 10
    --Se va incrementando de uno en uno
    FOR num IN REVERSE 10..20 LOOP 
        DBMS_OUTPUT.PUT_LINE('Valor de número: ' || num);
    END LOOP;
END;

