----------------------------------------------------------------------------------------
-- MERGE
----------------------------------------------------------------------------------------
USE RecursosAdicionais;

SELECT * FROM Base1;
SELECT * FROM Base2;


/*
	A instru��o MERGE � �til quando necessitamos sincronizar bases
	Faz-se necess�rio definirmos quem ser� a base de origem (Source)
	e destino.
	Neste exemplo iremos considerar a base1 como a base de refer�ncia
	Temos os seguintes cen�rios:

	- H� �tens na base1 n�o presentes na base2
	- H� �tens na base1 existentes na base2, entretanto inconsistentes
	- H� �tens na base2 n�o presentes na base1

	A instru��o MERGE exige explicitamente a especifica��o de fim de instru��o (;)
	H� restri��o de uma �nica instru��o de UPDATE - INSERT - DELETE por vez
*/
MERGE Base2 AS B2 -- Tabela Alvo
USING Base1 AS B1 -- Tabela Origem
ON B2.id = B1.id
WHEN MATCHED AND B2.Produto <> B1.Produto THEN
	UPDATE SET B2.Produto = B1.Produto

WHEN NOT MATCHED BY TARGET THEN
	INSERT (id,produto,valor)
	VALUES
	(id,produto,valor);

MERGE Base2 AS B2 -- Tabela Alvo
USING Base1 AS B1 -- Tabela Origem
ON B2.id = B1.id
WHEN MATCHED AND B2.valor <> B1.Valor THEN
	UPDATE SET B2.Valor = B1.Valor;

-- Alterar dados na base1 e base2 (modo design-edit)

-- Instru��o $ACTION
BEGIN TRAN;
MERGE Base2 AS B2
USING Base1 AS B1
ON B2.id = B1.id
WHEN MATCHED AND B2.Valor <> B1.Valor THEN
	UPDATE SET B2.Valor = B1.Valor

WHEN NOT MATCHED BY TARGET THEN
	INSERT (id,produto,valor)
	VALUES
	(id,produto,valor)
WHEN NOT MATCHED BY SOURCE THEN
	DELETE
OUTPUT
	$ACTION				AS [A��o],
	Inserted.id			AS [id Inserido],
	Inserted.Produto	AS [Produto Inserido],
	Inserted.valor		AS [Valor Inserido],
	Deleted.id			AS [Id Exclu�do],
	Deleted.Produto		AS [Produto Exclu�do],
	Deleted.Valor		AS [Valor Exclu�do];

COMMIT;
-------------------------------------------------------------------
BEGIN TRAN;
MERGE Base1 AS B1
USING Base2 AS B2
ON B2.id = B1.id

WHEN NOT MATCHED BY TARGET THEN
	INSERT (id,produto,valor)
	VALUES
	(id,produto,valor)
WHEN NOT MATCHED BY SOURCE THEN
	DELETE
OUTPUT
	$ACTION				AS [A��o],
	Inserted.id			AS [id Inserido],
	Inserted.Produto	AS [Produto Inserido],
	Inserted.valor		AS [Valor Inserido],
	Deleted.id			AS [Id Exclu�do],
	Deleted.Produto		AS [Produto Exclu�do],
	Deleted.Valor		AS [Valor Exclu�do];

COMMIT;
-----------------------------------------------------------------------------------------
