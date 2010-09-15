DROP TABLE IF EXISTS `applicant`;
CREATE TABLE `applicant` (
  `applicant_id` int(11) NOT NULL auto_increment,
  `first_name` varchar(200) default NULL,
  `last_name` varchar(200) default NULL,
  `father_name` varchar(200) default NULL,
  `faculty_id` int(11) default NULL,
  `gender_id` int(11) default NULL,
  `birth_date` date default NULL,
  `citizenship_id` int(11) default NULL,
  `group_name` varchar(16) default NULL,
  `category` set('foreign','disabled') NOT NULL default '',
  PRIMARY KEY  (`applicant_id`),
  KEY `last_name` (`last_name`),
  KEY `first_name` (`first_name`),
  KEY `father_name` (`father_name`),
  KEY `faculty_id` (`faculty_id`),
  KEY `gender_id` (`gender_id`),
  KEY `category` (`category`),
  KEY `group_name` (`group_name`)
);
