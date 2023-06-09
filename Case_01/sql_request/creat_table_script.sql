CREATE TABLE department
(
	department_id SERIAL PRIMARY KEY,
	title varchar (175) NOT NULL,
	phone varchar(15) NOT NULL
);

COMMENT ON TABLE department IS 'Содержит информацию об отделениях, их названии и контактной информации.';

CREATE TABLE course_program
(
	course_program_id SERIAL PRIMARY KEY,
	title varchar(175) NOT NULL,
	description text,
	duration varchar(5) NOT NULL,
	educational_material text
);

COMMENT ON TABLE course_program IS 'Содержит информацию о программе курса, включая описание, продолжительность и учебные материалы.';

CREATE TABLE semester
(
	semester_id SERIAL PRIMARY KEY,
	semester_type varchar(25) NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL
);

COMMENT ON TABLE semester IS 'Содержит информацию о семестрах, включая тип, дату начала и окончания, а также связи с курсами.';

CREATE TABLE faculty
(
	faculty_id SERIAL PRIMARY KEY,
	title varchar(175) NOT NULL,
	dean varchar(175) NOT NULL,
	fk_department_id integer REFERENCES department(department_id)
);

COMMENT ON TABLE faculty IS 'Представляет информацию о факультетах, их названии, декане и связях с отделениями.';


CREATE TABLE study_group
(
	study_group_id SERIAL PRIMARY KEY,
	group_number varchar(55) NOT NULL,
	year_of_entry date NOT NULL,
	fk_department_id integer REFERENCES department(department_id) NOT NULL,
	fk_faculty_id integer REFERENCES faculty(faculty_id) NOT NULL,
	fk_semester_id integer REFERENCES semester(semester_id) NOT NULL
);

COMMENT ON TABLE study_group IS 'Представляет собой информацию о курсах, их названии, программе курса и связях с факультетами.';

CREATE TABLE course 
(
	course_id SERIAL PRIMARY KEY,
	title varchar(175) NOT NULL,
	fk_course_program_id int REFERENCES course_program(course_program_id)
);

COMMENT ON TABLE course IS 'Представляет собой информацию о курсах, их названии, программе курса и связях с факультетами.';

CREATE TABLE student 
(
	student_id SERIAL PRIMARY KEY,
	first_name varchar(64) NOT NULL,
	last_name varchar(64) NOT NULL,
	sex varchar(10) NOT NULL CHECK (sex IN ('male', 'female')),
	year_of_birth date NOT NULL,
	email varchar(255) NOT NULL,
	phone varchar(15) NOT NULL,
	fk_department_id integer REFERENCES department(department_id) NOT NULL,
	fk_faculty_id integer REFERENCES faculty(faculty_id) NOT NULL,
	fk_course_id integer REFERENCES course(course_id) NOT NULL,
	fk_study_group_id integer REFERENCES study_group(study_group_id) NOT NULL,
	fk_semester_id integer REFERENCES semester(semester_id) NOT NULL
);

COMMENT ON TABLE student IS 'Представляет информацию о студентах, их личных данных, контактной информации, а также связях с отделением, факультетом, курсом, группой и семестром.';

CREATE TABLE teacher 
(
	teacher_id SERIAL PRIMARY KEY,
	first_name varchar(64) NOT NULL,
	last_name varchar(64) NOT NULL,
	year_of_birth DATE NOT NULL,
	email varchar(255) NOT NULL,
	phone varchar(15) NOT NULL,
	employment varchar(25) NOT NULL,
	fk_department_id integer REFERENCES department(department_id) NOT NULL
);

COMMENT ON TABLE teacher IS 'Содержит информацию о преподавателях, включая их имя, фамилию, контактную информацию, занятость, а также связи с отделением, факультетами, курсами и группами.';

CREATE TABLE independent_work
(
	independent_work_id SERIAL PRIMARY KEY,
	title varchar(175) NOT NULL,
	description text,
	assignment_date date NOT NULL,
	date_of_delivery date NOT NULL,
	fk_teacher_id integer REFERENCES teacher(teacher_id) NOT NULL
);

COMMENT ON TABLE independent_work IS 'Представляет задания для самостоятельной работы, их название, описание, дату назначения и сдачи, а также связи с факультетами, курсами, группами, студентами и преподавателями.';

CREATE TABLE exam
(
	exam_id SERIAL PRIMARY KEY,
	exam_date timestamp NOT NULL
);

COMMENT ON TABLE exam IS 'Содержит информацию о экзаменах, включая связи с факультетами, курсами, группами, преподавателями и датой/временем экзамена.';

