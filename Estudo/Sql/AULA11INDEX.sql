Use SysConVendas;
SELECT * FROM DADOS;
--ESTRUTURA DA TABELA
EXEC SP_HELP DADOS;
--VER INDICE
EXEC SP_HELPINDEX DADOS;
-- MUDAR O FORMATO
SET DATEFORMAT DMY;

SELECT * FROM DADOS WHERE DataPedido BETWEEN  '1/1/2007' AND '30/6/2007' ORDER BY DataPedido DESC;
-- CRIAR INDICE 
CREATE INDEX IX_DATAPEDIDO ON DADOS(DATAPEDIDO);
CREATE INDEX IX_VENDEDOR ON DADOS(VENDEDOR);
CREATE INDEX IX_PROD ON DADOS(PRODUTO);
--INDEX COMPOSTO
CREATE UNIQUE INDEX UQ_REGISTRO ON DADOS(PEDIDO,DATAPEDIDO,VENDEDOR,PRODUTO,CIDADE);

-- EXCLUIR INDEX
DROP INDEX DADOS.IX_DATAPEDIDO;
--HINTS
-- MAKE SQL USE INDEX TO SEARCH DATA
SELECT * FROM DADOS  
WITH (INDEX = IX_PROD)
WHERE PRODUTO ='CAMISA';
SELECT * FROM DADOS WITH (INDEX = UQ_REGISTRO) WHERE Vendedor = 'GISELE' AND PRODUTO ='GRAVATA';
--MAXDOP
--DEFINE HOW MUCH PROCESSOR YOU CAN USE FOR QUERY
SELECT * FROM DADOS WHERE MES='JUNHO'
ORDER BY Regiao,Cidade OPTION(MAXDOP 3);