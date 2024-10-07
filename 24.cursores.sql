/*-- CURSORES - IMPLÍCITOS --*/
DROP TABLE empleados;

CREATE TABLE empleados (
    documento CHAR(8),
    apellido  VARCHAR2(30),
    nombre    VARCHAR2(30),
    domicilio VARCHAR2(30),
    seccion   VARCHAR2(20),
    sueldo    NUMBER(8, 2)
);

 insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
 insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
 insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contabilidad',3000);
 insert into empleados values('32323255','Gonzales','Miguel','Calle 4ta No.90','Contabilidad',8000);
 insert into empleados values('56565555','Suarez','Tomas','Atarazana 78','Cobros',1500);
 
 SELECT * FROM empleados;
 
/* CURSORES IMPLÍCITOS: Se trabaja en conjunto con el INSERT, UPDATE o DELETE */
SET SERVEROUTPUT ON;
 
DECLARE
    filas NUMBER(2);
    
BEGIN
    UPDATE empleados 
    SET sueldo = sueldo + 500
    WHERE sueldo >= 9000;
    
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No hay empleados disponibles');
    ELSIF SQL%FOUND THEN
        filas := SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE(filas || ' empleados actualizados');
    END IF;
END;
 