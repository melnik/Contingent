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
-- Table structure for table `special_enrollment`
--

DROP TABLE IF EXISTS `special_enrollment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `special_enrollment` (
  `special_enrollment_code` char(6) PRIMARY KEY,
  `parent_code` char(6),
  `name` varchar(128) default NULL,
  `agreement` varchar(255) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `special_enrollment`
--

LOCK TABLES `special_enrollment` WRITE;
/*!40000 ALTER TABLE `special_enrollment` DISABLE KEYS */;
INSERT INTO special_enrollment(special_enrollment_code, parent_code, name, agreement) VALUES
	('100000', NULL, 'для оборонно-промышленного комплекса', NULL),
		('101000', '100000', 'Федеральное агентство по атомной энергетике', 'Росатом (приказ Рособразования от 21.05.2008 №487)'),
			('101001', '101000', 'ФГУП "ВНИИА им. Н.Л.Духова', NULL),
		('102000', '100000', 'Федеральное агентство по промышленности', 'Роспром (приказ Рособразования от 27.05.2008 №513)'),
			('102001', '102000', 'ОАО Корпорация "Тактическое ракетное вооружение', NULL),
			('102002', '102000', 'ФГУП Московский Радиотехнический институт "РАН"', NULL),
			('102003', '102000', 'ФГУП "ЦНИИ автоматики и гидравлики"', NULL),
			('102004', '102000', 'ФГУП "ВИАМ"', NULL),
			('102005', '102000', 'ФГУП "НИТИ им. Снегирева"', NULL),
			('102006', '102000', 'ФГУП "НИМИ"', NULL),
		('103000', '100000', 'Федеральное космическое агентство',  'Роскосмос (Приказ Рособразования от 21.05.2008 №488)'),
			('103001', '103000', 'ФГУП "РНИИ КП"', NULL),
			('103002', '103000', 'ОАО Пермский завод "Машиностроитель"', NULL),
			('103003', '103000', 'ФГУП "НПЦ АП"', NULL),
			('103004', '103000', 'ФГУП ЦНИИ "Комета"', NULL),
			('103005', '103000', 'ФГУП "ГКНПЦ им. Н.В.Хруничева"', NULL),
			('103006', '103000', 'ФГУП "НИИЭМ"', NULL),
			('103007', '103000', 'ОАО "РКК Энергия"', NULL),
			('103008', '103000', 'ОАО "НПП Геофизика"', NULL),
			('103009', '103000', 'ФГУП "НПО ИТ"', NULL),
			('103010', '103000', 'ФГУП "ЦЭНКИ"', NULL),
			('103011', '103000', 'ОАО "Композит"', NULL),
			('103012', '103000', 'ФГУП "КБОМ"', NULL),
			('103013', '103000', 'ФГУП "НИИ ПП"', NULL),
	('200000', NULL, 'для целевой контрактной подготовки', NULL),
		('201000', '200000', 'Федеральное агентство по атомной энергетике',  'Росатом (договор от 14.12.2007 №03-1-31/748ц)'),
		('202000', '200000', 'в/ч 25550', 'соглашение о сотрудничестве от 20.05.2004 г., именной список абитуриентов исх. в/ч 25500 от 05.06.2008 №14/5/5059'),
		('203000', '200000', 'Федеральное агенство по промышленности', 'Роспром (соглашение о сотрудничестве от 20.05.2007 г.)'),
	('300000', NULL, 'на основе заявок от Министерства Обороны РФ', 'Миобророны РФ (приказ Рособоазования от 28.05.2008 №525)'),
	('400000', NULL, 'для регионов России', NULL),
		('401000', '400000', 'Республика Калмыкия', 'Республика Калмыкия (приказ Рособоазования от 10.06.2008 №647)'),
		('402000', '400000', 'Республика Северная Осетия-Алания', 'Республика Северная Осетия-Алания (приказ Рособоазования от 10.06.2008 №642)'),
		('403000', '400000', 'Республика Дагестан', 'Республика Дагестан (приказ Рособоазования от 10.06.2008 №644)'),
		('404000', '400000', 'Республика Ингушетия', 'Республика Ингушетия (приказ Рособоазования от 10.06.2008 №645)'),
		('405000', '400000', 'Карачаево-Черкесская Республика', 'Карачаево-Черкесская республика (приказ Рособоазования от 10.06.2008 №648)'),
		('406000', '400000', 'Кабардино-Балкарская Республика', 'Кабардино-Балкарская Республика (приказ Рособоазования от 10.06.2008 №646)');
/*!40000 ALTER TABLE `special_enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
