/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- webmvc 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `webmvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `webmvc`;

-- 테이블 webmvc.tb_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_role` (
                                         `id` int(11) NOT NULL AUTO_INCREMENT,
                                         `namekey` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 webmvc.tb_role:~2 rows (대략적) 내보내기
DELETE FROM `tb_role`;
INSERT INTO `tb_role` (`id`, `namekey`, `name`) VALUES
                                                    (1, 'ROLE_ADMIN', '관리자'),
                                                    (2, 'ROLE_USER', '사용자');

-- 테이블 webmvc.tb_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_user` (
                                         `id` int(11) NOT NULL AUTO_INCREMENT,
                                         `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 webmvc.tb_user:~2 rows (대략적) 내보내기
DELETE FROM `tb_user`;
INSERT INTO `tb_user` (`id`, `username`, `password`) VALUES
                                                         (1, 'admin', '$2a$10$toiM562GREw1Iy7u/eMVkeLrSaX4ZBAl/HLsbayBXpADfa7eHDmDe'),
                                                         (2, 'user', '$2a$10$toiM562GREw1Iy7u/eMVkeLrSaX4ZBAl/HLsbayBXpADfa7eHDmDe');

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
INSERT INTO `tr_user_role` (`user_id`, `role_id`) VALUES
                                                      (1, 1),
                                                      (2, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
