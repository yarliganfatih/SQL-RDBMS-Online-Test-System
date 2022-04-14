-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 10 Oca 2022, 09:19:17
-- Sunucu sürümü: 5.6.51-cll-lve
-- PHP Sürümü: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `Pararena`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `questions`
--

CREATE TABLE `questions` (
  `q_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `question` text COLLATE utf8_turkish_ci NOT NULL,
  `images` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `answers` text COLLATE utf8_turkish_ci NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `solution` text COLLATE utf8_turkish_ci NOT NULL COMMENT 'optional',
  `u_id` int(11) NOT NULL COMMENT 'creator'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `questions`
--

INSERT INTO `questions` (`q_id`, `createdAt`, `visible`, `question`, `images`, `answers`, `correct_answer`, `solution`, `u_id`) VALUES
(1, '2022-01-06 15:52:21', 1, 'Which parts of the computer were is used for calculating and comparing?', '', 'ALU, Modem, Control unit, Disk unit', 0, '', 1),
(2, '2022-01-06 15:52:21', 1, 'Examples include egoism, natural law, utilitarianism, and respect for persons. These examples belong to which of the following?', '', 'Ethical philosophies, Ethical models, Network security, Security codes', 0, '', 2),
(3, '2022-01-06 16:02:38', 0, 'Which of the following is billionth of a second?', 'assets/deleted/3.png', 'Microsecond, Nanosecond, Terabyte, Gigabyte', 1, '', 2),
(4, '2022-01-06 16:02:38', 1, 'The two kinds of main memory are', '', 'CDs and DVDs, RAM and ROM, Primary and secondary, Direct and sequential', 1, '', 2),
(5, '2022-01-06 16:05:12', 1, 'The main memory of computer is also called as', '', 'Hard-disk, Primary storage, Secondary storage, Internal memory', 1, '', 1),
(6, '2022-01-06 16:05:12', 1, '_____ has the shortest access times.', '', 'Virtual Memory, Secondary Memory, Cache Memory', 2, 't(Virtual M.) > t(Secondary M.) > t(Cache M.)', 1),
(7, '2022-01-06 16:11:45', 1, 'Programs stored in ROM are called as', 'assets/images/questions/7.png', 'Fireware, Formware, Farmware, Firmware', 3, '', 1),
(8, '2022-01-06 23:11:45', 1, '_____ attribute specifies the number of times the sound should repeat?', '', 'font, loop, size, color', 1, 'loops are used to repeat', 2),
(9, '2022-01-06 16:15:00', 0, 'Which is a fast main memory and slow peripheral memory handled by system software?', '', 'Dynamic memory, ROM, RAM, Virtual memory', 3, '', 1),
(10, '2022-01-06 16:15:00', 1, 'The combination of top-down and bottom-up approach may be referred as an _______ approach ?', 'assets/images/questions/10.jpg', 'Interpretive, Interactive, Integrative', 2, '', 2),
(11, '2022-01-06 16:17:57', 1, 'Which of the following is a course not typically taken by computer engineers', '', 'Engineering profession, Physics, Mathematics, Digital Circuits, Chemistry', 4, '', 2),
(12, '2022-01-06 16:17:57', 1, 'A computer derives its basic strength from', '', 'Accuracy, Memory, Speed, All of these', 3, '', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `question_results`
--

CREATE TABLE `question_results` (
  `qr_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `u_id` int(11) NOT NULL COMMENT 'solver',
  `users_answer` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `tr_id` int(11) NOT NULL COMMENT 'test_result_id',
  `q_id` int(11) NOT NULL COMMENT 'question'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `question_results`
--

INSERT INTO `question_results` (`qr_id`, `createdAt`, `visible`, `u_id`, `users_answer`, `is_correct`, `tr_id`, `q_id`) VALUES
(1, '2022-01-06 21:23:06', 1, 3, 2, 0, 1, 8),
(2, '2022-01-06 21:23:06', 1, 3, 2, 0, 1, 11),
(3, '2022-01-06 21:23:06', 1, 3, 1, 0, 1, 9),
(4, '2022-01-06 21:23:06', 1, 3, 1, 1, 1, 3),
(5, '2022-01-06 21:23:06', 1, 3, 2, 0, 1, 7),
(6, '2022-01-06 21:23:06', 1, 3, 1, 1, 1, 4),
(7, '2022-01-06 21:23:06', 1, 3, 0, 1, 1, 2),
(8, '2022-01-06 21:23:06', 1, 4, 2, 0, 2, 8),
(9, '2022-01-06 21:23:06', 1, 4, 4, 1, 2, 11),
(10, '2022-01-06 21:23:06', 1, 4, 2, 0, 2, 9),
(11, '2022-01-06 21:23:06', 1, 4, 0, 0, 2, 3),
(12, '2022-01-06 21:23:06', 1, 4, 0, 0, 2, 7),
(13, '2022-01-06 21:23:06', 1, 4, 0, 0, 2, 4),
(14, '2022-01-06 21:23:06', 1, 4, 0, 1, 2, 2),
(15, '2022-01-06 21:23:06', 1, 4, 0, 0, 3, 8),
(16, '2022-01-06 21:23:06', 1, 4, 2, 0, 3, 2),
(17, '2022-01-06 21:23:06', 1, 4, 3, 1, 3, 7),
(18, '2022-01-06 21:23:06', 1, 4, 2, 1, 3, 10),
(19, '2022-01-06 21:23:06', 1, 4, 0, 0, 3, 12);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tests`
--

CREATE TABLE `tests` (
  `t_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `duration` double NOT NULL,
  `turn_previous_question` tinyint(1) NOT NULL DEFAULT '1',
  `start_date` timestamp NULL DEFAULT NULL,
  `finish_date` timestamp NULL DEFAULT NULL,
  `shuffle_answers` tinyint(4) NOT NULL DEFAULT '0',
  `shuffle_questions` tinyint(1) NOT NULL DEFAULT '0',
  `u_id` int(11) NOT NULL COMMENT 'creator',
  `award` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `tests`
--

INSERT INTO `tests` (`t_id`, `createdAt`, `visible`, `title`, `duration`, `turn_previous_question`, `start_date`, `finish_date`, `shuffle_answers`, `shuffle_questions`, `u_id`, `award`) VALUES
(1, '2022-01-06 16:39:13', 1, 'Computer Engineering Quiz', 15, 0, '2022-01-07 22:00:00', '2022-01-07 22:10:00', 0, 0, 1, 10),
(2, '2022-01-06 16:39:13', 1, 'Introduction to Engineering Midterm', 50, 1, '2022-01-07 22:00:00', '2022-01-07 22:30:00', 0, 1, 2, 30),
(3, '2022-01-06 16:59:44', 1, 'Introduction to Software Engineering Final', 50, 1, '2022-01-07 22:00:00', '2022-01-07 23:00:00', 0, 0, 1, 60),
(4, '2022-01-07 12:50:06', 1, 'Calculus 1 Quiz', 30, 1, '2022-01-07 22:00:00', '2022-01-07 22:30:00', 0, 0, 1, 15);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `test_question_links`
--

CREATE TABLE `test_question_links` (
  `t_id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `test_question_links`
--

INSERT INTO `test_question_links` (`t_id`, `q_id`) VALUES
(2, 11),
(1, 8),
(3, 8),
(2, 1),
(1, 2),
(3, 11),
(1, 7),
(2, 5),
(3, 9),
(1, 10),
(3, 3),
(2, 8),
(3, 7),
(3, 4),
(1, 12),
(3, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `test_results`
--

CREATE TABLE `test_results` (
  `tr_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `u_id` int(11) NOT NULL COMMENT 'solver',
  `t_id` int(11) NOT NULL COMMENT 'test',
  `net` double NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `taken_score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `test_results`
--

INSERT INTO `test_results` (`tr_id`, `createdAt`, `visible`, `u_id`, `t_id`, `net`, `correct`, `wrong`, `total`, `duration`, `taken_score`) VALUES
(1, '2022-01-06 21:23:06', 1, 3, 3, 4.5, 5, 2, 7, 19, 38),
(2, '2022-01-06 21:23:06', 1, 4, 3, 0.75, 2, 5, 7, 10, 6),
(3, '2022-01-06 21:23:06', 1, 4, 1, 2.5, 3, 2, 5, 11, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `username` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `first_name` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `last_name` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `theme` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `score` double NOT NULL DEFAULT '0',
  `rank` varchar(80) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`u_id`, `createdAt`, `visible`, `username`, `email`, `password`, `first_name`, `last_name`, `theme`, `score`, `rank`) VALUES
(1, '2022-01-06 15:42:15', 1, 'fatih.yarligan', 'fatih.yarligan@bahcesehir.edu.tr', 'e38ad214943daad1d64c102faec29de4afe9da3d', 'Fatih', 'Yarlıgan', 'dark', 0, 'admin'),
(2, '2022-01-06 15:43:17', 1, 'sedef.sayibasi', 'sedef.sayibasi@bahcesehir.edu.tr', '2aa60a8ff7fcd473d321e0146afd9e26df395147', 'Sedef', 'Sayıbaşı', 'light', 0, 'lecturer'),
(3, '2022-01-06 15:44:08', 1, 'yunus.bolgonul', 'yunus.bolgonul@bahcesehir.edu.tr', '1119cfd37ee247357e034a08d844eea25f6fd20f', 'Yunus Emre', 'Bolgönül', 'dark', 38, 'student'),
(4, '2022-01-06 17:08:10', 1, 'other.student', 'other.student@bahcesehir.edu.tr', 'a1d7584daaca4738d499ad7082886b01117275d8', 'Other', 'Student', 'light', 11, 'student');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`q_id`),
  ADD KEY `created_question_by` (`u_id`);

--
-- Tablo için indeksler `question_results`
--
ALTER TABLE `question_results`
  ADD PRIMARY KEY (`qr_id`),
  ADD KEY `question_id` (`q_id`),
  ADD KEY `test_result_id` (`tr_id`),
  ADD KEY `user_id` (`u_id`);

--
-- Tablo için indeksler `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `created_test_by` (`u_id`);

--
-- Tablo için indeksler `test_question_links`
--
ALTER TABLE `test_question_links`
  ADD KEY `test_id` (`t_id`),
  ADD KEY `question_id` (`q_id`);

--
-- Tablo için indeksler `test_results`
--
ALTER TABLE `test_results`
  ADD PRIMARY KEY (`tr_id`),
  ADD KEY `user_id` (`u_id`),
  ADD KEY `test_id` (`t_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `questions`
--
ALTER TABLE `questions`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `question_results`
--
ALTER TABLE `question_results`
  MODIFY `qr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `tests`
--
ALTER TABLE `tests`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `test_results`
--
ALTER TABLE `test_results`
  MODIFY `tr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `created_question_by` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Tablo kısıtlamaları `question_results`
--
ALTER TABLE `question_results`
  ADD CONSTRAINT `answered_by` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`),
  ADD CONSTRAINT `include` FOREIGN KEY (`q_id`) REFERENCES `questions` (`q_id`),
  ADD CONSTRAINT `relate` FOREIGN KEY (`tr_id`) REFERENCES `test_results` (`tr_id`);

--
-- Tablo kısıtlamaları `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `created_test_by` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Tablo kısıtlamaları `test_question_links`
--
ALTER TABLE `test_question_links`
  ADD CONSTRAINT `question_link` FOREIGN KEY (`q_id`) REFERENCES `questions` (`q_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_link` FOREIGN KEY (`t_id`) REFERENCES `tests` (`t_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `test_results`
--
ALTER TABLE `test_results`
  ADD CONSTRAINT `belong_to` FOREIGN KEY (`t_id`) REFERENCES `tests` (`t_id`),
  ADD CONSTRAINT `solved_by` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
