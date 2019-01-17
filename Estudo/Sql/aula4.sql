USE RecursosAdicionais;
 MERGE BASE2 AS BA2
 USING BASE1 AS BA1
 ON BA2.ID=BA1.ID
 WHEN MATCHED AND BA2.VALOR<> BA1.VALOR THEN
 UPDATE SET BA2.VALOR=BA1.VALOR
 WHEN NOT MATCHED BY TARGET THEN
 INSERT (ID,PRODUTO,VALOR) VALUES (ID,PRODUTO,VALOR)
 WHEN NOT MATCHED BY SOURCE THEN
 DELETE
 OUTPUT 
 $ACTION AS ACTIONS,
 INSERTED.ID AS ID_INSERT,
 INSERTED.VALOR AS INSERT_VAL,
 INSERTED.PRODUTO AS PROD_INSER,
 DELETED.ID AS PROD_EX,
 DELETED.VALOR AS VAL_COL,
 DELETED.PRODUTO AS PROD_DEL;