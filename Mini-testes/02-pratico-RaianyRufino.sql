CREATE TABLE Usuarios(
	id_usuario SERIAL PRIMARY KEY NOT NULL,
	nickname VARCHAR(20) NOT NULL,
	data_nasc DATE NOT NULL,
	id_perfil SERIAL REFERENCES Perfis_Usuarios(id_usuario) 
);

CREATE TABLE Musicas(
	id_musica SERIAL PRIMARY KEY NOT NULL, 
	titulo VARCHAR(20) NOT NULL,
	estilo CHAR(1) CHECK(estilo in('R', 'P', 'E', 'S', 'A', 'C')),
);

CREATE TABLE Avaliacoes(
	id_avaliacao SERIAL PRIMARY KEY NOT NULL,
	
	id_musica SERIAL REFERENCES Musicas(id_musica) ON DELETE RESTRICT,
	id_usuario SERIAL REFERENCES Usuarios(id_usuario),
	
	nota NUMERIC NOT NULL CHECK(nota >= 0 AND nota <=5), 
	data_avaliacao DATE NOT NULL,
	avaliacoes_usuarios TEXT
);

CREATE TABLE Perfis_Usuarios(
	id_usuario SERIAL REFERENCES Usuarios(id_usuario) NOT NULL ON DELETE CASCADE, 
	descr_perfil BOOLEAN NOT NULL,
	cadastra_usuarios BOOLEAN NOT NULL,
	cadastra_musicas BOOLEAN NOT NULL,
	faz_avaliacao BOOLEAN NOT NULL, 
);

-- Cadastre apenas 2 perfis
INSERT INTO Perfis_usuarios(id, descr_perfil, cadastra_usuario, cadastra_musica, faz_avaliacao) VALUES (1, 'admin', true, true, true);
INSERT INTO Perfis_usuarios(id, descr_perfil, cadastra_usuario, cadastra_musica, faz_avaliacao) VALUES (2, 'cliente', false, false, true);


