USE DB_AULA_IMPACTA;
SELECT DB_NAME() FROM SYSOBJECTS ;
SELECT FILE_NAME() ,DB_NAME(),
EXEC sp_helpuser;
EXEC sp_helpfile;
EXEC sp_helplogins;
