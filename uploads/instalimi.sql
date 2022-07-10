-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 07, 2015 at 09:09 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databasa: `klinika`
--

-- --------------------------------------------------------

--
-- Struktura e tabeles `accountant`
--

DROP TABLE IF EXISTS `accountant`;
CREATE TABLE IF NOT EXISTS `accountant` (
  `accountant_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zbrazja e te dhenave te tabeles `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@klinika.al', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Struktura e tabeles `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointment_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `bed`
--

DROP TABLE IF EXISTS `bed`;
CREATE TABLE IF NOT EXISTS `bed` (
  `bed_id` int(11) NOT NULL,
  `bed_number` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` longtext NOT NULL COMMENT 'ward,cabin,ICU',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=unalloted;1=alloted',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `bed_allotment`
--

DROP TABLE IF EXISTS `bed_allotment`;
CREATE TABLE IF NOT EXISTS `bed_allotment` (
  `bed_allotment_id` int(11) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `allotment_timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discharge_timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `blood_bank`
--

DROP TABLE IF EXISTS `blood_bank`;
CREATE TABLE IF NOT EXISTS `blood_bank` (
  `blood_group_id` int(11) NOT NULL,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `blood_donor`
--

DROP TABLE IF EXISTS `blood_donor`;
CREATE TABLE IF NOT EXISTS `blood_donor` (
  `blood_donor_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_donation_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL,
  `currency_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currency_name` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `diagnosis_report`
--

DROP TABLE IF EXISTS `diagnosis_report`;
CREATE TABLE IF NOT EXISTS `diagnosis_report` (
  `diagnosis_report_id` int(11) NOT NULL,
  `report_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'xray,blood test',
  `document_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'text,photo',
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `laboratorist_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `doctor_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `profile` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `email_template`
--

DROP TABLE IF EXISTS `email_template`;
CREATE TABLE IF NOT EXISTS `email_template` (
  `email_template_id` int(11) NOT NULL,
  `task` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `instruction` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `form_element`
--

DROP TABLE IF EXISTS `form_element`;
CREATE TABLE IF NOT EXISTS `form_element` (
  `form_element_id` int(11) NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` longtext COLLATE utf8_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_entries` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `due_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  `vat_percentage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount_amount` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `laboratorist`
--

DROP TABLE IF EXISTS `laboratorist`;
CREATE TABLE IF NOT EXISTS `laboratorist` (
  `laboratorist_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `medicine_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` longtext COLLATE utf8_unicode_ci NOT NULL,
  `manufacturing_company` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `medicine_category`
--

DROP TABLE IF EXISTS `medicine_category`;
CREATE TABLE IF NOT EXISTS `medicine_category` (
  `medicine_category_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `message_thread`
--

DROP TABLE IF EXISTS `message_thread`;
CREATE TABLE IF NOT EXISTS `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `note_id` int(11) NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `color` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_create` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_last_update` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `start_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `end_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `noticeboard`
--

DROP TABLE IF EXISTS `noticeboard`;
CREATE TABLE IF NOT EXISTS `noticeboard` (
  `notice_id` int(11) NOT NULL,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `nurse`
--

DROP TABLE IF EXISTS `nurse`;
CREATE TABLE IF NOT EXISTS `nurse` (
  `nurse_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `blood_group` longtext COLLATE utf8_unicode_ci NOT NULL,
  `account_opening_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'income expense',
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_number` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
CREATE TABLE IF NOT EXISTS `pharmacist` (
  `pharmacist_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE IF NOT EXISTS `prescription` (
  `prescription_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `case_history` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medication` longtext COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
CREATE TABLE IF NOT EXISTS `receptionist` (
  `receptionist_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura e tabeles `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(11) NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'operation,birth,death',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura e tabeles `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `settings_id` int(11) NOT NULL,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Zbrazja e te dhenave per tabelen `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'Klinika Shendet i Mire Vlore'),
(2, 'system_title', 'Systemi Klinika Shendet i Mire Vlore'),
(3, 'address', 'Pavaresia, Vlore'),
(4, 'phone', '+355696919362'),
(5, 'paypal_email', 'payment@hotmail.com'),
(6, 'currency', 'usd'),
(7, 'system_email', 'admin@example.com'),
(8, 'buyer', '[ vendosni emrin tuaj te perdoruesit ]'),
(9, 'purchase_code', '[ vendosni kodin e porosise tuaj ketu ]'),
(11, 'language', 'shqip'),
(12, 'text_align', 'LTR'),
(13, 'system_currency_id', '1'),
(14, 'clickatell_user', '[EMRI I PERDORUESIT NE CLICKATELL]'),
(15, 'clickatell_password', '[PASSWORDI JUAJ NE CLICKATELL]'),
(16, 'clickatell_api_id', '[API ID-ja JUAJ NE CLICKATELL]');

--
-- Indekset per tabelat e zbrazura
--

--
-- Indekset per tabelen `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`accountant_id`);

--
-- Indekset per tabelen `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indekset per tabelen `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indekset per tabelen `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indekset per tabelen `bed_allotment`
--
ALTER TABLE `bed_allotment`
  ADD PRIMARY KEY (`bed_allotment_id`);

--
-- Indekset per tabelen `blood_bank`
--
ALTER TABLE `blood_bank`
  ADD PRIMARY KEY (`blood_group_id`);

--
-- Indekset per tabelen `blood_donor`
--
ALTER TABLE `blood_donor`
  ADD PRIMARY KEY (`blood_donor_id`);

--
-- Indekset per tabelen `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indekset per tabelen `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indekset per tabelen `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indekset per tabelen `diagnosis_report`
--
ALTER TABLE `diagnosis_report`
  ADD PRIMARY KEY (`diagnosis_report_id`);

--
-- Indekset per tabelen `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indekset per tabelen `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`email_template_id`);

--
-- Indekset per tabelen `form_element`
--
ALTER TABLE `form_element`
  ADD PRIMARY KEY (`form_element_id`);

--
-- Indekset per tabelen `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indekset per tabelen `laboratorist`
--
ALTER TABLE `laboratorist`
  ADD PRIMARY KEY (`laboratorist_id`);

--
-- Indekset per tabelen `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indekset per tabelen `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indekset per tabelen `medicine_category`
--
ALTER TABLE `medicine_category`
  ADD PRIMARY KEY (`medicine_category_id`);

--
-- Indekset per tabelen `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indekset per tabelen `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indekset per tabelen `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`note_id`);

--
-- Indekset per tabelen `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indekset per tabelen `noticeboard`
--
ALTER TABLE `noticeboard`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indekset per tabelen `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurse_id`);

--
-- Indekset per tabelen `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indekset per tabelen `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indekset per tabelen `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`pharmacist_id`);

--
-- Indekset per tabelen `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Indekset per tabelen `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`receptionist_id`);

--
-- Indekset per tabelen `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indekset per tabelen `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- AUTO_INCREMENT per tabelat e zbrazura
--

--
-- AUTO_INCREMENT per tabelen `accountant`
--
ALTER TABLE `accountant`
  MODIFY `accountant_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per tabelen `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `bed`
--
ALTER TABLE `bed`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `bed_allotment`
--
ALTER TABLE `bed_allotment`
  MODIFY `bed_allotment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `blood_bank`
--
ALTER TABLE `blood_bank`
  MODIFY `blood_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `blood_donor`
--
ALTER TABLE `blood_donor`
  MODIFY `blood_donor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `diagnosis_report`
--
ALTER TABLE `diagnosis_report`
  MODIFY `diagnosis_report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `email_template`
--
ALTER TABLE `email_template`
  MODIFY `email_template_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `form_element`
--
ALTER TABLE `form_element`
  MODIFY `form_element_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `laboratorist`
--
ALTER TABLE `laboratorist`
  MODIFY `laboratorist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `medicine_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `note`
--
ALTER TABLE `note`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `noticeboard`
--
ALTER TABLE `noticeboard`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurse_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `pharmacist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `receptionist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per tabelen `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