CREATE TABLE evaluation_type
(
	evaluation_type_id SERIAL PRIMARY KEY,
	fk_evaluation_type_independent_work int REFERENCES independent_work(independent_work_id),
	fk_independent_work_exam int REFERENCES exam(exam_id)
);

COMMENT ON TABLE evaluation_type IS 'Описывает типы оценок, такие как экзамен и задание для самостоятельной работы, и их связи с оценками';


CREATE TABLE evaluation
(
	evaluation_id SERIAL PRIMARY KEY,
	evaluation_value varchar(20) NOT NULL,
	evaluation_date date NOT NULL,
	fk_evaluation_type_id integer REFERENCES evaluation_type(evaluation_type_id) NOT NULL
);

COMMENT ON TABLE evaluation IS 'Содержит информацию об отделениях, их названии и контактной информации.';

CREATE TABLE schedule
(
	schedule_id SERIAL PRIMARY KEY, 
	title varchar(175) NOT NULL,
	schedule_date timestamp NOT NULL
);

COMMENT ON TABLE schedule IS 'Содержит информацию о расписании занятий, включая тип, дату/время, связи с отделением, факультетами, курсами, группами, преподавателями, аудиториями и экзаменами.';

CREATE TABLE building
(
	building_id SERIAL PRIMARY KEY,
	title varchar(175) NOT NULL,
	city varchar(175) NOT NULL,
	street varchar(175) NOT NULL,
	house varchar(15) NOT NULL,
	building varchar(15)
);

COMMENT ON TABLE building IS 'Описывает здания, их название, местоположение и связи с отделениями, факультетами и аудиториями.';

CREATE TABLE auditorium
(
	auditorium_id SERIAL PRIMARY KEY,
	auditorium_number varchar(5) NOT NULL,
	title varchar(175) NOT NULL,
	auditorium_type varchar(175),
	capacity int
);

COMMENT ON TABLE auditorium IS 'Представляет информацию об аудиториях, включая номер, название, тип (лекционная, компьютерная) и вместительность.';

CREATE TABLE curriculum
(
	curriculum_id SERIAL PRIMARY KEY,
	duration varchar(5) NOT NULL,
	requirement text
);

COMMENT ON TABLE curriculum IS 'Содержит информацию о программе курса, включая описание, продолжительность и учебные материалы.';


CREATE TABLE teacher_faculty
(
	teacher_id int REFERENCES teacher(teacher_id),
	faculty_id int REFERENCES faculty(faculty_id),
	
	CONSTRAINT teacher_faculty_pkey PRIMARY KEY (teacher_id, faculty_id)
);

CREATE TABLE teacher_course
(
	teacher_id int REFERENCES teacher(teacher_id),
	course_id int REFERENCES course(course_id),
	
	CONSTRAINT teacher_course_pkey PRIMARY KEY (teacher_id, course_id)
);

CREATE TABLE teacher_study_group
(
	teacher_id int REFERENCES teacher(teacher_id),
	study_group_id int REFERENCES study_group(study_group_id),
	
	CONSTRAINT teacher_study_group_pkey PRIMARY KEY (teacher_id, study_group_id)
);

CREATE TABLE faculty_course
(
	faculty_id int REFERENCES faculty(faculty_id),
	course_id int REFERENCES course(course_id),
	
	CONSTRAINT faculty_course_pkey PRIMARY KEY (faculty_id, course_id)
);

CREATE TABLE evaluation_student
(
	evaluation_id int REFERENCES evaluation(evaluation_id),
	student_id int REFERENCES student(student_id),
	
	CONSTRAINT evaluation_student_pkey PRIMARY KEY (evaluation_id, student_id)
);

CREATE TABLE evaluation_teacher
(
	evaluation_id int REFERENCES evaluation(evaluation_id),
	teacher_id int REFERENCES teacher(teacher_id),
	
	CONSTRAINT evaluation_teacher_pkey PRIMARY KEY (evaluation_id, teacher_id)
);

CREATE TABLE evaluation_course
(
	evaluation_id int REFERENCES evaluation(evaluation_id),
	course_id int REFERENCES course(course_id),
	
	CONSTRAINT evaluation_course_pkey PRIMARY KEY (evaluation_id, course_id)
);

CREATE TABLE department_schedule
(
	department_id int REFERENCES department(department_id),
	schedule_id int REFERENCES schedule(schedule_id),
		
	CONSTRAINT department_schedule_pkey PRIMARY KEY (department_id, schedule_id)
);

CREATE TABLE schedule_faculty
(
	schedule_id int REFERENCES schedule(schedule_id),
	faculty_id int REFERENCES faculty(faculty_id),
	
	CONSTRAINT schedule_faculty_pkey PRIMARY KEY (schedule_id, faculty_id)
);

