SELECT MAX((Free_Meal_Count_K_12 / Enrollment_K_12)) AS Highest_Eligible_Free_Rate FROM frpm WHERE County_Name = 'Alameda'
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Type` = 'Continuation Schools (Public)' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3; 
SELECT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`County Name` = 'Fresno County Office of Education'
SELECT T2.MailingStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.FRPM_Count_K_12 DESC LIMIT 1
SELECT T2.Phone FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F'
SELECT DISTINCT s.School FROM schools AS s JOIN satscores AS st ON s.CDSCode = st.cds WHERE st.NumTstTakr > 500 AND s.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead >= 1500 AND T1.AvgScrMath >= 1500 AND T1.AvgScrWrite >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT T2.NumTstTakr FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`FRPM Count (K-12)` IS NOT NULL ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1
SELECT COUNT(DISTINCT T2.CDSCode) FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.`Charter Funding Type` = 'Directly funded'
SELECT T2.`FRPM Count (Ages 5-17)` FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead DESC LIMIT 1; 
SELECT CDSCode FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500
SELECT MAX(T1.`Percent (%) Eligible Free (Ages 5-17)`) AS MaxEligibleFreeRate FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr > 0.3
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.NumGE1500 / T1.NumTstTakr DESC LIMIT 3 
SELECT T1.CDSCode FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT      T3.District,      AVG(T2.AvgScrRead) AS AvgReadingScore FROM      frpm AS T1 JOIN      satscores AS T2 ON T1.CDSCode = T2.cds JOIN      schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE      T3.StatusType = 'Active' GROUP BY      T3.District ORDER BY      AvgReadingScore DESC LIMIT 1; 
SELECT COUNT(*) FROM satscores WHERE NumTstTakr < 100; 
SELECT T2.AvgScrWrite, T1.CharterNum FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite > 499 ORDER BY T2.AvgScrWrite DESC
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND T1.FundingType = 'Directly funded' AND T2.NumTstTakr <= 250
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1 
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12'
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.`Free Meal Count (K-12)` > 500 AND T1.`Free Meal Count (K-12)` < 700
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Contra Costa' ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT s.School, s.Street, s.StreetAbr, s.City, s.Zip, s.State FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.[Percent (%) Eligible Free (K-12)] > 0.1 AND T2.CDSCode IN (SELECT cds FROM satscores WHERE NumGE1500 >= 1)
SELECT DISTINCT T1.School, T1.FundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Riverside' AND AVG(T2.AvgScrMath) > 400
SELECT DISTINCT T2.School, T2.Street, T2.City, T2.State, T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County Name = 'Monterey' AND T1.`FRPM Count (Ages 15-17)` > 800
SELECT T2.School AS sname, T1.AvgScrWrite, T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate > '1991-12-31' OR T2.ClosedDate < '2000-01-01'; 
SELECT T1.School, T1.DOCType FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) > ( SELECT AVG(ABS(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)) FROM frpm )
SELECT T2.OpenDate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Educational Option Type` = 'K-12' ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 1
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT `Percent (%) Eligible Free (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10
SELECT      CDSCode,      (FRPM Count (K-12)) / (Enrollment (K-12)) AS Rate FROM      frpm WHERE      `School Type` = 'High Schools (Public)' OR `School Type` = 'Elementary Schools (Public)' ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5; 
SELECT T2.Website, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT (T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)`) * 100 AS FreeRate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Kacey Gibson'
{     "chain_of_thought_reasoning": "First, we identify the relevant tables: frpm and schools. Then, we filter for chartered schools by checking the Charter School (Y/N) column. Next, we sort the filtered list by enrollment in grades 1 through 12 in ascending order. After that, we select the top result and extract the administrator's email address from the joined table.",     "SQL": "SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT T2.Street, T2.City, T2.State, T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.NumGE1500 / T1.NumTstTakr ASC LIMIT 1
SELECT T1.website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Los Angeles' AND T2.enroll12 BETWEEN 2000 AND 3000; 
SELECT AVG(NumTstTakr) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE STRFTIME('%Y', T2.OpenDate) = '1980'
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT s.School, r.Rank FROM ( SELECT f.School, s.AvgScrRead, RANK() OVER (PARTITION BY f.County ORDER BY s.AvgScrRead DESC) AS Rank FROM frpm f INNER JOIN satscores s ON f.CDSCode = s.cds WHERE f.Virtual = 'F' ) r WHERE r.Rank <= 5
SELECT T2.EdOpsName FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT ... FROM satscores AS T1  INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode 
SELECT T2.AvgScrWrite, T1.City  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500  ORDER BY T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite DESC  LIMIT 1; 
SELECT T1.School, AVG(T2.AvgScrWrite) AS AverageWritingScore FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName1 = 'Ricci' AND T1.AdmLName1 = 'Ulrich' GROUP BY T1.School
SELECT School FROM schools WHERE DOC = 31 AND DocType = 'State Special' ORDER BY `Enrollment (K-12)` DESC LIMIT 1
