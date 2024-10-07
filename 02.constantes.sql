/*-- CONSTANTES --*/
SET SERVEROUTPUT ON

DECLARE 
    mensaje CONSTANT VARCHAR2(30)    := 'Buenos días a todos';
    numero CONSTANT NUMBER(6)       := 30000;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Mensaje: ' || mensaje);
    DBMS_OUTPUT.PUT_LINE('Número: ' || numero);
END;
