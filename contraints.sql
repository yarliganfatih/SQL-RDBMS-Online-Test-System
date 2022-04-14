
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