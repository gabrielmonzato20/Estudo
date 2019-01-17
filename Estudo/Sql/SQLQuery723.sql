USE PEDIDOS;
SELECT * INTO PROD_COPIA FROM TB_PRODUTO;
--EX3
DELETE  FROM PROD_COPIA OUTPUT
 DELETED.* 
 FROM 
 PROD_COPIA P 
 JOIN TB_TIPOPRODUTO T 
 ON P.COD_TIPO = T.COD_TIPO 
 WHERE T.TIPO = 'CANETA'; 
 --EX 4
 UPDATE 
 PROD_COPIA 
 SET PRECO_VENDA*=1.1 
 OUTPUT INSERTED.ID_PRODUTO, inserted.DESCRICAO,deleted.PRECO_VENDA 
 AS PREC_OLD,inserted.PRECO_VENDA AS PREC_NOVO FROM PROD_COPIA P JOIN TB_TIPOPRODUTO
 TP ON TP.COD_TIPO = P.COD_TIPO WHERE TP.TIPO = 'REGUA';
 SET IDENTITY_INSERT PROD_COPIA ON
 --EX5

 MERGE PROD_COPIA AS PD
 USING TB_PRODUTO AS TP
 ON PD.ID_PRODUTO = TP.ID_PRODUTO
 WHEN MATCHED AND PD.PRECO_VENDA <> TP.PRECO_VENDA THEN
 UPDATE SET PD.PRECO_VENDA = TP.PRECO_VENDA
 WHEN NOT MATCHED THEN
 INSERT (ID_PRODUTO
 ,COD_PRODUTO,DESCRICAO,
 COD_UNIDADE,
 COD_TIPO,PRECO_VENDA,
 PRECO_CUSTO,PRECO_VENDA,
 QTD_ESTIMADA,QTD_REAL,QTD_MINIMA,CLAS_FISC,IPI,PESO_LIQ) 
 VALUES (ID_PRODUTO
 ,COD_PRODUTO,DESCRICAO,
 COD_UNIDADE,
 COD_TIPO,PRECO_VENDA,
 PRECO_CUSTO,PRECO_VENDA,
 QTD_ESTIMADA,QTD_REAL,QTD_MINIMA,CLAS_FISC,IPI,PESO_LIQ)
 OUTPUT $ACTION, INSERTED.ID_PRPDUTO,DELETED.PRECO_VENDA,INSERTED.PRECO_VENDA;
 SET IDENTITY_INSERT PROD_COPIA OFF; 
 --Bex6
 USE PEDIDOS;
 SELECT ESTADO,VLR_TOTAL,
 MONTH(DATA_EMISSAO) 
 AS MES FROM TB_PEDIDO P JOIN TB_CLIENTE 
 ON TB_CLIENTE.CODCLI = P.CODCLI WHERE YEAR(DATA_EMISSAO) =2013
 --BEX7
 --C1
 USE PEDIDOS;
 --C2
 WITH EX(MES,ANO,MAIOR_BUY)
 AS(
 SELECT MONTH(DATA_EMISSAO) AS MES
 ,YEAR(DATA_EMISSAO)AS ANO,
 MAX(VLR_TOTAL)AS MAIOR_BUY
 FROM TB_PEDIDO  WHERE YEAR(DATA_EMISSAO) =2013
 GROUP BY YEAR(DATA_EMISSAO) ,MONTH(DATA_EMISSAO)
 ) ;