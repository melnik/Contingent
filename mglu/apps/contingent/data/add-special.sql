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
  `special_enrollment_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  `agreement` varchar(255) default NULL,
  PRIMARY KEY  (`special_enrollment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `special_enrollment`
--

LOCK TABLES `special_enrollment` WRITE;
/*!40000 ALTER TABLE `special_enrollment` DISABLE KEYS */;
INSERT INTO special_enrollment(special_enrollment_id, name, agreement) VALUES
	( 1, 'для оборонно-промышленного комплекса: Росатом',              'приказ Рособразования от 21.05.2008 №487'),
	( 2, 'для оборонно-промышленного комплекса: Роскосмос',            'приказ Рособразования от 21.05.2008 №488'),
	( 3, 'для оборонно-промышленного комплекса: Роспром',              'приказ Рособразования от 27.05.2008 №514'),
	( 4, 'для целевой контрактной подготовки: Росатом',                'договор от 14.12.2007 №03-1-31/748ц'),
	( 5, 'для целевой контрактной подготовки: ',                       'соглашение о сотрудничестве от 20.05.2004 г., именной список абитуриентов исх. в/ч 25500 от 05.06.2008 №14/5/5059'),
	(13, 'для целевой контрактной подготовки: Роспром',                'соглашение о сотрудничестве от 20.05.2007 г.'),
	( 6, 'на основе заявок от Министерства Обороны РФ: Минобороны РФ', 'приказ Рособоазования от 28.05.2008 №525'),
	( 7, 'для регионов России: Республика Калмыкия',                   'приказ Рособоазования от 10.06.2008 №647'),
	( 8, 'для регионов России: Республика Северная Осетия-Алания',     'приказ Рособоазования от 10.06.2008 №642'),
	( 9, 'для регионов России: Республика Дагестан',                   'приказ Рособоазования от 10.06.2008 №644'),
	(10, 'для регионов России: Республика Ингушетия',                  'приказ Рособоазования от 10.06.2008 №645'),
	(11, 'для регионов России: Карачаево-Черкесская Республика',       'приказ Рособоазования от 10.06.2008 №648'),
	(12, 'для регионов России: Кабардино-Балкарская Республика',       'приказ Рособоазования от 10.06.2008 №646');
/*!40000 ALTER TABLE `special_enrollment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

ALTER TABLE student ADD COLUMN special_enrollment_id INT;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
