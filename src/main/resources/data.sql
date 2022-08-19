-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.9.1-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- webmvc 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `webmvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `webmvc`;

-- 테이블 webmvc.tb_board_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_board_list` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postContent` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postDate` datetime DEFAULT curdate(),
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 webmvc.tb_board_list:~0 rows (대략적) 내보내기
DELETE FROM `tb_board_list`;
/*!40000 ALTER TABLE `tb_board_list` DISABLE KEYS */;
INSERT INTO `tb_board_list` (`idx`, `username`, `postTitle`, `postContent`, `postDate`) VALUES
	(6, 'user', '안녕하세요', '123', '2022-08-19 00:00:00');
/*!40000 ALTER TABLE `tb_board_list` ENABLE KEYS */;

-- 테이블 webmvc.tb_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namekey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 webmvc.tb_role:~2 rows (대략적) 내보내기
DELETE FROM `tb_role`;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` (`id`, `namekey`, `name`) VALUES
	(1, 'ROLE_ADMIN', '관리자'),
	(2, 'ROLE_USER', '사용자');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;

-- 테이블 webmvc.tb_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 webmvc.tb_user:~2 rows (대략적) 내보내기
DELETE FROM `tb_user`;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`id`, `username`, `password`) VALUES
	(1, 'admin', '$2a$10$toiM562GREw1Iy7u/eMVkeLrSaX4ZBAl/HLsbayBXpADfa7eHDmDe'),
	(2, 'user', '$2a$10$toiM562GREw1Iy7u/eMVkeLrSaX4ZBAl/HLsbayBXpADfa7eHDmDe');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

-- 테이블 webmvc.tr_user_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `tr_user_role` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `FK_tr_user_role_tb_user` (`user_id`),
  KEY `FK_tr_user_role_tb_role` (`role_id`),
  CONSTRAINT `FK_tr_user_role_tb_role` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tr_user_role_tb_user` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 webmvc.tr_user_role:~2 rows (대략적) 내보내기
DELETE FROM `tr_user_role`;
/*!40000 ALTER TABLE `tr_user_role` DISABLE KEYS */;
INSERT INTO `tr_user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2);
/*!40000 ALTER TABLE `tr_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
