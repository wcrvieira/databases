-- Linguagem SQL padrão ANSI-92 ou SQL-92
-- Exclui o banco de dados, se existir
DROP DATABASE IF EXISTS vendas;

-- Criação do banco de dados vendas
CREATE DATABASE IF NOT EXISTS vendas;

-- Definição do banco de dados padrão
USE vendas;

-- Criação da tabela de clientes
CREATE TABLE IF NOT EXISTS clientes
-- Campo CPF do tipo decimal que comporta 11 caracteres
( cpf_cliente DECIMAL(11) PRIMARY KEY, -- campo único, não se repete
  nome_cliente VARCHAR(80) NOT NULL,
  sexo CHAR(1) NOT NULL,
  data_nascimento DATE NOT NULL,
  telefone VARCHAR(20), 
  email VARCHAR(50),
  cidade VARCHAR(60),
  bairro VARCHAR(30),
  estado CHAR(2),
  pais VARCHAR(20)
);

-- Inserção dos registros da tabela de clientes
-- Gerado pelo site https://www.4devs.com.br/gerador_de_pessoas
INSERT INTO clientes VALUES
(76777009183, 'Malu Débora Aurora da Costa', 'F', '1965-03-17','(51) 99842-5526', 'malucosta@transveloz.com.br', 'Vila Canoas', 'São Luís', 'RS', 'Brasil'),
(80269082280, 'Jeferson Stênio Porto', 'M', '2005-04-19', '(21) 99685-6258', 'jeferson_porto@robertacorrea.com', 'Magé', 'Parque Maria Conga', 'RJ', 'Brasil'),
(05779690308, 'Manuel Carlos Jorge Fernandes', 'M', '1947-02-12', '(84) 99639-1291',  'manoel.fernandes@statusseguros.com.br', 'Natal', 'Jardim Felipe Camarão', 'RN', 'Brasil');

-- Criação da tabela categorias
CREATE TABLE IF NOT EXISTS categorias
( id_categoria INT(4) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(100) NOT NULL,
  grupo VARCHAR(30),
  data_cadastro TIMESTAMP
);

-- Inserção de registros na tabela de categorias
INSERT INTO categorias VALUES
(0, 'Beleza e cuidados pessoais', 'Higiene pessoal', CURRENT_TIMESTAMP),
(0, 'Eletrônicos', 'Eletroeletrônicos', CURRENT_TIMESTAMP),
(0, 'Moda e vestuário', 'Vestuário', CURRENT_TIMESTAMP);

-- Criação da tabela produtos
CREATE TABLE IF NOT EXISTS produtos
( codigo_produto INT(6) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(60) NOT NULL,
  unidade TEXT(10) NOT NULL,
  ncm DECIMAL(12),
  data_cadastro TIMESTAMP,
  validade DATE,
  lote VARCHAR(10),
  cod_categoria INT(4),
  FOREIGN KEY (cod_categoria) REFERENCES categorias (id_categoria)
);

-- Inserção dos registros da tabela de produtos
INSERT INTO produtos VALUES
(0, 'Shampoo clareador', 'unidade', 33051000, CURRENT_TIMESTAMP, '2027-12-31', 'L332532', 1),
(0, 'Console PlayStation 5', 'unidade', 95045000, CURRENT_TIMESTAMP, '2030-06-30', 'L954409', 2),
(0, 'Calça Jeans padrão', 'unidade', 62034200, CURRENT_TIMESTAMP, '2028-01-25', 'L620025', 3);

-- Criação da tabela pedidos (Chaves estrangeiras)
CREATE TABLE IF NOT EXISTS pedidos
( id_pedido INT(7) PRIMARY KEY AUTO_INCREMENT,
  data_hora_pedido TIMESTAMP,
  valor_pedido DECIMAL(10,2) NOT NULL,
  cliente_cpf DECIMAL(11),
  cod_produto INT(6),
  -- Chave estrangeira conectando pedidos com clientes
  FOREIGN KEY (cliente_cpf) REFERENCES clientes (cpf_cliente),
  -- Chave estrangeira conectando pedidos com produtos
  FOREIGN KEY (cod_produto) REFERENCES produtos (codigo_produto)
);

-- Criação da tabela notafiscal (Chaves estrangeiras)
CREATE TABLE IF NOT EXISTS notafiscal 
( num_nf INT(6) PRIMARY KEY AUTO_INCREMENT,
  data_hora_emissao TIMESTAMP,
  valor_nf DECIMAL(10,2) NOT NULL,
  cod_pedido INT(7),
  FOREIGN KEY (cod_pedido) REFERENCES pedidos (id_pedido)
);





