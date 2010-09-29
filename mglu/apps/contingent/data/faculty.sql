ALTER TABLE `faculty` ADD `letter` CHAR( 1 ) NOT NULL AFTER `short_name`;

UPDATE `faculty` SET `letter` = 'В' WHERE `faculty_id` = '13';
UPDATE `faculty` SET `letter` = 'Л' WHERE `faculty_id` = '19';
UPDATE `faculty` SET `letter` = 'З' WHERE `faculty_id` = '26';
UPDATE `faculty` SET `letter` = 'Б' WHERE `faculty_id` = '7';
UPDATE `faculty` SET `letter` = 'У' WHERE `faculty_id` = '1';
UPDATE `faculty` SET `letter` = 'Т' WHERE `faculty_id` = '9';
UPDATE `faculty` SET `letter` = 'О' WHERE `faculty_id` = '22';
UPDATE `faculty` SET `letter` = 'А' WHERE `faculty_id` = '16';
UPDATE `faculty` SET `letter` = 'Р' WHERE `faculty_id` = '4';
UPDATE `faculty` SET `letter` = 'П' WHERE `faculty_id` = '24';
UPDATE `faculty` SET `letter` = 'Л' WHERE `faculty_id` = '5';
UPDATE `faculty` SET `letter` = 'П' WHERE `faculty_id` = '27';
UPDATE `faculty` SET `letter` = 'М' WHERE `faculty_id` = '6';
UPDATE `faculty` SET `letter` = 'Ц' WHERE `faculty_id` = '23';
UPDATE `faculty` SET `letter` = 'Ф' WHERE `faculty_id` = '3';
UPDATE `faculty` SET `letter` = 'Э' WHERE `faculty_id` = '11';
UPDATE `faculty` SET `letter` = 'Ю' WHERE `faculty_id` = '25';
