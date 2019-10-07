package com.example.vo;

public class DataQueryVO {
	
//	CREATE TABLE `member` (
//	`num` INT(11) NOT NULL AUTO_INCREMENT,
//	`id` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`passwd` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`country` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`address` VARCHAR(150) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`language` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`job` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`gender` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`intro` VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`age` INT(11) NULL DEFAULT NULL,
//	`email` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`phone` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`join_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`model` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`image` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`likes` INT(11) NULL DEFAULT NULL,
//	`job_date` VARCHAR(3000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	PRIMARY KEY (`num`),
//	INDEX `id` (`id`)
//)
//COLLATE='utf8_unicode_ci'
//ENGINE=InnoDB
//AUTO_INCREMENT=6031
//;
	
//CREATE TABLE `blog` (
//	`b_num` INT(11) NOT NULL AUTO_INCREMENT,
//	`b_id` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`b_name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`b_model` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`b_image` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`b_likeCount` INT(11) UNSIGNED NOT NULL DEFAULT '1',
//	`b_likeMember` VARCHAR(10000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`b_title` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`b_content` VARCHAR(3000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`b_reg_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`b_readCount` INT(11) UNSIGNED ZEROFILL NULL DEFAULT '00000000000',
//	`b_replyCount` INT(11) UNSIGNED ZEROFILL NULL DEFAULT NULL,
//	PRIMARY KEY (`b_num`),
//	INDEX `b_id` (`b_id`),
//	INDEX `b_name` (`b_name`),
//	INDEX `b_model` (`b_model`),
//	CONSTRAINT `FK_blog_member` FOREIGN KEY (`b_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
//)
//COLLATE='utf8_unicode_ci'
//ENGINE=InnoDB
//AUTO_INCREMENT=10015
//;
	
//	CREATE TABLE `reply` (
//
//		`r_num` INT(11) NOT NULL AUTO_INCREMENT,
//		`r_comment` VARCHAR(300) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//		`r_replyDate` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//		`b_num` INT(11) NULL DEFAULT NULL,
//		`r_id` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//		PRIMARY KEY (`r_num`),
//		INDEX `r_id` (`r_id`),
//		INDEX `b_num` (`b_num`),
//		CONSTRAINT `FK_blog_reply_blog` FOREIGN KEY (`b_num`) REFERENCES `blog` (`b_num`) ON DELETE CASCADE
//	)
//	COLLATE='utf8_unicode_ci'
//	ENGINE=InnoDB
//	AUTO_INCREMENT=31
//	;

//	CREATE TABLE `book` (
//			`book_num` INT(11) NOT NULL AUTO_INCREMENT,
//			`id` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//			`model` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//			`book_date` VARCHAR(10000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//			`content` VARCHAR(3000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//			`reg_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//			`type` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//			`pay` INT(11) NULL DEFAULT NULL,
//			`book` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//			`meet` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
//			PRIMARY KEY (`book_num`),
//			INDEX `model` (`model`),
//			INDEX `id` (`id`),
//			CONSTRAINT `FK_book_member` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE
//		)
//		COLLATE='utf8_unicode_ci'
//		ENGINE=InnoDB
//		AUTO_INCREMENT=146
//		;

	
//	CREATE TABLE `oppa` (
//	`o_num` INT(11) NOT NULL AUTO_INCREMENT,
//	`o_like` INT(11) NULL DEFAULT NULL,
//	`o_id` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`o_name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`total` INT(11) NULL DEFAULT NULL,
//	`o_reg_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`o_join_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`o_likeMember` VARCHAR(5000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	PRIMARY KEY (`o_num`),
//	INDEX `o_id` (`o_id`),
//	CONSTRAINT `FK_oppa_member` FOREIGN KEY (`o_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
//)
//COLLATE='utf8_unicode_ci'
//ENGINE=InnoDB
//AUTO_INCREMENT=22
//;

//	CREATE TABLE `Qna` (
//	`q_num` INT(11) NOT NULL AUTO_INCREMENT,
//	`q_id` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
//	`q_type` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
//	`q_title` VARCHAR(200) NOT NULL COLLATE 'utf8_unicode_ci',
//	`q_content` VARCHAR(3000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`re_content` VARCHAR(3000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`reg_date` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
//	`reply` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`re_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	PRIMARY KEY (`q_num`),
//	INDEX `q_id` (`q_id`),
//	CONSTRAINT `FK_Qna_member` FOREIGN KEY (`q_id`) REFERENCES `member` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
//)
//COMMENT='qna 탭 데이터베이스'
//COLLATE='utf8_unicode_ci'
//ENGINE=InnoDB
//AUTO_INCREMENT=3
//;
	
//	CREATE TABLE `submit` (
//	`s_num` INT(11) NOT NULL AUTO_INCREMENT,
//	`s_id` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`s_name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`s_comment` VARCHAR(3000) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`s_type` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`s_reg_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`s_upgrade` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	PRIMARY KEY (`s_num`),
//	INDEX `FK_submit_member` (`s_id`),
//	CONSTRAINT `FK_submit_member` FOREIGN KEY (`s_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
//)
//COLLATE='utf8_unicode_ci'
//ENGINE=InnoDB
//AUTO_INCREMENT=21
//;

//	CREATE TABLE `visitor` (
//	`v_num` INT(11) NOT NULL AUTO_INCREMENT,
//	`v_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
//	`v_sum` INT(11) NULL DEFAULT NULL,
//	PRIMARY KEY (`v_num`)
//)
//COLLATE='utf8_unicode_ci'
//ENGINE=InnoDB
//AUTO_INCREMENT=477
//;
}
