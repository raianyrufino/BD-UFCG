-- Criando tabelas iniciais

CREATE TABLE FARMACIA(
	CNPJ CHAR(18) NOT NULL PRIMARY KEY, -- Formato: XXX.XXX.XXX/XXXX-XX
	categoria VARCHAR(10) NOT NULL,

	nome VARCHAR(20) NOT NULL,
	bairro VARCHAR(20) NOT NULL,
	cidade VARCHAR(20) NOT NULL,
	estado VARCHAR(20) NOT NULL
);

CREATE TABLE FUNCIONARIOS(
	id_funcionario SERIAL NOT NULL PRIMARY KEY,
	cpf_funcionario CHAR(14) NOT NULL, -- Formato: XXX.XXX.	XXX-XX
	cargo CHAR(1) NOT NULL,
	gerente BOOLEAN NOT NULL
);

CREATE TABLE MEDICAMENTOS(
	id_medicamento SERIAL NOT NULL
);

CREATE TABLE VENDAS(
	id_venda SERIAL NOT NULL,
	id_cliente SERIAL NOT NULL 
);

CREATE TABLE CLIENTES(
	id_cliente SERIAL NOT NULL
);

CREATE TABLE ENTREGAS(
	id_entrega SERIAL NOT NULL
);

-- Uma farmácia pode ser Sede ou Filial

ALTER TABLE FARMACIA ADD COLUMN categoria VARCHAR(10);
ALTER TABLE FARMACIA ADD CONSTRAINT validaCategoria CHECK(categoria in('S', 'F'));

-- Funcionarios podem ser farmaceuticos, vendedores, entregadores, caixas ou administradores

ALTER TABLE FUNCIONARIOS ADD CONSTRAINT validaCargo CHECK(cargo in('F', 'V', 'E', 'C', 'A'));

-- Cada funcionario está lotado em uma única farmácia

ALTER TABLE FUNCIONARIOS ADD COLUMN id_farmacia SERIAL; -- Um funcionário pode não estar lotado em nenhuma farmácia, logo não é NOT NULL
ALTER TABLE FUNCIONARIOS ADD CONSTRAINT validaFarmaciaUnica FOREIGN KEY(id_farmacia) REFERENCES FARMACIA(CNPJ);

-- Cada farmácia tem um(e apenas um) gerente(que é um funcionário)

ALTER TABLE FARMACIA ADD COLUMN id_gerente CHAR(14); -- Formato: XXX.XXX.XXX-XX
ALTER TABLE FARMACIA ALTER COLUMN id_gerente SET NOT NULL;
ALTER TABLE FARMACIA ADD CONSTRAINT validaGerenteUnico FOREIGN KEY(id_gerente) REFERENCES FUNCIONARIOS(id_funcionario);

-- Clientes podem ter mais de um endereço cadastrado

CREATE TABLE ENDERECOS(
	id_cliente SERIAL REFERENCES CLIENTES(id_cliente), 
	bairro VARCHAR(20),
	cidade VARCHAR(20),
	estado VARCHAR(20),
	categoria CHAR(1)
);

-- Os enderecos do cliente podem ser residencia, trabalho ou 'outro'
 
ALTER TABLE ENDERECOS ADD CONSTRAINT validaCategoria CHECK(categoria in('R','T','O'));

-- Medicamentos podem ter caracteristica de venda exclusiva com receita

ALTER TABLE MEDICAMENTOS ADD COLUMN caracteristica VARCHAR(20);
ALTER TABLE MEDICAMENTOS ADD CONSTRAINT validaCaracteristica CHECK(caracteristica in('venda exclusiva com receita'));

-- Entregas são realizadas apenas para clientes cadastrados ( com endereços válidos )

ALTER TABLE ENTREGAS ADD COLUMN id_cliente SERIAL;
ALTER TABLE ENTREGAS ADD CONSTRAINT validaCliente FOREIGN KEY(id_cliente) REFERENCES CLIENTES(id_cliente); 

-- Outras vendas podem ser realizadas para qualquer cliente ( cadastrado ou não )

ALTER TABLE VENDAS ADD COLUMN outrasVendas;
ALTER TABLE VENDAS ADD CONSTRAINT validaVendaUnica UNIQUE(id_venda);

-- Nao deve ser possivel remover funcionarios que estejam vinculados a alguma venda

ALTER TABLE VENDAS ADD COLUMN id_funcionario; 
ALTER TABLE VENDAS ADD CONSTRAINT validaFuncionarioVinculado FOREIGN KEY(id_funcionario) REFERENCES FUNCIONARIOS(id_funcionario);

-- Nao deve ser possivel remover um medicamento que esteja vinculado a alguma venda

ALTER TABLE VENDAS ADD COLUMN id_medicamento;
ALTER TABLE VENDAS ADD CONSTRAINT validaMedicamentoVinculado FOREIGN KEY(id_medicamento) REFERENCES MEDICAMENTOS(id_medicamento);

-- Clientes cadastrados devem ser maiores de 18 anos

-- Só pode haver uma farmácia por bairro

ALTER TABLE FAMARCIA ADD CONSTRAINT validaBairroUnico UNIQUE(bairro);

-- Há apenas uma Sede

ALTER TABLE FARMACIA ADD CONSTRAINT validaSede EXCLUDE USING gist (tipo WITH =) WHERE (tipo = 'S');

-- Gerentes podem ser administradores ou farmaceuticos

ALTER TABLE FUNCIONARIOS ADD COLUMN categoria_gerente VARCHAR(30);
ALTER TABLE FUNCIONARIOS ADD CONSTRAINT validaCategoriaGerente CHECK(categoria_gerente in('A', 'F');

-- Medicamentos com venda exclusiva com receita so devem ser vendidos a clientes cadastrados

ALTER TABLE MEDICAMENTOS ADD COLUMN id_cliente;
ALTER TABLE MEDICAMENTOS ADD CONSTRAINT validaClientesCadastrados FOREIGN KEY(id_cliente) REFERENCES CLIENTES(id_cliente);

-- Uma venda deve ser feito por um funcionário vendedor

ALTER TABLE VENDAS ADD CONSTRAINT validaFuncionarioVendedor CHECK(id_funcionario = 'V');

-- Crie uma coluna na tabela farmácia para representar o estado onde está localizada
-- e adicione um mecanismo para restringir os possíveis valores a serem inseridos nesta coluna:
-- um dos 9 estados do nordeste

CREATE TYPE mood AS ENUM ('AC', 'AP', 'AM', 'DF', 'ES', 'GO', 'MT', 'MS', 'MG', 'PA', 'PR', 'RS', 'RJ', 'RO', 'RR', 'SC', 'SP', 'TO');
ALTER TABLE FARMACIA ADD COLUMN estado mood;


