SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Alameda'; 
SELECT MIN(`Percent (%) Eligible Free (Ages 5-17)`) FROM `frpm` WHERE `School Type` = 'Continuation' LIMIT 3
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Fresno' AND T1.`Charter School (Y/N)` = 1
SELECT T1.MailStreet FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 1
SELECT T1.Phone FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T1.OpenDate > '2000-01-01' 
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F'; 
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 500 AND T1.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores )
SELECT SUM(NumTstTakr) AS TotalSATTestTakers FROM satscores WHERE cds IN (     SELECT CDSCode     FROM frpm     ORDER BY `FRPM Count (K-12)` DESC     LIMIT 1 ); 
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.FundingType = 'Direct Charter'
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T2.CDSCode = T3.cds ORDER BY T3.AvgScrRead DESC LIMIT 1; 
SELECT CDSCode FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500
SELECT MAX(T2.`Percent (%) Eligible Free (Ages 5-17)`) AS MaxEligibleFreeRate FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE (T1.NumGE1500 / T1.NumTstTakr) > 0.3; 
SELECT T2.Phone  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC  LIMIT 3; 
SELECT T2.NCESSchool FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T1.District FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.StatusType = 'Active' GROUP BY T1.District ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 1
SELECT COUNT(*) FROM satscores WHERE dname = 'Merged Alameda' AND NumTstTakr < 100
SELECT T2.CDSCode, T2.CharterNum FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite > 499 AND T2.CharterNum IS NOT NULL ORDER BY T1.AvgScrWrite DESC
SELECT COUNT(*) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.City = 'Fresno' AND T1.FundingType = 'Directly Funded' AND T2.NumTstTakr <= 250
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND Low_Grade = '9' AND High_Grade = '12'; 
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.City = 'Los Angeles'  AND frpm.`Percent (%) Eligible Free (K-12)` > 500  AND frpm.`Percent (%) Eligible FRPM (K-12)` < 700; 
SELECT s.School, s.County, s.District, s.CDSCode, st.NumTstTakr FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE s.County = 'Contra Costa' ORDER BY st.NumTstTakr DESC LIMIT 1; 
SELECT T2.School, T2.Street, T2.StreetAbr, T2.City, T2.Zip, T2.State FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) > 30
SELECT T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Percent (%) Eligible Free (K-12)` > 0.1 AND T2.FRPMPerc >= 1500
SELECT T1.School, T1.FundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 400 AND T1.County = 'Riverside' GROUP BY T1.School, T1.FundingType
SELECT T2.School, T2.Street, T2.City, T2.State, T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Percent (%) Eligible Free (Ages 5-17)` > 800 AND T2.District = 'Monterey' AND T1.HighGrade = '12'
SELECT T2.AvgScrWrite, T1.School, T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.OpenDate > '1991-12-31' OR T1.ClosedDate < '2000-01-01'
WITH AvgDiff AS (     SELECT AVG(Enrollment (K-12) - Enrollment (Ages 5-17)) AS avg_diff     FROM frpm ) SELECT s.School, s.DOCType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Enrollment (K-12) - f.Enrollment (Ages 5-17) > (SELECT avg_diff FROM AvgDiff); 
SELECT T1.OpenDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT `Percent (%) Eligible Free (K-12)`, `Percent (%) Eligible FRPM (K-12)`, `Enrollment (K-12)` FROM `frpm` ORDER BY `Enrollment (K-12)` DESC LIMIT 10, 2
SELECT T1.CDSCode, T1.School, T1.`FRPM Count (K-12)`, T1.`Enrollment (K-12)`, (T1.`FRPM Count (K-12)` / T1.`Enrollment (K-12)`) AS `Eligible Free or Reduced Price Meal Rate` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'Ownership Code 66' ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 5
SELECT T1.Website, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT T1.`Percent (%) Eligible Free (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson'
SELECT T1.AdmEmail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 ORDER BY T2.`Enrollment (K-12)` ASC LIMIT 1
SELECT T1.AdmFName1, T1.AdmLName1 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores ) LIMIT 1
SELECT T2.Street, T2.City, T2.State, T2.Zip FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr ASC LIMIT 1
SELECT T2.Website FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr BETWEEN 2000 AND 3000 AND T2.County = 'Los Angeles'
SELECT AVG(s.NumTstTakr) AS AverageTestTakers FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.City = 'Fresno' AND STRFTIME('%Y', sch.OpenDate) = '1980'; 
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Fresno Unified' ORDER BY T2.AvgScrRead ASC LIMIT 1
SELECT s.School, AVG(ss.AvgScrRead) AS AvgReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY s.County, AvgReadingScore DESC LIMIT 5
SELECT T2.EdOpsName FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT AVG(AvgScrMath) AS AvgMathScore, T2.County FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY (T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite) ASC LIMIT 1
SELECT AVG(AvgScrWrite), T2.City FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE NumTstTakr >= 1500 GROUP BY T2.City ORDER BY COUNT(T1.NumTstTakr) DESC LIMIT 1
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School; 
SELECT T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.DOC = 31 ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT COUNT(CASE WHEN STRFTIME('%Y', OpenDate) = '1980' THEN CDSCode END) / 12 AS AvgMonthly FROM schools WHERE County = 'Alameda' AND DOC = 52
SELECT SUM(CASE WHEN T1.DOC = 54 THEN 1 ELSE 0 END) / SUM(CASE WHEN T1.DOC = 52 THEN 1 ELSE 0 END) AS Ratio FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Orange'; 
SELECT T1.County, T2.School, T2.ClosedDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T1.County ORDER BY COUNT(T2.School) DESC LIMIT 1
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 6, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(*)  FROM schools AS s  JOIN satscores AS ss ON s.CDSCode = ss.cds  WHERE (ss.AvgScrRead + ss.AvgScrMath + ss.AvgScrWrite) >= 1500 AND s.MailCity = 'Lakeport'; 
SELECT SUM(NumTstTakr) FROM satscores WHERE cds IN ( SELECT CDSCode FROM schools WHERE MailCity = 'Fresno' )
SELECT T1.School, T1.MailZip FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Avetik' AND T1.AdmLName1 = 'Atoian'
SELECT CAST(SUM(CASE WHEN T1.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools AS T1 WHERE T1.MailState = 'CA'; 
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active'; 
SELECT T2.Phone, T2.Ext FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 332, 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez'
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin'
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T2.Charter = 0 AND (T1.`Free Meal Count (K-12)` * 100 / T1.`Enrollment (K-12)`) < 0.18; 
SELECT T1.AdmFName1, T1.AdmLName1, T1.School, T1.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T1.CharterNum = '00D2'; 
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';
SELECT      (COUNT(CASE WHEN T2.FundingType = 'Locally Funded' THEN T1.CDSCode END) / COUNT(T1.CDSCode)) * 100 AS LocalFundedPercentage FROM      frpm AS T1 JOIN      schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE      T2.County = 'Santa Clara'; 
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'; 
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND StatusType = 'Community College District' AND strftime('%Y', ClosedDate) = '1989';
SELECT County FROM schools WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT NCESDist FROM schools WHERE SOC = '31'
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND (StatusType = 'Active' OR StatusType = 'Closed') AND DOCType = 'Community Day'; 
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0 LIMIT 1
SELECT SUM(`Enrollment (Ages 5-17)`) AS TotalStudents FROM `frpm` JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode` WHERE `schools`.`School` = 'State Special School' AND `schools`.`City` = 'Fremont' AND `frpm`.`Academic Year` = '2014-15'; 
SELECT T1.`Free Meal Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority School' AND T2.MailStreet = 'PO Box 1040'
SELECT MIN(LowGrade) FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE NCESDist = '0613360' AND EdOpsCode = 'SPECON')
SELECT T1.School, T1.GSoffered FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`NSLP Provision Status` = 'Breakfast Provision 2' AND T2.`County Code` = '37'
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.EducationalOptionType = 'Lunch Provision 2' AND T1.LowGrade = '9' AND T1.HighGrade = '12' AND T2.County = 'Merced' AND T2.EILCode = 'HS'; 
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)` * 100) AS "Percent (%) Eligible FRPM (Ages 5-17)" FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.HighGrade = '9' AND s.County = 'Los Angeles'; 
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F'
SELECT T1.School, T1.Latitude, T1.Longitude FROM schools AS T1 ORDER BY T1.Latitude DESC LIMIT 1
SELECT T1.City, T2.LowGrade, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' ORDER BY T1.Latitude ASC LIMIT 1
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.City) AS NumberOfCities, COUNT(T1.CDSCode) AS TotalSchools FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Magnet = 1 AND T1.GSoffered LIKE '%K-8%' AND T2.`NSLP Provision Status` = 'Multiple Provision Types'; 
SELECT T1.AdmFName1, T2.District FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T1.AdmFName1 ORDER BY COUNT(T1.AdmFName1) DESC LIMIT 2
SELECT T2.`Percent (%) Eligible Free (K-12)`, T2.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`AdmFName1` = 'Alusine'
SELECT T1.AdmLName1, T1.District, T1.County, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterNum = '40'; 
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54); 
SELECT T2.AdmEmail1, T1.Sname FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT COUNT(DISTINCT T2.account_id) FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.type = 'gold' AND T3.frequency = 'POPLATEK PO OBRATU' AND T3.district_id IN (     SELECT district_id     FROM district     WHERE A3 LIKE '%Východní Böhemia%' ); 
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%Prague%'
SELECT CASE WHEN AVG(A12) > AVG(A13) THEN '1995' ELSE '1996' END AS higher_unemployment_rate FROM district
SELECT COUNT(*) FROM district WHERE A11 BETWEEN 6000 AND 10000
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A3 LIKE '%North Bohemia%' AND T2.A11 > 8000
WITH FemaleClients AS (     SELECT client_id, AVG(A11) AS avg_salary     FROM client     JOIN district ON client.district_id = district.district_id     WHERE gender = 'F'     GROUP BY client_id ), RankedSalaries AS (     SELECT client_id, avg_salary,            RANK() OVER (ORDER BY avg_salary ASC) AS rank_asc,            RANK() OVER (ORDER BY avg_salary DESC) AS rank_desc     FROM FemaleClients ) SELECT MIN(avg_salary) AS min_avg_salary, MAX(avg_salary) AS max_avg_salary,         (MAX(avg_salary) - MIN(avg_salary)) AS gap FROM RankedSalaries; 
SELECT T1.account_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id GROUP BY T1.account_id ORDER BY AVG(T2.birth_date) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.client_id) FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK TYDNE' AND T1.type = 'OWNER'
SELECT T1.client_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK PO OBRATU' AND T1.type = 'DISPONENT'
SELECT account_id FROM loan WHERE STRFTIME('%Y', date) = '1997' ORDER BY amount ASC LIMIT 1; 
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 12 AND strftime('%Y', T1.date) = '1993' ORDER BY T2.amount DESC LIMIT 1
SELECT COUNT(DISTINCT c.client_id) FROM client AS c JOIN district AS d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolow'; 
SELECT account_id FROM trans WHERE date LIKE '1995%' ORDER BY date ASC LIMIT 1
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T2.amount > 3000
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.issued = '1994-03-03'
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.`date` = '1998-10-14'; 
SELECT T1.district_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'
SELECT MAX(T1.amount) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN card AS T4 ON T3.client_id = T4.disp_id WHERE T4.issued = '1996-10-21'
SELECT T1.gender FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id ORDER BY T1.birth_date ASC, T4.A11 DESC LIMIT 1
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.account_id IN (     SELECT l.account_id     FROM loan l     ORDER BY l.amount DESC     LIMIT 1 ) ORDER BY t.date LIMIT 1; 
SELECT COUNT(client_id) FROM client WHERE gender = 'F' AND district_id IN ( SELECT district_id FROM district WHERE A2 LIKE '%Jesenik%' )
SELECT T1.disp_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND STRFTIME('%Y-%m-%d', T3.date) = '1998-09-02'
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND date LIKE '1996%'; 
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T2.birth_date = '1976-01-29'
SELECT T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND T4.date LIKE '1996%'
SELECT T2.account_id FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'Prague' ORDER BY T2.date ASC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%Jihomoravský kraj%' ORDER BY SUM(T2.A4) DESC LIMIT 1; 
SELECT ((T2.balance - T3.balance) / T3.balance) * 100 AS increase_rate FROM loan AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T1.date = '1993-07-05' AND T2.date = '1993-03-22' AND T3.date = '1998-12-27'
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000
SELECT T2.account_id, T4.A2, T4.A3 FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T1.account_id = T3.account_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T3.date LIKE '1993%' AND T1.frequency = 'POPLATEK PO OBRATU' 
SELECT T2.account_id, T2.frequency FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 LIKE '%east Bohemia%' AND T2.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T3.A2, T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990
SELECT T1.account_id, T2.A2, T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 300000; 
SELECT T1.loan_id ,  T2.A3 ,  AVG(T3.salary) FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id INNER JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id, T2.A3
SELECT T1.A12 ,  T1.A13 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'D'
SELECT CAST(SUM(CASE WHEN T1.district_id = ( SELECT district_id FROM district WHERE A2 = 'Decin' ) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.district_id ORDER BY COUNT(T2.client_id) DESC LIMIT 9
SELECT T1.A2, SUM(T3.amount) AS total_withdrawals FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ' AND T3.date LIKE '1996-01%' GROUP BY T1.A2 ORDER BY total_withdrawals DESC LIMIT 10
SELECT COUNT(account_id) FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A3 = 'South Bohemia' ) AND account_id NOT IN ( SELECT account_id FROM card )
SELECT T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status IN ('C', 'D') GROUP BY T1.district_id ORDER BY COUNT(T3.loan_id) DESC LIMIT 1
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M'
SELECT T1.A2, T1.A16 FROM district AS T1 WHERE T1.A13 = ( SELECT MAX(A13) FROM district )
SELECT COUNT(*) FROM account WHERE district_id = ( SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1 )
SELECT COUNT(DISTINCT T1.account_id)  FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  WHERE T1.operation = 'VYBER KARTOU' AND T2.frequency = 'POPLATEK MESICNE' AND T1.balance < 0; 
SELECT COUNT(*) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T1.amount >= 250000 AND T2.frequency = 'POPLATEK MESICNE' AND T1.status = 'A'
SELECT COUNT(*) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM account WHERE district_id = 1); 
SELECT COUNT(*) FROM client WHERE district_id IN ( SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1, 1 ) AND gender = 'M'
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek'
SELECT T2.A2 FROM trans AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 10000 AND STRFTIME('%Y', T1.date) = '1997' GROUP BY T2.A2
SELECT T1.account_id FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = ( SELECT district_id FROM district WHERE A3 = 'Pisek' ) AND T1.k_symbol = 'SIPO'
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'
SELECT AVG(amount) FROM trans WHERE date LIKE '2021%' AND type = 'VÝBER KARTOU';
SELECT T1.account_id FROM trans AS T1 WHERE T1.operation = 'VYBER KARTOU' AND T1.amount < ( SELECT AVG(amount) FROM trans WHERE STRFTIME('%Y', date) = '1998' )
SELECT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE c.gender = 'F' AND EXISTS ( SELECT 1 FROM card WHERE disp_id = d.disp_id ) AND EXISTS ( SELECT 1 FROM loan WHERE account_id = a.account_id )
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%south Bohemia%'
SELECT T1.account_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'OWNER' AND T3.A2 = 'Tabor'
SELECT DISTINCT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.type != 'OWNER' AND T3.district_id IN ( SELECT district_id FROM client GROUP BY district_id HAVING AVG(A11) BETWEEN 8000 AND 9000 )
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 LIKE '%North Bohemia%' AND T1.bank = 'AB'
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ' GROUP BY T1.A2
SELECT AVG(T1.A15) AS avg_crimes FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND T2.date >= '1997-01-01'; 
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'
SELECT COUNT(client_id) FROM client WHERE gender = 'M' AND district_id IN ( SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha' )
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card
SELECT T2.client_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'OWNER' ORDER BY T1.amount DESC LIMIT 1
SELECT T2.A15 FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532 AND T2.A15 IS NOT NULL
SELECT T1.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.account_id IN ( SELECT account_id FROM order WHERE order_id = 33333 )
SELECT T1.amount FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER' AND T2.account_id IN ( SELECT account_id FROM disp WHERE client_id = 3356 )
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000
SELECT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 13539
SELECT T1.A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541
SELECT T1.district_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(T2.loan_id) DESC LIMIT 1
SELECT client_id FROM disp WHERE account_id = ( SELECT account_id FROM order WHERE order_id = 32423 )
SELECT T1.trans_id, T1.date, T1.type, T1.operation, T1.amount, T1.balance, T1.k_symbol, T1.bank, T1.account FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 5
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A3 = 'Jesenik' )
SELECT T1.client_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'junior' AND T2.issued >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.date BETWEEN ( SELECT MIN(date) FROM account ) AND ( SELECT MAX(date) FROM account ) GROUP BY T1.district_id HAVING AVG(T2.A11) > 10000
SELECT ((SUM(CASE WHEN strftime('%Y', T2.date) = '1997' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END)) * 100 AS growth_rate FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'
SELECT SUM(CASE WHEN T1.A3 = 'Východní' THEN T1.A16 ELSE 0 END) - SUM(CASE WHEN T1.A3 = 'Severozápadní' THEN T1.A16 ELSE 0 END) AS crime_difference FROM district AS T1; 
SELECT type, COUNT(*) AS count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type; 
SELECT COUNT(*) FROM trans WHERE account_id = 3 AND type = 'VYBER' AND amount = 3539;
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.disp_id = 130
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'OWNER' AND T1.frequency = 'POPLATEK PO OBRATU'; 
SELECT SUM(T1.amount) FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 992 AND T1.status != 'A'
SELECT SUM(t.amount), c.gender FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE t.trans_id = 851 AND c.client_id = 4; 
SELECT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 9
SELECT SUM(amount) FROM trans WHERE account_id IN ( SELECT account_id FROM disp WHERE client_id = 617 ) AND date LIKE '1998%'
SELECT T1.client_id FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T2.A8 LIKE '%Východní%Bohumin%'
SELECT T1.client_id FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'M' AND T1.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T3.type = 'VYBER' AND T3.amount > 4000 AND T3.k_symbol = 'SIPO'
SELECT COUNT(account_id) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Beroun' AND T1.date > '1996-12-31'
SELECT COUNT(DISTINCT d.client_id) FROM disp AS d JOIN client AS c ON d.client_id = c.client_id JOIN card AS ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.district_id IN ( SELECT district_id FROM district WHERE A3 LIKE '%Prague%' )
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id WHERE T2.frequency = 'POPLATEK TYDNE'
SELECT COUNT(*) FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK TYDNE'
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T3.birth_date) ASC, SUM(T1.district_id * T1.frequency) DESC LIMIT 1
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.birth_date) = '1920' AND T2.A3 LIKE '%east Bohemia%'
SELECT COUNT(*) FROM account AS A JOIN loan AS L ON A.account_id = L.account_id WHERE L.duration = 24 AND A.frequency = 'POPLATEK TYDNE'; 
SELECT AVG(amount) FROM loan WHERE status IN ('C', 'D') AND date > ( SELECT MAX(date) FROM trans )
SELECT T1.client_id ,  T1.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER'
SELECT T1.client_id ,  julianday('now') - julianday(T1.birth_date) AS age FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold' AND T2.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.molecule_id) AS count_chlorine_atoms FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'; 
SELECT AVG(CASE WHEN T2.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id IN ( SELECT bond_id FROM bond WHERE bond_type = '-' )
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) / COUNT(T2.atom_id) FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.element IN ('cl', 'c') AND T1.molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' )
SELECT COUNT(*) FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+'
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' GROUP BY T1.molecule_id
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'
SELECT DISTINCT T3.element FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '='
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'h' GROUP BY T1.label ORDER BY COUNT(T1.label) DESC LIMIT 1
SELECT DISTINCT T1.bond_type FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-'
SELECT T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T2.element ORDER BY COUNT(T2.element) ASC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8')
SELECT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element = 'sn' )
SELECT COUNT(DISTINCT atom_id) FROM atom WHERE element IN ('i', 's') AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-') 
SELECT T1.atom_id, T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR181'
SELECT CAST(COUNT(DISTINCT CASE WHEN T1.element = 'f' THEN T2.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT CAST(SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR000' GROUP BY T1.element ORDER BY T1.element ASC LIMIT 3
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_6' AND T1.molecule_id = 'TR001'
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' ORDER BY T1.label ASC LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS "percent" FROM molecule
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM atom WHERE molecule_id = 'TR206'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT T1.element, T3.label FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.molecule_id = 'TR060'; 
SELECT T1.bond_type ,  CASE WHEN T2.label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR010' GROUP BY T1.bond_type ORDER BY COUNT(T1.bond_type) DESC LIMIT 1
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_type) >= 3 ORDER BY T1.label LIMIT 3
SELECT T1.bond_type FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR006' ORDER BY T1.bond_type ASC LIMIT 2
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR009_12' OR atom_id2 = 'TR009_12';
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'
SELECT T1.bond_type, T2.atom_id, T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR001_6_9'
SELECT T1.label, CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10'; 
SELECT COUNT(*) FROM bond WHERE bond_type = '#';
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19'; 
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T2.atom_id, 7, 2) BETWEEN '21' AND '25' AND T1.label = '+'
SELECT DISTINCT T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id INNER JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE (T3.element = 'p' AND T4.element = 'n') OR (T3.element = 'n' AND T4.element = 'p')
SELECT m.label, COUNT(b.bond_id) AS double_bonds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' AND m.label = '+' GROUP BY m.molecule_id ORDER BY double_bonds DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.element = 'i' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id
SELECT T2.bond_type, T1.bond_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T1.atom_id2, 7, 2) AS INT) = 45
SELECT element FROM atom WHERE atom_id NOT IN ( SELECT atom_id FROM connected )
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT element FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.atom_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'pb'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT CAST(COUNT(*) AS REAL) * 100 / ( SELECT MAX(cnt) FROM ( SELECT COUNT(atom_id) AS cnt FROM connected GROUP BY atom_id ) ) AS percentage FROM bond JOIN connected ON bond.bond_id = connected.bond_id; 
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')
SELECT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'sn'
SELECT COUNT(DISTINCT T3.element) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.bond_type = '-'
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.bond_type = '#' AND (T1.element = 'p' OR T1.element = 'br')
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '-'
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM atom WHERE element = 'i'
SELECT MAX(T1.label) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca'
SELECT CASE WHEN EXISTS ( SELECT 1 FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM connected WHERE bond_id = 'TR001_1_8' ) AND element = 'cl' ) AND EXISTS ( SELECT 1 FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM connected WHERE bond_id = 'TR001_1_8' ) AND element = 'c' ) THEN 'Yes' ELSE 'No' END AS result
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-' AND EXISTS ( SELECT 1 FROM atom AS T3 WHERE T3.molecule_id = T1.molecule_id AND T3.element = 'c' ) LIMIT 2
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR001'; 
SELECT molecule_id FROM bond WHERE bond_type = '= '
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_10_11'
SELECT T1.bond_id ,  CASE WHEN T2.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS Carcinogenicity FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '+'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id LIKE '%4' AND T2.label = '+' GROUP BY T1.element
SELECT CAST(COUNT(CASE WHEN T1.element = 'h' THEN 1 ELSE NULL END) AS REAL) / COUNT(T1.element), T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' AND T2.label IN ('+', '-')
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'; 
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'c'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'; 
SELECT CAST(SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CAST(SUM(CASE WHEN T1.bond_type = ' = ' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR047'; 
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1' AND T1.label = '+'
SELECT CASE WHEN EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR151' AND label = '+') THEN 'Yes' ELSE 'No' END AS is_carcinogenic; 
SELECT element FROM atom WHERE molecule_id = 'TR151'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR010' AND 'TR050' AND T1.element = 'c'
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+'); 
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '='
SELECT COUNT(*) FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'h'; 
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T3.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2'
SELECT atom_id FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label != '-' ) AND element = 'c'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CASE WHEN EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR124' AND label = '+') THEN 'Yes' ELSE 'No' END AS is_carcinogenic; 
SELECT element FROM atom WHERE molecule_id = 'TR186'; 
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'
SELECT COUNT(*) AS double_bonds, CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.molecule_id = 'TR006'
SELECT T1.label, T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IN ('cl', 'c', 'h')
SELECT T1.bond_id, T2.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*) FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'cl'
SELECT T1.atom_id ,  COUNT(DISTINCT T2.bond_type) FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR346'
SELECT COUNT(DISTINCT b.molecule_id) AS double_bond_molecules, SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_double_bond_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '='; 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element != 's' AND T4.bond_type != '='
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4' AND T1.label = '+'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' AND T2.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label != '-'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_3_4'
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2') OR (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_1')
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4') GROUP BY T1.label
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 WHERE T1.molecule_id = 'TR000'
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+'
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '='; 
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.label HAVING COUNT(T2.atom_id) > 5; 
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR024' AND T3.bond_type = '='
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.label ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.element = 'h' AND T3.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-'); 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.element = 'o' AND T3.bond_type = ' = '
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-'; 
SELECT T1.element ,  T3.bond_type FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR002' AND T3.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR012' AND T1.element = 'c' AND T3.bond_type = ' = '
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT name FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT name FROM cards WHERE faceConvertedManaCost = ( SELECT MAX(faceConvertedManaCost) FROM cards )
SELECT name FROM cards WHERE frameVersion = 2015 AND edhrecRank < 100
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.format = 'gladiator' AND T2.status = 'Banned'
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.types = 'Artifact' AND T2.side IS NULL AND T1.format = 'vintage'
SELECT T1.id, T1.artist FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE (T1.power = '*' OR T1.power IS NULL) AND T2.format = 'commander' AND T2.status = 'Legal'
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel'; 
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.id ORDER BY COUNT(T2.uuid) DESC LIMIT 1
SELECT T2.language FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Annul' AND T1.number = '29' GROUP BY T2.language
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese' AND T1.hasAlternativeDeckLimit = 1
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM foreign_data
SELECT T2.name, SUM(T1.totalSetSize) AS total_cards FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' GROUP BY T2.setCode
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE power = '*';
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT T3.language FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0; 
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Condemn'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Restricted' AND T1.isStarter = 1
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'
SELECT T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.isReprint = 1
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'borderless' AND T2.language = 'Russian'
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1
SELECT COUNT(*) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'; 
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'
SELECT T1.uuid, T2.language FROM legalities AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'legacy' AND T2.language != 'English'
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'
SELECT COUNT(DISTINCT c.uuid) AS card_count, l.status AS legality_status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal'; 
SELECT c.name, c.colors FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.code = 'OGW'; 
SELECT T2.name, T3.language FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode INNER JOIN set_translations AS T3 ON T1.code = T3.setCode WHERE T1.code = '10E' AND T2.convertedManaCost = 5
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf'; 
SELECT T1.colors, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20;
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' AND T2.language IS NOT NULL
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3; 
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND hasFoil = 1 AND cardKingdomFoilId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1; 
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability LIKE '%paper%' AND availability LIKE '%mtgo%'
SELECT SUM(convertedManaCost) FROM cards WHERE artist = 'Rob Alexander'
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena'
SELECT DISTINCT T1.setCode FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0
SELECT T1.name , CAST(SUM(CASE WHEN T2.language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid GROUP BY T1.name
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 309
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Português (Brasil)' AND T1.block = 'Commander'
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN ( SELECT uuid FROM legalities WHERE status = 'Legal' )
SELECT DISTINCT T2.subtypes, T2.supertypes FROM set_translations AS T1 INNER JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.language = 'German' AND T2.subtypes IS NOT NULL AND T2.supertypes IS NOT NULL
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards WHERE uuid IN ( SELECT uuid FROM legalities WHERE format = 'premodern' ) AND uuid NOT IN ( SELECT uuid FROM cards WHERE side IS NOT NULL ) AND uuid IN ( SELECT uuid FROM rulings WHERE text = 'This is a triggered mana ability.' )
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Erica Yang' AND T2.format = 'pauper' AND T1.availability = 'paper'
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.text LIKE '%perfekte Gegenmittel zu einer dichten Formation%'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French' AND T1.type = 'Creature' AND T1.layout = 'normal' AND T1.borderColor = 'black' AND T1.artist = 'Matthew D. Wilson'; 
SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'; 
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ravnica' AND T1.baseSetSize = 180
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'legal'
SELECT CAST(SUM(CASE WHEN T1.language = 'French' AND (T2.power IS NULL OR T2.power = '*') THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.power IS NULL OR T2.power = '*' THEN 1 ELSE 0 END) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.power IS NULL OR T2.power = '*'; 
SELECT CAST(SUM(CASE WHEN T1.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'expansion'
SELECT DISTINCT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000; 
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1; 
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arena%' ORDER BY name LIMIT 3
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.multiverseid = 149934
SELECT uuid FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3
SELECT DISTINCT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.mcmName = 'Archenemy' AND T2.code = 'ARC'
SELECT sets.name, set_translations.translation FROM sets JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.id = 5; 
SELECT T1.language, T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.id = 206
SELECT T1.id FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' ORDER BY T1.name LIMIT 2
SELECT T1.id FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.set_code WHERE T1.isForeignOnly = 1 AND T2.language = 'Japanese' AND T1.isFoilOnly = 1
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isOnlineOnly = 1
SELECT COUNT(*) FROM set_translations WHERE language = 'Japanese' AND setCode NOT IN ( SELECT code FROM sets WHERE mtgoCode IS NOT NULL OR mtgoCode != '' )
SELECT id FROM cards WHERE borderColor = 'black'
SELECT id FROM cards WHERE frameEffects = 'extendedart'
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174
SELECT T1.name FROM sets AS T1 WHERE T1.code = 'ALL'
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage'); 
SELECT code FROM sets WHERE type = 'expansion'
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Boros'
SELECT T2.language, T2.flavorText, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'
SELECT code FROM sets WHERE type = 'expansion' AND code IN ( SELECT uuid FROM legalities WHERE format = 'commander' )
SELECT T2.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'
SELECT T2.language, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Azorius' LIMIT 1
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'White' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'Black' AND availability LIKE '%arena,mtgo%'
SELECT CASE WHEN T1.convertedManaCost > T2.convertedManaCost THEN T1.name ELSE T2.name END AS card_with_more_converted_mana FROM cards AS T1 JOIN cards AS T2 ON T1.id <> T2.id WHERE T1.name = 'Serra Angel' AND T2.name = 'Shrine Keeper'
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT COUNT(*) FROM set_translations WHERE setCode IN ( SELECT setCode FROM cards WHERE name = 'Angel of Mercy' )
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T3.setCode = T1.setCode WHERE T3.translation = 'Hauptset Zehnte Edition'
SELECT EXISTS(SELECT 1 FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND language = 'Korean')
SELECT COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT EXISTS (     SELECT 1     FROM sets s     JOIN cards c ON s.code = c.setCode     WHERE c.name = 'Angel of Mercy'       AND s.mtgoCode IS NOT NULL ) 
SELECT T.releaseDate FROM sets AS T JOIN cards AS C ON T.code = C.setCode WHERE C.name = 'Ancestor''s Chosen'
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(DISTINCT T1.setCode) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.block = 'Ice Age' AND T1.language = 'Italian' AND T1.translation IS NOT NULL
SELECT T1.isForeignOnly FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Adarkar Valkyrie'
SELECT COUNT(DISTINCT s.id) FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100
SELECT COUNT(*) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.borderColor = 'black'
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE setCode = ( SELECT code FROM sets WHERE name = 'Coldsnap' ) AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT number FROM cards WHERE setCode = ( SELECT code FROM sets WHERE name = 'Coldsnap' ) AND number = 4
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T2.setCode = T3.setCode WHERE T3.language = 'Italian' AND T3.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') 
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.language = 'Italian' ORDER BY T2.releaseDate DESC LIMIT 1
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode = 'Coldsnap'; 
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT TYPE FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_or_degraded_properties FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'; 
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'
SELECT SUM(T1.baseSetSize) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Tendo Ice Bridge' AND T2.language = 'French'
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Tenth Edition' AND T2.translation IS NOT NULL
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese'
SELECT name FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name LIKE 'Journey into Nyx Hero%s Path' ) ORDER BY convertedManaCost DESC LIMIT 1
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3; 
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Portuguese (Brazil)'
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'; 
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1; 
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY T1.convertedManaCost DESC LIMIT 10
SELECT T1.originalReleaseDate, GROUP_CONCAT(DISTINCT T2.format) AS legal_formats FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' ORDER BY T1.originalReleaseDate ASC LIMIT 1
SELECT COUNT(DISTINCT T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'; 
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Abundance' AND T1.types = 'Enchantment' AND T1.rarity = 'Rare' AND T2.status = 'Legal'
SELECT T.format, GROUP_CONCAT(T1.name) FROM legalities AS T JOIN cards AS T1 ON T.uuid = T1.uuid WHERE T.status = 'Banned' GROUP BY T.format ORDER BY COUNT(T.status = 'Banned') DESC LIMIT 1
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Battlebond'
SELECT artist, GROUP_CONCAT(DISTINCT format) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = '1997' AND T2.artist = 'D. Alexander Gregory' AND T2.hasContentWarning = 1 AND T1.format = 'legacy'
SELECT c.name, l.format FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'
SELECT AVG(T2.id), T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T1.language ORDER BY COUNT(T1.language) DESC LIMIT 1; 
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena' GROUP BY artist
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC
SELECT T2.name ,  T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T2.setCode = T3.code WHERE T3.name = 'Hour of Devastation' AND T1.status = 'Legal'
SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language LIKE '%Korean%' AND T2.language NOT LIKE '%Japanese%'
SELECT T1.frameVersion FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned'
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(Id) FROM users WHERE Upvotes > 100 AND Downvotes > 1
SELECT COUNT(*) FROM users WHERE CreationDate > '2013-01-01' AND Views > 10
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'; 
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T2.FavoriteCount DESC LIMIT 1
SELECT SUM(T2.CommentCount) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT MAX(T1.AnswerCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT Body FROM posts WHERE Id = ( SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian' )
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.Count = ( SELECT MAX(Count) FROM tags )
SELECT COUNT(*) FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE u.DisplayName = 'csgillespie'
SELECT Name FROM badges WHERE UserId = ( SELECT Id FROM users WHERE DisplayName = 'csgillespie' )
SELECT COUNT(*) FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'csgillespie' AND STRFTIME('%Y', b.Date) = '2011'; 
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1)
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.DisplayName) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'; 
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'
SELECT T2.Title FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score = ( SELECT MAX(Score) FROM comments )
SELECT CommentCount FROM posts WHERE ViewCount = 1910; 
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0'; 
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ParentId = 107829 AND CommentCount = 1) LIMIT 1
SELECT p.ClosedDate IS NULL AS IsWellFinished FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'; 
SELECT Reputation FROM users WHERE Id = ( SELECT OwnerUserId FROM posts WHERE Id = 65041 )
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini'; 
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms')
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN votes ON posts.Id = votes.PostId WHERE posts.OwnerUserId = 24; 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17; 
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'; 
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93!'; 
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion'; 
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Necromancer' LIMIT 10
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data?'
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'
SELECT SUM(T2.Score), T1.WebsiteUrl FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T1.DisplayName = 'Yevgeny'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%' AND T2.VoteTypeId = 8
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T1.PostId = T3.Id WHERE T1.BountyAmount = 50 AND T3.Title LIKE '%variance%'
SELECT AVG(T1.ViewCount), T1.Title, T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Tags LIKE '%<humor>%' GROUP BY T1.Title, T2.Text
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT OwnerUserId FROM posts ORDER BY ViewCount ASC LIMIT 1
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5
SELECT COUNT(DISTINCT b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York'
SELECT u.DisplayName, u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Id = 1
SELECT UserId FROM posts WHERE PostId IN ( SELECT PostId FROM postHistory GROUP BY PostId HAVING COUNT(PostId) = 1 ) AND Views >= 1000
SELECT u.DisplayName, b.Name FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE u.Id IN ( SELECT c.UserId FROM comments AS c GROUP BY c.UserId ORDER BY COUNT(c.Id) DESC LIMIT 1 )
SELECT COUNT(*) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'; 
SELECT      ((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(*)) -       (SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(*))) * 100 AS PercentageDifference FROM badges WHERE Name = 'Student'; 
SELECT PostHistoryTypeId ,  COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId
SELECT p.Id, p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;
SELECT Id, OwnerUserId FROM posts WHERE Score > 60; 
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND STRFTIME('%Y', CreaionDate) = '2011'
SELECT AVG(T1.UpVotes) ,  AVG(T2.Age) FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId HAVING COUNT(T1.PostId) > 10
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'; 
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE Score > 60; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10; 
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT T2.Reputation FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'
SELECT DISTINCT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'; 
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM badges
SELECT CAST(SUM(CASE WHEN T1.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT SUM(Score) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CreationDate = '2010-07-19 19:19:56.0')
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'; 
SELECT Age FROM users WHERE Location = 'Vienna, Austria' AND Id IN (SELECT UserId FROM badges)
SELECT COUNT(b.UserId) AS AdultSupporters FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65; 
SELECT SUM(u.Views) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'; 
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId ORDER BY T1.Reputation ASC LIMIT 1
SELECT Name FROM badges WHERE UserId = ( SELECT Id FROM users WHERE DisplayName = 'Sharpie' )
SELECT COUNT(b.Id) AS NumberOfEldersWithSupporterBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65; 
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(*) FROM users WHERE Location = 'New York'; 
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) AS Ratio FROM votes
SELECT T1.TagName FROM tags AS T1 INNER JOIN posts_tags AS T2 ON T1.Id = T2.TagId INNER JOIN posts AS T3 ON T2.PostId = T3.Id INNER JOIN users AS T4 ON T3.OwnerUserId = T4.Id WHERE T4.DisplayName = 'John Salvatier'
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Daniel Vassallo'
SELECT COUNT(*) FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1
SELECT p.Title, p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY p.ViewCount DESC LIMIT 1; 
SELECT COUNT(DISTINCT p.Id) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id JOIN votes AS v ON p.Id = v.PostId WHERE u.DisplayName = 'Matt Parker' AND v.VoteTypeId = 2 AND v.BountyAmount > 4
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60; 
SELECT DISTINCT T2.TagName FROM users AS T1 INNER JOIN posts AS T3 ON T1.Id = T3.OwnerUserId INNER JOIN posthistory AS T4 ON T3.Id = T4.PostId INNER JOIN tags AS T2 ON T3.Tags LIKE '%' || T2.TagName || '%' WHERE T1.DisplayName = 'Mark Meckes' AND T3.CommentCount = 0
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T2.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.OwnerDisplayName) FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T1.OwnerDisplayName = 'Community'
SELECT SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS ViewCountDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id
SELECT COUNT(UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'
SELECT COUNT(*) FROM postLinks WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT DisplayName ,  Age FROM users ORDER BY Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60;
SELECT Name FROM badges WHERE STRFTIME('%Y', Date) = '2011' AND UserId IN (SELECT Id FROM users WHERE Location = 'North Pole')
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150
SELECT COUNT(*) AS PostHistoryCount, MAX(CreationDate) AS LastEditDate FROM postHistory WHERE PostId = (SELECT Id FROM posts WHERE Title = 'What is the best introductory Bayesian statistics textbook?')
SELECT T2.LastAccessDate ,  T2.Location FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Outliers'
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = ( SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' )
SELECT p.Id, b.Name FROM posts AS p INNER JOIN badges AS b ON p.OwnerUserId = b.UserId WHERE p.OwnerDisplayName = 'Samuel' AND YEAR(b.Date) = 2013
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1
SELECT T1.DisplayName, T1.Location FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN tags AS T3 ON T2.Id = T3.ExcerptPostId WHERE T3.TagName = 'hypothesis-testing'
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'What are principal component scores?'
SELECT T2.OwnerDisplayName FROM posts AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.ParentId ORDER BY T1.Score DESC LIMIT 1
SELECT DisplayName, WebsiteUrl FROM users WHERE Id IN (SELECT UserId FROM votes WHERE VoteTypeId = 8 ORDER BY BountyAmount DESC LIMIT 1)
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT Age FROM users WHERE Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE STRFTIME('%Y', v.CreationDate) = '2011' AND v.BountyAmount = 50
SELECT Id FROM users ORDER BY Age ASC LIMIT 1
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%' 
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN 1 ELSE 0 END) AS REAL) / 12 FROM postLinks
SELECT PostId FROM votes WHERE UserId = 1465 ORDER BY FavoriteCount DESC LIMIT 1
SELECT Title FROM posts WHERE Id = ( SELECT PostId FROM postLinks ORDER BY CreationDate ASC LIMIT 1 )
SELECT DisplayName FROM users WHERE Id = ( SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(Name) DESC LIMIT 1 )
SELECT MIN(T2.CreationDate) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'chl'
SELECT T2.CreationDate FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId ORDER BY T1.Age ASC, T2.CreationDate ASC LIMIT 1
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date ASC LIMIT 1
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4; 
SELECT AVG(PostId) FROM votes WHERE UserId IN ( SELECT Id FROM users ORDER BY Age DESC LIMIT 1 )
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', p.CreaionDate) = '2010'; 
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1
SELECT AVG(T2.Score) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Stephen Turner'
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreaionDate) = '2011'
SELECT Id, OwnerDisplayName FROM posts WHERE CreationDate LIKE '2010%' ORDER BY FavoriteCount DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE STRFTIME('%Y', T1.CreaionDate) = '2011'
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users
SELECT SUM(ViewCount), LastEditorDisplayName FROM posts WHERE Title = 'Computer Game Datasets' 
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts); 
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1) 
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT DisplayName, Location FROM users WHERE Id = ( SELECT LastEditorUserId FROM posts WHERE Id = 183 ORDER BY LastEditDate DESC LIMIT 1 )
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Zolomon'
SELECT COUNT(posts.Id) AS PostCount, COUNT(comments.Id) AS CommentCount FROM users JOIN posts ON users.Id = posts.OwnerUserId JOIN comments ON users.Id = comments.UserId WHERE users.CreationDate = (     SELECT MAX(CreationDate)     FROM users ); 
SELECT T2.Text, T3.DisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T2.UserId = T3.Id WHERE T1.Title = 'Analysing wind data with R' ORDER BY T2.CreationDate DESC LIMIT 10
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol'; 
SELECT COUNT(*) FROM tags WHERE TagName = 'careers'; 
SELECT Reputation, ViewCount FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT SUM(CASE WHEN p.PostTypeId = 1 THEN 1 ELSE 0 END) AS Answers,         SUM(CASE WHEN p.PostTypeId = 2 THEN 1 ELSE 0 END) AS Comments FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Clustering 1D data'; 
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30; 
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users); 
SELECT COUNT(*) FROM posts WHERE Score < 20; 
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT T1.Reputation, T1.UpVotes FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'fine, you win :)'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%linear regression%'
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount BETWEEN 100 AND 150) ORDER BY Score DESC LIMIT 1; 
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'; 
SELECT COUNT(DISTINCT PostId) FROM comments WHERE Score = 0 AND PostId IN (SELECT Id FROM posts WHERE ViewCount < 5); 
SELECT COUNT(*) FROM posts WHERE CommentCount = 1 AND Id IN ( SELECT PostId FROM comments WHERE Score = 0 )
SELECT COUNT(DISTINCT u.Id) AS TotalUsers FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40; 
SELECT p.Id, c.Text FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'
SELECT SUM(T1.UpVotes) AS TotalUpVotes FROM users AS T1 JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text LIKE '%R is also lazy evaluated.%'; 
SELECT T1.Text FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky'
SELECT T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.height_cm > 200
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T2.power_id) > 15
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.colour = 'Blue' AND T4.power_name = 'Agility'
SELECT s.superhero_name FROM superhero AS s JOIN colour AS e ON s.eye_colour_id = e.id WHERE e.colour = 'Blue' AND s.hair_colour_id = ( SELECT id FROM colour WHERE colour = 'Blond' )
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' GROUP BY T1.colour ORDER BY COUNT(T2.id) DESC
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT superhero_name FROM superhero WHERE id IN ( SELECT hero_id FROM hero_power WHERE power_id = ( SELECT id FROM superpower WHERE power_name = 'Super Strength' ) ) AND publisher_id = ( SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics' );
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics'
SELECT T.publisher_name FROM ( SELECT T3.publisher_name, MIN(T2.attribute_value) AS min_speed FROM hero_attribute AS T2 INNER JOIN superhero AS T1 ON T1.id = T2.hero_id INNER JOIN publisher AS T3 ON T3.id = T1.publisher_id WHERE T2.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Speed' ) GROUP BY T3.publisher_name ) AS T ORDER BY T.min_speed ASC LIMIT 1
SELECT COUNT(*) FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id JOIN publisher AS p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics'; 
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Intelligence' ) ORDER BY T1.attribute_value ASC LIMIT 1
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT superhero_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Durability') AND attribute_value < 50)
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.gender_id = 2 AND T3.attribute_name = 'Strength' AND T2.attribute_value = 100
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'
SELECT      CAST(COUNT(CASE WHEN T2.alignment = 'Bad' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) AS percentage_bad_alignment,     SUM(CASE WHEN T3.publisher_name = 'Marvel Comics' AND T2.alignment = 'Bad' THEN 1 ELSE 0 END) AS bad_alignment_marvel FROM      superhero AS T1 JOIN      alignment AS T2 ON T1.alignment_id = T2.id JOIN      publisher AS T3 ON T1.publisher_id = T3.id; 
SELECT SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(attribute_value) FROM hero_attribute;
SELECT COUNT(id) FROM superhero WHERE full_name IS NULL
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN gender AS T4 ON T1.gender_id = T4.id WHERE T4.gender = 'Male' LIMIT 5
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = 1
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT full_name FROM superhero WHERE race_id IN ( SELECT id FROM race WHERE race = 'Demi-God' ) LIMIT 5
SELECT COUNT(*) FROM superhero WHERE alignment_id = ( SELECT id FROM alignment WHERE alignment = 'Bad' ); 
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id INNER JOIN colour AS T3 ON T1.skin_colour_id = T3.id INNER JOIN race AS T4 ON T1.race_id = T4.id WHERE T1.height_cm = 185 AND T4.race = 'Human'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.publisher_id = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 WHERE T1.height_cm BETWEEN 150 AND 180
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero )
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination' AND T2.attribute_id = ( SELECT id FROM attribute WHERE attribute_name = 'Intelligence' )
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 1
SELECT COUNT(*) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Stealth'
SELECT T2.full_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T1.attribute_value DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.id) FROM superhero AS T1 LEFT JOIN colour AS T2 ON T1.skin_colour_id = T2.id
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id JOIN publisher AS p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT T2.colour AS eye_colour, T3.colour AS hair_colour, T4.colour AS skin_colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN colour AS T4 ON T1.skin_colour_id = T4.id INNER JOIN publisher AS T5 ON T1.publisher_id = T5.id WHERE T1.gender_id = 2 AND T5.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name, T3.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN T1.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT T1.superhero_name, T3.race FROM superhero AS T1 INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.full_name = 'Charles Chandler'
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T2.superhero_name = 'Agent 13'
SELECT superhero_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Adaptation'))
SELECT COUNT(power_id) FROM hero_power WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Amazo')
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Black' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Black' )
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T1.colour = 'Gold'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' AND T2.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute AS T2 INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' )
SELECT T2.race, T3.alignment FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' AND T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.publisher_name) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T3.id = T2.publisher_id
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS difference
SELECT AVG(height_cm) FROM superhero GROUP BY superhero_name
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.race_id = 21 AND T2.gender = 'Male'; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT T2.attribute_name, T1.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T1.hero_id = ( SELECT id FROM superhero WHERE superhero_name = '3-D Man' )
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Brown' )
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1
SELECT CAST(COUNT(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.superhero_name) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) FROM superhero WHERE gender_id IN (1, 2);
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0;
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.full_name = 'Helen Parr'
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38
SELECT T2.race FROM hero_attribute AS T1 INNER JOIN race AS T2 ON T1.hero_id = T2.id ORDER BY T1.attribute_value DESC LIMIT 1
SELECT T3.alignment, T5.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id INNER JOIN superpower AS T5 ON T2.power_id = T5.id WHERE T1.superhero_name = 'Atom IV'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5
SELECT AVG(T2.attribute_value) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3
SELECT T3.colour FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN colour AS T3 ON T2.skin_colour_id = T3.id WHERE T1.attribute_value = 100
SELECT COUNT(*) FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id JOIN alignment AS a ON s.alignment_id = a.id WHERE a.id = 1 AND g.id = 2; 
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT T3.race FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN race AS T3 ON T1.race_id = T3.id INNER JOIN colour AS T4 ON T1.hair_colour_id = T4.id WHERE T2.gender = 'Male' AND T4.colour = 'Blue'
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Bad'
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) AS diff FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL
SELECT T1.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength'
SELECT T2.power_name FROM superhero AS T1 INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T3.gender = 'Female' AND T2.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC
SELECT T4.gender FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id INNER JOIN gender AS T4 ON T3.gender_id = T4.id WHERE T1.power_name = 'Phoenix Force'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race_id != ( SELECT id FROM race WHERE race = 'Human' )
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' AND T2.attribute_value = 100
SELECT SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id
SELECT T1.attribute_name FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas'
SELECT CAST(SUM(CASE WHEN T2.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' 
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy' AND T2.attribute_id = 1
SELECT T1.weight_kg, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT T1.hero_id FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.height_cm > ( SELECT AVG(height_cm) * 0.8 FROM superhero )
SELECT T1.driverRef FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 20 ORDER BY T2.q1 DESC LIMIT 5
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 IS NOT NULL AND T2.raceid = 19 ORDER BY T2.q2 ASC LIMIT 1
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.location = 'Shanghai'
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Germany'
SELECT DISTINCT T1.position FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T2.name = 'Renault'
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2010 AND T2.country NOT IN ('Asia', 'Europe') AND T1.name LIKE '%Grand Prix%'
SELECT DISTINCT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = "Sepang International Circuit"
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix'
SELECT T3.country FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid INNER JOIN circuits AS T3 ON T1.raceid = T3.circuitid WHERE T1.points = 1 AND T1.raceid = 24
SELECT T1.q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 354 AND T2.forename = 'Bruno' AND T2.surname = 'Senna'
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 355 AND T2.q2 = '00:01:40'; 
SELECT driverid FROM qualifying WHERE raceid = 903 AND q3 LIKE '1:54%'
SELECT COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Bahrain Grand Prix' AND T2.year = 2007 AND T1.time IS NULL
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceid = 901
SELECT COUNT(DISTINCT driverid) FROM results WHERE raceid IN ( SELECT raceid FROM races WHERE date = '2015-11-29' ) AND statusid = 1
SELECT T1.driverid ,  T1.surname ,  T1.forename FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1
SELECT T1.url FROM drivers AS T1 INNER JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 161 AND T2.time LIKE '1:27%'
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 933 ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorResults AS T2 ON T1.constructorid = T2.constructorid WHERE T2.raceid = 9 ORDER BY T2.points DESC LIMIT 1
SELECT q1 FROM qualifying WHERE driverid = (SELECT driverid FROM drivers WHERE forename = "Lucas" AND surname = "di Grassi") AND raceid = 345;
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q2 = '00:01:15' AND T2.raceid = 347
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 45 AND T2.q3 LIKE '1:33%'
SELECT T2.time FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Bruce' AND T1.surname = 'McLaren' AND T2.raceid = 743
SELECT T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND T2.raceid IN ( SELECT raceid FROM races WHERE name = "San Marino Grand Prix" AND YEAR = 2006 )
SELECT T1.url FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceid = 901
SELECT COUNT(*) FROM results WHERE raceid = ( SELECT raceid FROM races WHERE date = '2015-11-29' ) AND statusid != 1
SELECT MIN(T1.dob) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 872
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 348 ORDER BY T2.milliseconds ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT ((T1.fastestLapSpeed - T2.fastestLapSpeed) / T1.fastestLapSpeed) * 100 AS Percentage FROM results AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 853 AND T2.raceId = 854 AND T1.driverId = ( SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta' )
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.date = '1983-07-16'; 
SELECT MIN(YEAR) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*) ,  name FROM races WHERE YEAR = 2005 ORDER BY name DESC
SELECT name FROM races WHERE date = ( SELECT MIN(date) FROM races )
SELECT name ,  date FROM races WHERE YEAR = 1999 ORDER BY round DESC LIMIT 1
SELECT YEAR FROM races GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM races WHERE YEAR != 2000 AND YEAR = 2017
SELECT T1.country, T1.name, T1.location FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = ( SELECT MIN(year) FROM races ) AND T1.country LIKE '%Europe%' LIMIT 1
SELECT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Brands Hatch' AND T1.name = 'British Grand Prix' ORDER BY T1.year DESC LIMIT 1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone' AND T1.name LIKE '%British Grand Prix%'
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year = 2010 AND T3.name = "Singapore Grand Prix" ORDER BY T2.position
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid ORDER BY T1.points DESC LIMIT 1
SELECT T1.driverid ,  T1.points FROM driverstandings AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = "Chinese Grand Prix" AND T2.year = 2017 ORDER BY T1.points DESC LIMIT 3
SELECT MIN(T1.milliseconds) ,  T2.forename ,  T2.surname ,  T3.name FROM laptimes AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid
SELECT AVG(l.milliseconds) FROM lapTimes l JOIN results r ON l.raceId = r.raceId AND l.driverId = r.driverId JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON l.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Malaysian Grand Prix' AND ra.year = 2009
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.year >= 2010
SELECT T1.driverid ,  T1.forename ,  T1.surname ,  T1.nationality ,  T2.points FROM drivers AS T1 INNER JOIN driverstandings AS T2 ON T1.driverid = T2.driverid GROUP BY T1.driverid ORDER BY COUNT(T2.wins) DESC LIMIT 1
SELECT forename, surname FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1
SELECT c.circuitid, c.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY c.circuitid HAVING COUNT(r.raceid) = 4; 
SELECT DISTINCT T2.name AS CircuitName, T2.location AS Location, T1.name AS RaceName FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2006 AND T2.country = 'USA'
SELECT T1.name, T3.name, T3.location FROM races AS T1 INNER JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE STRFTIME('%Y-%m', T1.date) = '2005-09'
SELECT T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid INNER JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Alex' AND T3.surname = 'Yoong' AND T2.position < 20
SELECT COUNT(*) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid INNER JOIN circuits AS T4 ON T3.circuitid = T4.circuitid WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' AND T4.name = 'Sepang International Circuit' AND T1.points = ( SELECT MAX(points) FROM results )
SELECT r.name, s.year FROM races r JOIN seasons s ON r.year = s.year JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestlapspeed DESC LIMIT 1; 
SELECT AVG(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T2.raceid IN ( SELECT raceid FROM races WHERE YEAR = 2000 )
SELECT T2.year, T1.points FROM driverstandings AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.year ASC LIMIT 1
SELECT T1.name ,  T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2017 ORDER BY T1.date
SELECT r.name, r.year, c.location, MAX(r.laps) AS max_laps FROM races r JOIN circuits c ON r.circuitid = c.circuitid GROUP BY r.raceid ORDER BY max_laps DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T2.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE lat = ( SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') )
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT T1.country FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid INNER JOIN results AS T3 ON T2.raceid = T3.raceid INNER JOIN drivers AS T4 ON T3.driverid = T4.driverid ORDER BY T4.dob ASC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T1.country = 'Spain' AND T2.name = 'Spanish Grand Prix'
SELECT DISTINCT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone'
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Silverstone"
SELECT T1.date FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Grand Prix' AND T1.year = 2010
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE country = 'Italy'
SELECT date FROM races WHERE circuitid = ( SELECT circuitid FROM circuits WHERE name = 'Barcelona-Catalunya' )
SELECT T1.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2009 AND T2.name LIKE '%Spanish%' LIMIT 1
SELECT MIN(T1.fastestLapTime) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed IS NOT NULL ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year = 2007 AND T3.name = 'Canadian Grand Prix' AND T2.position = 1
SELECT DISTINCT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T2.rank LIMIT 1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Spanish Grand Prix' AND T1.fastestlapspeed IS NOT NULL
SELECT DISTINCT YEAR FROM races WHERE raceid IN (SELECT raceid FROM results WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))
SELECT T1.positionOrder FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix' ORDER BY T1.milliseconds DESC LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.grid = 4 AND T2.raceid IN ( SELECT raceid FROM races WHERE year = 1989 AND name = "Australian Grand Prix" )
SELECT COUNT(*) FROM results WHERE raceid = ( SELECT raceid FROM races WHERE name = "Australian Grand Prix" AND YEAR = 2008 ) AND TIME IS NOT NULL
SELECT T1.fastestLapTime FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = ( SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008 ) AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Chinese Grand Prix' AND T1.position = 2
SELECT T1.forename, T1.surname, T1.url FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = ( SELECT raceid FROM races WHERE year = 2008 AND name = 'Australian Grand Prix' ) AND T2.position = 1
SELECT COUNT(*) FROM drivers AS d JOIN results AS r ON d.driverid = r.driverid JOIN races AS ra ON r.raceid = ra.raceid WHERE d.nationality = 'British' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix'
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN ( SELECT raceId FROM races WHERE YEAR = 2008 AND name = 'Chinese Grand Prix' ) AND TIME IS NOT NULL
SELECT SUM(points) FROM results WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(strftime('%M', fastestLapTime) * 60 + strftime('%S', fastestLapTime)) AS avgFastestLapTime FROM results INNER JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = "Australian Grand Prix"
SELECT ((strftime('%J', T1.time) - strftime('%J', T2.time)) / strftime('%J', T2.time)) * 100 AS percentage_faster FROM results AS T1 JOIN (     SELECT MIN(milliseconds) AS min_milliseconds     FROM results     WHERE raceid IN (         SELECT raceid         FROM races         WHERE year = 2008 AND name = 'Australian Grand Prix'     ) AND position = (         SELECT MAX(position)         FROM results         WHERE raceid IN (             SELECT raceid             FROM races             WHERE year = 2008 AND name = 'Australian Grand Prix'         )     ) ) AS T2 ON 1=1; 
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide';
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980'
SELECT MAX(T1.points) FROM constructorstandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T2.nationality = 'British'
SELECT name FROM constructors WHERE constructorid = (SELECT constructorid FROM constructorstandings ORDER BY points DESC LIMIT 1)
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 291 AND T1.points = 0
SELECT COUNT(*) FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'Japanese' AND T1.points = 0 GROUP BY T1.constructorId HAVING COUNT(T1.raceId) = 2
SELECT T1.name FROM constructors AS T1 INNER JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid WHERE T2.position = 1
SELECT COUNT(*) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = 'French' AND T2.position > 50
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL AND T2.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid INNER JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T3.nationality = 'Japanese'
SELECT AVG(REPLACE(T1.time, ':', '') * 1) / 1000 AS avg_time ,  T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.position = 1 AND T2.year < 1975 GROUP BY T2.year
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y',T1.dob) > '1975' AND T2.rank = 2
SELECT COUNT(*) FROM results WHERE driverid IN ( SELECT driverid FROM drivers WHERE nationality = 'Italian' ) AND statusid != 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptime ASC LIMIT 1
SELECT T1.fastestLap FROM results AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 AND T1.year = 2009
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds IS NOT NULL ORDER BY T2.milliseconds ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.year < 1985 AND T2.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverid) FROM seasons AS T1 INNER JOIN results AS T2 ON T1.year = T2.year WHERE T1.year BETWEEN 2000 AND 2005; 
SELECT COUNT(*) FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'French' AND T2.milliseconds < 120000
SELECT code FROM drivers WHERE nationality = 'America'
SELECT raceid FROM races WHERE YEAR = 2009
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18
SELECT driverid ,  count(*) FROM drivers WHERE nationality = 'Dutch' ORDER BY dob DESC LIMIT 3
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980';
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y',T1.dob) BETWEEN '1980' AND '1990' GROUP BY T1.driverid ORDER BY MIN(T2.milliseconds) ASC LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT T1.driverid, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE STRFTIME('%Y', T1.dob) = '1971' AND T2.fastestlaptime IS NOT NULL; 
SELECT T1.forename ,  T1.surname FROM drivers AS T1 INNER JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = "Spanish" AND STRFTIME('%Y',T1.dob) < '1982' ORDER BY T2.milliseconds DESC LIMIT 10
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlaptIME IS NOT NULL ORDER BY T2.fastestlaptIME ASC LIMIT 1
SELECT MIN(TIME) FROM laptimes
SELECT driverid FROM laptimes WHERE raceid = 1 AND lap = 1 ORDER BY TIME ASC LIMIT 5
SELECT COUNT(*) FROM results WHERE statusId = 2 AND raceId BETWEEN 50 AND 100 AND TIME IS NOT NULL
SELECT count(*) ,  LOCATION ,  lat ,  lng FROM circuits WHERE country = 'Austria' GROUP BY LOCATION ,  lat ,  lng
SELECT raceid FROM results WHERE TIME IS NOT NULL GROUP BY raceid ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.driverRef ,  T1.nationality ,  T1.dob FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 23 AND T2.q2 IS NOT NULL
SELECT T1.year, T1.name, T1.date FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid ORDER BY T2.driverid, T1.date ASC LIMIT 1
SELECT COUNT(*) FROM results AS T1 JOIN status AS T2 ON T1.statusid = T2.statusid WHERE T1.driverid IN ( SELECT driverid FROM drivers WHERE nationality = 'American' ) AND T2.status = 'Puncture';
SELECT c.name, c.url FROM constructors c JOIN constructorstandings cs ON c.constructorid = cs.constructorid WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1; 
SELECT T1.url FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid ORDER BY T2.wins DESC LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.lap = 3 AND T2.raceid IN ( SELECT raceid FROM races WHERE name = 'French Grand Prix' ) ORDER BY T2.milliseconds DESC LIMIT 1
SELECT T1.name FROM races AS T1 JOIN laptimes AS T2 ON T1.raceid = T2.raceid WHERE T2.position = 1 ORDER BY T2.milliseconds ASC LIMIT 1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2006 AND T1.name = "United States Grand Prix" AND T2.rank < 11
SELECT d.forename, d.surname FROM drivers AS d JOIN pitstops AS p ON d.driverid = p.driverid WHERE STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverid ORDER BY AVG(p.duration) ASC LIMIT 3
SELECT T2.driverid ,  T2.positiontext ,  T2.time FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Canadian Grand Prix' ORDER BY T2.points DESC LIMIT 1
SELECT T3.constructorRef, T3.url FROM races AS T1 INNER JOIN constructorStandings AS T2 ON T1.raceid = T2.raceid INNER JOIN constructors AS T3 ON T2.constructorid = T3.constructorid WHERE T1.year = 2009 AND T1.name = 'Singapore Grand Prix' ORDER BY T2.points DESC LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'
SELECT forename || ' ' || surname AS fullName , url , dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC
SELECT LOCATION ,  COUNTRY ,  LAT ,  LNG FROM circuits WHERE name = 'Hungaroring'
SELECT T1.points, T2.name, T2.nationality FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorid = T2.constructorid INNER JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T3.name = 'Monaco Grand Prix' AND T3.year BETWEEN 1980 AND 2010 ORDER BY T1.points DESC LIMIT 1
SELECT AVG(T1.points) FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T1.raceid IN ( SELECT raceid FROM races WHERE name = 'Turkish Grand Prix' )
SELECT AVG(year) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31'
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT SUM(wins) FROM driverStandings WHERE points = 91; 
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlapspeed IS NOT NULL ORDER BY T2.fastestlapspeed ASC LIMIT 1
SELECT T2.location, T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid ORDER BY T1.date DESC LIMIT 1
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year = 2008 AND T3.name = "Marina Bay Street" AND T2.q3 IS NOT NULL ORDER BY T2.q3 ASC LIMIT 1
SELECT T1.forename ,  T1.surname ,  T1.nationality ,  T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid ORDER BY T1.dob DESC LIMIT 1
SELECT COUNT(*) FROM results WHERE statusId = 3 AND raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(wins), forename, surname FROM drivers JOIN driverstandings ON drivers.driverid = driverstandings.driverid ORDER BY dob ASC LIMIT 1
SELECT MAX(milliseconds) FROM pitstops
SELECT MIN(time) FROM laptimes
SELECT MAX(milliseconds) FROM pitStops WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT T1.lap FROM pitstops AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T1.raceid IN ( SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2011 )
SELECT T1.driverid ,  T1.duration FROM pitstops AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2011 AND T2.name = "Australian Grand Prix"
SELECT MIN(time) FROM results WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN laptimes AS T2 ON T1.driverid = T2.driverid ORDER BY TIME ASC LIMIT 1
SELECT T1.position FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.fastestlaptime ASC LIMIT 1
SELECT MIN(time) FROM lapTimes WHERE raceId IN (SELECT raceId FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Austrian Grand Prix'))
SELECT T1.time FROM laptimes AS T1 JOIN circuits AS T2 ON T1.raceid = T2.circuitid WHERE T2.country = "Italy" ORDER BY T1.milliseconds ASC LIMIT 1
SELECT T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Austria' AND T1.name = 'Austrian Grand Prix' ORDER BY T1.date ASC LIMIT 1
SELECT T1.duration FROM pitStops AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Austrian Grand Prix' AND T1.milliseconds = ( SELECT MIN(milliseconds) FROM pitStops WHERE raceId = T1.raceId )
SELECT T1.lat, T1.lng FROM circuits AS T1 INNER JOIN results AS T2 ON T1.circuitid = T2.circuitid WHERE T2.fastestlaptime = '1:29.488'
SELECT AVG(T1.milliseconds) FROM pitstops AS T1 INNER JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT AVG(T1.milliseconds) FROM laptimes AS T1 INNER JOIN races AS T2 ON T1.raceid = T2.raceid INNER JOIN circuits AS T3 ON T2.circuitid = T3.circuitid WHERE T3.country = 'Italy'
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential = ( SELECT MIN(potential) FROM Player_Attributes )
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T2.home_team_goal < T2.away_team_goal GROUP BY T1.team_api_id ORDER BY COUNT(T2.id) ASC LIMIT 1
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.penalties DESC LIMIT 10
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal AND T1.league_id IN ( SELECT id FROM League WHERE name = 'Scotland Premier League' ) GROUP BY T2.team_long_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.buildUpPlaySpeed FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id ORDER BY T2.buildUpPlaySpeed DESC LIMIT 4
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.id ORDER BY SUM(CASE WHEN T2.home_team_goal = T2.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT strftime('%Y', 'now') - strftime('%Y', T1.birthday) AS age FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND STRFTIME('%Y', T2.date) BETWEEN '2013' AND '2015'
SELECT T1.name ,  COUNT(T2.match_api_id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY COUNT(T2.match_api_id) DESC LIMIT 1
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1996-01-01 00:00:00'
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating > ( SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%' )
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 50 AND 60
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > ( SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' )
SELECT CAST(SUM(CASE WHEN preferred_foot = 'Left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(player_fifa_api_id) FROM Player WHERE birthday BETWEEN '1987-01-01' AND '1992-12-31'
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5
SELECT AVG(T1.long_shots) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ahmed Samir Farag'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 GROUP BY T1.player_name ORDER BY AVG(T2.heading_accuracy) DESC LIMIT 10
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayDribblingClass = 'Normal' AND T2.date LIKE '%2014%' GROUP BY T1.team_long_name HAVING AVG(T2.chanceCreationPassing) > T2.chanceCreationPassing ORDER BY T2.chanceCreationPassing DESC
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' GROUP BY T2.id HAVING AVG(T1.home_team_goal) > AVG(T1.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE birthday LIKE '1970-10-%'
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Franco Zennaro'
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date LIKE '%2013%'
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00'
SELECT overall_rating FROM Player_Attributes WHERE player_name = 'Gabriel Tamas' AND strftime('%Y', date) = '2011';
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2015/2016'; 
SELECT T1.preferred_foot FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday DESC LIMIT 1
SELECT player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id ORDER BY potential DESC LIMIT 1
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson')
SELECT birthday FROM Player WHERE player_api_id = ( SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1 )
SELECT T2.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Netherlands'
SELECT AVG(home_team_goal) FROM `Match` AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = ( SELECT AVG(finishing) FROM Player_Attributes ) AND T1.height = ( SELECT MAX(height) FROM Player ) OR T1.height = ( SELECT MIN(height) FROM Player )
SELECT T1.player_name FROM Player AS T1 WHERE T1.height > 180
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating > 80 AND strftime('%Y', T2.date) BETWEEN '2008' AND '2010'
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')
SELECT player_name FROM Player WHERE preferred_foot = 'left'
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'CLB'
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > 70
SELECT AVG(t2.overall_rating) FROM Player AS t1 INNER JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A'
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32
SELECT AVG(overall_rating) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10'; 
SELECT T2.team_short_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.balance = ( SELECT MAX(balance) FROM Player_Attributes ) AND T2.potential = 61
SELECT (SUM(CASE WHEN T2.player_name = 'Abdou Diallo' THEN T1.ball_control ELSE 0 END) / COUNT(CASE WHEN T2.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T2.player_name = 'Aaron Appindangoye' THEN T1.ball_control ELSE 0 END) / COUNT(CASE WHEN T2.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) AS diff FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League'
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Germany'
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1)
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'High'
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY T2.crossing DESC LIMIT 1
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ariel Borysiuk'
SELECT COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70
SELECT COUNT(*) FROM Match AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Belgium' AND T1.season = '2008/2009'; 
SELECT T2.long_passing FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.birthday ASC LIMIT 1
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND SUBSTR(T1.date, 1, 7) = '2009-04'
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(T2.match_api_id) DESC LIMIT 1
SELECT AVG(overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'
SELECT (( SELECT overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ariel Borysiuk' ) - ( SELECT overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Paulin Puel' )) * 100 / ( SELECT overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Paulin Puel' )
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'
SELECT MAX(T2.chanceCreationPassing), T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax'
SELECT T2.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo'
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(T2.away_team_goal) FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = 'Parma' AND T2.country_id = (SELECT id FROM Country WHERE name = 'Italy')
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1
SELECT T1.overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date LIKE '2016-02-04%'
SELECT T1.potential FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00'
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date LIKE '2015-05-01%'
SELECT T1.defensive_work_rate FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22 00:00:00'
SELECT T2.date FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date LIKE '%2012-02-22%'
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'
SELECT T1.chanceCreationPassingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date LIKE '2013-09-20%'
SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hull City' AND T1.date = '2010-02-22 00:00:00'
SELECT T1.defenceAggressionClass FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND T2.date LIKE '2007-02-22%' AND T2.date LIKE '%2016-04-21'
SELECT CAST((SELECT overall_rating FROM Player_Attributes WHERE player_api_id IN ( SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan' ) AND date LIKE '%2013/7/12%' ) - ( SELECT overall_rating FROM Player_Attributes WHERE player_api_id IN ( SELECT player_api_id FROM Player WHERE player_name = 'Jordan Bowery' ) AND date LIKE '%2013/7/12%' ) AS REAL) * 100 / ( SELECT overall_rating FROM Player_Attributes WHERE player_api_id IN ( SELECT player_api_id FROM Player WHERE player_name = 'Landon Donovan' ) AND date LIKE '%2013/7/12%' )
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday) > 34
SELECT SUM(T1.home_team_goal) FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id INNER JOIN Player AS T3 ON T3.player_api_id IN (T1.home_player_1, T1.home_player_2, T1.home_player_3, T1.home_player_4, T1.home_player_5, T1.home_player_6, T1.home_player_7, T1.home_player_8, T1.home_player_9, T1.home_player_10, T1.home_player_11) WHERE T3.player_name = 'Aaron Lennon'
SELECT SUM(T2.away_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id IN (T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5, T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11) WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(T1.home_team_goal) FROM Match AS T1 INNER JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id WHERE STRFTIME('%Y', 'now') - STRFTIME('%Y', T2.birthday) <= 30
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1)
SELECT player_name FROM Player WHERE player_api_id IN ( SELECT player_api_id FROM Player_Attributes ORDER BY potential DESC LIMIT 1 )
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'High'
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY datetime(CURRENT_TIMESTAMP,'localtime') - datetime(T1.birthday) DESC LIMIT 1
SELECT T2.player_name FROM Country AS T1 INNER JOIN Player AS T2 ON T1.id = T2.player_api_id WHERE T1.name = 'Belgium'
SELECT DISTINCT T1.player_name, T4.name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id INNER JOIN Team AS T3 ON T2.player_api_id IN (T3.home_player_1, T3.home_player_2, T3.home_player_3, T3.home_player_4, T3.home_player_5, T3.home_player_6, T3.home_player_7, T3.home_player_8, T3.home_player_9, T3.home_player_10, T3.home_player_11) INNER JOIN Country AS T4 ON T3.country_id = T4.id WHERE T2.vision > 89
SELECT T2.name FROM Player AS T1 INNER JOIN Country AS T2 ON T1.player_fifa_api_id = T2.id GROUP BY T2.name ORDER BY AVG(T1.weight) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe'
SELECT AVG(T2.height) FROM Team AS T1 INNER JOIN Player AS T2 ON T1.team_api_id = T2.player_api_id WHERE T1.team_long_name LIKE '%Italy%'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'
SELECT SUM(CASE WHEN id = 6 THEN jumping ELSE 0 END) - SUM(CASE WHEN id = 23 THEN jumping ELSE 0 END) AS difference FROM Player_Attributes
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = ( SELECT MAX(crossing) FROM Player_Attributes ) AND preferred_foot = 'left'
SELECT CAST(SUM(CASE WHEN T1.strength > 80 AND T1.stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes AS T1
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Poland Ekstraklasa'
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin' AND T2.date = ( SELECT MAX(date) FROM Player_Attributes WHERE player_api_id = T1.player_api_id )
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' AND T2.date LIKE '%2013%' ORDER BY T2.date DESC LIMIT 1
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN ( SELECT id FROM League WHERE name = 'Italy Serie A' ); 
SELECT MAX(T1.home_team_goal) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Netherlands Eredivisie'
SELECT finishing ,  curve FROM Player_Attributes WHERE player_api_id = ( SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 1 )
SELECT T1.name FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.id ORDER BY COUNT(T2.id) DESC LIMIT 4
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id GROUP BY T2.team_long_name ORDER BY SUM(T1.away_team_goal) DESC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.overall_rating DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id
SELECT (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) * 100 / SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) AS Deviation FROM Patient WHERE SEX = 'M'
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) FROM Patient WHERE SEX = 'F'
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'
SELECT T2.Diagnosis ,  T1.Date FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 30609
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE LDH > 500 )
SELECT ID ,  strftime('%Y', 'now') - strftime('%Y', Birthday) AS Age FROM Patient WHERE ID IN ( SELECT ID FROM Examination WHERE RVVT = '+' )
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2
SELECT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.`ID` = T2.`ID` WHERE STRFTIME('%Y', T2.Birthday) = '1937' AND T1.`T-CHO` >= 250
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND T2.TP < 6.0 OR T2.TP > 8.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID; 
SELECT AVG(T2.`aCL IgG`) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) >= '50'
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '-'
SELECT MIN(SUBSTR(`First Date`, 1, 4) - SUBSTR(Birthday, 1, 4)) AS YoungestAge FROM Patient WHERE `First Date` IS NOT NULL AND Birthday IS NOT NULL;
SELECT COUNT(*) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.SEX = 'F' AND E.Thrombosis = 1 AND strftime('%Y', E.`Examination Date`) = '1997'
SELECT MAX(strftime('%Y', Birthday)) - MIN(strftime('%Y', Birthday)) AS AgeGap FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE TG >= 200 )
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Symptoms IS NOT NULL ORDER BY T1.Birthday DESC LIMIT 1
SELECT CAST(COUNT(DISTINCT T1.ID) AS REAL) / 12 FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1998-01-01' AND '1998-12-31' AND T2.SEX = 'M'
SELECT MAX(Laboratory.Date), STRFTIME('%Y', Patient.`First Date`) - STRFTIME('%Y', Patient.Birthday) AS Age FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Diagnosis = 'SJS' ORDER BY Patient.Birthday ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN UA <= 8 AND SEX = 'M' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN UA <= 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE UA IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 LEFT JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` IS NOT NULL AND STRFTIME('%Y', T2.`Examination Date`) - STRFTIME('%Y', T1.`First Date`) >= 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) < '1978' AND STRFTIME('%Y', T2.`Examination Date`) BETWEEN '1990' AND '1993'
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.`T-BIL` >= 2.0; 
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1
SELECT AVG(1999 - STRFTIME('%Y', Birthday)) AS AverageAge FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE Date BETWEEN '1991-10-01' AND '1991-10-30' ); 
SELECT T2.`Examination Date`, T1.Birthday, strftime('%Y', T2.`Examination Date`) - strftime('%Y', T1.Birthday) AS Age, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T2.HGB DESC LIMIT 1
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT CASE WHEN T1.T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS Total_Cholesterol_Status FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1995-09-04' AND T2.ID = 2927464
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%AORTITIS%' LIMIT 1
SELECT T2.`aCL IgM` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description = '1994-02-19' AND T2.`Examination Date` = '1993-11-12' AND T1.Diagnosis = 'SLE'
SELECT SEX FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE Date = '1992-06-12' AND GPT = 9) 
SELECT strftime('%Y', T2.Date) - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = '1991-10-21' AND T2.UA = '8.4'
SELECT COUNT(Lab.ID) FROM Laboratory Lab JOIN Patient Pat ON Lab.ID = Pat.ID WHERE Pat.`First Date` = '1991-06-13' AND Pat.Diagnosis LIKE '%SJS%' AND strftime('%Y', Lab.Date) = '1995'; 
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` <= '1997-01-27' AND T2.`Examination Date` = '1997-01-27' AND T1.Diagnosis LIKE '%SLE%' 
SELECT T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.`Examination Date` = '1993-09-27'
SELECT SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) - SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-12-%' THEN T2.`T-CHO` ELSE 0 END) AS DecreaseRate FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID; 
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Description BETWEEN '1997-01-01' AND '1997-12-31' AND T2.Diagnosis LIKE '%Behcet%'
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1987-07-06' AND '1996-01-31' AND T1.GPT > 30 AND T1.ALB < 4
SELECT ID FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Birthday) = '1964' AND Admission = '+' ORDER BY ID; 
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 2 AND T1.ANA = 'S' AND T1.`aCL IgM` > ( SELECT AVG(`aCL IgM`) * 1.2 FROM Examination )
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30
SELECT CAST(SUM(CASE WHEN T1.DIAGNOSIS = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 WHERE T1.SEX = 'M' AND STRFTIME('%Y', T1.`First Date`) = '1981'
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.`T-BIL` < 2.0
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Birthday BETWEEN '1980-01-01' AND '1989-12-31' AND ID NOT IN ( SELECT ID FROM Examination WHERE `ANA Pattern` = 'P' )
SELECT DISTINCT T1.SEX  FROM Patient AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  JOIN Laboratory AS T3 ON T1.ID = T3.ID  WHERE T1.Diagnosis = 'PSS' AND T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123; 
SELECT AVG(T1.ALB) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.PLT > 400 AND T2.Diagnosis = 'SLE'
SELECT Symptoms FROM Examination WHERE Diagnosis LIKE '%SLE%' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Description, T1.Diagnosis FROM Patient AS T1 WHERE T1.ID = 48473
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Diagnosis LIKE '%APS%'
SELECT COUNT(*) FROM Laboratory WHERE STRFTIME('%Y', Date) = '1997' AND TP NOT BETWEEN 6 AND 8.5
SELECT CAST(SUM(CASE WHEN T2.Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SLE%'
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE STRFTIME('%Y', Birthday) = '1980' AND Diagnosis = 'RA'
SELECT COUNT(DISTINCT P.ID)  FROM Patient AS P  JOIN Examination AS E ON P.ID = E.ID  WHERE P.SEX = 'M'  AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'  AND E.Diagnosis LIKE '%Behcet%'  AND P.Admission = '-'; 
SELECT COUNT(*) FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND Laboratory.WBC < 3.5
SELECT DATEDIFF(T2.`Examination Date`, T1.`First Date`) AS days_before_evaluation FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 821298
SELECT CASE WHEN UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F' THEN 'Yes' ELSE 'No' END AS "Is Uric Acid Within Normal Range?" FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.ID = 57266;
SELECT T2.Date FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473 AND T2.GOT >= 60
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date LIKE '1994%' AND L.GOT < 60; 
SELECT ID FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Laboratory WHERE GPT >= 60); 
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT T1.ID ,  STRFTIME('%Y', 'now') - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH BETWEEN 600 AND 800
SELECT T1.admission FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300
SELECT T1.ID, CASE WHEN T2.ALP < 300 THEN 'Yes' ELSE 'No' END AS Normal_ALP FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01'
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0
SELECT TP - 8.5 FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'F') AND TP > 8.5
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND (T2.ALB <= 3.5 OR T2.ALB >= 5.5) ORDER BY T1.Birthday DESC
SELECT CASE WHEN T1.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range' ELSE 'Outside Normal Range' END AS Albumin_Range FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.Birthday) = '1982'
SELECT CAST(SUM(CASE WHEN UA > 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'F')
SELECT AVG(T2.UA) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.UA < 8 OR T1.SEX = 'F' AND T2.UA < 6.5 GROUP BY T1.ID ORDER BY T2.Date DESC LIMIT 1
SELECT T1.ID ,  T1.SEX ,  T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UN = 29
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%RA%' AND T2.UN < 30
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CRE >= 1.5
SELECT CASE WHEN SUM(CASE WHEN SEX = 'M' AND CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN SEX = 'F' AND CRE >= 1.5 THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END AS Result FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID ORDER BY T2.`T-BIL` DESC LIMIT 1
SELECT SEX, GROUP_CONCAT(DISTINCT ID) FROM Laboratory WHERE T_BIL >= 2.0 GROUP BY SEX; 
SELECT P.ID, L.`T-CHO` FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID ORDER BY P.Birthday ASC, L.`T-CHO` DESC LIMIT 1
SELECT AVG(DATE_PART('year', AGE(CURRENT_DATE, Birthday))) AS AverageAge FROM Patient WHERE SEX = 'M' AND ID IN ( SELECT ID FROM Laboratory WHERE T_cho >= 250 )
SELECT P.ID, P.Description, L.TG FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TG > 300;
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG >= 200 AND STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T2.Birthday) > 50
SELECT DISTINCT ID FROM Patient WHERE Admission = '-' AND ID IN ( SELECT ID FROM Laboratory WHERE CPK < 250 )
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1936' AND '1956' AND T1.SEX = 'M' AND T2.CPK >= 250
SELECT T1.ID, T1.SEX, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.`T-CHO` < 250
SELECT T1.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Description) = '1991' AND T2.GLU < 180
SELECT T1.ID ,  T1.SEX ,  T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 GROUP BY T1.SEX ORDER BY strftime('%Y', 'now') - strftime('%Y', T1.Birthday) ASC
SELECT T1.ID, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) AS Age, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5
SELECT P.ID, P.SEX, P.Birthday, P.Admission FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0)
SELECT DISTINCT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HGB < 10 AND T1.Admission = '-'
SELECT ID, SEX FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE HGB BETWEEN 10 AND 17 ) AND Diagnosis = 'SLE' ORDER BY Birthday ASC LIMIT 1
SELECT T1.ID ,  strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T2.ID) > 2
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29
SELECT SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS Calculation FROM Laboratory; 
SELECT DISTINCT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Date) = '1984' AND strftime('%Y', 'now') - strftime('%Y', T2.Birthday) < 50 AND T1.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN T2.PT >= 14 AND T1.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) > 55
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`First Date`) > '1992' AND T2.PT < 14
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND APTT >= 45;
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.APTT > 45 AND T1.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450) 
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` BETWEEN 0 AND 30 AND T2.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.IGG >= 2000
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID IN ( SELECT ID FROM Laboratory WHERE IGG BETWEEN 900 AND 2000 ) AND T1.Symptoms IS NOT NULL
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGA BETWEEN 80 AND 500 ORDER BY T1.IGA DESC LIMIT 1
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.First_Date >= '1990-01-01' AND E.`aCL IgA` BETWEEN 80 AND 500; 
SELECT T2.Diagnosis FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`aCL IgM` <= 40 OR T1.`aCL IgM` >= 400 GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRP = '+' AND T1.Description IS NULL
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) < 70
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis LIKE '%RA%' AND T1.KCT = '+'; 
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T2.Birthday) >= '1985' AND T1.RA IN ('-', '+-')
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.RF < 20 AND STRFTIME('%Y', 'now') - STRFTIME('%Y', P.Birthday) > 60; 
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.RF < 20 AND T2.Thrombosis = '0'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.ANA = 1 AND T1.`ANA Pattern` = 'P' AND T2.Diagnosis LIKE '%PSS%'
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.HCT NOT BETWEEN 29 AND 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID)  FROM Examination AS T1  INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.Thrombosis = 1 AND T2.C4 > 10; 
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP IN ('-', '+-') AND T1.Admission = '+'
SELECT Birthday FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE RNP NOT IN ('-', '+-') ) ORDER BY Birthday DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SM IN ('-', '+-') AND T2.Thrombosis = 0
SELECT ID FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE SM NOT IN ('negative', '0') ) ORDER BY Birthday DESC LIMIT 3
SELECT T1.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T2.Description LIKE '%SC170 negative%' OR T2.Description LIKE '%SC170 0%'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.SC170 IN ('negative', '0') AND T2.Symptoms IS NULL; 
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.`First Date` < '2000-01-01' AND L.SSA IN ('-', '+-') 
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SSB IN ('-', '+-') AND T2.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SSB IN ('negative', '0') AND T2.Symptoms IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CENTROMEA IN ('-', '+-') AND T2.SSB IN ('-', '+-')
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T1.Description IS NULL
SELECT COUNT(*) FROM Patient WHERE ID IN ( SELECT ID FROM Laboratory WHERE IGG BETWEEN 900 AND 2000 ) AND Admission = '+'
SELECT CAST(SUM(CASE WHEN T1.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.GOT >= 60 THEN 1 ELSE 0 END) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID; 
SELECT COUNT(*) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60
SELECT MIN(T1.Birthday) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN ( SELECT ID FROM Laboratory WHERE GOT < 60 )
SELECT MIN(T1.`First Date`) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500
SELECT T2.Date FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300 AND T1.Admission = '+'
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' AND T2.TP BETWEEN 6.0 AND 8.5
SELECT T1.`Examination Date` FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB BETWEEN 3.5 AND 5.5 ORDER BY T2.ALB DESC LIMIT 1
SELECT COUNT(*) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.ALB BETWEEN 3.5 AND 5.5 AND L.TP BETWEEN 6.0 AND 8.5
SELECT T1.`aCL IgG`, T1.`aCL IgM`, T1.`aCL IgA` FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.UA > 6.50 ORDER BY T1.UA DESC LIMIT 1
SELECT MAX(T2.ANA) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` >= 2.0 AND T2.`ANA Pattern` LIKE '%P%'
SELECT T1.ANA FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` >= 250 AND T1.KCT = '-'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-CHO` < 250 AND T1.`ANA Pattern` = 'P'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 AND T1.Symptoms IS NOT NULL
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 ORDER BY T1.TG DESC LIMIT 1
SELECT ID FROM Examination WHERE Thrombosis = 0 AND CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CPK < 250 AND (T1.KCT = '+' OR T1.RVVT = '+' OR T1.LAC = '+')
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180 ORDER BY T1.Birthday ASC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND T1.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T1.WBC BETWEEN 3.5 AND 9.0
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '-' AND (T1.RBC <= 3.5 OR T1.RBC >= 6.0)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PLT BETWEEN 100 AND 400 AND T1.Diagnosis IS NOT NULL
SELECT T1.PLT FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'MCTD' AND T1.PLT BETWEEN 100 AND 400
SELECT AVG(T2.PT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14
SELECT COUNT(*) FROM Examination WHERE Thrombosis IN (1, 2) AND PT < 14
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Angela' AND T2.last_name = 'Sanders'
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering' AND T1.position = 'Student';
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design' AND T1.position = 'Student'
SELECT COUNT(T2.link_to_member) AS student_count FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer' AND T3.position LIKE '%Student%'; 
SELECT T1.phone FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Student'
SELECT COUNT(*) FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium' AND m.position LIKE '%Student%' OR m.position LIKE '%Club%'
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T2.link_to_member IN ( SELECT member_id FROM member WHERE link_to_major IN ( SELECT major_id FROM major WHERE major_name = 'Student_Club' ) ) GROUP BY T1.event_id ORDER BY COUNT(T2.link_to_member) DESC LIMIT 1
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President' 
SELECT T2.event_name FROM member AS T1 INNER JOIN attendance AS T3 ON T1.member_id = T3.link_to_member INNER JOIN event AS T2 ON T3.link_to_event = T2.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean'
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND STRFTIME('%Y', T2.event_date) = '2019' AND T2.type = 'Student_Club'
SELECT COUNT(DISTINCT event_id) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY event.event_id HAVING COUNT(attendance.link_to_member) > 10; 
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type != 'fundraiser' GROUP BY T1.event_name HAVING COUNT(T2.link_to_member) > 20
SELECT CAST(COUNT(event_id) AS REAL) / COUNT(DISTINCT event_name) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND STRFTIME('%Y', T1.event_date) = '2020'
SELECT expense_description FROM expense WHERE approved = 'yes' ORDER BY cost DESC LIMIT 1
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering' AND T1.position = 'Student_Club'
SELECT T2.first_name, T2.last_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud' AND T2.link_to_major IN ( SELECT major_id FROM major WHERE major_name = 'Student_Club' )
SELECT T.first_name ,  T.last_name FROM member AS T JOIN major AS M ON T.link_to_major = M.major_id WHERE M.major_name = 'Law and Constitutional Studies'
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey'
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'
SELECT SUM(T1.amount) FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.event_name = 'September Meeting'
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President' LIMIT 1
SELECT T1.first_name ,  T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'IL' AND T1.position = 'Student_Club'
SELECT SUM(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'
SELECT T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name IN ('Pierce', 'Guidi') GROUP BY T1.department
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'; 
SELECT T1.expense_description, T1.approved FROM expense AS T1 INNER JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T3.event_date = '2019-10-08'
SELECT AVG(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND (SUBSTR(T2.expense_date, 6, 2) = '09' OR SUBSTR(T2.expense_date, 6, 2) = '10')
SELECT SUM(CASE WHEN strftime('%Y', T1.event_date) = '2019' THEN T2.spent ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T1.event_date) = '2020' THEN T2.spent ELSE 0 END) AS difference FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name LIKE '%Student_Club%'
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT SUM(T2.cost) AS total_cost FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_budget WHERE T1.event_date = '2019-09-04' AND T1.event_name LIKE '%Posters%'; 
SELECT remaining FROM budget WHERE category = 'Food' AND amount = ( SELECT MAX(amount) FROM budget WHERE category = 'Food' )
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'; 
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT T1.county FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Adela' AND T2.last_name = 'O''Gallagher'
SELECT COUNT(*) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker'
SELECT T1.event_status FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'; 
SELECT T3.major_name FROM member AS T1 INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'
SELECT COUNT(*) FROM member WHERE link_to_major IN ( SELECT major_id FROM major WHERE major_name = 'Business' ) AND t_shirt_size = 'Medium'
SELECT T2.type FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielsen'
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'
SELECT T1.date_received FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'
SELECT T.first_name, T.last_name FROM ( SELECT T1.first_name, T1.last_name, MIN(T2.date_received) AS min_date FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.source = 'Dues' GROUP BY T1.member_id ) AS T ORDER BY T.min_date ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.event_name = 'October Meeting' THEN T1.amount ELSE 0 END) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement'; 
SELECT CAST(SUM(CASE WHEN T1.category = 'Parking' AND T2.event_name = 'November Speaker' THEN T1.amount ELSE 0 END) AS REAL) * 100 / COUNT(T2.event_name = 'November Speaker') FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'; 
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T2.city, T2.county, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T1.expense_description FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id ORDER BY T2.remaining ASC LIMIT 1
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting'
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id GROUP BY T2.college ORDER BY COUNT(T2.college) DESC LIMIT 1
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.phone = '809-555-3360'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'
SELECT T2.date_received FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Casey' AND T1.last_name = 'Mason'; 
SELECT COUNT(*) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'MD';
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.phone = '954-555-6240'
SELECT T1.first_name ,  T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President';
SELECT MAX(spent) FROM budget
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND STRFTIME('%Y', event_date) = '2020'; 
SELECT SUM(spent) FROM budget WHERE category = 'Food'
SELECT T.first_name, T.last_name FROM ( SELECT M.first_name, M.last_name, COUNT(A.link_to_event) AS num_events FROM member AS M JOIN attendance AS A ON M.member_id = A.link_to_member GROUP BY M.member_id ) AS T WHERE T.num_events > 7
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id INNER JOIN major AS T4 ON T1.link_to_major = T4.major_id WHERE T4.major_name = 'Interior Design' AND T3.event_name = 'Community Theater'
SELECT first_name, last_name FROM member WHERE zip IN ( SELECT zip_code FROM zip_code WHERE city = 'Georgetown' AND state = 'South Carolina' )
SELECT SUM(amount) FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour'); 
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'; 
SELECT T2.first_name, T2.last_name FROM event AS T1 INNER JOIN member AS T2 ON T2.member_id = ( SELECT link_to_member FROM attendance WHERE link_to_event = ( SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff' ) LIMIT 1 ) WHERE T1.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name, T2.source FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member ORDER BY T2.amount DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.cost ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.cost ELSE 0 END) AS REAL) * 100 / SUM(T2.cost) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_budget; 
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Physics Teaching' AND T1.position = 'Student_Club'
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Community Theater' AND STRFTIME('%Y', T2.event_date) = '2019'
SELECT COUNT(a.link_to_event), m.major_name FROM attendance a JOIN member mem ON a.link_to_member = mem.member_id JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi'; 
SELECT AVG(T1.spent) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.status = 'Closed'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1
SELECT CASE WHEN EXISTS ( SELECT 1 FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean' AND T3.event_name = 'Women''s Soccer' ) THEN 'Yes' ELSE 'No' END AS attended
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE event_date LIKE '2019%' AND event_name LIKE '%Student_Club%'
SELECT T1.cost FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.expense_description = 'Posters' AND T3.event_name = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1
SELECT T1.expense_description, SUM(T1.cost) AS total_value FROM expense AS T1 INNER JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T1.approved = 'Yes'
SELECT category, SUM(amount) AS total_amount_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_amount_budgeted ASC; 
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT event_name FROM event WHERE event_id IN ( SELECT link_to_event FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3 )
SELECT SUM(cost) AS total_cost_spent_for_parking FROM expense WHERE expense_description = 'Parking'; 
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20'; 
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_member = 'rec4BLdZHS2Blfp4v'
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT T1.expense_description FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'
SELECT T2.zip FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost < 50 GROUP BY T2.zip
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'
SELECT T1.position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT COUNT(*) FROM member WHERE link_to_major IN ( SELECT major_id FROM major WHERE major_name = 'Business' ) AND t_shirt_size = 'Medium'; 
SELECT T1.type FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_date = '2020-03-24T12:00:00'
SELECT T1.major_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'
SELECT CAST(SUM(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50; 
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'; 
SELECT COUNT(major_id) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';
SELECT T1.last_name ,  T2.department ,  T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'
SELECT T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0
SELECT T1.city, T1.state FROM zip_code AS T1 INNER JOIN member AS T2 ON T2.zip = T1.zip_code INNER JOIN major AS T3 ON T3.major_id = T2.link_to_major WHERE T3.department = 'Electrical and Computer Engineering Department' AND T2.position = 'Member'
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social'; 
SELECT T1.last_name, T1.position FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_date = '2019-09-10' AND T2.expense_description = 'Pizza'
SELECT T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member'
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'
SELECT DISTINCT county FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'; 
SELECT T1.link_to_event FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.cost > 50
SELECT m.first_name, m.last_name, e.expense_description, a.link_to_event FROM member AS m JOIN expense AS e ON m.member_id = e.link_to_member JOIN attendance AS a ON m.member_id = a.link_to_member WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'; 
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T2.link_to_major = T1.major_id WHERE T2.first_name = 'Katy' AND T2.link_to_major = 'rec1N0upiVLy5esTO'; 
SELECT T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business'
SELECT T1.email FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received BETWEEN '2019-09-10' AND '2019-11-19' AND T2.amount > 20
SELECT COUNT(*) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Education' AND T1.position = 'Member'
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM budget
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'; 
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code
SELECT T1.event_name ,  T1.location FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost BETWEEN 50 AND 100
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100
SELECT z.city, z.county FROM zip_code z JOIN event e ON z.zip_code = e.location WHERE e.event_id IN (     SELECT link_to_event     FROM income     GROUP BY link_to_event     HAVING COUNT(*) > 40 ); 
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_id IN ( SELECT expense_id FROM expense GROUP BY expense_id HAVING COUNT(DISTINCT link_to_event) > 1 ) ORDER BY SUM(T2.cost) DESC LIMIT 1
SELECT AVG(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position != 'Member'
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.cost < ( SELECT AVG(cost) FROM expense WHERE category = 'Parking' )
SELECT CAST(SUM(CASE WHEN T1.type = 'Meeting' THEN T2.cost ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 INNER JOIN expense AS T2 ON T1.event_id = T2.link_to_event
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Water, chips, cookies' ORDER BY T1.cost DESC LIMIT 1
SELECT T.first_name, T.last_name FROM ( SELECT M.first_name, M.last_name, SUM(E.cost) AS total_spent FROM member AS M JOIN expense AS E ON M.member_id = E.link_to_member GROUP BY M.member_id ) AS T ORDER BY T.total_spent DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > ( SELECT AVG(cost) FROM expense )
SELECT      (SUM(CASE WHEN T1.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(T1.state)) -      (SUM(CASE WHEN T1.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(T1.state)) AS diff_percentage FROM      zip_code AS T1 JOIN      member AS T2 ON T1.zip_code = T2.zip; 
SELECT T1.major_name, T1.department FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, SUM(T2.cost) AS total_cost FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'
SELECT T1.last_name ,  T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'
SELECT T1.category, T1.amount FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '9/9/2019'
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'
SELECT T1.first_name ,  T1.last_name ,  T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'
SELECT SUM(T1.spent), T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts'
SELECT T1.city FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'
SELECT T.first_name, T.last_name, T.position FROM member AS T JOIN zip_code AS Z ON T.zip = Z.zip_code WHERE Z.city = 'Lincolnton' AND Z.state = 'North Carolina'
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT CAST(SUM(IIF(Currency = 'EUR', 1, 0)) AS REAL) / SUM(IIF(Currency = 'CZK', 1, 0)) FROM customers
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '2012%' AND T1.Segment = 'LAM' ORDER BY T2.Consumption ASC LIMIT 1
SELECT AVG(Consumption) / 12 AS AvgMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND Date BETWEEN '201301' AND '201312'; 
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND T2.Date BETWEEN '201101' AND '201112' ORDER BY T2.Consumption DESC LIMIT 1
SELECT COUNT(DISTINCT CustomerID) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND Consumption < 30000; 
SELECT SUM(CASE WHEN T2.Currency = 'CZK' THEN T1.Consumption ELSE 0 END) - SUM(CASE WHEN T2.Currency = 'EUR' THEN T1.Consumption ELSE 0 END) AS ConsumptionDifference FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date BETWEEN '201201' AND '201212'; 
SELECT T2.Date FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' GROUP BY T2.Date ORDER BY SUM(T2.Consumption) DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1
SELECT SUBSTR(`Date`, 1, 4) FROM yearmonth WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Currency = 'CZK' ) ORDER BY Consumption DESC LIMIT 1
SELECT T2.Date FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption DESC LIMIT 1
SELECT AVG(CASE WHEN T1.Segment = 'SME' THEN T2.Consumption END) - AVG(CASE WHEN T1.Segment = 'LAM' THEN T2.Consumption END) AS "SME vs LAM" , AVG(CASE WHEN T1.Segment = 'LAM' THEN T2.Consumption END) - AVG(CASE WHEN T1.Segment = 'KAM' THEN T2.Consumption END) AS "LAM vs KAM" , AVG(CASE WHEN T1.Segment = 'KAM' THEN T2.Consumption END) - AVG(CASE WHEN T1.Segment = 'SME' THEN T2.Consumption END) AS "KAM vs SME" FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201301' AND '201312' GROUP BY T1.Segment
SELECT Segment ,  ((SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) - SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) / SUM(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END)) * 100 AS Percentage FROM customers INNER JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Currency = 'EUR' GROUP BY Segment ORDER BY Percentage DESC LIMIT 1
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT SUM(CASE WHEN Country = 'CZE' THEN 1 ELSE 0 END) - SUM(CASE WHEN Country = 'SVK' THEN 1 ELSE 0 END) AS difference FROM gasstations WHERE Segment = 'Discount'
SELECT SUM(CASE WHEN CustomerID = 7 THEN Consumption ELSE 0 END) - SUM(CASE WHEN CustomerID = 5 THEN Consumption ELSE 0 END) AS Difference FROM yearmonth WHERE Date = '201304'
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS Difference FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME'; 
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Segment = 'KAM' ) AND Date = '201305'
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'
SELECT Country ,  COUNT(*) FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date LIKE '201202%'
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SK'
SELECT customerid FROM yearmonth WHERE date = '201309' ORDER BY consumption DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201206' AND T1.Segment = 'SME' ORDER BY T2.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'
SELECT MAX(Consumption) FROM yearmonth WHERE CustomerID IN ( SELECT CustomerID FROM customers WHERE Currency = 'EUR' )
SELECT T2.Description FROM yearmonth AS T1 INNER JOIN products AS T2 ON T1.CustomerID = T2.ProductID WHERE T1.Date LIKE '201309%'
SELECT DISTINCT T2.Country FROM yearmonth AS T1 INNER JOIN gasstations AS T2 ON T1.CustomerID = T2.GasStationID WHERE T1.Date LIKE '201306%'
SELECT DISTINCT T1.ChainID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR'
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE T1.CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01%'
SELECT COUNT(DISTINCT ym.CustomerID) AS CustomerCount FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000; 
SELECT T1.Description FROM products AS T1 INNER JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID INNER JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T3.Country = 'CZE'
SELECT DISTINCT Time FROM transactions_1k WHERE GasStationID IN ( SELECT GasStationID FROM gasstations WHERE ChainID = 11 )
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'
SELECT AVG(TotalPrice) FROM ( SELECT T1.Price * T1.Amount AS TotalPrice FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' )
SELECT AVG(Price) FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR'
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' ORDER BY Amount DESC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time ASC LIMIT 1
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'
SELECT T1.Segment FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00'; 
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT ProductID FROM transactions_1k AS T1 WHERE Date = '2012-08-23' AND Time = '21:20:00'
SELECT SUM(Amount), Date FROM transactions_1k WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Amount = 124.05) AND Date LIKE '2012-01-%'; 
SELECT COUNT(*) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'; 
SELECT T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date LIKE '%201306%' AND T2.Amount = 214582.17; 
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Amount = 548.4; 
SELECT CAST(SUM(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25'
SELECT      ((T1.Consumption - T2.Consumption) / T1.Consumption) AS ConsumptionDecreaseRate FROM      yearmonth AS T1 INNER JOIN      yearmonth AS T2 ON      T1.CustomerID = T2.CustomerID WHERE      T1.Date = '201208' AND T2.Date = '201308'; 
SELECT T1.GasStationID FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T1.GasStationID ORDER BY SUM(T1.Amount * T1.Price) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK'
SELECT SUM(Amount) AS TotalSpent, SUM(CASE WHEN Date LIKE '201201%' THEN Amount ELSE 0 END) AS SpentInJanuary2012 FROM transactions_1k WHERE CustomerID = 38508; 
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.Description ORDER BY COUNT(T1.TransactionID) DESC LIMIT 5
SELECT c.CustomerID, AVG(t.Price / t.Amount) AS AveragePricePerItem, c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID GROUP BY c.CustomerID ORDER BY SUM(t.Amount * t.Price) DESC LIMIT 1; 
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ProductID = 2 ORDER BY T2.Price DESC LIMIT 1
SELECT T1.CustomerID, T2.Consumption FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29 AND T2.Date = '201208'
