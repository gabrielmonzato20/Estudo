Use sisdep;
SELECT NomeFuncionario,Admissao,Salario,IIF(salario	<2000,'Reajuste','nAO PRESISA') AS aNALISE  FROM Funcionario
BEGIN TRAN
 UPDATE Funcionario SET SALARIO *= IIF(SALARIO<=200,1.1,1.5) OUTPUT deleted.NomeFuncionario,deleted.Salario AS ANTES,
 inserted.Salario AS NOVO;
 COMMIT
 --CHOOSE
 SELECT  idMatricula,NomeFuncionario,Admissao ,choose(datepart(weekday,admissao),'Dom','Seg','Ter','Quart','Quin','sex'	,'SAB') AS DIA from Funcionario
 --LAG
 SELECT idMatricula,NomeFuncionario,Admissao,Salario,LAG(Admissao,1) over(order by idMatricula) as adminn,LEAD(Admissao,1) over(order by idMatricula) FROM Funcionario
  SELECT idMatricula,NomeFuncionario,Admissao,Salario,LAG(Salario,1) over(order by idMatricula) as adminn,LEAD(Salario,1) 
  over(order by idMatricula),DATEdIFF(DAY,ADMISSAO,LAG(ADMISSAO,1,0) OVER(ORDER BY idMatricula)) 
  FROM Funcionario
  --FETCH-OFFSET
  SELECT * FROM Funcionario ORDER BY idMatricula OFFSET 50 ROWS FETCH NEXT 20 ROWS ONLY;
    SELECT * FROM Funcionario ORDER BY idMatricula OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
