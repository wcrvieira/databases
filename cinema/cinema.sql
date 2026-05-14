-- Linguagem SQL padrão ANSI-92 ou SQL-92
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

-- Criação da tabela categorias
CREATE TABLE IF NOT EXISTS categorias
( id_categoria INT(6) PRIMARY KEY AUTO_INCREMENT,
  nome_categoria VARCHAR(40) NOT NULL,
  descricao VARCHAR(100),
  data_cadastro TIMESTAMP -- traz a data e hora do servidor
);

-- Criação da tabela filmes
CREATE TABLE IF NOT EXISTS filmes
( codigo INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(30) NOT NULL,
  sinopse VARCHAR(50),
  elenco VARCHAR(100),
  data_lancamento DATE,
  id_filme INT(6),
  -- Chave estrangeira conectando o filme com a categoria
  FOREIGN KEY (id_filme) REFERENCES categorias (id_categoria)
);

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






