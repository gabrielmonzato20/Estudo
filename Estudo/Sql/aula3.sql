Use RecursosAdicionais;
INSERT INTO Instrutores (nomeInstrutor) VALUES 
('HELIO'),('AGNALDO'),('MAGNO'),('LUCIANA');
SELECT * FROM Instrutores;
DELETE FROM Instrutores WHERE id=20;
-- ATIV MODO INSERT
SET IDENTITY_INSERT INSTRUTORES ON;
-- OFF MODO ATIV
SET IDENTITY_INSERT INSTRUTORES OFF
INSERT INTO Instrutores(id,nomeInstrutor) VALUES (20,'GUI');
--COL INDENTIY
SELECT IDENTITYCOL FROM Instrutores;
-- FIST VALUE INIT
SELECT IDENT_SEED('INSTRUTORES');
--INCREMENTO
SELECT IDENT_INCR('INSTRUTORES');
--ULTIMO NUMERO GERADO
SELECT @@IDENTITY;
-- Retornando o último identity gerado no escopo da conexão de qualquer tabela
-- que tenha sido gerado através de uma procedure ou trigger
-- (Visto mais adiante no treinamento)
SELECT SCOPE_IDENTITY();

SELECT IDENT_CURRENT('INSTRUTORES');

DELETE FROM Instrutores;
INSERT INTO Instrutores (nomeInstrutor) VALUES ('BAHIA');
INSERT INTO Instrutores (nomeInstrutor) VALUES ('BAH');

SELECT * FROM Instrutores;
TRUNCATE TABLE INSTRUTORES;
--ZERAR CONTADOR
DBCC CHECKIDENT('INSTRUTORES',RESEED,5);