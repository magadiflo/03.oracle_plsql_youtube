/*-- PROCEDIMIENTOS ALMACENADOS - PARÁMETROS DE ENTRADA --*/
SET SERVEROUTPUT ON;

--Trabajaremos sobre la siguiente tabla
CREATE TABLE empleados(
    documento CHAR(8),
    nombre VARCHAR2(20),
    apellido VARCHAR2(20),
    sueldo NUMBER(6,2),
    fecha_ingreso DATE
);

insert into empleados values('22222222','Juan','Perez',300,to_date('10/10/1980','dd/mm/yyyy'));
insert into empleados values('22333333','Luis','Lopez',300,to_date('12/05/1998','dd/mm/yyyy'));
insert into empleados values('22444444','Marta','Perez',500,to_date('25/08/1990','dd/mm/yyyy'));
insert into empleados values('22555555','Susana','Garcia',400,to_date('05/05/2000','dd/mm/yyyy'));
insert into empleados values('22666666','Jose Maria','Morales',400,to_date('24/10/2005','dd/mm/yyyy'));

SELECT * FROM empleados;

/*EJERCICIO 01. Stored Procedure que incremente el sueldo de los empleados*/
CREATE OR REPLACE PROCEDURE sp_aumenta_sueldo(antiguedad IN NUMBER, porcentaje IN NUMBER)
AS
    BEGIN
        UPDATE empleados 
        SET sueldo = sueldo + (sueldo * porcentaje/100)
        WHERE(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM fecha_ingreso)) > antiguedad;
    END sp_aumenta_sueldo;
    
--Ejecutando 
EXECUTE sp_aumenta_sueldo(40, 20);

/*EJERCICIO 02. Stored Procedure que inserte datos en la tabla empleados*/
CREATE OR REPLACE PROCEDURE sp_ingreso_empleado
(p_documento IN CHAR, p_nombre IN VARCHAR2, p_apellido IN VARCHAR2)
AS
    BEGIN
        INSERT INTO empleados(documento, nombre, apellido, sueldo, fecha_ingreso)
        VALUES(p_documento, p_nombre, p_apellido, NULL, CURRENT_DATE);
    END sp_ingreso_empleado;
    
--Ejecutando
EXECUTE sp_ingreso_empleado('45725876', 'Martín', 'Díaz');
--Verificar el registro insertado
SELECT * FROM empleados;

