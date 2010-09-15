DROP TABLE IF EXISTS `abiturient_category`;
CREATE TABLE `abiturient_category` (
  `abiturient_category_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  PRIMARY KEY  (`abiturient_category_id`)
) TYPE=MyISAM;

INSERT INTO `abiturient_category` VALUES (1,'лауреат конкурса \"Космонавтика\"');
INSERT INTO `abiturient_category` VALUES (2,'лауреат конкурса \"Шаг в будущее\"');
INSERT INTO `abiturient_category` VALUES (3,'лауреат конкурса \"Шаг в будущее, Москва\"');
INSERT INTO `abiturient_category` VALUES (4,'абитуриент, награжденный золотой или серебряной медалью');
INSERT INTO `abiturient_category` VALUES (5,'абитуриент, окончивший образовательное учреждение профессионального образования с отличием');
INSERT INTO `abiturient_category` VALUES (6,'абитуриент, набравший проходной балл');
INSERT INTO `abiturient_category` VALUES (7,'абитуриент, набравший полупроходной балл');
INSERT INTO `abiturient_category` VALUES (8,'льготник');
