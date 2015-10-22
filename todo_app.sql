\c mikey;

-- Write a query to delete a user named michael if it exists
DROP ROLE IF EXISTS "michael";

-- Write a query to create a user named michael with an encrypted password stonebreaker
CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';

-- Write a query to drop a database named todo_app if it exists
DROP DATABASE IF EXISTS todo_app;

-- Write a query to create a database named todo_app
CREATE DATABASE todo_app;

-- Connect to the newly created database
\c todo_app;

-- Write a query to create a table named tasks using the Initial columns detailed below
CREATE TABLE tasks (
  id serial NOT NULL,
  title varchar(255) NOT NULL,
  description text NULL,
  created_at timestamp NOT NULL,
  updated_at timestamp NULL,
  completed boolean NOT NULL
  );

-- Define column id as the table's primary key
ALTER TABLE tasks ADD PRIMARY KEY (id);

SELECT * FROM tasks;
-- Write queries to accomplish the following
--   remove the column named completed
ALTER TABLE tasks DROP COLUMN completed;

SELECT * FROM tasks;
-- add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL.
ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;

SELECT * FROM tasks;
-- change the updated_at column to not allow NULL values, and have a default value of now()
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();

SELECT * FROM tasks;
-- create a new task, by only setting values (not defining which columns)
--   id = default value
--   title = 'Study SQL'
--   description = 'Complete this exercise'
--   created_at = now()
--   updated_at = now()
--   completed_at = NULL
INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at) VALUES (
    DEFAULT,
    'Study SQL',
    'Complete this exercise',
    now(),
    now(),
    NULL
  );

SELECT * FROM tasks;
-- create a new task
-- title = 'Study PostgreSQL'
-- description = 'Read all the documentation'
INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at) VALUES (
  DEFAULT,
  'Study PostgreSQL',
  'Read all the documentation',
  now(),
  now(),
  DEFAULT
  );

SELECT * FROM tasks;

-- select all the titles of tasks that are not yet completed
SELECT title FROM tasks WHERE completed_at IS NULL;

-- update the task with a title of 'Study SQL' to be completed as of now
UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT * FROM tasks;
-- select all titles and descriptions of tasks that are not yet completed
SELECT title FROM tasks WHERE completed_at IS NULL;
SELECT description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks;
-- select all fields of every task sorted by creation date in descending order
SELECT * FROM tasks ORDER BY created_at DESC;

-- create a new task
--   title = 'mistake 1'
--   description = 'a test entry'
INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at) VALUES (
  DEFAULT,
  'mistake 1',
  'a test entry',
  now(),
  now(),
  DEFAULT
  );

SELECT * FROM tasks;

-- create a new task
--   title = 'mistake 2'
--   description = 'another test entry'
INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at) VALUES (
  DEFAULT,
  'mistake 2',
  'another test entry',
  now(),
  now(),
  DEFAULT
  );

SELECT * FROM tasks;

-- create a new task
--   title = 'third mistake'
--   description = 'another test entry'
INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at) VALUES (
  DEFAULT,
  'third mistake',
  'another test entry',
  now(),
  now(),
  DEFAULT
  );

SELECT * FROM tasks;

-- select title fields of all tasks with a title that includes the word 'mistake'
SELECT title FROM tasks WHERE title LIKE '%mistake%';

-- delete the task that has a title of mistake 1
DELETE FROM tasks WHERE title = 'mistake 1';

SELECT * FROM tasks;
-- select title and description fields of all tasks with a title that includes the word 'mistake'
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

-- delete all tasks that includes the word 'mistake' in the title
DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks;
-- select all fields of all tasks sorted by title in ascending order
SELECT * FROM tasks ORDER BY title ASC;