/*-- BUCLE WHILE --*/

/*EJERCICIO 01. */
SET SERVEROUTPUT ON;

DECLARE
    valor NUMBER(2) := 10;
    
BEGIN
    WHILE valor < 20 LOOP
        DBMS_OUTPUT.PUT_LINE('El valor es: ' || valor);
        valor := valor + 1;
    END LOOP;
END;

/*EJERCICIO 02. */
SET SERVEROUTPUT ON;

DECLARE
    numero NUMBER(2) := 0;
    resultado NUMBER;
    
BEGIN
    WHILE numero <= 12 LOOP
        resultado := 7 * numero;
        DBMS_OUTPUT.PUT_LINE('7x' || numero || '=' || resultado);
        numero := numero + 1;
    END LOOP;
END;

