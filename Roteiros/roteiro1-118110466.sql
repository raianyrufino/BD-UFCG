-- Criando tabelas
CREATE TABLE AUTOMOVEL (     
	numero_do_chassi CHAR(17),
	marca VARCHAR(12),
	documento_do_carro
	ano INTEGER
);

CREATE TABLE SEGURADO (     
	cpf VARCHAR(14), -- Formato: xxx.xxx.xxx-xx
	nome VARCHAR(20)
	telefone
	chassi
	
	
);

CREATE TABLE PERITO (
	id CHAR(16),    -- cpf
	nome VARCHAR(20)
	tel
);

CREATE TABLE OFICINA (     
	cnpj VARCHAR(18), -- Formato: xx.xxx.xxx/xxxx-xx
	nome VARCHAR(20)
	chassi
	endereço
	
);
 
CREATE TABLE SEGURO (     
	id CHAR(16),
	custo NUMERIC,
	contrato TEXT
	dono cpf
);

CREATE TABLE SINISTRO ( 
	id_sinistro SERIAL, 
	ocorrencia DATE,
	lugar TEXT, 
	descricao TEXT	
	chassi
);

CREATE TABLE PERICIA (
	nome perito
	cpf perito
	id sinistro
	id_pericia SERIAL, 
	horario TIMESTAMP,
	reportagem TEXT, 
	veracidade BOOLEAN
);

CREATE TABLE REPARO ( 
	cnpj da oficina
	chassi 
	id_reparo SERIAL, 
	numero_do_chassi CHAR(17),
	custo NUMERIC
	
);

-- Definindo as chaves primárias das tabelas
ALTER TABLE AUTOMOVEL ADD CONSTRAINT automovel_pk PRIMARY KEY (numero_do_chassi);

ALTER TABLE SEGURADO ADD CONSTRAINT segurado_pk PRIMARY KEY (cpf);

ALTER TABLE PERITO ADD CONSTRAINT perito_pk PRIMARY KEY (id);

ALTER TABLE OFICINA ADD CONSTRAINT oficina_pk PRIMARY KEY(cnpj);     
 
ALTER TABLE SEGURO ADD CONSTRAINT seguro_pk PRIMARY KEY(id);

ALTER TABLE SINISTRO ADD CONSTRAINT sinistro_pk PRIMARY KEY (id_sinistro);

ALTER TABLE PERICIA ADD CONSTRAINT pericia_pk PRIMARY KEY (id_pericia);

ALTER TABLE REPARO ADD CONSTRAINT reparo_pk PRIMARY KEY(id_reparo);     

-- Definindo as chaves secundárias das tabelas
ALTER TABLE REPARO ADD CONSTRAINT FOREIGN KEY(numero_do_chassi);     

-- Definindo atributos NOT NULL
ALTER TABLE AUTOMOVEL ALTER COLUMN numero_do_chassi SET NOT NULL;


-- Alterações a serem feitas abaixo!!!
ALTER TABLE SEGURADO SET NOT NULL (     
	cpf VARCHAR(14) PRIMARY KEY NOT NULL -- Formato: xxx.xxx.xxx-xx
	nome VARCHAR(20) NOT NULL,
);

ALTER TABLE PERITO (
	id CHAR(16) PRIMARY KEY NOT NULL,    
	nome VARCHAR(20) NOT NULL
);

ALTER TABLE OFICINA (     
	cnpj VARCHAR(18) PRIMARY KEY NOT NULL, -- Formato: xx.xxx.xxx/xxxx-xx	
	nome VARCHAR(20) NOT NULL
);
 
ALTER TABLE SEGURO (     
	id CHAR(16) PRIMARY KEY NOT NULL,
	contrato TEXT NOT NULL
);

ALTER TABLE SINISTRO ( 
	id_sinistro SERIAL PRIMARY KEY NOT NULL,
	descricao TEXT NOT NULL 	
);

ALTER TABLE PERICIA (
	id_pericia SERIAL PRIMARY KEY NOT NULL,
	reportagem TEXT NOT NULL, 
);

ALTER TABLE REPARO (     
	id_reparo SERIAL PRIMARY KEY NOT NULL,
	numero_do_chassi CHAR(17) FOREIGN KEY NOT NULL 
);

-- Removendo as tabelas criadas
DROP TABLE AUTOMOVEL()
DROP TABLE SEGURADO()
DROP TABLE PERITO()
DROP TABLE OFICINA()
DROP TABLE SEGURO()
DROP TABLE SEGURO()
DROP TABLE SINISTRO()
DROP TABLE PERICIA()
DROP TABLE REPARO()

-- Criando tabelas de forma a incorporar todas as definições
CREATE TABLE AUTOMOVEL (     
	numero_do_chassi CHAR(17) PRIMARY KEY NOT NULL,
	marca VARCHAR(12),
	ano INTEGER
);

CREATE TABLE SEGURADO (     
	cpf VARCHAR(14) PRIMARY KEY NOT NULL, -- Formato: xxx.xxx.xxx-xx
	nome VARCHAR(20) NOT NULL
	
);

CREATE TABLE PERITO (
	id CHAR(16) PRIMARY KEY NOT NULL,     
	nome VARCHAR(20) NOT NULL
	
);

CREATE TABLE OFICINA (     
	cnpj VARCHAR(18) PRIMARY KEY NOT NULL, -- Formato: xx.xxx.xxx/xxxx-xx
	nome VARCHAR(20) NOT NULL
	
);
 
CREATE TABLE SEGURO (     
	id CHAR(16) PRIMARY KEY NOT NULL,
	custo NUMERIC,
	contrato TEXT NOT NULL
);

CREATE TABLE SINISTRO ( 
	id_sinistro SERIAL PRIMARY KEY NOT NULL, 
	ocorrencia DATE,
	lugar TEXT, 
	descricao TEXT NOT NULL	
);

CREATE TABLE PERICIA (
	id_pericia SERIAL PRIMARY KEY NOT NULL, 
	horario TIMESTAMP,
	reportagem TEXT NOT NULL, 
	veracidade BOOLEAN
);

CREATE TABLE REPARO (     
	id_reparo SERIAL PRIMARY KEY NOT NULL, 
	numero_do_chassi CHAR(17) FOREIGN KEY NOT NULL,
	custo NUMERIC
	
);

-- Removendo as tabelas criadas de forma que observe a ordem correta de remoção
DROP TABLE REPARO()
DROP TABLE SINISTRO()
DROP TABLE PERICIA()
DROP TABLE SEGURADO()
DROP TABLE PERITO()
DROP TABLE OFICINA()
DROP TABLE SEGURO()
DROP TABLE AUTOMOVEL()





