/*-- DEPENDENCIAS Y VALIDACIONES DE OBJETOS --*/
SELECT * FROM user_dependencies;

SELECT * 
FROM user_dependencies 
WHERE name = 'employees';

SELECT * 
FROM user_dependencies 
WHERE name = 'EMP_DETAILS_VIEW';

SELECT * 
FROM user_dependencies
WHERE referenced_name = 'EMPLOYEES';

SELECT * 
FROM user_objects;

SELECT status, COUNT(*)
FROM user_objects
GROUP BY status;

SELECT * 
FROM user_objects
WHERE object_name LIKE '%V_PRUEBA%';

-- VALIDACIONES
CREATE OR REPLACE PROCEDURE sp_01
IS
    BEGIN
        null;
    END;

CREATE OR REPLACE PROCEDURE sp_02
IS
    BEGIN
        sp_01;
    END;
    
SELECT * 
FROM user_objects 
WHERE object_name LIKE '%SP_%';
    
ALTER PROCEDURE sp_02 COMPILE;
    
    
    
    
    
    
    
    
    
    
    