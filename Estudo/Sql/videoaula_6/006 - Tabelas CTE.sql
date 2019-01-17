Use SysConVendas;
WITH CTE(Ano,M�s,MaiorPedido)
AS
	(
		SELECT YEAR(DataPedido) AS Ano, Mes AS M�s, MAX(DataPedido) AS MaiorPedido
		FROM Dados GROUP BY YEAR(DataPedido),Mes
	)
SELECT * FROM CTE WHERE Ano = 2006 AND M�s = 'Abril'
UNION
SELECT * FROM CTE WHERE Ano = 2007 AND M�s = 'Junho'

Use SisDep;
WITH Reajuste
AS
(
    SELECT TOP 10 idMatricula,NomeFuncionario,Admissao,Salario
    FROM Funcionario
    ORDER BY Admissao ASC 
)
UPDATE Reajuste
SET Salario *= 1.1
OUTPUT
	deleted.NomeFuncionario,
	deleted.Salario,
	inserted.Salario
