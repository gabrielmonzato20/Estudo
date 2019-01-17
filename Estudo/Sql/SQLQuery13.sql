use sisdep;
EXEC sp_configure 'show advanced option', '1';
EXEC sp_configure 'Ad Hoc Distributed Queries','1';
Reconfigure;
--import xlsx excel -- arquivo n pode estar aberto
INSERT INTO PEDIDOS SELECT * FROM OPENROWSET (
'Microsoft.ACE.OLEDB.12.0',
'EXcel 12.0;DataBase=C:\Users\Desenvolvimento   01\Desktop\ESTUDO\Estudo\Sql\Dados\Pedidos.xlsx',
'SELECT * FROM [Dados$]'
);
--exportat 
insert into openrowset(
'microsoft.ace.oledb.12.0',
'Excel 12.0;DataBase = C:\Users\Desenvolvimento   01\Desktop\ESTUDO\Estudo\Sql\Dados\Clientes.xlsx',
'SELECT * FROM[Dados$]'
)
Select * from Clientes;