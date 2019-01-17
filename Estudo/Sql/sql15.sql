use sysconvendas;
select * from dados;
select * from dados for xml raw;
-- tage mean
select * from dados for xml raw ('Ítem_Pedido'),root('Pedidos');
--estrutura elemento
select * from dados for xml raw('item'),root('Pedidos'),elements;
--null values
Begin tran 
update Dados set vendedor =null where pedido = 21768
commit;
-- para valores nullos
select * from dados for xml raw('item_pedido'),root('Pedidos'),elements xsinil;
-- automatizar 
select * from dados for xml auto,root('Pedidos');
--declarar variavel
declare @primeira xml
--loader data
set @primeira= (
select PEDIDO, DataPedido,regiao,Produto,Total from dados for xml auto,root('Pedidos'),elements
)


--consultar variavel
select @primeira.query('Pedidos');
--consultar dado especifico
select @primeira.query('Pedidos/DataPedido');
--consulta linha  espeficifico
select @primeira.query('Pedidos[10]/DataPedido');
-- see if a camp exist
select @primeira.exist('Pedidos/Pedido');
-- see if a register exist
select @primeira.exist('Pedidos/Pedido[21069]');
--habilitar op advances 
EXEC sp_configure 'SHOW ADVANCED OPTION' ,1
RECONFIGURE
EXEC sp_configure 'xp_cmdshell',1
reconfigure;
DECLARE @comando VARCHAR(4000);

SET @comando = 'BCP "SELECT * FROM SysConVendas.dbo.Dados AS TIPO FOR XML AUTO, ROOT(''RESULTADO''), ELEMENTS " '
	 + ' QUERYOUT "C:\Users\Desenvolvimento   01\Desktop\ESTUDO\Estudo\Sql\Dados\Dados.XML" -SDESKTOP-UASTCAV\SQLEXPRESS -t -w -t -T'

EXEC MASTER..XP_CMDSHELL  @comando;
-- gerate json
SELECT * FROM DADOS FOR JSON AUTO,ROOT('Pedidos');
--read data json if use order db dont work just work master conver the arq of db
use master;
select * from openjson('["Sao Paulo","Rio de Janeiro","Curitiba"]');

