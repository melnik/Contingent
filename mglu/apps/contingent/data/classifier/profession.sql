DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
	`profession_code` varchar(6) NOT NULL default '',
	`name` varchar(128) NOT NULL default '',
	PRIMARY KEY (`profession_code`)
) TYPE=MyISAM;

--
-- Специальности подготовки дипломированных специалистов
--

INSERT INTO `profession` VALUES ('030501', 'Юриспруденция');
INSERT INTO `profession` VALUES ('080502', 'Экономика и управление на предприятии (по отраслям)');
INSERT INTO `profession` VALUES ('080506', 'Логистика');
INSERT INTO `profession` VALUES ('080507', 'Менеджмент организации');
INSERT INTO `profession` VALUES ('090105', 'Комплексное обеспечение информационной безопасности автоматизированных систем');
INSERT INTO `profession` VALUES ('140202', 'Нетрадиционные и возобновляемые источники энергии');
INSERT INTO `profession` VALUES ('140305', 'Ядерные реакторы и энергетические установки');
INSERT INTO `profession` VALUES ('140401', 'Техника и физика низких температур');
INSERT INTO `profession` VALUES ('140402', 'Теплофизика');
INSERT INTO `profession` VALUES ('140501', 'Двигатели внутреннего сгорания');
INSERT INTO `profession` VALUES ('140503', 'Газотурбинные, паротурбинные установки и двигатели');
INSERT INTO `profession` VALUES ('140504', 'Холодильная, криогенная техника и кондиционирование');
INSERT INTO `profession` VALUES ('140505', 'Плазменные энергетические установки');
INSERT INTO `profession` VALUES ('150201', 'Машины и технология обработки металлов давлением');
INSERT INTO `profession` VALUES ('150202', 'Оборудование и технология сварочного производства');
INSERT INTO `profession` VALUES ('150204', 'Машины и технология литейного производства');
INSERT INTO `profession` VALUES ('150206', 'Машины и технология высокоэффективных процессов обработки материалов');
INSERT INTO `profession` VALUES ('150207', 'Реновация средств и объектов материального производства в машиностроении');
INSERT INTO `profession` VALUES ('150301', 'Динамика и прочность машин');
INSERT INTO `profession` VALUES ('150401', 'Проектирование технических и технологических комплексов');
INSERT INTO `profession` VALUES ('150404', 'Металлургические машины и оборудование');
INSERT INTO `profession` VALUES ('150501', 'Материаловедение в машиностроении');
INSERT INTO `profession` VALUES ('150502', 'Конструирование и производство изделий из композиционных материалов');
INSERT INTO `profession` VALUES ('150801', 'Вакуумная и компрессорная техника физических установок');
INSERT INTO `profession` VALUES ('150802', 'Гидравлические машины, гидроприводы и гидропневмоавтоматика');
INSERT INTO `profession` VALUES ('151001', 'Технология машиностроения');
INSERT INTO `profession` VALUES ('151002', 'Металлорежущие станки и комплексы');
INSERT INTO `profession` VALUES ('151003', 'Инструментальные системы машиностроительных производств');
INSERT INTO `profession` VALUES ('160302', 'Ракетные двигатели');
INSERT INTO `profession` VALUES ('160303', 'Электроракетные двигатели и энергетические установки');
INSERT INTO `profession` VALUES ('160402', 'Приборы и системы ориентации, стабилизации и навигации');
INSERT INTO `profession` VALUES ('160403', 'Системы управления летательными аппаратами');
INSERT INTO `profession` VALUES ('160703', 'Динамика полета и управление движением летательных аппаратов');
INSERT INTO `profession` VALUES ('160801', 'Ракетостроение');
INSERT INTO `profession` VALUES ('160802', 'Космические летательные аппараты и разгонные блоки');
INSERT INTO `profession` VALUES ('160803', 'Стартовые и технические комплексы ракет и космических аппаратов');
INSERT INTO `profession` VALUES ('160804', 'Системы жизнеобеспечения и защиты ракетно-космических аппаратов');
INSERT INTO `profession` VALUES ('170102', 'Стрелково-пушечное, артиллерийское и ракетное оружие');
INSERT INTO `profession` VALUES ('170103', 'Средства поражения и боеприпасы');
INSERT INTO `profession` VALUES ('190201', 'Автомобиле- и тракторостроение');
INSERT INTO `profession` VALUES ('190202', 'Многоцелевые гусеничные и колесные машины');
INSERT INTO `profession` VALUES ('190205', 'Подъемно-транспортные, строительные, дорожные машины и оборудование');
INSERT INTO `profession` VALUES ('200201', 'Лазерная техника и лазерные технологии');
INSERT INTO `profession` VALUES ('200203', 'Оптико-электронные приборы и системы');
INSERT INTO `profession` VALUES ('200402', 'Инженерное дело в медико-биологической практике');
INSERT INTO `profession` VALUES ('200501', 'Метрология и метрологическое обеспечение');
INSERT INTO `profession` VALUES ('200503', 'Стандартизация и сертификация');
INSERT INTO `profession` VALUES ('210107', 'Электронное машиностроение');
INSERT INTO `profession` VALUES ('210201', 'Проектирование и технология радиоэлектронных средств');
INSERT INTO `profession` VALUES ('210202', 'Проектирование и технология электронно-вычислительных средств');
INSERT INTO `profession` VALUES ('210304', 'Радиоэлектронные системы');
INSERT INTO `profession` VALUES ('210402', 'Роботы и робототехнические системы');
INSERT INTO `profession` VALUES ('220203', 'Автономные информационные и управляющие системы');
INSERT INTO `profession` VALUES ('220301', 'Автоматизация технологических процессов и производств (по отраслям)');
INSERT INTO `profession` VALUES ('220401', 'Мехатроника');
INSERT INTO `profession` VALUES ('220402', 'Роботы и робототехнические системы');
INSERT INTO `profession` VALUES ('230101', 'Вычислительные машины, комплексы, системы и сети');
INSERT INTO `profession` VALUES ('230102', 'Автоматизированные системы обработки информации и управления');
INSERT INTO `profession` VALUES ('230104', 'Системы автоматизированного проектирования');
INSERT INTO `profession` VALUES ('230105', 'Программное обеспечение вычислительной техники и автоматизированных систем');
INSERT INTO `profession` VALUES ('230201', 'Информационные системы и технологии');
INSERT INTO `profession` VALUES ('230401', 'Прикладная математика');
INSERT INTO `profession` VALUES ('280101', 'Безопасность жизнедеятельности в техносфере ресурсов');
INSERT INTO `profession` VALUES ('280201', 'Охрана окружающей среды и рациональное использование природных ресурсов');

