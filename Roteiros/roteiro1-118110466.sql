-- Criando tabelas
CREATE TABLE AUTOMOVEL (     
	numero_do_chassi CHAR(17),
	modelo VARCHAR(12),
	documento_do_carro CHAR(9),
	ano INTEGER
);

CREATE TABLE SEGURADO (     
	cpf_segurado VARCHAR(14), --Formato: xxx.xxx.xxx-xx
	nome_segurado VARCHAR(20),
	telefone_segurado VARCHAR(12), --Formato: +xxxxxxxxxxx
	numero_do_chassi CHAR(17)
);

CREATE TABLE PERITO (
	cpf_perito CHAR(14), --Formato: xxx.xxx.xxx-xx
	nome_perito VARCHAR(20),
	telefone_perito VARCHAR(12)
);

CREATE TABLE OFICINA (     
	cnpj_oficina VARCHAR(18), --Formato: xx.xxx.xxx/xxxx-xx
	nome_oficina VARCHAR(20),
	endereco_oficina VARCHAR(20), --Formato: nome-da-rua, numero
	numero_do_chassi CHAR(17)
	
);
 
CREATE TABLE SEGURO (     
	id_seguro SERIAL,
	custo_seguro NUMERIC,
	contrato TEXT,
	cpf_segurado VARCHAR(14)
);

CREATE TABLE SINISTRO ( 
	id_sinistro SERIAL, 
	data_ocorrida DATE,
	lugar_ocorrido TEXT, 
	descricao TEXT,
	numero_do_chassi CHAR(17)
);

CREATE TABLE PERICIA (
	id_pericia SERIAL,
	cpf_perito CHAR(14),
	id_sinistro SERIAL
	horario TIMESTAMP,
	reportagem TEXT, 
	veracidade BOOLEAN
);

CREATE TABLE REPARO ( 
	id_reparo SERIAL,
	cnpj_oficina VARCHAR(18),
	numero_do_chassi CHAR(17),
	custo_reparo NUMERIC
);

-- Definindo as chaves primárias das tabelas
ALTER TABLE AUTOMOVEL ADD CONSTRAINT automovel_pk PRIMARY KEY (numero_do_chassi);
ALTER TABLE SEGURADO ADD CONSTRAINT segurado_pk PRIMARY KEY (cpf_segurado);
ALTER TABLE PERITO ADD CONSTRAINT perito_pk PRIMARY KEY (cpf_perito);
ALTER TABLE OFICINA ADD CONSTRAINT oficina_pk PRIMARY KEY(cnpj_oficina);     
ALTER TABLE SEGURO ADD CONSTRAINT seguro_pk PRIMARY KEY(id_seguro);
ALTER TABLE SINISTRO ADD CONSTRAINT sinistro_pk PRIMARY KEY (id_sinistro);
ALTER TABLE PERICIA ADD CONSTRAINT pericia_pk PRIMARY KEY (id_pericia);
ALTER TABLE REPARO ADD CONSTRAINT reparo_pk PRIMARY KEY(id_reparo);     

-- Definindo as chaves secundárias das tabelas
ALTER TABLE SEGURADO ADD CONSTRAINT FOREIGN KEY(numero_do_chassi);
ALTER TABLE OFICINA ADD CONSTRAINT FOREIGN KEY(numero_do_chassi);  
ALTER TABLE SEGURO ADD CONSTRAINT FOREIGN KEY(cpf_segurado);
ALTER TABLE SEGURO ADD CONSTRAINT FOREIGN KEY(numero_do_chassi);
ALTER TABLE SINISTRO ADD CONSTRAINT FOREIGN KEY(numero_do_chassi);  
ALTER TABLE PERICIA ADD CONSTRAINT FOREIGN KEY(cpf_perito);
ALTER TABLE PERICIA ADD CONSTRAINT FOREIGN KEY(id_sinistro);   
ALTER TABLE REPARO ADD CONSTRAINT FOREIGN KEY(cnpj_oficina); 
ALTER TABLE REPARO ADD CONSTRAINT FOREIGN KEY(numero_do_chassi); 

