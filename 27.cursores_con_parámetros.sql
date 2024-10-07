/*-- CURSORES CON PARÁMETROS --*/
DROP TABLE productos;
CREATE TABLE productos (
    id_producto     INT NOT NULL,
    nombre_producto VARCHAR2(25),
    precio          NUMBER(6, 2),
    descripcion     VARCHAR2(50)
);
insert into productos values(1,'Abrazadera',560,'Abrazadera de media pulgada');
insert into productos values(2,'Destornillador',120,'destornillador cabeza plana');
insert into productos values(3,'Martillo',300,'Martillo con ganzua'); 
insert into productos values(4,'Llave inglesa',200,'Llave inglesa de plomeria');
insert into productos values(5,'Pasadores RTR',935,'Tuerca exagonal de Almenada');
insert into productos values(6,'Tornillo exagonal',90,'Tornillo exagonal de baja o tuerca');

SELECT * FROM productos;

/*EJERCICIO 01.*/
SET SERVEROUTPUT ON;

DECLARE 
    v_nom productos.nombre_producto%type;
    v_pre productos.precio%type;

    CURSOR c_productos(idprod productos.id_producto%type)
    IS SELECT nombre_producto, precio
        FROM productos
        WHERE id_producto = idprod;
    
BEGIN
    OPEN c_productos(2);
    LOOP
        FETCH c_productos INTO v_nom, v_pre;
        EXIT WHEN c_productos%NOTFOUND; --Termina el ciclo cuando ya no haya más registros
        DBMS_OUTPUT.PUT_LINE('Artículos: ' || v_nom || ', precio: ' || v_pre);
    END LOOP;
    
    CLOSE c_productos;
END;
