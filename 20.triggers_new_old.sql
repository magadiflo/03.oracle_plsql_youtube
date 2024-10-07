/*-- TRIGGERS - :NEW :OLD --*/

DROP TABLE libros;
DROP TABLE ofertas;

CREATE TABLE libros (
    codigo    NUMBER(6),
    titulo    VARCHAR2(40),
    autor     VARCHAR2(30),
    editorial VARCHAR(20),
    precio    NUMBER(6, 2)
);

CREATE TABLE ofertas (
    codigo  NUMBER(6),
    precio  NUMBER(6, 2),
    usuario VARCHAR2(20),
    fecha   DATE
);

insert into libros values(100,'Uno','Richard Bach','Planeta',25);
insert into libros values(103,'El aleph','Borges','Emece',28);
insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);

/*EJERCICIO 01 Controla la INSERCIÓN*/
CREATE OR REPLACE TRIGGER tr_ingresa_libros
BEFORE INSERT
ON libros
FOR EACH ROW
    BEGIN
        IF (:NEW.precio <= 30) THEN
            INSERT INTO ofertas(codigo, precio, usuario, fecha)
            VALUES(:NEW.codigo, :NEW.precio, USER, SYSDATE);
        END IF;
    END tr_ingresa_libros;


--Probando el trigger
insert into libros values(150,'Spring Boot 2','Andrés Guzmán','Bruño',29.50);

SELECT * FROM libros;
SELECT * FROM ofertas;


/*EJERCICIO 02 Controla la ACTUALIZACIÓN*/
CREATE OR REPLACE TRIGGER tr_actualiza_libros
BEFORE UPDATE OF precio
ON libros
FOR EACH ROW
    BEGIN
        IF (:OLD.precio <= 30) AND (:NEW.precio > 30) THEN
            DELETE FROM ofertas
            WHERE codigo = :OLD.codigo;
        END IF;
        IF (:OLD.precio > 30) AND (:NEW.precio <= 30) THEN
            INSERT INTO ofertas(codigo, precio, usuario, fecha)
            VALUES(:NEW.codigo, :NEW.precio, USER, SYSDATE);
        END IF;
    END tr_actualiza_libros;

--Probando el trigger
SELECT * FROM libros;
SELECT * FROM ofertas;

UPDATE libros 
SET precio = 25
WHERE codigo = 145;

UPDATE libros
SET precio = 50
WHERE codigo = 145;



