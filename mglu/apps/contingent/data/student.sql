ALTER TABLE `student` ADD `liabilities` TINYINT( 1 ) DEFAULT '0' NOT NULL;

ALTER TABLE `student` ADD INDEX ( `liabilities` );
