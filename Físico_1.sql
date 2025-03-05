/* Físico_1: */

CREATE TABLE Hospede (
    ID_hospede SERIAL PRIMARY KEY,
    nome_hospede VARCHAR(100) NOT NULL,
    cpf_hospede VARCHAR(14) UNIQUE NOT NULL,
    email_hospede VARCHAR(255) UNIQUE,
    telefone_hospede VARCHAR(20) UNIQUE,
    CEP_endereco VARCHAR(10),
    numero_endereco INT,
    rua_endereco VARCHAR(100),
    cidade_endereco VARCHAR(50),
    pais_endereco VARCHAR(50),
    estado_endereco VARCHAR(50)
);

CREATE TABLE Reserva (
    ID_reserva SERIAL PRIMARY KEY,
    fk_Hospede_ID_hospede INT NOT NULL,
    data_inicio_reserva DATE NOT NULL,
    data_final_reserva DATE NOT NULL,
    check_in_reserva TIMESTAMP NOT NULL,
    check_out_reserva TIMESTAMP NOT NULL,
    status_reserva VARCHAR(20) NOT NULL DEFAULT 'Pendente' CHECK (status_reserva IN ('Confirmada', 'Pendente', 'Cancelada'))
);

CREATE TABLE Pagamento (
    ID_pagamento SERIAL PRIMARY KEY,
    data_pagamento DATE NOT NULL,
    valor_pagamento DECIMAL(10,2) NOT NULL CHECK (valor_pagamento >= 0),
    metodo_pagamento VARCHAR(50) NOT NULL CHECK (metodo_pagamento IN ('Credito', 'Debito', 'Pix', 'Boleto', 'Dinheiro')),
    status_pagamento VARCHAR(20) NOT NULL DEFAULT 'Pendente' CHECK (status_pagamento IN ('Pago', 'Pendente', 'Cancelado')),
    fk_Reserva_ID_reserva INT NOT NULL,
    desconto_pagamento DECIMAL(10,2) DEFAULT 0 CHECK (desconto_pagamento >= 0)
);

CREATE TABLE Funcionario (
    ID_funcionario SERIAL PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    cargo_funcionario VARCHAR(50) NOT NULL,
    turno_funcionario VARCHAR(20) NOT NULL CHECK (turno_funcionario IN ('Manha', 'Tarde', 'Noite')),
    telefone_funcionario VARCHAR(20) UNIQUE,
    salario_funcionario DECIMAL(10,2) NOT NULL CHECK (salario_funcionario >= 0)
);

CREATE TABLE Servico (
    ID_servico SERIAL PRIMARY KEY,
    tipo_servico VARCHAR(50) NOT NULL CHECK (tipo_servico IN ('Limpeza', 'Manutencao', 'Alimentacao','Seguranca')),
    descricao_servico TEXT,
    valor_servico DECIMAL(10,2) NOT NULL CHECK (valor_servico >= 0)
);

CREATE TABLE Quarto (
    ID_quarto SERIAL PRIMARY KEY,
    numero_quarto INT UNIQUE NOT NULL,
    tipo_quarto VARCHAR(50) NOT NULL,
    status_quarto VARCHAR(20) NOT NULL DEFAULT 'Disponivel' CHECK (status_quarto IN ('Disponivel', 'Ocupado', 'Em manutencao')),
    nivel_quarto VARCHAR(50) NOT NULL CHECK (nivel_quarto IN ('Comum', 'Executivo', 'Master')),
    preco_quarto DECIMAL(10,2) NOT NULL CHECK (preco_quarto >= 0),
    fk_Reserva_ID_reserva INT
);

CREATE TABLE Solicita (
    fk_Reserva_ID_reserva INT NOT NULL,
    fk_Servico_ID_servico INT NOT NULL,
    PRIMARY KEY (fk_Reserva_ID_reserva, fk_Servico_ID_servico)
);

CREATE TABLE Presta (
    fk_Servico_ID_servico INT NOT NULL,
    fk_Funcionario_ID_funcionario INT NOT NULL,
    PRIMARY KEY (fk_Servico_ID_servico, fk_Funcionario_ID_funcionario)
);

-- Adicionando Foreign Keys

ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_Hospede
    FOREIGN KEY (fk_Hospede_ID_hospede)
    REFERENCES Hospede (ID_hospede)
    ON DELETE CASCADE;

ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_Reserva
    FOREIGN KEY (fk_Reserva_ID_reserva)
    REFERENCES Reserva (ID_reserva)
    ON DELETE CASCADE;

ALTER TABLE Quarto ADD CONSTRAINT FK_Quarto_Reserva
    FOREIGN KEY (fk_Reserva_ID_reserva)
    REFERENCES Reserva (ID_reserva)
    ON DELETE SET NULL;

ALTER TABLE Solicita ADD CONSTRAINT FK_Solicita_Reserva
    FOREIGN KEY (fk_Reserva_ID_reserva)
    REFERENCES Reserva (ID_reserva)
    ON DELETE CASCADE;

ALTER TABLE Solicita ADD CONSTRAINT FK_Solicita_Servico
    FOREIGN KEY (fk_Servico_ID_servico)
    REFERENCES Servico (ID_servico)
    ON DELETE SET NULL;

ALTER TABLE Presta ADD CONSTRAINT FK_Presta_Servico
    FOREIGN KEY (fk_Servico_ID_servico)
    REFERENCES Servico (ID_servico)
    ON DELETE CASCADE;

ALTER TABLE Presta ADD CONSTRAINT FK_Presta_Funcionario
    FOREIGN KEY (fk_Funcionario_ID_funcionario)
    REFERENCES Funcionario (ID_funcionario)
    ON DELETE CASCADE;