-- Fun��es para campos do tipo IDENTITY
-- Banco RecursosAdicionais
USE RecursosAdicionais;
-- Inserindo Dados
INSERT INTO Instrutores
(nomeInstrutor)
VALUES
('H�lio'),('Agnaldo'),('Magno'),('Luciana');

SELECT * FROM Instrutores;

-- Excluir o Instrutor id 3
DELETE FROM Instrutores WHERE id = 20;

-- Reutilizando o id 20
-- Ativando o modo Insert em colunas identity
SET IDENTITY_INSERT Instrutores ON;
INSERT INTO Instrutores
(id,nomeInstrutor)
VALUES
(20,'M�rcio');

SELECT * FROM Instrutores;

-- Desativando o modo Insert em colunas identity
SET IDENTITY_INSERT Instrutores OFF;

-- Listar a coluna identity de uma tabela e seus valores
SELECT IDENTITYCOL FROM Instrutores;

-- Retornando o valor inicial
SELECT IDENT_SEED('Instrutores');
-- Retornando o valor de incremento
SELECT IDENT_INCR('Instrutores');

-- Retornando o �ltimo identity gerado no escopo da conex�o de qualquer tabela
SELECT @@IDENTITY;

-- Retornando o �ltimo identity gerado no escopo da conex�o de qualquer tabela
-- que tenha sido gerado atrav�s de uma procedure ou trigger
-- (Visto mais adiante no treinamento)
SELECT SCOPE_IDENTITY();

-- Retorna o valor original mais atual de uma coluna identity de uma tabela
SELECT IDENT_CURRENT('Instrutores');

DELETE FROM Instrutores;
truncate table instrutores;

INSERT INTO Instrutores
(nomeInstrutor)
Values('Raimundo Nonato');

SELECT * FROM Instrutores;

-- Zerar o contador do Identity
DBCC CHECKIDENT('Instrutores', RESEED,5);

INSERT INTO Instrutores
(nomeInstrutor)
Values('Raimundo Nonato');

SELECT * FROM Instrutores;
