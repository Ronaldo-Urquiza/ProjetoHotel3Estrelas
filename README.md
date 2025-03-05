# ProjetoHotel3Estrelas

## Descrição 🏨

Este projeto é um sistema de gestão hoteleira que permite o controle de reservas, hóspedes, funcionários, pagamentos e serviços. O banco de dados foi modelado e implementado no PostgreSQL, garantindo eficiência e integridade dos dados.

Funcionalidades principais

✅ Cadastro e gerenciamento de hóspedes

✅ Controle de reservas e datas de check-in/check-out

✅ Registro de pagamentos com status atualizado

✅ Alocação de quartos, garantindo organização e disponibilidade

✅ Gerenciamento de funcionários e serviços prestados

✅ Registro de tipos de serviços oferecidos no hotel

## Estrutura do Banco de Dados 🛠

O banco de dados foi projetado com as seguintes tabelas principais:

1️⃣ Hospede → Armazena os dados dos hóspedes, incluindo nome, CPF, telefone e endereço.

2️⃣ Reserva → Controla as reservas realizadas, incluindo data de início e término.

3️⃣ Pagamento → Gerencia os pagamentos realizados, incluindo método e status.

4️⃣ Funcionario → Cadastro de funcionários do hotel, armazenando cargo e salário.

5️⃣ Servico → Lista os serviços prestados, como limpeza, alimentação e manutenção.

6️⃣ Quarto → Controla os quartos disponíveis, incluindo status e preço.

7️⃣ Solicita → Relaciona reservas e serviços solicitados pelos hóspedes.

8️⃣ Presta → Relaciona funcionários e serviços prestados.

## Modelagem do Banco de Dados 🎨

O banco de dados foi modelado seguindo boas práticas de normalização e utiliza:

✔ Chaves primárias (PRIMARY KEY) para identificação única.

✔ Chaves estrangeiras (FOREIGN KEY) para manter integridade referencial.

✔ Constraints (CHECK) para validar campos como status e métodos de pagamento.

✔ DELETE CASCADE e SET NULL para evitar problemas de dados órfãos.

## Equipe de Desenvolvimento 👩‍💻 

💖 Feito com muito carinho por Ronaldo Urquiza e João Victor Pinheiro 

🌟 Se gostou, não esqueça de dar uma ⭐ no repositório!

### 📌 Observação fofa:
Este projeto foi desenvolvido com muito amor e dedicação! Se encontrar um bug, lembre-se: até as melhores suítes têm um travesseiro amassado! 

Se precisar de algo, só chamar! 🚀✨