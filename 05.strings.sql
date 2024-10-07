/*-- STRINGS --*/
SET SERVEROUTPUT ON;

DECLARE
    nombre VARCHAR2(20);
    direccion VARCHAR2(30);
    detalles CLOB; -- <- Permite almacenar gran cantidad de texto
    eleccion CHAR(1);

BEGIN
    nombre := 'Martín Díaz';
    direccion := 'Las Casuarinas Mz H2-33';
    detalles := 'Este es el detalle de la variable clob que iniciamos en la sección declarativa';
    eleccion := 'y';
    
    IF eleccion = 'y' THEN       
        DBMS_OUTPUT.PUT_LINE(nombre);
        DBMS_OUTPUT.PUT_LINE(direccion);
        DBMS_OUTPUT.PUT_LINE(detalles);
    END IF;
END;
/ -- <-- esa barra es opcional, se usaba en versiones anteriores de Oracle

/*-- FUNCIONES DE CADENA --*/
DECLARE
    saludo VARCHAR2(20) := 'HOLA A TODOS';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE(LOWER(saludo));
    DBMS_OUTPUT.PUT_LINE(UPPER(saludo));
    DBMS_OUTPUT.PUT_LINE(INITCAP(saludo));--Convierte en mayúscula las primeras letras
    DBMS_OUTPUT.PUT_LINE(SUBSTR(saludo, 2,3));--Obtiene una sub cadena
    DBMS_OUTPUT.PUT_LINE(SUBSTR(saludo, 2));
    DBMS_OUTPUT.PUT_LINE(INSTR(saludo, 'A')); --Busca posición de un elemento en la cadena
END;


/*-- FUNCIONES RTRIM, LTRIM, TRIM --*/
DECLARE
    saludo VARCHAR2(20) := '####Hola a todos####';
    saludo_con_espacios VARCHAR(20) := '   Hola que tal   ';
    
BEGIN
    DBMS_OUTPUT.PUT_LINE(RTRIM(saludo, '#'));
    DBMS_OUTPUT.PUT_LINE(LTRIM(saludo, '#'));
    DBMS_OUTPUT.PUT_LINE(TRIM('#' FROM saludo));
    DBMS_OUTPUT.PUT_LINE(TRIM(' ' FROM saludo_con_espacios));
    DBMS_OUTPUT.PUT_LINE(TRIM(saludo_con_espacios));
END;



