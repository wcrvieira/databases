-- Linguagem SQL padrão ANSI-92 ou SQL-92
-- Criação do banco de dados escola
CREATE DATABASE IF NOT EXISTS escola;

-- Definição do banco de dados padrão
USE escola;

-- Criação da tabela de alunos
CREATE TABLE IF NOT EXISTS alunos
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

-- Criação da tabela professores
CREATE TABLE IF NOT EXISTS professores
( matricula INT PRIMARY KEY AUTO_INCREMENT,
  cpf DECIMAL(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  celular VARCHAR(15) NOT NULL,
  email VARCHAR(25) NOT NULL
);

-- Criação da tabela cursos


-- Criação da tabela horários


-- Criação da tabela turmas
CREATE TABLE IF NOT EXISTS turmas
( codigo_turma INT(5) PRIMARY KEY,
  descricao TEXT(20) NOT NULL, 
  data_cadastro TIMESTAMP,  
  rm_aluno INT(6),
  id_curso INT(5),
  id_horario INT(3) NOT NULL,
  -- Chave estrangeira com a tabela alunos
  -- Chave estrangeira com a tabela cursos
  -- Chave estrangeira com a tabela horários
);






