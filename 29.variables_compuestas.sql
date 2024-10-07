/*-- VARIABLES COMPUESTAS --*/
DROP TABLE productos;

CREATE TABLE productos (
    codigo            INT NOT NULL PRIMARY KEY,
    nombre            VARCHAR2(100) NOT NULL,
    precio            NUMBER(6, 2) NOT NULL,
    codigo_fabricante INT NOT NULL
);

insert into productos values(1, 'Disco duro SATA· 1TB', 86.99, 5);
insert into productos values(2 , 'Memoria RAM DDR4 8GB', 120, 6);
insert into productos values(3, 'DISCO SSD 1 TB', 150.99, 4);
insert into productos values(4, 'GEFORCE GTX 1050Ti', 185, 7);
insert into productos values(5, 'GEFORCE GTX 1080TI', 755, 6);
insert into productos values(6, 'Monitor 24 LED Full HD', 202, 1);
insert into productos values(7, 'Monitor 27 LED Full HD', 245.99, 1);
insert into productos values(8, 'Portátil Yoga 520', 559, 2);
insert into productos values(9, 'Portátil Ideapd 320', 444, 2);
insert into productos values(10, 'Impresora HP Deskjet 3720', 59.99, 3);
insert into productos values(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SET SERVEROUTPUT ON;

/*EJERCICIO 01. Variable compuesta basada en una tabla*/
DECLARE
    reg_productos productos%rowtype;

BEGIN
    SELECT * 
    INTO reg_productos
    FROM productos
    WHERE codigo = 3;
    
    DBMS_OUTPUT.PUT_LINE('Característica del producto');
    DBMS_OUTPUT.PUT_LINE('Código de producto: ' || reg_productos.codigo);
    DBMS_OUTPUT.PUT_LINE('Artículo: ' || reg_productos.nombre);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || reg_productos.precio);
    DBMS_OUTPUT.PUT_LINE('Serial: ' || reg_productos.codigo_fabricante);
END;

/*EJERCICIO 02. Variable compuesta a nivel de cursor*/
DECLARE
    CURSOR c_productos 
    IS SELECT * 
        FROM productos;
        
    var_productos c_productos%rowtype;
    
BEGIN
    OPEN c_productos;
    LOOP
        FETCH c_productos INTO var_productos;
        EXIT WHEN c_productos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(var_productos.codigo || ' ' || var_productos.nombre);
    END LOOP;
END;



















