CREATE TABLE `Cliente` (
  `idCliente` INT PRIMARY KEY,
  `CPF` VARCHAR(20),
  `nome` VARCHAR(50),
  `telefone` VARCHAR(20),
  `email` VARCHAR(50),
  `endereco` VARCHAR(100)
);

CREATE TABLE `Pagamento` (
  `idPagamento` INT PRIMARY KEY,
  `forma` ENUM ('Cartão', 'Pix', 'Dinheiro'),
  `dataPagamento` DATE,
  `valorTotal` DECIMAL(7,2),
  `estado` ENUM ('Pago', 'Pendente')
);

CREATE TABLE `Locacao` (
  `idLocacao` INT PRIMARY KEY,
  `idCliente` INT,
  `idPagamento` INT,
  `dataInicio` DATE,
  `dataFim` DATE
);

CREATE TABLE `Veiculo` (
  `idVeiculo` INT PRIMARY KEY,
  `modelo` VARCHAR(50),
  `marca` VARCHAR(50),
  `ano` INT,
  `placa` VARCHAR(10),
  `valorDiaria` DECIMAL(7,2),
  `estado` ENUM ('Disponível', 'Alugado', 'Manutenção')
);

CREATE TABLE `LocacaoVeiculo` (
  `idLocacao` INT,
  `idVeiculo` INT,
  PRIMARY KEY (`idLocacao`, `idVeiculo`)
);

CREATE TABLE `Manutencao` (
  `idManutencao` INT PRIMARY KEY,
  `idVeiculo` INT,
  `descricao` VARCHAR(100),
  `dataManutencao` DATE,
  `custo` DECIMAL(7,2)
);

ALTER TABLE `Locacao` ADD FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`);

ALTER TABLE `Locacao` ADD FOREIGN KEY (`idPagamento`) REFERENCES `Pagamento` (`idPagamento`);

ALTER TABLE `LocacaoVeiculo` ADD FOREIGN KEY (`idLocacao`) REFERENCES `Locacao` (`idLocacao`);

ALTER TABLE `LocacaoVeiculo` ADD FOREIGN KEY (`idVeiculo`) REFERENCES `Veiculo` (`idVeiculo`);

ALTER TABLE `Manutencao` ADD FOREIGN KEY (`idVeiculo`) REFERENCES `Veiculo` (`idVeiculo`);
