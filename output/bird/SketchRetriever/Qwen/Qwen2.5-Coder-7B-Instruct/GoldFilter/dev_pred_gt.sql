SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS HighestEligibleFreeRate FROM `frpm` WHERE `County Name` = 'Alameda';	california_schools
SELECT Free_Meal_Count__Ages_5_17__ / Enrollment_Ages_5_17 AS Free_Rate FROM frpm WHERE Educational_Option_Type = 'Continuation' ORDER BY Free_Rate ASC LIMIT 3;	california_schools
SELECT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`District Name` = 'Fresno County Office of Education'	california_schools
SELECT T2.MailStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1	california_schools
SELECT s.Phone  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.`Charter School (Y/N)` = 1 AND s.OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F';	california_schools
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 500 AND T2.Magnet = 1	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1	california_schools
SELECT s.NumTstTakr FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm);	california_schools
SELECT COUNT(*) FROM frpm INNER JOIN satscores ON frpm.CDSCode = satscores.cds WHERE satscores.AvgScrMath > 560 AND frpm.`Charter Funding Type` = 'Directly funded'	california_schools
SELECT f.`FRPM Count (Ages 5-17)` FROM frpm f JOIN satscores s ON f.CDSCode = s.cds ORDER BY s.AvgScrRead DESC LIMIT 1;	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)`) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 / T2.NumTstTakr > 0.3	california_schools
SELECT T2.Phone, CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr AS ExcellenceRate FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr IS NOT NULL AND T1.NumGE1500 IS NOT NULL ORDER BY ExcellenceRate DESC LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5;	california_schools
SELECT T2.District FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' ORDER BY T1.AvgScrRead DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Alameda' AND T1.NumTstTakr < 100	california_schools
SELECT s.CDSCode AS CharterNumber, AVG(fs.AvgScrWrite) AS AvgScoreInWriting FROM frpm f JOIN satscores fs ON f.CDSCode = fs.cds WHERE fs.AvgScrWrite > 499 AND s.CDSCode IS NOT NULL GROUP BY s.CDSCode ORDER BY AvgScoreInWriting DESC;	california_schools
SELECT COUNT(*) FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Fresno' AND T2.FundingType = 'Direct' AND T1.NumTstTakr <= 250;	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Amador' AND T1.LowGrade = '9' AND T1.HighGrade = '12';	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;	california_schools
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1;	california_schools
SELECT s.School, s.StreetAbr  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.`School Name`, f.`Free Meal Count (K-12)`, f.`Enrollment (K-12)` FROM frpm f JOIN satscores sa ON f.CDSCode = sa.cds WHERE (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) > 0.1 AND sa.NumGE1500 >= 1;	california_schools
SELECT T2.`District Name`, T2.`Charter Funding Type` FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode GROUP BY T2.`District Name`, T2.`Charter Funding Type` HAVING AVG(T1.AvgScrMath) > 400	california_schools
SELECT s.`School Name`, s.Street, s.City, s.State, s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`School Type` = 'High' AND s.County = 'Monterey' AND f.`Free Meal Count (Ages 5-17)` > 800;	california_schools
SELECT s.School, s.Phone, AVG(ss.AvgScrWrite) AS AvgScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01' GROUP BY s.School, s.Phone;	california_schools
SELECT s.School, s.DOC, f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)] AS Difference FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.FundingType = 'locally funded' HAVING f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)] > (     SELECT AVG(f2.[Enrollment (K-12)] - f2.[Enrollment (Ages 5-17)])     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     WHERE s2.FundingType = 'locally funded' ) ORDER BY Difference DESC;	california_schools
SELECT s.OpenDate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT T2.City, SUM(T1.`Enrollment (K-12)`) AS Total_Enrollment FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T2.City ORDER BY Total_Enrollment ASC LIMIT 5	california_schools
SELECT `Free Meal Count (K-12)` / `Enrollment (K-12)` AS Eligible_Free_Rate FROM `frpm` ORDER BY `Enrollment (K-12)` DESC LIMIT 1 OFFSET 9;	california_schools
SELECT `FRPM Count (K-12)` / `Enrollment (K-12)` AS Rate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.SOC = '66' ORDER BY `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT T2.Website, T1.`School Name` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT SUM(`Free Meal Count (Ages 5-17)`) / SUM(`Enrollment (Ages 5-17)`) AS FreeRate FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Kacey' AND schools.AdmLName1 = 'Gibson'	california_schools
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1	california_schools
SELECT T1.AdmFName1, T1.AdmLName1, T1.AdmFName2, T1.AdmLName2, T1.AdmFName3, T1.AdmLName3 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 >= 1500 GROUP BY T1.School ORDER BY COUNT(T2.NumGE1500) DESC LIMIT 1	california_schools
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr ASC LIMIT 1	california_schools
SELECT T2.Website FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(T1.NumTstTakr) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Fresno' AND STRFTIME('%Y', T2.OpenDate) = '1980'	california_schools
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1;	california_schools
SELECT s.School, s.County, AVG(ss.AvgScrRead) AS AvgReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY AvgReadingScore DESC, s.County ASC LIMIT 5;	california_schools
SELECT T1.EdOpsName FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1	california_schools
SELECT AVG(s.AvgScrMath) AS AvgMathScore, sc.County FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode GROUP BY sc.County ORDER BY SUM(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) ASC LIMIT 1;	california_schools
SELECT AVG(s.AvgScrWrite), sc.City FROM satscores AS s INNER JOIN schools AS sc ON s.cds = sc.CDSCode WHERE s.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores )	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School;	california_schools
SELECT T2.School, SUM(T1.`Enrollment (K-12)`) AS Total_Enrollment FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = 31 GROUP BY T2.School ORDER BY Total_Enrollment DESC LIMIT 1	california_schools
SELECT AVG(COUNT(School)) AS MonthlyAverage FROM schools WHERE County = 'Alameda' AND STRFTIME('%Y', OpenDate) = '1980' AND DOC = 52 GROUP BY MONTH(OpenDate);	california_schools
SELECT      SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS Elementary_School_District_Count,     SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS Unified_School_District_Count FROM      schools WHERE      County = 'Orange' AND (DOC = 52 OR DOC = 54);	california_schools
SELECT County, School, ClosedDate  FROM schools  WHERE StatusType = 'Closed'  GROUP BY County  ORDER BY COUNT(School) DESC  LIMIT 1;	california_schools
SELECT T2.Street, T2.School  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  ORDER BY T1.AvgScrMath DESC  LIMIT 6, 1;	california_schools
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead IS NOT NULL ORDER BY T1.AvgScrRead ASC LIMIT 1	california_schools
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE (T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite) >= 1500 AND T2.MailCity = 'Lakeport'	california_schools
SELECT SUM(NumTstTakr) AS TotalTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE MailCity = 'Fresno';	california_schools
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian';	california_schools
SELECT SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE MailState = 'CA'	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';	california_schools
SELECT T2.Phone, T2.Ext FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 329, 1	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE AdmFName1 IN ('Mike', 'Dante') AND AdmLName1 IN ('Larson', 'Alvarez');	california_schools
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin';	california_schools
SELECT COUNT(School) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = 52;	california_schools
SELECT COUNT(School) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T2.Charter = 0 AND (T1.`Free Meal Count (K-12)` * 100 / T1.`Enrollment (K-12)`) < 0.18;	california_schools
SELECT School, City, AdmFName1, AdmLName1 FROM schools WHERE Charter = 1 AND CharterNum = '00D2';	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';	california_schools
SELECT (COUNT(CASE WHEN FundingType = 'Locally funded' THEN 1 ELSE NULL END) / COUNT(FundingType)) * 100 AS Percentage FROM schools WHERE County = 'Santa Clara';	california_schools
SELECT COUNT(School) FROM schools WHERE OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND FundingType = 'Directly Funded' AND County = 'Stanislaus';	california_schools
SELECT COUNT(*) AS TotalCommunityCollegeDistrictClosures FROM schools WHERE City = 'San Francisco' AND DOCType LIKE '%Community College District%' AND STRFTIME('%Y', ClosedDate) = '1989';	california_schools
SELECT County, COUNT(School) AS ClosureCount FROM schools WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY ClosureCount DESC;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31';	california_schools
SELECT COUNT(*) FROM schools WHERE StatusType IN ('Active', 'Closed') AND County = 'Alpine';	california_schools
SELECT T2.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.City = 'Fresno' AND T1.Magnet = 0	california_schools
SELECT COUNT(`Enrollment (Ages 5-17)`) AS Total_Enrollment FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.AcademicYear = '2014-2015' AND frpm.CDSCode = '01100170109835' AND schools.EdOpsCode = 'SSS';	california_schools
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailStreet = 'PO Box 1040';	california_schools
SELECT LowGrade FROM schools WHERE EdOpsCode = 'SPECON' AND NCESDist = '0613360'	california_schools
SELECT s.EILName, s.School FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`County Code` = '37' AND f.`NSLP Provision Status` = '01';	california_schools
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.LowGrade = '9' AND T1.HighGrade = '12' AND T1.NSLP_Provision_Status LIKE '%Lunch Provision 2%' AND T2.County = 'Merced' AND T2.EILCode = 'HS'	california_schools
SELECT s.County, s.School, f.`Enrollment (Ages 5-17)`, f.`FRPM Count (Ages 5-17)`, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) * 100 AS `Percent (%) Eligible FRPM (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved = 'K-9';	california_schools
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT County, COUNT(Virtual) AS SchoolCount FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY SchoolCount DESC LIMIT 1;	california_schools
SELECT T2.`School Type`, T2.`School Name`, T1.Latitude FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.Latitude DESC LIMIT 1	california_schools
SELECT T2.City, T1.LowGrade, T1.`School Name` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.State = 'CA' ORDER BY T2.Latitude ASC LIMIT 1;	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(longitude) DESC LIMIT 1;	california_schools
SELECT City, COUNT(CDSCode) AS NumberOfSchools, COUNT(DISTINCT City) AS NumberOfCities FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.Magnet = 1 AND schools.GSoffered = 'K-8' AND frpm.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY City;	california_schools
SELECT AdmFName1, District FROM schools WHERE AdmFName1 IS NOT NULL GROUP BY AdmFName1 ORDER BY COUNT(*) DESC LIMIT 2	california_schools
SELECT T2.`District Code`, (T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)` * 100) AS `Percent (%) Eligible Free (K-12)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine' GROUP BY T2.`District Code`	california_schools
SELECT District, County, School, AdmLName1 FROM schools WHERE CharterNum = '40';	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54);	california_schools
SELECT T2.School, T2.AdmEmail1 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1	california_schools
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.A3 = 'East Bohemia' GROUP BY T1.district_id;	financial
SELECT COUNT(account_id) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague';	financial
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district;	financial
SELECT COUNT(T1.district_id) FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T1.A11 > 6000 AND T1.A11 < 10000 GROUP BY T1.district_id	financial
SELECT AVG(T1.A11) AS avg_salary FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'M' AND T1.A3 = 'North Bohemia';	financial
SELECT T1.account_id, T2.gender, T2.birth_date, AVG(T3.A11) AS avg_salary FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.gender = 'F' GROUP BY T2.gender, T2.birth_date ORDER BY T2.birth_date ASC LIMIT 1;  WITH OldestFemaleClients AS (     SELECT T1.account_id, T2.gender, T2.birth_date, AVG(T3.A11) AS avg_salary     FROM account AS T1     JOIN client AS T2 ON T1.district_id = T2.district_id     JOIN district AS T3 ON T2.district_id = T3.district_id     WHERE T2.gender = 'F'     GROUP BY T2.gender, T2.birth_date     ORDER BY T2.birth_date ASC     LIMIT 1 ), HighestAvgSalary AS (     SELECT MAX(avg_salary) AS max_avg_salary     FROM OldestFemaleClients ), LowestAvgSalary AS (     SELECT MIN(avg_salary) AS min_avg_salary     FROM OldestFemaleClients ) SELECT H.max_avg_salary - L.min_avg_salary AS gap FROM HighestAvgSalary AS H CROSS JOIN LowestAvgSalary AS L;	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id GROUP BY a.district_id ORDER BY MIN(c.birth_date) DESC, AVG(d.A11) DESC LIMIT 1;	financial
SELECT COUNT(account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'	financial
SELECT T1.client_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'DISPONENT' AND T2.frequency = 'POPLATEK PO OBRATU'	financial
SELECT T1.account_id, T1.frequency  FROM account AS T1  JOIN loan AS T2 ON T1.account_id = T2.account_id  WHERE T2.date LIKE '%1997%'  GROUP BY T1.account_id  ORDER BY SUM(T2.amount) ASC  LIMIT 1;	financial
SELECT account_id, MAX(amount) AS max_amount FROM loan WHERE duration > 12 AND strftime('%Y', date) = '1993' GROUP BY account_id ORDER BY max_amount DESC;	financial
SELECT COUNT(client_id) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Sokolov')	financial
SELECT account_id FROM trans WHERE STRFTIME('%Y', date) = '1995' ORDER BY date ASC LIMIT 1	financial
SELECT DISTINCT t1.account_id FROM account AS t1 JOIN trans AS t2 ON t1.account_id = t2.account_id WHERE t1.date < '1997-01-01' AND t2.amount > 3000;	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.issued = '1994-03-03';	financial
SELECT T2.date FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.`date` = '1998-10-14';	financial
SELECT d.district_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1994-08-25';	financial
SELECT MAX(amount) AS max_transaction_amount FROM trans WHERE account_id IN (     SELECT account_id     FROM account     WHERE date = '1996-10-21' );	financial
SELECT c.gender, c.birth_date FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE district_id = (         SELECT district_id         FROM district         ORDER BY A11 DESC         LIMIT 1     ) ) ORDER BY c.birth_date DESC LIMIT 1;	financial
SELECT t.amount FROM trans t JOIN (     SELECT MIN(date) AS min_date, account_id     FROM loan     GROUP BY account_id ) l ON t.account_id = l.account_id AND t.date > l.min_date ORDER BY t.amount ASC LIMIT 1;	financial
SELECT COUNT(client_id) FROM client WHERE gender = 'F' AND district_id IN ( SELECT district_id FROM district WHERE A2 = 'Jesenik' )	financial
SELECT T1.disp_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND T3.date LIKE '1998-09-02%'	financial
SELECT COUNT(account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Litomerice' AND STRFTIME('%Y', T1.date) = '1996'	financial
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT c.birth_date FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03';	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'south Bohemia' GROUP BY T2.district_id ORDER BY SUM(T2.A4) DESC LIMIT 1;	financial
SELECT c.client_id, a.account_id, ((t1.balance - t2.balance) / t2.balance) * 100 AS increase_rate FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id AND t1.date > t2.date JOIN disp d ON t1.account_id = d.account_id JOIN client cl ON d.client_id = cl.client_id JOIN loan l ON d.account_id = l.account_id WHERE t1.date BETWEEN '1993-03-22' AND '1998-12-27' AND l.status = 'A' ORDER BY cl.client_id, t1.date;	financial
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / COUNT(amount) AS percentage FROM loan;	financial
SELECT CAST(COUNT(CASE WHEN status = 'C' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000;	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date LIKE '%1993%' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT T1.account_id, T1.frequency FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date BETWEEN '1995-01-01' AND '2000-12-31' AND T2.A3 = 'east Bohemia' GROUP BY T1.district_id, T1.account_id, T1.frequency;	financial
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice';	financial
SELECT T2.A2, T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.loan_id = 4990	financial
SELECT T1.account_id, T3.A2 AS district, T3.A3 AS region FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000	financial
SELECT T1.loan_id, T3.A2, AVG(T3.A11) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.duration = 60 GROUP BY T3.A2	financial
SELECT T2.district_id ,  T2.state ,  ((T2.A13 - T2.A12) / T2.A12) * 100 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status = 'D'	financial
SELECT CAST(COUNT(CASE WHEN T2.A2 = 'Decin' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.date) = '1993'	financial
SELECT      STRFTIME('%Y-%m', 'now') AS month,     account_id FROM      account ORDER BY      month;	financial
SELECT T2.A2, COUNT(T1.client_id) AS female_count FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.A2 ORDER BY female_count DESC LIMIT 9;	financial
SELECT T2.A2, COUNT(T1.account_id) AS withdrawal_count FROM trans AS T1 INNER JOIN account AS T3 ON T1.account_id = T3.account_id INNER JOIN district AS T2 ON T3.district_id = T2.district_id WHERE T1.date LIKE '1996-01%' AND T1.type = 'VYDAJ' GROUP BY T2.A2 ORDER BY withdrawal_count DESC LIMIT 10;	financial
SELECT COUNT(DISTINCT T1.client_id) FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'South Bohemia' AND T1.type != 'OWNER'	financial
SELECT T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status = 'C' GROUP BY T2.A3 ORDER BY COUNT(T1.status) DESC LIMIT 1	financial
SELECT AVG(amount) FROM client INNER JOIN loan ON client.account_id = loan.account_id WHERE client.gender = 'M' GROUP BY client.gender	financial
SELECT A2 FROM district ORDER BY A13 DESC LIMIT 1	financial
SELECT COUNT(account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id ORDER BY SUM(T2.A16) DESC LIMIT 1	financial
SELECT COUNT(DISTINCT t.account_id) AS negative_balance_count FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(DISTINCT l.account_id) AS loan_count FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000;	financial
SELECT COUNT(account_id) FROM loan WHERE status IN ('C', 'D');	financial
SELECT COUNT(client_id) FROM client WHERE gender = 'M' AND district_id = (  SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1 );	financial
SELECT COUNT(card.card_id) FROM card JOIN disp ON card.card_id = disp.card_id WHERE card.type = 'gold' AND disp.type = 'OWNER';	financial
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek';	financial
SELECT DISTINCT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000 AND strftime('%Y', t.date) = '1997'	financial
SELECT T1.account_id, D.A2 FROM account AS T1 JOIN district AS D ON T1.district_id = D.district_id JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND D.A2 = 'Pisek';	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'	financial
SELECT DATE_FORMAT(date, '%Y-%m') AS month, AVG(amount) AS avg_amount FROM trans WHERE operation = 'VYBER KARTOU' AND date BETWEEN '2021-01-01' AND '2021-12-31' GROUP BY month;	financial
SELECT account_id FROM trans WHERE date LIKE '1998%' AND operation = 'VYBER KARTOU' AND amount < (SELECT AVG(amount) FROM trans WHERE date LIKE '1998%')	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE c.gender = 'F' AND d.account_id IN (SELECT account_id FROM card) AND d.account_id IN (SELECT account_id FROM loan);	financial
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%South Bohemia%' GROUP BY T1.district_id	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A2 = 'Tabor' AND T2.type = 'OWNER'	financial
SELECT disp.type, AVG(district.A11) FROM disp INNER JOIN account ON disp.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE disp.type != 'OWNER' AND district.A11 BETWEEN 8000 AND 9000 GROUP BY disp.type	financial
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T2.A3 = 'North Bohemia' AND T3.bank = 'AB';	financial
SELECT T2.A2 FROM trans AS T1 INNER JOIN account AS T3 ON T1.account_id = T3.account_id INNER JOIN district AS T2 ON T3.district_id = T2.district_id WHERE T1.type = 'VYDAJ'	financial
SELECT AVG(T2.A15) AS A15 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date >= '1997-01-01' AND T2.A15 > 4000 AND STRFTIME('%Y', T1.date) = '1995';	financial
SELECT COUNT(card_id) FROM card WHERE type = 'classic' AND disp_id IN (SELECT disp_id FROM disp WHERE type = 'OWNER')	financial
SELECT COUNT(client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A2 = 'Hl.m. Praha';	financial
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' ORDER BY l.amount DESC LIMIT 1	financial
SELECT COUNT(T2.A15) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532;	financial
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;	financial
SELECT T1.account_id, T1.operation FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356 AND T1.operation = 'VYBER';	financial
SELECT COUNT(account_id) FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;	financial
SELECT T1.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 13539;	financial
SELECT T2.A3 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541;	financial
SELECT T1.district_id, COUNT(T2.account_id) AS account_count FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY account_count DESC LIMIT 1;	financial
SELECT client_id FROM account WHERE account_id IN (SELECT account_id FROM order WHERE order_id = 32423)	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik');	financial
SELECT DISTINCT d.client_id FROM disp d JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'junior' AND c.issued >= '1997-01-01'	financial
SELECT SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.client_id) AS percentage_female_clients FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A11 > 10000;	financial
SELECT SUM(CASE WHEN STRFTIME('%Y', T2.date) = '1996' THEN T1.amount ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', T2.date) = '1997' THEN T1.amount ELSE 0 END) AS difference FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T4.gender = 'M' AND T2.date BETWEEN '1996-01-01' AND '1997-12-31'	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31';	financial
SELECT SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) AS crime_difference FROM district WHERE A3 IN ('East Bohemia', 'North Bohemia');	financial
SELECT type, COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type;	financial
SELECT COUNT(account_id) AS frequency, SUM(amount) AS total_amount FROM order WHERE account_id = 3;	financial
SELECT STRFTIME('%Y', T2.birth_date) FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.client_id = 130	financial
SELECT COUNT(a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(loan.amount) AS total_debt, loan.status FROM loan JOIN account ON loan.account_id = account.account_id WHERE account.account_id = 992;	financial
SELECT SUM(T2.balance), T1.gender FROM client AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.client_id = 4 AND T2.trans_id = 851;	financial
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 9	financial
SELECT SUM(amount) FROM trans WHERE account IN (SELECT account_id FROM client WHERE client_id = 617) AND date LIKE '1998%'	financial
SELECT c.client_id, c.birth_date, d.A3 AS district_name FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 LIKE '%East Bohemia%';	financial
SELECT T1.client_id FROM client AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3	financial
SELECT COUNT(*)  FROM client AS c  JOIN account AS a ON c.district_id = a.district_id  JOIN trans AS t ON a.account_id = t.account_id  WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND t.amount > 4000;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > '1996-12-31';	financial
SELECT COUNT(T1.client_id)  FROM client AS T1  JOIN disp AS T2 ON T1.client_id = T2.client_id  JOIN card AS T3 ON T2.disp_id = T3.disp_id  WHERE T1.gender = 'F' AND T3.type = 'junior';	financial
SELECT SUM(CASE WHEN client.gender = 'F' THEN 1 ELSE 0 END) * 100.0 / COUNT(client.client_id) AS percentage_female_clients FROM client JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'Prague';	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.frequency = 'POPLATEK TYDNE';	financial
SELECT COUNT(client_id) FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK TYDNE') AND type = 'OWNER';	financial
SELECT a.account_id, MIN(l.amount) AS min_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' GROUP BY a.account_id ORDER BY min_amount ASC;	financial
SELECT T1.account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.gender = 'F' GROUP BY T1.district_id ORDER BY AVG(T3.A11) ASC, MIN(T2.birth_date) DESC LIMIT 1	financial
SELECT COUNT(client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.birth_date) = '1920' AND T2.A3 = 'east Bohemia';	financial
SELECT COUNT(account_id) FROM account JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.duration = 24;	financial
SELECT AVG(payments) FROM loan WHERE status = 'C' GROUP BY account_id;	financial
SELECT T1.client_id, T3.district_id, T3.A2 FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'OWNER'	financial
SELECT T1.disp_id, T2.client_id ,  julianday('now') - julianday(T2.birth_date) AS age FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T1.disp_id = T3.disp_id WHERE T3.type = 'gold' AND T1.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(element) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') AND element = 'cl';	toxicology
SELECT AVG(COUNT(CASE WHEN T2.element = 'o' THEN 1 ELSE NULL END)) AS avg_oxygen_atoms FROM bond AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-';	toxicology
SELECT AVG(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END)) AS avg_single_bonded_carcinogens FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+';	toxicology
SELECT COUNT(molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'na' AND T2.label = '-'	toxicology
SELECT T1.molecule_id, T1.label, T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '='	toxicology
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';	toxicology
SELECT T1.molecule_id, T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' GROUP BY T1.molecule_id, T1.label	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '='	toxicology
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'h' GROUP BY T1.label ORDER BY COUNT(T1.label) DESC LIMIT 1	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl';	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-'	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.atom_id IN ( SELECT atom_id FROM connected )	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1;	toxicology
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')	toxicology
SELECT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn')	toxicology
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'i' OR T1.element = 's') AND T3.bond_type = '-'	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id IN ( SELECT atom_id FROM atom WHERE molecule_id = 'TR181' )	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3	toxicology
SELECT * FROM bond WHERE molecule_id = 'TR001' AND bond_id = 'TR001_2_6';	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule	toxicology
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id ORDER BY molecule_id ASC LIMIT 5;	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008';	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000';	toxicology
SELECT T1.element, T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060';	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT T1.molecule_id, T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' GROUP BY T1.molecule_id, T1.label ORDER BY T1.molecule_id ASC LIMIT 3	toxicology
SELECT T1.bond_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.molecule_id = 'TR006' ORDER BY T1.bond_id ASC LIMIT 2;	toxicology
SELECT COUNT(bond_id) FROM connected WHERE molecule_id = 'TR009' AND (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12');	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element = 'br';	toxicology
SELECT T1.bond_type, T2.atom_id, T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR001_6_9';	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T2.label = '+'	toxicology
SELECT T1.bond_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'p' INTERSECT SELECT T1.bond_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'n';	toxicology
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T1.molecule_id) DESC LIMIT 1	toxicology
SELECT AVG(COUNT(T2.bond_id)) AS avg_bonds_per_i FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i';	toxicology
SELECT T1.bond_type, T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T2.atom_id, 7, 2) AS INT) = 45	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected);	toxicology
SELECT T1.atom_id, T1.element, T2.bond_type, T2.molecule_id FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR041' AND T2.bond_type = '#';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'	toxicology
SELECT T1.molecule_id, T1.label, COUNT(T2.bond_type) AS bond_count FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = ' = ' GROUP BY T1.molecule_id ORDER BY bond_count DESC LIMIT 1	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1	toxicology
SELECT T1.atom_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'pb'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT CAST(COUNT(bond_id) AS REAL) * 100 / ( SELECT MAX(cnt) FROM ( SELECT COUNT(atom_id) AS cnt FROM connected GROUP BY atom_id ) ) AS percentage_most_common_combination	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h');	toxicology
SELECT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's';	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'sn';	toxicology
SELECT T1.molecule_id, COUNT(T2.element) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.bond_type = '-' GROUP BY T1.molecule_id	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS total_atoms FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND a.element IN ('p', 'br') GROUP BY m.molecule_id;	toxicology
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT T1.molecule_id, T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '-'	toxicology
SELECT SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.atom_id) AS percent FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'i'	toxicology
SELECT MAX(T2.label) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca';	toxicology
SELECT COUNT(*) FROM atom WHERE atom_id IN ( SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8' ) AND element IN ('cl', 'c') HAVING COUNT(DISTINCT element) = 2	toxicology
SELECT T1.molecule_id FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'c' AND T2.bond_type = '#' AND T3.label = '-' LIMIT 2	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+';	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT molecule_id FROM bond WHERE bond_type = ' = ';	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(molecule_id) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-'	toxicology
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT b.bond_id, m.label, b.bond_type FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label IN ('+', '-') GROUP BY b.molecule_id ORDER BY b.molecule_id;	toxicology
SELECT T1.molecule_id, T1.label, COUNT(T2.element) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND SUBSTR(T2.atom_id, 7, 1) = '4' GROUP BY T1.molecule_id, T1.label	toxicology
SELECT CAST(COUNT(CASE WHEN element = 'h' THEN 1 ELSE NULL END) AS REAL) / COUNT(element), label FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule_id = 'TR006' AND element = 'h'	toxicology
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca' AND m.label = '+';	toxicology
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.bond_type IN ('-', '=', '#') GROUP BY T2.bond_type	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond;	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047';	toxicology
SELECT molecule.label FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.atom_id = 'TR001_1'	toxicology
SELECT EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR151' AND label = '+') AS is_carcinogenic;	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+';	toxicology
SELECT molecule_id, element FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'	toxicology
SELECT COUNT(atom_id) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '='	toxicology
SELECT COUNT(atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'h'	toxicology
SELECT T1.molecule_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2'	toxicology
SELECT T1.molecule_id, T1.label, T1.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label != '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' AND T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id;	toxicology
SELECT EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR124' AND label = '+') AS is_carcinogenic;	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(bond_id) AS double_bonds, label FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule_id = 'TR006' AND bond_type = '=' GROUP BY molecule_id;	toxicology
SELECT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element IN ('cl', 'c', 'h');	toxicology
SELECT T1.bond_id, T2.atom_id, T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-'	toxicology
SELECT T1.molecule_id, T2.element, T3.bond_type FROM atom AS T2 INNER JOIN molecule AS T1 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T3.molecule_id = T2.molecule_id WHERE T3.bond_type = '#' GROUP BY T1.molecule_id;	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'cl';	toxicology
SELECT T1.atom_id, COUNT(T2.bond_type) AS bond_count FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id;	toxicology
SELECT COUNT(*) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = ' = ' AND m.label = '+';	toxicology
SELECT COUNT(molecule_id) FROM atom WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 's') AND molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type = '=');	toxicology
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-';	toxicology
SELECT T1.molecule_id, T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'	toxicology
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-';	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' AND T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' OR T1.element = 'cl';	toxicology
SELECT T1.molecule_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(*) FROM atom WHERE atom_id IN ( SELECT atom_id FROM connected WHERE bond_id = 'TR001_3_4' ) AND element = 'cl'	toxicology
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_name FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_4';	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000'	toxicology
SELECT CAST(COUNT(bond_type = '-') AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond WHERE bond_type = '-';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+';	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element = 's' AND b.bond_type = ' = ';	toxicology
SELECT T1.label, COUNT(T2.atom_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR024' AND T2.bond_type = '='	toxicology
SELECT m.label, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h' AND T2.bond_type = '#'	toxicology
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(molecule_id) FROM bond WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-';	toxicology
SELECT COUNT(element) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';	toxicology
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.atom_id = 'TR004_7';	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'o' AND T2.bond_type = ' = ';	toxicology
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label != '-';	toxicology
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002';	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR012' AND T1.element = 'c' AND T2.bond_type = '=';	toxicology
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o';	toxicology
SELECT * FROM `cards` WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT * FROM cards WHERE borderColor = 'none' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT name FROM cards ORDER BY faceConvertedManaCost DESC LIMIT 1;	card_games
SELECT * FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';	card_games
SELECT c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';	card_games
SELECT T2.format, T1.type FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Artifact' AND T1.side IS NULL AND T2.format = 'vintage' GROUP BY T1.type	card_games
SELECT c.id, c.artist, c.power FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.id, c.artist, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel' AND c.hasContentWarning = 1;	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s';	card_games
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.name, T1.artist, T1.isPromo ORDER BY COUNT(T2.uuid) DESC LIMIT 1	card_games
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage FROM foreign_data;	card_games
SELECT sets.name, sets.totalSetSize, COUNT(sets.code) AS total_cards_per_set FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Italian' GROUP BY sets.code;	card_games
SELECT COUNT(type) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT T2.language FROM cards AS T1 JOIN sets_cards AS T3 ON T1.id = T3.card_id JOIN sets AS T4 ON T3.set_id = T4.id JOIN set_translations AS T2 ON T4.translation_id = T2.id WHERE T1.name = 'Angel of Mercy' GROUP BY T2.language;	card_games
SELECT COUNT(cards.id) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.isTextless = 0 AND legalities.status = 'Restricted';	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.text LIKE '%Condemn%'	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.isStarter = 1 AND l.status = 'Restricted';	card_games
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight';	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian';	card_games
SELECT CAST(COUNT(CASE WHEN borderColor = 'borderless' THEN id ELSE NULL END) AS REAL) * 100 / COUNT(id) FROM cards	card_games
SELECT COUNT(*) FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99';	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT COUNT(id) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords = 'Flying';	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel';	card_games
SELECT cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'	card_games
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'	card_games
SELECT COUNT(cards.id) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.borderColor = 'white' AND legalities.status = 'Banned';	card_games
SELECT f.uuid, fd.language FROM legalities l JOIN foreign_data fd ON l.uuid = fd.uuid WHERE l.format = 'legacy';	card_games
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'	card_games
SELECT c.frameVersion, l.status, COUNT(c.id) AS card_count FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal' GROUP BY c.frameVersion, l.status;	card_games
SELECT colors FROM cards WHERE setCode = 'OGW';	card_games
SELECT c.setCode, st.language, c.convertedManaCost FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT T1.originalType, T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'	card_games
SELECT T1.colors, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20	card_games
SELECT c.name, c.uuid FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B'	card_games
SELECT c.name  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL;	card_games
SELECT COUNT(id) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT artist, type, COUNT(id) AS card_count FROM cards WHERE artist = 'UDON' AND type = 'available in mtgo' AND hand = -1 GROUP BY artist, type;	card_games
SELECT COUNT(id) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE availability = 'mtgo,paper' AND frameVersion = '2003' AND borderColor = 'black' AND layout = 'normal';	card_games
SELECT SUM(manaCost) FROM cards WHERE artist = 'Rob Alexander'	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena';	card_games
SELECT setCode FROM set_translations WHERE language = 'Spanish';	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT CAST(COUNT(CASE WHEN isStoryspotlight = 1 AND isTextless = 0 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM cards;	card_games
SELECT name, (SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END) / COUNT(id)) * 100 AS percentage FROM foreign_data WHERE language = 'Spanish' GROUP BY name;	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309;	card_games
SELECT COUNT(T1.setCode) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.block = 'Commander' AND T1.language = 'Portuguese (Brazil)';	card_games
SELECT c.id, c.types FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal';	card_games
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL	card_games
SELECT COUNT(id) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%';	card_games
SELECT COUNT(DISTINCT T1.uuid) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T3.format = 'premodern' AND T2.text = 'This is a triggered mana ability.' AND T1.side IS NULL	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND uuid IN (SELECT uuid FROM legalities WHERE format = 'pauper') AND availability = 'paper' LIMIT 1	card_games
SELECT artist FROM cards WHERE uuid = (SELECT uuid FROM foreign_data WHERE flavorText = 'Das perfekte Gegenmittel zu einer dichten Formation')	card_games
SELECT fd.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.artist = 'Matthew D. Wilson'  AND c.borderColor = 'black'  AND c.layout = 'normal'  AND c.types = 'Creature'  AND fd.language = 'French';	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T2.date = '2007-02-01';	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'	card_games
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'legal';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' AND (T1.power IS NULL OR T1.power = '*') THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 ELSE 0 END) AS percentage FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*';	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.type = 'expansion'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader';	card_games
SELECT COUNT(id) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isPromo = 1 AND isReprint = 1;	card_games
SELECT name, power, promoTypes FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934;	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(SUM(isTextless = 1 AND layout = 'normal') AS REAL) * 100 / COUNT(*) FROM cards WHERE isTextless = 1;	card_games
SELECT id FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard';	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3	card_games
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.mcmName = 'Archenemy' AND T1.setCode = 'ARC'	card_games
SELECT sets.name, set_translations.translation FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5;	card_games
SELECT T2.language, T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 206	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name LIMIT 2	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese';	card_games
SELECT s.code, MAX(s.baseSetSize) AS max_baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' GROUP BY s.code;	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.code) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Chinese Simplified';	card_games
SELECT COUNT(DISTINCT T1.setCode) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese' AND (T1.mtgoCode IS NULL OR T1.mtgoCode = '')	card_games
SELECT COUNT(id) AS count_black_border_cards, GROUP_CONCAT(id) AS card_ids FROM cards WHERE borderColor = 'black';	card_games
SELECT COUNT(id) AS card_count, GROUP_CONCAT(id) AS card_ids FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT id FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT language FROM set_translations WHERE id = 174;	card_games
SELECT name FROM sets WHERE code = 'ALL'	card_games
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar';	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13'	card_games
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage');	card_games
SELECT T1.setCode FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'expansion'	card_games
SELECT T1.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Boros'	card_games
SELECT T2.language, T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'	card_games
SELECT T1.setCode FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'expansion commander';	card_games
SELECT T1.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'abzan';	card_games
SELECT T2.language, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE "%paper%" AND hand = "3";	card_games
SELECT name FROM cards WHERE isTextless = 0;	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE border_color = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Italian' AND T1.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(T2.setCode) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy' GROUP BY T2.setCode	card_games
SELECT name FROM cards WHERE setCode IN (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition');	card_games
SELECT EXISTS (     SELECT 1     FROM `cards`     JOIN `set_translations` ON `cards`.`setCode` = `set_translations`.`setCode`     WHERE `cards`.`name` = 'Ancestor''s Chosen' AND `set_translations`.`language` = 'Korean' );	card_games
SELECT COUNT(id) FROM cards WHERE id IN (     SELECT id FROM set_translations WHERE translation = 'Hauptset Zehnte Edition' AND setCode IN (         SELECT setCode FROM cards WHERE artist = 'Adam Rex'     ) );	card_games
SELECT COUNT(T1.baseSetSize) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition';	card_games
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified';	card_games
SELECT s.name AS setName, s.mtgoCode IS NOT NULL AS appearsOnMTGO FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy';	card_games
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen';	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition';	card_games
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ice Age' AND T2.language = 'Italian' AND T2.translation IS NOT NULL	card_games
SELECT T2.isForeignOnly FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(DISTINCT T1.setCode) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.baseSetSize < 100	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap');	card_games
SELECT name FROM cards WHERE setCode = 'Coldsnap' ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy');	card_games
SELECT name, number, setCode FROM cards WHERE setCode = 'Coldsnap' AND number = '4';	card_games
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND (T1.convertedManaCost > 5 OR T1.power IS NULL);	card_games
SELECT T1.flavorText FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'Italian';	card_games
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'	card_games
SELECT T1.name, T2.text FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = 'Coldsnap' AND T2.language = 'Italian';	card_games
SELECT T2.name FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.uuid WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T2.name DESC LIMIT 1	card_games
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT T2.text, T1.hasContentWarning FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec'	card_games
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation';	card_games
SELECT COUNT(T1.baseSetSize) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara';	card_games
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition';	card_games
SELECT T2.setCode FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'French' AND T1.translation LIKE '%Tendo Ice Bridge%';	card_games
SELECT COUNT(T2.translation) AS translation_count FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Tenth Edition' AND T2.translation IS NOT NULL;	card_games
SELECT T2.translation FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese';	card_games
SELECT name FROM cards WHERE setCode = 'Journey into Nyx Hero''s Path' ORDER BY convertedManaCost DESC LIMIT 1;	card_games
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío';	card_games
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim';	card_games
SELECT COUNT(id) FROM cards WHERE name = 'World Championship Decks 2004' AND convertedManaCost = 3;	card_games
SELECT t2.translation FROM sets AS t1 INNER JOIN set_translations AS t2 ON t1.code = t2.setCode WHERE t1.name = 'Mirrodin' AND t2.language = 'Chinese Simplified';	card_games
SELECT CAST(SUM(CASE WHEN sets.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(sets.id) AS percentage_non_foil_japanese FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.language = 'Japanese';	card_games
SELECT      s.code,      st.language,      CAST(SUM(s.isOnlineOnly) AS REAL) * 100 / COUNT(st.id) AS percentage_online_only FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Portuguese (Brazil)' GROUP BY      s.code, st.language;	card_games
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1	card_games
SELECT id FROM sets WHERE baseSetSize = ( SELECT MAX(baseSetSize) FROM sets )	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT frameEffects, COUNT(*) AS count FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY count DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND hasFoil = 0 AND (power IS NULL OR power = '*');	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT c.uuid, c.name, c.manaCost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY CAST(REPLACE(SUBSTR(c.manaCost, 2), '}', '') AS REAL) DESC LIMIT 10;	card_games
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1	card_games
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French';	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal';	card_games
SELECT format, GROUP_CONCAT(name) AS card_names FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE status = 'Banned' GROUP BY format ORDER BY COUNT(status) DESC LIMIT 1;	card_games
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.id = T2.id WHERE T1.name = 'Battlebond'	card_games
SELECT T1.artist, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid GROUP BY T1.artist ORDER BY COUNT(T1.uuid) ASC LIMIT 1	card_games
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'D. Alexander Gregory' AND T1.frameVersion = '1997' AND T1.hasContentWarning = 1 AND T2.format = 'legacy';	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT AVG(T1.id) AS avg_sets, T2.language, COUNT(T2.language) AS language_count FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.id WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY STRFTIME('%Y', T1.releaseDate), T2.language ORDER BY language_count DESC LIMIT 1;	card_games
SELECT artist FROM cards WHERE availability LIKE '%arena%' AND NOT availability LIKE '%paper%' AND NOT availability LIKE '%mtgo%'	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');	card_games
SELECT COUNT(id) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%' AND availability NOT LIKE '%mtgo%'	card_games
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC	card_games
SELECT c.name AS card_name, s.name AS set_name, l.format AS format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language LIKE '%Korean%' AND NOT EXISTS (  SELECT 1  FROM set_translations st2  WHERE st2.setCode = s.code  AND st2.language LIKE '%Japanese%' );	card_games
SELECT c.frameVersion, c.artist, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' OR l.status = 'Banned';	card_games
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT COUNT(*) FROM users WHERE Id IN (SELECT UserId FROM votes WHERE Upvotes > 100 AND Downvotes > 1);	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Title, p.ViewCount, p.OwnerUserId, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;	codebase_community
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId GROUP BY p.OwnerUserId ORDER BY SUM(p.FavoriteCount) DESC LIMIT 1	codebase_community
SELECT SUM(CommentCount) AS TotalComments FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';	codebase_community
SELECT MAX(T1.AnswerCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL;	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20	codebase_community
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.TagName = 'bayesian'	codebase_community
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId ORDER BY T2.Count DESC LIMIT 1	codebase_community
SELECT COUNT(b.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(b.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND STRFTIME('%Y', b.Date) = '2011'	codebase_community
SELECT u.DisplayName FROM users u JOIN (  SELECT b.UserId, COUNT(b.Id) AS badge_count  FROM badges b  GROUP BY b.UserId ) sub ON u.Id = sub.UserId ORDER BY sub.badge_count DESC, u.Id ASC LIMIT 1;	codebase_community
SELECT AVG(Score) AS AverageScore FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie');	codebase_community
SELECT AVG(COUNT(T1.Id)) AS AverageBadges, T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200 GROUP BY T1.UserId, T2.DisplayName	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5	codebase_community
SELECT COUNT(Id) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(c.Id) AS CommentCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount = 1910;	codebase_community
SELECT T2.FavoriteCount FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 3025 AND T1.CreationDate = '2014-04-23 20:29:39.0'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND p.CommentCount = 1;	codebase_community
SELECT p.ClosedDate  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.UserId = '23853' AND c.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041;	codebase_community
SELECT COUNT(p.Id) AS PostCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347	codebase_community
SELECT COUNT(T2.Id) AS Votes FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data visualization%';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';	codebase_community
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN users ON posts.OwnerUserId = users.Id JOIN votes ON users.Id = votes.UserId WHERE posts.OwnerUserId = 24 AND users.Id = 24;	codebase_community
SELECT COUNT(ViewCount) FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'SilentGhost'	codebase_community
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'thank you user93';	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'A Lion'	codebase_community
SELECT T2.DisplayName, T2.Reputation FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(posts.Score), users.WebsiteUrl FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Yevgeny';	codebase_community
SELECT p.Comment, p.PostId, o.Title FROM postHistory p JOIN posts o ON p.PostId = o.Id WHERE o.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';	codebase_community
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%';	codebase_community
SELECT T3.DisplayName FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T2.UserId = T3.Id WHERE T2.BountyAmount = 50 AND T1.Title LIKE '%variance%'	codebase_community
SELECT p.Title, ph.Text, AVG(p.ViewCount) AS AvgViewCount FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id LEFT JOIN postHistory ph ON p.Id = ph.PostId AND ph.PostHistoryTypeId = 4 WHERE t.TagName LIKE '%<humor>%' GROUP BY p.Title, ph.Text;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13;	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011';	codebase_community
SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) > 5	codebase_community
SELECT COUNT(DISTINCT b.UserId) AS UserCount FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'New York' AND b.Name IN ('Teacher', 'Supporter') GROUP BY b.UserId;	codebase_community
SELECT u.Id, u.Reputation FROM users u JOIN posts p ON u.Id = p.UserId WHERE p.Id = 1;	codebase_community
SELECT u.UserId FROM users u JOIN posts p ON u.Id = p.PostId JOIN (     SELECT PostId, COUNT(DISTINCT UserId) AS hist_count     FROM postHistory     GROUP BY PostId ) ph ON p.Id = ph.PostId WHERE p.ViewCount >= 1000 AND ph.hist_count = 1;	codebase_community
SELECT u.Id, u.Name, b.Name AS BadgeName FROM users u JOIN (     SELECT UserId, COUNT(Id) AS CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId;	codebase_community
SELECT COUNT(b.UserId) AS TeacherBadgeCount FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'India' AND b.Name = 'Teacher';	codebase_community
SELECT      ((COUNT(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 END) / COUNT(Name) * 100 -       COUNT(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 END) / COUNT(Name) * 100)) AS PercentageDifference FROM      badges WHERE      Name = 'Student';	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT p.Id AS PostID, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.PostId = 61217;	codebase_community
SELECT T2.Score, T1.LinkTypeId FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.PostId = 395 AND T1.LinkTypeId = 395	codebase_community
SELECT p.Id AS PostID, uh.UserId FROM posts p JOIN postHistory uh ON p.Id = uh.PostId WHERE p.Score > 60;	codebase_community
SELECT SUM(T2.FavoriteCount) AS TotalFavoriteCount FROM postHistory AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 686 AND STRFTIME('%Y', T1.CreationDate) = '2011';	codebase_community
SELECT AVG(u.UpVotes), AVG(u.Age) FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.UserId) > 10;	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(score) FROM comments WHERE score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10;	codebase_community
SELECT b.Name, u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users) ORDER BY u.Reputation DESC;	codebase_community
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';	codebase_community
SELECT b.Date, b.UserId, u.Location FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY';	codebase_community
SELECT CAST(COUNT(CASE WHEN Name = 'Teacher' THEN UserId ELSE NULL END) AS REAL) * 100 / COUNT(UserId) FROM badges	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) AS Percentage FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer';	codebase_community
SELECT T2.Score FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0';	codebase_community
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(u.Views) AS TotalViews FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT b.Name, u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users) ORDER BY u.Reputation ASC;	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Age > 65 AND T1.Name = 'Supporter';	codebase_community
SELECT DisplayName FROM users WHERE Id = 30;	codebase_community
SELECT COUNT(Id) FROM users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName, Views FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio FROM votes;	codebase_community
SELECT T1.TagName FROM tags AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.Tags WHERE T2.OwnerDisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(postHistory.Id) FROM postHistory INNER JOIN users ON postHistory.UserId = users.Id WHERE users.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT COUNT(v.Id) AS VoteCount FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan';	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.UserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT p.PostId, SUM(p.ViewCount) AS TotalViews FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.PostId ORDER BY TotalViews DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT p.Id) AS NumberOfPosts FROM postHistory ph JOIN posts p ON ph.PostId = p.Id JOIN users u ON ph.UserId = u.Id WHERE p.Id > 4 AND u.DisplayName = 'Matt Parker';	codebase_community
SELECT COUNT(DISTINCT p.Id) AS NegativeCommentCount FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON p.OwnerUserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan';	codebase_community
SELECT DISTINCT p.Tags FROM posts AS p JOIN postHistory AS ph ON p.Id = ph.PostId JOIN users AS u ON ph.UserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.PostId) FROM postHistory AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN tags AS T3 ON T1.PostId = T3.ExcerptPostId WHERE T2.DisplayName = 'Community';	codebase_community
SELECT      SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) FROM postHistory WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users);	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';	codebase_community
SELECT COUNT(Score) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE STRFTIME('%Y', T1.Date) = '2011' AND T2.Location LIKE '%North Pole%'	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150;	codebase_community
SELECT COUNT(ph.Id) AS HistoryCount, p.LastEditDate FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT T1.LastAccessDate, T1.Location, T1.Id FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Outliers' GROUP BY T1.Id	codebase_community
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = ( SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' )	codebase_community
SELECT T2.PostId, T1.Name FROM badges AS T1 INNER JOIN postHistory AS T2 ON T1.UserId = T2.UserId WHERE T2.UserDisplayName = 'Samuel' AND STRFTIME('%Y', T2.CreationDate) = '2013' AND STRFTIME('%Y', T1.Date) = '2013'	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.ViewCount DESC LIMIT 1	codebase_community
SELECT T2.DisplayName, T2.Location FROM tags AS T1 INNER JOIN users AS T2 ON T2.Id = T1.ExcerptPostId WHERE T1.TagName = 'hypothesis-testing'	codebase_community
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?';	codebase_community
SELECT u.DisplayName, p.ParentId, p.Score FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ParentId IS NOT NULL AND p.Score = ( SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL )	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1;	codebase_community
SELECT Title FROM posts WHERE ViewCount IS NOT NULL ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE STRFTIME('%Y', v.CreationDate) = '2011' AND v.BountyAmount = 50	codebase_community
SELECT Id FROM users ORDER BY Age ASC LIMIT 1	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT AVG(COUNT(T1.Id)) FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.AnswerCount <= 2 AND STRFTIME('%Y', T1.CreationDate) = '2010' GROUP BY STRFTIME('%m', T1.CreationDate)	codebase_community
SELECT p.Id, p.FavoriteCount FROM posts p WHERE p.Id IN (     SELECT v.PostId     FROM votes v     WHERE v.UserId = 1465 ) ORDER BY p.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId ORDER BY T1.CreaionDate ASC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Name) DESC LIMIT 1	codebase_community
SELECT CreationDate FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'chl' ORDER BY CreationDate ASC LIMIT 1	codebase_community
SELECT MIN(T1.CreationDate) AS FirstPostDate, MIN(T2.Age) AS YoungestUserAge FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT p.OwnerUserId) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount >= 4 AND u.Location = 'United Kingdom'	codebase_community
SELECT AVG(T2.PostId) AS AveragePostsVoted, T1.Age FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId GROUP BY T1.Age ORDER BY T1.Age DESC	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', p.CreationDate) = '2010'	codebase_community
SELECT T1.Id, T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky' ORDER BY T1.ViewCount DESC LIMIT 1	codebase_community
SELECT p.Id, p.Title, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = (SELECT MAX(Score) FROM posts);	codebase_community
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Stephen Turner';	codebase_community
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreationDate) = '2011' GROUP BY u.DisplayName	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE STRFTIME('%Y', p.CreationDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE STRFTIME('%Y', T1.CreationDate) = '2011'	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users	codebase_community
SELECT SUM(p.ViewCount), u.DisplayName FROM postHistory ph JOIN posts p ON ph.PostId = p.Id JOIN users u ON p.LastEditorUserId = u.Id WHERE ph.Text = 'Computer Game Datasets';	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > ( SELECT AVG(ViewCount) FROM posts )	codebase_community
SELECT COUNT(Id) AS CommentCount FROM comments WHERE PostId = (     SELECT Id     FROM posts     ORDER BY Score DESC     LIMIT 1 );	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT T2.DisplayName, T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 183 ORDER BY T1.LastEditDate DESC LIMIT 1	codebase_community
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Emmett' ORDER BY T1.Date DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000	codebase_community
SELECT strftime('%J', T2.Date) - strftime('%J', T1.CreationDate) AS DaysToGetBadge FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Zolomon'	codebase_community
SELECT      COUNT(p.Id) AS PostCount,      COUNT(c.Id) AS CommentCount FROM      users u JOIN      posts p ON u.Id = p.OwnerUserId LEFT JOIN      comments c ON p.Id = c.PostId WHERE      u.CreationDate = (         SELECT MAX(CreationDate) FROM users     );	codebase_community
SELECT T1.Text, T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T1.PostId = T3.Id WHERE T3.Title = 'Analysing wind data with R' ORDER BY T1.CreationDate DESC LIMIT 10	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM tags WHERE TagName = 'careers';	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT CommentCount, AnswerCount FROM posts WHERE Title = 'Clustering 1D data';	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT CAST(SUM(CASE WHEN T1.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT COUNT(Score) FROM posts WHERE Score < 20;	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample';	codebase_community
SELECT U.Reputation, U.UpVotes FROM users AS U JOIN comments AS C ON U.Id = C.UserId WHERE C.Text = 'fine, you win :)' LIMIT 1;	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%';	codebase_community
SELECT c.PostId, c.Score, c.Text, p.ViewCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;	codebase_community
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Comment LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT p.PostId) AS PostCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id AS PostID, c.Text AS Comments FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item';	codebase_community
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.';	codebase_community
SELECT c.Text FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT U.DisplayName FROM users AS U JOIN comments AS C ON U.Id = C.UserId WHERE C.Score BETWEEN 1 AND 5 AND U.DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.UserId) AS Percentage FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(DISTINCT T1.hero_id) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.height_cm > 200	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T2.power_id) > 15	superhero
SELECT COUNT(superhero.id) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue'	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'	superhero
SELECT superhero_name  FROM superhero  WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')  AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond');	superhero
SELECT COUNT(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name, s.height_cm, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC;	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT T1.colour, COUNT(T2.superhero_id) AS count FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' GROUP BY T1.colour ORDER BY count DESC	superhero
SELECT AVG(T2.height_cm) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' ) AND T3.power_name = 'Super Strength'	superhero
SELECT COUNT(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics'	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' GROUP BY p.publisher_name ORDER BY MIN(ha.attribute_value) ASC;	superhero
SELECT COUNT(sup.id) AS gold_eyed_superheroes FROM superhero sup JOIN colour col ON sup.eye_colour_id = col.id JOIN publisher pub ON sup.publisher_id = pub.id WHERE col.colour = 'Gold' AND pub.publisher_name = 'Marvel Comics';	superhero
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(superhero.id) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50	superhero
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS p ON hp.power_id = p.id WHERE p.power_name = 'Death Touch';	superhero
SELECT COUNT(*)  FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id JOIN gender AS g ON s.gender_id = g.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T1.superhero_name) DESC LIMIT 1	superhero
SELECT COUNT(superhero_name) FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Vampire');	superhero
SELECT      CAST(SUM(CASE WHEN T2.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage_bad_alignment,     SUM(CASE WHEN T2.alignment = 'Bad' AND T3.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS count_marvel_bad_alignment FROM      superhero AS T1 INNER JOIN      alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN      publisher AS T3 ON T1.publisher_id = T3.id;	superhero
SELECT      SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM      publisher AS T1 JOIN      superhero AS T2 ON T1.id = T2.publisher_id WHERE      T1.publisher_name IN ('DC Comics', 'Marvel Comics');	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(attribute_value) FROM hero_attribute	superhero
SELECT COUNT(id) FROM superhero WHERE full_name IS NULL;	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.id = 75	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(T2.weight_kg) AS average_weight FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T1.gender = 'Female';	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN hero_power AS T4 ON T1.id = T4.hero_id INNER JOIN superpower AS T3 ON T4.power_id = T3.id WHERE T2.gender = 'Male' LIMIT 5	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.height_cm BETWEEN 170 AND 190 AND T2.colour = 'No Colour'	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(id) FROM superhero WHERE alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.hair_colour_id INNER JOIN race AS T3 ON T3.id = T2.race_id WHERE T2.height_cm = 185 AND T3.race = 'human'	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN s.publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) AS percentage FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.height_cm BETWEEN 150 AND 180 AND p.publisher_name = 'Marvel Comics';	superhero
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero )	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1	superhero
SELECT COUNT(DISTINCT T1.hero_id) FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Stealth';	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1	superhero
SELECT CAST(COUNT(*) AS REAL) / SUM(CASE WHEN T2.skin_colour_id = 1 THEN 1 ELSE 0 END) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id	superhero
SELECT COUNT(superhero.id) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'	superhero
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Dark Horse Comics'	superhero
SELECT T1.superhero_name, T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN T2.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female'	superhero
SELECT T1.superhero_name, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13';	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'	superhero
SELECT COUNT(power_id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Amazo'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.skin_colour_id IN ( SELECT id FROM colour WHERE colour = 'Gold' )	superhero
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'	superhero
SELECT COUNT(DISTINCT T1.hero_id) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T2.attribute_name = 'Strength' AND T1.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute AS T3 INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Strength' )	superhero
SELECT T1.race, T2.alignment FROM race AS T1 INNER JOIN alignment AS T2 ON T1.id = T2.id INNER JOIN superhero AS T3 ON T3.race_id = T1.id AND T3.alignment_id = T2.id WHERE T3.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.publisher_name) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id	superhero
SELECT AVG(T2.weight_kg) FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Alien'	superhero
SELECT SUM(CASE WHEN full_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) - SUM(CASE WHEN full_name = 'Charles Chandler' THEN weight_kg ELSE 0 END) AS weight_difference FROM superhero	superhero
SELECT AVG(height_cm) FROM superhero GROUP BY id;	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T1.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(superhero.id) FROM superhero WHERE alignment_id = 3;	superhero
SELECT T1.attribute_name, T2.attribute_value FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Brown');	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy');	superhero
SELECT COUNT(superhero.id) FROM superhero WHERE superhero.publisher_id IS NULL;	superhero
SELECT CAST(SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'	superhero
SELECT CAST(COUNT(CASE WHEN T1.gender_id = 1 THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN T1.gender_id = 2 THEN 1 ELSE NULL END) AS ratio FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38	superhero
SELECT T2.race FROM hero_attribute AS T1 INNER JOIN race AS T2 ON T1.hero_id = T2.id ORDER BY T1.attribute_value DESC LIMIT 1	superhero
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Atom IV';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(T2.attribute_value) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T1.alignment = 'Neutral'	superhero
SELECT T2.colour FROM hero_attribute AS T1 INNER JOIN colour AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_value = 100	superhero
SELECT COUNT(superhero.id) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.id = 1 AND gender.id = 2;	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80	superhero
SELECT T3.race FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN race AS T3 ON T1.race_id = T3.id INNER JOIN colour AS T4 ON T1.hair_colour_id = T4.id WHERE T4.colour = 'blue' AND T2.gender = 'Male'	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment_id = 2 AND T2.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.alignment_id) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.alignment_id = 2;	superhero
SELECT COUNT(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE NULL END) - COUNT(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE NULL END) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' AND T1.superhero_name = 'Hulk'	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'	superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics';	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC	superhero
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'	superhero
SELECT T1.superhero_name, T1.weight_kg, T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT AVG(superhero.height_cm)  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  JOIN race ON superhero.race_id = race.id  WHERE superhero.race != 'Human' AND publisher.publisher_name = 'Dark Horse Comics';	superhero
SELECT COUNT(superhero_name) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' AND T2.attribute_value = 100	superhero
SELECT SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id	superhero
SELECT T2.attribute_name, MIN(T1.attribute_value), T3.superhero_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther'	superhero
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas';	superhero
SELECT      (SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.publisher_id)) AS percentage FROM      alignment AS T1 INNER JOIN      superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN      publisher AS T3 ON T2.publisher_id = T3.id WHERE      T3.publisher_name = 'Marvel Comics';	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT s.full_name  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg < 100 AND c.colour = 'Brown';	superhero
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy'	superhero
SELECT T2.weight_kg, T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT sp.power_id AS hero_id FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE sp.power_name = 'Intelligence';	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.height_cm > ( SELECT AVG(height_cm) * 0.8 FROM superhero )	superhero
SELECT driverRef FROM qualifying WHERE raceId = 20 AND q1 IS NOT NULL ORDER BY q1 DESC LIMIT 5	formula_1
SELECT T2.surname FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 19 AND T1.q2 IS NOT NULL ORDER BY T1.q2 ASC LIMIT 1	formula_1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.location = 'Shanghai';	formula_1
SELECT circuits.url FROM circuits WHERE circuits.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Germany'	formula_1
SELECT constructorStandings.position FROM constructors INNER JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructors.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.year = 2010 AND c.country NOT IN ('Asia', 'Europe') AND r.round = 1;	formula_1
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Spain'	formula_1
SELECT circuits.lat, circuits.lng FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid WHERE races.name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.time FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T1.nationality FROM constructors AS T1 INNER JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 24 AND T2.points = 1	formula_1
SELECT T1.q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruno' AND T2.surname = 'Senna' AND T1.raceId = 354	formula_1
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 355 AND T1.q2 = '0:01:40'	formula_1
SELECT T2.number FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 LIKE '0:01:54%';	formula_1
SELECT COUNT(drivers.driverId) FROM results INNER JOIN races ON results.raceId = races.raceId INNER JOIN drivers ON results.driverId = drivers.driverId WHERE races.year = 2007 AND races.name = 'Bahrain Grand Prix' AND results.time IS NULL;	formula_1
SELECT T1.url FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29')	formula_1
SELECT T1.forename, T1.surname, T1.dob FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT d.driverId, d.forename, d.surname, d.url  FROM drivers d  JOIN laptimes lt ON d.driverId = lt.driverId  WHERE lt.raceId = 161 AND lt.time LIKE '0:01:27%';	formula_1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 933 ORDER BY T2.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Malaysian Grand Prix';	formula_1
SELECT T2.url FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceId = 345;	formula_1
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 347 AND T1.q2 = '0:01:15'	formula_1
SELECT T1.code FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 LIKE '1:33%'	formula_1
SELECT T2.time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Bruce' AND T1.surname = 'McLaren' AND T2.raceId = 743	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId) AS drivers_not_finished FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29' AND time IS NULL;	formula_1
SELECT forename, surname, dob FROM drivers WHERE driverId IN (SELECT driverId FROM results WHERE raceId = 872 AND time IS NOT NULL) ORDER BY dob DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 348 ORDER BY T2.time ASC LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT ((CAST((SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) AS REAL) - CAST((SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 854) AS REAL)) / CAST((SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) AS REAL)) * 100 AS percentage;	formula_1
SELECT CAST(SUM(CASE WHEN time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(driverid) FROM results INNER JOIN races ON results.raceId = races.raceId WHERE date = '1983-07-16'	formula_1
SELECT year FROM races WHERE name = 'Singapore Grand Prix' ORDER BY year ASC LIMIT 1;	formula_1
SELECT COUNT(*) AS race_count, name FROM races WHERE year = 2005 ORDER BY name DESC;	formula_1
SELECT name FROM races WHERE date = ( SELECT MIN(date) FROM races )	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1	formula_1
SELECT year FROM races GROUP BY year ORDER BY MAX(round) DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND NOT EXISTS (SELECT * FROM races AS r WHERE r.name = T1.name AND r.year = 2000);	formula_1
SELECT T2.country, T1.name, T2.location FROM circuits AS T2 JOIN races AS T1 ON T1.circuitid = T2.circuitid WHERE T1.year = (SELECT MIN(year) FROM races WHERE name LIKE '%European%') LIMIT 1;	formula_1
SELECT MAX(year) AS last_season FROM races WHERE name = 'British Grand Prix' AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Brands Hatch');	formula_1
SELECT COUNT(DISTINCT T1.season) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone Circuit' AND T1.name = 'British Grand Prix';	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year = 2010 AND T3.name = 'Singapore Grand Prix' ORDER BY T2.position	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE ds.points = (SELECT MAX(points) FROM driverStandings);	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid JOIN races r ON ds.raceid = r.raceid WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;	formula_1
SELECT drivers.forename, drivers.surname, races.name, MIN(lapTimes.milliseconds) AS best_lap_time FROM drivers INNER JOIN lapTimes ON drivers.driverId = lapTimes.driverId INNER JOIN races ON lapTimes.raceId = races.raceId GROUP BY drivers.driverId, races.raceId ORDER BY best_lap_time ASC LIMIT 1	formula_1
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM drivers JOIN results ON drivers.driverid = results.driverid JOIN lapTimes ON results.resultid = lapTimes.resultid JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix';	formula_1
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(r.points) AS max_points FROM drivers d JOIN results r ON d.driverid = r.driverid GROUP BY d.driverid ORDER BY COUNT(r.wins) DESC, max_points DESC LIMIT 1;	formula_1
SELECT forename, surname, TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitid ORDER BY COUNT(r.raceid) DESC LIMIT 4	formula_1
SELECT c.name, c.location, r.name FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006	formula_1
SELECT r.name AS RaceName, c.name AS CircuitName, c.location AS Location FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.date BETWEEN '2005-09-01' AND '2005-09-30'	formula_1
SELECT T3.name FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T2.forename = 'Alex' AND T2.surname = 'Yoong' AND T1.position < 20	formula_1
SELECT MAX(T3.points) FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid JOIN circuits AS T4 ON T3.circuitid = T4.circuitid WHERE T1.forename = 'Michael' AND T1.surname = 'Schumacher' AND T4.name = 'Sepang International Circuit'	formula_1
SELECT r.name AS Race_Name, r.year AS Year_of_Race FROM races r JOIN laptimes lt ON r.raceid = lt.raceid JOIN drivers d ON lt.driverid = d.driverid WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(T3.points) FROM drivers AS T1 INNER JOIN driverstandings AS T3 ON T1.driverid = T3.driverid INNER JOIN races AS T2 ON T3.raceid = T2.raceid WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T2.year = 2000	formula_1
SELECT MIN(r.year) AS first_race_year, ds.points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId JOIN races r ON ds.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton';	formula_1
SELECT T2.name, T1.country FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2017 ORDER BY T2.date	formula_1
SELECT r.name AS RaceName, r.year, c.location AS CircuitLocation, MAX(l.lap) AS MostLaps FROM races r JOIN circuits c ON r.circuitid = c.circuitid JOIN laptimes l ON r.raceid = l.raceid GROUP BY r.raceid ORDER BY MostLaps DESC LIMIT 1;	formula_1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1	formula_1
SELECT COUNT(driverId) FROM drivers WHERE code IS NULL	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone Circuit'	formula_1
SELECT url FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone');	formula_1
SELECT T1.time FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2010 AND T2.name = 'Abu Dhabi Circuit';	formula_1
SELECT COUNT(*) FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE c.country = 'Italy';	formula_1
SELECT date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'	formula_1
SELECT MIN(T2.fastestLapTime) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT T1.forename , T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2007 AND T3.name = 'Canadian Grand Prix' AND T2.position = 1	formula_1
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.rank ASC LIMIT 1	formula_1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T3.positionOrder FROM drivers AS T1 JOIN results AS T3 ON T1.driverid = T3.driverid JOIN races AS T2 ON T3.raceid = T2.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.name = 'Chinese Grand Prix' ORDER BY T3.positionOrder DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T2.grid = 4 AND T3.year = 1989 AND T3.name = "Australian Grand Prix"	formula_1
SELECT COUNT(driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix' AND T1.time IS NOT NULL	formula_1
SELECT T1.fastestLap FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Australian Grand Prix' AND T3.year = 2008	formula_1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'AustChineseralian Grand Prix' AND T1.rank = 2	formula_1
SELECT D.driverId, D.forename, D.surname, R.time, D.url FROM drivers AS D JOIN results AS R ON D.driverId = R.driverId JOIN races AS Ra ON R.raceId = Ra.raceId WHERE Ra.year = 2008 AND Ra.name = 'Australian Grand Prix' AND R.time LIKE '%:%';	formula_1
SELECT COUNT(DISTINCT driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND d.nationality = 'British'	formula_1
SELECT COUNT(DISTINCT driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.circuitid IN (SELECT circuitid FROM circuits WHERE name = "Chinese Grand Prix") AND T1.time IS NOT NULL;	formula_1
SELECT SUM(points) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(REPLACE(SUBSTR(T1.fastestLapTime, 4), ':', '')) AS averageFastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Hamilton' AND T2.surname = 'Lewis'	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.raceId) AS rate FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix';	formula_1
SELECT ((strftime('%M', T1.time) - strftime('%M', ( SELECT time FROM results WHERE raceId = T1.raceId AND positionOrder = 1 LIMIT 1 ) )) * 60 + (strftime('%S', T1.time) - strftime('%S', ( SELECT time FROM results WHERE raceId = T1.raceId AND positionOrder = 1 LIMIT 1 ))) / 60 + (strftime('%f', T1.time) - strftime('%f', ( SELECT time FROM results WHERE raceId = T1.raceId AND positionOrder = 1 LIMIT 1 ))) / 60000000) * 100 / ( SELECT time FROM results WHERE raceId = T1.raceId AND positionOrder = 1 LIMIT 1 ) AS percentage_difference FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'	formula_1
SELECT COUNT(circuitId) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(driverId) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980';	formula_1
SELECT MAX(points) FROM constructorStandings WHERE constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'British')	formula_1
SELECT T1.name FROM constructors AS T1 INNER JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T1.name FROM constructors AS T1 INNER JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid WHERE T2.raceid = 291 AND T2.points = 0	formula_1
SELECT COUNT(T1.constructorId) AS numberOfJapaneseConstructorsWithZeroPointsInTwoRaces FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'Japanese' AND T1.points = 0 GROUP BY T1.constructorId HAVING COUNT(T1.raceId) = 2;	formula_1
SELECT T1.name FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.rank = 1	formula_1
SELECT COUNT(constructorId) FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'French' AND T1.laps > 50;	formula_1
SELECT      nationality,      CAST(COUNT(CASE WHEN T1.time IS NOT NULL THEN T2.driverId END) AS REAL) * 100 / COUNT(T2.driverId) AS completion_percentage FROM      results AS T1 JOIN      drivers AS T2 ON T1.driverId = T2.driverId WHERE      T1.year BETWEEN 2007 AND 2009     AND T2.nationality = 'Japanese' GROUP BY      nationality;	formula_1
SELECT AVG(T1.milliseconds) / 1000 AS avg_time_seconds, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.statusid = 1 AND T2.year < 1975 GROUP BY T2.year;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE STRFTIME('%Y', T1.dob) > '1975' AND T2.rank = 2	formula_1
SELECT COUNT(driverId) FROM drivers INNER JOIN results ON drivers.driverId = results.driverId WHERE drivers.nationality = 'Italian' AND results.time IS NULL	formula_1
SELECT T1.forename , T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY fastestLapTime ASC LIMIT 1	formula_1
SELECT fastestLap FROM results WHERE raceId IN ( SELECT raceId FROM races WHERE year = 2009 ) AND time LIKE '%:%' ORDER BY TIME ASC LIMIT 1	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT T1.name, T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds IS NOT NULL GROUP BY T1.raceid, T1.name, T1.year ORDER BY MIN(T2.milliseconds) ASC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T1.dob < '1985-01-01' AND T2.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(driverId) FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'French' AND l.time < '02:00.00';	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE year = 2009;	formula_1
SELECT COUNT(*) FROM driverStandings WHERE raceId = 18;	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND dob IN (SELECT dob FROM drivers ORDER BY dob DESC LIMIT 3)	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(driverId) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'	formula_1
SELECT d.driverId, d.dob, p.time FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId ORDER BY MIN(p.time) ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE STRFTIME('%Y', d.dob) = '1971' AND r.fastestLapTime IS NOT NULL	formula_1
SELECT T1.driverId, T1.dob, T1.nationality, MAX(T2.time) AS latest_time FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Spanish' AND STRFTIME('%Y', T1.dob) < '1982' GROUP BY T1.driverId ORDER BY latest_time DESC LIMIT 10	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T2.fastestLapTime ASC LIMIT 1;	formula_1
SELECT year FROM races GROUP BY year ORDER BY MIN(time) ASC LIMIT 1	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 GROUP BY driverId ORDER BY MIN(REPLACE(SUBSTR(time, 4), ':', '')) DESC LIMIT 5	formula_1
SELECT COUNT(statusId) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2;	formula_1
SELECT location, lat, lng, COUNT(*) AS count FROM circuits WHERE country = 'Austria' GROUP BY location, lat, lng;	formula_1
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(raceId) DESC LIMIT 1;	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL;	formula_1
SELECT      YEAR(races.date) AS Year,     drivers.forename || ' ' || drivers.surname AS DriverName,     races.date AS RaceDate,     races.time AS RaceTime FROM      drivers JOIN      qualifying ON drivers.driverid = qualifying.driverid JOIN      races ON qualifying.raceid = races.raceid ORDER BY      drivers.dob DESC,      races.date ASC LIMIT 1;	formula_1
SELECT COUNT(DISTINCT driverId) FROM results AS T1 INNER JOIN status AS T2 ON T1.statusid = T2.statusid WHERE T1.status = 'Puncture' AND T1.driverid IN ( SELECT driverid FROM drivers WHERE nationality = 'American' )	formula_1
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId GROUP BY T1.constructorId ORDER BY SUM(T2.wins) DESC LIMIT 1	formula_1
SELECT driverId  FROM lapTimes  WHERE raceId = (SELECT raceId FROM races WHERE name = 'French Grand Prix') AND lap = 3  ORDER BY time DESC  LIMIT 1;	formula_1
SELECT raceId, MIN(milliseconds) FROM lapTimes GROUP BY raceId ORDER BY MIN(time) ASC LIMIT 1	formula_1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2006 AND T1.name = 'United States Grand Prix' AND T2.rank <= 10	formula_1
SELECT D forename ,  D surname ,  AVG(P duration) FROM drivers AS D JOIN pitStops AS P ON D.driverId = P.driverId WHERE STRFTIME('%Y', D.dob) BETWEEN '1980' AND '1985' GROUP BY D.driverId ORDER BY AVG(P.duration) ASC LIMIT 3	formula_1
SELECT T1.driverid, T2.time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 ORDER BY T2.position ASC LIMIT 1	formula_1
SELECT T1.constructorRef, T1.url FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2009 AND T3.name = 'Singapore Grand Prix' ORDER BY T2.time DESC LIMIT 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991';	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;	formula_1
SELECT country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT c.constructorId, c.name, c.nationality, SUM(cr.points) AS totalPoints FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId, c.name, c.nationality ORDER BY totalPoints DESC LIMIT 1;	formula_1
SELECT AVG(points)  FROM driverStandings  JOIN drivers ON driverStandings.driverId = drivers.driverId  JOIN races ON driverStandings.raceId = races.raceId  WHERE forename = 'Lewis' AND surname = 'Hamilton' AND raceId IN (SELECT raceId FROM races WHERE name = 'Turkish Grand Prix');	formula_1
SELECT YEAR, COUNT(date) AS avg_races FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY YEAR;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(wins) FROM driverStandings WHERE points = 91	formula_1
SELECT r.name AS raceName, MIN(res.fastestLapTime) AS fastestLapTime FROM races r JOIN results res ON r.raceId = res.raceId GROUP BY r.name ORDER BY fastestLapTime ASC;	formula_1
SELECT T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.q3 = ( SELECT MIN(q3) FROM qualifying WHERE driverId = T2.driverId ) AND T3.circuitId = 2 AND T3.year = 2008	formula_1
SELECT T1.forename, T1.surname, T1.nationality, T2.name FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverId IN ( SELECT MIN(driverId) FROM drivers ) WHERE T1.dob = ( SELECT MIN(dob) FROM drivers )	formula_1
SELECT COUNT(T1.statusid) AS accident_count FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.statusid = 3 AND T2.name = 'Canadian Grand Prix' GROUP BY T1.driverid ORDER BY accident_count DESC LIMIT 1;	formula_1
SELECT T1.forename, T1.surname, COUNT(T2.wins) FROM drivers AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT MAX(duration) AS longest_pit_stop FROM pitStops;	formula_1
SELECT MIN(REPLACE(time, ':', '')) AS fastest_time FROM lapTimes	formula_1
SELECT MAX(T1.duration) FROM pitStops AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T2.lap FROM drivers AS T1 INNER JOIN pitstops AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.year = 2011 AND T3.name = 'Australian Grand Prix'	formula_1
SELECT T2.duration FROM races AS T1 INNER JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix' GROUP BY T1.raceId	formula_1
SELECT MIN(T1.time) FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY T2.time ASC LIMIT 1	formula_1
SELECT T2.position FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.time ASC LIMIT 1;	formula_1
SELECT MIN(T2.fastestLapTime) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix'	formula_1
SELECT c.circuitId, c.country, MIN(r.time) AS min_time FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN results res ON r.raceId = res.raceId WHERE c.country = 'Italy' GROUP BY c.circuitId, c.country;	formula_1
SELECT r.name AS RaceName, MIN(res.time) AS LapRecordTime FROM races r JOIN circuits c ON r.circuitid = c.circuitid JOIN results res ON r.raceid = res.raceid WHERE c.name = 'Austrian Grand Prix Circuit' GROUP BY r.name ORDER BY LapRecordTime ASC;	formula_1
SELECT T1.duration FROM pitstops AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Austrian Grand Prix'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid INNER JOIN laptimes AS T3 ON T2.raceid = T3.raceid WHERE T3.time = '1:29.488'	formula_1
SELECT AVG(T2.milliseconds) FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT AVG(milliseconds), circuitId, country FROM circuits JOIN races ON circuits.circuitId = races.circuitId JOIN laptimes ON races.raceId = laptimes.raceId WHERE country = 'Italy' GROUP BY circuitId, country	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(id) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 64 AND defensive_work_rate = 'low';	european_football_2
SELECT player_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5;	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1	european_football_2
SELECT home_team, COUNT(*) as match_count  FROM matches  WHERE season = '2015/2016' AND home_team_goal < away_team_goal  GROUP BY home_team  ORDER BY match_count ASC  LIMIT 1;	european_football_2
SELECT player_name, MAX(penalties) AS max_penalties FROM players GROUP BY player_name ORDER BY max_penalties DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name  FROM Team AS T1  JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id  JOIN League AS T3 ON T2.league_id = T3.id  WHERE T3.name = 'Scotland Premier League' AND T2.season = '2009/2010'  AND T2.away_team_goal > T2.home_team_goal  GROUP BY T1.team_api_id  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT teamName, MAX(buildUpPlaySpeed) AS maxBuildUpPlaySpeed FROM teams GROUP BY teamName ORDER BY maxBuildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.id ORDER BY SUM(T2.home_team_goal = T2.away_team_goal) DESC LIMIT 1	european_football_2
SELECT strftime('%Y', 'now') - strftime('%Y', birthday) AS age FROM Player WHERE strftime('%Y', date) BETWEEN '2013' AND '2015' AND sprint_speed >= 97	european_football_2
SELECT league_name, COUNT(match_id) AS match_count FROM leagues JOIN matches ON leagues.league_id = matches.league_id GROUP BY league_name ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59';	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating = ( SELECT MAX(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%' )	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT team_long_name FROM table_name WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM table_name WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL);	european_football_2
SELECT      (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100 / COUNT(player_fifa_api_id)) AS percentage_left_foot_players FROM      players WHERE      YEAR(birthday) BETWEEN 1987 AND 1992;	european_football_2
SELECT league_name, SUM(home_team_goal + away_team_goal) AS total_goals FROM matches GROUP BY league_name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT AVG(long_shots) AS average_long_shot FROM players WHERE player_name = 'Ahmed Samir Farag';	european_football_2
SELECT Player.name, AVG(Player.heading_accuracy) AS avg_heading_accuracy FROM Player WHERE Player.height > 180 GROUP BY Player.player_fifa_api_id ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT team_long_name  FROM your_table_name WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' GROUP BY team_long_name HAVING SUM(chanceCreationPassing) / COUNT(id) < (SELECT AVG(chanceCreationPassing) FROM your_table_name WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY SUM(chanceCreationPassing) DESC;	european_football_2
SELECT L.name AS LeagueName FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal);	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name, birthday FROM Player WHERE strftime('%Y-%m', birthday) = '1970-10';	european_football_2
SELECT attacking_work_rate FROM players WHERE name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass FROM your_table_name WHERE team_long_name = 'ADO Den Haag';	european_football_2
SELECT heading_accuracy  FROM players  WHERE name = 'Francois Affolter' AND date = '2014-09-18 00:00:00';	european_football_2
SELECT Overall_Rating FROM players WHERE Player_Name = 'Gabriel Tamas' AND strftime('%Y', Date) = '2011';	european_football_2
SELECT COUNT(Matches.id)  FROM Matches  JOIN Leagues ON Matches.league_id = Leagues.id  WHERE Matches.season = '2015/2016' AND Leagues.name = 'Scotland Premier League';	european_football_2
SELECT preferred_foot FROM players ORDER BY birthday DESC LIMIT 1;	european_football_2
SELECT * FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes);	european_football_2
SELECT COUNT(*)  FROM players  WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM your_table_name WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT defensive_work_rate FROM players WHERE name = 'David Wilson';	european_football_2
SELECT birthday  FROM players  WHERE overall_rating = (SELECT MAX(overall_rating) FROM players);	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands';	european_football_2
SELECT AVG(home_team_goal) AS average_home_team_goal FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_api_id, AVG(pa.finishing) AS avg_finishing_rate FROM Player pa JOIN Player_Attributes paa ON pa.player_api_id = paa.player_api_id WHERE pa.height IN ((SELECT MAX(height) FROM Player), (SELECT MIN(height) FROM Player)) GROUP BY p.player_api_id ORDER BY avg_finishing_rate DESC;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(id) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(player_name) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT player_name  FROM players  WHERE overall_rating > 80  AND strftime('%Y', date) BETWEEN '2008' AND '2010';	european_football_2
SELECT potential FROM players WHERE name = 'Aaron Doran';	european_football_2
SELECT * FROM players WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM your_table_name WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM teams WHERE team_short_name = 'CLB';	european_football_2
SELECT team_short_name FROM table_name WHERE buildUpPlayPassing > 70;	european_football_2
SELECT AVG(t2.overall_rating)  FROM Player AS t1  JOIN Match AS t2 ON t1.id = t2.player_id  WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170;	european_football_2
SELECT Player FROM players ORDER BY Height ASC LIMIT 1;	european_football_2
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Italy Serie A';	european_football_2
SELECT team_short_name FROM teams WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM players WHERE name = 'Aaron Doran';	european_football_2
SELECT COUNT(Matches)  FROM Matches  JOIN League ON Matches.League_ID = League.ID  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', Matches.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT team_short_name FROM matches WHERE home_team_goal = 10;	european_football_2
SELECT player, balance, potential FROM players WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM players WHERE potential = 61);	european_football_2
SELECT      (SUM(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Abdou Diallo' THEN id ELSE NULL END)) -      (SUM(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Aaron Appindangoye' THEN id ELSE NULL END)) AS difference_of_average_ball_control FROM      your_table_name;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT COUNT(player_api_id) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';	european_football_2
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Belgium Jupiler League';	european_football_2
SELECT L.name AS League FROM League L JOIN Country C ON L.country_id = C.id WHERE C.name = 'Germany';	european_football_2
SELECT player, MAX(overall_rating) AS overall_strength FROM players GROUP BY player ORDER BY overall_strength DESC;	european_football_2
SELECT COUNT(DISTINCT player_id)  FROM players  WHERE strftime('%Y', birthday) < '1986'  AND defensive_work_rate = 'high';	european_football_2
SELECT player, MAX(crossing) AS max_crossing FROM players WHERE player IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY player ORDER BY max_crossing DESC;	european_football_2
SELECT heading_accuracy FROM users WHERE name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*)  FROM players  WHERE height > 180 AND volleys > 70;	european_football_2
SELECT player_name, volleys, dribbling FROM players WHERE volleys > 70 AND dribbling > 70;	european_football_2
SELECT COUNT(Match.id)  FROM Match  JOIN Season ON Match.season_id = Season.id  JOIN Country ON Match.country_id = Country.id  WHERE Season.year = '2008/2009' AND Country.name = 'Belgium';	european_football_2
SELECT long_passing FROM players ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(matches) FROM `matches` WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04';	european_football_2
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(T2.match_api_id) DESC LIMIT 1	european_football_2
SELECT AVG(overall_rating) FROM players WHERE strftime('%Y', birthday) < '1986';	european_football_2
SELECT      ((SELECT overall_rating FROM players WHERE player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM players WHERE player_name = 'Paulin Puel')) * 100 / (SELECT overall_rating FROM players WHERE player_name = 'Paulin Puel') AS percentage_increase;	european_football_2
SELECT AVG(buildUpPlaySpeed) AS avg_build_up_play_speed FROM your_table_name WHERE team_long_name = 'Heart of Midlothian';	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM players WHERE player_name = 'Pietro Marino';	european_football_2
SELECT SUM(T1.crossing) AS total_crossing_score FROM player_stats AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id WHERE T2.player_name = 'Aaron Lennox';	european_football_2
SELECT MAX(chanceCreationPassing) AS max_chance_creation_passing, chanceCreationPassingClass FROM your_table_name WHERE team_long_name = 'Ajax';	european_football_2
SELECT preferred_foot FROM players WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(T1.overall_rating) AS highest_overall_rating FROM player_stats AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id WHERE T2.player_name = 'Dorlan Pabon';	european_football_2
SELECT AVG(T1.away_team_goal)  FROM match AS T1  JOIN country AS T2 ON T1.country_id = T2.id  JOIN team AS T3 ON T1.away_team_api_id = T3.api_id  WHERE T2.name = 'Italy' AND T3.team_long_name = 'Parma';	european_football_2
SELECT player_name  FROM your_table_name  WHERE overall_rating = 77 AND date LIKE '2016-06-23%'  ORDER BY birthday ASC  LIMIT 1;	european_football_2
SELECT overall_rating  FROM your_table_name  WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%';	european_football_2
SELECT potential FROM players WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00';	european_football_2
SELECT attacking_work_rate FROM your_table_name WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%';	european_football_2
SELECT defensive_work_rate  FROM your_table_name  WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00';	european_football_2
SELECT MIN(date) AS first_highest_crossing_date FROM Player_Attributes WHERE player_name = 'Kevin Constant';	european_football_2
SELECT build_up_play_speed_class  FROM your_table_name  WHERE team_long_name = 'Willem II' AND date = '2012-02-22';	european_football_2
SELECT build_up_play_dribbling_class  FROM match_details  WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00';	european_football_2
SELECT team_long_name, date, play_passing_class  FROM your_table_name  WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%' GROUP BY team_long_name, date;	european_football_2
SELECT chance_creation_passing_class FROM match_data WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00';	european_football_2
SELECT chance_creation_crossing  FROM your_table_name  WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00';	european_football_2
SELECT defence_aggression_class FROM your_table_name WHERE team_long_name = 'Hannover 96' AND date LIKE '2015-09-10%';	european_football_2
SELECT AVG(overall_rating) AS average_overall_rating FROM your_table_name WHERE player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22' AND '2016-04-21';	european_football_2
SELECT      (CAST((SELECT overall_rating FROM players WHERE player_name = 'Landon Donovan' AND date = '2013-07-12') -           (SELECT overall_rating FROM players WHERE player_name = 'Jordan Bowery' AND date = '2013-07-12') AS REAL) * 100 /       (SELECT overall_rating FROM players WHERE player_name = 'Landon Donovan' AND date = '2013-07-12')) AS percentage_difference;	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE birthday <= date('now','-35 years')	european_football_2
SELECT COUNT(home_team_goal)  FROM match_stats  WHERE player_name = 'Aaron Lennon';	european_football_2
SELECT SUM(T2.away_team_goal_scored) AS total_away_goals FROM players AS T1 JOIN match_events AS T2 ON T1.player_id = T2.player_id WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira');	european_football_2
SELECT SUM(home_team_goal_scored) FROM Player WHERE strftime('%Y', 'now') - strftime('%Y', birthday) < 31;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1	european_football_2
SELECT player_name, MAX(potential) AS highest_potential FROM players ORDER BY highest_potential DESC;	european_football_2
SELECT player_name FROM players WHERE attacking_work_rate = 'high';	european_football_2
SELECT name, birthday FROM players WHERE finishing = 1 ORDER BY datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) DESC LIMIT 1;	european_football_2
SELECT player_name FROM players WHERE country = 'Belgium';	european_football_2
SELECT Country FROM players WHERE Vision > 89;	european_football_2
SELECT country, AVG(weight) AS avg_weight FROM players GROUP BY country ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT team_short_name FROM your_table_name WHERE chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(T1.height) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.id = T2.country_id WHERE T2.country_id = 1	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3	european_football_2
SELECT COUNT(id) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT (SELECT jumping FROM players WHERE id = 6) - (SELECT jumping FROM players WHERE id = 23) AS score_difference;	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND preferred_foot = 'left'	european_football_2
SELECT CAST(COUNT(*) AS REAL) * 100 / ( SELECT COUNT(*) FROM Player_Attributes ) AS percentage FROM Player_Attributes WHERE stamina > 80 AND strength > 80;	european_football_2
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Poland Ekstraklasa'	european_football_2
SELECT      home_team_goal AS final_score_home_team,     away_team_goal AS final_score_away_team FROM      match JOIN      league ON match.league_id = league.id WHERE      match.date LIKE '2008-09-24%'     AND league.name = 'Belgium Jupiler League';	european_football_2
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin'	european_football_2
SELECT buildUpPlaySpeedClass FROM teams WHERE team_long_name = 'KSV Cercle Brugge';	european_football_2
SELECT COUNT(*) AS GamesPlayed FROM games WHERE season = '2015/2016' AND league = 'Italian Serie A';	european_football_2
SELECT MAX(home_team_goal) AS highest_score FROM match_results WHERE competition = 'Netherlands Eredivisie';	european_football_2
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.weight DESC LIMIT 1	european_football_2
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 4	european_football_2
SELECT T1.team_long_name  FROM teams AS T1  JOIN matches AS T2 ON T1.team_api_id = T2.away_team_api_id  GROUP BY T2.away_team_api_id  ORDER BY SUM(T2.away_team_goal) DESC  LIMIT 1;	european_football_2
SELECT MAX(overall_rating) FROM Player_Attributes	european_football_2
SELECT CAST(SUM(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(id) AS percentage FROM players;	european_football_2
SELECT Admission, COUNT(SEX) FROM Patient WHERE SEX = 'M' GROUP BY Admission	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN YEAR(Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Patient WHERE SEX = 'F';	thrombosis_prediction
SELECT (COUNT(CASE WHEN Admission = '+' THEN 1 ELSE NULL END) / COUNT(*)) * 100 AS InpatientPercentage FROM Patient WHERE YEAR(Birthday) BETWEEN '1930-01-01' AND '1940-12-31';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM Patient WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT P.Diagnosis, L.Date FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.ID = '30609';	thrombosis_prediction
SELECT P.SEX, P.Birthday, E.`Examination Date`, E.Symptoms FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.ID = '163109';	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH > 500;	thrombosis_prediction
SELECT T1.ID, strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.Thrombosis = 2	thrombosis_prediction
SELECT P.ID, P.Birthday, L.`T-CHO` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE strftime('%Y', P.Birthday) = '1937' AND L.`T-CHO` >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.ALB < 3.5	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.SEX = 'F' AND (T1.TP < 6.0 OR T1.TP > 8.5) THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT AVG(`aCL IgG`) AS Average_IgG_Concentration, strftime('%Y', 'now') - strftime('%Y', Birthday) AS Age FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Admission = '+' AND strftime('%Y', 'now') - strftime('%Y', Birthday) >= 50;	thrombosis_prediction
SELECT COUNT(SEX) FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '-';	thrombosis_prediction
SELECT MIN(DATEDIFF(YEAR(`First Date`), YEAR(`Birthday`))) AS YoungestAge FROM Patient WHERE `Birthday` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Thrombosis` = 1 AND T1.`Examination Date` LIKE '1997%' AND T2.SEX = 'F'	thrombosis_prediction
SELECT MAX(YEAR(T2.Birthday)) - MIN(YEAR(T2.Birthday)) AS AgeGap FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG >= 200	thrombosis_prediction
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms IS NOT NULL ORDER BY T1.Birthday DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(COUNT(ID)) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1998-01-01' AND '1998-12-31' AND T2.SEX = 'M' GROUP BY MONTH(T1.Date)	thrombosis_prediction
SELECT T1.`First Date`, TIMESTAMPDIFF(YEAR, T1.Birthday, T1.`First Date`) AS Age FROM Patient AS T1 WHERE T1.Diagnosis = 'SJS' ORDER BY T1.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE NULL END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T2.UA <= 8.0) OR (T1.SEX = 'F' AND T2.UA <= 6.5)	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient`.`ID`) FROM `Patient` INNER JOIN `Examination` ON `Patient`.`ID` = `Examination`.`ID` WHERE STRFTIME('%Y', `Examination`.`Examination Date`) - STRFTIME('%Y', `Patient`.`First Date`) >= 1 AND `Patient`.`Admission` = '+';	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.`Examination Date`) BETWEEN '1990' AND '1993' AND STRFTIME('%Y', T1.Birthday) < '1998';	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS MalePatientsWithElevatedTBIL FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', Patient.Birthday)) AS AverageAge FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
SELECT T1.Age ,  T2.Diagnosis FROM ( SELECT ID ,  (strftime('%Y', 'now') - strftime('%Y', Birthday)) AS Age FROM Patient ) AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HGB = ( SELECT MAX(HGB) FROM Laboratory )	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02';	thrombosis_prediction
SELECT CASE WHEN T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS Status FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04'	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1	thrombosis_prediction
SELECT T2.`aCL IgM` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description = '1994-02-19' AND T2.`Examination Date` = '1993-11-12' AND T1.Diagnosis = 'SLE';	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Date = '1992-06-12' AND T2.GPT = 9	thrombosis_prediction
SELECT TIMESTAMPDIFF(YEAR, Birthday, '1991-10-21') AS Age FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE UA = 8.4 AND Date = '1991-10-21')	thrombosis_prediction
SELECT COUNT(Lab.ID) FROM Patient AS Pat INNER JOIN Laboratory AS Lab ON Pat.ID = Lab.ID WHERE Pat.`First Date` = '1991-06-13' AND Pat.Diagnosis = 'SJS' AND strftime('%Y', Lab.Date) = '1995'	thrombosis_prediction
SELECT P.`Diagnosis` AS `Original Diagnosis`, E.`Examination Date`, E.`Diagnosis` FROM `Patient` P JOIN `Examination` E ON P.`ID` = E.`ID` WHERE E.`Examination Date` = '1997-01-27' AND E.`Diagnosis` = 'SLE';	thrombosis_prediction
SELECT T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.`Examination Date` = '1993-09-27';	thrombosis_prediction
SELECT      DATE_FORMAT(Date, '%Y-%m') AS Month,     SUM(CASE WHEN Birthday = '1959-02-18' AND Date LIKE '1981-11-%' THEN `T-CHO` ELSE 0 END) -      SUM(CASE WHEN Birthday = '1959-02-18' AND Date LIKE '1981-12-%' THEN `T-CHO` ELSE 0 END) AS DecreaseRate FROM      Laboratory JOIN      Patient ON Laboratory.ID = Patient.ID WHERE      Birthday = '1959-02-18' AND Date BETWEEN '1981-11-01' AND '1981-12-31' GROUP BY      DATE_FORMAT(Date, '%Y-%m') ORDER BY      Month;	thrombosis_prediction
SELECT ID FROM Examination WHERE Diagnosis LIKE '%Behcet%' AND `Examination Date` BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4;	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Birthday) = '1964' AND Admission = '+' ORDER BY ID	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (AVG(`aCL IgM`) * 1.2);	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'M' AND STRFTIME('%Y', `First Date`) = '1981';	thrombosis_prediction
SELECT P.ID, P.Admission, L.Date, L.`T-BIL` FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.`T-BIL` < 2.0	thrombosis_prediction
SELECT COUNT(ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`ANA Pattern` != 'P' AND T2.Birthday BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123	thrombosis_prediction
SELECT AVG(ALB) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T2.Diagnosis = 'SLE' AND T1.PLT > 400	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(Symptoms) DESC LIMIT 1	thrombosis_prediction
SELECT `First Date`, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS';	thrombosis_prediction
SELECT COUNT(ID) FROM Laboratory WHERE YEAR(Date) = '1997' AND (ALB <= 6 OR ALB >= 8.5);	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT CASE WHEN DIAGNOSIS LIKE '%SLE%' THEN ID END) AS REAL) * 100 / COUNT(DISTINCT CASE WHEN SYMPTOMS LIKE '%thrombocytopenia%' THEN ID END) AS Proportion FROM Examination;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Patient WHERE STRFTIME('%Y', Birthday) = '1980' AND Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.`Examination Date` BETWEEN '1995' AND '1997' AND P.Diagnosis = 'Behcet' AND P.Admission = '-';	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination`.`Examination Date`, `Patient`.`First Date`) AS DaysBeforeEvaluation FROM `Examination` INNER JOIN `Patient` ON `Examination`.`ID` = `Patient`.`ID` WHERE `Patient`.`ID` = 821298;	thrombosis_prediction
SELECT CASE WHEN UA IS NOT NULL AND (UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F') THEN 'Yes' ELSE 'No' END AS NormalRange FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.ID = 57266;	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60	thrombosis_prediction
SELECT P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE strftime('%Y', L.Date) = '1994' AND L.GOT < 60;	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60	thrombosis_prediction
SELECT P.Diagnosis, P.Birthday, L.GPT FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GPT > 60 ORDER BY P.Birthday ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;	thrombosis_prediction
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT T1.Admission FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP < 300	thrombosis_prediction
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0	thrombosis_prediction
SELECT TP - 8.5 AS Deviation FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5;	thrombosis_prediction
SELECT P.ID, P.Birthday, P.SEX, L.ALB FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT P.Birthday, L.ALB FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1982' AND L.ALB BETWEEN 3.5 AND 5.5	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.SEX = 'F' AND (T2.UA > 8.0 OR T2.UA > 6.5) THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F';	thrombosis_prediction
SELECT AVG(L.UA) FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE (P.SEX = 'F' AND L.UA < 6.5) OR (P.SEX = 'M' AND L.UA < 8.0) AND L.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = L.ID)	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.UN = 29;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'RA' AND L.UN < 30;	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT CASE WHEN SUM(CASE WHEN T1.SEX = 'M' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END AS result FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE IS NOT NULL	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.`T-BIL` FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID ORDER BY L.`T-BIL` DESC LIMIT 1;	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT ID) AS Patients FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE T_BIL IS NOT NULL AND T_BIL >= 2.0 GROUP BY SEX;	thrombosis_prediction
SELECT P.ID, P.Birthday, L.[T-CHO], SUM(L.[T-CHO]) AS Total_T_CHO FROM Patient P JOIN Laboratory L ON P.ID = L.ID GROUP BY P.ID, P.Birthday, L.[T-CHO] ORDER BY P.Birthday ASC, Total_T_CHO DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(STRFTIME('%Y', 'now') - STRFTIME('%Y', Birthday)) AS AverageAge FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.`T-CHO` >= 250	thrombosis_prediction
SELECT P.ID, P.Diagnosis, L.TG FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TG > 300	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS PatientCount FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) > 50;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID)  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE strftime('%Y', Patient.Birthday) BETWEEN '1936' AND '1956'  AND Patient.SEX = 'M'  AND Laboratory.CPK >= 250;	thrombosis_prediction
SELECT P.ID, P.SEX, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250;	thrombosis_prediction
SELECT P.ID, L.GLU FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE STRFTIME('%Y', P.`First Date`) = '1991' AND L.GLU < 180;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY P.SEX ORDER BY TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_DATE) ASC;	thrombosis_prediction
SELECT T1.Diagnosis, T1.ID, strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5	thrombosis_prediction
SELECT P.ID, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) AS Age, L.RBC, P.Admission FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND (STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday)) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0)	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.HGB < 10	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.HGB FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 ORDER BY P.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT P.ID, strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID HAVING COUNT(L.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS Calculation FROM      Laboratory;	thrombosis_prediction
SELECT P.ID, P.Birthday, L.Date, L.PLT FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE YEAR(L.Date) = '1984' AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) < 50 AND L.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND T2.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) > 55;	thrombosis_prediction
SELECT P.ID, P.`First Date`, L.PT FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.`First Date`) > '1992' AND L.PT < 14	thrombosis_prediction
SELECT COUNT(ID) FROM Laboratory WHERE Date > '1997-01-01' AND APTT < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.APTT > 45 AND T2.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS NumberOfPatients FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday > '1980-01-01' AND L.FG BETWEEN 150 AND 450;	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.`U-PRO` > 0 AND L.`U-PRO` < 30 AND P.Diagnosis = 'SLE'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 WHERE T1.IGG >= 2000	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGG BETWEEN 900 AND 2000 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT Diagnosis FROM your_table_name WHERE IgA = (SELECT MAX(IgA) FROM your_table_name WHERE IgA BETWEEN 80 AND 500);	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.`First Date` >= '1990-01-01' AND L.IGA BETWEEN 80 AND 500	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGM <= 40 OR T2.IGM >= 400 GROUP BY T1.Diagnosis ORDER BY COUNT(T1.Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRP = '+' AND T1.Description IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, T2.Birthday, CURDATE()) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.RA IN ('-', '+-') AND T3.KCT = '+';	thrombosis_prediction
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) >= '1985' AND T2.RA IN ('-', '+-')	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND strftime('%Y', 'now') - strftime('%Y', T1.Birthday) > 60	thrombosis_prediction
SELECT COUNT(*) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.RF < 20 AND E.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`ANA Pattern` = 'P' AND T2.C3 > 35	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT NOT BETWEEN 29 AND 52 ORDER BY T1.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS NumberOfPatients FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis LIKE '%APS%' AND L.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.RNP IN ('-', '+-');	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SM IN ('-', '+-') AND T1.Thrombosis = 0	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date > '1997-01-01' AND T2.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SC170 IN ('negative', '0') AND T1.SEX = 'F' AND T2.Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT `ID`) FROM `Patient` WHERE `First Date` < '2000-01-01' AND `SSA` IN ('-', '+')	thrombosis_prediction
SELECT ID FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE SSA NOT IN ('negative', '0') ) ORDER BY `First Date` ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND Laboratory.SSB IN ('-', '+-');	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.CENTROMEA IN ('-', '+-') AND Laboratory.SSB IN ('-', '+-');	thrombosis_prediction
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT Patient.ID) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.DNA < 8 AND Patient.Description IS NULL	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGG BETWEEN 900 AND 2000 AND T2.Admission = '+'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.GOT >= 60 THEN 1 ELSE 0 END) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT COUNT(ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60;	thrombosis_prediction
SELECT MIN(T1.Birthday) AS Youngest_Birthdate FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60;	thrombosis_prediction
SELECT P.Birthday, L.GPT FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GPT < 60 ORDER BY P.Birthday, L.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(Patient.ID) AS Male_Patients_with_Normal_GOT FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GOT < 60 AND Patient.SEX = 'M';	thrombosis_prediction
SELECT MIN(T1.`First Date`) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500;	thrombosis_prediction
SELECT T1.`First Date`, T2.LDH FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300 AND T1.Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.ALP < 300;	thrombosis_prediction
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0	thrombosis_prediction
SELECT COUNT(*) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' AND L.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT `Date`, MAX(`ALB`) FROM `Laboratory` WHERE `ALB` > 3.5 AND `ALB` < 5.5	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT T1.`aCL IgG`, T1.`aCL IgM`, T1.`aCL IgA` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T2.SEX = 'F' AND T3.UA > 6.50 ORDER BY T3.UA DESC LIMIT 1	thrombosis_prediction
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5	thrombosis_prediction
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T2.`aCL IgA` DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-BIL` >= 2.0 AND E.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-CHO` >= 250 AND E.KCT = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` < 250 AND T1.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT T1.Diagnosis FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1	thrombosis_prediction
SELECT ID FROM Examination WHERE Thrombosis = 0 INTERSECT SELECT ID FROM Laboratory WHERE CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CPK < 250 AND (T1.KCT = '+' OR T1.RVVT = '+' OR T1.LAC = '+')	thrombosis_prediction
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180 ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) AS PatientCount FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 180 AND T1.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) AS Normal_WBC_Patients FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(Patient.ID) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.Diagnosis = 'SLE' AND Laboratory.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND (L.RBC <= 3.5 OR L.RBC >= 6.0);	thrombosis_prediction
SELECT COUNT(DISTINCT T1.Diagnosis) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PLT > 100 AND T2.PLT < 400 AND T1.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT T1.ID, T1.PLT, T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.PLT BETWEEN 100 AND 400 AND T2.Diagnosis = 'MCTD'	thrombosis_prediction
SELECT AVG(Laboratory.PT) AS Average_Prothrombin_Time FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'M' AND Laboratory.PT < 14;	thrombosis_prediction
SELECT COUNT(Patient.ID) AS SevereThrombosisNormalPT FROM Examination JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE (Examination.Thrombosis = 2 OR Examination.Thrombosis = 1) AND Laboratory.PT < 14;	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS j ON m.link_to_major = j.major_id WHERE j.college = 'College of Engineering';	student_club
SELECT m.first_name, m.last_name, ma.department FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design Department';	student_club
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer';	student_club
SELECT T1.phone FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer';	student_club
SELECT COUNT(*) FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium'	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_name ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT e.event_name FROM event AS e JOIN attendance AS a ON e.event_id = a.link_to_event JOIN member AS m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean';	student_club
SELECT COUNT(T2.event_id) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison' AND STRFTIME('%Y', T3.event_date) = '2019';	student_club
SELECT COUNT(e.event_id) AS meeting_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_event) > 10;	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type != 'fundraiser' GROUP BY e.event_name HAVING COUNT(e.event_id) > 20;	student_club
SELECT COUNT(event_id) / COUNT(DISTINCT link_to_event) AS average_attendance FROM event JOIN attendance ON event.event_id = attendance.link_to_event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020';	student_club
SELECT MAX(cost) FROM expense	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT m.first_name, m.last_name FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud';	student_club
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey';	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt';	student_club
SELECT SUM(T1.amount) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President' GROUP BY T2.position	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food';	student_club
SELECT T1.city, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.position = 'President'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois';	student_club
SELECT SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement';	student_club
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.last_name IN ('Pierce', 'Guidi')	student_club
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'	student_club
SELECT T3.approved FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'October Meeting' AND T1.event_date LIKE '2019-10-08%'	student_club
SELECT AVG(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND SUBSTR(T2.expense_date, 6, 2) IN ('09', '10')	student_club
SELECT SUM(CASE WHEN STRFTIME('%Y', T1.event_date) = '2019' THEN T2.spent ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', T1.event_date) = '2020' THEN T2.spent ELSE 0 END) AS diff_spent FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' )	student_club
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'November Meeting' AND T2.remaining < 0;	student_club
SELECT SUM(T2.amount) AS total_budget_amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Speaker';	student_club
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_date = '2019-8-20' AND T1.expense_description = 'Post Cards, Posters';	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(member_id) FROM member WHERE t_shirt_size = 'Medium' AND link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business')	student_club
SELECT T1.type FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielson';	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President';	student_club
SELECT T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'	student_club
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'	student_club
SELECT T2.first_name, T2.last_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.source = 'Dues' ORDER BY T1.date_received ASC LIMIT 1	student_club
SELECT SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) / SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END) AS ratio FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name IN ('Yearly Kickoff', 'October Meeting') AND T2.category = 'Advertisement';	student_club
SELECT CAST(SUM(CASE WHEN T2.category = 'Parking' THEN T2.amount ELSE 0 END) AS REAL) / COUNT(T1.event_name) * 100 FROM event AS T1 INNER JOIN budget AS T2 ON T2.link_to_event = T1.event_id WHERE T1.event_name = 'November Speaker';	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';	student_club
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth'	student_club
SELECT T2.expense_description FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T1.remaining = ( SELECT MIN(remaining) FROM budget )	student_club
SELECT T1.member_id FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'October Meeting';	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id GROUP BY T2.college ORDER BY COUNT(T2.college) DESC LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360';	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'	student_club
SELECT COUNT(T2.link_to_member) AS member_count FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer';	student_club
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason';	student_club
SELECT COUNT(*) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Maryland'	student_club
SELECT COUNT(DISTINCT T1.link_to_event) FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.phone = '954-555-6240'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major j ON m.link_to_major = j.major_id WHERE j.department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT T1.event_name, SUM(T2.spent) AS total_spent, SUM(T2.amount) AS total_amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' GROUP BY T1.event_name ORDER BY total_spent / total_amount DESC LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM `event` WHERE `type` = 'Meeting' AND STRFTIME('%Y', `event_date`) = '2020';	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food';	student_club
SELECT T.first_name, T.last_name FROM ( SELECT T1.first_name, T1.last_name, COUNT(T2.link_to_event) AS num_events FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T2.link_to_member ) AS T WHERE T.num_events > 7	student_club
SELECT m.member_id, m.first_name, m.last_name, maj.major_name, e.event_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major maj ON m.link_to_major = maj.major_id WHERE maj.major_name = 'Interior Design' AND e.event_name = 'Community Theater';	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina';	student_club
SELECT COUNT(income.amount) FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40	student_club
SELECT SUM(T3.cost) AS total_expense FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff';	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) AS max_income FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.first_name, m.last_name, i.source ORDER BY max_income DESC;	student_club
SELECT T1.event_name, MIN(T3.cost) AS lowest_cost FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget	student_club
SELECT      (SUM(CASE WHEN T3.event_name = 'Yearly Kickoff' THEN T2.cost ELSE 0 END) / SUM(T2.cost)) * 100 AS percentage FROM      expense AS T1 JOIN      budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN      event AS T3 ON T2.link_to_event = T3.event_id;	student_club
SELECT CAST(COUNT(CASE WHEN major_name = 'Finance' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN major_name = 'Physics' THEN 1 ELSE NULL END) AS ratio FROM major;	student_club
SELECT source  FROM income  WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30'  GROUP BY source  ORDER BY COUNT(source) DESC  LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Member';	student_club
SELECT COUNT(T1.member_id) AS member_count FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching';	student_club
SELECT COUNT(T2.link_to_member) AS member_count FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND STRFTIME('%Y', T1.event_date) = '2019';	student_club
SELECT COUNT(T2.link_to_event), T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major INNER JOIN attendance AS T3 ON T2.member_id = T3.link_to_member WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi';	student_club
SELECT SUM(spent) / COUNT(spent) AS avg_spent FROM budget WHERE category = 'Food' AND event_status = 'Closed';	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT CASE WHEN EXISTS ( SELECT 1 FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean' AND T3.event_name = 'Women''s Soccer' ) THEN 'Yes' ELSE 'No' END AS attended	student_club
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / COUNT(event_date)) * 100 AS percentage FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';	student_club
SELECT SUM(e.cost)  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'September Speaker' AND e.expense_description = 'Posters';	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.event_status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1	student_club
SELECT T1.type, SUM(T3.cost) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'October Meeting'	student_club
SELECT category, SUM(amount) AS total_amount FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_amount ASC	student_club
SELECT MAX(amount) FROM budget WHERE category = 'Food'	student_club
SELECT category, amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(cost) AS total_cost FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20';	student_club
SELECT T2.first_name, T2.last_name, SUM(T1.cost) AS total_cost FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.link_to_member = 'rec4BLdZHS2Blfp4v'	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large';	student_club
SELECT T1.zip FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT T2.position FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Business';	student_club
SELECT COUNT(m.member_id)  FROM member m  JOIN major j ON m.link_to_major = j.major_id  WHERE j.major_name = 'Business' AND m.t_shirt_size = 'Medium';	student_club
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;	student_club
SELECT DISTINCT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215';	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_date = '2020-03-24T12:00:00'	student_club
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT CAST(SUM(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215' GROUP BY T2.category	student_club
SELECT COUNT(income_id) FROM income WHERE amount = 50;	student_club
SELECT COUNT(member_id) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering';	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0;	student_club
SELECT T2.city, T2.state  FROM major AS T1  JOIN member AS T3 ON T1.major_id = T3.link_to_major  JOIN zip_code AS T2 ON T3.zip = T2.zip_code  WHERE T1.department = 'Electrical and Computer Engineering Department' AND T3.position = 'Member';	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position = 'Vice President' AND e.location = '900 E. Washington St.';	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date = '2019-09-10' AND e.expense_description = 'Pizza';	student_club
SELECT T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T2.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN T1.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Member' AND T2.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT county FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20';	student_club
SELECT T1.link_to_event FROM attendance AS T1 INNER JOIN expense AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.cost > 50	student_club
SELECT T2.link_to_event FROM expense AS T1 INNER JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19' GROUP BY T2.link_to_event, T2.link_to_member	student_club
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Katy' AND T2.link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT T2.phone FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Business' AND T1.college = 'College of Agriculture and Applied Sciences'	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20;	student_club
SELECT COUNT(m.member_id) AS member_count FROM member m JOIN major j ON m.link_to_major = j.major_id WHERE j.major_name = 'Education' AND m.position = 'Member';	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
SELECT expense_description FROM expense WHERE cost > 50 GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0;	student_club
SELECT T1.event_name, T1.event_date FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost > 50 AND T3.cost < 100	student_club
SELECT T1.first_name, T1.last_name, T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN expense AS T3 ON T1.member_id = T3.link_to_member WHERE T3.cost > 100	student_club
SELECT T2.city, T2.county FROM income AS T1 JOIN zip_code AS T2 ON T1.link_to_member = T2.zip_code GROUP BY T2.city, T2.county HAVING COUNT(T1.amount) > 40;	student_club
SELECT T2.member_id ,  SUM(T1.cost) FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T2.member_id HAVING COUNT(DISTINCT T1.link_to_budget) > 1 ORDER BY SUM(T1.cost) DESC LIMIT 1	student_club
SELECT AVG(T1.cost) FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position != 'Member';	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Parking' AND ex.cost < (SELECT AVG(cost) FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE category = 'Parking'));	student_club
SELECT CAST(SUM(CASE WHEN T1.type = 'Meeting' THEN T2.cost ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event;	student_club
SELECT MAX(cost) AS max_cost FROM expense WHERE expense_description = 'Water, Chips, Cookies';	student_club
SELECT m.first_name, m.last_name, SUM(b.spent) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id, m.first_name, m.last_name ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT T1.first_name, T1.last_name, T1.phone, T2.cost FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > ( SELECT AVG(cost) FROM expense ) GROUP BY T2.link_to_member	student_club
SELECT CAST(SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.position), CAST(SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.position) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member'	student_club
SELECT T1.major_name, T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, T2.cost FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T1.last_name, T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'	student_club
SELECT T1.category, SUM(T1.amount) AS total_amount FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker' GROUP BY T1.category;	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'	student_club
SELECT m.first_name, m.last_name, i.amount FROM member AS m JOIN income AS i ON m.member_id = i.link_to_member WHERE i.date_received = '2019-09-09';	student_club
SELECT T1.category FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Posters';	student_club
SELECT T1.first_name, T1.last_name, T1.position, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'	student_club
SELECT T2.event_name, SUM(T1.spent) AS total_spent FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts' GROUP BY T2.event_name;	student_club
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina'	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS Ratio FROM customers	debit_card_specializing
SELECT c.CustomerID, c.Segment, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Consumption BETWEEN 201201 AND 201212 AND c.Segment = 'LAM' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(T2.Consumption) / 12 AS AvgMonthlyConsumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201101' AND '201112' AND c.Currency = 'CZK' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC;	debit_card_specializing
SELECT COUNT(CustomerID) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND Consumption < 30000;	debit_card_specializing
SELECT      c.Currency,      SUM(CASE WHEN ym.Date BETWEEN '201201' AND '201212' THEN ym.Consumption ELSE 0 END) AS TotalConsumption FROM      customers c JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      ym.Date BETWEEN '201201' AND '201212' GROUP BY      c.Currency;	debit_card_specializing
SELECT T2.Date FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' GROUP BY T2.Date ORDER BY SUM(T2.Consumption) DESC LIMIT 1	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT T2.YearMonth FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312' ORDER BY T2.Consumption DESC LIMIT 1	debit_card_specializing
SELECT      c.Segment,      AVG(y.Consumption) AS AvgConsumption FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      y.Date BETWEEN '201301' AND '201312' GROUP BY      c.Segment;	debit_card_specializing
SELECT c.Segment,         ((SUM(CASE WHEN ym.Date LIKE '2013%' THEN ym.Consumption ELSE 0 END) -           SUM(CASE WHEN ym.Date LIKE '2012%' THEN ym.Consumption ELSE 0 END)) /         SUM(CASE WHEN ym.Date LIKE '2013%' THEN ym.Consumption ELSE 0 END)) * 100 AS PercentageIncrease FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date LIKE '2012%' OR ym.Date LIKE '2013%' GROUP BY c.Segment ORDER BY PercentageIncrease DESC;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311';	debit_card_specializing
SELECT      (COUNT(CASE WHEN Country = 'CZE' THEN Segment END) -       COUNT(CASE WHEN Country = 'SVK' THEN Segment END)) AS difference FROM      gasstations;	debit_card_specializing
SELECT SUM(CASE WHEN CustomerID = 7 THEN Consumption ELSE 0 END) - SUM(CASE WHEN CustomerID = 5 THEN Consumption ELSE 0 END) AS Difference FROM yearmonth WHERE Date = '201304'	debit_card_specializing
SELECT SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS difference FROM customers WHERE Segment = 'SME';	debit_card_specializing
SELECT T1.CustomerID, T1.Segment, T1.Currency, MAX(T2.Consumption) AS MaxConsumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310'	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201305';	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'	debit_card_specializing
SELECT Country, COUNT(*) AS ValueForMoneyCount FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM customers WHERE Segment = 'KAM'	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN Consumption > 528.3 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date = '201202'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'Slovakia';	debit_card_specializing
SELECT CustomerID, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT T2.Segment, SUM(T1.Consumption) AS TotalConsumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201309' GROUP BY T2.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT T1.CustomerID, T2.Consumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201206' AND T1.Segment = 'SME' ORDER BY T2.Consumption ASC LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%';	debit_card_specializing
SELECT c.CustomerID, MAX((SUM(y.Consumption) / 12)) AS MaxMonthlyConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' GROUP BY c.CustomerID ORDER BY MaxMonthlyConsumption DESC;	debit_card_specializing
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID WHERE strftime('%Y%m', T2.Date) = '201309'	debit_card_specializing
SELECT DISTINCT T1.Country  FROM gasstations AS T1  JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T2.Date LIKE '%201306%'	debit_card_specializing
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR'	debit_card_specializing
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T1.CustomerID IN ( SELECT CustomerID FROM customers WHERE Currency = 'EUR' )	debit_card_specializing
SELECT AVG(Amount) AS AverageTotalPrice FROM transactions_1k WHERE Date LIKE '2012-01%';	debit_card_specializing
SELECT COUNT(*) FROM customers AS c JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT p.Description FROM products AS p JOIN transactions_1k AS t ON p.ProductID = t.ProductID JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE';	debit_card_specializing
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11)	debit_card_specializing
SELECT COUNT(TransactionID) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000;	debit_card_specializing
SELECT COUNT(TransactionID) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE') AND Date > '2012-01-01';	debit_card_specializing
SELECT AVG(T1.Price) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY SUM(Price) DESC LIMIT 1	debit_card_specializing
SELECT g.Country, t.GasStationID FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.Time ASC LIMIT 1;	debit_card_specializing
SELECT T2.Currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Time = '16:25:00'	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID IN (31543, 46707, 7654, 17373) AND T1.CustomerID IN (3, 5, 6, 7, 9)	debit_card_specializing
SELECT COUNT(TransactionID) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Currency = 'CZK';	debit_card_specializing
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID ORDER BY T1.Date ASC LIMIT 1	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00';	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT SUM(t1.Price) AS TotalSpent, SUM(t2.Consumption) AS TotalConsumption, t1.Date, t1.CustomerID FROM transactions_1k t1 JOIN yearmonth t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Date = '2012-08-24' AND t1.Price = 124.05 AND t2.Date LIKE '2012-01-%';	debit_card_specializing
SELECT COUNT(T1.TransactionID)  FROM transactions_1k AS T1  JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID  WHERE T1.Date = '2012-08-26'  AND T1.Time BETWEEN '08:00:00' AND '09:00:00'  AND T2.Country = 'CZE';	debit_card_specializing
SELECT T1.Currency FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '%201306%' AND SUM(T2.Consumption) = 214582.17	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 'No.667467'	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-24' AND t.Price = 548.4;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Date = '2012-08-25' AND T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID	debit_card_specializing
SELECT      ym1.Consumption AS consumption_2012,      ym2.Consumption AS consumption_2013,      ((ym1.Consumption - ym2.Consumption) / ym1.Consumption) AS consumption_decrease_rate FROM      yearmonth ym1 JOIN      yearmonth ym2 ON ym1.CustomerID = ym2.CustomerID WHERE      ym1.Date = '2012-08-24'     AND ym2.Date = '2013-08-24';	debit_card_specializing
SELECT GasStationID FROM transactions_1k GROUP BY GasStationID ORDER BY SUM(Price) DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Segment) FROM gasstations AS T1 INNER JOIN yearmonth AS T2 ON T1.GasStationID = T2.CustomerID WHERE T1.Country = 'SVK'	debit_card_specializing
SELECT GasStationID, SUM(Price) AS TotalSpent FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '%201201%' GROUP BY GasStationID;	debit_card_specializing
SELECT p.Description, SUM(t.Amount) AS TotalAmount FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY t.ProductID ORDER BY TotalAmount DESC LIMIT 5;	debit_card_specializing
SELECT c.CustomerID, c.Currency, SUM(t.Amount) AS TotalSpent, AVG(t.Price) AS AvgPricePerItem FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ProductID = 2 ORDER BY T2.Price DESC LIMIT 1	debit_card_specializing
SELECT t.CustomerID, t.ProductID, y.Consumption FROM transactions_1k t JOIN yearmonth y ON t.CustomerID = y.CustomerID AND y.Date LIKE '201208%' WHERE t.ProductID = 5 AND t.Price / t.Amount > 29.00;	debit_card_specializing
