-- Linguagem SQL padrão ANSI-92 ou SQL-92
-- Criação do banco de dados Disney
CREATE IF NOT EXISTS DATABASE disney;

-- Definição do banco de dados padrão
USE disney;

-- Criação da tabela de pessoas
CREATE IF NOT EXISTS TABLE pessoas
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







