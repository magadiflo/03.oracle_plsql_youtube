/*-- JOBS - PARTE 1 --*/
CREATE TABLE log_actividades(
    id_log INT NOT NULL,
    fecha DATE
);

SELECT * FROM log_actividades;

--Creando Job
BEGIN
    SYS.DBMS_SCHEDULER.CREATE_JOB(
        job_name => 'job_uno',
        job_type => 'PLSQL_BLOCK',
        job_action => 'DECLARE 
            v_conteo NUMBER := 0;
            BEGIN
                SELECT COUNT(*)
                INTO v_conteo 
                FROM log_actividades;
                INSERT INTO log_actividades VALUES(v_conteo + 1, SYSDATE);
                COMMIT;
            END;',
        start_date => SYSTIMESTAMP,
        repeat_interval => 'freq = secondly; interval = 5',
        end_date => null,
        enabled => true,
        comments => 'log de actividades'
    );
END;

--eliminar job
BEGIN
  dbms_scheduler.drop_job(job_name => 'job_uno');
END;