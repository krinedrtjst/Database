CREATE TABLE `Funcionario` (
  `CPF` CHAR(11) PRIMARY KEY,
  `Nome` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(15),
  `Email` VARCHAR(100),
  `Login` VARCHAR(50) NOT NULL,
  `Senha` VARCHAR(50) NOT NULL
);

CREATE TABLE `Hotel` (
  `id_hotel` INT PRIMARY KEY AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Categoria` VARCHAR(50),
  `Telefone` VARCHAR(15),
  `Email` VARCHAR(100),
  `Rua` VARCHAR(100),
  `Numero` VARCHAR(10),
  `Complemento` VARCHAR(50),
  `Bairro` VARCHAR(50),
  `CEP` VARCHAR(10),
  `Cidade` VARCHAR(50),
  `Estado` VARCHAR(50)
);

CREATE TABLE `Quarto` (
  `id_quarto` INT PRIMARY KEY AUTO_INCREMENT,
  `id_hotel` INT,
  `numero_de_leitos` INT,
  `tipo` ENUM ('standard', 'luxo', 'suíte'),
  `preco_diaria` DECIMAL(10,2),
  `status` ENUM ('disponível', 'ocupado', 'manutenção')
);

CREATE TABLE `Hospede` (
  `CPF` CHAR(11) PRIMARY KEY,
  `Nome` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(15),
  `Email` VARCHAR(100),
  `Rua` VARCHAR(100),
  `Numero` VARCHAR(10),
  `Complemento` VARCHAR(50),
  `Bairro` VARCHAR(50),
  `CEP` VARCHAR(10),
  `Cidade` VARCHAR(50),
  `Estado` VARCHAR(50)
);

CREATE TABLE `Reserva` (
  `id_reserva` INT PRIMARY KEY AUTO_INCREMENT,
  `CPF_hospede` CHAR(11),
  `CPF_funcionario` CHAR(11),
  `data_entrada` DATE,
  `data_saida` DATE,
  `status` ENUM ('ativa', 'cancelada', 'concluída')
);

CREATE TABLE `Pagamento` (
  `id_pagamento` INT PRIMARY KEY AUTO_INCREMENT,
  `id_reserva` INT,
  `forma_pagamento` ENUM ('cartão', 'pix', 'dinheiro'),
  `data_pagamento` DATE,
  `valor_total` DECIMAL(10,2),
  `status` ENUM ('pago', 'pendente')
);

CREATE TABLE `Reserva_Quarto` (
  `id_reserva` INT,
  `id_quarto` INT,
  PRIMARY KEY (`id_reserva`, `id_quarto`)
);

ALTER TABLE `Quarto` ADD FOREIGN KEY (`id_hotel`) REFERENCES `Hotel` (`id_hotel`);

ALTER TABLE `Reserva` ADD FOREIGN KEY (`CPF_hospede`) REFERENCES `Hospede` (`CPF`);

ALTER TABLE `Reserva` ADD FOREIGN KEY (`CPF_funcionario`) REFERENCES `Funcionario` (`CPF`);

ALTER TABLE `Pagamento` ADD FOREIGN KEY (`id_reserva`) REFERENCES `Reserva` (`id_reserva`);

ALTER TABLE `Reserva_Quarto` ADD FOREIGN KEY (`id_reserva`) REFERENCES `Reserva` (`id_reserva`);

ALTER TABLE `Reserva_Quarto` ADD FOREIGN KEY (`id_quarto`) REFERENCES `Quarto` (`id_quarto`);
