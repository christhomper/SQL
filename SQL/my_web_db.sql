-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Drop and Create Schema my_web_db
-- -----------------------------------------------------

DROP DATABASE IF EXISTS `my_web_db`;
CREATE DATABASE IF NOT EXISTS `my_web_db` DEFAULT CHARACTER SET utf8mb4;
USE `my_web_db`;

-- -----------------------------------------------------
-- Table `my_web_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT NOT NULL,
  `email_address` VARCHAR(100) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4;

-- -----------------------------------------------------
-- Table `my_web_db`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4;

-- -----------------------------------------------------
-- Table `my_web_db`.`downloads`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `downloads` (
  `download_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `download_date` DATETIME NULL,
  `filename` VARCHAR(50) NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`download_id`),
  INDEX `idx_user_id` (`user_id`),
  INDEX `idx_product_id` (`product_id`),
  CONSTRAINT `fk_downloads_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_downloads_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET utf8mb4;

-- Insert data into Users table
INSERT INTO `users` (`user_id`, `email_address`, `first_name`, `last_name`)
VALUES
  (1, 'johndoe@gmail.com', 'John', 'Doe'),
  (2, 'janesmith@yahoo.com', 'Jane', 'Smith');

-- Insert data into Products table
INSERT INTO `products` (`product_id`, `product_name`)
VALUES
  (1, 'Local Music Vol 1'),
  (2, 'Local Music Vol 2');

-- Insert data into Downloads table
INSERT INTO `downloads` (`download_id`, `user_id`, `download_date`, `filename`, `product_id`)
VALUES
  (1, 1, NOW(), 'file1.txt', 2),
  (2, 2, NOW(), 'file2.txt', 1),
  (3, 2, NOW(), 'file3.txt', 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
