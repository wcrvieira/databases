-- Linguagem SQL padrão ANSI-92 ou SQL-92
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
  telefone VARCHAR(15),
  email VARCHAR(50),
  localidade VARCHAR(60),
  bairro VARCHAR(30),
  estado CHAR(2)
);

-- Criação da tabela produtos
CREATE TABLE IF NOT EXISTS produtos
( codigo_produto INT(6) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(60) NOT NULL,
  unidade TEXT(10) NOT NULL,
  ncm DECIMAL(12)
);

-- Criação da tabela categorias


-- Criação da tabela pedidos (Chaves estrangeiras)
CREATE TABLE IF NOT EXISTS pedidos
( id_pedido INT(7) PRIMARY KEY AUTO_INCREMENT,
  data_hora_pedido TIMESTAMP,
  valor_pedido DECIMAL(10,2) NOT NULL,
  cliente_cpf DECIMAL(11),
  cod_produto INT(6),
  -- Chave estrangeira conectando pedidos com clientes
  -- Chave estrangeira conectando pedidos com produtos
);

-- Criação da tabela notafiscal (Chaves estrangeiras)






