DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `scholarship_id` int(11) PRIMARY KEY auto_increment,
  `name` varchar(200) default NULL
);

INSERT INTO `scholarship` VALUES
    (1, 'государственная академическая стипендия'),
    (2, 'повышенная государственная академическая стипендия'),
    
    (3, 'стипендия Мэрии г. Москвы'),
    (4, 'стипендия Ученого Совета МГТУ им. Н. Э. Баумана'),
    (5, 'стипендия Ученого Совета факультета'),
    (6, 'именная стипендия Л. А. Чижевского')
;

ALTER TABLE `student` ADD COLUMN scholarship_id INT DEFAULT NULL;
