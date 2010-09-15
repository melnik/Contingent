ALTER TABLE `user` ADD `ssl_serial` INT NULL ;
ALTER TABLE `user` ADD INDEX ( `ssl_serial` ) ;
