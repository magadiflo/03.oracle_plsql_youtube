/*-- BUCLE ANIDADOS --*/

/*EJERCICIO 01. */
SET SERVEROUTPUT ON;

DECLARE
    bucle1 NUMBER := 0;
    bucle2 NUMBER;
    
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        DBMS_OUTPUT.PUT_LINE('Valor de bucle externo: ' || bucle1);
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        bucle2 := 0;
        
        LOOP
            DBMS_OUTPUT.PUT_LINE('Valor de bucle anidado: ' || bucle2);
            bucle2 := bucle2 + 1;
            EXIT WHEN bucle2 = 5;
        END LOOP;
        bucle1 := bucle1 + 1;
        EXIT WHEN bucle1 = 3;        
    END LOOP;
END;