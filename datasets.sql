
INSERT INTO `users` (`u_id`, `createdAt`, `visible`, `username`, `email`, `password`, `first_name`, `last_name`, `theme`, `score`, `rank`) VALUES
(1, '2022-01-06 15:42:15', 1, 'fatih.yarligan', 'fatih.yarligan@bahcesehir.edu.tr', 'e38ad214943daad1d64c102faec29de4afe9da3d', 'Fatih', 'Yarlıgan', 'dark', 0, 'admin'),
(2, '2022-01-06 15:43:17', 1, 'sedef.sayibasi', 'sedef.sayibasi@bahcesehir.edu.tr', '2aa60a8ff7fcd473d321e0146afd9e26df395147', 'Sedef', 'Sayıbaşı', 'light', 0, 'lecturer'),
(3, '2022-01-06 15:44:08', 1, 'yunus.bolgonul', 'yunus.bolgonul@bahcesehir.edu.tr', '1119cfd37ee247357e034a08d844eea25f6fd20f', 'Yunus Emre', 'Bolgönül', 'dark', 38, 'student'),
(4, '2022-01-06 17:08:10', 1, 'other.student', 'other.student@bahcesehir.edu.tr', 'a1d7584daaca4738d499ad7082886b01117275d8', 'Other', 'Student', 'light', 11, 'student');

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

INSERT INTO `tests` (`t_id`, `createdAt`, `visible`, `title`, `duration`, `turn_previous_question`, `start_date`, `finish_date`, `shuffle_answers`, `shuffle_questions`, `u_id`, `award`) VALUES
(1, '2022-01-06 16:39:13', 1, 'Computer Engineering Quiz', 15, 0, '2022-01-07 22:00:00', '2022-01-07 22:10:00', 0, 0, 1, 10),
(2, '2022-01-06 16:39:13', 1, 'Introduction to Engineering Midterm', 50, 1, '2022-01-07 22:00:00', '2022-01-07 22:30:00', 0, 1, 2, 30),
(3, '2022-01-06 16:59:44', 1, 'Introduction to Software Engineering Final', 50, 1, '2022-01-07 22:00:00', '2022-01-07 23:00:00', 0, 0, 1, 60),
(4, '2022-01-07 12:50:06', 1, 'Calculus 1 Quiz', 30, 1, '2022-01-07 22:00:00', '2022-01-07 22:30:00', 0, 0, 1, 15);

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

INSERT INTO `test_results` (`tr_id`, `createdAt`, `visible`, `u_id`, `t_id`, `net`, `correct`, `wrong`, `total`, `duration`, `taken_score`) VALUES
(1, '2022-01-06 21:23:06', 1, 3, 3, 4.5, 5, 2, 7, 19, 38),
(2, '2022-01-06 21:23:06', 1, 4, 3, 0.75, 2, 5, 7, 10, 6),
(3, '2022-01-06 21:23:06', 1, 4, 1, 2.5, 3, 2, 5, 11, 5);

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