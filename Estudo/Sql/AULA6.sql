USE SYSCONVENDAS;
WITH PRIMEIRA(ANO,MESS,MAIORPEDIDO)
AS
(
SELECT YEAR(DATAPEDIDO) AS ANO ,MES AS MESS,MAX(DATAPEDIDO) AS [MAIORPEDIDO] FROM Dados GROUP BY YEAR(DATAPEDIDO),MES
)
SELECT * FROM PRIMEIRA WHERE ANO=2006 AND MESS='ABRIL' UNION SELECT * FROM PRIMEIRA WHERE ANO=2007 AND MESS='JUNHO';

USE SisDep;

WITH SEGUNDA AS 
(
SELECT TOP 10 Salario,Admissao,NomeFuncionario FROM Funcionario 
WHERE Salario<=2000 AND YEAR(Admissao)< 2005 ORDER BY ADMISSAO ASC
)
UPDATE SEGUNDA SET SALARIO*=1.1 OUTPUT deleted.NomeFuncionario,inserted.SALARIO,DELETED.Salario