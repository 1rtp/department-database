DROP DATABASE IF EXISTS kafedra;
CREATE DATABASE IF NOT EXISTS `kafedra` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
use `kafedra`;
CREATE TABLE `teacher` (
    `emp_id` INT PRIMARY KEY AUTO_INCREMENT,
    `emp_full_name` VARCHAR(100) UNIQUE NOT NULL,
    `emp_position` VARCHAR(50) NOT NULL,
    `emp_hire_date` DATE NOT NULL,
    `phone_number` VARCHAR(15) UNIQUE NOT NULL,
    `email` VARCHAR(100) UNIQUE NOT NULL,
    `status` TINYINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
CREATE TABLE `subjects` (
    `subject_id` INT PRIMARY KEY AUTO_INCREMENT,
    `subject_name` VARCHAR(100) UNIQUE NOT NULL,
    `semester` TINYINT NOT NULL,
    `total_hours` INT NOT NULL,
     `status` TINYINT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
CREATE TABLE `lesson_type` (
    `lesson_type_id` INT PRIMARY KEY AUTO_INCREMENT,
    `type_name` VARCHAR(50) UNIQUE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
CREATE TABLE `assignment` (
    `assignment_id` INT PRIMARY KEY AUTO_INCREMENT,
    `emp_id` INT NOT NULL,
    `subject_id` INT NOT NULL,
    `lesson_type_id` INT NOT NULL,
    `plan_hours` INT NOT NULL DEFAULT 0,
    `hours_taught` INT NOT NULL DEFAULT 0,
    FOREIGN KEY (`emp_id`) REFERENCES `teacher`(`emp_id`),
    FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`subject_id`),
    FOREIGN KEY (`lesson_type_id`) REFERENCES `lesson_type`(`lesson_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
CREATE TABLE `research` (
    `research_id` INT PRIMARY KEY AUTO_INCREMENT,
    `research_name` VARCHAR(150) UNIQUE NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;
CREATE TABLE `participation_in_research` (
    `participation_id` INT PRIMARY KEY AUTO_INCREMENT,
    `emp_id` INT NOT NULL,
    `research_id` INT NOT NULL,
    FOREIGN KEY (`emp_id`) REFERENCES `teacher`(`emp_id`),
    FOREIGN KEY (`research_id`) REFERENCES `research`(`research_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;

INSERT INTO teacher (emp_full_name, emp_position, emp_hire_date, phone_number, email) VALUES
('Панас Овчаренко', 'Старший викладач', '2018-01-08', '116 56 02', 'iefymenkoustym@gov.ua'),
('Камілла Ващук', 'Методист', '2015-12-25', '049 139-28-84', 'ktokar@haievskyi.org'),
('Марія Овсієнко', 'Асистент', '2018-02-07', '909 15 51', 'nikoliuksofiia@i.ua'),
('Валерія Дробович', 'Інженер', '2017-05-12', '067 818-10-10', 'zhelezniaknastia@meta.ua'),
('Євгенія Мельниченко', 'Професор', '2014-03-02', '050 559-66-09', 'vsolomianko@knu.ua'),
('Андрій Онищенко', 'Доцент', '2016-09-15', '073 777-88-99', 'onishchenko@gmail.com'),
('Оксана Черевко', 'Асистент', '2019-11-01', '097 222-45-67', 'okscher@ukr.net'),
('Максим Бутко', 'Професор', '2013-07-30', '050 123-45-67', 'm.butko@univ.kiev.ua'),
('Ігор Сич', 'Доцент', '2016-04-11', '093 555-66-77', 'ihor.sych@gmail.com'),
('Юлія Пилипенко', 'Методист', '2018-06-23', '098 321-98-76', 'y.pilypenko@edu.ua'),
('Олег Шевченко', 'Завідувач кафедри', '2012-01-20', '050 000-11-22', 'shev.oleg@kafedra.edu'),
('Наталя Король', 'Старший викладач', '2017-10-14', '099 888-77-66', 'n.korol@edu.ua'),
('Руслан Коваль', 'Асистент', '2020-02-29', '097 001-23-45', 'r.koval@kafedra.ua'),
('Тетяна Бондар', 'Інженер', '2015-09-05', '093 111-22-33', 't.bondar@univ.edu'),
('Сергій Іщенко', 'Доцент', '2014-06-07', '095 555-66-77', 's.ishchenko@kafedra.ua'),
('Лідія Козак', 'Лаборант', '2016-03-08', '073 987-65-43', 'l.kozak@edu.ua'),
('Анатолій Білий', 'Професор', '2011-08-19', '067 111-22-33', 'a.bilyi@kpi.ua'),
('Ірина Гуменюк', 'Асистент', '2019-04-03', '050 222-33-44', 'i.humeniuk@edu.ua'),
('Денис Поліщук', 'Інженер', '2017-12-22', '097 444-55-66', 'd.polishchuk@kafedra.ua'),
('Галина Синиця', 'Старший викладач', '2013-11-17', '093 789-12-34', 'h.synytsia@edu.ua');

INSERT INTO `subjects` (subject_name, semester, total_hours) VALUES
('Патологічна фізіологія (Медицина)', 6, 120),
('Патологічна фізіологія (Медицина, іноземні студенти)', 6, 120),
('Патологічна фізіологія (Стоматологія, 2 курс)', 4, 90),
('Патологічна фізіологія (Стоматологія, 3 курс)', 6, 90),
('Патологічна фізіологія (Лабораторна діагностика, 2 курс)', 4, 80),
('Патологічна фізіологія (Лабораторна діагностика, 3 курс)', 6, 80),
('Патофізіологія з особливостями дитячого віку (Педіатрія)', 6, 100),
('Нормальна фізіологія людини та патологічна фізіологія (Фізична терапія)', 4, 110),
('Патоморфологія та патофізіологія (Сестринська справа)', 4, 90),
('Патоморфологія та патофізіологія (Сестринська справа, іноземці)', 4, 90),
('Клінічна патофізіологія (Медицина, 4 курс)', 8, 100),
('Клінічна патофізіологія (Стоматологія, 4 курс)', 8, 100),
('Клінічна патофізіологія (Медсестринство, заочна форма)', 2, 60),
('Патофізіологія англійською (Stomatology, 3 курс)', 6, 90),
('Патофізіологія англійською (Medicine, 3 курс)', 6, 120);

INSERT INTO lesson_type (type_name) VALUES
('Лекція'), ('Практичне заняття'), ('Лабораторне заняття'), ('Семінар');

INSERT INTO assignment (emp_id, subject_id, lesson_type_id, plan_hours, hours_taught) VALUES
(1, 1, 1, 40, 30),
(1, 2, 2, 30, 28),
(2, 3, 3, 45, 45),
(2, 4, 1, 35, 32),
(3, 5, 2, 25, 20),
(3, 6, 3, 50, 40),
(4, 7, 1, 60, 60),
(5, 8, 4, 30, 25),
(6, 9, 2, 40, 30),
(7, 10, 1, 45, 45),
(8, 11, 3, 35, 20),
(9, 12, 1, 50, 48),
(10, 13, 2, 30, 30),
(11, 14, 4, 40, 35),
(12, 15, 1, 60, 50),
(13, 1, 2, 40, 38),
(14, 3, 3, 50, 47),
(15, 5, 1, 30, 28),
(1, 6, 4, 25, 24),
(2, 7, 2, 45, 42);

-- INSERT INTO participation_in_research (emp_id, plan_hours) VALUES (10, 670);

INSERT INTO research (research_name, start_date, end_date) VALUES
('Механізми хронічного запалення при автоімунних процесах', '2021-01-10', '2023-12-20'),
('Патофізіологія стресу та депресивних розладів', '2020-09-01', '2022-09-01'),
('Вплив запалення на серцево-судинну систему', '2022-02-15', NULL),
('Порушення функцій травної системи при метаболічному синдромі', '2021-05-01', '2024-01-01'),
('Нейроендокринна регуляція в умовах гіпоксії', '2019-03-20', '2021-03-20'),
('Дослідження системи мати-плацента-плід при токсичному впливі', '2023-06-01', NULL),
('Хронічне запалення у патології репродуктивної системи', '2020-01-01', '2022-06-01'),
('Імунопатогенез уражень сечостатевої системи', '2022-08-01', NULL);

INSERT INTO participation_in_research (emp_id, research_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(2, 3),
(3, 5),
(4, 1),
(5, 2),
(6, 4),
(7, 6),
(8, 1),
(9, 7),
(10, 8);

-- 1. Додавання викладача
DROP PROCEDURE IF EXISTS Adding_teacher;
DELIMITER //
CREATE PROCEDURE Adding_teacher(
    IN teacher_full_name VARCHAR(100),
    IN teacher_position VARCHAR(50),
    IN teacher_hire_date DATE,
    IN phone VARCHAR(15),
    IN email VARCHAR(100)
)
BEGIN
IF NOT EXISTS(SELECT emp_id FROM teacher WHERE phone_number=phone) THEN
    INSERT INTO teacher (emp_full_name, emp_position, emp_hire_date, phone_number, email)
    VALUES (teacher_full_name, teacher_position, teacher_hire_date, phone, email);
ELSE SELECT "Викладач з таким номером телефону вже існує";
END IF ;
END;
//
DELIMITER ;

-- 2. Видалення викладача
DROP PROCEDURE IF EXISTS Deleting_teaching;
DELIMITER //
CREATE PROCEDURE Deleting_teaching(IN teacher_full_name VARCHAR(100))
BEGIN
    UPDATE teacher SET `status` = 0 WHERE emp_full_name = teacher_full_name;
END;
//
DELIMITER ;

-- 3. Додавання дисципліни
DROP PROCEDURE IF EXISTS Adding_subject;
DELIMITER //
CREATE PROCEDURE Adding_subject(
    IN subjectName VARCHAR(100),
    IN semester_ TINYINT,
    IN totalHours INT
)
BEGIN
    INSERT INTO subjects (subject_name, semester, total_hours)
    VALUES (subjectName, semester_, totalHours);
END;
//
DELIMITER ;

-- 4. Оновлення дисципліни
DROP PROCEDURE IF EXISTS Update_subject;
DELIMITER //
CREATE PROCEDURE Update_subject(
    IN subjectName VARCHAR(100),
    IN semester_ TINYINT,
    IN totalHours INT
)
BEGIN
    UPDATE subjects
    SET 
        semester = semester_,
        total_hours = totalHours
    WHERE subject_name = subjectName;
END;
//
DELIMITER ;

-- 5. Видалення дисципліни
DROP PROCEDURE IF EXISTS Deleting_subject;
DELIMITER //
CREATE PROCEDURE Deleting_subject(IN subjectName VARCHAR(100))
BEGIN
   UPDATE subjects SET `status` = 0 WHERE subject_name = subjectName;
END;
//
DELIMITER ;

-- 6. Додавання проєкту
DROP PROCEDURE IF EXISTS Adding_research;
DELIMITER //
CREATE PROCEDURE Adding_research(
    IN researchName VARCHAR(150),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    INSERT INTO research (research_name, start_date, end_date)
    VALUES (researchName, startDate, endDate);
END;
//
DELIMITER ;

-- 7. Оновлення проєкту
DROP PROCEDURE IF EXISTS Update_research;
DELIMITER //
CREATE PROCEDURE Update_research(
    IN researchName VARCHAR(150),
    IN startDate DATE,
    IN endDate DATE
)
BEGIN
    UPDATE research
    SET 
        start_date = startDate,
        end_date = endDate
    WHERE research_name = researchName;
END;
//
DELIMITER ;

-- 8. Видалення проєкту
DROP PROCEDURE IF EXISTS Deleting_research;
DELIMITER //
CREATE PROCEDURE Deleting_research(IN researchName VARCHAR(150))
BEGIN
	DECLARE id_project INT;
    SELECT research_id INTO id_project
    FROM research WHERE research_name = researchName;
	DELETE FROM participation_in_research WHERE research_id = id_project;
    DELETE FROM research WHERE  research_id = id_project;
END;
//
DELIMITER ;

-- 9. Додавання призначення
DROP FUNCTION IF EXISTS Adding_assignment;
DELIMITER //
CREATE FUNCTION Adding_assignment(
    teacher_id INT,
    subjectId INT,
    lessonTypeId INT,
    planHours INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE new_ID INT;
    INSERT INTO assignment (emp_id, subject_id, lesson_type_id, plan_hours, hours_taught)
    VALUES (teacher_id, subjectId, lessonTypeId, planHours, 0);
    SET new_ID = LAST_INSERT_ID();
    RETURN new_ID;
END;
//
DELIMITER ;

-- 10. Оновлення призначення
DROP FUNCTION IF EXISTS Update_assignment;
DELIMITER //
CREATE FUNCTION Update_assignment(
    assignmentId INT,
    planHours INT,
    hoursTaught INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE update_rows INT;
    UPDATE assignment
    SET 
        plan_hours = planHours,
        hours_taught = hoursTaught
    WHERE assignment_id = assignmentId;
    SET update_rows = ROW_COUNT();
    RETURN update_rows; -- 1 якщо оновлено, 0 якщо ні
END;
//
DELIMITER ;

-- 11. Видалення призначення
DROP FUNCTION IF EXISTS Deleting_assignment;
DELIMITER //
CREATE FUNCTION Deleting_assignment(assig_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE deleting_rows INT;
    DELETE FROM assignment
    WHERE assignment_id = assig_id;
    SET deleting_rows = ROW_COUNT();
    RETURN deleting_rows; -- 1 якщо видалено, 0 якщо ні
END;
//
DELIMITER ;

-- 12. Загальна кількість планових годин для викладача
DROP FUNCTION IF EXISTS Total_Number_of_Scheduled_Hours_for_a_Teacher;
DELIMITER //
CREATE FUNCTION Total_Number_of_Scheduled_Hours_for_a_Teacher(teacher_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN IFNULL(
        (SELECT SUM(plan_hours) FROM assignment WHERE emp_id = teacher_id), 0);
END;
//
DELIMITER ;

-- 13. Загальна кількість вичитаних годин для викладача
DROP FUNCTION IF EXISTS Total_Number_of_Deducted_Hours_for_the_Teacher;
DELIMITER //
CREATE FUNCTION Total_Number_of_Deducted_Hours_for_the_Teacher(teacher_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN IFNULL(
        (SELECT SUM(hours_taught) FROM assignment WHERE emp_id = teacher_id), 0);
END;
//
DELIMITER ;

-- 14. Перевірка участі викладача у проєкті
DROP PROCEDURE IF EXISTS Participation_check;
DELIMITER //
CREATE PROCEDURE Participation_check(
    IN teacher_full_name VARCHAR(100),
    IN project_name VARCHAR(100)
)
BEGIN
    SELECT 
        t.emp_full_name AS ПІБ_викладача,
        r.research_name AS Назва_проєкту,
        r.start_date AS Дата_початку,
        r.end_date AS Дата_завершення
    FROM participation_in_research p
    JOIN teacher t ON p.emp_id = t.emp_id
    JOIN research r ON p.research_id = r.research_id
    WHERE 
        t.emp_full_name COLLATE utf8mb4_general_ci = teacher_full_name COLLATE utf8mb4_general_ci
        AND r.research_name COLLATE utf8mb4_general_ci = project_name COLLATE utf8mb4_general_ci;
END;
//
DELIMITER ;

-- 15. Розрахунок залишкових годин для дисципліни
DROP FUNCTION IF EXISTS Calculation_of_Remaining_Hours_for_a_Discipline;
DELIMITER //
CREATE FUNCTION Calculation_of_Remaining_Hours_for_a_Discipline(sub_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    DECLARE taught INT;
    DECLARE remaining INT;
    SELECT total_hours INTO total
    FROM subjects
    WHERE subject_id = sub_id;
    SELECT IFNULL(SUM(hours_taught), 0) INTO taught
    FROM assignment
    WHERE subject_id = sub_id;
    SET remaining = total - taught;
    RETURN IFNULL(remaining, 0);
END;
//
DELIMITER ;

SHOW TRIGGERS FROM kafedra;
-- 16. Заборона видалення призначення з вичитаними годинами
DROP TRIGGER IF EXISTS Prohibit_deletion_of_appointments_with_deducted_hours;
DELIMITER //
CREATE TRIGGER Prohibit_deletion_of_appointments_with_deducted_hours
BEFORE DELETE ON assignment
FOR EACH ROW
BEGIN
     IF OLD.hours_taught = OLD.plan_hours THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Не можна видалити призначення з вичитаними годинами';
    END IF;
END;
//
DELIMITER ;

-- 17. Перевірка максимального навантаження викладача (600 год/рік)
DROP TRIGGER IF EXISTS Checking_Maximum_Load_of_a_Teacher;
DELIMITER //
CREATE TRIGGER Checking_Maximum_Load_of_a_Teacher
BEFORE INSERT ON assignment
FOR EACH ROW
BEGIN
    DECLARE current_load INT;
    SET current_load = Загальна_кількість_планових_годин_для_викладача(NEW.emp_id);
    IF current_load + NEW.plan_hours > 600 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Навантаження викладача перевищує ліміт';
    END IF;
END;
//
DELIMITER ;

-- 18. Автоматичне оновлення дати модифікації НДР
DROP TRIGGER IF EXISTS Automatic_Update_of_Project_Modification_Date;
DELIMITER //
CREATE TRIGGER Automatic_Update_of_Project_Modification_Date
BEFORE UPDATE ON research
FOR EACH ROW
BEGIN
    SET NEW.start_date = OLD.start_date;
    SET NEW.end_date = CURRENT_DATE();
END;
//
DELIMITER ;

-- 19. Зведене навантаження викладачів
DROP VIEW IF EXISTS Aggregate_Teacher_Load;
DELIMITER //
CREATE VIEW Aggregate_Teacher_Load AS
SELECT 
    emp_id AS ID_викладача,
    emp_full_name AS ПІБ,
    SUM(plan_hours) AS Загальна_кількість_годин_за_планом,
    SUM(hours_taught) AS Загальна_кількість_вичитаних_годин
FROM assignment
JOIN teacher USING(emp_id)
GROUP BY emp_id;
//
DELIMITER ;

-- 20. НДР з кількістю учасників та дати проведення
DROP VIEW IF EXISTS Research_with_number_of_participants_and_dates_of_conduction;
DELIMITER //
CREATE VIEW Research_with_number_of_participants_and_dates_of_conduction AS
SELECT 
    research_id AS ID_НДР,
    research_name AS Назва_НДР,
    start_date AS Дата_початку,
    end_date AS Дата_завершення,
    COUNT(emp_id) AS Кількість_учасників
FROM research
LEFT JOIN participation_in_research USING(research_id)
GROUP BY research_id;
//
DELIMITER ;

-- 21. Дисципліни з залишковими годинами
DROP VIEW IF EXISTS Disciplines_With_Remaining_Hours;
DELIMITER //
CREATE VIEW Disciplines_With_Remaining_Hours AS
SELECT 
    subject_id AS ID_дисципліни,
    subject_name AS Назва_дисципліни,
    total_hours AS Загальна_кількість_годин,
    GREATEST(0, Calculation_of_Remaining_Hours_for_a_Discipline(subject_id)) AS Години_що_залишилися
FROM subjects;
//
DELIMITER ;

-- Ролі
DROP ROLE IF EXISTS teacher_;
DROP ROLE IF EXISTS kafedra_head;
CREATE ROLE teacher_;
CREATE ROLE kafedra_head;
SELECT CURRENT_ROLE(); 
SHOW GRANTS;

-- Користувач завідувач кафедри
GRANT ALL PRIVILEGES ON kafedra.* TO kafedra_head;

DROP USER IF EXISTS 'roman_head'@'localhost';
CREATE USER 'roman_head'@'localhost' IDENTIFIED BY 'd32d2d';
GRANT kafedra_head TO 'roman_head'@'localhost';
SET DEFAULT ROLE kafedra_head TO 'roman_head'@'localhost';

-- Користувач викладач
GRANT SELECT ON kafedra.teacher TO teacher_;
GRANT SELECT ON kafedra.assignment TO teacher_;
GRANT SELECT ON kafedra.subjects TO teacher_;
GRANT SELECT ON kafedra.lesson_type TO teacher_;
GRANT SELECT ON kafedra.research TO teacher_;
GRANT SELECT, INSERT ON kafedra.participation_in_research TO teacher_;
-- Не може
REVOKE INSERT, UPDATE, DELETE ON kafedra.teacher FROM teacher_;
REVOKE UPDATE, DELETE ON kafedra.assignment FROM teacher_;
REVOKE UPDATE, DELETE ON kafedra.subjects FROM teacher_;
REVOKE UPDATE, DELETE ON kafedra.research FROM teacher_;

DROP USER IF EXISTS 'roman_teacher'@'localhost';
CREATE USER 'roman_teacher'@'localhost' IDENTIFIED BY '8y7yr77ef';
GRANT teacher_ TO 'roman_teacher'@'localhost';
SET DEFAULT ROLE teacher_ TO 'roman_teacher'@'localhost';

