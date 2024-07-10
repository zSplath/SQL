CREATE LOGIN usuarioteste WITH PASSWORD = 'teste123';

CREATE LOGIN [DAVI\Dev] FROM WINDOWS;

SELECT * FROM MASTER.SYS.sql_logins

SELECT name, LOGINPROPERTY(name, 'PasswordLastSetTime') AS lastlogin FROM MASTER.SYS.sql_logins

SELECT name, password_hash FROM MASTER.SYS.sql_logins

CREATE LOGIN teste WITH PASSWORD = 'teste';

SELECT name FROM MASTER.SYS.sql_logins WHERE PWDCOMPARE (name, password_hash) = 1;


ALTER SERVER ROLE [dbcreator] ADD MEMBER [usuarioteste]
ALTER SERVER ROLE [dbcreator] DROP MEMBER [usuarioteste]

SELECT * FROM sys.server_principals WHERE is_fixed_role = 1

CREATE USER usuarioteste FOR LOGIN usuarioteste;

EXEC sp_addrolemember 'db_datareader', 'usuarioteste'
EXEC sp_addrolemember 'db_datawriter', 'usuarioteste'

EXEC sp_droprolemember 'db_datawriter', 'usuarioteste'
EXEC sp_droprolemember 'db_datareader', 'usuarioteste'