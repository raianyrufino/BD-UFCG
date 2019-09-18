CREATE TABLE tarefas(
	id_funcionario VARCHAR(10),
	funcao TEXT,
	cpf_funcionario VARCHAR(11),
	numero_tarefa INTEGER,
	status_tarefa CHAR(1)
);

-- Question 1 --

INSERT INTO tarefas VALUES(2147483646, 'limpar chao do corredor central', '98765432111', 0, 'F');
INSERT INTO tarefas VALUES(2147483647, 'limpar janelas da sala 203', '98765432122', 1, 'F');
INSERT INTO tarefas VALUES(null, null, null, null, null);

-- As inserções abaixo NÃO devem ter a execução autorizada. 
INSERT INTO tarefas VALUES(2147483644, 'limpar chao do corredor superior', '987654323211', 0, 'F');
INSERT INTO tarefas VALUES(2147483643, 'limpar chao do corredor superior', '98765432321', 0, 'FF');


-- Question 2 --

INSERT INTO tarefas VALUES(2147483648, 'limpar portas do terreo', '32323232955', 4, 'A');


-- Question 3 -- 

ALTER TABLE tarefas ALTER COLUMN id_funcionario TYPE NUMERIC;

-- Altere a penultima coluna de forma a não permitir as insercoes abaixo
INSERT INTO tarefas VALUES(2147483649, 'limpar portas da entrada principal', '32322525199', 32768, 'A');
INSERT INTO tarefas VALUES(2147483650, 'limpar janelas da entrada principal', '32333233288', 32769, 'A');

ALTER TABLE tarefas ADD CHECK(numero_tarefa<=32767);

-- Porem, ainda ser possivel inserir os seguintes:
INSERT INTO tarefas VALUES(2147483651, 'limpar portas do 1o andar', '32323232911', 32767, 'A');
INSERT INTO tarefas VALUES(2147483652, 'limpar portas do 2o andar', '32323232911', 32766, 'A');


-- Question 4 -- 
ALTER TABLE tarefas RENAME COLUMN id_funcionario TO id;
ALTER TABLE tarefas RENAME COLUMN funcao TO descricao;
ALTER TABLE tarefas RENAME COLUMN cpf_funcionario TO func_resp_cpf;
ALTER TABLE tarefas RENAME COLUMN numero_tarefa TO prioridade;
ALTER TABLE tarefas RENAME COLUMN status_tarefa TO status;

-- Execute comandos de forma a não permitir valores NULL em nenhuma das colunas
DELETE FROM tarefas WHERE id IS NULL; -- Excluindo tupla existente com valores nulos
 
ALTER TABLE tarefas ALTER COLUMN id SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN funcao_resp_cpf SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN prioridade SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN status SET NOT NULL;

INSERT INTO tarefas VALUES(null, null, null, null, null); -- Testando a insercao de valores nulos

-- Question 5 -- 

-- Adicionando uma restricao de integridade de forma a permitir a insercao da primeira tupla, mas nao da segunda.
ALTER TABLE tarefas ADD PRIMARY KEY(id);

INSERT INTO tarefas VALUES(2147483653, 'limpar portas do 1o andar', '32323232911', 2, 'A');
INSERT INTO tarefas VALUES(2147483653, 'aparar a grama da area frontal', '32323232911', 3, 'A');  -- Testando a restricao de integridade

-- Question 6 -- 

-- A)
ALTER TABLE tarefas ADD CONSTRAINT validaCPF CHECK(LENGTH(func_resp_cpf) = 11);

INSERT INTO tarefas VALUES (2147483650, 'limpar portas do 1o andar', '323232329115',2,'A'); -- Testando a insercao de um CPF maior que a restricao
INSERT INTO tarefas VALUES (2147483650, 'limpar portas do 1o andar', '32323232911',2,'A');

-- B)

-- Realizacao do UPDATE antes da adicao de restricao
UPDATE tarefas SET status = 'P' WHERE status = 'A';
UPDATE tarefas SET status = 'R' WHERE status = 'E';
UPDATE tarefas SET status = 'F' WHERE status = 'C';

ALTER TABLE tarefas ADD CONSTRAINT validaStatus CHECK (status = 'P' OR status = 'E' OR status = 'C');

-- Question 7 -- 
UPDATE tarefas SET prioridade = '5' WHERE prioriedade = '32767';
UPDATE tarefas SET prioridade = '5' WHERE prioriedade = '32766';

-- Realizacao do UPDATE antes da adicao de restricao
ALTER TABLE tarefas ADD CONSTRAINT validaPrioridade CHECK(prioridade >= 0 AND prioridade <= 5);

-- Question 8 -- 
CREATE TABLE funcionario(
	cpf CHAR(11) PRIMARY KEY,
	data_nasc DATE NOT NULL, 
	nome VARCHAR(20) NOT NULL,
	funcao TEXT NOT NULL, 
	nivel CHAR(1), 
	superior_cpf CHAR(11) REFERENCES funcionario(cpf)
);

ALTER TABLE funcionario ALTER COLUMN nivel SET NOT NULL;
ALTER TABLE funcionario ADD CONSTRAINT checkFuncao CHECK (funcao = 'LIMPEZA' OR funcao = 'SUP_LIMPEZA');
ALTER TABLE funcionario ADD CONSTRAINT validaNivel CHECK(nivel = 'J' OR nivel = 'P' OR nivel = 'S');
ALTER TABLE funcionario ADD CONSTRAINT checkSuperior CHECK (funcao = 'LIMPEZA' AND superior_cpf IS NOT NULL OR (funcao = 'SUP_LIMPEZA' AND superior_cpf IS NULL));

INSERT INTO funcionario VALUES('12345678911', '1980-05-07', 'Pedro da Silva', 'SUP_LIMPEZA', 'S', null);
INSERT INTO funcionario VALUES('12345678912', '1980-03-08', 'Jose da Silva', 'LIMPEZA', 'J', '12345678911');

INSERT INTO funcionario VALUES('12345678912', '1980-04-09', 'joao da Silva', 'LIMPEZA', 'J', null); -- Testando insercao que nao deve funcionar

-- Question 9 -- 
INSERT INTO funcionario VALUES ('12345678913', '1972-04-15','Diego Ribeiro', 'SUP_LIMPEZA', 'P', null);
INSERT INTO funcionario VALUES ('12345678914', '1972-03-25','Brener Quevedo', 'LIMPEZA', 'J', '12345678913');
INSERT INTO funcionario VALUES ('12345678915', '1972-03-27','Paulo Mateus', 'SUP_LIMPEZA', 'S', null);
INSERT INTO funcionario VALUES ('12345678916', '1972-01-08','Iago Tito', 'LIMPEZA', 'P', '12345678915');
INSERT INTO funcionario VALUES ('12345678917', '1972-01-01','Thiago Dantas', 'LIMPEZA', 'J', '12345678916');
INSERT INTO funcionario VALUES ('12345678918', '1972-01-31','Raquel Rufino', 'LIMPEZA', 'P', '12345678917');
INSERT INTO funcionario VALUES ('12345678919', '1972-01-10','Alana Gabriele', 'SUP_LIMPEZA', 'S', null);
INSERT INTO funcionario VALUES ('12345678920', '1972-01-08','Matheus Henrique', 'SUP_LIMPEZA', 'P', null);
INSERT INTO funcionario VALUES ('12345678921', '1972-01-08','Marli Silva', 'LIMPEZA', 'S', '12345678920');
INSERT INTO funcionario VALUES ('12345678922', '1972-01-08','Julia Vitoria', 'SUP_LIMPEZA', 'P', null);

-- Question 10 -- 


