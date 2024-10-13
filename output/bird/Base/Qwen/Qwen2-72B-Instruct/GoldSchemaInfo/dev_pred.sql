SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`)  FROM frpm  WHERE `County Name` = 'Alameda'
SELECT "Educational Option Type", ("Free Meal Count (Ages 5-17)" / "Enrollment (Ages 5-17)") AS eligible_free_rate  FROM frpm  WHERE "Educational Option Type" = 'Continuation School'  ORDER BY eligible_free_rate ASC  LIMIT 3;
SELECT T2.Zip FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.District_Name = 'Fresno County Office of Education' AND T1.`Charter School (Y/N)` = 1
SELECT T2.MailStreet FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1."FRPM Count (K-12)" = (SELECT MAX("FRPM Count (K-12)") FROM frpm)
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`Charter Funding Type` = 'Directly funded' AND T2.OpenDate > '2000-01-01'
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F'
SELECT T2.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 500 AND T2.Magnet = 1;
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)
SELECT T1.NumTstTakr FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 1
SELECT COUNT(*) FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.`Charter Funding Type` = 'Directly funded'
SELECT T2."FRPM Count (Ages 5-17)" FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)
SELECT T1.CDSCode FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Enrollment (K-12)` + T2.`Enrollment (Ages 5-17)` > 500
SELECT MAX(T2.Free_Meal_Count__Ages_5_17 / T2.Enrollment__Ages_5_17) FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 / T1.NumTstTakr > 0.3
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr != 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3
SELECT T2.NCESSchool FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT s.District, MAX(ss.AvgScrRead) AS Max_Average_Reading_Score FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY Max_Average_Reading_Score DESC LIMIT 1;
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Merged' AND schools.County = 'Alameda' AND satscores.NumTstTakr < 100;
