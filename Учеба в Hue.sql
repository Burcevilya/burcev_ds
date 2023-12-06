--Table 1

--В таблице department содержится список отделов компании
department_id        идентификатор подразделения,
department_name        наименование подразделения,
department_head        идентификатор сотрудника - главы отдела

CREATE TABLE department (
department_id INT NOT NULL,
department_name VARCHAR (30),
department_head INT NOT NULL,
PRIMARY KEY(department_id) 
);
STORED AS PARQUET TBLPROPERTIES ('transactional'='false')  


INSERT INTO department (department_id, department_name, department_head) 
VALUES 
(111, 'Налоговое управление', 2),
(112, 'Юридическое управление', 4),
(113, 'Экономическое управление', 6),
(114, 'Административное управление', 8),
(115, 'Административное управление', 4)
(116, 'Административное управление', 4);


--Table 2

В таблице personell содержится список сотрудников компании.
Таблица содержит следующие поля:
pers_id            уникальный номер сотрудника,
department_id    уникальный номер подразделения, в котором работает сотрудник
chief_id        id руководителя для данного сотрудника
pers_name        ФИО сотрудника,
pers_salary        оклад сотрудника в месяц, тыс. руб.
pers_bd            дата рождения сотрудника
gender            пол сотрудника


CREATE TABLE personell (
pers_id INT NOT NULL,
department_id INT NOT NULL, 
chief_id INT,        
pers_name VARCHAR (50),
pers_salary INT NOT NULL,
pers_birthday DATE NOT NULL,
gender VARCHAR (3),
PRIMARY KEY(pers_id)
);
STORED AS PARQUET TBLPROPERTIES ('transactional'='false')  



INSERT INTO personell (pers_id, department_id, chief_id, pers_name, pers_salary, pers_birthday, gender) 
VALUES 
(1, 111, 2, 'Балбасянц Илья Сергеевич', '110', '1996-05-12', 'муж'),
(2, 111, NULL, 'Богдашкин Алексей Владимирович', '170', '1982-08-22', 'муж'),
(3, 112, 4, 'Бородулина Мария Владимировна', '190', '1992-02-17', 'жен'),
(4, 117, NULL, 'Брюханова Лариса Анатольевна', '185', '2001-03-05', 'жен'),
(5, 112, 4, 'Гаврилова Алина Владимировна', '205', '2000-06-23', 'жен'),
(6, 113, NULL, 'Гахраманов Михаил Иванович', '160', '1999-01-14', 'муж'),
(7, 113, 6, 'Глобус Аанастасия Сергеевна', '201', '2002-11-01', 'жен'),
(8, 119, NULL, 'Захарова Алеся Юрьевна', '198', '2002-11-01', 'жен'),
(9, 114, 8, 'Зеленина Лариса Николаевна', '187', '1987-09-11', 'жен'),
(10, 114, 8, 'Куковякин Александр Владимирович', '179', '1999-03-27', 'муж');


Решение - Join
1. left join
select P.department_id, D.department_id, P.pers_name as 'ФИО', department_name as 'Управление'
from personell P left join department D on P.department_id=D.department_id
