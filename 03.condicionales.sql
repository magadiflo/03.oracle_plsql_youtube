/*-- CONDICIONALES IF ELSE, ELSIF --*/
SET SERVEROUTPUT ON

DECLARE
    a NUMBER(2) := 10;
    b NUMBER(2) := 20;

BEGIN
    IF (a > b) THEN
        DBMS_OUTPUT.PUT_LINE(a || ' es mayor que ' || b);
    ELSIF (b > a) THEN
        DBMS_OUTPUT.PUT_LINE(b || ' es mayor que ' || a);
    ELSE
        DBMS_OUTPUT.PUT_LINE(b || ' es igual que ' || a);
    END IF;  
END;