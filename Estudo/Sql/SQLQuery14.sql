USE DadosExternos;
-- SEM DELETE POIS TEM CACHE 
TRUNCATE TABLE PRODUTOS; 
BULK INSERT PRODUTOS  FROM 'C:\Users\Desenvolvimento   01\Desktop\ESTUDO\Estudo\Sql\Dados\Produtos.txt' 
WITH(
FIELDTERMINATOR =';',
ROWTERMINATOR='\n',
CODEPAGE ='ACP'
);
------------------------------------------------------------------
CREATE TABLE CURSOS(
IDCURSO INT PRIMARY KEY,
NOMECURSO NVARCHAR(50),
VALORCURSO SMALLMONEY

);
----------------trucante para atualizar a base de dados;
---- TXT
BULK INSERT CURSOS FROM 'C:\Users\Desenvolvimento   01\Desktop\ESTUDO\Estudo\Sql\Dados\Cursos.txt' with(
fieldterminator = ';',
rowterminator = '\n',
codepage = 'acp'
);
select * from cursos;