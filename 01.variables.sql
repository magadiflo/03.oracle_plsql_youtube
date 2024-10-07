/*-- VARIABLES --*/

--Habilita la salida de mensajes en la salida del script del editor
SET SERVEROUTPUT ON

--Declara variables
DECLARE
    identificador INTEGER   := 50;
    nombre VARCHAR2(25)     := 'Mart�n D�az';
    apodo CHAR(10)          := 'Viejito';
    sueldo NUMBER(5)        := 2800;
    comision DECIMAL(4,2)   := 50.20;
    fecha_actual DATE       := SYSDATE;
    fecha DATE              := TO_DATE('2022/02/03', 'yyyy/mm/dd');
    saludo VARCHAR2(50) DEFAULT 'Buenos d�as a todos'; --Valor por defecto de la variable
BEGIN
    DBMS_OUTPUT.PUT_LINE('Identificador: '  || identificador);
    DBMS_OUTPUT.PUT_LINE('Nombre: '         || nombre);
    DBMS_OUTPUT.PUT_LINE('Apodo: '          || apodo);
    DBMS_OUTPUT.PUT_LINE('Sueldo: '         || sueldo);
    DBMS_OUTPUT.PUT_LINE('Comisi�n: '       || comision);
    DBMS_OUTPUT.PUT_LINE('Fecha Actual: '   || fecha_actual);
    DBMS_OUTPUT.PUT_LINE('Fecha: '          || fecha);
    DBMS_OUTPUT.PUT_LINE('Saludo: '         || saludo);
END;