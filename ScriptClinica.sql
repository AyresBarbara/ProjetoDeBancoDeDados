CREATE DATABASE clinica3nb_db;

USE clinica3nb_db;

CREATE TABLE paciente_tb(
id_paciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome_paciente VARCHAR(100) NOT NULL,
cpf_paciente VARCHAR(100) NOT NULL,
telefone_paciente VARCHAR(100) NOT NULL,
endereco_paciente VARCHAR(100),
convenio_paciente VARCHAR(100) -- Futuramente, criar outra tabela
);
CREATE TABLE especialidade_tb(
cod_especialidade INT NOT NULL PRIMARY KEY auto_increment,
nome_especialidade VARCHAR(255) not null
);

CREATE TABLE laboratorio_tb(
id_laboratorio INT NOT NULL PRIMARY KEY auto_increment,
nome_laboratorio VARCHAR(100) not null
);

CREATE TABLE medico_tb(
id_medico INT NOT NULL PRIMARY KEY auto_increment,
nome_medico VARCHAR(100) not null,
cpf_medico VARCHAR(100) NOT NULL,
crm_medico VARCHAR(100) NOT NULL
);

CREATE TABLE horario_tb(
id_medico INT NOT NULL,
dia_horario char(2) NOT NULL,
hora_horario char(4) NOT NULL,
primary key(id_medico, dia_horario, hora_horario),
foreign key(id_medico) references medico_tb(id_medico)
);

CREATE TABLE agendamento_tb(
id_agendamento INT NOT NULL PRIMARY KEY auto_increment,
data_agendamento DATE NOT NULL,
hora_agendamento TIME NOT NULL,
id_medico INT NOT NULL,
id_paciente INT NOT NULL,
FOREIGN KEY (id_medico) references medico_tb(id_medico),
FOREIGN KEY (id_paciente) references paciente_tb(id_paciente)
);

CREATE TABLE atendimento_tb(
id_atendimento INT NOT NULL PRIMARY KEY auto_increment,
anamnese_atendimento LONGTEXT NOT NULL,
id_agendamento INT NOT NULL,
retorno_atendimento INT NOT NULL,
FOREIGN KEY(id_agendamento) references agendamento_tb(id_agendamento),
FOREIGN KEY(retorno_atendimento) references atendimento_tb(id_atendimento)
);
CREATE TABLE exame_tb(
id_exame INT NOT NULL PRIMARY KEY auto_increment,
nome_exame VARCHAR(100) NOT NULL,
tipo_exame VARCHAR(100) NOT NULL,
id_laboratorio INT NOT NULL,
id_atendimento INT NOT NULL,
FOREIGN KEY(id_laboratorio) references laboratorio_tb(id_laboratorio),
FOREIGN KEY(id_atendimento) references atendimento_tb(id_atendimento)
);

INSERT INTO paciente_tb(nome_paciente, cpf_paciente, telefone_paciente, endereco_paciente, convenio_paciente) VALUES
('João Silva','41254789645','81785234561','Rua Lua, 15','HapVider'),
('Maria José','78541236598','81654782034','Rua do Barro, 296','Unimedly'),
('José Dias','98410354789','81321457895','Rua Piqui, 74','Acem'),
('Ana Santos', '74125478965','81452014789', 'Rua Esperança, 13', 'Bradescow');

INSERT INTO especialidade_tb(nome_especialidade) VALUES
('Clínico Geral'),
('Pediatria'),
('Ginecologia'); 

INSERT INTO laboratorio_tb( nome_laboratorio) VALUES
('Gilson Cerbim'),
('Agamenon Magalhães'),
('Celpe'),
('Parque Amorim');

INSERT INTO medico_tb(nome_medico, cpf_medico, crm_medico) VALUES
('José Henrique Albuquerque', '79425813647', '9874561'),
('Saulo Feitosa', '14578963201', '5472157'),
('Daniel Paulo', '65487123045', '0145789'),
('Giovana Cruz','4120457896', '154789');

INSERT INTO horario_tb(id_medico, dia_horario, hora_horario) VALUES
(1, '02', '0830'),
(2, '02', '0830'),
(3, '03', '1040'),
(4, '03', '1100'),
(1, '02', '0930'),
(2, '02', '0830'),
(3, '03', '1315'),
(4, '03', '1300');

