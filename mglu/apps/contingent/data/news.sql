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
);
