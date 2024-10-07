/*-- BUCLES (LOOPS) --*/
SET SERVEROUTPUT ON;

DECLARE
    valor NUMBER := 10;

BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(valor);
        valor := valor + 10;
        IF valor > 50 THEN
            EXIT;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Valor final: ' || valor);
END;