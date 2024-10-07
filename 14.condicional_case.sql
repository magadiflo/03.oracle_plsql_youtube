/*-- CONDICIONAL - CASE --*/
/*EJERCICIO 01.*/
CREATE OR REPLACE FUNCTION f_dia_semana(p_numero INT)
RETURN VARCHAR2
IS
    dia VARCHAR2(25);
    BEGIN
        dia := '';
        CASE p_numero
            WHEN 1 THEN dia := 'Lunes';
            WHEN 2 THEN dia := 'Martes';
            WHEN 3 THEN dia := 'Miércoles';
            WHEN 4 THEN dia := 'Jueves';
            WHEN 5 THEN dia := 'Viernes';
            WHEN 6 THEN dia := 'Sábado';
            WHEN 7 THEN dia := 'Domingo';
        ELSE
            dia := 'No es un número correcto';
        END CASE;
        RETURN dia;
    END;

SELECT f_dia_semana(2) AS "Día de la semana" FROM DUAL;

/*EJERCICIO 02.*/
CREATE OR REPLACE FUNCTION f_trimestre(p_fecha DATE)
RETURN VARCHAR2
IS
    mes VARCHAR2(20);
    trimestre NUMBER;
    BEGIN
        mes := EXTRACT(MONTH FROM p_fecha);
        trimestre := 0;
        CASE mes
            WHEN 1 THEN trimestre := 1;
            WHEN 2 THEN trimestre := 1;
            WHEN 3 THEN trimestre := 1;
            WHEN 4 THEN trimestre := 2;
            WHEN 5 THEN trimestre := 2;
            WHEN 6 THEN trimestre := 2;
            WHEN 7 THEN trimestre := 3;
            WHEN 8 THEN trimestre := 3;
            WHEN 9 THEN trimestre := 3;
        ELSE 
            trimestre := 4;
        END CASE;
        RETURN 'La fecha pertenece al ' || trimestre || '° trimestre';
    END;
    
SELECT f_trimestre(CURRENT_DATE) FROM DUAL;
SELECT f_trimestre(TO_DATE('19/12/1990', 'dd/mm/yyyy')) AS trimestre FROM DUAL;