CREATE TABLE schedule_course
(
	schedule_id int REFERENCES schedule(schedule_id),
	course_id int REFERENCES course(course_id),
	
	CONSTRAINT schedule_course_pkey PRIMARY KEY (schedule_id, course_id)
);

CREATE TABLE schedule_study_group
(
	schedule_id int REFERENCES schedule(schedule_id),
	study_group_id int REFERENCES study_group(study_group_id),
	
	CONSTRAINT schedule_study_group_pkey PRIMARY KEY (schedule_id, study_group_id)
);

CREATE TABLE schedule_teacher
(
	schedule_id int REFERENCES schedule(schedule_id),
	teacher_id int REFERENCES teacher(teacher_id),
	
	CONSTRAINT schedule_teacher_pkey PRIMARY KEY (schedule_id, teacher_id)
);

CREATE TABLE schedule_auditorium
(
	schedule_id int REFERENCES schedule(schedule_id),
	auditorium_id int REFERENCES auditorium(auditorium_id),
	
	CONSTRAINT schedule_auditorium_pkey PRIMARY KEY (schedule_id, auditorium_id)
);

CREATE TABLE building_department
(
	building_id int REFERENCES building(building_id),
	department_id int REFERENCES department(department_id),
	
	CONSTRAINT building_department_pkey PRIMARY KEY (building_id, department_id)
);

CREATE TABLE building_faculty
(
	building_id int REFERENCES building(building_id),
	faculty_id int REFERENCES faculty(faculty_id),
	
	CONSTRAINT building_faculty_pkey PRIMARY KEY (building_id, faculty_id)
);

CREATE TABLE building_auditorium
(
	building_id int REFERENCES building(building_id),
	auditorium_id int REFERENCES auditorium(auditorium_id),
	
	CONSTRAINT building_auditorium_pkey PRIMARY KEY (building_id, auditorium_id)
);

CREATE TABLE semester_course
(
	semester_id int REFERENCES semester(semester_id),
	course_id int REFERENCES course(course_id),
	
	CONSTRAINT semester_course_pkey PRIMARY KEY (semester_id, course_id)
);

CREATE TABLE exam_faculty
(
	exam_id int REFERENCES exam(exam_id),
	faculty_id int REFERENCES faculty(faculty_id),
	
	CONSTRAINT exam_faculty_pkey PRIMARY KEY (exam_id, faculty_id)
);

CREATE TABLE exam_course
(
	exam_id int REFERENCES exam(exam_id),
	course_id int REFERENCES course(course_id),
	
	CONSTRAINT exam_course_pkey PRIMARY KEY (exam_id, course_id)
);

CREATE TABLE exam_study_group
(
	exam_id int REFERENCES exam(exam_id),
	study_group_id int REFERENCES study_group(study_group_id),
	
	CONSTRAINT exam_study_group_pkey PRIMARY KEY (exam_id, study_group_id)
);

CREATE TABLE exam_teacher
(
	exam_id int REFERENCES exam(exam_id),
	teacher_id int REFERENCES teacher(teacher_id),
	
	CONSTRAINT exam_teacher_pkey PRIMARY KEY (exam_id, teacher_id)
);

CREATE TABLE independent_work_teacher
(
	independent_work_id int REFERENCES independent_work(independent_work_id),
	faculty_id int REFERENCES faculty(faculty_id),
	
	CONSTRAINT independent_work_faculty_pkey PRIMARY KEY (independent_work_id, faculty_id)
);

CREATE TABLE independent_work_course
(
	independent_work_id int REFERENCES independent_work(independent_work_id),
	course_id int REFERENCES course(course_id),
	
	CONSTRAINT independent_work_course_pkey PRIMARY KEY (independent_work_id, course_id)
);

CREATE TABLE independent_work_study_group
(
	independent_work_id int REFERENCES independent_work(independent_work_id),
	study_group_id int REFERENCES study_group(study_group_id),
	
	CONSTRAINT independent_work_study_group_pkey PRIMARY KEY (independent_work_id, study_group_id)
);

CREATE TABLE independent_work_student
(
	independent_work_id int REFERENCES independent_work(independent_work_id),
	student_id int REFERENCES student(student_id),
	
	CONSTRAINT independent_work_student_pkey PRIMARY KEY (independent_work_id, student_id)
);

CREATE TABLE curriculum_course
(
	curriculum_id int REFERENCES curriculum(curriculum_id),
	course_id int REFERENCES course(course_id),
	
	CONSTRAINT curriculum_course_pkey PRIMARY KEY (curriculum_id, course_id)
);