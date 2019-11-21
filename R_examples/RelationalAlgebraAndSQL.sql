/*
RelationalAlgebraAndSQL.sql
Copyright 2013-2015 by Ernst Henle

SQL Code to accompany RelationalAlgebraAndSQL.docx

{}
Items in squiggly brackets are subscripted

⋈=
This symbol is my attempt at creating a right join symbol.
The equal sign represents the two lines on the right of the bowtie

=⋈
By analogy, this symbol is my attempt at a left join symbol.

=⋈=
By analogy, this symbol is my attempt at a full join symbol.

This code was developed in SQLServer Management Studio
There are some differences in MySQL and SQL Fiddle:  http://sqlfiddle.com/
*/

USE MatrixAlgebra
GO
BEGIN TRY 
DROP TABLE R;
END TRY BEGIN CATCH END CATCH
BEGIN TRY 
DROP TABLE S;
END TRY BEGIN CATCH END CATCH
BEGIN TRY 
DROP TABLE T;
END TRY BEGIN CATCH END CATCH
GO



-- Create Relations as operands for the operations
CREATE TABLE R (C1 int, C2 nchar(1)); 
CREATE TABLE S (C1 int, C2 nchar(1));
CREATE TABLE T (C1 int);
GO

TRUNCATE TABLE R;
GO
INSERT INTO R VALUES (1, 'B');
INSERT INTO R VALUES (2, 'A');
INSERT INTO R VALUES (3, 'B');
INSERT INTO R VALUES (4, 'A');
SELECT * FROM R;

TRUNCATE TABLE S;
GO
INSERT INTO S VALUES (2, 'A');
INSERT INTO S VALUES (4, 'B');
INSERT INTO S VALUES (6, 'C');
SELECT * FROM R;
SELECT * FROM S;

TRUNCATE TABLE T;
GO
INSERT INTO T VALUES (1);
INSERT INTO T VALUES (3);
SELECT * FROM T


-- Union:  R ᴜ S
SELECT * FROM R
UNION
SELECT * FROM S;

-- Intersect:  R ∩ S
SELECT * FROM R
INTERSECT
SELECT * FROM S;

-- Difference:  R - S
SELECT * FROM R
EXCEPT
SELECT * FROM S;

-- Rename:  ρ{K1/C1}(R)
SELECT C1 AS K1, C2 FROM R

-- Select:  σ{C2 = 'B'}(R)
SELECT * FROM R
WHERE C2 = 'B';

-- Project:  π{C1}(R)
SELECT C1 FROM R

-- Cartesian Product:  R X S
SELECT * FROM R, S

-- Join (theta Join): R ⋈{R.C1=S.C1} S
SELECT * FROM R
JOIN S ON R.C1=S.C1

-- Natural Join:  R ⋈ S
SELECT
R.*
FROM R
JOIN S ON R.C1=S.C1 AND R.C2=S.C2

-- Left Join:  R =⋈{R.C1=S.C1} S
SELECT * FROM R
LEFT JOIN S ON R.C1=S.C1

-- Right Join:  R ⋈={R.C1=S.C1} S
SELECT * FROM R
RIGHT JOIN S ON R.C1=S.C1

-- Full Join:  R =⋈={R.C1=S.C1} S
SELECT * FROM R
FULL JOIN S ON R.C1=S.C1;

-- LeftSemi-Join:  R ⋊{R.C1=S.C1} S
SELECT R.* FROM R
JOIN S ON R.C1=S.C1;

-- Right Semi Join: R ⋉{R.C1=S.C1} S
SELECT S.* FROM R
JOIN S ON R.C1=S.C1

-- Anti Join:  R ⊳{R.C1=S.C1} S
SELECT * FROM R
EXCEPT
SELECT R.* FROM R
JOIN S ON R.C1=S.C1

-- Self Join:  
SELECT * FROM S AS R JOIN S ON 2 = S.C1;

-- Division:  R ÷ T
SELECT C2 FROM R
EXCEPT
SELECT C2 FROM
(SELECT * FROM T, (SELECT C2 FROM R) AS U
EXCEPT
SELECT * FROM R) AS U