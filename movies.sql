-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.23 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных movies
CREATE DATABASE IF NOT EXISTS `movies` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `movies`;

-- Дамп структуры для таблица movies.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `director_id` bigint(20) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_to_director_id` (`director_id`),
  CONSTRAINT `movie_to_director_id` FOREIGN KEY (`director_id`) REFERENCES `persons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы movies.movies: ~10 rows (приблизительно)
DELETE FROM `movies`;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` (`id`, `title`, `director_id`, `type`, `rating`) VALUES
	(1, 'Aquaman', 1, 'movie', 8.0),
	(2, 'The Big Bang Theory', NULL, 'series', 8.2),
	(3, 'The Dark Knight', 5, 'movie', 8.5),
	(4, 'The Prestige', 5, 'movie', 8.5),
	(5, 'Game of Thrones', NULL, 'series', 9.0),
	(6, '300', 20, 'movie', 7.6),
	(7, 'X-Men: Days of Future Past', 23, 'movie', 7.7),
	(8, 'Star Trek Into Darkness', 24, 'movie', 7.6),
	(9, 'Sherlock', NULL, 'series', 8.8),
	(10, 'The Hobbit: An Unexpected Journey', 30, 'movie', 8.0);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;

-- Дамп структуры для таблица movies.movie_to_actor
CREATE TABLE IF NOT EXISTS `movie_to_actor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `movie_id` bigint(20) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_person_movie_pair` (`person_id`,`movie_id`),
  KEY `actors_pivot_table_to_movie` (`movie_id`),
  CONSTRAINT `actors_pivot_table_to_person` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actors_pivot_table_to_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы movies.movie_to_actor: ~34 rows (приблизительно)
DELETE FROM `movie_to_actor`;
/*!40000 ALTER TABLE `movie_to_actor` DISABLE KEYS */;
INSERT INTO `movie_to_actor` (`id`, `movie_id`, `person_id`) VALUES
	(1, 1, 2),
	(2, 2, 3),
	(3, 2, 4),
	(4, 3, 6),
	(8, 4, 6),
	(6, 3, 7),
	(5, 3, 8),
	(7, 3, 9),
	(9, 4, 10),
	(21, 7, 10),
	(11, 5, 11),
	(24, 7, 11),
	(10, 5, 12),
	(12, 5, 13),
	(18, 6, 13),
	(13, 5, 14),
	(14, 5, 15),
	(15, 5, 16),
	(16, 5, 17),
	(17, 6, 18),
	(19, 6, 19),
	(20, 7, 19),
	(22, 7, 21),
	(23, 7, 22),
	(25, 8, 25),
	(26, 8, 26),
	(29, 9, 26),
	(27, 8, 27),
	(28, 8, 28),
	(31, 9, 29),
	(34, 10, 29),
	(32, 7, 31),
	(33, 10, 31),
	(36, 3, 33);
/*!40000 ALTER TABLE `movie_to_actor` ENABLE KEYS */;

-- Дамп структуры для таблица movies.persons
CREATE TABLE IF NOT EXISTS `persons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы movies.persons: ~33 rows (приблизительно)
DELETE FROM `persons`;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` (`id`, `name`, `gender`) VALUES
	(1, 'James Wan', 'male'),
	(2, 'Jason Momoa', 'male'),
	(3, 'Jim Parsons', 'male'),
	(4, 'Kaley Cuoco', 'female'),
	(5, 'Christopher Nolan', 'male'),
	(6, 'Christian Bale', 'male'),
	(7, 'Heath Ledger', 'male'),
	(8, 'Gary Oldman', 'male'),
	(9, 'Maggie Gyllenhaal', 'female'),
	(10, 'Hugh Jackman', 'male'),
	(11, 'Peter Dinklage', 'male'),
	(12, 'Emilia Clarke', 'female'),
	(13, 'Lena Headey', 'female'),
	(14, 'Kit Harington', 'male'),
	(15, 'Sophie Turner', 'female'),
	(16, 'Maisie Williams', 'female'),
	(17, 'Nikolaj Coster-Waldau', 'male'),
	(18, 'Gerard Butler', 'male'),
	(19, 'Michael Fassbender', 'male'),
	(20, 'Zack Snyder', 'male'),
	(21, 'Jennifer Lawrence', 'female'),
	(22, 'James McAvoy', 'male'),
	(23, 'Bryan Singer', 'male'),
	(24, 'J.J. Abrams', 'male'),
	(25, 'Simon Pegg', 'male'),
	(26, 'Benedict Cumberbatch', 'male'),
	(27, 'Zachary Quinto', 'male'),
	(28, 'Chris Pine', 'male'),
	(29, 'Martin Freeman', 'male'),
	(30, 'Peter Jackson', 'male'),
	(31, 'Ian McKellen', 'male'),
	(33, 'Morgan Freeman', 'male'),
	(37, 'Robert Downey Jr.', 'male');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
