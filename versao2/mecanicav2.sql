-- MySQL Script generated by MySQL Workbench
-- 09/25/17 14:27:44
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mecanicav2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mecanicav2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mecanicav2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mecanicav2` ;

-- -----------------------------------------------------
-- Table `mecanicav2`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanicav2`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(14) NULL,
  `telefone` VARCHAR(20) NULL,
  `rua` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` CHAR(2) NULL,
  `numero` VARCHAR(6) NULL,
  `bairro` VARCHAR(45) NULL,
  `cep` VARCHAR(12) NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanicav2`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanicav2`.`carro` (
  `idcarro` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `carro` VARCHAR(45) NULL,
  `cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idcarro`),
  INDEX `fk_carro_cliente_idx` (`cliente_idcliente` ASC),
  CONSTRAINT `fk_carro_cliente`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mecanicav2`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanicav2`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanicav2`.`funcionario` (
  `idfuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `especializacao` VARCHAR(45) NULL,
  PRIMARY KEY (`idfuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanicav2`.`ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanicav2`.`ordem_servico` (
  `idordem_servico` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `preco` DECIMAL(5,2) NULL,
  `carro_idcarro` INT NOT NULL,
  `funcionario_idfuncionario` INT NOT NULL,
  PRIMARY KEY (`idordem_servico`),
  INDEX `fk_ordem_servico_carro1_idx` (`carro_idcarro` ASC),
  INDEX `fk_ordem_servico_funcionario1_idx` (`funcionario_idfuncionario` ASC),
  CONSTRAINT `fk_ordem_servico_carro1`
    FOREIGN KEY (`carro_idcarro`)
    REFERENCES `mecanicav2`.`carro` (`idcarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_funcionario1`
    FOREIGN KEY (`funcionario_idfuncionario`)
    REFERENCES `mecanicav2`.`funcionario` (`idfuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanicav2`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanicav2`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  `preco` DECIMAL(5,2) NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mecanicav2`.`ordem_servico_has_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecanicav2`.`ordem_servico_has_produto` (
  `ordem_servico_idordem_servico` INT NOT NULL,
  `produto_idproduto` INT NOT NULL,
  PRIMARY KEY (`ordem_servico_idordem_servico`, `produto_idproduto`),
  INDEX `fk_ordem_servico_has_produto_produto1_idx` (`produto_idproduto` ASC),
  INDEX `fk_ordem_servico_has_produto_ordem_servico1_idx` (`ordem_servico_idordem_servico` ASC),
  CONSTRAINT `fk_ordem_servico_has_produto_ordem_servico1`
    FOREIGN KEY (`ordem_servico_idordem_servico`)
    REFERENCES `mecanicav2`.`ordem_servico` (`idordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_has_produto_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `mecanicav2`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
