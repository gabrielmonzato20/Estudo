/*
	Como ter consultas mais �geis?

	> Normaliza��o (Bancos OLTP com baixa quantidade de dados)
	> Constraint PK
	> Quantidade de Colunas
	> Evite campos bin�rios (Salvo exce��es onde h� necessidade de armazenar arquivos)
	> Recomendamos FORTEMENTE o uso de Filestream/FileTable
	> Quando poss�vel, evite tabelas tempor�rias (exceto se houver �ndice) e cursores
	> WHERE (Procure utiliz�-lo em colunas estrat�gicas que possuam �ndices)
	> Evitar a todo custo: LIKE - NOT
	> Evitar Hints ao m�ximo
	> �ndices
	> Evitar consultas ad hoc (distribu�das/externas)
*/

/*

	Criando �ndices

	CREATE INDEX [UNIQUE] [CLUSTERED | NONCLUSTERED] INDEX <nome_do_ indice> 
	ON <nome_tabela_ou_view> ( <nome_coluna> [ASC | DESC] [,...] )

 � UNIQUE: A duplicidade do campo chave do �ndice n�o ser� permitida se utilizarmos essa palavra;
 � CLUSTERED: Indica que as linhas da tabela estar�o fisicamente ordenadas pelo campo que � a chave do �ndice;
 � NONCLUSTERED: Indica que o �ndice n�o interfere na ordena��o das linhas da tabela (default);
 � <nome_tabela_ou_view>: Nome da tabela ou view para a qual o �ndice ser� criado;
 � <nome_coluna>: � a coluna da tabela que ser� a chave do �ndice;
 � ASC: Esta palavra determina a ordena��o ascendente (padr�o);
 � DESC: Esta palavra determina a ordena��o descendente

*/

USE SysConVendas;
SELECT * FROM Dados;
EXEC sp_help Dados;
-- Visualizar �ndices
EXEC sp_helpindex Dados;

-- Configurar padr�o de entrada de datas
SET DATEFORMAT DMY;
-- Visualizando Plano de Execu��o
SELECT * FROM Dados
WHERE DataPedido BETWEEN '1/1/2007' AND '30/6/2007'
ORDER BY DataPedido DESC; 

-- Criar �ndices
CREATE INDEX  IX_DataPedido
ON Dados(DataPedido);

CREATE INDEX IX_Vendedor
ON Dados(Vendedor);

CREATE INDEX IX_Produto
ON Dados(Produto);

CREATE INDEX IX_Cidade
ON Dados(Cidade);

-- Criando �ndices Compostos
CREATE UNIQUE INDEX  UQ_Registro
ON Dados(Pedido,DataPedido,Vendedor,Cidade,Produto);

-- Excluir �ndice
DROP INDEX DADOS.IX_Cidade;

--------------------------------------------------------------------------------------------
-- HINTS
-- For�ar o SQL utilizar pesquina no �ndice
SELECT * FROM Dados
WITH (INDEX = IX_Produto)
WHERE Produto = 'Camisa';

SELECT * FROM Dados
WITH (INDEX = UQ_Registro)
WHERE Vendedor = 'Gisele' AND Produto = 'Gravata';

--------------------------------------------------------------------------------------------
-- MAXDOP
-- Definir quantidade de processadores para executar a consulta
SELECT * FROM Dados
WHERE Mes = 'Junho'
ORDER BY Regiao,Cidade
OPTION(MAXDOP 2);
