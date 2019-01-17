USE SisDep;
SELECT  DISTINCT F.NomeFuncionario,CA.NOVINHO,CA.VELHINHO FROM FUNCIONARIO F JOIN Dependente D ON F.idMatricula = D.idMatricula
CROSS APPLY 
(SELECT  MAX(NascimentoDependente) AS NOVINHO , MIN(NascimentoDependente) AS VELHINHO 
FROM Dependente D 
WHERE D.idMatricula = F.idMatricula) AS CA ;
------------------------------------------------------------------------------------
SELECT  DISTINCT DD.NomeDepartamento,BB.[ULTIMO CONTRATADO],BB.[ULTIMO CONTRATADO] FROM Funcionario F JOIN Depto DD 
ON DD.idDepartamento = F.idDepartamento  AND DD.NomeDepartamento IN ('Administrativo','RH','TI','Financeiro')
CROSS APPLY(
SELECT MAX(ADMISSAO) AS [ULTIMO CONTRATADO], MIN(ADMISSAO) AS [FIST] FROM Funcionario Q WHERE Q.idDepartamento = DD.idDepartamento AND YEAR(ADMISSAO) BETWEEN 2000 AND 2005
)  AS BB