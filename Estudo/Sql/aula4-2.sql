USE RecursosAdicionais;
SELECT * FROM BASE1;
SELECT * FROM BASE2;
MERGE BASE2 AS BT2 
USING BASE1 AS BT1 
ON BT2.ID = BT1.ID 
WHEN MATCHED AND  BT2.PRODUTO <> BT1.PRODUTO 
THEN UPDATE SET BT2.PRODUTO = BT1.PRODUTO 
WHEN NOT MATCHED BY TARGET THEN INSERT (id,produto,valor) values (id,produto,valor);
-----------------------------------------------------------------------------------------
MERGE BASE2 AS BT2
USING BASE1 AS BT1
ON BT2.ID=BT1.ID
WHEN MATCHED AND BT2.VALOR != BT1.VALOR 
THEN UPDATE SET BT2.VALOR=BT1.VALOR WHEN NOT MATCHED 
BY TARGET THEN INSERT (id,produto,valor) VALUES  (ID,PRODUTO,VALOR);
-------------------
----------------$ACTION
