CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name AS name, size AS size
  FROM dogs, sizes
  WHERE height <= max AND height > min;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child
  FROM parents AS p, dogs AS d
  WHERE d.name = p.parent
  ORDER BY height DESC;


-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT distinct a1.name || " and " || a2.name || " are " || a1.size || " siblings"
  FROM size_of_dogs AS a1, size_of_dogs AS a2, parents as b1, parents as b2
  WHERE a1.size = a2.size AND b1.parent = b2.parent AND a1.name < a2.name
  AND a1.name = b1.child AND a2.name = b2.child
  ORDER BY a1.name;


-- Ways to stack 4 dogs to a height of at least 170, ordered by total height

CREATE TABLE stacks AS
  WITH stacks_helper(four, strings, stack_height, last_height) AS
    (
      SELECT 3, name, height, height
      FROM dogs UNION
      SELECT four - 1, name || ", " || strings, stack_height + height, height
      FROM dogs, stacks_helper
      -- WHERE four > 0 AND stack_height < last_height
      WHERE four > 0 AND height < last_height
    )
  SELECT strings, stack_height
  -- SELECT *
  FROM stacks_helper
  WHERE stack_height > 170 AND four = 0
  ORDER BY stack_height ASC;
