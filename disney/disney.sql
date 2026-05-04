-- Linguagem SQL padrão ANSI-92 ou SQL-92
-- Criação do banco de dados Disney
CREATE DATABASE IF NOT EXISTS disney;

-- Definição do banco de dados padrão
USE disney;

-- Criação da tabela de pessoas
CREATE TABLE IF NOT EXISTS pessoas
-- Campo CPF do tipo decimal que comporta 11 caracteres
( cpf_pessoa DECIMAL(11) PRIMARY KEY, -- campo único, não se repete
  nome_pessoa VARCHAR(80) NOT NULL,
  sexo CHAR(1) NOT NULL,
  data_nascimento DATE NOT NULL,
  telefone VARCHAR(15),
  email VARCHAR(50),
  localidade VARCHAR(60),
  bairro VARCHAR(30),
  estado CHAR(2)
);

-- Criação da tabela atrações
CREATE TABLE IF NOT EXISTS atracoes
( codigo INT(6) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(40) NOT NULL,
  localizacao VARCHAR(20) NOT NULL,
  tempo_fila TIME
);

-- Criação da tabela fastfoods


-- Criação da tabela transportes


-- Criação da tabela passaportes (Chaves estrangeiras)
CREATE TABLE IF NOT EXISTS passaportes
( id_ingresso INT PRIMARY KEY AUTO_INCREMENT,
  data_hora_ingresso TIMESTAMP,
  valor_ingresso DECIMAL(8,2) NOT NULL,
  cpf_pessoa DECIMAL(11),
  cod_atracoes INT(6),
  -- Chave estrangeira conectando passaportes com pessoas
  -- Chave estrangeira conectando passaportes com atrações  
);





