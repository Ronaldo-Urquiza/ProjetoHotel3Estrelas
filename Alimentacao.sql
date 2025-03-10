-- Inserindo hospedes
INSERT INTO Hospede (nome_hospede, cpf_hospede, email_hospede, telefone_hospede, CEP_endereco, numero_endereco, rua_endereco, cidade_endereco, pais_endereco, estado_endereco)
VALUES
('Ronaldo Urquiza', '123.456.789-00', 'ronaldo@email.com', '+55 83 99999-0001', '58400-100', 150, 'Rua Floriano Peixoto', 'Campina Grande', 'Brasil', 'PB'),
('Joao Pinheiro', '987.654.321-00', 'maria@email.com', '+55 83 99999-0002', '58030-020', 250, 'Avenida Epitacio Pessoa', 'João Pessoa', 'Brasil', 'PB'),
('Ana Banana', '321.654.987-00', 'ianna@email.com', '+55 83 99999-0003', '58410-200', 310, 'Rua Miguel Couto', 'Campina Grande', 'Brasil', 'PB'),
('Belinha Isabelle', '456.789.123-00', 'belinha@email.com', '+55 83 99999-0004', '58050-110', 420, 'Rua Princesa Isabel', 'João Pessoa', 'Brasil', 'PB'),
('Otávio Oliva', '789.123.456-00', 'baal@email.com', '+55 83 99999-0005', '58430-050', 530, 'Avenida Assis Chateaubriand', 'Campina Grande', 'Brasil', 'PB');

-- Inserindo quartos
INSERT INTO Quarto (numero_quarto, tipo_quarto, status_quarto, nivel_quarto, preco_quarto)
VALUES
(101, 'Individual', 'Disponivel', 'Executivo', 350.00),
(102, 'Duplo solteiro', 'Ocupado', 'Comum', 180.00),
(201, 'Triplo solteiro ', 'Disponivel', 'Master', 500.00),
(202, 'Casal', 'Disponivel', 'Executivo', 400.00),
(301, 'Casal', 'Ocupado', 'Comum', 190.00);

-- Inserindo reservas
INSERT INTO Reserva (fk_Hospede_ID_hospede, data_inicio_reserva, data_final_reserva, check_in_reserva, check_out_reserva, status_reserva)
VALUES
(1, '2025-04-10', '2025-04-15', '2025-04-10 14:00:00', '2025-04-15 12:00:00', 'Confirmada'),
(2, '2025-05-05', '2025-05-10', '2025-05-05 13:00:00', '2025-05-10 11:00:00', 'Pendente'),
(3, '2025-06-01', '2025-06-07', '2025-06-01 15:00:00', '2025-06-07 10:00:00', 'Confirmada'),
(4, '2025-06-15', '2025-06-20', '2025-06-15 16:00:00', '2025-06-20 10:00:00', 'Pendente'),
(5, '2025-07-01', '2025-07-05', '2025-07-01 12:00:00', '2025-07-05 10:00:00', 'Cancelada');

-- Associando reservas aos quartos
UPDATE Quarto SET fk_Reserva_ID_reserva = 1 WHERE numero_quarto = 101;
UPDATE Quarto SET fk_Reserva_ID_reserva = 2 WHERE numero_quarto = 102;
UPDATE Quarto SET fk_Reserva_ID_reserva = 3 WHERE numero_quarto = 201;
UPDATE Quarto SET fk_Reserva_ID_reserva = 4 WHERE numero_quarto = 202;
UPDATE Quarto SET fk_Reserva_ID_reserva = 5 WHERE numero_quarto = 301;

-- Inserindo pagamentos
INSERT INTO Pagamento (data_pagamento, valor_pagamento, metodo_pagamento, status_pagamento, fk_Reserva_ID_reserva, desconto_pagamento)
VALUES
('2025-04-10', 350.00, 'Credito', 'Pago', 1, 0),
('2025-05-05', 180.00, 'Pix', 'Pendente', 2, 10.00),
('2025-06-01', 500.00, 'Boleto', 'Pago', 3, 5.00),
('2025-06-15', 400.00, 'Dinheiro', 'Pendente', 4, 0),
('2025-07-01', 190.00, 'Debito', 'Cancelado', 5, 15.00);


-- Inserindo funcionários
INSERT INTO Funcionario (nome_funcionario, cargo_funcionario, turno_funcionario, telefone_funcionario, salario_funcionario)
VALUES
('Kurby', 'Recepcionista', 'Manha', '+55 83 98888-0003', 2200.00),
('Lays', 'Camareira', 'Tarde', '+55 83 97777-0004', 1900.00),
('Klapaucius', 'Gerente', 'Noite', '+55 83 96666-0005', 4500.00),
('Paola Caçarola', 'Cozinheira', 'Manha', '+55 83 95555-0006', 2800.00),
('Ron', 'Manutenção', 'Tarde', '+55 83 94444-0007', 2300.00);

-- Inserindo serviços oferecidos pelo hotel
INSERT INTO Servico (tipo_servico, descricao_servico, valor_servico)
VALUES
('Limpeza', 'Serviço de limpeza e arrumação dos quartos', 50.00),
('Alimentacao', 'Café da manhã completo', 35.00),
('Manutencao', 'Reparo e manutenção geral', 100.00),
('Seguranca', 'Monitoramento 24h e patrulha interna', 75.00),
('Alimentacao', 'Jantar à la carte no restaurante do hotel', 80.00);

-- Relacionando serviços solicitados às reservas
INSERT INTO Solicita (fk_Reserva_ID_reserva, fk_Servico_ID_servico)
VALUES
(1, 1), -- Ronaldo Urquiza solicitou Limpeza
(2, 2), -- Joao Pinheiro solicitou Café da Manhã
(3, 3), -- Ana Banana solicitou Manutenção
(4, 4), -- Belinha Isabelle solicitou Segurança
(5, 5); -- Otávio Oliva solicitou Jantar no restaurante

-- Relacionando serviços prestados por funcionários
INSERT INTO Presta (fk_Servico_ID_servico, fk_Funcionario_ID_funcionario)
VALUES
(2, 1), -- Lays presta serviço de Limpeza
(1, 2), -- Kurby cuida da Alimentação (café da manhã)
(3, 5), -- Ron faz manutenção
(4, 3), -- Klapaucius supervisiona a Segurança
(5, 4); -- Paola Caçarola cuida do Jantar no restaurante