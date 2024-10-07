/*-- TRIGGERS - RAISE_APPLICATION_ERROR 
RAISE_APPLICATION_ERROR, permite configurar un mensaje de error--*/
DROP TABLE empleados;
DROP TABLE control;

CREATE TABLE empleados (
    documento CHAR(8),
    apellido  VARCHAR2(30),
    nombre    VARCHAR2(30),
    domicilio VARCHAR2(30),
    seccion   VARCHAR2(20),
    sueldo    NUMBER(8, 2)
);

CREATE TABLE control (
    usuario   VARCHAR2(30),
    fecha     DATE,
    operacion VARCHAR2(30)
);

insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contaduria',3000);

SELECT * FROM empleados;
SELECT * FROM control;

--Creación de trigger
CREATE OR REPLACE TRIGGER tr_control_empleados
BEFORE INSERT OR UPDATE OR DELETE
ON empleados
FOR EACH ROW
    BEGIN
        IF (:NEW.sueldo > 5000) THEN
            RAISE_APPLICATION_ERROR(-20000, 'SUELDO NO PUEDE SUPERAR LOS S/ 5000.00');
        END IF;
        INSERT INTO control(usuario, fecha, operacion)
        VALUES(USER, SYSDATE, 'INSERT');
        
        IF (:OLD.seccion = 'Gerencia') THEN
            RAISE_APPLICATION_ERROR(-20000, 'NO SE PUEDE ELIMINAR PUESTO DE GERENCIA');
        END IF;
        INSERT INTO control(usuario, fecha, operacion)
        VALUES(USER, SYSDATE, 'DELETE');
        
        IF UPDATING('documento') THEN
            RAISE_APPLICATION_ERROR(-20000, 'NO SE PUEDE ACTUALIZAR NÚMERO DE DOCUMENTOS');
        END IF;        
    END tr_control_empleados;
    
--Probando trigger
INSERT INTO empleados VALUES('45725876','Díaz','Martín','Las Casuarinas','Sistemas',7000);

DELETE FROM empleados 
WHERE seccion = 'Gerencia';

UPDATE empleados
SET documento = '11111111'
WHERE documento = '22222222';

    
    
    
    
    
    
    
    