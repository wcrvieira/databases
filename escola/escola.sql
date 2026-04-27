-- Linguagem SQL padrão ANSI-92 ou SQL-92
-- Criação do banco de dados escola
CREATE IF NOT EXISTS DATABASE escola;

-- Definição do banco de dados padrão
USE escola;

-- Criação da tabela de alunos
CREATE IF NOT EXISTS TABLE alunos
-- Campo CPF do tipo decimal que comporta 11 caracteres
( 
  rm INT(6) PRIMARY KEY, -- campo único, não se repete
  nome_pessoa VARCHAR(80) NOT NULL,
  cpf_pessoa DECIMAL(11) NOT NULL,
  sexo CHAR(1) NOT NULL,
  data_nascimento DATE NOT NULL,
  telefone VARCHAR(15),
  email VARCHAR(50),
  localidade VARCHAR(60),
  bairro VARCHAR(30),
  estado CHAR(2)
);







