-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`web`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`web` (
  `idWeb` INT(11) NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idWeb`),
  UNIQUE INDEX `idWeb_UNIQUE` (`idWeb` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`xml`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`xml` (
  `idxml_page` INT(11) NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(100) NOT NULL,
  `BOOL_CHECK` TINYINT(1) NOT NULL,
  `idWeb` INT(11) NOT NULL,
  PRIMARY KEY (`idxml_page`),
  INDEX `idWeb` (`idWeb` ASC),
  CONSTRAINT `idWeb`
    FOREIGN KEY (`idWeb`)
    REFERENCES `mydb`.`web` (`idWeb`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`news` (
  `idNews` INT(11) NOT NULL,
  `id_xml` INT(11) NOT NULL,
  `title` VARCHAR(20) NOT NULL,
  `date_pub` DATETIME NOT NULL,
  `Content` VARCHAR(100) NULL,
  `external_link` VARCHAR(100) NOT NULL,
  `image` VARCHAR(150) NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`idNews`),
  INDEX `idunderscorexml_idx` (`id_xml` ASC),
  CONSTRAINT `id_xml`
    FOREIGN KEY (`id_xml`)
    REFERENCES `mydb`.`xml` (`idxml_page`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `pass` VARCHAR(16) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comment` (
  `idcomment` INT NOT NULL AUTO_INCREMENT,
  `idnews` INT NOT NULL,
  `iduser` INT NOT NULL,
  `text` TEXT NOT NULL,
  PRIMARY KEY (`idcomment`),
  INDEX `idnews_idx` (`idnews` ASC),
  INDEX `iduser_idx` (`iduser` ASC),
  CONSTRAINT `idnews`
    FOREIGN KEY (`idnews`)
    REFERENCES `mydb`.`news` (`idNews`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `iduser`
    FOREIGN KEY (`iduser`)
    REFERENCES `mydb`.`users` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
