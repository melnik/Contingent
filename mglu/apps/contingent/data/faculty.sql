ALTER TABLE `faculty` ADD `letter` CHAR( 1 ) NOT NULL AFTER `short_name`;

UPDATE `faculty` SET `letter` = '÷' WHERE `faculty_id` = '13';
UPDATE `faculty` SET `letter` = 'ì' WHERE `faculty_id` = '19';
UPDATE `faculty` SET `letter` = 'ú' WHERE `faculty_id` = '26';
UPDATE `faculty` SET `letter` = 'â' WHERE `faculty_id` = '7';
UPDATE `faculty` SET `letter` = 'õ' WHERE `faculty_id` = '1';
UPDATE `faculty` SET `letter` = 'ô' WHERE `faculty_id` = '9';
UPDATE `faculty` SET `letter` = 'ï' WHERE `faculty_id` = '22';
UPDATE `faculty` SET `letter` = 'á' WHERE `faculty_id` = '16';
UPDATE `faculty` SET `letter` = 'ò' WHERE `faculty_id` = '4';
UPDATE `faculty` SET `letter` = 'ð' WHERE `faculty_id` = '24';
UPDATE `faculty` SET `letter` = 'ì' WHERE `faculty_id` = '5';
UPDATE `faculty` SET `letter` = 'ð' WHERE `faculty_id` = '27';
UPDATE `faculty` SET `letter` = 'í' WHERE `faculty_id` = '6';
UPDATE `faculty` SET `letter` = 'ã' WHERE `faculty_id` = '23';
UPDATE `faculty` SET `letter` = 'æ' WHERE `faculty_id` = '3';
UPDATE `faculty` SET `letter` = 'ü' WHERE `faculty_id` = '11';
UPDATE `faculty` SET `letter` = 'à' WHERE `faculty_id` = '25';
