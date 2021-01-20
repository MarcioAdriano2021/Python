-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema db_desafio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_desafio` DEFAULT CHARACTER SET utf8mb4;
USE `db_desafio` ;

-- -----------------------------------------------------
-- Table`db_desafio`.`tb_tiposanguineo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_tiposanguineo` (
  `id_tiposanguineo` INT NOT NULL AUTO_INCREMENT,
  `tipo` CHAR(3) NOT NULL,
  PRIMARY KEY (`id_tiposanguineo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table`db_desafio`.`tb_cor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_cor` (
  `id_cor` INT NOT NULL AUTO_INCREMENT,
  `cor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `db_desafio`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `sigla` CHAR(2) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `db_desafio`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_cidade` (
  `id_cidade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_cidade`),
  INDEX `fk_cidade_estado_idx` (`id_estado` ASC),
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `db_desafio`.`tb_estado` (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `db_desafio`.`tb_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_pessoa` (
  `id_pessoa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `data_nasc` DATETIME NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `signo` VARCHAR(45) NOT NULL,
  `altura` FLOAT NOT NULL,
  `peso` FLOAT NOT NULL,
  `id_cidade` INT NOT NULL,
  `id_cor` INT NOT NULL,
  `id_tiposanguineo` INT NOT NULL,
  PRIMARY KEY (`id_pessoa`),
  INDEX `fk_pessoa_cidade_idx` (`id_cidade` ASC),
  INDEX `fk_pessoa_cor_idx` (`id_cor` ASC),
  INDEX `fk_pessoa_tiposanguineo_idx` (`id_tiposanguineo` ASC),
  CONSTRAINT `fk_pessoa_cidade`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `db_desafio`.`tb_cidade` (`id_cidade`),
  CONSTRAINT `fk_pessoa_cor`
    FOREIGN KEY (`id_cor`)
    REFERENCES `db_desafio`.`tb_cor` (`id_cor`),
  CONSTRAINT `fk_pessoa_tiposanguineo`
    FOREIGN KEY (`id_tiposanguineo`)
    REFERENCES `db_desafio`.`tb_tiposanguineo` (`id_tiposanguineo`))    
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;