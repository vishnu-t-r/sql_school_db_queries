-- Drop tables and sequence:
/*
DROP TABLE student_batch_maps;
DROP TABLE instructor_batch_maps;
DROP TABLE attendances;
DROP TABLE sessions;
DROP TABLE test_scores;
DROP TABLE tests;
DROP TABLE users;
DROP TABLE batches;
*/
/*
DROP SEQUENCE instructor_batch_maps_id_seq;
DROP SEQUENCE sessions_id_seq;
DROP SEQUENCE tests_id_seq;
DROP SEQUENCE student_batch_maps_id_seq;
DROP SEQUENCE users_id_seq;
DROP SEQUENCE batch_id_seq;
*/

-- 1.users table:  name(user name), active(boolean to check if user is active)
--CREATE SEQUENCE users_id_seq;
CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL, --DEFAULT NEXTVAL ('users_id_seq'),
  name VARCHAR(50) NOT NULL,
  active VARCHAR(50) NOT NULL, --DEFAULT true,
  created_at DATETIME NOT NULL, --DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL --DEFAULT CURRENT_TIMESTAMP
);

insert into users values (1, 'Rohit', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (2, 'James', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (3, 'David', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (4, 'Steven', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (5, 'Ali', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (6, 'Rahul', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (7, 'Jacob', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (8, 'Maryam', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (9, 'Shwetha', 'False', GETDATE()-5, GETDATE()-4);
insert into users values (10, 'Sarah', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (11, 'Alex', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (12, 'Charles', 'False', GETDATE()-5, GETDATE()-4);
insert into users values (13, 'Perry', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (14, 'Emma', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (15, 'Sophia', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (16, 'Lucas', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (17, 'Benjamin', 'True', GETDATE()-5, GETDATE()-4);
insert into users values (18, 'Hazel', 'False', GETDATE()-5, GETDATE()-4);




-- 2.batches  table:  name(batch name), active(boolean to check if batch is active)
--CREATE SEQUENCE batch_id_seq;
CREATE TABLE batches (
  id INTEGER PRIMARY KEY NOT NULL,-- DEFAULT NEXTVAL('batch_id_seq'),
  name VARCHAR(100) UNIQUE NOT NULL,
  active VARCHAR(50) NOT NULL,--DEFAULT true,
  created_at DATETIME NOT NULL,-- DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL-- DEFAULT CURRENT_TIMESTAMP
);

insert into batches values (1, 'Statistics', 'True', GETDATE()-10, GETDATE()-6);
insert into batches values (2, 'Mathematics', 'True', GETDATE()-10, GETDATE()-6);
insert into batches values (3, 'Physics', 'False', GETDATE()-10, GETDATE()-6);




-- 3.student_batch_maps  table: this table is a mapping of the student and his batch. deactivated_at is the time when a student is made inactive in a batch.
--CREATE SEQUENCE student_batch_maps_id_seq;
CREATE TABLE student_batch_maps (
  id INTEGER PRIMARY KEY NOT NULL,-- DEFAULT   NEXTVAL('student_batch_maps_id_seq'),
  user_id INTEGER NOT NULL, --REFERENCES users(id),
  batch_id INTEGER NOT NULL,-- REFERENCES batches(id),
  active VARCHAR(50) NOT NULL,-- DEFAULT true,
  deactivated_at DATETIME NULL,
  created_at DATETIME NOT NULL,-- DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL-- DEFAULT CURRENT_TIMESTAMP
);

insert into student_batch_maps values (1, 1, 1, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (2, 2, 1, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (3, 3, 1, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (4, 4, 1, 'False', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (5, 5, 2, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (6, 6, 2, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (7, 7, 2, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (8, 8, 2, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (9, 9, 2, 'False', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (10, 10, 3, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (11, 11, 3, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (12, 12, 3, 'False', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (13, 13, 3, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (14, 14, 3, 'True', CURRENT_TIMESTAMP, GETDATE()-5, GETDATE()-4);
insert into student_batch_maps values (15, 4, 2, 'True', CURRENT_TIMESTAMP, GETDATE()-4, GETDATE()-3);
insert into student_batch_maps values (16, 9, 3, 'False', CURRENT_TIMESTAMP, GETDATE()-3, GETDATE()-2);
insert into student_batch_maps values (17, 9, 1, 'True', CURRENT_TIMESTAMP, GETDATE()-2, GETDATE()-1);
insert into student_batch_maps values (18, 12, 1, 'True', CURRENT_TIMESTAMP, GETDATE()-4, GETDATE()-3);




-- 4.instructor_batch_maps  table: this table is a mapping of the instructor and the batch he has been assigned to take class/session.
--CREATE SEQUENCE instructor_batch_maps_id_seq;
CREATE TABLE instructor_batch_maps (
  id INTEGER PRIMARY KEY NOT NULL,-- DEFAULT NEXTVAL('instructor_batch_maps_id_seq'),
  user_id INTEGER NOT NULL,--INTEGER REFERENCES users(id),
  batch_id INTEGER NOT NULL,--INTEGER REFERENCES batches(id),
  active VARCHAR(50) NOT NULL,-- DEFAULT true,
  created_at DATETIME NOT NULL,-- DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL-- DEFAULT CURRENT_TIMESTAMP
);

insert into instructor_batch_maps values (1, 15, 1, 'True', GETDATE()-5, GETDATE()-4);
insert into instructor_batch_maps values (2, 16, 2, 'True', GETDATE()-5, GETDATE()-4);
insert into instructor_batch_maps values (3, 17, 3, 'True', GETDATE()-5, GETDATE()-4);
insert into instructor_batch_maps values (4, 18, 2, 'True', GETDATE()-5, GETDATE()-4);




-- 5.sessions table: Every day session happens where the teacher takes a session or class of students.
--CREATE SEQUENCE sessions_id_seq;
CREATE TABLE sessions (
  id INTEGER PRIMARY KEY NOT NULL,-- DEFAULT NEXTVAL('sessions_id_seq'),
  conducted_by INTEGER NOT NULL,-- REFERENCES users(id),
  batch_id INTEGER NOT NULL,-- REFERENCES batches(id),
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into sessions values (1, 15, 1, DATEADD(minute,-240,CURRENT_TIMESTAMP), DATEADD(minute,-180,CURRENT_TIMESTAMP), GETDATE(), GETDATE());
insert into sessions values (2, 16, 2, DATEADD(minute,-240,CURRENT_TIMESTAMP), DATEADD(minute,-180,CURRENT_TIMESTAMP), GETDATE(), GETDATE());
insert into sessions values (3, 17, 3, DATEADD(minute,-240,CURRENT_TIMESTAMP), DATEADD(minute,-180,CURRENT_TIMESTAMP), GETDATE(), GETDATE());
insert into sessions values (4, 15, 1, DATEADD(minute,-180,CURRENT_TIMESTAMP), DATEADD(minute,-120,CURRENT_TIMESTAMP), GETDATE(), GETDATE());
insert into sessions values (5, 16, 2, DATEADD(minute,-180,CURRENT_TIMESTAMP), DATEADD(minute,-120,CURRENT_TIMESTAMP), GETDATE(), GETDATE());
insert into sessions values (6, 18, 2, DATEADD(minute,-120,CURRENT_TIMESTAMP), DATEADD(minute,-60,CURRENT_TIMESTAMP), GETDATE(), GETDATE());




-- 6.attendances table: After session or class happens between teacher and student, attendance is given by student. students provide ratings to the teacher.
CREATE TABLE attendances (
  student_id INTEGER NOT NULL,-- REFERENCES users(id),
  session_id INTEGER NOT NULL,-- REFERENCES sessions(id),
  rating DOUBLE PRECISION NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (student_id, session_id)
);

insert into attendances values (1, 1, 8.5, GETDATE(), GETDATE());
insert into attendances values (2, 1, 7.5, GETDATE(), GETDATE());
insert into attendances values (3, 1, 6.0, GETDATE(), GETDATE());
insert into attendances values (5, 2, 8.5, GETDATE(), GETDATE());
insert into attendances values (6, 2, 7.5, GETDATE(), GETDATE());
insert into attendances values (7, 2, 6.0, GETDATE(), GETDATE());
insert into attendances values (8, 2, 6.0, GETDATE(), GETDATE());
insert into attendances values (10, 3, 9.5, GETDATE(), GETDATE());
insert into attendances values (11, 3, 7.0, GETDATE(), GETDATE());
insert into attendances values (13, 3, 8.0, GETDATE(), GETDATE());
insert into attendances values (14, 3, 6.0, GETDATE(), GETDATE());
insert into attendances values (1, 4, 7.0, GETDATE(), GETDATE());
insert into attendances values (2, 4, 5.5, GETDATE(), GETDATE());
insert into attendances values (5, 5, 5.0, GETDATE(), GETDATE());
insert into attendances values (5, 6, 6.0, GETDATE(), GETDATE());
insert into attendances values (9, 2, 4.0, GETDATE(), GETDATE());
insert into attendances values (12, 3, 5.0, GETDATE(), GETDATE());




-- 7.tests table: Test is created by instructor. total_mark is the maximum marks for the test.
--CREATE SEQUENCE tests_id_seq;
CREATE TABLE tests (
   id INTEGER PRIMARY KEY NOT NULL,-- DEFAULT NEXTVAL('tests_id_seq'),
  batch_id INTEGER NOT NULL,--REFERENCES batches(id),
  created_by INTEGER NOT NULL,--REFERENCES users(id),
  total_mark INTEGER NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into tests values (1, 1, 15, 100, GETDATE(), GETDATE());
insert into tests values (2, 2, 16, 100, GETDATE(), GETDATE());
insert into tests values (3, 3, 17, 100, GETDATE(), GETDATE());
insert into tests values (4, 2, 18, 100, GETDATE(), GETDATE());
insert into tests values (5, 1, 15, 50, GETDATE(), GETDATE());
insert into tests values (6, 1, 15, 25, GETDATE(), GETDATE());
insert into tests values (7, 1, 15, 25, GETDATE(), GETDATE());
insert into tests values (8, 2, 16, 50, GETDATE(), GETDATE());
insert into tests values (9, 3, 17, 50, GETDATE(), GETDATE());



-- 8.test_scores table: Marks scored by students are added in the test_scores table.
CREATE TABLE test_scores (
  test_id INTEGER NOT NULL,--REFERENCES tests(id),
  user_id INTEGER NOT NULL,--REFERENCES users(id),
  score INTEGER NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(test_id, user_id)
);

insert into test_scores values (1, 1, 80, GETDATE(), GETDATE());
insert into test_scores values (1, 2, 60, GETDATE(), GETDATE());
insert into test_scores values (1, 3, 30, GETDATE(), GETDATE());
insert into test_scores values (2, 5, 80, GETDATE(), GETDATE());
insert into test_scores values (2, 6, 35, GETDATE(), GETDATE());
insert into test_scores values (2, 7, 38, GETDATE(), GETDATE());
insert into test_scores values (2, 8, 90, GETDATE(), GETDATE());
insert into test_scores values (3, 10, 65, GETDATE(), GETDATE());
insert into test_scores values (3, 11, 85, GETDATE(), GETDATE());
insert into test_scores values (3, 13, 95, GETDATE(), GETDATE());
insert into test_scores values (3, 14, 100, GETDATE(), GETDATE());
insert into test_scores values (5, 1, 40, GETDATE(), GETDATE());
insert into test_scores values (5, 2, 35, GETDATE(), GETDATE());
insert into test_scores values (5, 3, 45, GETDATE(), GETDATE());
insert into test_scores values (6, 1, 22, GETDATE(), GETDATE());
insert into test_scores values (6, 2, 12, GETDATE(), GETDATE());
insert into test_scores values (7, 1, 16, GETDATE(), GETDATE());
insert into test_scores values (7, 3, 10, GETDATE(), GETDATE());
insert into test_scores values (8, 5, 15, GETDATE(), GETDATE());
insert into test_scores values (8, 6, 20, GETDATE(), GETDATE());
insert into test_scores values (9, 13, 25, GETDATE(), GETDATE());
insert into test_scores values (9, 14, 35, GETDATE(), GETDATE());


