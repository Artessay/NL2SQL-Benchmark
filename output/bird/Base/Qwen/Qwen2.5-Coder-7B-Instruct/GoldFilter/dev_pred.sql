SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda'; 
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS FreeRate FROM frpm WHERE `Educational Option Type` = 'Continuation' ORDER BY FreeRate ASC LIMIT 3
SELECT s.Zip FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`District Name` = 'Fresno County Office of Education'; 
SELECT T2.MailStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1
SELECT s.Phone FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.OpenDate > '2000-01-01'; 
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F'; 
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 500 AND T1.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT s.NumTstTakr FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm); 
SELECT COUNT(*) FROM frpm WHERE CDSCode IN ( SELECT cds FROM satscores WHERE AvgScrMath > 560 ) AND CharterFundingType = 'Directly funded'
SELECT f.`FRPM Count (Ages 5-17)` FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE s.AvgScrRead IS NOT NULL ORDER BY s.AvgScrRead DESC LIMIT 1; 
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500
SELECT MAX(T1.`Free Meal Count (Ages 5-17)`) / MAX(T1.`Enrollment (Ages 5-17)`) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 / T2.NumTstTakr > 0.3
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr IS NOT NULL ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3
SELECT T2.NCESSchool FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T2.District FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' ORDER BY T1.AvgScrRead DESC LIMIT 1
SELECT COUNT(*) FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100;
SELECT T2.CDSCode, AVG(T1.AvgScrWrite) AS Avg_Write_Score FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite > 499 AND T2.CharterNum IS NOT NULL GROUP BY T2.CDSCode ORDER BY Avg_Write_Score DESC;
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND T2.NumTstTakr <= 250 AND T1.CharterFundingType = 'Directly funded'; 
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Amador' AND T1.LowGrade = '9' AND T1.HighGrade = '12';
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700;
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1; 
SELECT T2.School, T2.StreetAbr FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) > 30
SELECT s.`School Name` FROM frpm f JOIN schools sch ON f.CDSCode = sch.CDSCode JOIN satscores sat ON f.CDSCode = sat.cds WHERE (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) > 0.1 AND (sat.NumGE1500 IS NOT NULL AND sat.NumGE1500 >= 1); 
SELECT s.sname, f.`Charter Funding Type` FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE s.AvgScrMath > 400 AND f.`District Name` = 'Riverside'; 
SELECT T1.`School Name`, T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.City = 'Monterey' AND T2.`Free Meal Count (Ages 5-17)` > 800 AND T1.County = 'Monterey'
SELECT s.School, AVG(ss.AvgScrWrite), s.Phone FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01' GROUP BY s.School, s.Phone; 
SELECT s.School, s.DOC, AVG(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) AS avg_diff FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.FundingType = 'Directly funded' GROUP BY s.School, s.DOC HAVING ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (SELECT AVG(avg_diff) FROM (...) AS subquery) ORDER BY ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`); 
SELECT T2.OpenDate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 1
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT "Free Meal Count (K-12)" / "Enrollment (K-12)" AS "Eligible Free Rate" FROM ( 	SELECT * 	FROM frpm 	ORDER BY "Enrollment (K-12)" DESC 	LIMIT 2 OFFSET 8 ) 
SELECT `FRPM Count (K-12)`, `Enrollment (K-12)`, (`FRPM Count (K-12)` / `Enrollment (K-12)`) AS Rate FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.SOC = '66' ORDER BY `FRPM Count (K-12)` DESC LIMIT 5
SELECT T2.Website, T1.`School Name` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT T2.`Free Meal Count (Ages 5-17)`, T2.`Enrollment (Ages 5-17)`, (T2.`Free Meal Count (Ages 5-17)` / T2.`Enrollment (Ages 5-17)`) AS FreeRate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson'
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores )
SELECT T1.Street, T1.City, T1.Zip, T1.State FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr ASC LIMIT 1
SELECT T2.Website FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.NumTstTakr BETWEEN 2000 AND 3000
SELECT AVG(s.NumTstTakr) AS AverageTestTakers FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.County = 'Fresno' AND STRFTIME('%Y', sch.OpenDate) = '1980'; 
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1; 
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F' AND T2.AvgScrRead IS NOT NULL ORDER BY T2.AvgScrRead DESC, T1.County LIMIT 5
SELECT T2.EdOpsName FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT AVG(AvgScrMath) AS avg_math_score, T2.County FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead IS NOT NULL AND T1.AvgScrMath IS NOT NULL AND T1.AvgScrWrite IS NOT NULL ORDER BY (T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite) ASC LIMIT 1
SELECT AVG(s.AvgScrWrite), sc.City FROM satscores AS s JOIN schools AS sc ON s.cds = sc.CDSCode WHERE s.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores ) GROUP BY sc.City; 
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School; 
SELECT T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.DOC = 31 ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT COUNT(*) / 12 AS "Monthly Average" FROM schools WHERE County = 'Alameda' AND OpenDate LIKE '1980%' AND DOC = 52; 
SELECT CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) FROM schools WHERE County = 'Orange'
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' GROUP BY County, School, ClosedDate ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T1.Street, T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 6, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead IS NOT NULL ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500 AND schools.MailCity = 'Lakeport'; 
SELECT SUM(NumTstTakr) AS TotalTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE MailCity = 'Fresno'; 
SELECT `School`, `MailZip` FROM `schools` WHERE `AdmFName1` = 'Avetik' AND `AdmLName1` = 'Atoian';
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS ratio FROM schools WHERE MailState = 'CA'; 
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active'; 
SELECT s.Phone, s.Ext  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  ORDER BY ss.AvgScrWrite DESC  LIMIT 1 OFFSET 332; 
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'; 
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez'; 
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Charter = 1 AND Virtual = 'P'; 
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = 52; 
SELECT COUNT(*) FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND (frpm.`Free Meal Count (K-12)` * 100 / frpm.`Enrollment (K-12)`) < 0.18
SELECT T1.School, T1.City, T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 INNER JOIN schools AS T2 ON T1.CharterNum = T2.CharterNum WHERE T1.Charter = 1 AND T2.CharterNum = '00D2'
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'; 
SELECT      ROUND(((SUM(CASE WHEN FundingType = 'Locally funded' THEN 1 ELSE 0 END) / COUNT(*)) * 100), 2) AS Percentage FROM      schools WHERE      County = 'Santa Clara'; 
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus'; 
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate LIKE '1989%'; 
SELECT County FROM schools WHERE strftime('%Y', ClosedDate) BETWEEN '1980' AND '1989' AND SOC = '11' GROUP BY County ORDER BY COUNT(School) DESC LIMIT 1; 
SELECT NCESDist FROM schools WHERE SOC = '31'; 
SELECT StatusType, COUNT(School) AS NumberOfSchools FROM schools WHERE County = 'Alpine' GROUP BY StatusType; 
SELECT District FROM frpm WHERE CDSCode NOT IN ( SELECT CDSCode FROM schools WHERE Magnet = 0 AND City = 'Fresno' )
SELECT SUM(`Enrollment (Ages 5-17)`) AS Total_Enrollment FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.EdOpsCode = 'SSS' AND schools.City = 'Fremont' AND frpm.`Academic Year` = '2014-2015'; 
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailStreet = 'PO Box 1040' AND T2.SOCType LIKE '%Youth Authority%'
SELECT MIN(LowGrade) FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE NCESDist = '0613360' AND EdOpsCode = 'SPECON')
SELECT s.EILName, s.School FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`NSLP Provision Status` = '01' AND f.`County Code` = 'Breakfast Provision 2'; 
SELECT s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`NSLP Provision Status` = 'Lunch Provision 2' AND f.LowGrade = '9' AND f.HighGrade = '12' AND s.County = 'Merced' AND s.EILCode = 'HS'; 
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)` * 100) AS "Percent (%) Eligible FRPM" FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved LIKE '%K%' AND s.GSserved LIKE '%9%'; 
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1; 
SELECT T1.`School Type`, T1.`School Name`, T2.Latitude FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.Latitude DESC LIMIT 1
SELECT T1.City, T1.State, T2.LowestGrade, T2.SchoolName FROM schools AS T1 INNER JOIN ( SELECT MIN(Latitude) AS MinLat, CDSCode, LowGrade, `School Name` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE State = 'CA' GROUP BY CDSCode ) AS T2 ON T1.CDSCode = T2.CDSCode AND T1.Latitude = T2.MinLat
SELECT GSoffered FROM schools WHERE ABS(longitude) = ( SELECT MAX(ABS(longitude)) FROM schools )
SELECT City, COUNT(*) AS NumberOfSchools FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.Magnet = 1 AND schools.GSoffered = 'K-8' AND frpm.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY City; 
SELECT AdmFName1, District FROM schools GROUP BY AdmFName1 ORDER BY COUNT(*) DESC LIMIT 2
SELECT T2.`Free Meal Count (K-12)` / T2.`Enrollment (K-12)` * 100 AS "Percent (%) Eligible Free (K-12)", T1.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Alusine'
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = '40'; 
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)
SELECT T1.AdmEmail1, T2.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 IS NOT NULL ORDER BY T2.NumGE1500 DESC LIMIT 1
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.A3 LIKE '%East Bohemia%'
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T1.account_id = T3.account_id WHERE T2.A3 = 'Prague'
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district
SELECT COUNT(district_id) FROM district WHERE A11 BETWEEN 6000 AND 10000; 
SELECT COUNT(client_id) FROM client  JOIN district ON client.district_id = district.district_id  WHERE gender = 'M' AND A3 LIKE '%North Bohemia%' AND A11 > 8000; 
SELECT MIN(A11) - MAX(A11) AS gap FROM ( 	SELECT AVG(salary) AS A11 	FROM client c 	JOIN district d ON c.district_id = d.district_id 	WHERE c.gender = 'F' 	GROUP BY c.account_id 	ORDER BY MIN(c.birth_date) 	LIMIT 1 ); 
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client ) ORDER BY (     SELECT AVG(A11)     FROM district ) DESC LIMIT 1; 
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT T1.client_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'DISPONENT' AND T2.frequency = 'POPLATEK PO OBRATU'
SELECT account_id, frequency FROM account WHERE account_id IN (     SELECT account_id     FROM loan     WHERE STRFTIME('%Y', date) = '1997' ) ORDER BY (     SELECT MIN(amount)     FROM loan     WHERE account_id = account.account_id AND STRFTIME('%Y', date) = '1997' ), frequency = 'POPLATEK TYDNE'; 
SELECT a.account_id, MAX(l.amount) AS max_amount FROM account a JOIN disp d ON a.account_id = d.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND strftime('%Y', a.open_date) = '1993' GROUP BY a.account_id ORDER BY max_amount DESC LIMIT 1; 
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.A2 = 'Sokolov'
SELECT account_id FROM trans WHERE STRFTIME('%Y', date) = '1995' ORDER BY date ASC LIMIT 1;
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T2.amount > 3000
SELECT T2.client_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued = '1994-03-03'
SELECT T2.date FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.`date` = '1998-10-14'; 
SELECT T1.district_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'
SELECT MAX(amount) FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE date = '1996-10-21')
SELECT T1.gender FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id ORDER BY T1.birth_date ASC LIMIT 1
SELECT t.amount  FROM trans t  JOIN (     SELECT l.account_id, MIN(l.date) AS min_loan_date      FROM loan l      GROUP BY l.account_id ) sub ON t.account_id = sub.account_id AND t.date > sub.min_loan_date  ORDER BY t.amount ASC  LIMIT 1; 
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik'); 
SELECT T1.disp_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND T3.date LIKE '1998-09-02%'
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Litomerice' AND STRFTIME('%Y', T1.date) = '1996'; 
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'; 
SELECT T2.birth_date FROM loan AS T1 INNER JOIN client AS T2 ON T1.account_id = T2.district_id WHERE T1.amount = 98832 AND T1.date LIKE '1996-01-03%'
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%south Bohemia%'
SELECT ((T1.balance - T2.balance) / T2.balance) * 100 FROM trans AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1998-12-27' AND T2.date = '1993-03-22' AND T1.account_id IN ( SELECT account_id FROM loan WHERE date = '1993-07-05' )
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan; 
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000; 
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE strftime('%Y', a.date) = '1993' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT a.account_id, a.frequency  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.date BETWEEN '1995-01-01' AND '2000-12-31'  AND d.A3 LIKE '%east Bohemia%'; 
SELECT T1.account_id ,  T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T2.A2 AS district, T2.A3 AS region FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990; 
SELECT T1.account_id, T3.A2 AS district, T3.A3 AS region FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000; 
SELECT l.loan_id, d.A3, AVG(d.A11) AS avg_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60 GROUP BY l.loan_id, d.A3; 
SELECT T1.A13 - T1.A12 AS "Unemployment Increment Rate", T2.district_id FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'D'
SELECT CAST(SUM(CASE WHEN T2.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.date) = '1993'; 
SELECT account_id FROM account; 
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.A2 ORDER BY COUNT(T2.client_id) DESC LIMIT 9
SELECT T2.A2, COUNT(T1.account_id) AS withdrawal_count FROM trans AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%' GROUP BY T2.A2 ORDER BY withdrawal_count DESC LIMIT 10
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN district dis ON c.district_id = dis.district_id WHERE dis.A3 = 'South Bohemia' AND d.type != 'OWNER';
SELECT T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status IN ('C', 'D') GROUP BY T2.A3 ORDER BY SUM(T1.amount) DESC LIMIT 1
SELECT AVG(amount) FROM loan WHERE account_id IN (SELECT account_id FROM client WHERE gender = 'M')
SELECT A2 FROM district ORDER BY A13 DESC LIMIT 1
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1)
SELECT COUNT(DISTINCT t.account_id) AS negative_balance_accounts FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE'; 
SELECT COUNT(*) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK MESICNE' AND T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T1.amount >= 250000
SELECT COUNT(account_id) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM account WHERE district_id = 1);
SELECT COUNT(*) FROM client WHERE district_id IN (     SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1 ) AND gender = 'M'; 
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek') 
SELECT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000 AND t.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY d.district_id; 
SELECT T1.account_id FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T1.district_id IN ( SELECT district_id FROM district WHERE A2 = 'Pisek' )
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'
SELECT AVG(amount) AS average_credit_card_amount FROM trans WHERE operation = 'VYBER KARTOU' AND date BETWEEN '2021-01-01' AND '2021-12-31'; 
SELECT T1.account_id FROM trans AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'VYBER KARTOU' AND STRFTIME('%Y', T1.date) = '1998' GROUP BY T1.account_id HAVING AVG(T1.amount) < ( SELECT AVG(amount) FROM trans WHERE type = 'VYBER KARTOU' AND STRFTIME('%Y', date) = '1998' )
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id INNER JOIN loan AS T4 ON T2.account_id = T4.account_id WHERE T1.gender = 'F'
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%South Bohemia%'
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A2 = 'Tabor' AND T2.type = 'OWNER'
SELECT T2.type ,  AVG(T3.A11) FROM disp AS T2 INNER JOIN account AS T1 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T3.district_id = T1.district_id WHERE T2.type != 'OWNER' AND T3.A11 BETWEEN 8000 AND 9000 GROUP BY T2.type
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T2.A3 = 'North Bohemia' AND T3.bank = 'AB'
SELECT T2.A2 FROM trans AS T1 INNER JOIN account AS T3 ON T1.account_id = T3.account_id INNER JOIN district AS T2 ON T3.district_id = T2.district_id WHERE T1.type = 'VYDAJ' GROUP BY T2.A2
SELECT AVG(T2.A15) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date LIKE '1995%' AND T2.A15 > 4000 AND T1.date >= '1997-01-01'
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'
SELECT COUNT(*) FROM client AS c JOIN district AS d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha'; 
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card
SELECT T2.name FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN loan AS T3 ON T1.account_id = T3.account_id ORDER BY T3.amount DESC LIMIT 1
SELECT T2.A15 FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532; 
SELECT T1.district_id FROM account AS T1 INNER JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333
SELECT t.trans_id, t.operation, t.account FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.client_id = 3356 AND t.operation = 'VYBER'; 
SELECT COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000; 
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 13539
SELECT T2.A3 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'A' GROUP BY T2.district_id ORDER BY COUNT(T2.account_id) DESC LIMIT 1
SELECT account_id FROM order WHERE order_id = 32423;
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5)
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik') 
SELECT DISTINCT client_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card WHERE type = 'junior' AND issued >= '1997-01-01') 
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A11 > 10000
SELECT ((SUM(CASE WHEN T2.date LIKE '1997%' THEN T1.amount ELSE 0 END) - SUM(CASE WHEN T2.date LIKE '1996%' THEN T1.amount ELSE 0 END)) / SUM(CASE WHEN T2.date LIKE '1996%' THEN T1.amount ELSE 0 END)) * 100 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T4.gender = 'M'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'; 
SELECT SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) AS crime_difference FROM district; 
SELECT type, COUNT(*) AS count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type; 
SELECT COUNT(*) AS frequency FROM account WHERE account_id = '3'; SELECT SUM(amount) AS total_amount FROM order WHERE account_id = '3' AND amount = 3539; 
SELECT STRFTIME('%Y', T1.birth_date) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id = 130
SELECT COUNT(DISTINCT a.account_id) AS account_count FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT SUM(amount) AS total_debt, status FROM loan WHERE account_id IN (SELECT account_id FROM client WHERE client_id = 992) GROUP BY status;
SELECT SUM(t.balance), c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE t.trans_id = 851 AND c.client_id = 4; 
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 9
SELECT SUM(amount) AS total_payment FROM trans WHERE account IN (SELECT account_id FROM account WHERE district_id = (SELECT district_id FROM client WHERE client_id = 617)) AND date LIKE '1998%'; 
SELECT T1.client_id FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T3.A3 = 'East Bohemia'
SELECT T2.client_id FROM loan AS T1 INNER JOIN client AS T2 ON T1.account_id = T2.account_id WHERE T2.gender = 'F' ORDER BY T1.amount DESC LIMIT 3
SELECT COUNT(*) FROM client AS c JOIN account AS a ON c.district_id = a.district_id JOIN trans AS t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.amount > 4000; 
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Beroun' AND T1.date > '1996-12-31'
SELECT COUNT(*) FROM client AS c JOIN disp AS d ON c.client_id = d.client_id JOIN card AS ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior'; 
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague'
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.frequency = 'POPLATEK TYDNE'; 
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T2.birth_date) DESC LIMIT 1
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.birth_date) = '1920' AND T2.A3 = 'east Bohemia'
SELECT COUNT(*) FROM account AS A JOIN loan AS L ON A.account_id = L.account_id WHERE A.frequency = 'POPLATEK TYDNE' AND L.duration = 24; 
SELECT AVG(payments) AS average_loan_amount FROM loan WHERE status = 'C'; 
SELECT d.account_id, ds.A2 FROM account d JOIN disp dp ON d.account_id = dp.account_id JOIN district ds ON d.district_id = ds.district_id WHERE dp.type = 'OWNER'; 
SELECT T1.client_id ,  julianday('now') - julianday(T1.birth_date) AS age FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold' AND T2.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.element = 'cl'
SELECT AVG(CASE WHEN T2.element = 'o' THEN 1 ELSE 0 END) FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT AVG(CASE WHEN T3.bond_type = '-' THEN 1 ELSE 0 END) AS avg_single_bonded_carcinogens FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id AND T3.bond_type = '-'; WHERE T1.label = '+'; 
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'na'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_type) >= 3
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '=' 
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'; 
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'; 
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' GROUP BY T1.molecule_id HAVING COUNT(DISTINCT T2.atom_id) > 0
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'; 
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '='
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'cl'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.atom_id IN ( SELECT atom_id FROM connected )
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')
SELECT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element = 'sn' )
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'i' OR T1.element = 's') AND T3.bond_type = '-'
SELECT T1.atom_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id IN ( SELECT atom_id FROM atom WHERE molecule_id = 'TR181' ) OR T2.atom_id2 IN ( SELECT atom_id FROM atom WHERE molecule_id = 'TR181' )
SELECT CAST(SUM(CASE WHEN T1.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' 
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percent FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'; 
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY element ASC LIMIT 3
SELECT DISTINCT T2.atom_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_6'; 
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'; 
SELECT molecule_id FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id ORDER BY molecule_id LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule
SELECT CAST(COUNT(CASE WHEN element = 'h' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM atom WHERE molecule_id = 'TR206'
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT T1.element, T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'; 
SELECT T1.bond_type, T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR010' GROUP BY T1.bond_type ORDER BY COUNT(T1.bond_type) DESC LIMIT 1
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' ORDER BY T1.molecule_id LIMIT 3
SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR006') ORDER BY bond_id ASC LIMIT 2; 
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009'); 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'
SELECT T1.bond_type, T2.atom_id, T2.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'; 
SELECT T2.label, CASE WHEN T2.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'
SELECT COUNT(DISTINCT molecule_id) AS num_molecules_with_triple_bond FROM bond WHERE bond_type = '#'; 
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19'
SELECT element FROM atom WHERE molecule_id = 'TR004'; 
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T2.atom_id, 7, 2) BETWEEN '21' AND '25' AND T1.label = '+'
SELECT bond_id FROM connected WHERE atom_id IN ( SELECT atom_id FROM atom WHERE element = 'p' ) AND atom_id IN ( SELECT atom_id FROM atom WHERE element = 'n' )
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_type) DESC LIMIT 1
SELECT AVG(COUNT(T2.bond_id)) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'
SELECT T2.bond_type, T1.bond_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T1.atom_id, 7, 2) AS INT) = 45
SELECT element FROM atom WHERE atom_id NOT IN ( SELECT atom_id FROM connected )
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_type) DESC LIMIT 1
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1
SELECT T2.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT CAST(COUNT(DISTINCT bond_id) AS REAL) * 100 / ( SELECT MAX(COUNT(atom_id)) FROM connected GROUP BY atom_id ) FROM connected
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')
SELECT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'sn'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '-'; 
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '#' GROUP BY molecule_id HAVING COUNT(molecule_id) >= 3 ) AND element IN ('p', 'br')
SELECT bond_id FROM bond WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' )
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '-'
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'; 
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM atom WHERE element = 'i'; 
SELECT MAX(T1.label) AS majority_carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca'; 
SELECT CASE WHEN EXISTS (SELECT 1 FROM atom WHERE element = 'cl' AND atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8')) THEN 1 ELSE 0 END AS has_chlorine, CASE WHEN EXISTS (SELECT 1 FROM atom WHERE element = 'c' AND atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8')) THEN 1 ELSE 0 END AS has_carbon;
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element = 'c' AND T3.bond_type = '#' AND T1.label = '-' LIMIT 2
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001'
SELECT molecule_id FROM bond WHERE bond_type = '='; 
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-'
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT T1.bond_id ,  CASE WHEN T2.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS Carcinogenicity FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id LIKE '%4' AND T2.label = '+' GROUP BY T1.element
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element) AS ratio, T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'
SELECT CASE WHEN EXISTS (     SELECT 1 FROM atom WHERE molecule_id IN (         SELECT molecule_id FROM molecule WHERE label = '+'     ) AND element = 'ca' ) THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS result; 
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'c'
SELECT DISTINCT t1.element FROM atom AS t1 INNER JOIN connected AS t2 ON t1.atom_id = t2.atom_id WHERE t2.bond_id = 'TR001_10_11'; 
SELECT CAST(SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM bond
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM bond WHERE molecule_id = 'TR047'; 
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS Carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1'
SELECT CASE WHEN EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR151' AND label = '+') THEN 'Yes' ELSE 'No' END AS is_carcinogenic;
SELECT CASE WHEN COUNT(*) > 0 THEN 'Cl' ELSE 'No Toxic Element Found' END AS toxic_element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'na', 'pb')
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT bond_id FROM bond WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) AND bond_type = ' = ';
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' AND T2.label = '+'; 
SELECT T2.molecule_id FROM connected AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'
SELECT atom_id FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'c'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id; 
SELECT CASE WHEN EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR124' AND label = '+') THEN 'Yes' ELSE 'No' END AS is_carcinogenic; 
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'; 
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'; 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'
SELECT COUNT(*) AS double_bond_count, (SELECT label FROM molecule WHERE molecule_id = 'TR006') AS is_carcinogenic FROM bond WHERE molecule_id = 'TR006' AND bond_type = '= ';
SELECT m.label, GROUP_CONCAT(DISTINCT a.element) AS elements FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.label; 
SELECT b.bond_id, b.bond_type, c.atom_id, c.atom_id2 FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.bond_type = '-'
SELECT T1.molecule_id, GROUP_CONCAT(DISTINCT T2.element) AS elements FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.bond_type = '#' AND T2.element IN ('cl', 'c', 'h')
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'; 
SELECT COUNT(*) FROM atom WHERE element = 'cl'; 
SELECT a.atom_id, COUNT(b.bond_type) AS bond_count FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id; 
SELECT COUNT(*) AS total_double_bond_molecules, SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_double_bond_molecules FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '='; 
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element = 's' ) AND molecule_id NOT IN ( SELECT molecule_id FROM bond WHERE bond_type = '=' )
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4' AND T2.label = '+'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-';
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'; 
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label != '-'; 
SELECT CAST(SUM(CASE WHEN T2.label = '+' AND T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id 
SELECT T1.molecule_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_1_7'
SELECT COUNT(*) FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_3_4') 
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2') OR (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_1')
SELECT m.molecule_id FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id JOIN connected AS c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_4'; 
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule WHERE molecule_id = 'TR000';
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element = 's' AND T3.bond_type = ' = '
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T2.label HAVING COUNT(T1.atom_id) > 5
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR024' AND b.bond_type = '='; 
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.label ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.element = 'h' AND T2.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT COUNT(*) FROM bond WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-'; 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'; 
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(DISTINCT molecule_id) AS total_molecules_with_double_bonded_oxygen FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'o' AND bond.bond_type = '='; 
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label != '-'; 
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.element = 'c' AND T3.bond_type = ' = ' AND T2.molecule_id = 'TR012'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT id FROM cards WHERE borderColor != 'black' AND cardKingdomId IS NULL
SELECT name FROM cards WHERE faceConvertedManaCost = ( SELECT MAX(faceConvertedManaCost) FROM cards )
SELECT * FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned'
SELECT T1.status FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.types = 'Artifact' AND T2.side IS NULL AND T1.format = 'vintage'; 
SELECT c.id, c.artist  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'; 
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel';
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT c.name, c.artist, c.isPromo, COUNT(r.uuid) AS ruling_count FROM cards c JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid ORDER BY ruling_count DESC LIMIT 1; 
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid; 
SELECT T1.name, T1.totalSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian'
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE power = '*'; 
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT originalType FROM cards WHERE name = 'Creature - Human Cleric';
SELECT T2.language FROM cards AS T1 INNER JOIN sets_cards AS T3 ON T1.id = T3.card_id INNER JOIN sets AS T4 ON T3.set_id = T4.id INNER JOIN set_translations AS T2 ON T4.translation_id = T2.id WHERE T1.name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.status = 'Restricted' AND c.isTextless = 0;
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.isStarter = 1 AND l.status = 'Restricted'; 
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'; 
SELECT type FROM cards WHERE name = 'Benalish Knight'; 
SELECT T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight'
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'; 
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards
SELECT COUNT(*) FROM cards WHERE id IN (SELECT uuid FROM foreign_data WHERE language = 'German') AND isReprint = 1; 
SELECT COUNT(*) FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian';
SELECT CAST(SUM(CASE WHEN T1.language = 'French' AND T2.isStorySpotlight = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.isStorySpotlight = 1; 
SELECT COUNT(*) FROM cards WHERE toughness = '99'; 
SELECT name FROM cards WHERE artist = 'Aaron Boyd'; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%' AND NOT availability LIKE '%paper%';
SELECT id FROM cards WHERE convertedManaCost = 0; 
SELECT layout FROM cards WHERE keywords = 'Flying'; 
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'; 
SELECT c.artist FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified'; 
SELECT c.name FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese'
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.borderColor = 'white' AND l.status = 'Banned'
SELECT c.uuid, f.language FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data f ON c.uuid = f.uuid WHERE l.format = 'legacy'; 
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Beacon of Immortality'; 
SELECT COUNT(cards.id) AS card_count, legalities.uuid, legalities.status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = 'future' AND legalities.status = 'legal' GROUP BY legalities.uuid; 
SELECT T1.id, T1.colors FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.setCode = 'OGW'
SELECT c.id, c.convertedManaCost, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.convertedManaCost = 5 AND c.setCode = '10E'
SELECT T1.originalType, T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT c.colors, l.format FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20; 
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.colors = 'B' AND T1.originalType = 'Artifact'
SELECT c.name  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3; 
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE artist LIKE '%UDON%' AND type LIKE '%mtgo%' AND hand = -1; 
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1; 
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'; 
SELECT SUM(convertedManaCost) FROM cards WHERE artist = 'Rob Alexander'
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena' AND (subtypes IS NOT NULL OR supertypes IS NOT NULL)
SELECT setCode FROM set_translations WHERE language = 'Spanish'; 
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStoryspotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards
SELECT name ,  CAST(COUNT(CASE WHEN language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM foreign_data GROUP BY name
SELECT language FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE baseSetSize = 309); 
SELECT COUNT(DISTINCT T1.setCode) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Commander' AND T2.language = 'Portuguese (Brazil)'; 
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Creature' AND T2.status = 'Legal'
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards WHERE uuid IN ( SELECT uuid FROM legalities WHERE format = 'premodern' ) AND uuid NOT IN ( SELECT uuid FROM cards WHERE side IS NOT NULL ) AND uuid IN ( SELECT uuid FROM rulings WHERE text = 'This is a triggered mana ability.' )
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability LIKE '%paper%'; 
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.flavorText LIKE '%das perfekte Gegenmittel zu einer dichten Formation%'
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T1.type = 'Creature' AND T1.layout = 'normal' AND T1.borderColor = 'black' AND T2.language = 'French'; 
SELECT COUNT(*) FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'; 
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 180 AND T2.block = 'Ravnica'; 
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'legal'
SELECT CAST(SUM(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French'
SELECT CAST(SUM(CASE WHEN T2.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.language) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.type = 'expansion'; 
SELECT availability FROM cards WHERE artist = 'Daren Bader'; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000; 
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1; 
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes = 'arenaleague' ORDER BY name LIMIT 3
SELECT language FROM foreign_data WHERE multiverseid = 149934;
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT id FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'; 
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.mcmName = 'Archenemy' AND T1.setCode = 'ARC'
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5; 
SELECT T1.language, T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.id = 206; 
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2; 
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese'
SELECT s.code, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Chinese Simplified'
SELECT COUNT(*) FROM sets WHERE code NOT IN ( SELECT setCode FROM set_translations WHERE language = 'Japanese' ) AND ( mtgoCode IS NULL OR mtgoCode = '' )
SELECT COUNT(id) FROM cards WHERE borderColor = 'black' UNION SELECT id FROM cards WHERE borderColor = 'black'
SELECT COUNT(id) FROM cards WHERE frameEffects = 'extendedart'; SELECT id FROM cards WHERE frameEffects = 'extendedart';
SELECT id FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT language FROM set_translations WHERE id = '174'; 
SELECT name FROM sets WHERE code = 'ALL'; 
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT T1.code FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.type = 'expansion'
SELECT T1.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Boros'
SELECT T1.language, T1.flavorText FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark IS NOT NULL AND T2.flavorText IS NOT NULL
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'
SELECT T1.code FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.type = 'expansion' AND T1.code = 'commander'
SELECT T1.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'
SELECT f.language, c.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Azorius'; 
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'; 
SELECT name FROM cards WHERE isTextless = 0
SELECT manaCost FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power IS NULL OR power = '*'); 
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'; 
SELECT JSON_EXTRACT(purchaseUrls, '$[*]') AS purchase_urls FROM cards WHERE promoTypes LIKE '%bundle%'; 
SELECT COUNT(*) FROM cards WHERE availability LIKE '%black%' AND availability LIKE '%arena,mtgo%'; 
SELECT MAX(convertedManaCost) FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper')
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'; 
SELECT COUNT(DISTINCT T2.setCode) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy'
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'; 
SELECT EXISTS (     SELECT 1     FROM `cards`     JOIN `set_translations` ON `cards`.`setCode` = `set_translations`.`setCode`     WHERE `cards`.`name` = 'Ancestor''s Chosen' AND `set_translations`.`language` = 'Korean' ); 
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'; 
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT EXISTS (     SELECT 1     FROM cards c     JOIN sets s ON c.setCode = s.code     WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL ); 
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(DISTINCT s.id)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL; 
SELECT T2.isForeignOnly FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100; 
SELECT COUNT(*) FROM cards WHERE setCode = ( SELECT code FROM sets WHERE name = 'Coldsnap' ) AND borderColor = 'black'
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE setCode = ( SELECT code FROM sets WHERE name = 'Coldsnap' ) AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT number FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' ) AND number = 4;
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power IS NULL OR T1.power = '*'); 
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'
SELECT T2.text FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian'; 
SELECT T1.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.setCode = T3.code WHERE T3.name = 'Coldsnap' AND T1.language = 'Italian' ORDER BY T2.convertedManaCost DESC LIMIT 1
SELECT T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' )
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'; 
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'; 
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'; 
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'; 
SELECT c.text, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'; 
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'; 
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Tendo Ice Bridge' AND T2.language = 'French'
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Tenth Edition' AND T2.translation IS NOT NULL
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese'
SELECT name FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Journey into Nyx Hero''s Path') ORDER BY convertedManaCost DESC LIMIT 1; 
SELECT T2.releaseDate FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Ola de frío'
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'; 
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified'; 
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'; 
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.language) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Portuguese (Brazil)'
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND (power IS NULL OR power = '*') AND hasFoil = 0; 
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT c.name, c.manaCost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10
SELECT T1.originalReleaseDate, GROUP_CONCAT(DISTINCT T2.format) AS legalFormats FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' ORDER BY T1.originalReleaseDate ASC LIMIT 1
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Abundance' AND c.types = 'Enchantment' AND c.rarity = 'rare' AND l.status = 'Legal'; 
SELECT T2.format, T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' GROUP BY T2.format ORDER BY COUNT(T2.status) DESC LIMIT 1
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.id = T2.id WHERE T1.name = 'Battlebond'
SELECT T1.artist, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid GROUP BY T1.artist ORDER BY COUNT(T1.id) ASC LIMIT 1
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'D. Alexander Gregory' AND T1.frameVersion = '1997' AND T1.hasContentWarning = 1 AND T2.format = 'legacy'
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'; 
SELECT AVG(T1.id) AS avg_sets, T2.language AS common_language FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.id WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1; 
SELECT artist FROM cards WHERE availability LIKE '%arena%' AND NOT availability LIKE '%paper%'; 
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'banned' OR status = 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability LIKE '%paper%'; 
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC
SELECT c.name, l.format FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.code NOT IN (     SELECT st.setCode     FROM set_translations st     WHERE st.language LIKE '%Japanese%' ) AND EXISTS (     SELECT 1     FROM set_translations st     WHERE st.setCode = s.code AND st.language = 'Korean' ); 
SELECT T1.frameVersion, T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned'
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')) 
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Id IN ( SELECT UserId FROM posts WHERE Upvotes > 100 AND Downvotes > 1 )
SELECT COUNT(*) FROM users WHERE YEAR(CreationDate) > 2013 AND Views > 10; 
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'; 
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'; 
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') ORDER BY ViewCount DESC LIMIT 1
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount = ( SELECT MAX(FavoriteCount) FROM posts )
SELECT SUM(T2.CommentCount) AS TotalComments FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'; 
SELECT AnswerCount FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') ORDER BY AnswerCount DESC LIMIT 1
SELECT users.DisplayName FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE posts.Title = 'Examples for teaching: Correlation does not mean causation'; 
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL; 
SELECT DisplayName FROM users WHERE Id IN (SELECT OwnerUserId FROM posts WHERE ClosedDate IS NOT NULL)
SELECT COUNT(*) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age > 65 AND T1.Score >= 20
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'; 
SELECT p.Body FROM posts AS p JOIN tags AS t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId ORDER BY T2.Count DESC LIMIT 1
SELECT COUNT(b.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'
SELECT COUNT(b.Id) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND STRFTIME('%Y', b.Date) = '2011'; 
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT AVG(posts.Score) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'; 
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(DISTINCT T2.DisplayName) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'; 
SELECT p.Title FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments); 
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910)
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0'; 
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ParentId = 107829 AND T1.CommentCount = 1 LIMIT 1
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'; 
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041; 
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini'; 
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM votes WHERE Id = 6347); 
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id INNER JOIN votes ON users.Id = votes.UserId WHERE users.Id = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';
SELECT Text FROM comments WHERE Score = 17; 
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'; 
SELECT T1.DisplayName FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%thank you user93%'
SELECT T1.Text FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'A Lion'
SELECT T2.DisplayName, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Understanding what Dassault iSight is doing?'
SELECT c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10; 
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data?'
SELECT Title FROM posts WHERE OwnerUserId IN ( SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa' )
SELECT SUM(posts.Score), users.WebsiteUrl FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Yevgeny'; 
SELECT Comment FROM postHistory WHERE PostId IN (SELECT Id FROM posts WHERE Title = 'Why square the difference instead of taking the absolute value in standard deviation?') 
SELECT SUM(T2.BountyAmount) AS TotalBountyAmount FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%' 
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T1.PostId = T3.Id WHERE T1.BountyAmount = 50 AND T3.Title LIKE '%variance%'
SELECT AVG(posts.ViewCount) AS AverageViewCount, posts.Title, postHistory.Text FROM posts JOIN postHistory ON posts.Id = postHistory.PostId JOIN tags ON posts.Tags LIKE '%<humor>%' GROUP BY posts.Id; 
SELECT COUNT(*) FROM comments WHERE UserId = 13; 
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT Id FROM users ORDER BY Views ASC LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'; 
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5
SELECT COUNT(DISTINCT b.UserId) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York, NY'
SELECT u.Id, u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.UserId WHERE p.Id = 1
SELECT u.Id FROM users u JOIN posts p ON u.Id IN ( SELECT ph.UserId FROM postHistory ph GROUP BY ph.PostId HAVING COUNT(DISTINCT ph.PostId) = 1 ) WHERE p.ViewCount >= 1000
SELECT u.Id, u.Name, b.Name AS BadgeName FROM users u JOIN (     SELECT UserId, COUNT(Id) AS CommentCount     FROM comments     GROUP BY UserId ) c ON u.Id = c.UserId JOIN badges b ON u.Id = b.UserId WHERE c.CommentCount = (     SELECT MAX(CommentCount)     FROM (         SELECT COUNT(Id) AS CommentCount         FROM comments         GROUP BY UserId     ) ); 
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'; 
SELECT      ((CAST(SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) -       (CAST(SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) AS REAL) / COUNT(*))) * 100 AS PercentageDifference; 
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.PostId = 61217; 
SELECT p.Score, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.PostId = 395; 
SELECT DISTINCT p.Id, ph.UserId FROM posts AS p JOIN postHistory AS ph ON p.Id = ph.PostId WHERE p.Score > 60
SELECT SUM(p.FavoriteCount) FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE ph.UserId = 686 AND STRFTIME('%Y', ph.CreationDate) = '2011'; 
SELECT AVG(users.UpVotes) AS AverageUpVotes, AVG(users.Age) AS AverageAge FROM users JOIN posts ON users.Id = posts.OwnerUserId GROUP BY users.Id HAVING COUNT(posts.Id) > 10; 
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE score > 60; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(*) FROM posts WHERE Score = 10;
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = ( SELECT MAX(Reputation) FROM users ); 
SELECT T2.Reputation FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'
SELECT T1.Date FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Rochester, NY'
SELECT CAST(SUM(CASE WHEN T1.Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'; 
SELECT T1.Score FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.CreationDate = '2010-07-19 19:19:56.0'
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CreationDate = '2010-07-19 19:37:33.0') 
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria'; 
SELECT COUNT(DISTINCT T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter' AND T2.Age BETWEEN 19 AND 65
SELECT SUM(views) FROM users WHERE id IN (SELECT userid FROM badges WHERE date = '2010-07-19 19:39:08.0')
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Reputation = ( SELECT MIN(Reputation) FROM users )
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'; 
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter' AND T2.Age > 65
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users);
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio FROM votes; 
SELECT t.TagName FROM tags t JOIN postTags pt ON t.Id = pt.TagId JOIN posts p ON pt.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier' 
SELECT COUNT(*) FROM postHistory AS ph JOIN users AS u ON ph.UserId = u.Id WHERE u.DisplayName = 'Daniel Vassallo'; 
SELECT COUNT(*) FROM users AS u INNER JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'
SELECT p.Id FROM posts AS p JOIN users AS u ON p.UserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1
SELECT p.Id, p.ViewCount FROM posts AS p JOIN postHistory AS ph ON p.Id = ph.PostId JOIN users AS u ON ph.UserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.Id ORDER BY SUM(p.ViewCount) DESC LIMIT 1
SELECT COUNT(DISTINCT p.Id) AS PostCount FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Id > 4; 
SELECT COUNT(c.Id) FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan'
SELECT DISTINCT p.Tags FROM posts p INNER JOIN postHistory ph ON p.Id = ph.PostId INNER JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.PostId) FROM users AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.UserId INNER JOIN tags AS T3 ON T2.PostId = T3.ExcerptPostId WHERE T1.DisplayName = 'Community'
SELECT      SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -     SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id; 
SELECT COUNT(Id) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'; 
SELECT COUNT(*) FROM postHistory WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';
SELECT DisplayName, Age FROM users WHERE Views = ( SELECT MAX(Views) FROM users )
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'; 
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60; 
SELECT T2.Title, T1.UserDisplayName FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score > 60;
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE STRFTIME('%Y', T1.Date) = '2011' AND T2.Location LIKE '%North Pole%'
SELECT T2.DisplayName, T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount > 150
SELECT COUNT(ph.Id) AS HistoryCount, p.LastEditDate FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' AND p.LastEditDate IS NOT NULL; 
SELECT T1.LastAccessDate, T1.Location FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Outlier'
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = ( SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' )
SELECT T2.PostId, T1.Name FROM badges AS T1 INNER JOIN postHistory AS T2 ON T1.UserId = T2.UserId WHERE T2.UserDisplayName = 'Samuel' AND YEAR(T2.CreationDate) = 2013 AND YEAR(T1.Date) = 2013
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.ViewCount DESC LIMIT 1
SELECT T2.DisplayName, T2.Location FROM tags AS T1 INNER JOIN users AS T2 ON T2.Id = T1.ExcerptPostId WHERE T1.TagName = 'hypothesis-testing'
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE p.Title = 'What are principal component scores?'
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ParentId IS NOT NULL AND T2.Score = ( SELECT MAX(Score) FROM posts )
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000; 
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1;
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE STRFTIME('%Y', v.CreationDate) = '2011' AND v.BountyAmount = 50
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'
SELECT CAST(COUNT(CASE WHEN strftime('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN Id ELSE NULL END) AS REAL) / 12 FROM postLinks INNER JOIN posts ON postLinks.PostId = posts.Id WHERE AnswerCount IS NOT NULL
SELECT P.Id FROM posts AS P JOIN votes AS V ON P.Id = V.PostId WHERE V.UserId = 1465 ORDER BY P.FavoriteCount DESC LIMIT 1
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id ORDER BY T2.CreaionDate ASC LIMIT 1
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT MIN(CreationDate) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'chl'
SELECT T1.CreationDate FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = ( SELECT MIN(Age) FROM users ) ORDER BY T1.CreationDate ASC LIMIT 1
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date ASC LIMIT 1
SELECT COUNT(DISTINCT p.OwnerUserId) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4
SELECT AVG(T1.PostId) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Age = ( SELECT MAX(Age) FROM users )
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000; 
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', p.CreaionDate) = '2010'
SELECT Id, Title FROM posts WHERE OwnerUserId IN ( SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky' ) ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts WHERE Score = ( SELECT MAX(Score) FROM posts )
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'; 
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount > 20000 AND STRFTIME('%Y', T1.CreationDate) = '2011'
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE STRFTIME('%Y', p.CreationDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 AND STRFTIME('%Y', T1.CreationDate) = '2011' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id
SELECT CAST(COUNT(CASE WHEN Age BETWEEN 13 AND 18 THEN Id ELSE NULL END) AS REAL) * 100 / COUNT(Id) FROM users
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON p.LastEditorUserId = u.Id WHERE ph.Text = 'Computer Game Datasets' ORDER BY ph.Id DESC LIMIT 1; 
SELECT COUNT(*) FROM posts WHERE ViewCount > ( SELECT AVG(ViewCount) FROM posts )
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1; 
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Emmett'  ORDER BY b.Date DESC  LIMIT 1; 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000; 
SELECT julianday(b.Date) - julianday(u.CreationDate) AS days_to_get_badge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon'
SELECT COUNT(DISTINCT p.Id) AS PostCount, COUNT(c.Id) AS CommentCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON p.Id = c.PostId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users); 
SELECT c.Text, u.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10; 
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'; 
SELECT COUNT(*) FROM tags WHERE TagName = 'careers'; 
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'; 
SELECT CommentCount, AnswerCount FROM posts WHERE Title = 'Clustering 1D data';
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'; 
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30; 
SELECT CAST(SUM(CASE WHEN T1.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20; 
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT u.Reputation, u.UpVotes FROM users AS u JOIN comments AS c ON u.Id = c.UserId WHERE c.Text LIKE '%fine, you win :)%' 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'; 
SELECT c.Text, c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1; 
SELECT c.CreationDate, u.Age  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.CreationDate LIKE '%http://%'; 
SELECT COUNT(DISTINCT T1.PostId) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score = 0 AND T2.ViewCount < 5
SELECT COUNT(c.Id) AS ZeroScoreComments FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0; 
SELECT COUNT(DISTINCT c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40
SELECT T1.Id, T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item'
SELECT T2.UpVotes FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'R is also lazy evaluated.' 
SELECT T1.Text FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky'
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0; 
SELECT CAST(SUM(CASE WHEN U.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(U.Id) FROM users AS U INNER JOIN comments AS C ON U.Id = C.UserId WHERE C.Score BETWEEN 5 AND 10
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.height_cm > 200
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id HAVING COUNT(T2.power_id) > 15
SELECT COUNT(*) FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue'; 
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond')
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.superhero_name = 'Sauron'
SELECT T2.colour, COUNT(T1.superhero_id) AS count FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' GROUP BY T2.colour ORDER BY count DESC
SELECT AVG(T2.height_cm) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id JOIN publisher pu ON s.publisher_id = pu.id WHERE pu.publisher_name = 'Marvel Comics' AND p.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics'
SELECT T.publisher_name FROM ( SELECT T1.publisher_name, T3.attribute_value, RANK() OVER (ORDER BY T3.attribute_value ASC) AS rank FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Speed' ) t WHERE rank = 1
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_id = 1 ORDER BY T1.attribute_value ASC LIMIT 1
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'
SELECT superhero_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Durability') AND attribute_value < 50)
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE s.gender_id = 2 AND a.attribute_name = 'Strength' AND ha.attribute_value = 100
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id ORDER BY COUNT(T2.hero_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.race = 'Vampire'; 
SELECT      ROUND((SUM(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE 0 END) / COUNT(T2.id)) * 100, 2) AS percentage_bad_alignment,     SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' AND T1.alignment = 'Bad' THEN 1 ELSE 0 END) AS bad_alignment_marvel_comics FROM      alignment AS T1 JOIN      superhero AS T2 ON T1.id = T2.alignment_id JOIN      publisher AS T3 ON T2.publisher_id = T3.id; 
SELECT SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(attribute_value) FROM hero_attribute;
SELECT COUNT(*) FROM superhero WHERE full_name = '-' OR full_name IS NULL;
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(T2.weight_kg) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T1.gender = 'Female'
SELECT T4.power_name FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.gender = 'Male' LIMIT 5
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour')
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT s.full_name FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.race = 'Demi-God' LIMIT 5; 
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T1.height_cm = 185 AND T1.race_id = 1
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T1.publisher_id = 13 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero )
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id GROUP BY T1.power_name ORDER BY COUNT(T1.power_name) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 1
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Stealth'
SELECT T2.full_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T1.attribute_value DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.skin_colour_id IS NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.id) FROM superhero AS T1 LEFT JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'No Colour'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T3.attribute_name = 'Durability' AND T4.publisher_name = 'Dark Horse Comics' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT T3.colour AS eyes , T4.colour AS hair , T5.colour AS skin FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id INNER JOIN colour AS T4 ON T1.hair_colour_id = T4.id INNER JOIN colour AS T5 ON T1.skin_colour_id = T5.id INNER JOIN publisher AS T6 ON T1.publisher_id = T6.id WHERE T2.gender = 'Female' AND T6.publisher_name = 'Dark Horse Comics'
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'
SELECT CAST(COUNT(CASE WHEN T1.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female' 
SELECT T1.superhero_name ,  T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T2.superhero_name = 'Agent 13'
SELECT superhero_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Adaptation'))
SELECT COUNT(power_id) FROM hero_power AS HP JOIN superhero AS SH ON HP.hero_id = SH.id WHERE SH.superhero_name = 'Amazo'
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.skin_colour_id IN ( SELECT id FROM colour WHERE colour = 'Gold' )
SELECT s.full_name FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire'; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' AND T2.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute AS T2 INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' )
SELECT T2.race, T3.alignment FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(COUNT(CASE WHEN g.gender = 'Female' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(s.id) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'; 
SELECT AVG(T2.weight_kg) FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Alien'
SELECT ABS((SUM(CASE WHEN full_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) - SUM(CASE WHEN full_name = 'Charles Chandler' THEN weight_kg ELSE 0 END))) AS difference FROM superhero
SELECT AVG(height_cm) FROM superhero;
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.race_id = 21 AND T2.id = 1
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T1.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT T1.attribute_name, T2.attribute_value FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Brown')
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(*) FROM superhero WHERE publisher_id NOT IN (SELECT id FROM publisher WHERE id = 1)
SELECT CAST(SUM(CASE WHEN T2.eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T1.colour = 'Blue'; 
SELECT CAST(COUNT(CASE WHEN T1.gender = 'Male' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN T1.gender = 'Female' THEN 1 ELSE NULL END) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0;
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Helen Parr'
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188; 
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id ORDER BY T3.attribute_value DESC LIMIT 1
SELECT T1.alignment, T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Atom IV'
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5
SELECT AVG(attribute_value) FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN alignment AS T3 ON T2.alignment_id = T3.id WHERE T3.alignment = 'Neutral'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_value = 100
SELECT COUNT(*) FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id JOIN alignment AS a ON s.alignment_id = a.id WHERE g.id = 2 AND a.id = 1; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T3.colour = 'blue' AND T1.gender_id = 1
SELECT CAST(COUNT(CASE WHEN T1.gender_id = 2 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.alignment_id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.id = 2
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 LEFT JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0; 
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race_id != 1
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100; 
SELECT SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id; 
SELECT T2.attribute_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'; 
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas' 
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' 
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'; 
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy'
SELECT T2.weight_kg, T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.id = 40
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT T1.hero_id FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Blackwulf'
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON hp.hero_id = sh.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero); 
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 20 ORDER BY T2.q1 DESC LIMIT 5
SELECT T2.surname FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 19 ORDER BY T1.q2 ASC LIMIT 1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.location = 'Shanghai'
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Germany'
SELECT T1.position FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.name = 'Renault'; 
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2010 AND T2.country NOT IN ('Asia', 'Europe')
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'
SELECT T1.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'
SELECT T1.time FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix'
SELECT T2.nationality FROM constructorresults AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 24 AND T1.points = 1
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND qualifying.raceId = 354; 
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.q2 = '0:01:40' AND T1.raceid = 355
SELECT T1.number FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q3 LIKE '1:54%' AND T2.raceId = 903; 
SELECT COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2007 AND T2.name = 'Bahrain Grand Prix' AND T1.time IS NULL
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceid = 901
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1
SELECT T1.url FROM drivers AS T1 INNER JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 161 AND T2.time LIKE '0:01:27%'
SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 ORDER BY T1.fastestLapSpeed DESC LIMIT 1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Malaysian Grand Prix'
SELECT T2.url FROM constructorresults AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 9 ORDER BY T1.points DESC LIMIT 1
SELECT T1.q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lucas' AND T2.surname = 'Di Grassi' AND T1.raceId = 345
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q2 = '0:01:15' AND T2.raceId = 347; 
SELECT T1.code FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 45 AND T2.q3 LIKE '1:33%'
SELECT T1.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceId = 743;
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2; 
SELECT T1.url FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901
SELECT COUNT(*) FROM results WHERE raceid = (SELECT raceid FROM races WHERE date = '2015-11-29') AND statusid != 1; 
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872 ORDER BY T1.dob DESC LIMIT 1
SELECT T2.forename, T2.surname FROM laptimes AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 348 ORDER BY TIME ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY CAST(REPLACE(SUBSTR(T2.fastestLapSpeed, 4), ',', '') AS REAL) DESC LIMIT 1
SELECT ((CAST((T1.fastestlapspeed - T2.fastestlapspeed) AS REAL) / T1.fastestlapspeed) * 100) FROM results AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 853 AND T2.raceid = 854 AND T1.driverid = ( SELECT driverid FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta' )
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '1983-07-16'
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*) AS race_count FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC; 
SELECT name FROM races WHERE date IN ( SELECT MIN(date) FROM races )
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM races WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000)
SELECT T1.country, T1.name, T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year IN ( SELECT MIN(T2.year) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid )
SELECT MAX(year) FROM races WHERE name = 'British Grand Prix' AND circuitid IN ( SELECT circuitid FROM circuits WHERE name = 'Brands Hatch' )
SELECT COUNT(*) AS season_count FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE c.name = 'Silverstone' AND r.name = 'British Grand Prix'; 
SELECT d.forename, d.surname FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid JOIN races r ON ds.raceid = r.raceid WHERE r.year = 2010 AND r.name = 'Singapore Grand Prix' ORDER BY ds.position; 
SELECT forename, surname FROM drivers WHERE driverId = (SELECT driverId FROM driverStandings ORDER BY points DESC LIMIT 1)
SELECT D.forename, D.surname, DS.points FROM drivers AS D JOIN driverstandings AS DS ON D.driverid = DS.driverid JOIN races AS R ON DS.raceid = R.raceid WHERE R.year = 2017 AND R.name = 'Chinese Grand Prix' ORDER BY DS.points DESC LIMIT 3
SELECT T1.forename, T1.surname, T2.name FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverId = T2.driverId ORDER BY T1.milliseconds ASC LIMIT 1
SELECT AVG(T1.milliseconds) FROM laptimes AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Malaysian Grand Prix' AND T3.year = 2009
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T3.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year >= 2010
SELECT T1.forename ,  T1.surname ,  T1.nationality ,  T2.points FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.wins = ( SELECT MAX(wins) FROM driverstandings ) AND T2.position = 1 ORDER BY T2.points DESC LIMIT 1
SELECT forename, surname, (YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1; 
SELECT c.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE STRFTIME('%Y', r.date) BETWEEN '1990' AND '2000' GROUP BY c.circuitid HAVING COUNT(r.raceid) = 4; 
SELECT c.name, c.location, r.name FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006;
SELECT T1.name, T2.name AS circuit_name, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE STRFTIME('%Y-%m', T1.date) = '2005-09'
SELECT T2.name FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverid = T2.winner WHERE T1.forename = 'Alex' AND T1.surname = 'Yoong' AND T1.position < 20
SELECT COUNT(*) FROM driverstandings AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T1.raceid = T3.raceid JOIN circuits AS T4 ON T3.circuitid = T4.circuitid WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' AND T4.name = 'Sepang International Circuit' AND T1.wins = ( SELECT MAX(wins) FROM driverstandings )
SELECT T1.name, T1.year FROM races AS T1 INNER JOIN laptimes AS T2 ON T1.raceid = T2.raceid INNER JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T2.milliseconds ASC LIMIT 1
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T2.raceid IN ( SELECT raceid FROM races WHERE YEAR = 2000 )
SELECT T1.name, T2.points FROM races AS T1 INNER JOIN driverstandings AS T2 ON T1.raceid = T2.raceid INNER JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.year ASC LIMIT 1; 
SELECT r.name AS race_name, c.country AS host_country, r.date AS event_date FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.year = 2017 ORDER BY r.date; 
SELECT T1.name, T1.year, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid ORDER BY COUNT(*) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name LIKE '%European Grand Prix%'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')); 
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits);
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT DISTINCT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit') 
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone'
SELECT TIME FROM races WHERE YEAR = 2010 AND circuitId = 3;
SELECT COUNT(*) FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid WHERE c.country = 'Italy'; 
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = "Circuit de Barcelona-Catalunya"
SELECT T2.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2009 AND T1.name = "Spanish Grand Prix"
SELECT MIN(T1.fastestLapTime) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T1.forename , T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year = 2007 AND T3.name = 'Canadian Grand Prix' AND T2.position = 1
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.rank ASC LIMIT 1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T1.positionOrder FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix' ORDER BY T1.position DESC LIMIT 1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.grid = 4 AND T2.raceid IN ( SELECT raceid FROM races WHERE YEAR = 1989 AND name = "Australian Grand Prix" )
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND TIME IS NOT NULL;
SELECT T1.fastestLap FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Australian Grand Prix' AND T3.year = 2008;
SELECT T2.time FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Chinese Grand Prix' AND T2.position = 2
SELECT T1.forename ,  T1.surname ,  T1.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'Australian Grand Prix' AND T3.year = 2008 AND T2.time LIKE '%:%'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND driverId IN ( SELECT driverId FROM results WHERE raceId = ( SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008 ) );
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = ( SELECT raceId FROM races WHERE name = 'Chinese Grand Prix' AND YEAR = 2008 ) AND TIME IS NOT NULL
SELECT SUM(points) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(REPLACE(SUBSTR(T2.fastestLapTime, 4), ':', '')) AS avg_fastest_lap_time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'
SELECT ((strftime('%M', T2.time) - strftime('%M', ( SELECT time FROM results WHERE positionOrder = 1 AND raceId = ( SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 ) LIMIT 1 ))) * 60 + (strftime('%S', T2.time) - strftime('%S', ( SELECT time FROM results WHERE positionOrder = 1 AND raceId = ( SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 ) LIMIT 1 ))) / 60) * 100 / ( SELECT time FROM results WHERE positionOrder = 1 AND raceId = ( SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008 ) LIMIT 1 ) AS percentage_faster
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide'; 
SELECT lat, lng FROM circuits WHERE country = 'USA'; 
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980'; 
SELECT MAX(T2.points) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = 'British'
SELECT name FROM constructors WHERE constructorId = (SELECT constructorId FROM constructorStandings ORDER BY points DESC LIMIT 1)
SELECT name FROM constructors WHERE constructorid NOT IN (SELECT constructorid FROM constructorstandings WHERE raceid = 291)
SELECT COUNT(*) FROM constructors AS c JOIN constructorstandings AS cs ON c.constructorid = cs.constructorid WHERE c.nationality = 'Japanese' AND cs.points = 0 GROUP BY cs.constructorid HAVING COUNT(cs.raceid) = 2
SELECT T1.name FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.rank = 1
SELECT COUNT(*) FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = 'French' AND T2.laps > 50
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL AND T1.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Japanese'; 
SELECT AVG(strftime('%s', T1.time) - strftime('%s', '00:00:00')) AS avg_time ,  T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.statusid = 1 AND T2.year < 1975 GROUP BY T2.year
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE STRFTIME('%Y', d.dob) > '1975' AND r.rank = 2;
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND driverId NOT IN (SELECT driverId FROM results WHERE time IS NOT NULL); 
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT T2.fastestLap FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T2.time LIKE '%:%'
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009
SELECT T1.name, T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds IS NOT NULL ORDER BY T2.milliseconds ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T3.year BETWEEN 2000 AND 2005 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverid) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T2.dob < '1985-01-01' AND T1.laps > 50
SELECT COUNT(*) FROM drivers d JOIN laptimes lt ON d.driverid = lt.driverid WHERE d.nationality = 'French' AND SUBSTR(lt.time, 4) < '120'; 
SELECT code FROM drivers WHERE nationality = 'America'; 
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(*) FROM driverStandings WHERE raceId = 18; 
SELECT COUNT(*) AS netherlandic_drivers FROM drivers WHERE nationality = 'Dutch' AND dob IN (     SELECT MIN(dob) FROM drivers ORDER BY dob DESC LIMIT 3 ); 
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'; 
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'; 
SELECT d.driverId, MIN(ps.time) AS earliest_lap_time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverId ORDER BY earliest_lap_time ASC LIMIT 3; 
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE STRFTIME('%Y', d.dob) = '1971' AND r.fastestLapTime IS NOT NULL; 
SELECT d.driverId, d.nationality, p.time FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'Spanish' AND STRFTIME('%Y', d.dob) < '1982' ORDER BY p.time DESC LIMIT 10; 
SELECT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT T1.year FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId ORDER BY TIME(T2.time) DESC LIMIT 1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 99 AND statusId = 2 AND time IS NOT NULL;
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria'; 
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q2 IS NOT NULL AND T2.raceId = 23
SELECT MIN(races.date) ,  circuits.name ,  races.time FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid INNER JOIN qualifying ON races.raceid = qualifying.raceid INNER JOIN drivers ON qualifying.driverid = drivers.driverid ORDER BY drivers.dob DESC LIMIT 1
SELECT COUNT(*) FROM results AS T1 INNER JOIN status AS T2 ON T1.statusid = T2.statusid WHERE T2.status = 'Puncture' AND T1.driverid IN ( SELECT driverid FROM drivers WHERE nationality = 'American' )
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid ORDER BY T2.wins DESC LIMIT 1
SELECT T2.driverid FROM races AS T1 INNER JOIN laptimes AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'French Grand Prix' AND T2.lap = 3 ORDER BY T2.time DESC LIMIT 1
SELECT T1.raceId, MIN(T2.milliseconds) FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T2.lap = 1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2006 AND T1.name = 'United States Grand Prix' AND T2.rank <= 10
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN pitstops AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'German' AND STRFTIME('%Y', T1.dob) BETWEEN '1980' AND '1985' GROUP BY T1.driverid ORDER BY AVG(T2.duration) ASC LIMIT 3
SELECT T2.time FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2008
SELECT T2.constructorRef, T2.url FROM results AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T3.name = 'Singapore Grand Prix' ORDER BY T1.time DESC LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'; 
SELECT forename || ' ' || surname AS "Full Name", url AS "Wiki Pedia Page Link", dob AS "Date of Birth" FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC; 
SELECT country, lat, lng FROM circuits WHERE name = 'Hungaroring'; 
SELECT T1.points, T2.name, T2.nationality FROM constructorresults AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid IN ( SELECT raceid FROM races WHERE name LIKE '%Monaco%' AND YEAR BETWEEN 1980 AND 2010 ) ORDER BY T1.points DESC LIMIT 1
SELECT AVG(T3.points) FROM drivers AS T1 INNER JOIN driverstandings AS T3 ON T1.driverid = T3.driverid INNER JOIN races AS T2 ON T3.raceid = T2.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.name = 'Turkish Grand Prix'
SELECT AVG(COUNT(*)) AS annual_average_races FROM ( 	SELECT COUNT(*) AS race_count 	FROM races 	WHERE date BETWEEN '2000-01-01' AND '2010-12-31' 	GROUP BY year ) AS yearly_counts; 
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT SUM(wins) AS total_wins FROM driverStandings WHERE points = 91; 
SELECT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.date DESC LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q3 IS NOT NULL ORDER BY T2.q3 ASC LIMIT 1
SELECT T1.forename , T1.surname , T1.nationality , T2.name FROM drivers AS T1 INNER JOIN races AS T2 ON T1.driverid = T2.driverid WHERE T1.dob = ( SELECT MIN(dob) FROM drivers )
SELECT COUNT(*) FROM results WHERE statusId = 3 AND raceId IN ( SELECT raceId FROM races WHERE name = 'Canadian Grand Prix' )
SELECT COUNT(T1.wins), T2.forename, T2.surname FROM driverstandings AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid ORDER BY T2.dob ASC LIMIT 1
SELECT MAX(duration) AS longest_pit_stop FROM pitStops;
SELECT MIN(time) AS fastest_lap_time FROM lapTimes;
SELECT MAX(T2.duration) FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T1.lap FROM pitstops AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.year = 2011 AND T3.name = 'Australian Grand Prix'
SELECT T1.duration FROM pitStops AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2011 AND T2.name = 'Australian Grand Prix'
SELECT MIN(time) FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY TIME ASC LIMIT 1
SELECT T2.position FROM drivers AS T1 INNER JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.time ASC LIMIT 1
SELECT MIN(fastestLapTime) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix'))
SELECT c.circuitName, MIN(r.time) AS fastestLapTime FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'Italy' GROUP BY c.circuitName; 
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Austrian Grand Prix Circuit' AND T1.lap_record IS NOT NULL ORDER BY T1.lap_record ASC LIMIT 1
SELECT SUM(T2.duration) AS total_pit_stop_duration FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.driverId IN (     SELECT MIN(time)     FROM results AS T3     JOIN pitStops AS T4 ON T3.raceId = T4.raceId     WHERE T4.raceId = T1.raceId ); 
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN laptimes AS T3 ON T2.raceid = T3.raceid WHERE T3.time = '1:29.488'
SELECT AVG(T2.milliseconds) FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(l.milliseconds) FROM lapTimes l JOIN races r ON l.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player); 
SELECT preferred_foot FROM Player_Attributes ORDER BY potential ASC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1
SELECT home_team FROM match_data WHERE season = '2015/2016' AND home_team_goal < away_team_goal GROUP BY home_team ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT player_name  FROM players  ORDER BY penalties DESC  LIMIT 10; 
SELECT T3.team_long_name  FROM match AS T1  JOIN league AS T2 ON T1.league_id = T2.id  JOIN team AS T3 ON T1.away_team_api_id = T3.api_id  WHERE T2.name = 'Scotland Premier League' AND T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal; 
SELECT teamName, buildUpPlaySpeed  FROM teams  ORDER BY buildUpPlaySpeed DESC  LIMIT 4; 
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(CASE WHEN T2.home_team_goal = T2.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT (strftime('%Y', 'now') - strftime('%Y', birthday)) AS age FROM Player WHERE strftime('%Y', date) BETWEEN '2013' AND '2015'; 
SELECT league_name, COUNT(match_id) AS match_count FROM leagues JOIN matches ON leagues.league_id = matches.league_id GROUP BY league_name ORDER BY match_count DESC LIMIT 1; 
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59';
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%'); 
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60
SELECT team_long_name FROM table_name WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM table_name WHERE buildUpPlayPassing IS NOT NULL); 
SELECT (CAST(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(player_fifa_api_id)) AS percentage_left_foot_players FROM Player WHERE YEAR(birthday) BETWEEN 1987 AND 1992; 
SELECT league_name, SUM(home_team_goal + away_team_goal) AS total_goals FROM matches JOIN league ON matches.league_id = league.id GROUP BY league_name ORDER BY total_goals ASC LIMIT 5; 
SELECT AVG(long_shots) AS average_long_shot FROM player_attributes WHERE player_name = 'Ahmed Samir Farag'; 
SELECT p.player_name, AVG(h.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Heading h ON p.player_api_id = h.player_api_id WHERE p.height > 180 GROUP BY p.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10; 
SELECT team_long_name  FROM table_name  WHERE buildUpPlayDribblingClass = 'Normal'  AND date >= '2014-01-01 00:00:00'  AND date <= '2014-01-31 00:00:00'  GROUP BY team_long_name  HAVING AVG(chanceCreationPassing) > (SELECT AVG(chanceCreationPassing) FROM table_name WHERE buildUpPlayDribblingClass = 'Normal' AND date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00')  ORDER BY AVG(chanceCreationPassing) DESC; 
SELECT L.name FROM League L JOIN Season S ON L.id = S.league_id JOIN Match M ON S.id = M.season_id WHERE S.year = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal); 
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE strftime('%Y-%m', birthday) = '1970-10'; 
SELECT attacking_work_rate FROM players WHERE name = 'Franco Zennaro'; 
SELECT buildUpPlayPositioningClass FROM match_events WHERE team_long_name = 'ADO Den Haag' AND (period_id BETWEEN 1 AND 2 OR period_id = 4); 
SELECT heading_accuracy  FROM player_stats  WHERE player_name = 'Francois Affolter' AND match_date = '2014-09-18 00:00:00'; 
SELECT AVG(rating) AS overall_rating FROM player_stats ps JOIN players p ON ps.player_id = p.id WHERE p.name = 'Gabriel Tamas' AND strftime('%Y', ps.date) = '2011'; 
SELECT COUNT(*)  FROM Match  JOIN Season ON Match.season_id = Season.id  JOIN League ON Match.league_id = League.id  WHERE Season.year = '2015/2016' AND League.name = 'Scotland Premier League'; 
SELECT preferred_foot FROM players ORDER BY birthday DESC LIMIT 1; 
SELECT * FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes); 
SELECT COUNT(*) FROM players WHERE weight < 130 AND preferred_foot = 'left'; 
SELECT team_short_name FROM teams WHERE chance_creation_passing_class = 'Risky'; 
SELECT defensive_work_rate FROM players WHERE name = 'David Wilson'; 
SELECT birthday FROM players WHERE overall_rating = (SELECT MAX(overall_rating) FROM players); 
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Netherlands'; 
SELECT AVG(home_team_goal) AS average_home_team_goal FROM match JOIN country ON match.country_id = country.id WHERE country.name = 'Poland' AND match.season = '2010/2011'; 
SELECT P.player_api_id FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id GROUP BY P.player_api_id ORDER BY AVG(PA.finishing) DESC LIMIT 1 WHERE P.height = ( SELECT MAX(height) FROM Player )
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170; 
SELECT player_name FROM player_stats WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010';
SELECT potential FROM players WHERE name = 'Aaron Doran'; 
SELECT player_name FROM players WHERE preferred_foot = 'left'; 
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Fast'; 
SELECT buildUpPlayPassingClass  FROM your_table_name  WHERE team_short_name = 'CLB'; 
SELECT team_short_name FROM your_table_name WHERE buildUpPlayPassing > 70; 
SELECT AVG(t2.overall_rating) AS average_overall_rating FROM Player t1 JOIN Player_Stats t2 ON t1.id = t2.player_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170; 
SELECT name FROM players ORDER BY height ASC LIMIT 1; 
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A'; 
SELECT team_short_name  FROM teams  WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32; 
SELECT AVG(overall_rating) AS average_overall_rating FROM players WHERE name = 'Aaron Doran'; 
SELECT COUNT(*) FROM match  JOIN league ON match.league_id = league.id  WHERE league.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', match.date) BETWEEN '2008-08' AND '2008-10'; 
SELECT team_short_name FROM match_data WHERE home_team_goal = 10; 
SELECT name FROM players WHERE balance = (SELECT MAX(balance) FROM players) AND potential = 61; 
SELECT      (SUM(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Abdou Diallo' THEN id ELSE NULL END)) -      (SUM(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Aaron Appindangoye' THEN id ELSE NULL END)) AS diff_avg_ball_control FROM      players; 
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT CASE WHEN (strftime('%J', '1984-06-06') - strftime('%J', birthday)) > (strftime('%J', '1984-06-07') - strftime('%J', birthday)) THEN 'Abdelaziz Barrada' ELSE 'Aaron Lennon' END AS older_player;
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'; 
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Belgium Jupiler League'; 
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany'; 
SELECT player_name FROM players ORDER BY overall_rating DESC LIMIT 1
SELECT COUNT(DISTINCT player_id)  FROM players  WHERE strftime('%Y', birthday) < '1986'  AND defensive_work_rate = 'high'; 
SELECT name FROM players WHERE name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1; 
SELECT heading_accuracy FROM users WHERE name = 'Ariel Borysiuk'; 
SELECT COUNT(*) FROM players WHERE height > 180 AND volleys > 70; 
SELECT name FROM players WHERE volleys > 70 AND dribbling > 70; 
SELECT COUNT(*)  FROM Match  JOIN Season ON Match.season_id = Season.id  JOIN Country ON Match.country_id = Country.id  WHERE Season.year = '2008/2009' AND Country.name = 'Belgium'; 
SELECT long_passing FROM players ORDER BY birthday ASC LIMIT 1; 
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04'; 
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(overall_rating) AS average_overall_rating FROM player WHERE strftime('%Y', birthday) < '1986'; 
SELECT      ((SUM(CASE WHEN player_name = 'Ariel Borysiuk' THEN overall_rating ELSE 0 END) - SUM(CASE WHEN player_name = 'Paulin Puel' THEN overall_rating ELSE 0 END)) / SUM(CASE WHEN player_name = 'Paulin Puel' THEN overall_rating ELSE 0 END)) * 100 AS percentage_difference FROM      players; 
SELECT AVG(buildUpPlaySpeed) AS average_build_up_play_speed FROM your_table_name WHERE team_long_name = 'Heart of Midlothian'; 
SELECT AVG(T1.overall_rating)  FROM players AS T1  WHERE T1.player_name = 'Pietro Marino'; 
SELECT SUM(T1.crossing) AS total_crossing_score FROM player_attributes AS T1 JOIN players AS T2 ON T1.player_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'; 
SELECT MAX(chanceCreationPassing) AS HighestChanceCreationPassingScore, chanceCreationPassingClass FROM your_table_name WHERE team_long_name = 'Ajax'; 
SELECT preferred_foot FROM players WHERE player_name = 'Abdou Diallo'; 
SELECT MAX(T1.overall_rating) AS highest_overall_rating FROM player_stats AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id WHERE T2.player_name = 'Dorlan Pabon'; 
SELECT AVG(T2.away_team_goal) AS average_goals FROM Country AS T1 JOIN Match AS T2 ON T1.id = T2.country_id JOIN Team AS T3 ON T3.team_api_id = T2.away_team_api_id WHERE T1.name = 'Italy' AND T3.team_long_name = 'Parma'; 
SELECT name  FROM players  WHERE overall_rating = 77 AND date LIKE '2016-06-23%'  ORDER BY birthday ASC  LIMIT 1; 
SELECT overall_rating  FROM player_stats  WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%'; 
SELECT potential FROM players WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'; 
SELECT attacking_work_rate FROM player_stats WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%'; 
SELECT defensive_work_rate FROM player_stats WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'; 
SELECT MIN(date) FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = ( SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant' )
SELECT build_up_play_speed_class  FROM match_data  WHERE team_long_name = 'Willem II' AND date = '2012-02-22'; 
SELECT build_up_play_dribbling_class FROM match_stats WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'; 
SELECT play_passing_class  FROM match_data  WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%'; 
SELECT T1.chance_creation_passing_class FROM match_data AS T1 JOIN team_data AS T2 ON T1.team_id = T2.team_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00'; 
SELECT T3.chance_creation_crossing_class  FROM teams AS T1  JOIN matches AS T2 ON T1.team_id = T2.home_team_id  JOIN match_stats AS T3 ON T2.match_id = T3.match_id  WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'; 
SELECT T1.defence_aggression_class  FROM match_stats AS T1  JOIN teams AS T2 ON T1.team_id = T2.team_id  WHERE T2.team_long_name = 'Hannover 96' AND DATE(T1.date) = '2015-09-10'; 
SELECT AVG(overall_rating)  FROM ratings  WHERE player_name = 'Marko Arnautovic'  AND date BETWEEN '2007-02-22' AND '2016-04-21'; 
SELECT      (CAST((SELECT overall_rating FROM players WHERE player_name = 'Landon Donovan') -            (SELECT overall_rating FROM players WHERE player_name = 'Jordan Bowery') AS REAL) /       (SELECT overall_rating FROM players WHERE player_name = 'Landon Donovan')) * 100 AS percentage_difference; 
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE datetime('now','-34 years') > birthday
SELECT COUNT(home_team_goals) AS total_home_team_goals FROM match_data WHERE player_name = 'Aaron Lennon'; 
SELECT SUM(CASE WHEN player_name = 'Daan Smith' THEN goals ELSE 0 END) +         SUM(CASE WHEN player_name = 'Filipe Ferreira' THEN goals ELSE 0 END) AS total_goals FROM match_details; 
SELECT SUM(home_team_goal) FROM Player WHERE strftime('%Y', 'now') - strftime('%Y', birthday) <= 30; 
SELECT T2.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT name FROM players WHERE potential = (SELECT MAX(potential) FROM players); 
SELECT name  FROM players  WHERE attacking_work_rate = 'high' AND player_id IN (     SELECT player_id_2      FROM player_moves      JOIN players ON player_moves.player_id_1 = players.player_id      WHERE attacking_work_rate = 'high' ); 
SELECT name  FROM players  WHERE finishing = 1  ORDER BY datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday) DESC  LIMIT 1; 
SELECT player_name FROM players WHERE country = 'Belgium'; 
SELECT country FROM players WHERE vision > 89; 
SELECT country FROM players GROUP BY country ORDER BY AVG(weight) DESC LIMIT 1; 
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Slow'; 
SELECT team_short_name FROM your_table_name WHERE chanceCreationPassingClass = 'Safe'; 
SELECT AVG(Player.height) FROM Player INNER JOIN Match ON Player.id = Match.country_id WHERE Country.name = 'Italy'; 
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'
SELECT (SELECT jumping FROM players WHERE id = 6) - (SELECT jumping FROM players WHERE id = 23) AS score_difference;
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND preferred_foot = 'left'
SELECT CAST(SUM(CASE WHEN stamina > 80 AND strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes; 
SELECT T2.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'; 
SELECT home_team_goal, away_team_goal  FROM Match  JOIN League ON Match.league_id = League.id  WHERE date LIKE '2008-09-24%' AND League.name = 'Belgium Jupiler League'; 
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin'
SELECT buildUpPlaySpeedClass  FROM teams  WHERE team_long_name = 'KSV Cercle Brugge'; 
SELECT COUNT(*) FROM games WHERE season = '2015/2016' AND league = 'Italian Serie A'; 
SELECT MAX(home_team_goal) AS highest_home_score FROM matches WHERE league = 'Netherlands Eredivisie'; 
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.weight = ( SELECT MAX(weight) FROM Player )
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.id ORDER BY COUNT(T1.id) DESC LIMIT 4
SELECT T1.team_long_name  FROM teams AS T1  JOIN matches AS T2 ON T1.team_api_id = T2.away_team_api_id  ORDER BY SUM(T2.away_team_goal) DESC  LIMIT 1; 
SELECT MAX(overall_rating) FROM Player_Attributes
SELECT (CAST(SUM(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(id)) * 100 AS percentage FROM players; 
SELECT      (SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)) * 100.0 /      (SUM(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 ELSE 0 END) + SUM(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 ELSE 0 END)) AS DeviationPercentage; 
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Birthday) > '1930' AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F'; 
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'
SELECT T1.Diagnosis, T2.Date FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = '30609'
SELECT P.SEX, P.Birthday, E.`Examination Date`, E.Symptoms FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.ID = 163109; 
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.LDH > 500; 
SELECT T1.ID ,  STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1937' AND L.`T-CHO` >= 250
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.ALB < 3.5 AND L.ALB IS NOT NULL; 
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT AVG(T1.`aCL IgG`) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND strftime('%Y', 'now') - strftime('%Y', T2.Birthday) >= 50; 
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Description LIKE '1997%' AND Admission = '-'; 
SELECT MIN(DATEDIFF(YEAR(`First Date`), YEAR(`Birthday`))) AS YoungestAge FROM Patient WHERE Birthday IS NOT NULL;
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` LIKE '1997%' AND T1.Thrombosis = 1 AND T2.SEX = 'F'
SELECT MAX(STRFTIME('%Y', Birthday)) - MIN(STRFTIME('%Y', Birthday)) AS AgeGap FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE TG >= 200 )
SELECT T2.Symptoms, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms IS NOT NULL ORDER BY T1.Birthday DESC LIMIT 1; 
SELECT CAST(COUNT(DISTINCT T1.ID) AS REAL) / 12 FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT      MIN(T2.Date) AS Lab_Date,      TIMESTAMPDIFF(YEAR, T1.Birthday, T1.`First Date`) AS Age_At_Arrival FROM      Patient AS T1 JOIN      Laboratory AS T2 ON T1.ID = T2.ID WHERE      T1.Diagnosis LIKE '%SJS%' ORDER BY      T1.Birthday ASC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID; 
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.`Examination Date`) - STRFTIME('%Y', T1.`First Date`) >= 1
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE STRFTIME('%Y', P.Birthday) < '1972' AND STRFTIME('%Y', E.`Examination Date`) BETWEEN '1990' AND '1993'; 
SELECT COUNT(DISTINCT p.ID) FROM Patient AS p JOIN Laboratory AS l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.`T-BIL` IS NOT NULL AND l.`T-BIL` >= 2.0
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1; 
SELECT AVG(1999 - strftime('%Y', T1.Birthday)) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) AS Age, T2.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HGB = ( SELECT MAX(HGB) FROM Laboratory ); 
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT CASE WHEN T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS CholesterolStatus FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04'
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1
SELECT T2.`aCL IgM` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description = '1994-02-19' AND T2.`Examination Date` = '1993-11-12' AND T1.Diagnosis = 'SLE'
SELECT CASE WHEN T1.SEX = 'M' THEN 'Man' ELSE 'Woman' END AS Gender FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = '1992-06-12' AND T2.GPT = 9;
SELECT TIMESTAMPDIFF(YEAR, T2.Birthday, '1991-10-21') AS Age FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1991-10-21' AND T1.UA = 8.4;
SELECT COUNT(Lab.ID) FROM Patient AS Pat JOIN Laboratory AS Lab ON Pat.ID = Lab.ID WHERE Pat.`First Date` = '1991-06-13' AND Pat.Diagnosis = 'SJS' AND Lab.Date LIKE '1995%'; 
SELECT T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` = '1997-01-27' AND T2.Diagnosis = 'SLE'
SELECT T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.`Examination Date` = '1993-09-27'; 
SELECT      (SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) -       SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-12-%' THEN T2.`T-CHO` ELSE 0 END)) /      SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN 1 ELSE 0 END) AS DecreaseRate FROM      Patient AS T1 INNER JOIN      Laboratory AS T2 ON T1.ID = T2.ID; 
SELECT ID FROM Examination WHERE Diagnosis LIKE '%Behcet%' AND Examination_Date BETWEEN '1997-01-01' AND '1997-12-31'; 
SELECT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4; 
SELECT ID FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Birthday) = '1964' AND Admission = '+'; 
SELECT COUNT(*) FROM Examination WHERE `Thrombosis` = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination); 
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE U_PRO > 0 AND U_PRO < 30
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE YEAR(`First Date`) = '1981' AND SEX = 'M'; 
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.`T-BIL` < 2.0
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` != 'P' AND T1.SEX = 'F' AND strftime('%Y', T1.Birthday) BETWEEN '1980' AND '1989'
SELECT P.SEX FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID JOIN Laboratory AS L ON P.ID = L.ID WHERE E.Diagnosis = 'PSS' AND L.CRP > 2 AND L.CRE = 1 AND L.LDH = 123; 
SELECT AVG(L.ALB) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND P.Diagnosis = 'SLE' AND L.PLT > 400
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1
SELECT `First Date`, Diagnosis FROM Patient WHERE ID = 48473; 
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis LIKE '%APS%'; 
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE YEAR(Date) = 1997 AND ALB NOT BETWEEN 6 AND 8.5
SELECT CAST(SUM(CASE WHEN DIAGNOSIS LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination WHERE Symptoms LIKE '%thrombocytopenia%'
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE STRFTIME('%Y', Birthday) = '1980' AND Diagnosis = 'RA'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND T2.Diagnosis LIKE '%Behcet%' AND T1.Admission = '-'
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.WBC < 3.5
SELECT DATEDIFF(T2.`Examination Date`, T1.`First Date`) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 821298
SELECT CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 'Normal Range' ELSE 'Not in Normal Range' END AS Result FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.ID = 57266
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GOT < 60 AND STRFTIME('%Y', L.Date) = '1994'; 
SELECT DISTINCT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60; 
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC
SELECT AVG(LDH) AS Average_LDH FROM Laboratory WHERE LDH IS NOT NULL AND LDH < 500; 
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_TIMESTAMP) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;
SELECT P.Admission FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.ALP < 300
SELECT T1.ID, CASE WHEN MIN(T2.ALP) < 300 THEN 'Yes' ELSE 'No' END AS NormalRange FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' GROUP BY T1.ID
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TP < 6.0 AND L.TP IS NOT NULL
SELECT TP - 8.5 AS Deviation FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F' AND TP > 8.5; 
SELECT P.ID, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5 OR L.ALB IS NULL) ORDER BY P.Birthday DESC; 
SELECT P.ID, CASE WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range' ELSE 'Outside Normal Range' END AS Albumin_Status FROM Patient P LEFT JOIN Laboratory L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1982'; 
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.UA > 8 OR T2.UA IS NULL) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'
SELECT AVG(T2.UA) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T2.UA < 8.0) OR (T1.SEX = 'F' AND T2.UA < 6.5) GROUP BY T1.ID HAVING MAX(T2.Date)
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.UN = 29; 
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'RA' AND T2.UN < 30
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CRE >= 1.5
SELECT (SUM(CASE WHEN P.SEX = 'M' AND L.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' AND L.CRE >= 1.5 THEN 1 ELSE 0 END)) AS result FROM Patient P JOIN Laboratory L ON P.ID = L.ID; 
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` = ( SELECT MAX(`T-BIL`) FROM Laboratory )
SELECT P.SEX, GROUP_CONCAT(DISTINCT L.ID) AS Patients FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` IS NOT NULL AND L.`T-BIL` >= 2.0 GROUP BY P.SEX; 
SELECT P.ID, L.[T-CHO] FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.[T-CHO] IS NOT NULL ORDER BY P.Birthday ASC, L.[T-CHO] DESC LIMIT 1
SELECT AVG(DIVIDE(SUM(YEAR(CURRENT_DATE) - YEAR(Birthday)), COUNT(ID))) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-CHO` >= 250; 
SELECT T1.ID, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG > 300
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Birthday IS NOT NULL AND L.TG >= 200 AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) > 50
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1936' AND '1956' AND T1.SEX = 'M' AND T2.CPK >= 250; 
SELECT P.ID, P.SEX, TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_TIMESTAMP) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250; 
SELECT T1.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` LIKE '1991%' AND T2.GLU < 180
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 GROUP BY T1.SEX ORDER BY strftime('%Y', 'now') - strftime('%Y', T1.Birthday) ASC
SELECT T1.ID ,  strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5
SELECT P.ID, P.SEX, P.Birthday, P.Admission FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND STRFTIME('%Y', 'now') - STRFTIME('%Y', P.Birthday) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0);
SELECT DISTINCT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.HGB BETWEEN 10 AND 17 ORDER BY T1.Birthday ASC LIMIT 1
SELECT P.ID, strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID HAVING COUNT(L.ID) > 2
SELECT AVG(HCT) AS Average_Hematocrit FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29; 
SELECT      (SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END)) AS calculation FROM      Laboratory; 
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', L.Date) = '1984' AND STRFTIME('%Y', 'now') - STRFTIME('%Y', P.Birthday) < 50 AND L.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN T2.PT >= 14 AND T1.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.Birthday) > 55
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE strftime('%Y', P.`First Date`) > '1992' AND L.PT < 14
SELECT COUNT(*) FROM Laboratory WHERE Date > '1997-01-01' AND APTT IS NOT NULL; 
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T1.Thrombosis = 0
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.WBC BETWEEN 3.5 AND 9.0 AND (L.FG <= 150 OR L.FG >= 450)
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Birthday > '1980-01-01' AND L.FG NOT BETWEEN 150 AND 450
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.`U-PRO` BETWEEN 0 AND 30
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.IGG BETWEEN 900 AND 2000 AND e.Symptoms IS NOT NULL; 
SELECT Diagnosis  FROM Patients  WHERE IGA = (SELECT MAX(IGA) FROM Patients WHERE IGA BETWEEN 80 AND 500); 
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.`First Date` >= '1990-01-01' AND L.IGA BETWEEN 80 AND 500
SELECT Diagnosis FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE IGM <= 40 OR IGM >= 400) GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.CRP = '+' AND P.Description IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, T2.Birthday, CURDATE()) < 70
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.KCT = '+' AND T2.RA IN ('-', '+-')
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.Birthday) >= '1985' AND T1.RA IN ('-', '+-')
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Birthday <= DATE_SUB(CURDATE(), INTERVAL 60 YEAR) AND L.RF < 20
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND T1.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`ANA Pattern` = 'P' AND T2.C3 > 35
SELECT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.HCT NOT BETWEEN 29 AND 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis LIKE '%APS%' AND L.C4 IS NOT NULL AND L.C4 <= 10; 
SELECT COUNT(DISTINCT P.ID) AS PatientCount FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND (L.RNP = '-' OR L.RNP = '+-'); 
SELECT Birthday FROM Patient WHERE ID = (SELECT ID FROM Laboratory WHERE RNP NOT IN('-', '+-') ORDER BY Birthday DESC LIMIT 1)
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Description LIKE '%SM IN('-', '+-')%' AND T1.Thrombosis = 0
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') ORDER BY T1.Birthday DESC LIMIT 3
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date > '1997-01-01' AND L.SC170 IN ('negative', '0'); 
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SC170 IN ('negative', '0') AND T2.SEX = 'F' AND T2.Symptoms IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN ('-', '+') AND STRFTIME('%Y', T1.`First Date`) < '2000'
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.SSA NOT IN ('negative', '0') ORDER BY P.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.SSB IN ('-', '+-'); 
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL; 
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CENTROMEA IN ('-', '+-') AND L.SSB IN ('-', '+-'); 
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T1.Description IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND T1.IGG BETWEEN 900 AND 2000
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT >= 60 THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID; 
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60
SELECT Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60) ORDER BY Birthday DESC LIMIT 1
SELECT P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GPT IS NOT NULL AND L.GPT < 60 ORDER BY L.GPT DESC LIMIT 3
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60
SELECT MIN(T1.`First Date`) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500;
SELECT T1.`First Date` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.ALP >= 300 AND P.Admission = '+'
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.ALP < 300;
SELECT Diagnosis FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TP < 6.0)
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' AND L.TP BETWEEN 6.0 AND 8.5; 
SELECT Date FROM Laboratory WHERE ALB BETWEEN 3.5 AND 5.5 ORDER BY ALB DESC LIMIT 1
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB BETWEEN 3.5 AND 5.5 AND l.TP BETWEEN 6.0 AND 8.5; 
SELECT T1.`aCL IgG`, T1.`aCL IgM`, T1.`aCL IgA` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T3.ID = T2.ID WHERE T2.SEX = 'F' AND T3.UA > 6.5 ORDER BY T3.UA DESC LIMIT 1
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE < 1.5 AND E.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Examination) 
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` >= 2 AND T2.`ANA Pattern` LIKE '%P%'
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` = ( SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0 )
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-CHO` >= 250 AND T2.KCT = '-'
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` = 'P' AND T1.`T-CHO` < 250
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.TG < 200 AND e.Symptoms IS NOT NULL; 
SELECT T1.Diagnosis FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1
SELECT ID FROM Examination WHERE Thrombosis = 0 INTERSECT SELECT ID FROM Laboratory WHERE CPK < 250;
SELECT COUNT(DISTINCT E.ID) AS Positive_Coagulation_Patients FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+'); 
SELECT Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GLU > 180 ORDER BY Birthday ASC LIMIT 1)
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 180 AND T1.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0;
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC <= 3.5 OR T2.RBC >= 6.0 AND T1.Admission = '-'
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.PLT BETWEEN 100 AND 400 AND P.Diagnosis IS NOT NULL; 
SELECT T2.PLT FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT BETWEEN 100 AND 400
SELECT AVG(T2.PT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14
SELECT COUNT(DISTINCT e.ID) AS SevereThrombosisWithNormalPT FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis IN (1, 2) AND l.PT < 14; 
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'; 
SELECT COUNT(*) FROM member AS m JOIN major AS j ON m.link_to_major = j.major_id WHERE j.college = 'College of Engineering'; 
SELECT member.first_name, member.last_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design Department'; 
SELECT COUNT(*) FROM attendance AS A JOIN event AS E ON A.link_to_event = E.event_id WHERE E.event_name = 'Women''s Soccer'; 
SELECT T1.phone FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer'
SELECT COUNT(*) FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium'
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T3.member_id = T2.link_to_member WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean'
SELECT COUNT(*) FROM event AS e JOIN attendance AS a ON e.event_id = a.link_to_event JOIN member AS m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND STRFTIME('%Y', e.event_date) = '2019'; 
SELECT COUNT(*) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T2.link_to_event) > 10
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T2.link_to_event) > 20
SELECT CAST(COUNT(event_id) AS REAL) / COUNT(DISTINCT event_name) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense);
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'; 
SELECT T2.first_name, T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey'
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'
SELECT SUM(amount) FROM income WHERE link_to_member IN ( SELECT member_id FROM member WHERE position = 'Vice President' )
SELECT SUM(b.spent) AS total_spent_on_food FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Food'; 
SELECT T1.city, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.position = 'President'
SELECT T1.first_name ,  T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois'
SELECT SUM(b.spent) FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting'; 
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.last_name IN ('Pierce', 'Guidi')
SELECT SUM(T2.amount) AS total_budgeted_amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'; 
SELECT e.approved FROM expense AS e JOIN budget AS b ON e.link_to_budget = b.budget_id JOIN event AS ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08'; 
SELECT AVG(cost) FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND strftime('%m', T1.expense_date) IN ('09', '10')
SELECT SUM(CASE WHEN STRFTIME('%Y', T1.event_date) = '2019' THEN T2.spent ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', T1.event_date) = '2020' THEN T2.spent ELSE 0 END) AS diff FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event; 
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE expense_description LIKE '%Posters%' AND expense_date = '2019-09-10'; 
SELECT remaining FROM budget WHERE category = 'Food' AND amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' )
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'; 
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Adela' AND T2.last_name = 'O''Gallagher'
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0; 
SELECT SUM(T2.amount) AS total_budget_amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Speaker'; 
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Post Cards, Posters' AND T1.expense_date = '2019-08-20'
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'; 
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'
SELECT T2.type FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'; 
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'; 
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.source = 'Dues' ORDER BY T2.date_received ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.event_name = 'October Meeting' THEN T1.amount ELSE 0 END) AS ratio FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement'; 
SELECT CAST(SUM(CASE WHEN T1.category = 'Parking' THEN T1.amount ELSE 0 END) AS REAL) / SUM(T1.amount) * 100 AS percentage FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker'; 
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'
SELECT COUNT(city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'; 
SELECT T2.city, T2.county, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T2.expense_description FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget ORDER BY T1.remaining ASC LIMIT 1
SELECT T2.member_id FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Meeting'
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major GROUP BY T1.college ORDER BY COUNT(T1.college) DESC LIMIT 1
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1
SELECT e.expense_description FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position = 'Vice President'; 
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'
SELECT COUNT(*) FROM member AS m JOIN zip_code AS z ON m.zip = z.zip_code WHERE z.state = 'Maryland'; 
SELECT COUNT(DISTINCT T2.link_to_event) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T1.phone = '954-555-6240'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President'; 
SELECT MAX(spent) FROM budget;
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'; 
SELECT SUM(spent) FROM budget WHERE category = 'Food'; 
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7; 
SELECT m.first_name, m.last_name FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id JOIN major AS mj ON m.link_to_major = mj.major_id WHERE e.event_name = 'Community Theater' AND mj.major_name = 'Interior Design'
SELECT T1.first_name ,  T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'
SELECT SUM(income.amount) AS total_income FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'; 
SELECT T2.first_name, T2.last_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount > 40
SELECT SUM(T3.cost) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN budget AS T3 ON T2.link_to_budget = T3.budget_id INNER JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T4.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount = ( SELECT MAX(amount) FROM income )
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget ORDER BY T3.cost ASC LIMIT 1
SELECT      (SUM(CASE WHEN T3.event_name = 'Yearly Kickoff' THEN T2.cost ELSE 0 END) / SUM(T2.cost)) * 100 AS percentage FROM      budget AS T1 JOIN      expense AS T2 ON T1.budget_id = T2.link_to_budget JOIN      event AS T3 ON T1.link_to_event = T3.event_id; 
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'; 
SELECT COUNT(*) FROM member AS m JOIN major AS j ON m.link_to_major = j.major_id WHERE j.major_name = 'Physics Teaching'; 
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Community Theater' AND STRFTIME('%Y', T2.event_date) = '2019'; 
SELECT COUNT(T2.link_to_event) AS event_count, T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major JOIN attendance AS T3 ON T2.member_id = T3.link_to_member WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'; 
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1
SELECT CASE WHEN EXISTS (     SELECT 1     FROM member m     JOIN attendance a ON m.member_id = a.link_to_member     JOIN event e ON a.link_to_event = e.event_id     WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer' ) THEN 'Yes' ELSE 'No' END AS attended; 
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM event WHERE event_date LIKE '2019-%'; 
SELECT T1.cost FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'September Speaker' AND T1.expense_description = 'Posters'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.event_status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1
SELECT T1.type, SUM(T3.cost) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'October Meeting' GROUP BY T1.type
SELECT SUM(T1.amount), T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'April Speaker' GROUP BY T1.category ORDER BY T1.amount ASC
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT * FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'; 
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'; 
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name; 
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'; 
SELECT T1.zip FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50 GROUP BY T1.zip HAVING SUM(T2.cost) < 50
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'; 
SELECT T1.position FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'; 
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30; 
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date = '2020-03-24T12:00:00'; 
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT CAST(SUM(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50; 
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'; 
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'; 
SELECT m.last_name, maj.department, maj.college  FROM member m  JOIN major maj ON m.link_to_major = maj.major_id  WHERE maj.major_name = 'Environmental Engineering'; 
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0
SELECT z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code JOIN major j ON m.link_to_major = j.major_id WHERE j.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member'; 
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social'; 
SELECT T2.last_name, T2.position FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_date = '2019-09-10' AND T1.expense_description = 'Pizza'
SELECT T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T2.position = 'Member'
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium'; 
SELECT DISTINCT county FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE state = 'Puerto Rico' AND type = 'PO Box'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'; 
SELECT DISTINCT T1.link_to_event FROM attendance AS T1 JOIN expense AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.cost > 50; 
SELECT T1.link_to_member ,  T2.event_id FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN expense AS T3 ON T1.link_to_member = T3.link_to_member WHERE T3.approved = 'true' AND T3.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major = 'rec1N0upiVLy5esTO'
SELECT T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name LIKE '%Business%'
SELECT T2.email FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T1.cost > 20; 
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Education & Human Services' AND T1.position = 'Member';
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(budget_id) FROM budget; 
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'; 
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code
SELECT T1.event_name, T1.location FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost > 50 AND T3.cost < 100
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100
SELECT z.city, z.county FROM zip_code z JOIN member m ON z.zip_code = m.zip JOIN income i ON m.member_id = i.link_to_member GROUP BY z.city, z.county HAVING COUNT(i.amount) > 40; 
SELECT m.member_id, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING COUNT(DISTINCT e.link_to_budget) > 1 ORDER BY total_spent DESC LIMIT 1; 
SELECT AVG(T1.cost) AS average_amount_paid FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position != 'Member'; 
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T2.category = 'Parking' AND T3.cost < ( SELECT AVG(cost) FROM expense WHERE link_to_budget IN ( SELECT budget_id FROM budget WHERE category = 'Parking' ) )
SELECT CAST(SUM(CASE WHEN T1.type = 'Meeting' THEN T2.cost ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event
SELECT T1.link_to_budget FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Water, chips, cookies' ORDER BY T2.cost DESC LIMIT 1
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN budget AS T3 ON T2.link_to_budget = T3.budget_id GROUP BY T1.member_id ORDER BY SUM(T3.spent) DESC LIMIT 5
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense); 
SELECT CAST(SUM(CASE WHEN T1.state = 'New Jersey' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.state) - CAST(SUM(CASE WHEN T1.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.state) FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code WHERE T2.position = 'Member'
SELECT T2.major_name, T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'; 
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'
SELECT m.last_name, m.phone FROM member m JOIN major j ON m.link_to_major = j.major_id WHERE j.major_name = 'Elementary Education'; 
SELECT T1.category, T1.amount FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'; 
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '2019-09-09'; 
SELECT T1.category FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Posters'
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'
SELECT SUM(b.spent), e.event_name  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE b.category = 'Speaker Gifts'; 
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'; 
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina'; 
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'; 
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.Date BETWEEN '201201' AND '201212' ORDER BY T2.Consumption ASC LIMIT 1
SELECT AVG(T2.Consumption) / 12 FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312'
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK' AND ym.Date BETWEEN '201101' AND '201112' ORDER BY ym.Consumption DESC LIMIT 1; 
SELECT COUNT(DISTINCT CustomerID) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND Consumption < 30000; 
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS Difference FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212'
SELECT strftime('%Y', T1.Date) AS Year FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR' GROUP BY Year ORDER BY SUM(T1.Consumption) DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT T2.Date, MAX(T2.Consumption) AS PeakConsumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date LIKE '2013%' GROUP BY T2.Date ORDER BY PeakConsumption DESC LIMIT 1; 
SELECT      (AVG(CASE WHEN T1.Segment = 'SME' THEN T2.Consumption END) - AVG(CASE WHEN T1.Segment = 'LAM' THEN T2.Consumption END)) AS diff_SME_LAM,     (AVG(CASE WHEN T1.Segment = 'LAM' THEN T2.Consumption END) - AVG(CASE WHEN T1.Segment = 'KAM' THEN T2.Consumption END)) AS diff_LAM_KAM,     (AVG(CASE WHEN T1.Segment = 'KAM' THEN T2.Consumption END) - AVG(CASE WHEN T1.Segment = 'SME' THEN T2.Consumption END)) AS diff_KAM_SME FROM      customers AS T1 JOIN      yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE      T2.Date BETWEEN '201301' AND '201312'; 
SELECT T2.Segment, MAX((T1.Consumption - T2.Consumption) / T1.Consumption * 100) AS MaxPercentageIncrease, MIN((T1.Consumption - T2.Consumption) / T1.Consumption * 100) AS MinPercentageDecrease FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '2013%' AND T2.Segment IN ('SME', 'LAM')
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'; 
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment LIKE '%discount%') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment LIKE '%discount%') AS difference; 
SELECT ( SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304' ) - ( SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304' ) AS Difference
SELECT SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM customers WHERE Segment = 'SME';
SELECT c.CustomerID FROM customers AS c JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1
SELECT T1.Segment, SUM(T2.Consumption) AS Total_Consumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T1.Segment ORDER BY Total_Consumption DESC LIMIT 1
SELECT SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T2.Date = '201305'; 
SELECT CAST(SUM(CASE WHEN T1.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'LAM'; 
SELECT Country, COUNT(*) FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN Segment = 'KAM' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers WHERE Currency = 'EUR'; 
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth WHERE Date LIKE '201202%'; 
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SLO'; 
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1; 
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1
SELECT T2.CustomerID FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201206' AND T2.Segment = 'SME' ORDER BY T1.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'
SELECT MAX(SUM(Consumption) / 12) FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR'
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE strftime('%Y%m', T1.Date) = '201309'
SELECT DISTINCT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%Y%m', T2.Date) = '201306'; 
SELECT DISTINCT T2.ChainID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR'
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T1.CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')
SELECT AVG(Amount) AS AverageTotalPrice FROM transactions_1k WHERE Date LIKE '2012-01%'; 
SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Consumption > 1000
SELECT T3.Description FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN products AS T3 ON T2.ProductID = T3.ProductID WHERE T1.Country = 'CZE'
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE ChainID = 11)
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'
SELECT AVG(T2.Price) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'CZE'
SELECT AVG(Price) FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR'
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' ORDER BY Price DESC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time ASC LIMIT 1
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time LIKE '%16:25:%'
SELECT T1.Segment FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID IN (31543, 46707, 46707, 7654, 17373)
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND Currency = 'CZK'
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM transactions_1k)
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'
SELECT T2.Date, T2.Consumption FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Price = 124.05; 
SELECT COUNT(t.TransactionID) AS TransactionCount FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26' AND t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE'; 
SELECT T2.Currency FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date LIKE '%201306%' AND T1.Consumption = 214582.17
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-24' AND t.Price = 548.4; 
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25'
SELECT      ((T2.Consumption - T3.Consumption) / T2.Consumption) AS ConsumptionDecreaseRate FROM      transactions_1k AS T1 JOIN      yearmonth AS T2 ON T1.CustomerID = T2.CustomerID AND T1.Date LIKE '2012%' JOIN      yearmonth AS T3 ON T1.CustomerID = T3.CustomerID AND T3.Date LIKE '2013%' WHERE      T1.Date = '2012-08-25' AND T1.Price = 634.8; 
SELECT GasStationID FROM transactions_1k GROUP BY GasStationID ORDER BY SUM(Price) DESC LIMIT 1
SELECT SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) FROM gasstations WHERE Country = 'SVK'
SELECT SUM(Price) AS TotalSpent FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '201201%'; 
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID ORDER BY SUM(t.Amount) DESC LIMIT 5
SELECT c.CustomerID, AVG(t.Price) AS AvgPricePerItem, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Amount) DESC LIMIT 1; 
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1
SELECT ym.Consumption FROM yearmonth AS ym JOIN transactions_1k AS t ON ym.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND t.Price / t.Amount > 29 AND ym.Date = '201208'; 
