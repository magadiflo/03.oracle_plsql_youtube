/*-- FUNCIONES --*/

/*EJERCICIO 01. */
CREATE OR REPLACE FUNCTION f_prueba(p_valor NUMBER)
RETURN NUMBER
IS
    BEGIN
        RETURN p_valor * 2;
    END;

--Ejecutando función
SELECT f_prueba(5) FROM DUAL;

/*EJERCICIO 02. */
CREATE OR REPLACE FUNCTION f_costo(p_valor NUMBER)
RETURN VARCHAR2
IS
    costo VARCHAR2(20);
    BEGIN
        costo := '';
        IF p_valor <= 600 THEN
            costo := 'ECONÓMICO';
        else 
            costo := 'COSTOSO';
        END IF;
        RETURN costo;
    END;

SELECT * FROM libros;
SELECT f_costo(300) FROM DUAL;

SELECT l.id, l.titulo, l.autor, l.precio, f_costo(l.precio) AS costo
FROM libros l;











