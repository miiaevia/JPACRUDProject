-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema nonprofitsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `nonprofitsdb` ;

-- -----------------------------------------------------
-- Schema nonprofitsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nonprofitsdb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema statesdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `statesdb` ;

-- -----------------------------------------------------
-- Schema statesdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `statesdb` DEFAULT CHARACTER SET utf8 ;
USE `nonprofitsdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(250) NULL,
  `street2` VARCHAR(100) NULL,
  `city` VARCHAR(100) NULL,
  `county` VARCHAR(100) NULL,
  `state` VARCHAR(100) NULL,
  `country` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `leaders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `leaders` ;

CREATE TABLE IF NOT EXISTS `leaders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `active` TINYINT(1) UNSIGNED NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact` ;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(250) NULL,
  `phone` INT UNSIGNED NULL,
  `website_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nonprofit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nonprofit` ;

CREATE TABLE IF NOT EXISTS `nonprofit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(5000) NULL,
  `cause` VARCHAR(200) NULL,
  `year_founded` INT UNSIGNED NULL,
  `address_id` INT UNSIGNED NULL,
  `image_url` VARCHAR(1000) NULL,
  `contact_id` INT UNSIGNED NULL,
  `president_id` INT NULL,
  `founder_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_id_idx` (`address_id` ASC),
  INDEX `fk_president_id_idx` (`president_id` ASC),
  INDEX `fk_founder_id_idx` (`founder_id` ASC),
  INDEX `fk_contact_id_idx` (`contact_id` ASC),
  CONSTRAINT `fk_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_president_id`
    FOREIGN KEY (`president_id`)
    REFERENCES `leaders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_founder_id`
    FOREIGN KEY (`founder_id`)
    REFERENCES `leaders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contact_id`
    FOREIGN KEY (`contact_id`)
    REFERENCES `contact` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `statesdb` ;

-- -----------------------------------------------------
-- Table `state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state` ;

CREATE TABLE IF NOT EXISTS `state` (
  `abbreviation` CHAR(2) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `capital` VARCHAR(100) NULL DEFAULT NULL,
  `population` INT(10) UNSIGNED NULL DEFAULT NULL,
  `latitude` DECIMAL(8,6) NULL DEFAULT NULL,
  `longitude` DECIMAL(9,6) NULL DEFAULT NULL,
  `flag_url` VARCHAR(1000) NULL DEFAULT NULL,
  `governor_first_name` VARCHAR(30) NULL DEFAULT NULL,
  `governor_last_name` VARCHAR(30) NULL DEFAULT NULL,
  `best_fast_food_chain` VARCHAR(100) NULL,
  PRIMARY KEY (`abbreviation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `symbol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `symbol` ;

CREATE TABLE IF NOT EXISTS `symbol` (
  `symbol_name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`symbol_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `state_symbol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state_symbol` ;

CREATE TABLE IF NOT EXISTS `state_symbol` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `abbreviation` CHAR(2) NULL DEFAULT NULL,
  `symbol_name` VARCHAR(20) NULL DEFAULT NULL,
  `symbol` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_abbreviation_state_idx` (`abbreviation` ASC),
  INDEX `fk_symbol_name_idx` (`symbol_name` ASC),
  CONSTRAINT `fk_abbreviation_state`
    FOREIGN KEY (`abbreviation`)
    REFERENCES `state` (`abbreviation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_symbol_name`
    FOREIGN KEY (`symbol_name`)
    REFERENCES `symbol` (`symbol_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `state_cities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `state_cities` ;

CREATE TABLE IF NOT EXISTS `state_cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `state_abbreviation` CHAR(2) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `population` VARCHAR(45) NULL,
  `state_citiescol` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_state_city_idx` (`state_abbreviation` ASC),
  CONSTRAINT `fk_state_city`
    FOREIGN KEY (`state_abbreviation`)
    REFERENCES `state` (`abbreviation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO statesuser@localhost;
 DROP USER statesuser@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'statesuser'@'localhost' IDENTIFIED BY 'statesuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'statesuser'@'localhost';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'statesuser'@'localhost';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO npuser;
 DROP USER npuser;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'npuser' IDENTIFIED BY 'SBlack!!11';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'npuser';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'npuser';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `state`
-- -----------------------------------------------------
START TRANSACTION;
USE `statesdb`;
INSERT INTO `state` (`abbreviation`, `name`, `capital`, `population`, `latitude`, `longitude`, `flag_url`, `governor_first_name`, `governor_last_name`, `best_fast_food_chain`) VALUES ('CO', 'Colorado', 'Denver', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `state` (`abbreviation`, `name`, `capital`, `population`, `latitude`, `longitude`, `flag_url`, `governor_first_name`, `governor_last_name`, `best_fast_food_chain`) VALUES ('TX', 'Texas', 'Austin', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `symbol`
-- -----------------------------------------------------
START TRANSACTION;
USE `statesdb`;
INSERT INTO `symbol` (`symbol_name`, `description`) VALUES ('bird', 'State bird');
INSERT INTO `symbol` (`symbol_name`, `description`) VALUES ('song', 'State song');
INSERT INTO `symbol` (`symbol_name`, `description`) VALUES ('dinosaur', 'State dinosaur');
INSERT INTO `symbol` (`symbol_name`, `description`) VALUES ('flower', 'State flower');

COMMIT;


-- -----------------------------------------------------
-- Data for table `state_symbol`
-- -----------------------------------------------------
START TRANSACTION;
USE `statesdb`;
INSERT INTO `state_symbol` (`id`, `abbreviation`, `symbol_name`, `symbol`) VALUES (1, 'CO', 'bird', 'Lark Bunting');
INSERT INTO `state_symbol` (`id`, `abbreviation`, `symbol_name`, `symbol`) VALUES (2, 'CO', 'flower', 'Columbine');
INSERT INTO `state_symbol` (`id`, `abbreviation`, `symbol_name`, `symbol`) VALUES (3, 'CO', 'dinosaur', 'Stegosaurus');
INSERT INTO `state_symbol` (`id`, `abbreviation`, `symbol_name`, `symbol`) VALUES (4, 'TX', 'flower', 'Blue Bonnet');
INSERT INTO `state_symbol` (`id`, `abbreviation`, `symbol_name`, `symbol`) VALUES (5, 'CO', 'song', 'Rocky Mountain High');

COMMIT;
