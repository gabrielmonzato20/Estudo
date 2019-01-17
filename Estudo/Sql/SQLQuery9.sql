USE RecursosAdicionais;
INSERT INTO tblDocsClientes(descricao,documento)
SELECT 'PLANILHA EXCEL',BULKCOLUMN FROM OPENROWSET(BULK 'C:\Dados\Clientes.xlsx',SINGLE_BLOB) AS EXC;
SELECT * FROM tblDocsClientes
UPDATE tblDocsClientes SET documento =
 (SELECT * FROM OPENROWSET( bulk 'C:\Dados\Pedidos.xlsx',single_blob) as arq) 
 where idDoc=1
 --filetable
 exec sp_configure filestream_access_level, 2
 reconfigure;
create database filee
 on primary(
 name = FG_Filestream_PRIMARY,
filename = 'C:\DADOS\fille.mdf'),
filegroup  FG_Filestream_FS
contains filestream(
Name = Filestream_ARQ,
filename = 'C:\DADOS\file_arq')
log on(name = Filestream_log ,
filename = 'C:\DADOS\file_log.ldf')
with filestream(NON_TRANSACTED_ACCESS =FULL,DIRECTORY_NAME = N'Filestream_AQQ');
-- CREATE FILETRABLE
use filee;
CREATE TABLE FT_DOC AS FILETABLE WITH(FILETABLE_DIRECTORY = 'Filestream_AQQ',FileTable_Collate_Filename = database_default);
select * from FT_DOC;