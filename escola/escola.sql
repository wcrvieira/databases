-- Linguagem SQL padrão ANSI-92 ou SQL-92

-- Exclusão do banco de dados, se existir
DROP DATABASE IF EXISTS escola;

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
  cidade VARCHAR(60),
  bairro VARCHAR(30),
  estado CHAR(2)
);

-- Inserção dos registros da tabela de alunos
-- Gerado pelo site https://www.4devs.com.br/gerador_de_pessoas
INSERT INTO alunos VALUES
(26005, 'Nelson Cauã Mateus Assis', 66922492285, 'M', '2003-03-06', '(83) 98626-0699', 'nelsonassis@hotmmail.com', 'João Pessoa', 'Jardim Funcionários', 'PB'),
(26101, 'Fátima Giovana Alves', 44355321150, 'F', '1999-04-11', '(96) 98990-4343', 'fatima.alves@umbernardo.com.br', 'Macapá', 'Res. Nova Esperança', 'AP'),
(26255, 'Otávio Yago de Paula', 85430391506, 'M', '2000-01-13', '(61) 99311-3613', 'otavio_depaula@abbott.com', 'Luziânia', 'Parque Estrela Dalva', 'GO');

-- Criação da tabela professores
CREATE TABLE IF NOT EXISTS professores
( matricula INT PRIMARY KEY AUTO_INCREMENT,
  cpf DECIMAL(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  celular VARCHAR(16) NOT NULL,
  email VARCHAR(40) NOT NULL,
  formacao VARCHAR(20)
);

-- Inserção de registros de professores
INSERT INTO professores VALUES
(0, 22700586310, 'Bruna Luíza Cavalcanti', '(11) 99687-7865', 'bruna_cavalcanti@band.com.br', 'Engenharia Civil'),
(0, 55554269176, 'Elza Camila Nair Ferreira', '(14) 99604-2654', 'elza.ferreira@tglaw.com.br', 'Pedagogia'),
(0, 23165647801, 'Levi Gustavo de Paula', '(83) 99118-6558', 'levigustavo@pib.com.br', 'Matemática');

-- Criação da tabela cursos
CREATE TABLE IF NOT EXISTS cursos
( id_curso INT(5) PRIMARY KEY AUTO_INCREMENT,
  nome_curso VARCHAR(40) NOT NULL,
  area VARCHAR(20) NOT NULL,
  duracao TEXT(12) NOT NULL,
  data_cadastro TIMESTAMP
);

-- Inserção de registros na tabela de cursos
INSERT INTO cursos VALUES
(0, 'Técnico em Informática', 'Tecnologia', '3 semestres', CURRENT_TIMESTAMP),
(0, 'Técnico em Farmácia', 'Ambiente e saúde', '3 semestres', CURRENT_TIMESTAMP),
(0, 'Técnico em Mecânica', 'Indústria', '3 semestres', CURRENT_TIMESTAMP);

-- Criação da tabela horários
CREATE TABLE IF NOT EXISTS horarios
( cod_horario INT(3) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(10) NOT NULL,
  data_cadastro TIMESTAMP
);

-- Inserção de registros na tabela de horários
INSERT INTO horarios VALUES
(0, 'Manhã', CURRENT_TIMESTAMP),
(0, 'Tarde', CURRENT_TIMESTAMP),
(0, 'Noite', CURRENT_TIMESTAMP);

-- Criação da tabela turmas
CREATE TABLE IF NOT EXISTS turmas
( codigo_turma INT(5) PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(30) NOT NULL, 
  data_cadastro TIMESTAMP,  
  rm_aluno INT(6),
  id_curso INT(5),
  id_horario INT(3),
  cod_professor INT,
  -- Chave estrangeira com a tabela alunos
  FOREIGN KEY (rm_aluno) REFERENCES alunos (rm),
  -- Chave estrangeira com a tabela cursos
  FOREIGN KEY (id_curso) REFERENCES cursos (id_curso),
  -- Chave estrangeira com a tabela horários
  FOREIGN KEY (id_horario) REFERENCES horarios (cod_horario),
  -- Chave estrangeira com a tabela professores
  FOREIGN KEY (cod_professor) REFERENCES professores (matricula)
);

-- Inserção de resgistros na tabela turmas
INSERT INTO turmas VALUES
(0, 'Turma padrão com 40 alunos', CURRENT_TIMESTAMP, 26005, 3, 3, 1),
(0, 'Turma extra com 35 alunos', CURRENT_TIMESTAMP, 26255, 1, 2, 3),
(0, 'Turma extra com 25 alunos', CURRENT_TIMESTAMP, 26101, 2, 1, 2);




