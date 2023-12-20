-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Downloads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Downloads` (
  `download_id` INT NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(255) NOT NULL,
  `download_date_time` DATETIME NOT NULL,
  PRIMARY KEY (`download_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `email` VARCHAR(255) NOT NULL,
  `first name` VARCHAR(255) NOT NULL,
  `last name` VARCHAR(255) NOT NULL,
  `Downloads_download_id` INT NOT NULL,
  PRIMARY KEY (`email`),
  INDEX `fk_Users_Doanloads_idx` (`Downloads_download_id` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Doanloads`
    FOREIGN KEY (`Downloads_download_id`)
    REFERENCES `mydb`.`Downloads` (`download_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Downloads_has_Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Downloads_has_Products` (
  `Downloads_download_id` INT NOT NULL,
  `Products_product_id` INT NOT NULL,
  PRIMARY KEY (`Downloads_download_id`, `Products_product_id`),
  INDEX `fk_Downloads_has_Products_Products1_idx` (`Products_product_id` ASC) VISIBLE,
  INDEX `fk_Downloads_has_Products_Downloads1_idx` (`Downloads_download_id` ASC) VISIBLE,
  CONSTRAINT `fk_Downloads_has_Products_Downloads1`
    FOREIGN KEY (`Downloads_download_id`)
    REFERENCES `mydb`.`Downloads` (`download_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Downloads_has_Products_Products1`
    FOREIGN KEY (`Products_product_id`)
    REFERENCES `mydb`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
