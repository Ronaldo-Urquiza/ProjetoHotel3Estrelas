-- |
-- Pelo menos quatro consultas devem envolver duas ou mais tabelas (em alguns casos incluir outer joins)
-- |

--Retorna as reservas confirmadas, mostrando o nome do hóspede e as datas de início e fim da estadia.
SELECT R.ID_reserva, H.nome_hospede, R.data_inicio_reserva, R.data_final_reserva
FROM Reserva R
JOIN Hospede H ON R.fk_Hospede_ID_hospede = H.ID_hospede
WHERE R.status_reserva = 'Confirmada';

--  Servicos mais solicitados pelos hospedes ajudando a entender quais servicos sao mais populares e devem receber mais investimento.
SELECT S.tipo_servico, COUNT(*) AS total_solicitacoes
FROM Solicita So
JOIN Servico S ON So.fk_Servico_ID_servico = S.ID_servico
GROUP BY S.tipo_servico
ORDER BY total_solicitacoes DESC;

-- Listar todos os hospedes e suas reservas, incluindo aqueles que ainda nao fizeram nenhuma reserva
SELECT H.nome_hospede, R.ID_reserva, R.data_inicio_reserva, R.status_reserva
FROM Hospede H
LEFT JOIN Reserva R ON H.ID_hospede = R.fk_Hospede_ID_hospede
ORDER BY H.nome_hospede;

-- Lista de funcionarios e os servicos que prestam
SELECT F.nome_funcionario, S.tipo_servico
FROM Funcionario F
LEFT JOIN Presta P ON F.ID_funcionario = P.fk_Funcionario_ID_funcionario
LEFT JOIN Servico S ON P.fk_Servico_ID_servico = S.ID_servico
ORDER BY F.nome_funcionario;

-- |
-- Pelo menos duas consultas devem envolver funções de agregação (COUNT, SUM, MIN, MAX, AVG) com agrupamento (GROUP BY):
-- |

-- Mostra quantas reservas existem para cada status (Confirmada, Pendente, Cancelada).
SELECT status_reserva, COUNT(*) AS total_reservas
FROM Reserva
GROUP BY status_reserva;

-- Ajuda a entender qual metodo de pagamento ('Credito', 'Debito', 'Pix', 'Boleto', 'Dinheiro') tem os valores medios mais altos.
SELECT metodo_pagamento, AVG(valor_pagamento) AS media_pagamento
FROM Pagamento
WHERE status_pagamento = 'Pendente'
GROUP BY metodo_pagamento;

-- |
-- Pelo menos duas consultas devem envolver funções de agregação (COUNT, SUM, MIN, MAX, AVG) com agrupamento (GROUP BY) e HAVING.
-- |

-- Listar cidades que possuem mais de 1 hospedes cadastrados
SELECT cidade_endereco, COUNT(*) AS total_hospedes
FROM Hospede
GROUP BY cidade_endereco
HAVING COUNT(*) > 1 -- Alterar esse valor para quantidade desejada
ORDER BY total_hospedes DESC;

-- Listar funcionarios que prestaram mais de "0" servico(s)
SELECT F.nome_funcionario, COUNT(*) AS total_servicos_prestados
FROM Presta P
JOIN Funcionario F ON P.fk_Funcionario_ID_funcionario = F.ID_funcionario
GROUP BY F.nome_funcionario
HAVING COUNT(*) > 0 -- Alterar esse valor para quantidade desejada
ORDER BY total_servicos_prestados DESC;

-- |
-- Outras 7 consultas mais simples mas interessantes para o gerente do hotel 3 estrelas
-- |

-- Listar os "5" servicos mais caros do hotel
SELECT tipo_servico, valor_servico
FROM Servico
ORDER BY valor_servico DESC
LIMIT 5; -- Alterar esse valor para quantidade desejada

-- Listar os pagamentos pendentes
SELECT ID_pagamento, fk_Reserva_ID_reserva, valor_pagamento, metodo_pagamento
FROM Pagamento
WHERE status_pagamento = 'Pendente'
ORDER BY data_pagamento DESC;

-- Listar funcionarios que trabalham no turno da noite
SELECT nome_funcionario, cargo_funcionario, salario_funcionario
FROM Funcionario
WHERE turno_funcionario = 'Noite'
ORDER BY salario_funcionario DESC;

-- Qual e a taxa de ocupacao do hotel neste momento?
SELECT (COUNT(*) FILTER (WHERE status_quarto = 'Ocupado') * 100.0 / COUNT(*)) AS taxa_ocupacao
FROM Quarto;

-- Qual o funcionario com maior salario no hotel?
SELECT nome_funcionario, cargo_funcionario, salario_funcionario
FROM Funcionario
ORDER BY salario_funcionario DESC
LIMIT 1;

-- Qual mes do ano tem mais reservas confirmadas/pendentes?
SELECT EXTRACT(MONTH FROM data_inicio_reserva) AS mes, COUNT(*) AS total_reservas
FROM Reserva
WHERE status_reserva IN ('Confirmada', 'Pendente')
GROUP BY mes
ORDER BY total_reservas DESC
LIMIT 1;

-- TOP 3 metodos de pagamento e mais utilizado pelos clientes
SELECT metodo_pagamento, COUNT(*) AS total_pagamentos
FROM Pagamento
WHERE status_pagamento IN ('Pago', 'Pendente')
GROUP BY metodo_pagamento
ORDER BY total_pagamentos DESC
LIMIT 3;
