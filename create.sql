-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-06-02 17:43:35 EEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE animal (
    pet_name   VARCHAR2(20) NOT NULL,
    pet_type   VARCHAR2(20) NOT NULL,
    pet_age    INTEGER,
    pet_sex    VARCHAR2(20)
);

ALTER TABLE animal ADD CONSTRAINT animal_pk PRIMARY KEY ( pet_name,
                                                          pet_type );

CREATE TABLE human (
    user_name        VARCHAR2(30) NOT NULL,
    user_last_name   VARCHAR2(30) NOT NULL,
    user_age         INTEGER,
    user_type        VARCHAR2(20)
);

ALTER TABLE human ADD CONSTRAINT human_pk PRIMARY KEY ( user_name,
                                                        user_last_name );

CREATE TABLE humananimal (
    human_user_name        VARCHAR2(30) NOT NULL,
    human_user_last_name   VARCHAR2(30) NOT NULL,
    animal_pet_name        VARCHAR2(20) NOT NULL,
    animal_pet_type        VARCHAR2(20) NOT NULL,
    action                 VARCHAR2(30)
);

ALTER TABLE humananimal
    ADD CONSTRAINT humananimal_pk PRIMARY KEY ( human_user_name,
                                                human_user_last_name,
                                                animal_pet_name,
                                                animal_pet_type );

ALTER TABLE humananimal
    ADD CONSTRAINT humananimal_animal_fk FOREIGN KEY ( animal_pet_name,
                                                       animal_pet_type )
        REFERENCES animal ( pet_name,
                            pet_type );

ALTER TABLE humananimal
    ADD CONSTRAINT humananimal_human_fk FOREIGN KEY ( human_user_name,
                                                      human_user_last_name )
        REFERENCES human ( user_name,
                           user_last_name );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
