-- Linguagem SQL padrão ANSI-92 ou SQL-92

-- Exclusão do banco de dados, se existir
DROP DATABASE IF EXISTS disney;

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
  cidade VARCHAR(60),
  bairro VARCHAR(30),
  estado CHAR(2)
);

-- Inserção dos registros da tabela de pessoas
-- Gerado pelo site https://www.4devs.com.br/gerador_de_pessoas
INSERT INTO  pessoas VALUES
(92764049455, 'Vicente Edson Cavalcanti', 'M', '1967-01-23', '(91) 99180-4677', 'vicente_cavalcanti@copr.globo.com', 'Belém', 'Jardim Mangueirão', 'PA'),
(24509034539, 'Ana Esther Silveira', 'F', '1967-03-04', '(83) 98227-9024', 'ana.silveira81@alphagraphics.com.br', 'Capim', 'Centro', 'PB' ),
(73723703020, 'Paulo Tiago Theo Viana', 'M', '1976-05-10', '(51) 99351-2402', 'paulotiagoviana@sandvik.com', 'Porto Alegre', 'Medianeira', 'RS');

-- Criação da tabela atrações
CREATE TABLE IF NOT EXISTS atracoes
( codigo INT(6) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(40) NOT NULL,
  localizacao VARCHAR(30) NOT NULL,
  tempo_fila TIME
);

-- Inserção de registros na tabela atracoes
INSERT INTO atracoes VALUES
(0, 'Magic Kingdom Park', '1180 Seven Seas Drive', '00:30'),
(0, 'Universal Orlando Resort', '6000 Universal Boulevard', '00:40'),
(0, 'Walt Disney World Resort', '1180 Seven Seas Drive', '00:35');

-- Criação da tabela fastfoods
CREATE TABLE IF NOT EXISTS fastfoods
( cod_fastfood INT(3) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(60) NOT NULL,
  preco DECIMAL(8,2) NOT NULL,
  cod_atracao INT(6),
  FOREIGN KEY (cod_atracao) REFERENCES atracoes (codigo)
);

-- Inserindo registros na tabela de fasfoods
-- Preços em dólar convertido para reais - Dólar do dia R$ 5,01
INSERT INTO fastfoods VALUES
(0, 'Cheeseburger com Bacon + Batata Frita + Bebida', 111.22, 1),
(0, 'Sanduíche cubano de carne de porco, presunto e queijo', 86.57, 3),
(0, 'Carne e Frango Teryaki com Arroz e vegetais + Bebida', 90.08, 2);

-- Criação da tabela transportes
CREATE TABLE IF NOT EXISTS transportes
( cod_transporte INT(2) PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(25) NOT NULL,
  descricao VARCHAR(60) NOT NULL,
  interconexao VARCHAR(3),
  publico VARCHAR(40),
  data_vinculo TIMESTAMP
);

-- Inserção de registros na tabela transportes
INSERT INTO transportes VALUES
(0, 'Ônibus', 'Ligam todos os hotéis e parques',  'Sim', 'Visitantes e hóspedes', CURRENT_TIMESTAMP),
(0, 'Disney Skyliner', 'Sistema de gôndolas que conecta hotéis selecionados',  'Não', 'Visitantes', CURRENT_TIMESTAMP),
(0, 'Monorail - Monotrilho', 'Conecta o Magic Kingdom, EPCOT e hotéis da área',  'Sim', 'Visitantes e hóspedes', CURRENT_TIMESTAMP);

-- Criação da tabela passaportes (Chaves estrangeiras)
CREATE TABLE IF NOT EXISTS passaportes
( id_ingresso INT PRIMARY KEY AUTO_INCREMENT,
  data_hora_ingresso TIMESTAMP,
  valor_ingresso DECIMAL(8,2) NOT NULL,
  cpf_pessoa DECIMAL(11),
  cod_atracoes INT(6),
  id_transporte INT(2),
  -- Chave estrangeira conectando passaportes com pessoas
  FOREIGN KEY (cpf_pessoa) REFERENCES pessoas (cpf_pessoa),
  -- Chave estrangeira conectando passaportes com atrações  
  FOREIGN KEY (cod_atracoes) REFERENCES atracoes (codigo),
  -- Chave estrangeira conectando passaportes com atrações  
  FOREIGN KEY (id_transporte) REFERENCES transportes (cod_transporte)
);

-- Inserindo registros na tabela de passaportes com chaves estrangeiras
-- Passaporte com valores em dólar convertido para reais - Dólar do dia R$ 5,01
INSERT INTO passaportes VALUES
(0, CURRENT_TIMESTAMP, 596.19, 92764049455, 1, 2),
(0, CURRENT_TIMESTAMP, 1177.53, 24509034539, 3, 3),
(0, CURRENT_TIMESTAMP, 1999.39, 73723703020, 2, 1);




