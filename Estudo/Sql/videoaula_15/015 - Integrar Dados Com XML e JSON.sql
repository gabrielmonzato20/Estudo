-- Gerando dados XML
USE SysConVendas;
SELECT * FROM Dados;

-- XML RAW sem tag ra�z (somente linha de registro)
SELECT * FROM Dados
FOR XML RAW;

-- Criando uma tag principal
SELECT * FROM Dados
FOR XML RAW('�tem_Pedido'),ROOT('Pedidos');

-- Dados com estrutura de elemento
SELECT * FROM Dados
FOR XML RAW('�tem_Pedido'),ROOT('Pedidos'),ELEMENTS;

-- Lidando com campos nulos
BEGIN TRAN TR01
	UPDATE Dados WITH(ROWLOCK)
	SET Vendedor = NULL
	WHERE Pedido = 21768
COMMIT;

-- Perceber que o campo vendedor n�o � exibido no pedido 21768
SELECT * FROM Dados
FOR XML RAW('�tem_Pedido'),ROOT('Pedidos'),ELEMENTS;

-- Solu��o XSINIL
SELECT * FROM Dados
FOR XML RAW('�tem_Pedido'),ROOT('Pedidos'),ELEMENTS XSINIL;

-- XML Tag AUTO
SELECT * FROM Dados
FOR XML AUTO,ROOT('Pedidos');


-- M�todo QUERY
-- Declarando uma vari�vel XML 
DECLARE @xml XML
-- Carrega as informa��es da consulta para a vari�vel XML, utilizando o FOR XML: 
SET @xml =  
( 
	SELECT Pedido,DataPedido,Regiao,produto,total 
	FROM Dados AS Pedidos
	FOR XML AUTO, ELEMENTS 
 );

SELECT @xml.query('Pedidos');

-- Consultando um campo espec�fico

SELECT @xml.query('Pedidos/DataPedido');

-- Consultando um registro espec�fico
SELECT @xml.query('Pedidos[10]/DataPedido');

-- Verificar Exist�ncia de um campo
SELECT @XML.exist('Pedidos/Codigo');
  
SELECT @XML.exist('Pedidos/Pedido');


-- Verificar Exist�ncia de um registro
SELECT @XML.exist('Pedidos/Codigo[100]');
  
SELECT @XML.exist('Pedidos/Pedido[5000]');

--Habilitar op��es avan�adas 
EXEC sp_configure 'show advanced option',1
RECONFIGURE
--Habilitar a execu��o da procedure XP_CMDSHELL
EXEC sp_configure 'xp_cmdshell',1
RECONFIGURE

-- Exportar XML
/*
	BCP
	� Queryout: Nome do arquivo de sa�da;
	� S:Nome do servidor;
	� T: Acesso atrav�s de conta do Windows;
	� w: Utiliza UNICODE;
	� r: Terminador de linha;
	� t: Terminador de campo {TAB}.

*/


DECLARE @comando VARCHAR(4000);

SET @comando = 'BCP "SELECT * FROM SysConVendas.dbo.Dados AS TIPO FOR XML AUTO, ROOT(''RESULTADO''), ELEMENTS " '
	 + ' QUERYOUT "C:\DADOS\Dados.XML" -SDESKTOP-UASTCAV\SQLEXPRESS -t -w -t -T'

EXEC MASTER..XP_CMDSHELL  @comando;

-- Gerar Dados JSON
SELECT * FROM Dados
FOR JSON AUTO,ROOT('Pedidos');

-- Ler Dados JSON
USE master;
SELECT * FROM OPENJSON(
	'["S�o Paulo", "Rio de Janeiro", "Minas Gerais", "Paran�", "Santa Catarina"]'
	);

-- Exportar JSON

DECLARE @comandojs VARCHAR(4000)
SET @comandojs = 
	'BCP "SELECT * FROM SysConVendas.dbo.Dados AS TIPO FOR JSON AUTO" '
		+ ' QUERYOUT "C:\DADOS\ARQUIVOJSON.XML" -SDESKTOP-UASTCAV\SQLEXPRESS -t -w -t -T'
EXEC MASTER..XP_CMDSHELL  @comandojs

