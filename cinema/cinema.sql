-- Linguagem SQL padrão ANSI-92 ou SQL-92

-- Exclusão do banco de dados, se existir
DROP DATABASE IF EXISTS cinema;

-- Criação do banco de dados cinema
CREATE DATABASE IF NOT EXISTS cinema;

-- Definição do banco de dados padrão
USE cinema;

-- Criação da tabela de clientes
CREATE TABLE IF NOT EXISTS clientes
-- Campo CPF do tipo decimal que comporta 11 caracteres
( cpf_cliente DECIMAL(11) PRIMARY KEY, -- campo único, não se repete
  nome_cliente VARCHAR(80) NOT NULL,
  sexo CHAR(1) NOT NULL,
  data_nascimento DATE NOT NULL,
  telefone VARCHAR(15),
  email VARCHAR(50) NOT NULL,
  endereco VARCHAR(80),
  bairro VARCHAR(30),
  cidade VARCHAR(60),  
  estado CHAR(2)
);

-- Inserção de registros na tabela de clientes
INSERT INTO clientes VALUES
(53144243124, 'Leandro Benedito da Cruz', 'M', '1973-04-23', '(31) 98452-2893', 'leandro.cruz@hottmail.com', 'Rua Beco Esperança, 152', 'Vila Renascer', 'Contagem', 'MG'),
(70647543800, 'Rayssa Elisa da Cunha', 'F', '1998-04-22', '(86) 98417-7026', 'rayssacunha@tecsys.com.br', 'Quadra 27, 714', 'Jardim São Vicente', 'Parnaíba', 'PI'),
(09964328842, 'Rafaela Raquel Viana', 'F', '2002-03-02', '(83) 98698-7849', 'rafaela_viana02@sandvik.com', 'Rua Vitório Souza, 875', 'Res. Mangabeira', 'João Pessoa', 'PB');

-- Criação da tabela categorias
CREATE TABLE IF NOT EXISTS categorias
( id_categoria INT(6) PRIMARY KEY AUTO_INCREMENT,
  nome_categoria VARCHAR(40) NOT NULL,
  descricao VARCHAR(100),
  data_cadastro TIMESTAMP -- traz a data e hora do servidor
);

-- Inserção de registros na tabela de categorias
INSERT INTO categorias VALUES
(0, 'Aventura e ação', 'Focada em jornadas, perseguições e lutas', CURRENT_TIMESTAMP),
(0, 'Ficção científica', 'Histórias baseadas em ciência especulativa', CURRENT_TIMESTAMP),
(0, 'Terror e suspense', 'Criado para provocar medo, mistério e choque', CURRENT_TIMESTAMP);

-- Criação da tabela filmes
CREATE TABLE IF NOT EXISTS filmes
( codigo INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(30) NOT NULL,
  sinopse VARCHAR(150),
  elenco VARCHAR(70),
  data_lancamento DATE,
  id_filme INT(6),
  -- Chave estrangeira conectando o filme com a categoria
  FOREIGN KEY (id_filme) REFERENCES categorias (id_categoria)
);

-- Inserção de registros na tabela de filmes
INSERT INTO filmes VALUES
(0, 'O justiceiro: uma última morte', 'Enquanto Frank Castle busca um significado além da vingança, uma força inesperada o arrasta de volta para a luta.','Jon Berthal, Deborah Ann Woll, Jason R. Moore', '2026-05-12', 1),
(0, 'Mortal Kombat 2', 'Os campeões são colocados uns contra os outros numa sangrenta e derradeira batalha, sem regras ou limites.', 'Karl Urban, Adeline Rudolph, Jessica McNamee', '2026-05-07', 1),
(0, 'Faces da Morte', 'Uma moderadora de uma plataforma de compartilhamento de vídeos na internet se depara com uma possível rede de filmes snuff.', 'Barbie Ferreira, Dacre Montgomery, Josie Totah', '2026-04-10', 3);

-- Criação da tabela salas
CREATE TABLE IF NOT EXISTS salas
( num_sala INT(4) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(40),
  lotacao CHAR(3) NOT NULL
);

-- Criação da tabela ingresso
CREATE TABLE IF NOT EXISTS ingressos
( id_ingresso INT(7) PRIMARY KEY AUTO_INCREMENT,
  data_hora_ingresso TIMESTAMP,
  preco_ingresso DECIMAL(8,2) NOT NULL,
  cpf_cliente_fk DECIMAL(11),
  cod_filme INT,
  -- Chave estrangeira conectando ingressos a clientes
  FOREIGN KEY (cpf_cliente_fk) REFERENCES clientes (cpf_cliente),  
  -- Chave estrangeira conectando ingressos a filmes
  FOREIGN KEY (cod_filme) REFERENCES filmes (codigo)
);






