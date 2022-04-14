# SQL-Template-Online-Test-Management-System
A database system of question pools where users take the test and analyze it.

## ABSTRACT
Test management most commonly refers to the activity of managing a test process. A test
management tool is software used to manage tests (automatic or manual) previously
specified by a test procedure. Online test management, users login to the system; It is a
system that aims to control the questions it answers and the tests it performs on the system.
Today, there is a need for the use of online test management in many fields, especially in
educational institutions. It is a system that provides advanced and functional service to
provide remote and online control.

In this project, the system works as the diagrams and codes are given below. First of all, our
users must have information such as id, username, email, password in order to log in to the
system. Then, the user logging into the system is expected to log in to the tests defined on
the system, start the test according to t_id(test_id) and answer the questions within the
specified time. According to the initiated t_id, the questions suitable for the t_id are drawn
from the questions through the test_question_links relationship. The return feature
(turn_previous_question) in questions can be turned on or off. There is a correct answer to
the questions and the system creates the question_result by comparing the correct answer
with the answer given by the user. Test_results are created at the end of the results of the
questions. With test_result, the user can show his score, correct and incorrect answers, how
many clears he has made, etc. can view. It can be viewed on the system which user created
which question and who created which test.

***

## E-R DIAGRAM

![image](https://user-images.githubusercontent.com/54783062/163410272-9581155b-8a23-4d1e-910b-3cd6fa3265a1.png)

***

## DATABASE SCHEMA DIAGRAM

![image](https://user-images.githubusercontent.com/54783062/163410319-bfdcdb13-c21e-4262-9790-4b7a070b9076.png)

***

## EXAMPLE SQL QUERIES
### Join Queries
1. This query lists the id of the user and the question and which user created which
question.
```sql
SELECT `questions`.`q_id`,`questions`.`question`,`users`.`u_id`,`users`.`username` FROM
`users` INNER JOIN `questions` ON `questions`.`u_id`=`users`.`u_id`
```
2. This query lists the id of the test and questions, and the title of the test its questions
are linked to.
```sql
SELECT `questions`.`q_id`,`questions`.`question`,`tests`.`t_id`,`tests`.`title` FROM `tests`
JOIN `test_question_links` ON `test_question_links`.`t_id`=`tests`.`t_id` JOIN `questions`
ON `test_question_links`.`q_id`=`questions`.`q_id`
```
### Nested Queries
1. This query lists the ids of the users who scored 6 or higher in the test result table.
```sql
SELECT `u_id`,`username` FROM `users` WHERE `u_id` IN (SELECT `u_id` FROM
`test_results` WHERE `taken_score` >= 6)
```
2. This query lists the users' ids and fullnames in order of highest net.
```sql
SELECT `u_id`,`first_name`,`last_name` FROM `users` WHERE `u_id` = (SELECT `u_id`
FROM `test_results` WHERE `net` = (SELECT MAX(`net`) FROM `test_results`))
```
### Set Operation Queries
1. This query lists the creation dates of all data.
```sql
(SELECT `createdAt` FROM `questions`) UNION (SELECT `createdAt` FROM
`question_results`) UNION (SELECT `createdAt` FROM `tests`) UNION (SELECT `createdAt`
FROM `test_results`) UNION (SELECT `createdAt` FROM `users`)
```
2. This query lists all data of tests that have never been resolved.
```sql
SELECT * FROM `tests` WHERE `t_id` IN ((SELECT `t_id` FROM `tests`) MINUS (SELECT
`t_id` FROM `test_results`))
```
### Aggregate Operations
1. This query lists the user's id, username, and number of questions solved in order
from high to low.
```sql
SELECT `users`.`u_id`,`users`.`username`, COUNT(*) `question_count` FROM `users` JOIN
`question_results` ON `question_results`.`u_id`=`users`.`u_id` GROUP BY `users`.`u_id`
ORDER BY `question_count` DESC
```
2. This query ranks the user's ID, username, and sum of their test scores from low to
high.
```sql
SELECT `users`.`u_id`,`users`.`username`, SUM(`taken_score`) `taken_total_score` FROM
`users` JOIN `test_results` ON `test_results`.`u_id`=`users`.`u_id` GROUP BY `users`.`u_id`
ORDER BY `taken_total_score` ASC
```