--
-- Направления подготовки бакалавров и магистров
--

INSERT INTO `profession` VALUES ('010200', 'Математика, прикладная математика');
INSERT INTO `profession` VALUES ('080500', 'Менеджмент');
INSERT INTO `profession` VALUES ('140200', 'Электроэнергетика');
INSERT INTO `profession` VALUES ('140300', 'Ядерная физика и технологии');
INSERT INTO `profession` VALUES ('140400', 'Техническая физика');
INSERT INTO `profession` VALUES ('140500', 'Энергомашиностроение');
INSERT INTO `profession` VALUES ('150200', 'Машиностроительные технологии и оборудование');
INSERT INTO `profession` VALUES ('150300', 'Прикладная механика');
INSERT INTO `profession` VALUES ('150400', 'Технологические машины и оборудование');
INSERT INTO `profession` VALUES ('150600', 'Материаловедение, технологии материалов и покрытий');
INSERT INTO `profession` VALUES ('150800', 'Гидравлическая, вакуумная и компрессорная техника');
INSERT INTO `profession` VALUES ('150900', 'Технология, оборудование и автоматизация машиностроительных производств');
INSERT INTO `profession` VALUES ('151000', 'Конструкторско-технологическое обеспечение машиностроительных производств');
INSERT INTO `profession` VALUES ('160100', 'Авиа- и ракетостроение');
INSERT INTO `profession` VALUES ('160300', 'Двигатели летательных аппаратов');
INSERT INTO `profession` VALUES ('160400', 'Системы управления движением и навигация');
INSERT INTO `profession` VALUES ('160700', 'Гидроаэродинамика и динамика полета');
INSERT INTO `profession` VALUES ('160800', 'Ракетостроение и космонавтика');
INSERT INTO `profession` VALUES ('170100', 'Оружие и системы вооружения');
INSERT INTO `profession` VALUES ('190100', 'Наземные транспортные системы');
INSERT INTO `profession` VALUES ('190200', 'Транспортные машины и транспортно-технологические комплексы');
INSERT INTO `profession` VALUES ('200200', 'Оптотехника');
INSERT INTO `profession` VALUES ('200300', 'Биомедицинская инженерия');
INSERT INTO `profession` VALUES ('200400', 'Биомедицинская техника');
INSERT INTO `profession` VALUES ('200500', 'Метрология, стандартизация и сертификация');
INSERT INTO `profession` VALUES ('210100', 'Электроника и микроэлектроника');
INSERT INTO `profession` VALUES ('210200', 'Проектирование и технологии электронных средств');
INSERT INTO `profession` VALUES ('210300', 'Радиотехника');
INSERT INTO `profession` VALUES ('220200', 'Автоматизация и управление');
INSERT INTO `profession` VALUES ('220300', 'Автоматизированные технологии и производства');
INSERT INTO `profession` VALUES ('220400', 'Мехатроника и робототехника');
INSERT INTO `profession` VALUES ('230100', 'Информатика и вычислительная техника');
INSERT INTO `profession` VALUES ('230200', 'Информационные системы');
INSERT INTO `profession` VALUES ('230400', 'Прикладная математика');
INSERT INTO `profession` VALUES ('280100', 'Безопасность жизнедеятельности');
INSERT INTO `profession` VALUES ('280200', 'Защита окружающей среды');
