CREATE TABLESPACE ADMIN DATAFILE 'D:\ORACLE\ORADATA\XE\ADMIN.dbf' SIZE  500M ;

CREATE USER TIS001 IDENTIFIED BY 1234;

GRANT 
 CREATE SESSION
,CREATE TABLE
,CREATE SEQUENCE  
,CREATE VIEW
,RESOURCE
,CREATE SYNONYM 
TO TIS001;
--table member id(primary key)/name/hp/


