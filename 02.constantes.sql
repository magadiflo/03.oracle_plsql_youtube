/*-- CONSTANTES --*/
SET SERVEROUTPUT ON

DECLARE 
    mensaje CONSTANT VARCHAR2(30)    := 'Buenos d�as a todos';
    numero CONSTANT NUMBER(6)       := 30000;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Mensaje: ' || mensaje);
    DBMS_OUTPUT.PUT_LINE('N�mero: ' || numero);
END;
