SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `klinika` DEFAULT CHARACTER SET utf8 ;
USE `klinika` ;

-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `accountant`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`accountant` (
  `accountant_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `address` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `phone` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`accountant_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `admin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`admin` (
  `admin_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`admin_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `appointment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`appointment` (
  `appointment_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `doctor_id` INT(11) NOT NULL ,
  `patient_id` INT(11) NOT NULL ,
  `status` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`appointment_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `bed`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`bed` (
  `bed_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `bed_number` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `type` LONGTEXT NOT NULL COMMENT 'ward,cabin,ICU' ,
  `status` INT(11) NOT NULL DEFAULT '0' COMMENT '0=unalloted;1=alloted' ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`bed_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `bed_allotment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`bed_allotment` (
  `bed_allotment_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `bed_id` INT(11) NOT NULL ,
  `patient_id` INT(11) NOT NULL ,
  `allotment_timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `discharge_timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`bed_allotment_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `blood_bank`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`blood_bank` (
  `blood_group_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `blood_group` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `status` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`blood_group_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `blood_donor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`blood_donor` (
  `blood_donor_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `blood_group` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `sex` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `age` INT(11) NOT NULL ,
  `phone` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `address` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `last_donation_timestamp` INT(11) NOT NULL ,
  PRIMARY KEY (`blood_donor_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `ci_sessions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`ci_sessions` (
  `id` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `ip_address` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `timestamp` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `data` BLOB NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `ci_sessions_timestamp` (`timestamp` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `currency`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`currency` (
  `currency_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `currency_code` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `currency_symbol` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `currency_name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`currency_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `department`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`department` (
  `department_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`department_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `diagnosis_report`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`diagnosis_report` (
  `diagnosis_report_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `report_type` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'xray,blood test' ,
  `document_type` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'text,photo' ,
  `file_name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `prescription_id` INT(11) NOT NULL ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `timestamp` INT(11) NOT NULL ,
  `laboratorist_id` INT(11) NOT NULL ,
  PRIMARY KEY (`diagnosis_report_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `doctor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`doctor` (
  `doctor_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `address` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `phone` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `department_id` INT(11) NOT NULL ,
  `profile` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`doctor_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `email_template`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`email_template` (
  `email_template_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `task` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `subject` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `body` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `instruction` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`email_template_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `form_element`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`form_element` (
  `form_element_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `type` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `html` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`form_element_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `invoice`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`invoice` (
  `invoice_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `invoice_number` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `patient_id` INT(11) NOT NULL ,
  `title` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `invoice_entries` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `creation_timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `due_timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `status` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'paid or unpaid' ,
  `vat_percentage` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `discount_amount` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`invoice_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `laboratorist`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`laboratorist` (
  `laboratorist_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `address` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `phone` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`laboratorist_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `language`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`language` (
  `phrase_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `phrase` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `english` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`phrase_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 200
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `medicine`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`medicine` (
  `medicine_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `medicine_category_id` INT(11) NOT NULL ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `price` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `manufacturing_company` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `status` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`medicine_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `medicine_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`medicine_category` (
  `medicine_category_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`medicine_category_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `message`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`message` (
  `message_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `message_thread_code` LONGTEXT NOT NULL ,
  `message` LONGTEXT NOT NULL ,
  `sender` LONGTEXT NOT NULL ,
  `timestamp` LONGTEXT NOT NULL ,
  `read_status` INT(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read' ,
  PRIMARY KEY (`message_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `message_thread`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`message_thread` (
  `message_thread_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `message_thread_code` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `sender` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `reciever` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `last_message_timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`message_thread_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `note`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`note` (
  `note_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `note` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `user_type` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `user_id` INT(11) NOT NULL ,
  `color` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `timestamp_create` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `timestamp_last_update` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`note_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `notice`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`notice` (
  `notice_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `title` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `start_timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `end_timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`notice_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `noticeboard`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`noticeboard` (
  `notice_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `notice_title` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `notice` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `create_timestamp` INT(11) NOT NULL ,
  PRIMARY KEY (`notice_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `nurse`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`nurse` (
  `nurse_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `address` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `phone` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`nurse_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `patient`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`patient` (
  `patient_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `address` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `phone` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `sex` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `birth_date` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `age` INT(11) NOT NULL ,
  `blood_group` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `account_opening_timestamp` INT(11) NOT NULL ,
  PRIMARY KEY (`patient_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `payment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`payment` (
  `payment_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `type` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'income expense' ,
  `amount` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `title` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `payment_method` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `invoice_number` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`payment_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `pharmacist`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`pharmacist` (
  `pharmacist_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `address` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `phone` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`pharmacist_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `prescription`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`prescription` (
  `prescription_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `doctor_id` INT(11) NOT NULL ,
  `patient_id` INT(11) NOT NULL ,
  `case_history` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `medication` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `note` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`prescription_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `receptionist`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`receptionist` (
  `receptionist_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `email` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `password` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `address` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `phone` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`receptionist_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `report`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`report` (
  `report_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `type` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'operation,birth,death' ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `timestamp` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `doctor_id` INT(11) NOT NULL ,
  `patient_id` INT(11) NOT NULL ,
  PRIMARY KEY (`report_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Databaza `klinika` - Tabela `settings`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `klinika`.`settings` (
  `settings_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `type` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `description` LONGTEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  PRIMARY KEY (`settings_id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1;

USE `klinika` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