-- Definindo atributos NOT NULL
ALTER TABLE AUTOMOVEL ALTER COLUMN numero_do_chassi SET NOT NULL;
ALTER TABLE AUTOMOVEL ALTER COLUMN documento_do_carro SET NOT NULL;
ALTER TABLE SEGURADO ALTER COLUMN cpf_segurado SET NOT NULL;
ALTER TABLE SEGURADO ALTER COLUMN nome_segurado SET NOT NULL;
ALTER TABLE SEGURADO ALTER COLUMN numero_do_chassi SET NOT NULL;
ALTER TABLE PERITO ALTER COLUMN cpf_perito SET NOT NULL;
ALTER TABLE PERITO ALTER COLUMN nome_perito SET NOT NULL;
ALTER TABLE OFICINA ALTER COLUMN cnpj_oficina SET NOT NULL;
ALTER TABLE OFICINA ALTER COLUMN nome_oficina SET NOT NULL;
ALTER TABLE OFICINA ALTER COLUMN numero_do_chassi SET NOT NULL;
ALTER TABLE SEGURO ALTER COLUMN id_seguro SET NOT NULL;
ALTER TABLE SEGURO ALTER COLUMN contrato SET NOT NULL;
ALTER TABLE SEGURO ALTER COLUMN cpf_segurado SET NOT NULL;
ALTER TABLE SEGURO ALTER COLUMN numero_do_chassi SET NOT NULL;
ALTER TABLE SINISTRO ALTER COLUMN id_sinistro SET NOT NULL;
ALTER TABLE SINISTRO ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE SINISTRO ALTER COLUMN numero_do_chassi SET NOT NULL;
ALTER TABLE PERICIA ALTER COLUMN id_pericia SET NOT NULL;
ALTER TABLE PERICIA ALTER COLUMN cpf_perito SET NOT NULL;
ALTER TABLE PERICIA ALTER COLUMN id_sinistro SET NOT NULL;
ALTER TABLE PERICIA ALTER COLUMN reportagem SET NOT NULL;
ALTER TABLE PERICIA ALTER COLUMN veracidade SET NOT NULL;

-- Removendo as tabelas criadas na ordem original
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
	modelo VARCHAR(12),
	documento_do_carro CHAR(9) NOT NULL,
	ano INTEGER
);

CREATE TABLE SEGURADO (     
	cpf_segurado VARCHAR(14) PRIMARY KEY NOT NULL, --Formato: xxx.xxx.xxx-xx
	nome_segurado VARCHAR(20) NOT NULL,
	telefone_segurado VARCHAR(12), --Formato: +xxxxxxxxxxx
	numero_do_chassi CHAR(17) FOREIGN KEY NOT NULL
);

CREATE TABLE PERITO (
	cpf_perito CHAR(14)PRIMARY KEY NOT NULL, --Formato: xxx.xxx.xxx-xx
	nome_perito VARCHAR(20) NOT NULL,
	telefone_perito VARCHAR(12)
);

CREATE TABLE OFICINA (     
	cnpj_oficina VARCHAR(18) PRIMARY KEY NOT NULL, --Formato: xx.xxx.xxx/xxxx-xx
	nome_oficina VARCHAR(20) NOT NULL,
	endereco_oficina VARCHAR(20), --Formato: nome-da-rua, numero
	numero_do_chassi CHAR(17) FOREIGN KEY NOT NULL
	
);
 
CREATE TABLE SEGURO (     
	id_seguro SERIAL PRIMARY KEY NOT NULL,
	custo_seguro NUMERIC,
	contrato TEXT FOREIGN NOT NULL,
	cpf_segurado VARCHAR FOREIGN NOT NULL(14)
);

CREATE TABLE SINISTRO ( 
	id_sinistro SERIAL PRIMARY KEY NOT NULL, 
	data_ocorrida DATE,
	lugar_ocorrido TEXT, 
	descricao TEXT NOT NULL,
	numero_do_chassi CHAR FOREIGN NOT NULL(17)
);

CREATE TABLE PERICIA (
	id_pericia SERIAL PRIMARY KEY NOT NULL,
	cpf_perito CHAR(14) NOT NULL,
	id_sinistro SERIAL FOREIGN NOT NULL, 
	horario TIMESTAMP,
	reportagem TEXT NOT NULL, 
	veracidade BOOLEAN NOT NULL
);

CREATE TABLE REPARO ( 
	id_reparo SERIAL PRIMARY KEY NOT NULL,
	cnpj_oficina VARCHAR(18) NOT NULL,
	numero_do_chassi CHAR(17) FOREIGN NOT NULL,
	custo_reparo NUMERIC
);

-- Removendo as tabelas criadas de forma que observe a ordem correta de remoção
DROP TABLE REPARO()
DROP TABLE PERICIA()
DROP TABLE SINISTRO()
DROP TABLE SEGURO()
DROP TABLE SEGURADO()
DROP TABLE PERITO()
DROP TABLE OFICINA()
DROP TABLE AUTOMOVEL()





