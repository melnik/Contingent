DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
	`order_status_id` int(11) NOT NULL default '0',
	`name` varchar(32) NOT NULL default '',
	PRIMARY KEY (`order_status_id`)
) TYPE=MyISAM;

INSERT INTO `order_status` VALUES (1, 'проект');
INSERT INTO `order_status` VALUES (2, 'в стадии подписания');
INSERT INTO `order_status` VALUES (3, 'содержит ошибки');
INSERT INTO `order_status` VALUES (4, 'введен в действие');
