SELECT MAX("Percent (%) Eligible Free (K-12)") AS HighestEligibleFreeRate FROM frpm WHERE "County Name" = 'Alameda'; 
SELECT MIN(`Percent (%) Eligible Free (Ages 5-17)`) FROM `frpm` WHERE `School Type` = 'Continuation' LIMIT 3
SELECT DISTINCT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Fresno' AND T1.`Charter School (Y/N)` = 1; 
SELECT T1.MailStreet FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 1
;
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F'; 
SELECT s.School, s.Magnet, s.GSoffered FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.NumTstTakr > 500 AND (s.Magnet = 1 OR s.GSoffered LIKE '%Magnet%') 
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT SUM(T1.NumTstTakr) AS TotalSATTestTakers FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T2.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm WHERE `FRPM Count (K-12)` IS NOT NULL); 
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.`Charter Funding Type` = 'Directly funded'; 
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead DESC LIMIT 1
;
SELECT MAX(T1.`Percent (%) Eligible Free (Ages 5-17)`) AS HighestEligibleFreeRate FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 / T2.NumTstTakr > 0.3; 
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.NumGE1500 * 1.0 / T2.NumTstTakr DESC LIMIT 3
SELECT T1.NCESSchool FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T2.District FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' GROUP BY T2.District ORDER BY AVG(T1.AvgScrRead) DESC LIMIT 1
SELECT COUNT(*) FROM satscores WHERE rtype = 'S' AND NumTstTakr < 100;
SELECT s.CDSCode, s.CharterNum, AVG(fs.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores fs ON s.CDSCode = fs.cds WHERE fs.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL GROUP BY s.CDSCode, s.CharterNum ORDER BY AvgWritingScore DESC; 
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.City = 'Fresno' AND T2.FundingType = 'Directly funded' AND T1.NumTstTakr <= 250; 
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1
;
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `FRPM Count (K-12)` < 700;
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Contra Costa' ORDER BY T2.NumTstTakr DESC LIMIT 1
;
;
;
SELECT T1.School, T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Percent (%) Eligible Free (Ages 5-17)` > 800 AND T1.StatusType = 'Active' AND T1.GSoffered = 'High School' AND T1.County = 'Monterey'
;
SELECT s.School, s.DOCType, AVG(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) AS AvgDiff FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.[Charter Funding Type] = 'Local' GROUP BY s.School, s.DOCType HAVING ABS(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) > (SELECT AVG(AvgDiff) FROM ( 	SELECT AVG(f.[Enrollment (K-12)] - f.[Enrollment (Ages 5-17)]) AS AvgDiff 	FROM frpm f 	JOIN schools s ON f.CDSCode = s.CDSCode 	WHERE f.[Charter Funding Type] = 'Local' 	GROUP BY s.School, s.DOCType) AS SubQuery) 
SELECT T1.OpenDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.GSoffered = 'K-12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1; 
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT T1.`Percent (%) Eligible Free (K-12)` AS EligibleFreeRate FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'Active' ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 10, 2; 
;
;
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM frpm WHERE `School Name` LIKE '%Kacey Gibson%'
SELECT T1.AdmEmail1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 ORDER BY T2.`Enrollment (K-12)` ASC LIMIT 1
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores )
SELECT T2.Street, T2.City, T2.State, T2.Zip FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr ASC LIMIT 1
SELECT T1.Website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr BETWEEN 2000 AND 3000; 
SELECT AVG(s.NumTstTakr) AS AvgTestTakers FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.City = 'Fresno' AND STRFTIME('%Y', sc.OpenDate) = '1980'; 
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Fresno Unified' ORDER BY T2.AvgScrRead ASC LIMIT 1
SELECT s.School, AVG(ss.AvgScrRead) AS AvgReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY s.County, AvgReadingScore DESC LIMIT 5; 
SELECT T1.EILName FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1
SELECT AVG(AvgScrMath), T1.County FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY (T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite) ASC LIMIT 1
SELECT AVG(T1.AvgScrWrite), T2.City FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 GROUP BY T2.City ORDER BY SUM(T1.NumTstTakr) DESC LIMIT 1
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School;
SELECT T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.DOC = 31 AND T2.`Low Grade` = 'K' AND T2.`High Grade` = '12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT COUNT(CASE WHEN STRFTIME('%Y', OpenDate) = '1980' THEN CDSCode ELSE NULL END) / 12 AS AvgMonthlyOpened FROM schools WHERE DOC = 52
SELECT SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) / SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS Ratio FROM schools; 
SELECT T1.County, T1.School, T1.ClosedDate FROM schools AS T1 WHERE T1.StatusType = 'Closed' GROUP BY T1.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 6, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite >= 1500 AND T2.MailCity = 'Lakeport'
SELECT SUM(NumTstTakr) FROM satscores WHERE cds IN ( SELECT CDSCode FROM schools WHERE MailCity = 'Fresno' )
SELECT T1.School ,  T1.MailZip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Avetik' AND T1.AdmLName1 = 'Atoian'
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE MailState = 'CA'; 
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND City = 'San Jose' AND StatusType = 'Active'; 
SELECT T1.Phone, T1.Ext FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrWrite DESC LIMIT 332, 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'; 
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez';
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin'
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = 52; 
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T2.Charter = 0 AND (T1.`Free Meal Count (K-12)` * 100 / T1.`Enrollment (K-12)`) < 0.18
SELECT T1.School, T1.City, T1.AdmFName1, T1.AdmLName1, T1.AdmFName2, T1.AdmLName2, T1.AdmFName3, T1.AdmLName3 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Charter = 1 AND T1.CharterNum = '00D2'; 
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'; 
SELECT CAST(SUM(CASE WHEN T1.FundingType = 'Locally Funded' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Santa Clara'
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus'; 
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate BETWEEN '1989-01-01' AND '1989-12-31'; 
SELECT T1.County FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = 11 AND T1.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY T1.County ORDER BY COUNT(T1.CDSCode) DESC LIMIT 1
SELECT NCESDist FROM schools WHERE SOC = 31
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') AND District LIKE '%Community Day School%'; 
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0
SELECT SUM(`Enrollment (Ages 5-17)`) AS TotalEnrollment FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.School = 'State Special School' AND schools.City = 'Fremont' AND frpm.`Academic Year` = '2014-2015'; 
SELECT T2.`Free Meal Count (Ages 5-17)` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.School = 'Youth Authority' AND T1.MailStreet = 'PO Box 1040'
;
;
;
SELECT s.School, f.[Percent (%) Eligible FRPM (Ages 5-17)] FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND s.GSoffered LIKE '%K%' AND s.GSoffered LIKE '%9%' 
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS NumberOfVirtualSchools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F'; 
SELECT T1.School, T1.Latitude, T1.Longitude FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.Latitude DESC LIMIT 1
;
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1
SELECT COUNT(DISTINCT City), City, COUNT(*) AS NumberOfSchools FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE Magnet = 1 AND GSoffered LIKE '%K-8%' AND `NSLP Provision Status` = 'Multiple Provision Types' GROUP BY City; 
;
SELECT T2.`Percent (%) Eligible Free (K-12)`, T1.District FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Alusine'
SELECT T1.School, T1.District, T1.County, T1.AdmLName1 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterNum = '40'; 
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54); 
SELECT T2.AdmEmail1, T1.sname FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT COUNT(account_id)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE A3 = 'East Bohemia' AND frequency = 'POPLATEK PO OBRATU'; 
SELECT COUNT(account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague'
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM district WHERE A12 IS NOT NULL AND A13 IS NOT NULL
SELECT COUNT(district_id) FROM district WHERE A11 > 6000 AND A11 < 10000; 
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A3 LIKE '%North Bohemia%' AND T2.A11 > 8000
WITH OldestFemaleClients AS (     SELECT DISTINCT client_id     FROM client     WHERE gender = 'F'     ORDER BY birth_date ASC     LIMIT 1 ), LowestAverageSalary AS (     SELECT AVG(A11) AS avg_salary     FROM district ) SELECT T1.account_id, (SELECT MAX(avg_salary) FROM LowestAverageSalary) - (SELECT MIN(avg_salary) FROM LowestAverageSalary) AS salary_gap FROM disp AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' AND T2.client_id IN (SELECT client_id FROM OldestFemaleClients) GROUP BY T1.account_id; 
SELECT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id GROUP BY T1.account_id ORDER BY AVG(T3.birth_date) DESC LIMIT 1; 
SELECT COUNT(DISTINCT client_id) FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK TYDNE' AND T1.type = 'OWNER'
SELECT T1.client_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'DISPONENT' AND T2.frequency = 'POPLATEK PO OBRATU'
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1997' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 12 AND STRFTIME('%Y', T1.date) = '1993' ORDER BY T2.amount DESC LIMIT 1
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T3.district_id = ( SELECT district_id FROM district WHERE A2 = 'Sokolov' )
SELECT account_id FROM trans WHERE date LIKE '1995%' ORDER BY date ASC LIMIT 1
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T2.amount > 3000
SELECT T2.client_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued LIKE '1994-03-03%'
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date LIKE '1998-10-14%'
SELECT T1.district_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'
SELECT MAX(T1.amount) FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.issued = '1996-10-21'
SELECT T2.gender FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id ORDER BY T1.A11 DESC LIMIT 1
SELECT T2.amount FROM loan AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = ( SELECT MAX(amount) FROM loan ) ORDER BY T2.date LIMIT 1
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Jesenik' AND T1.gender = 'F'
SELECT T1.disp_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND STRFTIME('%Y-%m-%d', T3.date) = '1998-09-02'
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Litomerice' AND strftime('%Y', T1.date) = '1996'; 
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND T4.date LIKE '1996-01-03%'
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'south Bohemia' AND T2.A4 IS NOT NULL ORDER BY T2.A4 DESC LIMIT 1
SELECT ((T1.balance - T2.balance) / T2.balance) * 100 AS increase_rate FROM trans AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1998-12-27' AND T2.date = '1993-03-22' AND T1.type = 'PRIJEM' AND T2.type = 'PRIJEM' AND T1.amount > 0 AND T2.amount > 0 AND T1.account_id IN ( SELECT account_id FROM loan WHERE date = '1993-07-05' )
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000
SELECT T1.account_id, T3.A2, T3.A3 FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.date LIKE '1993%' AND T2.type = 'POPLATEK PO OBRATU'
SELECT T1.account_id ,  T1.frequency FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 LIKE '%East%' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT T1.account_id ,  T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T3.A2 ,  T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990
SELECT T1.account_id, T2.A2, T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 300000
SELECT T1.loan_id ,  T2.A3 ,  AVG(T2.A11) FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id
;
SELECT CAST(SUM(CASE WHEN T1.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T2.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.A2 ORDER BY COUNT(T1.client_id) DESC LIMIT 9
SELECT d.A2, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10; 
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id LEFT JOIN card AS T3 ON T1.client_id = T3.disp_id WHERE T2.A3 = 'South Bohemia' AND T3.card_id IS NULL
SELECT T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status IN ('C', 'D') GROUP BY T1.A3 ORDER BY COUNT(T3.loan_id) DESC LIMIT 1
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M'
SELECT A2 FROM district WHERE A13 = ( SELECT MAX(A13) FROM district )
SELECT COUNT(account_id) AS account_count FROM account WHERE district_id = (     SELECT district_id     FROM district     ORDER BY A16 DESC     LIMIT 1 ); 
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T2.frequency = 'POPLATEK MESICNE' AND T1.balance < 0; 
SELECT COUNT(DISTINCT T1.account_id) AS approved_loans FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T1.amount >= 250000 AND T2.frequency = 'POPLATEK MESICNE' AND T1.status = 'A'; 
SELECT COUNT(*) FROM loan WHERE status IN ('C', 'D') AND account_id IN ( SELECT account_id FROM account WHERE district_id = 1 )
SELECT COUNT(*) FROM client WHERE district_id IN ( SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1, 1 ) AND gender = 'M'
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'
SELECT COUNT(account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek'
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount > 10000 AND STRFTIME('%Y', T3.date) = '1997' GROUP BY T1.A2
;
SELECT T2.account_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold'
SELECT AVG(amount) AS avg_credit_card_amount FROM trans WHERE date BETWEEN '2021-01-01' AND '2021-12-31' AND operation = 'VYBER KARTOU'; 
SELECT T1.account_id FROM trans AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T1.amount < ( SELECT AVG(amount) FROM trans WHERE STRFTIME('%Y', date) = '1998' )
SELECT T1.gender FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id INNER JOIN loan AS T4 ON T2.account_id = T4.account_id WHERE T1.gender = 'F' AND T3.type = 'gold'
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%South Bohemia%'
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T4.A2 = 'Tabor' AND T2.type = 'OWNER'
SELECT DISTINCT T1.frequency FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T2.type != 'OWNER' AND T4.A11 BETWEEN 8000 AND 9000
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'North Bohemia' AND T1.bank = 'AB'
SELECT T3.A2 FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(T2.A15) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date LIKE '1997%' AND T2.A15 > 4000
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A2 = 'Hl.m. Praha'
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id ORDER BY T4.amount DESC LIMIT 1
SELECT T2.A15 FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532
;
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 3356) AND type = 'PRIJEM' AND operation = 'VYBER'; 
SELECT COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 13539
SELECT T1.A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541
SELECT T2.A3 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status = 'A' GROUP BY T2.A3 ORDER BY COUNT(T1.loan_id) DESC LIMIT 1
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.account_id = 32423
;
SELECT COUNT(*) FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A2 = 'Jesenik' )
SELECT T1.client_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'junior' AND T2.issued >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.date BETWEEN DATE('now','-5 year') AND DATE('now') GROUP BY T1.district_id HAVING AVG(T2.frequency) > 10000
SELECT ((SUM(CASE WHEN T2.date BETWEEN '1997-01-01' AND '1997-12-31' THEN T1.amount ELSE 0 END) - SUM(CASE WHEN T2.date BETWEEN '1996-01-01' AND '1996-12-31' THEN T1.amount ELSE 0 END)) / SUM(CASE WHEN T2.date BETWEEN '1996-01-01' AND '1996-12-31' THEN T1.amount ELSE 0 END)) * 100 AS growth_rate FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T4.gender = 'M'
SELECT COUNT(*) FROM trans WHERE date > '1995-12-31' AND operation = 'VYBER KARTOU'
SELECT SUM(CASE WHEN T1.A3 = 'East Bohemia' THEN T1.A16 ELSE 0 END) - SUM(CASE WHEN T1.A3 = 'North Bohemia' THEN T1.A16 ELSE 0 END) AS crime_difference FROM district AS T1
SELECT type ,  COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type
;
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.disp_id = 130
SELECT COUNT(DISTINCT T2.account_id) FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU'
SELECT SUM(amount) AS total_debt, AVG(payments) AS avg_payments FROM loan WHERE account_id IN ( SELECT account_id FROM disp WHERE client_id = 992 )
SELECT SUM(t.amount), c.gender FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE t.trans_id = 851 AND d.type = 'OWNER'
SELECT type FROM card WHERE disp_id = ( SELECT disp_id FROM disp WHERE client_id = 9 )
SELECT SUM(amount) FROM trans WHERE account_id IN ( SELECT account_id FROM disp WHERE client_id = 617 ) AND date LIKE '1998%'
SELECT T1.client_id FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T2.A2 LIKE '%East Bohemia%'
SELECT T1.client_id FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3
SELECT COUNT(DISTINCT d.client_id) AS num_customers FROM disp d JOIN client c ON d.client_id = c.client_id JOIN trans t ON d.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'PRIJEM' AND t.operation = 'SIPO' AND t.amount > 4000; 
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Beroun' AND T1.date > '1996-12-31'
SELECT COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.gender = 'F' AND T3.type = 'junior'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'Prague'
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id IN ( SELECT account_id FROM account WHERE frequency = 'POPLATEK TYDNE' )
SELECT COUNT(DISTINCT T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT T1.account_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 24 AND T2.date < '1997-01-01' ORDER BY T1.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T3.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T4.A11) ASC LIMIT 1
SELECT COUNT(client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.birth_date) = '1920' AND T2.A3 LIKE '%East Bohemia%'
SELECT COUNT(DISTINCT l.account_id)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE'; 
SELECT AVG(T2.amount) FROM trans AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status IN ('C', 'D') AND T1.type = 'POPLATEK PO OBRATU'
SELECT T1.client_id ,  T1.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER'
SELECT T1.client_id ,  strftime('%Y', 'now') - strftime('%Y', T1.birth_date) AS age FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold' AND T2.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(DISTINCT atom.molecule_id) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl'; 
SELECT AVG(CASE WHEN T3.element = 'o' THEN 1 ELSE 0 END) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.bond_type = '-'
SELECT CAST(SUM(CASE WHEN T3.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.label = '+'
SELECT COUNT(*) FROM atom WHERE element = 'na' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') 
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_type) >= 3
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'; 
SELECT molecule_id FROM atom WHERE element = 'c' GROUP BY molecule_id
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'h' GROUP BY T1.label ORDER BY COUNT(T1.label) DESC LIMIT 1
SELECT DISTINCT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T2.label = '-'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8')
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element = 'sn' )
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE (T1.element = 'i' OR T1.element = 's') AND T3.bond_type = '-'
SELECT T1.atom_id, T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT DISTINCT atom_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') 
SELECT CAST(SUM(CASE WHEN T2.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '#' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR000' GROUP BY T1.element ORDER BY T1.element ASC LIMIT 3
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_6' AND T1.molecule_id = 'TR001'
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5' OR atom_id2 = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' AND atom_id2 = 'TR000_2';
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' GROUP BY T1.label ORDER BY T1.label ASC LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT T1.element, T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'
SELECT T1.bond_type ,  CASE WHEN ( SELECT COUNT(*) FROM bond AS T2 WHERE T2.molecule_id = 'TR010' AND T2.bond_type = T1.bond_type ) * 2 > ( SELECT COUNT(*) FROM bond AS T3 WHERE T3.molecule_id = 'TR010' ) THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM bond AS T1 WHERE T1.molecule_id = 'TR010' GROUP BY T1.bond_type ORDER BY COUNT(T1.bond_type) DESC LIMIT 1
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_id) = 1 ORDER BY T1.label LIMIT 3
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' ORDER BY T2.bond_type ASC LIMIT 2
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN ( SELECT bond_id FROM bond WHERE molecule_id = 'TR009' )
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'; 
SELECT T2.bond_type, T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'
SELECT T1.label ,  CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS status FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10'
SELECT COUNT(molecule_id) FROM bond WHERE bond_type = '#';
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19';
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT DISTINCT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'; 
SELECT DISTINCT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p'); 
SELECT T1.label  FROM molecule AS T1  JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.bond_type = ' = ' AND T1.label = '+'  GROUP BY T1.label  ORDER BY COUNT(T2.bond_id) DESC  LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.element = 'i' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id IS NOT NULL
SELECT T1.bond_type, T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T2.atom_id, 7, 2) AS INT) = 45
SELECT element FROM atom WHERE atom_id NOT IN ( SELECT atom_id FROM connected )
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = ' =' GROUP BY T1.label ORDER BY COUNT(T2.bond_type) DESC LIMIT 1
SELECT element FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1
SELECT T1.atom_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'pb'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT CAST(COUNT(bond_id) AS REAL) * 100 / ( SELECT COUNT(*) FROM atom GROUP BY molecule_id ORDER BY COUNT(*) DESC LIMIT 1 ) FROM bond
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')
SELECT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'sn'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT COUNT(*)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br') GROUP BY m.molecule_id; 
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '-'
SELECT CAST(COUNT(CASE WHEN T3.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T3.element) FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'; 
SELECT MAX(T1.label) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca'
SELECT CASE WHEN EXISTS ( SELECT 1 FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM connected WHERE atom_id = 'TR001_1' AND atom_id2 = 'TR001_8' ) AND element = 'cl' ) AND EXISTS ( SELECT 1 FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM connected WHERE atom_id = 'TR001_1' AND atom_id2 = 'TR001_8' ) AND element = 'c' ) THEN 'Yes' ELSE 'No' END AS result
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id INNER JOIN atom AS T4 ON T3.atom_id = T4.atom_id WHERE T2.bond_type = '#' AND T4.element = 'c' AND T1.label = '-' LIMIT 2
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id2 IN ( SELECT atom_id FROM atom WHERE molecule_id = 'TR001' ) AND T1.molecule_id = 'TR001';
SELECT molecule_id FROM bond WHERE bond_type = ' = '
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' LIMIT 2
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_10_11'
SELECT T1.bond_id, CASE WHEN T2.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#'
SELECT DISTINCT T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id LIKE '%4' AND T1.label = '+'
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element), T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca'
;
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_10_11' OR T1.atom_id2 = T2.atom_id AND T1.bond_id = 'TR001_10_11'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CAST(SUM(CASE WHEN T1.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'TR047'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1' AND T1.label = '+'
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS Carcinogenicity FROM molecule AS T1 WHERE T1.molecule_id = 'TR151'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = 'TR151' AND T1.element = 'cl'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+'); 
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = ' = '
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' AND T2.label = '+'
SELECT T1.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2'
SELECT atom_id FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'c'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id; 
SELECT CASE WHEN T1.label = '+' THEN 'Yes' ELSE 'No' END AS carcinogenic FROM molecule AS T1 WHERE T1.molecule_id = 'TR124'
SELECT element FROM atom WHERE molecule_id = 'TR186'; 
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_2_4'; 
;
SELECT T1.label, T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IN ('cl', 'c', 'h')
SELECT T1.bond_id ,  T2.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT DISTINCT T1.molecule_id ,  T2.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.bond_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.element IN ('cl', 'c', 'h')
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*) FROM atom WHERE element = 'cl'; 
SELECT T2.atom_id ,  COUNT(DISTINCT T1.bond_type) FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR346'
SELECT COUNT(DISTINCT T1.molecule_id) AS total_molecules_with_double_bond, SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_compounds FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '='; 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id LEFT JOIN bond AS T4 ON T1.molecule_id = T4.molecule_id WHERE T2.element != 's' AND T4.bond_type != '='
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4' AND T1.label = '+'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label != '-'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id; 
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM connected WHERE bond_id = 'TR001_3_4' ); 
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4') GROUP BY T1.label
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 WHERE T1.molecule_id = 'TR000'
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM atom WHERE element = 'n' ) AND label = '+'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = ' = '
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5
SELECT T3.element FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.molecule_id = 'TR024' AND T2.bond_type = '=' GROUP BY T3.element HAVING COUNT(T3.element) > 1
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T3.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h' AND T2.bond_id IN ( SELECT bond_id FROM bond WHERE bond_type = '#' ); 
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR004' AND 'TR010' AND T2.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label != '-'
SELECT COUNT(DISTINCT T2.molecule_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = ' AND T1.molecule_id IN ( SELECT molecule_id FROM atom WHERE element = 'o' )
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-'
SELECT T2.element, T1.bond_type FROM bond AS T1 INNER JOIN atom AS T2 ON T2.molecule_id = T1.molecule_id WHERE T1.molecule_id = 'TR002'
SELECT T3.atom_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.label = 'TR012' AND T2.bond_type = ' = ' AND T3.atom_id LIKE '%c%'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT name FROM cards WHERE borderColor = 'black' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL
SELECT name FROM cards ORDER BY faceConvertedManaCost DESC LIMIT 1;
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = 2015
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Banned' AND T2.format = 'gladiator'
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.types = 'Artifact' AND T2.side IS NULL AND T1.format = 'vintage'
SELECT T1.id, T1.artist FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'Legal' AND (T1.power = '*' OR T1.power IS NULL); 
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel'; 
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.id ORDER BY COUNT(T2.uuid) DESC LIMIT 1
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Annul' AND T2.number = '29'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM foreign_data
;
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE power = '*';
;
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
;
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isTextless = 0
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Condemn'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isStarter = 1
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'
SELECT T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight';
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards
SELECT COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'German' AND T2.isReprint = 1
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'borderless' AND T2.language = 'Russian'
SELECT CAST(SUM(CASE WHEN T1.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.isStorySpotlight = 1
SELECT COUNT(*) FROM cards WHERE toughness = 99;
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'; 
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'; 
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a';
;
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'
SELECT T1.uuid, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T3.format = 'legacy' AND T2.language != 'English'
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Beacon of Immortality'
SELECT COUNT(*) ,  T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = 'future' AND T1.status = 'legal'
SELECT name, colorIdentity FROM cards WHERE setCode = 'OGW'; 
SELECT T1.name, T2.language FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.convertedManaCost = 5 AND T1.setCode = '10E'
SELECT T1.name, T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT T1.colors ,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20;
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' AND T2.language != 'English'
SELECT T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND hasFoil = 1 AND cardKingdomFoilId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1'; 
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1; 
;
SELECT SUM(convertedManaCost) FROM cards WHERE artist = 'Rob Alexander';
;
SELECT DISTINCT T1.setCode FROM set_translations AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.language = 'Spanish'; 
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards; 
SELECT CAST(COUNT(CASE WHEN T2.language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.id), T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid GROUP BY T1.name
SELECT DISTINCT language FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE baseSetSize = 309) 
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Commander' AND T2.language = 'Portuguese (Brazil)'
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN ( SELECT uuid FROM legalities WHERE status = 'Legal' )
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'; 
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'premodern' AND T3.text LIKE '%This is a triggered mana ability.%' AND T1.side IS NULL
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN ( SELECT uuid FROM legalities WHERE format = 'pauper' )
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation';
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.artist = 'Matthew D. Wilson' AND T1.type = 'Creature' AND T1.layout = 'normal' AND T1.borderColor = 'black' AND T2.language = 'French'
SELECT COUNT(*) FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.rarity = 'rare' AND T1.date = '2007-02-01'
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'
SELECT CAST(SUM(CASE WHEN T2.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'commander' AND T1.status = 'legal'
SELECT CAST(SUM(CASE WHEN T1.language = 'French' AND (T2.power IS NULL OR T2.power = '*') THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.power IS NULL OR T2.power = '*' THEN 1 ELSE 0 END) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.power IS NULL OR T2.power = '*'
SELECT CAST(SUM(CASE WHEN T1.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.language) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'expansion'
SELECT DISTINCT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arena%' ORDER BY name LIMIT 3; 
SELECT T1.language FROM foreign_data AS T1 WHERE T1.multiverseid = 149934;
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT number FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3
SELECT DISTINCT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.mcmName = 'Archenemy' AND T2.code = 'ARC'
SELECT T1.name, T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 5; 
SELECT T2.language ,  T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code  =  T2.setCode WHERE T1.id  =  206
SELECT T1.code, T1.id FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' ORDER BY T1.name ASC LIMIT 2
SELECT T1.id FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.isForeignOnly = 1 AND T1.isFoilOnly = 1 AND T2.language = 'Japanese'
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.language = 'Chinese Simplified' AND T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND s.mtgoCode IS NULL OR s.mtgoCode = ''; 
SELECT id FROM cards WHERE borderColor = 'black'
SELECT id FROM cards WHERE frameEffects = 'extendedart'; 
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.setCode = 'ALL' AND T2.language = 'English'
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Tenth Edition' AND T1.translation = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT code FROM sets WHERE type = 'expansion'
SELECT T2.name ,  T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Boros'
SELECT T2.language, T2.flavorText, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie';
SELECT CAST(SUM(CASE WHEN T2.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Abyssal Horror'
SELECT T1.code FROM sets AS T1 INNER JOIN legalities AS T2 ON T1.code = T2.format WHERE T2.status = 'Legal' AND T1.type LIKE '%Commander%'
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'
SELECT T1.language, T2.type FROM set_translations AS T1 INNER JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T2.watermark = 'Azorius' LIMIT 1
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'; 
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T1.translation FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Italian' AND T2.name LIKE '%Ancestor%s Chosen%' 
SELECT COUNT(*) FROM foreign_data WHERE uuid IN ( SELECT uuid FROM cards WHERE name = 'Angel of Mercy' )
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T3.setCode = T1.setCode WHERE T3.translation = 'Hauptset Zehnte Edition'
SELECT EXISTS(SELECT 1 FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen') AND language = 'Korean');
SELECT COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT CASE WHEN EXISTS ( SELECT 1 FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Angel of Mercy' AND T2.mtgoCode IS NOT NULL ) THEN 'Yes' ELSE 'No' END AS result;
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen'
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(DISTINCT T1.setCode) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.block = 'Ice Age' AND T1.language = 'Italian' AND T1.translation IS NOT NULL
SELECT T1.isForeignOnly FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Adarkar Valkyrie'
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' )
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT DISTINCT artist FROM cards WHERE setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT T1.number FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.setCode = 'Coldsnap' AND T1.number = 4
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power IS NULL OR T1.power = '*'); 
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'
SELECT T2.text FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.language WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T1.setCode = T3.setCode WHERE T3.language = 'Italian' AND T3.setCode = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN T2.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' )
SELECT code FROM sets WHERE releaseDate = '2017-07-14'; 
SELECT keyruneCode FROM sets WHERE code = 'PKHC'; 
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Jim Pavelec' AND T2.hasContentWarning = 1
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Tendo Ice Bridge'; 
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Tenth Edition' AND T2.translation IS NOT NULL
;
SELECT name FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Journey into Nyx Hero''s Path') ORDER BY convertedManaCost DESC LIMIT 1; 
SELECT T2.releaseDate FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Ola de frío'
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3; 
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Chinese Simplified' AND T2.name = 'Mirrodin'
SELECT CAST(SUM(CASE WHEN T2.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 INNER JOIN sets AS T2 ON T1.uuid = T2.code WHERE T1.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Portuguese (Brazil)'
SELECT DISTINCT availability FROM cards WHERE isTextless = 1 AND artist != 'Aleksi Briclot'
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY CAST(REPLACE(SUBSTR(manaCost, 2), '{', '') AS REAL) DESC LIMIT 10
;
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'; 
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Abundance' AND T1.types = 'Enchantment' AND T1.rarity = 'rare' AND T2.status = 'Legal'; 
SELECT T1.format, GROUP_CONCAT(T2.name) AS cards FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Banned' GROUP BY T1.format ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'; 
SELECT artist, GROUP_CONCAT(DISTINCT format) FROM cards JOIN legalities ON cards.uuid = legalities.uuid GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'D. Alexander Gregory' AND T2.hasContentWarning = 1 AND T1.format = 'legacy' AND T2.frameVersion = '1997'
SELECT T1.name, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'
SELECT AVG(T1.id), T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena' GROUP BY artist
SELECT T1.uuid FROM legalities AS T1 JOIN sets AS T2 ON T1.uuid = T2.code WHERE T2.type = 'Old School' AND (T1.status = 'Banned' OR T1.status = 'Restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC
SELECT DISTINCT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'; 
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Korean' AND NOT EXISTS (SELECT 1 FROM set_translations AS T3 WHERE T3.setCode = T1.code AND T3.language LIKE '%Japanese%')
SELECT T1.frameVersion FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned'
SELECT MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1
SELECT COUNT(*) FROM users WHERE CreationDate > '2013-12-31' AND Views > 10
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Eliciting priors from experts'
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1; 
SELECT OwnerDisplayName FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT SUM(T2.CommentCount) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT MAX(T1.AnswerCount) AS MostAnswers FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'; 
SELECT OwnerDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL
;
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.Age > 65 AND p.Score >= 20; 
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'; 
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.Count = ( SELECT MAX(Count) FROM tags )
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'
SELECT COUNT(*) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND STRFTIME('%Y', T1.Date) = '2011'; 
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(DISTINCT T2.DisplayName) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200
SELECT CAST(SUM(CASE WHEN T1.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'; 
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId ORDER BY c.Score DESC LIMIT 1; 
SELECT COUNT(*) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910; 
SELECT FavoriteCount FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0') 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND p.CommentCount = 1; 
SELECT CASE WHEN T2.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 23853 AND T1.CreationDate = '2013-07-12 09:08:18.0'; 
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041)
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini'; 
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) FROM posts INNER JOIN votes ON posts.OwnerUserId = votes.UserId WHERE posts.OwnerUserId = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17; 
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'; 
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'SilentGhost'
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93!'; 
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion'; 
SELECT u.DisplayName, u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data?'
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'
SELECT SUM(T2.Score), T1.WebsiteUrl FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T1.DisplayName = 'Yevgeny'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(T1.BountyAmount) FROM votes AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%data%'
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T1.PostId = T3.Id WHERE T1.BountyAmount = 50 AND T3.Title LIKE '%variance%'
SELECT AVG(T1.ViewCount) , T1.Title , T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Tags LIKE '%<humor>%'
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT OwnerUserId FROM posts ORDER BY ViewCount ASC LIMIT 1
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'; 
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5; 
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York, NY' AND b.Name IN ('Teacher', 'Supporter') GROUP BY u.Id HAVING COUNT(b.Name) = 2; 
SELECT T1.DisplayName, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 1
;
SELECT u.DisplayName, b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Id IN ( SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1 )
SELECT COUNT(b.UserId) AS TeacherBadgesInIndia FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'India' AND b.Name = 'Teacher'; 
SELECT ((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(Name) * 100) - (SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(Name) * 100)) AS percentage_difference FROM badges WHERE Name = 'Student'
SELECT PostHistoryTypeId ,  COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId
SELECT p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; 
;
SELECT Id, OwnerUserId FROM posts WHERE Score > 60;
;
;
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'; 
SELECT COUNT(*) FROM comments WHERE Score > 60
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId ORDER BY T1.Reputation DESC LIMIT 1
SELECT T1.Reputation FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'
SELECT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(UserId) AS Percentage FROM badges; 
SELECT CAST(SUM(CASE WHEN T1.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT SUM(Score) AS TotalCommentScore FROM comments WHERE PostId IN (     SELECT Id     FROM posts     WHERE CreationDate = '2010-07-19 19:19:56.0' ); 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'; 
;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND Id IN ( SELECT UserId FROM badges WHERE Name = 'Supporter' )
SELECT SUM(Views) FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Date = '2010-07-19 19:39:08.0')
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId ORDER BY T1.Reputation ASC LIMIT 1
SELECT Name FROM badges WHERE UserId = ( SELECT Id FROM users WHERE DisplayName = 'Sharpie' )
SELECT COUNT(b.UserId) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'; 
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) AS Ratio FROM votes;
SELECT T1.TagName FROM tags AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.Tags WHERE T2.OwnerDisplayName = 'John Salvatier'
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Daniel Vassallo'
SELECT COUNT(*) FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1
SELECT SUM(CASE WHEN DisplayName = 'Harvey Motulsky' THEN ViewCount ELSE 0 END) AS HarveyMotulskyPopularity, SUM(CASE WHEN DisplayName = 'Noah Snyder' THEN ViewCount ELSE 0 END) AS NoahSnyderPopularity FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE DisplayName IN ('Harvey Motulsky', 'Noah Snyder')
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.OwnerDisplayName = 'Matt Parker' AND v.VoteTypeId > 4
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan'; 
;
SELECT DisplayName FROM users WHERE Id IN ( SELECT UserId FROM badges WHERE Name = 'Organizer' )
SELECT CAST(SUM(CASE WHEN T2.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId INNER JOIN postHistory AS T3 ON T1.Id = T3.PostId WHERE T1.OwnerDisplayName = 'Community'
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id; 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'; 
SELECT COUNT(*) FROM postHistory WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';
SELECT DisplayName , Age FROM users WHERE Views = ( SELECT MAX(Views) FROM users )
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;
SELECT p.Title, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE c.Score > 60
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Location = 'North Pole') AND STRFTIME('%Y', Date) = '2011'; 
SELECT T1.DisplayName, T1.WebsiteUrl FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.FavoriteCount > 150
SELECT COUNT(*), MAX(LastEditDate) FROM posts WHERE Title = 'What is the best introductory Bayesian statistics textbook?'
SELECT T1.LastAccessDate, T1.Location FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Outliers'
SELECT T1.Title FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T1.Title = 'How to tell if something happened in a data set which monitors a value over time'
;
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1
SELECT u.DisplayName, u.Location FROM users AS u JOIN tags AS t ON u.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing'
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title = 'What are principal component scores?'
SELECT OwnerDisplayName FROM posts WHERE ParentId IS NOT NULL ORDER BY Score DESC LIMIT 1
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000; 
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE STRFTIME('%Y', v.CreationDate) = '2011' AND v.BountyAmount = 50; 
SELECT Id FROM users ORDER BY Age ASC LIMIT 1
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%' 
;
;
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id ORDER BY T1.CreationDate ASC LIMIT 1
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.DisplayName ORDER BY COUNT(T1.Name) DESC LIMIT 1
SELECT MIN(T2.CreationDate) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'chl'
;
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date ASC LIMIT 1
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4; 
SELECT AVG(T1.PostId) AS AveragePostsVotedByOldestUsers FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Age = ( SELECT MAX(Age) FROM users )
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000; 
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', T1.CreaionDate) = '2010'
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1; 
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreaionDate) = '2011'
;
SELECT CAST(SUM(CASE WHEN T1.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE STRFTIME('%Y', T2.CreaionDate) = '2011'
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users
SELECT SUM(ViewCount), LastEditorDisplayName FROM posts WHERE Title LIKE '%Computer Game Datasets%' AND PostTypeId = 1 GROUP BY LastEditorDisplayName
SELECT COUNT(*) FROM posts WHERE ViewCount > ( SELECT AVG(ViewCount) FROM posts )
SELECT COUNT(*) AS NumberOfComments FROM comments WHERE PostId = (     SELECT Id     FROM posts     ORDER BY Score DESC     LIMIT 1 ); 
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT DisplayName, Location FROM users WHERE Id = ( SELECT LastEditorUserId FROM posts WHERE Id = 183 ORDER BY LastEditDate DESC LIMIT 1 )
SELECT Name FROM badges WHERE UserId = ( SELECT Id FROM users WHERE DisplayName = 'Emmett' ) ORDER BY Date DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000; 
SELECT strftime('%J', T2.Date) - strftime('%J', T1.CreationDate) AS days_since_creation FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Zolomon'
SELECT COUNT(posts.Id) AS NumberOfPosts, COUNT(comments.Id) AS NumberOfComments FROM posts INNER JOIN comments ON posts.Id = comments.PostId WHERE posts.OwnerUserId = ( SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1 )
SELECT T2.Text, T1.DisplayName FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId INNER JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T3.Title = 'Analysing wind data with R' ORDER BY T2.CreationDate DESC LIMIT 10;
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(T2.Id) FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'careers'
;
SELECT COUNT(CASE WHEN p.PostTypeId = 1 THEN 1 ELSE NULL END) AS AnswerCount, COUNT(CASE WHEN p.PostTypeId = 2 THEN 1 ELSE NULL END) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Clustering 1D data'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(PostId) FROM votes WHERE BountyAmount >= 30;
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT COUNT(*) FROM posts WHERE Score < 20; 
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20; 
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%linear regression%'
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ViewCount BETWEEN 100 AND 150 ORDER BY T1.Score DESC LIMIT 1
;
SELECT COUNT(DISTINCT PostId) FROM comments WHERE Score = 0 AND PostId IN ( SELECT Id FROM posts WHERE ViewCount < 5 )
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1) AND Score = 0;
SELECT COUNT(DISTINCT c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'
SELECT SUM(T2.UpVotes) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text LIKE '%R is also lazy evaluated.%'
SELECT T1.Text FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky'
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0; 
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.height_cm > 200
;
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = ( SELECT id FROM colour WHERE colour = 'Blue' )
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN colour AS T4 ON T1.eye_colour_id = T4.id WHERE T4.colour = 'Blue' AND T3.power_name = 'Agility'
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' AND s.hair_colour_id = ( SELECT id FROM colour WHERE colour = 'Blond' )
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT T1.colour, COUNT(T3.id) AS count FROM colour AS T1 INNER JOIN superhero AS T3 ON T1.id = T3.eye_colour_id INNER JOIN publisher AS T2 ON T3.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' GROUP BY T1.colour ORDER BY count DESC
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength' 
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics'
SELECT T4.publisher_name FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id INNER JOIN publisher AS T4 ON T3.publisher_id = T4.id WHERE T2.attribute_name = 'Speed' ORDER BY T1.attribute_value ASC LIMIT 1
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'
SELECT superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE s.gender_id = 2 AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.id ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id = ( SELECT id FROM race WHERE race = 'Vampire' )
SELECT CAST(SUM(CASE WHEN T3.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id), SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' AND T3.alignment = 'Bad' THEN 1 ELSE 0 END) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id
SELECT SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(attribute_value) FROM hero_attribute
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.gender_id = 1 LIMIT 5
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'No Colour' )
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT full_name FROM superhero WHERE race_id IN ( SELECT id FROM race WHERE race = 'Demi-God' ) LIMIT 5
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 169
SELECT T3.colour FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.height_cm = 185 AND T2.race = 'Human'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > ( SELECT AVG(weight_kg) * 0.79 FROM superhero )
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination' AND T2.attribute_id = 1
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 1
SELECT COUNT(*) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Stealth'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(id) FROM superhero
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T3.attribute_name = 'Durability' AND T4.publisher_name = 'Dark Horse Comics' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id INNER JOIN gender AS T3 ON T3.id = T2.gender_id INNER JOIN publisher AS T4 ON T4.id = T2.publisher_id WHERE T3.gender = 'Female' AND T4.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name ,  T3.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id
SELECT T1.race FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN T1.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT T1.superhero_name, T3.race FROM superhero AS T1 INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.full_name = 'Charles Chandler'
SELECT T1.gender FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T2.superhero_name = 'Agent 13'
SELECT superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(power_id) FROM hero_power AS hp JOIN superhero AS s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo'
SELECT T1.power_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'
SELECT T1.colour FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.skin_colour_id IN ( SELECT id FROM colour WHERE colour = 'Gold' )
SELECT T1.full_name FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'
SELECT superhero_name FROM superhero WHERE alignment_id = 3
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' AND T2.attribute_value = ( SELECT MAX(attribute_value) FROM hero_attribute AS T2 INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' )
SELECT T2.race, T4.alignment FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN alignment AS T4 ON T1.alignment_id = T4.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(COUNT(CASE WHEN s.gender_id = 2 AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(s.gender_id) FROM superhero s JOIN publisher p ON s.publisher_id = p.id; 
