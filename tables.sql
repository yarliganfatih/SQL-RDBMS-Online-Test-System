CREATE TABLE `questions` (
  `q_id` int(11) PRIMARY KEY,
  `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) DEFAULT '1',
  `question` text COLLATE utf8_turkish_ci NOT NULL,
  `images` varchar(255) COLLATE utf8_turkish_ci,
  `answers` text COLLATE utf8_turkish_ci NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `solution` text COLLATE utf8_turkish_ci,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

CREATE TABLE `question_results` (
  `qr_id` int(11) PRIMARY KEY,
  `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) DEFAULT '1',
  `u_id` int(11) NOT NULL COMMENT 'solver',
  `users_answer` int(11),
  `is_correct` tinyint(1) NOT NULL,
  `tr_id` int(11) NOT NULL COMMENT 'test_result_id',
  `q_id` int(11) NOT NULL COMMENT 'question'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

CREATE TABLE `tests` (
  `t_id` int(11) PRIMARY KEY,
  `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) DEFAULT '1',
  `title` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `duration` double,
  `turn_previous_question` tinyint(1) DEFAULT '1',
  `start_date` timestamp NULL DEFAULT NULL,
  `finish_date` timestamp NULL DEFAULT NULL,
  `shuffle_answers` tinyint(1) DEFAULT '0',
  `shuffle_questions` tinyint(1) DEFAULT '0',
  `u_id` int(11) NOT NULL COMMENT 'creator',
  `award` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE `test_question_links` (
  `t_id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `test_results` (
  `tr_id` int(11) PRIMARY KEY,
  `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) DEFAULT '1',
  `u_id` int(11) NOT NULL COMMENT 'solver',
  `t_id` int(11) NOT NULL COMMENT 'test',
  `net` double NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `taken_score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE `users` (
  `u_id` int(11) PRIMARY KEY,
  `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `visible` tinyint(1) DEFAULT '1',
  `username` varchar(80) COLLATE utf8_turkish_ci NOT NULL UNIQUE,
  `email` varchar(80) COLLATE utf8_turkish_ci NOT NULL  UNIQUE,
  `password` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `first_name` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `last_name` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `theme` varchar(80) COLLATE utf8_turkish_ci NOT NULL,
  `score` double,
  `rank` varchar(80) COLLATE utf8_turkish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci ROW_FORMAT=DYNAMIC;


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
