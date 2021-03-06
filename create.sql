-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-06-03 15:35:23 EEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE animals (
    pet_name       VARCHAR2(30) NOT NULL,
    pet_type       VARCHAR2(20) NOT NULL,
    pet_age        VARCHAR2(20),
    pet_sex        VARCHAR2(20),
    pet_pictures   BLOB
);

ALTER TABLE animals ADD CONSTRAINT animals_pk PRIMARY KEY ( pet_name,
                                                            pet_type );

CREATE TABLE users (
    id_user     INTEGER NOT NULL,
    user_name   VARCHAR2(30),
    user_age    INTEGER
);

ALTER TABLE users ADD CONSTRAINT users_pk PRIMARY KEY ( id_user );

CREATE TABLE usersanimals (
    users_id_user      INTEGER NOT NULL,
    animals_pet_name   VARCHAR2(30) NOT NULL,
    animals_pet_type   VARCHAR2(20) NOT NULL
);

ALTER TABLE usersanimals
    ADD CONSTRAINT usersanimals_pk PRIMARY KEY ( users_id_user,
                                                 animals_pet_name,
                                                 animals_pet_type );

ALTER TABLE usersanimals
    ADD CONSTRAINT usersanimals_animals_fk FOREIGN KEY ( animals_pet_name,
                                                         animals_pet_type )
        REFERENCES animals ( pet_name,
                             pet_type );

ALTER TABLE usersanimals
    ADD CONSTRAINT usersanimals_users_fk FOREIGN KEY ( users_id_user )
        REFERENCES users ( id_user );



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
