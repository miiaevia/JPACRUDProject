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
  `title` VARCHAR(100) NULL,
  `first_name` VARCHAR(100) NULL,
  `middle_initial` CHAR(10) NULL,
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
  `phone` VARCHAR(30) NULL,
  `website_url` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nonprofit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nonprofit` ;

CREATE TABLE IF NOT EXISTS `nonprofit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `abbreviation` VARCHAR(45) NULL,
  `name` VARCHAR(250) NOT NULL,
  `description` VARCHAR(5000) NULL,
  `cause` VARCHAR(200) NULL,
  `year_founded` INT UNSIGNED NULL,
  `address_id` INT UNSIGNED NULL,
  `image_url` VARCHAR(1000) NULL,
  `contact_id` INT UNSIGNED NULL,
  `president_id` INT NULL,
  `founder_id` INT NULL,
  `co_founder_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_id_idx` (`address_id` ASC),
  INDEX `fk_president_id_idx` (`president_id` ASC),
  INDEX `fk_founder_id_idx` (`founder_id` ASC),
  INDEX `fk_contact_id_idx` (`contact_id` ASC),
  INDEX `fk_co_founder_id_idx` (`co_founder_id` ASC),
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
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_co_founder_id`
    FOREIGN KEY (`co_founder_id`)
    REFERENCES `leaders` (`id`)
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
GRANT USAGE ON *.* TO npuser@localhost;
 DROP USER npuser@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'npuser'@'localhost' IDENTIFIED BY 'SBlack!!11';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'npuser'@'localhost';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'npuser'@'localhost';
GRANT SELECT, INSERT, TRIGGER ON TABLE * TO 'npuser'@'localhost';
GRANT SELECT, INSERT, TRIGGER ON TABLE * TO 'npuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `nonprofitsdb`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `county`, `state`, `country`) VALUES (1, '100 West Harrison St.', 'North Tower, Suite 550', 'Seattle', NULL, 'Washington', 'United States');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `county`, `state`, `country`) VALUES (2, '3578 Hartsel Dr.', 'Unit E #120', 'Colorado Springs', NULL, 'Colorado', 'United States');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `county`, `state`, `country`) VALUES (3, '13123 E. 16th Ave.', 'B390', 'Aurora', NULL, 'Colorado', 'United States');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `county`, `state`, `country`) VALUES (4, '4812 S. College Ave.', NULL, 'Fort Collins', NULL, 'Colorado', 'United States');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `county`, `state`, `country`) VALUES (5, '14780 N. 107th', NULL, 'Longmont', NULL, 'Colorado', 'United States');

COMMIT;


-- -----------------------------------------------------
-- Data for table `leaders`
-- -----------------------------------------------------
START TRANSACTION;
USE `nonprofitsdb`;
INSERT INTO `leaders` (`id`, `title`, `first_name`, `middle_initial`, `last_name`, `active`) VALUES (1, 'Judge', 'David', 'W.', 'Soukup', 1);
INSERT INTO `leaders` (`id`, `title`, `first_name`, `middle_initial`, `last_name`, `active`) VALUES (2, 'CEO', 'Tara', NULL, 'Perry', 1);
INSERT INTO `leaders` (`id`, `title`, `first_name`, `middle_initial`, `last_name`, `active`) VALUES (3, NULL, 'Brandi', NULL, 'Lea', 1);
INSERT INTO `leaders` (`id`, `title`, `first_name`, `middle_initial`, `last_name`, `active`) VALUES (4, NULL, 'Akwango Anne Grace ', NULL, 'Elotu', 1);
INSERT INTO `leaders` (`id`, `title`, `first_name`, `middle_initial`, `last_name`, `active`) VALUES (5, 'Dr.', 'C. Henry', NULL, 'Kempe', 0);
INSERT INTO `leaders` (`id`, `title`, `first_name`, `middle_initial`, `last_name`, `active`) VALUES (6, 'JD', 'John', 'D.', 'Faught.', 1);
INSERT INTO `leaders` (`id`, `title`, `first_name`, `middle_initial`, `last_name`, `active`) VALUES (7, 'Executive Director', 'Dorothy', NULL, 'Farrel', 1);
INSERT INTO `leaders` (`id`, `title`, `first_name`, `middle_initial`, `last_name`, `active`) VALUES (8, 'Executive Director', 'Randy', NULL, 'Schow', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `contact`
-- -----------------------------------------------------
START TRANSACTION;
USE `nonprofitsdb`;
INSERT INTO `contact` (`id`, `email`, `phone`, `website_url`) VALUES (1, NULL, '8006283233', 'http://www.casaforchildren.org/site/c.mtJSJ7MPIsE/b.5301295/k.BE9A/Home.htm');
INSERT INTO `contact` (`id`, `email`, `phone`, `website_url`) VALUES (2, 'brandi@beautyforashesuganda.org', '719.322.2273', 'http://www.beautyforashesuganda.org/');
INSERT INTO `contact` (`id`, `email`, `phone`, `website_url`) VALUES (3, NULL, NULL, 'http://www.kempe.org/');
INSERT INTO `contact` (`id`, `email`, `phone`, `website_url`) VALUES (4, NULL, '9704724204', 'http://savacenter.org/');
INSERT INTO `contact` (`id`, `email`, `phone`, `website_url`) VALUES (5, NULL, '3037766841', 'https://www.msch.org/');

COMMIT;


-- -----------------------------------------------------
-- Data for table `nonprofit`
-- -----------------------------------------------------
START TRANSACTION;
USE `nonprofitsdb`;
INSERT INTO `nonprofit` (`id`, `abbreviation`, `name`, `description`, `cause`, `year_founded`, `address_id`, `image_url`, `contact_id`, `president_id`, `founder_id`, `co_founder_id`) VALUES (1, 'CASA', 'Court Appointed Special Advocates', 'CASA volunteers are appointed by judges to advocate for the best interests of abused and neglected children in court and other settings. The primary responsibilities of a CASA volunteer are to: Gather information: Review documents and records, interview the children, family members and professionals in their lives.', 'Humanitarian - Local', 1977, 1, 'Web-Content/images/casa_logo.jpg', 1, 2, 1, NULL);
INSERT INTO `nonprofit` (`id`, `abbreviation`, `name`, `description`, `cause`, `year_founded`, `address_id`, `image_url`, `contact_id`, `president_id`, `founder_id`, `co_founder_id`) VALUES (2, NULL, 'Beauty For Ashes Uganda', 'Beauty for Ashes Uganda works towards long-term sustainable development and deep healing for single moms and widows in the Teso Region of Uganda.', 'Humanitarian - International', 2012, 2, 'Web-Content/images/bfa_uganda.gif', 2, 3, 3, 4);
INSERT INTO `nonprofit` (`id`, `abbreviation`, `name`, `description`, `cause`, `year_founded`, `address_id`, `image_url`, `contact_id`, `president_id`, `founder_id`, `co_founder_id`) VALUES (3, 'Kempe', 'The Kempe Foundation ', 'Kempe works to keep all children safe and healthy by supporting experts in the field, advocating for children and engaging with communities.\n\n', 'Humanitarian - Local', 1972, 3, NULL, 3, 6, 5, NULL);
INSERT INTO `nonprofit` (`id`, `abbreviation`, `name`, `description`, `cause`, `year_founded`, `address_id`, `image_url`, `contact_id`, `president_id`, `founder_id`, `co_founder_id`) VALUES (4, 'SAVA', 'Sexual Assault Victim Advocate Center', 'SAVA\'s mission is to provide crisis intervention, advocacy and counseling for all those affected by sexual violence and provide prevention programs through community outreach and education.', 'Humanitarian - Local', 1976, 4, 'Web-Content/images/sava_logo.jpg', 4, 7, NULL, NULL);
INSERT INTO `nonprofit` (`id`, `abbreviation`, `name`, `description`, `cause`, `year_founded`, `address_id`, `image_url`, `contact_id`, `president_id`, `founder_id`, `co_founder_id`) VALUES (5, 'MSCH', 'Mountain States Children\'s Home', 'Provides services to wounded children in an effort to meet their physical needs, heal their emotional hurts, challenge their minds and teach them moral principles, in order to reach the goals of reuniting them with their families or preparing them for independence.', 'Humanitarian', 1960, 5, 'Web-Contect/images/msch_logo.jpg', 5, 8, NULL, NULL);

COMMIT;


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

