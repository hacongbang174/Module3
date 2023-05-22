create database th_student_manager;
use th_student_manager;

CREATE TABLE student (
	id INT AUTO_INCREMENT NOT NULL,
	`name` VARCHAR(200) NOT NULL,
	dob DATE NOT NULL,
	address VARCHAR(255) NOT NULL,
	phone VARCHAR(50) NOT NULL,
    email varchar(50) NOT NULL,
    id_classroom INT NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT fk_id_classroom_student FOREIGN KEY (id_classroom)
	REFERENCES classroom (id_classroom)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);
INSERT student (`name`, dob, address, phone, email, id_classroom)
VALUES ('Châu Văn Nghĩa', '1992-09-15', 'Huế', '0999999999', 'chaunghia@gmail.com', 2),
('Quốc Pháp', '1997-07-19', 'Huế', '0988888888', 'quocphap@gmail.com', 2),
('Bảo Thi', '2000-04-10', 'Huế', '0977777777', 'baothi_2k@gmail.com', 2),
('Hà Công Bằng', '1994-04-17', 'Huế', '0966666666', 'hacongbang174@gmail.com', 3),
('Hiếu Mexico', '2004-05-05', 'Huế', '0955555555', 'hieumexico@gmail.com', 1);

CREATE TABLE classroom (
	id_classroom INT AUTO_INCREMENT NOT NULL,
	name_classroom VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_classroom)
);
INSERT classroom (id_classroom, name_classroom)
VALUES (1, 'Module 1'), (2, 'Module 2'), (3, 'Module 3');
