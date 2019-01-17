USE RecursosAdicionais;
INSERT INTO tblDocsClientes(descricao,documento) 
Select 'Planilha excel',BulkColumn From openrowset(bulk 'C:\Users\Desenvolvimento   01\Desktop\ESTUDO\Estudo\Sql\Dados\Clientes.xlsx',single_blob) as arquivo;


----filestream 
CREATE DATABASE FG_FILESTRE