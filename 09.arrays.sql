/*-- ARRAYS --*/

/*EJERCICIO 01. */
SET SERVEROUTPUT ON;

DECLARE
    TYPE a_paises IS VARRAY(5) OF VARCHAR2(20);
    nombre a_paises;
    
BEGIN
    nombre := a_paises('Arentina', 'Brasil', 'Perú', 'México', 'Rep. Dominicana');
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombre(i));
    END LOOP;
END;

/*EJERCICIO 02. */
DECLARE
    TYPE matriz_nombres IS VARRAY(5) OF VARCHAR2(20);
    TYPE matriz_edades IS VARRAY(5) OF INTEGER;
    nombres matriz_nombres;
    edades matriz_edades;
    total INTEGER;
    
BEGIN
    nombres := matriz_nombres('Martín', 'Gaspar', 'Alicia', 'Violeta', 'Tinkler');
    edades := matriz_edades(32,31,52,50,24);
    
    total := nombres.COUNT;
    FOR i IN 1..total LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || nombres(i) || ' edad: ' || edades(i));
    END LOOP;    
END;