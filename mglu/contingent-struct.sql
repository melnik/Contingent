-- MySQL dump 10.11
--
-- Host: localhost    Database: contingent
-- ------------------------------------------------------
-- Server version	5.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abiturient_category`
--

DROP TABLE IF EXISTS `abiturient_category`;
CREATE TABLE `abiturient_category` (
  `abiturient_category_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  PRIMARY KEY  (`abiturient_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Table structure for table `abiturient_medal`
--

DROP TABLE IF EXISTS `abiturient_medal`;
CREATE TABLE `abiturient_medal` (
  `abiturient_medal_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`abiturient_medal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Table structure for table `abiturient_school`
--

DROP TABLE IF EXISTS `abiturient_school`;
CREATE TABLE `abiturient_school` (
  `abiturient_school_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`abiturient_school_id`)
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

--
-- Table structure for table `address_1`
--

DROP TABLE IF EXISTS `address_1`;
CREATE TABLE `address_1` (
  `address_1_id` char(2) NOT NULL default '',
  `level` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  `code` varchar(11) default NULL,
  `post_index` varchar(6) default NULL,
  PRIMARY KEY  (`address_1_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `address_2`
--

DROP TABLE IF EXISTS `address_2`;
CREATE TABLE `address_2` (
  `address_1_id` char(2) NOT NULL default '',
  `address_2_id` varchar(15) NOT NULL default '',
  `level` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  `code` varchar(11) default NULL,
  `post_index` varchar(6) default NULL,
  PRIMARY KEY  (`address_2_id`),
  KEY `address_1_id` (`address_1_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `address_3`
--

DROP TABLE IF EXISTS `address_3`;
CREATE TABLE `address_3` (
  `address_2_id` varchar(5) NOT NULL default '',
  `address_3_id` varchar(15) NOT NULL default '',
  `level` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  `code` varchar(11) default NULL,
  `post_index` varchar(6) default NULL,
  PRIMARY KEY  (`address_3_id`),
  KEY `address_2_id` (`address_2_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `address_4`
--

DROP TABLE IF EXISTS `address_4`;
CREATE TABLE `address_4` (
  `address_3_id` varchar(8) NOT NULL default '',
  `address_4_id` varchar(15) NOT NULL default '',
  `level` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  `code` varchar(11) default NULL,
  `post_index` varchar(6) default NULL,
  PRIMARY KEY  (`address_4_id`),
  KEY `address_3_id` (`address_3_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `address_5`
--

DROP TABLE IF EXISTS `address_5`;
CREATE TABLE `address_5` (
  `address_4_id` varchar(11) NOT NULL default '',
  `address_5_id` varchar(15) NOT NULL default '',
  `level` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL default '',
  `code` varchar(11) default NULL,
  `post_index` varchar(6) default NULL,
  PRIMARY KEY  (`address_5_id`),
  KEY `address_4_id` (`address_4_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
CREATE TABLE `applicant` (
  `applicant_id` int(11) NOT NULL auto_increment,
  `first_name` varchar(200) default NULL,
  `last_name` varchar(200) default NULL,
  `father_name` varchar(200) default NULL,
  `card_number` varchar(20) default NULL,
  `faculty_id` int(11) default NULL,
  `gender_id` int(11) default NULL,
  `birth_date` date default NULL,
  `citizenship_id` int(11) default NULL,
  `category` set('foreign','disabled') NOT NULL default '',
  `group_name` varchar(64) default NULL,
  PRIMARY KEY  (`applicant_id`),
  KEY `last_name` (`last_name`),
  KEY `first_name` (`first_name`),
  KEY `father_name` (`father_name`),
  KEY `card_number` (`card_number`),
  KEY `faculty_id` (`faculty_id`),
  KEY `gender_id` (`gender_id`),
  KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `citizenship`
--

DROP TABLE IF EXISTS `citizenship`;
CREATE TABLE `citizenship` (
  `citizenship_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `code` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`citizenship_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `college_id` int(11) NOT NULL auto_increment,
  `short_name` varchar(200) default NULL,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`college_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `code` char(3) default NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
CREATE TABLE `degree` (
  `name` varchar(32) NOT NULL default '',
  `degree_code` char(2) NOT NULL default '00',
  PRIMARY KEY  (`degree_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `faculty_id` int(11) default NULL,
  `department_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `department_num` int(11) default NULL,
  PRIMARY KEY  (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

--
-- Table structure for table `education_degree`
--

DROP TABLE IF EXISTS `education_degree`;
CREATE TABLE `education_degree` (
  `education_degree_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`education_degree_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Table structure for table `education_level`
--

DROP TABLE IF EXISTS `education_level`;
CREATE TABLE `education_level` (
  `education_level_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `code` varchar(5) default NULL,
  PRIMARY KEY  (`education_level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Table structure for table `educational_organization_kind`
--

DROP TABLE IF EXISTS `educational_organization_kind`;
CREATE TABLE `educational_organization_kind` (
  `educational_organization_kind_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `code` varchar(5) default NULL,
  PRIMARY KEY  (`educational_organization_kind_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Table structure for table `educational_organization_type`
--

DROP TABLE IF EXISTS `educational_organization_type`;
CREATE TABLE `educational_organization_type` (
  `educational_organization_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `code` varchar(5) default NULL,
  PRIMARY KEY  (`educational_organization_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `short_name` varchar(100) default NULL,
  `letter` char(1) NOT NULL default '',
  `college_id` int(11) default NULL,
  `category` set('foreign','disabled') NOT NULL default '',
  PRIMARY KEY  (`faculty_id`),
  KEY `name` (`name`),
  KEY `short_name` (`short_name`),
  KEY `college_id` (`college_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Table structure for table `final_education_document_type`
--

DROP TABLE IF EXISTS `final_education_document_type`;
CREATE TABLE `final_education_document_type` (
  `final_education_document_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`final_education_document_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL auto_increment,
  `name` varchar(8) NOT NULL default '',
  `code` varchar(4) default NULL,
  PRIMARY KEY  (`gender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `group_id` int(11) NOT NULL auto_increment,
  `start_year` int(11) default NULL,
  `group_num` int(11) default NULL,
  `department_id` int(11) default NULL,
  `speciality_code` varchar(10) default NULL,
  `sub_speciality_code` varchar(10) default NULL,
  `current_term_number` int(11) default NULL,
  `__insert_id` int(11) default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7924 DEFAULT CHARSET=utf8;

--
-- Table structure for table `identity_document`
--

DROP TABLE IF EXISTS `identity_document`;
CREATE TABLE `identity_document` (
  `identity_document_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  PRIMARY KEY  (`identity_document_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Table structure for table `identity_document_type`
--

DROP TABLE IF EXISTS `identity_document_type`;
CREATE TABLE `identity_document_type` (
  `identity_document_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  PRIMARY KEY  (`identity_document_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Table structure for table `initial_education_document_type`
--

DROP TABLE IF EXISTS `initial_education_document_type`;
CREATE TABLE `initial_education_document_type` (
  `initial_education_document_type_id` int(11) NOT NULL default '0',
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`initial_education_document_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `military`
--

DROP TABLE IF EXISTS `military`;
CREATE TABLE `military` (
  `military_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`military_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL auto_increment,
  `subject` varchar(255) NOT NULL default '',
  `body` mediumtext NOT NULL,
  `news_date` date NOT NULL default '0000-00-00',
  `user_id` int(11) NOT NULL default '0',
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`news_id`),
  KEY `news_date` (`news_date`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL auto_increment,
  `order_type_id` int(11) NOT NULL default '0',
  `order_status_id` int(11) NOT NULL default '0',
  `faculty_id` int(11) default NULL,
  `number` varchar(16) default NULL,
  `date_created` date NOT NULL default '0000-00-00',
  `date_activated` date default NULL,
  `attributes` mediumtext,
  `html` mediumtext,
  `creator_id` int(11) default NULL,
  `__insert_id` int(11) default NULL,
  `__updated__` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`order_id`),
  KEY `order_type_id` (`order_type_id`),
  KEY `order_status_id` (`order_status_id`),
  KEY `faculty_id` (`faculty_id`),
  KEY `number` (`number`),
  KEY `date_created` (`date_created`),
  KEY `date_activated` (`date_activated`),
  KEY `__updated__` (`__updated__`)
) ENGINE=MyISAM AUTO_INCREMENT=82657 DEFAULT CHARSET=utf8;

--
-- Table structure for table `order_group`
--

DROP TABLE IF EXISTS `order_group`;
CREATE TABLE `order_group` (
  `order_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  `attributes` text,
  PRIMARY KEY  (`order_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`order_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `order_student`
--

DROP TABLE IF EXISTS `order_student`;
CREATE TABLE `order_student` (
  `order_id` int(11) NOT NULL default '0',
  `student_id` int(11) NOT NULL default '0',
  `paragraph_id` int(11) default '0',
  `attributes` text,
  PRIMARY KEY  (`order_id`,`student_id`),
  KEY `paragraph_id` (`paragraph_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `profession_code` varchar(6) NOT NULL default '',
  `name` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`profession_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `program_kind`
--

DROP TABLE IF EXISTS `program_kind`;
CREATE TABLE `program_kind` (
  `program_kind_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  PRIMARY KEY  (`program_kind_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` char(2) NOT NULL default '',
  `name` varchar(51) default NULL,
  `code` char(2) default NULL,
  PRIMARY KEY  (`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `permissions` set('student_edit','order_project','order_activate','user_edit','student_view_short','student_view','news_view','news_edit') NOT NULL default '',
  PRIMARY KEY  (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Table structure for table `scholarship`
--

DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `scholarship_id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`scholarship_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL auto_increment,
  `first_name` varchar(200) default NULL,
  `last_name` varchar(200) default NULL,
  `father_name` varchar(200) default NULL,
  `card_number` varchar(20) default NULL,
  `group_id` int(11) default NULL,
  `student_state_id` int(11) default NULL,
  `student_status_id` int(11) default NULL,
  `study_type_id` int(11) default NULL,
  `gender_id` int(11) default NULL,
  `dormitory` tinyint(1) NOT NULL default '0',
  `last_update` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `__insert_id` int(11) default NULL,
  `birth_date` date default NULL,
  `citizenship_id` int(11) default NULL,
  `liabilities` tinyint(1) NOT NULL default '0',
  `profession_code` varchar(6) default NULL,
  `specialization_code` char(2) default NULL,
  `degree_code` char(2) default NULL,
  `category` set('foreign','disabled') NOT NULL default '',
  `scholarship_id` int(11) default NULL,
  `military_id` int(11) default NULL,
  PRIMARY KEY  (`student_id`),
  KEY `last_name` (`last_name`),
  KEY `first_name` (`first_name`),
  KEY `father_name` (`father_name`),
  KEY `card_number` (`card_number`),
  KEY `group_id` (`group_id`),
  KEY `dormitory` (`dormitory`),
  KEY `gender_id` (`gender_id`),
  KEY `student_state_id` (`student_state_id`),
  KEY `student_status_id` (`student_status_id`),
  KEY `study_type_id` (`study_type_id`),
  KEY `liabilities` (`liabilities`),
  KEY `category` (`category`),
  KEY `degree_code` (`degree_code`),
  KEY `specialization_code` (`specialization_code`)
) ENGINE=MyISAM AUTO_INCREMENT=114417 DEFAULT CHARSET=utf8;

--
-- Table structure for table `student_common`
--

DROP TABLE IF EXISTS `student_common`;
CREATE TABLE `student_common` (
  `student_id` int(11) NOT NULL default '0',
  `birth_place` text,
  `documents` text,
  `contacts` text,
  PRIMARY KEY  (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `student_education_basic`
--

DROP TABLE IF EXISTS `student_education_basic`;
CREATE TABLE `student_education_basic` (
  `student_id` int(11) NOT NULL default '0',
  `level_id` int(11) default NULL,
  `organization` text,
  `document` text,
  `specialization` text,
  `abiturient_category_id` int(11) default NULL,
  `abiturient_medal_id` int(11) default NULL,
  `abiturient_school_id` int(11) default NULL,
  `cert_marks` text,
  `exam_marks` text,
  PRIMARY KEY  (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `student_education_current`
--

DROP TABLE IF EXISTS `student_education_current`;
CREATE TABLE `student_education_current` (
  `student_id` int(11) NOT NULL default '0',
  `study_form_id` int(11) default NULL,
  `program_kind_id` int(11) default NULL,
  `specialization` varchar(250) default NULL,
  `post_university` text,
  `expelation` text,
  PRIMARY KEY  (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `student_military`
--

DROP TABLE IF EXISTS `student_military`;
CREATE TABLE `student_military` (
  `student_id` int(11) NOT NULL default '0',
  `reserve_category` varchar(200) default NULL,
  `rank` varchar(100) default NULL,
  `profile` varchar(200) default NULL,
  `speciality` varchar(150) default NULL,
  `fitness` text,
  `registration` text,
  `education` text,
  PRIMARY KEY  (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `student_state`
--

DROP TABLE IF EXISTS `student_state`;
CREATE TABLE `student_state` (
  `student_state_id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`student_state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Table structure for table `student_status`
--

DROP TABLE IF EXISTS `student_status`;
CREATE TABLE `student_status` (
  `student_status_id` int(11) NOT NULL auto_increment,
  `name` varchar(120) default NULL,
  PRIMARY KEY  (`student_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Table structure for table `study_form`
--

DROP TABLE IF EXISTS `study_form`;
CREATE TABLE `study_form` (
  `study_form_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `code` varchar(5) default NULL,
  PRIMARY KEY  (`study_form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Table structure for table `study_type`
--

DROP TABLE IF EXISTS `study_type`;
CREATE TABLE `study_type` (
  `study_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  PRIMARY KEY  (`study_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `login` varchar(200) character set utf8 collate utf8_bin NOT NULL default '',
  `password_hash` varchar(200) default NULL,
  `faculty_id` int(11) default NULL,
  `role_id` int(11) NOT NULL default '0',
  `auth_cookie` varchar(40) default NULL,
  `full_name` varchar(128) NOT NULL default '',
  `disabled` tinyint(1) NOT NULL default '0',
  `ssl_serial` int(11) default NULL,
  PRIMARY KEY  (`user_id`),
  KEY `role_id` (`role_id`),
  KEY `disabled` (`disabled`),
  KEY `ssl_serial` (`ssl_serial`)
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-04-15  9:35:58
