CREATE TABLE Farmacia(
	CNPJ CHAR(18) NOT NULL PRIMARY KEY, -- Formato: XXX.XXX.XXX/XXXX-XX
	categoria VARCHAR(10) CONSTRAINT validaCategoria CHECK(categoria = 'S' or categoria = 'F'), -- Uma farmacia pode ser sede ou filial
	
	nome VARCHAR(20),
	bairro VARCHAR(20),
	cidade VARCHAR(20),
	estado VARCHAR(20),
	
	-- Cada famarcia tem apenas um gerente que eh funcionario
	gerente VARCHAR(20) NOT NULL, 
	id_gerente CHAR(14) NOT NULL REFERENCES Funcionarios(id_funcionario) -- Formato: XXX.XXX.XXX-XX
);

CREATE TABLE Funcionarios(
	id_funcionario SERIAL PRIMARY KEY,
	cpf_funcionario CHAR(14) NOT NULL, -- Formato: XXX.XXX.	XXX-XX
	cargo CHAR(1) CONSTRAINT validaCargo CHECK(cargo in ('F', 'V', 'E', 'C', 'A'), -- Funcionarios podem ser farmaceuticos, vendedores, entregadores, caixas ou administradores
	farmacia VARCHAR(20) REFERENCES Farmacia(nome), -- Cada funcionario esta lotado em uma unica famarcia
	gerente BOOLEAN
);

-- Clientes podem ter mais de um endereco cadastrado
CREATE TABLE Enderecos(
	id_cliente SERIAL REFERENCES Clientes(id_cliente), 
	categoria CHAR(1) CONSTRAINT validaCategoria CHECK(categoria in('R','T','O'), -- Os enderecos do cliente podem ser residencia, trabalho ou 'outro'
	bairro VARCHAR(20),
	cidade VARCHAR(20),
	estado VARCHAR(20)
);

CREATE TABLE Medicamentos(
	id_medicamento SERIAL,
	caracteristica VARCHAR(20) CONSTRAINT validaCaracteristica CHECK(caracteristica in ('venda exclusiva com receita')) -- medicamentos podem ter uma caracteristica: venda exclusiva com receit
	nome_medicamento VARCHAR(20)
);

CREATE TABLE Vendas();

CREATE TABLE Entregas(
	id_cliente SERIAL REFERENCES Clientes(id_cliente), -- Entregas sao realizadas apenas para clientes cadastrados
	
);

CREATE TABLE Clientes(
	id_cliente SERIAL,
	endereco 
);

