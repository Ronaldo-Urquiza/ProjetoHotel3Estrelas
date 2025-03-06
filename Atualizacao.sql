-- 1 INSERCAO:
-- Inserção de um novo hóspede e criação de uma reserva para ele
INSERT INTO Hospede (nome_hospede, cpf_hospede, email_hospede, telefone_hospede, CEP_endereco, numero_endereco, rua_endereco, cidade_endereco, pais_endereco, estado_endereco)
VALUES ('Lucas Almeida', '159.357.753-11', 'lucas@email.com', '+55 83 99999-0006', '58415-300', 101, 'Rua João Suassuna', 'Campina Grande', 'Brasil', 'PB');

-- 3 REMOCOES:
-- Remoção de um pagamento específico
DELETE FROM Pagamento WHERE ID_pagamento = 3;

-- Remoção de um hóspede e suas reservas associadas
DELETE FROM Hospede WHERE cpf_hospede = '789.123.456-00';

-- Removendo um hóspede e todas as suas reservas, pagamentos e solicitações de serviço associadas
DELETE FROM Hospede WHERE ID_hospede = (
    SELECT ID_hospede FROM Hospede WHERE nome_hospede = 'Ronaldo Urquiza' 
);

-- 3 ATUALIZACOES:
-- Atualização do status de uma reserva
UPDATE Reserva SET status_reserva = 'Confirmada' WHERE ID_reserva = 2;

-- Aplicação de desconto em um pagamento pendente
UPDATE Pagamento SET desconto_pagamento = 20.00 WHERE status_pagamento = 'Pendente' AND fk_Reserva_ID_reserva = 4;

-- Aumenta o preço de todos os serviços com 5% do maior pagamento já feito no hotel.
UPDATE Servico
SET valor_servico = valor_servico + (
    SELECT MAX(valor_pagamento) * 0.05 FROM Pagamento
);
