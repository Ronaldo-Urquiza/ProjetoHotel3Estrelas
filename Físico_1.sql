/* Lógico_1: */

CREATE TABLE Hospede (
    ID_hospede int PRIMARY KEY,
    nome_hospede VARCHAR,
    cpf_hospede VARCHAR,
    fk_email_hospede_email_hospede_PK VARCHAR,
    fk_telefone_hospede_telefone_hospede_PK VARCHAR,
    CEP_endereco VARCHAR,
    numero_endereco INT,
    rua_endereco VARCHAR,
    cidade_endereco VARCHAR,
    pais_endereco VARCHAR,
    estado_endereco VARCHAR
);

CREATE TABLE Reserva (
    check_in_reserva TIMESTAMP,
    check_out_reserva TIMESTAMP,
    status_reserva VARCHAR,
    ID_reserva int PRIMARY KEY,
    fk_Hospede_ID_hospede int,
    data_inicio_reserva DATE,
    data_final_reserva DATE
);

CREATE TABLE Pagamento (
    ID_pagamento int PRIMARY KEY,
    data_pagamento DATE,
    valor_pagamento DECIMAL,
    metodo_pagamento VARCHAR,
    status_pagamento VARCHAR,
    fk_Reserva_ID_reserva int,
    desconto_pagamento DECIMAL
);

CREATE TABLE Funcionario (
    ID_funcionario int PRIMARY KEY,
    nome_funcionario VARCHAR,
    cargo_funcionario VARCHAR,
    turno_funcionario VARCHAR,
    fk_telefone_funcionario_telefone_funcionario_PK VARCHAR,
    salario_funcionario DECIMAL
);

CREATE TABLE Servico (
    ID_servico int PRIMARY KEY,
    tipo_servico VARCHAR,
    descricao_servico VARCHAR,
    valor_servico DECIMAL
);

CREATE TABLE Quarto (
    ID_quarto int PRIMARY KEY,
    numero_quarto int,
    tipo_quarto VARCHAR,
    status_quarto VARCHAR,
    nivel_quarto VARCHAR,
    preco_quarto DECIMAL,
    fk_Reserva_ID_reserva int
);

CREATE TABLE email_hospede (
    email_hospede_PK VARCHAR NOT NULL PRIMARY KEY,
    email_hospede VARCHAR
);

CREATE TABLE telefone_hospede (
    telefone_hospede_PK VARCHAR NOT NULL PRIMARY KEY,
    telefone_hospede VARCHAR
);

CREATE TABLE telefone_funcionario (
    telefone_funcionario_PK VARCHAR NOT NULL PRIMARY KEY,
    telefone_funcionario VARCHAR
);

CREATE TABLE Solicita (
    fk_Reserva_ID_reserva int,
    fk_Servico_ID_servico int
);

CREATE TABLE Presta (
    fk_Servico_ID_servico int,
    fk_Funcionario_ID_funcionario int
);
 
ALTER TABLE Hospede ADD CONSTRAINT FK_Hospede_2
    FOREIGN KEY (fk_email_hospede_email_hospede_PK)
    REFERENCES email_hospede (email_hospede_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Hospede ADD CONSTRAINT FK_Hospede_3
    FOREIGN KEY (fk_telefone_hospede_telefone_hospede_PK)
    REFERENCES telefone_hospede (telefone_hospede_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Hospede_ID_hospede)
    REFERENCES Hospede (ID_hospede)
    ON DELETE CASCADE;
 
ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_2
    FOREIGN KEY (fk_Reserva_ID_reserva)
    REFERENCES Reserva (ID_reserva)
    ON DELETE RESTRICT;
 
ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_2
    FOREIGN KEY (fk_telefone_funcionario_telefone_funcionario_PK)
    REFERENCES telefone_funcionario (telefone_funcionario_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Quarto ADD CONSTRAINT FK_Quarto_2
    FOREIGN KEY (fk_Reserva_ID_reserva)
    REFERENCES Reserva (ID_reserva)
    ON DELETE RESTRICT;
 
ALTER TABLE Solicita ADD CONSTRAINT FK_Solicita_1
    FOREIGN KEY (fk_Reserva_ID_reserva)
    REFERENCES Reserva (ID_reserva)
    ON DELETE RESTRICT;
 
ALTER TABLE Solicita ADD CONSTRAINT FK_Solicita_2
    FOREIGN KEY (fk_Servico_ID_servico)
    REFERENCES Servico (ID_servico)
    ON DELETE SET NULL;
 
ALTER TABLE Presta ADD CONSTRAINT FK_Presta_1
    FOREIGN KEY (fk_Servico_ID_servico)
    REFERENCES Servico (ID_servico)
    ON DELETE RESTRICT;
 
ALTER TABLE Presta ADD CONSTRAINT FK_Presta_2
    FOREIGN KEY (fk_Funcionario_ID_funcionario)
    REFERENCES Funcionario (ID_funcionario)
    ON DELETE RESTRICT;