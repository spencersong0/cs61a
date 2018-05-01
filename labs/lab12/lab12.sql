.read fa17data.sql
.read sp18data.sql

-- Q2
CREATE TABLE obedience AS
  SELECT seven, denero FROM students;

-- Q3
CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 15 ORDER BY smallest LIMIT 20;

-- Q4
CREATE TABLE matchmaker AS
  SELECT pet, song, color, color FROM <students>;
  SELECT pet, song, color, color FROM <students>;
