/*-- PAQUETES --*/
SET SERVEROUTPUT ON;

/*EJERCICIO 01.*/

--Creación de especificación de paquete (público)
CREATE OR REPLACE PACKAGE los_productos 
AS 
    PROCEDURE caracteristicas(v_codigo productos.codigo%type);
END los_productos;

--Creación de body de paquete (body)
CREATE OR REPLACE PACKAGE BODY los_productos
AS
    PROCEDURE caracteristicas(v_codigo productos.codigo%type) 
    IS 
        v_producto productos.nombre%type;
        v_precio productos.precio%type;
    BEGIN
        SELECT nombre, precio 
        INTO v_producto, v_precio
        FROM productos
        WHERE codigo = v_codigo;
        
        DBMS_OUTPUT.PUT_LINE('Artículo: ' || v_producto);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_precio);
    END caracteristicas;
END los_productos;

--Ejecutando el paquete
BEGIN
    los_productos.caracteristicas(3);
END;

/*EJERCICIO 02. */
SELECT los_productos.f_precio(4) AS precio FROM DUAL;











