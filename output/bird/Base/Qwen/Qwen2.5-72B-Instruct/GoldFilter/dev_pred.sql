SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS highest_eligible_free_rate FROM `frpm` WHERE `County Name` = 'Alameda'
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS eligible_free_rate  FROM frpm  WHERE `Educational Option Type` = 'Continuation'  ORDER BY eligible_free_rate  LIMIT 3;
SELECT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`District Name` = 'Fresno County Office of Education' AND f.`Charter School (Y/N)` = 1
SELECT s.MailStreet FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 1
SELECT s.Phone  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Charter Funding Type` = 'Directly funded' AND f.`Charter School (Y/N)` = 1 AND s.OpenDate > '2000-01-01'
SELECT COUNT(*)  FROM satscores ss  JOIN schools s  ON ss.cds = s.CDSCode  WHERE ss.AvgScrMath > 400 AND s.Virtual = 'F';
SELECT s.School  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.NumTstTakr > 500 AND s.Magnet = 1
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.NumGE1500 DESC LIMIT 1
SELECT s.NumTstTakr FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)
SELECT COUNT(DISTINCT f.CDSCode)  FROM frpm f  JOIN satscores s ON f.`School Code` = s.cds  WHERE s.AvgScrMath > 560 AND f.`Charter Funding Type` = 'Directly funded'
SELECT `FRPM Count (Ages 5-17)` FROM `frpm` WHERE `CDSCode` = (SELECT `cds` FROM `satscores` WHERE `AvgScrRead` = (SELECT MAX(`AvgScrRead`) FROM `satscores`))
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500
SELECT MAX(f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`)  FROM frpm f  JOIN satscores s  ON f.CDSCode = s.cds  WHERE (s.NumGE1500 / s.NumTstTakr) > 0.3;
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 0 ORDER BY (ss.NumGE1500 * 1.0 / ss.NumTstTakr) DESC LIMIT 3;
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)`  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  ORDER BY f.`Enrollment (Ages 5-17)` DESC  LIMIT 5;
SELECT s.District, MAX(ss.AvgScrRead)  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE s.StatusType = 'Active'  GROUP BY s.District  ORDER BY MAX(ss.AvgScrRead) DESC  LIMIT 1;
SELECT COUNT(*)  FROM satscores AS ss  JOIN schools AS s  ON ss.cds = s.CDSCode  WHERE s.County = 'Alameda' AND ss.NumTstTakr < 100 AND s.StatusType = 'Active'
SELECT s.CDSCode, s.CharterNum, ss.AvgScrWrite  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL  ORDER BY ss.AvgScrWrite DESC;
SELECT COUNT(DISTINCT s.CDSCode)  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE s.County = 'Fresno' AND s.FundingType = 'Direct' AND ss.NumTstTakr <= 250;
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrMath DESC LIMIT 1
SELECT COUNT(*) FROM `frpm` AS f JOIN `schools` AS s ON f.CDSCode = s.CDSCode WHERE s.County = 'Amador' AND f.Low Grade = '9' AND f.High Grade = '12'
SELECT COUNT(*) FROM `frpm` WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1
SELECT s.School, s.StreetAbr FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30
SELECT `School Name`  FROM `frpm`  JOIN `satscores` ON `frpm.CDSCode` = `satscores.cds`  WHERE (`Free Meal Count (K-12)` / `Enrollment (K-12)`) > 0.1 AND `NumGE1500` IS NOT NULL AND `NumGE1500` > 0
SELECT s.`sname`, f.`Charter Funding Type`  FROM `satscores` s  JOIN `frpm` f ON s.`cds` = f.`CDSCode`  WHERE f.`District Name` = 'Riverside'  GROUP BY s.`sname`, f.`Charter Funding Type`  HAVING AVG(s.`AvgScrMath`) > 400;
SELECT s.`School Name`, s.`Street`, s.`City`, s.`State`, s.`Zip` FROM `frpm` f JOIN `schools` s ON f.`CDSCode` = s.`CDSCode` WHERE s.`County` = 'Monterey' AND f.`Free Meal Count (Ages 5-17)` > 800 AND s.`School Type` = 'High School'
SELECT s.School, ss.AvgScrWrite, s.Phone  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01'
SELECT s.School, s.DOC  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.FundingType = 'Locally funded'  AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)      FROM frpm      JOIN schools ON frpm.CDSCode = schools.CDSCode      WHERE schools.FundingType = 'Locally funded' )
SELECT s.OpenDate  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm)
SELECT s.City, f.`Enrollment (K-12)`  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  ORDER BY f.`Enrollment (K-12)` ASC  LIMIT 5;
SELECT (`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS eligible_free_rate  FROM `frpm`  ORDER BY `Enrollment (K-12)` DESC  LIMIT 10, 2
SELECT s.CDSCode, f.`FRPM Count (K-12)` / f.`Enrollment (K-12)` AS FRPM_Rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.SOC = '66' ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 5
SELECT s.Website, f.`School Name`  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;
SELECT (T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)`) AS free_rate FROM `frpm` AS T1 INNER JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson'
SELECT s.AdmEmail1 FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 ORDER BY f.`Enrollment (K-12)` ASC LIMIT 1
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)
SELECT s.Street, s.City, s.Zip, s.State  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE (ss.NumGE1500 * 1.0 / ss.NumTstTakr) =      (SELECT MIN(NumGE1500 * 1.0 / NumTstTakr)       FROM satscores       WHERE NumTstTakr > 0)
SELECT `Website` FROM `schools` WHERE `CDSCode` IN (SELECT `cds` FROM `satscores` WHERE `NumTstTakr` BETWEEN 2000 AND 3000) AND `County` = 'Los Angeles'
SELECT AVG(NumTstTakr)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.County = 'Fresno' AND YEAR(schools.OpenDate) = 1980;
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' ORDER BY ss.AvgScrRead ASC LIMIT 1;
SELECT s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' AND s.School IN (     SELECT s.School     FROM schools s     JOIN satscores ss ON s.CDSCode = ss.cds     WHERE s.Virtual = 'F'     GROUP BY s.County     ORDER BY AVG(ss.AvgScrRead) DESC     LIMIT 5 )
SELECT EdOpsName FROM schools WHERE CDSCode = (SELECT cds FROM satscores WHERE AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores))
SELECT AVG(ss.AvgScrMath) AS AvgMathScore, s.County  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.cds IN (     SELECT cds      FROM satscores      WHERE AvgScrMath IS NOT NULL AND AvgScrRead IS NOT NULL AND AvgScrWrite IS NOT NULL      GROUP BY cds      ORDER BY (AVG(AvgScrMath) + AVG(AvgScrRead) + AVG(AvgScrWrite)) / 3      LIMIT 1 )  GROUP BY ss.cds, s.County;
SELECT AVG(s.AvgScrWrite), sc.City  FROM satscores s  JOIN schools sc ON s.cds = sc.CDSCode  WHERE s.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)  GROUP BY sc.City;
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School;
SELECT s.School, f.`Enrollment (K-12)`  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.DOC = '31'  ORDER BY f.`Enrollment (K-12)` DESC  LIMIT 1;
SELECT CAST(SUM(CASE WHEN strftime('%Y', OpenDate) = '1980' THEN 1 ELSE 0 END) AS REAL) / 12 AS MonthlyAverage FROM schools WHERE County = 'Alameda' AND DOC = '52'
SELECT CAST(SUM(CASE WHEN DOC = '54' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = '52' THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE County = 'Orange' AND StatusType = 'Merged'
SELECT County, School, ClosedDate  FROM schools  WHERE StatusType = 'Closed'  GROUP BY County, School, ClosedDate  ORDER BY County, COUNT(School) DESC  LIMIT 1;
SELECT s.School, s.Street AS PostalStreet FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.AvgScrMath = (SELECT DISTINCT AvgScrMath FROM satscores ORDER BY AvgScrMath DESC LIMIT 1 OFFSET 6) LIMIT 1;
SELECT s.MailStreet, s.School  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL)
SELECT COUNT(*)  FROM satscores AS ss  JOIN schools AS s ON ss.cds = s.CDSCode  WHERE (ss.AvgScrRead + ss.AvgScrMath + ss.AvgScrWrite) >= 1500 AND s.MailCity = 'Lakeport'
SELECT SUM(NumTstTakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno'
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'
SELECT CAST(COUNT(CASE WHEN County = 'Colusa' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 ELSE NULL END) FROM schools WHERE MailState = 'CA'
SELECT COUNT(*)  FROM schools  WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';
SELECT s.Phone, s.Ext  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrWrite = (SELECT DISTINCT AvgScrWrite FROM satscores ORDER BY AvgScrWrite DESC LIMIT 1 OFFSET 332)
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Charter = 1 AND Virtual = 'P'
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52'
SELECT COUNT(s.CDSCode)  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.County = 'Los Angeles'  AND s.Charter = 0  AND (f.`Free Meal Count (K-12)` * 100 / f.`Enrollment (K-12)`) < 18;
SELECT School, City, AdmFName1, AdmLName1 FROM schools WHERE Charter = 1 AND CharterNum = '00D2'
SELECT COUNT(*) FROM `schools` WHERE `MailCity` = 'Hickman' AND `CharterNum` = '00D4'
SELECT (COUNT(CASE WHEN FundingType = 'Locally funded' THEN 1 END) * 100.0 / COUNT(*)) AS Ratio FROM schools WHERE County = 'Santa Clara' AND Charter = 1
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT COUNT(*) FROM `schools` WHERE `City` = 'San Francisco' AND `DOCType` = 'Community College District' AND strftime('%Y', `ClosedDate`) = '1989'
SELECT County  FROM schools  WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31'  GROUP BY County  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT NCESDist FROM schools WHERE SOC = '31'
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') AND School LIKE '%District Community Day School%'
SELECT `District Code` FROM `frpm` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `City` = 'Fresno' AND `Magnet` = 0)
SELECT SUM(`Enrollment (Ages 5-17)`)  FROM `frpm`  JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`  WHERE `schools`.`City` = 'Fremont' AND `schools`.`EdOpsCode` = 'SSS' AND `frpm`.`Academic Year` = '2014-2015'
SELECT t1.`FRPM Count (Ages 5-17)` FROM `frpm` AS t1 JOIN `schools` AS t2 ON t1.CDSCode = t2.CDSCode WHERE t2.MailStreet = 'PO Box 1040' AND t2.SOCType = 'Youth Authority Schools (Public)'
SELECT `Low Grade` FROM `frpm` WHERE `EdOpsCode` = 'SPECON' AND `NCESDist` = '0613360' AND `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `NCESDist` = '0613360' AND `EdOpsCode` = 'SPECON')
SELECT s.EILName, s.School  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`County Code` = '37' AND f.`NSLP Provision Status` = 'Breakfast Provision 2'
SELECT s.City  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.County = 'Merced' AND f.`NSLP Provision Status` = 'Lunch Provision 2' AND f.Low Grade = '9' AND f.High Grade = '12' AND s.EILCode = 'HS'
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) * 100 AS 'Percent (%) Eligible FRPM (Ages 5-17)' FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved = 'K-9'
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1;
SELECT s.`School Name`, s.`Latitude`, f.`School Type`  FROM `schools` s  JOIN `frpm` f ON s.`CDSCode` = f.`CDSCode`  ORDER BY s.`Latitude` DESC  LIMIT 1;
SELECT s.City, f.`Low Grade`, f.`School Name`  FROM `schools` s  JOIN `frpm` f ON s.CDSCode = f.CDSCode  WHERE s.State = 'CA'  ORDER BY s.Latitude ASC  LIMIT 1;
SELECT GSoffered FROM schools ORDER BY ABS(GSoffered) DESC LIMIT 1
SELECT s.City, COUNT(s.CDSCode) AS NumberOfSchools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Magnet = 1 AND s.GSoffered = 'K-8' AND f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY s.City;
SELECT `AdmFName1`, `District` FROM `schools` WHERE `AdmFName1` IS NOT NULL GROUP BY `AdmFName1` ORDER BY COUNT(`AdmFName1`) DESC LIMIT 2
SELECT `District Code`, (`Free Meal Count (K-12)` / `Enrollment (K-12)`) * 100 AS 'Percent Eligible Free (K-12)'  FROM `frpm`  JOIN `schools` ON `frpm`.`CDSCode` = `schools`.`CDSCode`  WHERE `schools`.`AdmFName1` = 'Alusine'
SELECT `County`, `District`, `School`, `AdmLName1`  FROM `schools`  WHERE `CharterNum` = '40'
SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino'  AND District = 'San Bernardino City Unified'  AND SOC = '62'  AND DOC = '54'  AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'  AND AdmEmail1 IS NOT NULL OR AdmEmail2 IS NOT NULL OR AdmEmail3 IS NOT NULL;
SELECT `School`, `AdmEmail1`  FROM `schools`  WHERE `CDSCode` = (     SELECT `cds`      FROM `satscores`      WHERE `NumGE1500` IS NOT NULL      ORDER BY `NumGE1500` DESC      LIMIT 1 )
SELECT COUNT(a.district_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'East Bohemia'
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE d.A3 = 'Prague'
SELECT CASE WHEN AVG(A12) > AVG(A13) THEN '1995' ELSE '1996' END AS higher_unemployment_year FROM district
SELECT COUNT(DISTINCT c.district_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000;
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;
SELECT a.account_id, (SELECT MAX(d2.A11) FROM district d2) - d.A11 AS salary_gap FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(c2.birth_date) FROM client c2 WHERE c2.gender = 'F') ORDER BY d.A11 ASC LIMIT 1;
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN client c ON a.district_id = c.district_id  WHERE c.birth_date = (SELECT MAX(birth_date) FROM client)  AND d.A11 = (SELECT MAX(A11) FROM district)
SELECT COUNT(*)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'
SELECT DISTINCT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT'
SELECT a.account_id, a.frequency, l.amount  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date LIKE '1997%' AND a.frequency = 'POPLATEK TYDNE'  ORDER BY l.amount  LIMIT 1;
SELECT l.account_id  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration > 12 AND a.opening_date BETWEEN '1993-01-01' AND '1993-12-31' ORDER BY l.amount DESC LIMIT 1;
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id JOIN disp dp ON c.client_id = dp.client_id WHERE c.gender = 'F'  AND c.birth_date < '1950-01-01'  AND d.A2 = 'Sokolov';
SELECT account_id FROM trans WHERE date = (SELECT MIN(date) FROM trans WHERE date >= '1995-01-01' AND date < '1996-01-01')
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.amount > 3000;
SELECT client_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card WHERE issued = '1994-03-03')
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14'
SELECT a.district_id  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date = '1994-08-25'
SELECT MAX(amount) FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE date = '1996-10-21')
SELECT gender  FROM client  WHERE district_id = (     SELECT district_id      FROM district      ORDER BY A11 DESC      LIMIT 1 )  ORDER BY birth_date ASC  LIMIT 1
SELECT t1.amount  FROM trans t1 JOIN account a ON t1.account_id = a.account_id JOIN ( 	SELECT l.account_id, MAX(l.amount) as max_loan 	FROM loan l 	GROUP BY l.account_id 	ORDER BY max_loan DESC 	LIMIT 1 ) t2 ON a.account_id = t2.account_id WHERE t1.date > a.date ORDER BY t1.date ASC LIMIT 1;
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F'
SELECT d.disp_id FROM disp d JOIN trans t ON d.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02'
SELECT COUNT(*) FROM `account` a JOIN `district` d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND YEAR(a.date) = 1996
SELECT d.A2 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29'
SELECT c.birth_date  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.amount = 98832 AND l.date = '1996-01-03'
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A3 = 'Prague'  ORDER BY a.date  LIMIT 1;
SELECT (CAST(COUNT(CASE WHEN c.gender = 'M' THEN 1 ELSE NULL END) AS REAL) / COUNT(c.gender)) * 100 AS male_percentage  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A3 = 'south Bohemia'  GROUP BY d.A3  ORDER BY CAST(d.A4 AS INTEGER) DESC  LIMIT 1;
SELECT ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id JOIN loan ON t1.account_id = loan.account_id JOIN disp ON t1.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE t1.date = '1993-03-22' AND t2.date = '1998-12-27' AND loan.date = '1993-07-05' AND disp.type = 'OWNER'
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM loan
SELECT (SUM(CASE WHEN status = 'C' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM loan WHERE amount < 100000
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.date >= '1993-01-01' AND a.date <= '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU'
SELECT a.account_id, a.frequency  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A3 = 'east Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice')
SELECT d.A2, d.A3  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.account_id = 4990;
SELECT a.account_id, d.A2 AS district, d.A3 AS region  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.amount > 300000;
SELECT l.loan_id, d.A2 AS district, d.A11 AS average_salary  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.duration = 60;
SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D'
SELECT CAST(SUM(CASE WHEN d.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.date >= '1993-01-01' AND a.date <= '1993-12-31'
SELECT account_id FROM account WHERE account_id IN (SELECT account_id FROM statement WHERE type = 'POPLATEK MESICNE')
SELECT d.A2, COUNT(*) AS female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id JOIN disp dp ON c.client_id = dp.client_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;
SELECT d.A2, t.amount  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%'  ORDER BY t.amount DESC  LIMIT 10;
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN client c ON d.client_id = c.client_id  JOIN district ds ON c.district_id = ds.district_id  WHERE ds.A3 = 'South Bohemia' AND d.type = 'OWNER' AND d.client_id NOT IN (     SELECT DISTINCT d2.client_id      FROM disp d2      JOIN card ON d2.account_id = card.account_id )
SELECT d.A3 FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(loan.amount)  FROM loan  JOIN account ON loan.account_id = account.account_id  JOIN client ON account.district_id = client.district_id  WHERE client.gender = 'M'
SELECT A2 AS district_name, A13 AS unemployment_rate FROM district ORDER BY A13 DESC LIMIT 1
SELECT COUNT(*)  FROM `account`  WHERE `district_id` = (     SELECT `district_id`      FROM `district`      ORDER BY `A16` DESC      LIMIT 1 )
SELECT COUNT(DISTINCT t.account_id)  FROM trans t  JOIN account a ON t.account_id = a.account_id  WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0;
SELECT COUNT(DISTINCT account_id)  FROM loan  WHERE date BETWEEN '1995-01-01' AND '1997-12-31'  AND amount >= 250000  AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE')
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.district_id = 1 AND (l.status = 'C' OR l.status = 'D')
SELECT COUNT(*)  FROM client  WHERE gender = 'M' AND district_id = (     SELECT district_id      FROM district      ORDER BY A15 DESC      LIMIT 1 OFFSET 1 )
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'gold' AND disp.type = 'OWNER'
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek')
SELECT DISTINCT d.district_id  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount > 10000 AND YEAR(t.date) = 1997;
SELECT a.account_id  FROM account a  JOIN trans t ON a.account_id = t.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.k_symbol = 'SIPO' AND d.A2 = 'Pisek'
SELECT DISTINCT account_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card WHERE type = 'gold')
SELECT AVG(amount) AS average_amount, strftime('%m', date) AS month  FROM trans  WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) = '2021'  GROUP BY month;
SELECT DISTINCT d.client_id  FROM disp d  JOIN trans t ON d.account_id = t.account_id  WHERE t.operation = 'VYBER KARTOU' AND t.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date LIKE '1998%') AND t.date LIKE '1998%'
SELECT DISTINCT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cr ON d.disp_id = cr.disp_id  JOIN loan l ON d.account_id = l.account_id  WHERE c.gender = 'F'
SELECT COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 = 'south Bohemia'
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp dp ON a.account_id = dp.account_id  WHERE d.A2 = 'Tabor' AND dp.type = 'OWNER'
SELECT DISTINCT d.type  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON a.district_id = dis.district_id  WHERE d.type != 'OWNER' AND dis.A11 > 8000 AND dis.A11 <= 9000;
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB'
SELECT DISTINCT d.A2  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.type = 'VYDAJ'
SELECT AVG(d.A15)  FROM district d  JOIN account a ON d.district_id = a.district_id  WHERE d.district_id > 4000 AND YEAR(a.date) >= 1997;
SELECT COUNT(*)  FROM card  JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'classic' AND disp.type = 'OWNER'
SELECT COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A2 = 'Hl.m. Praha'
SELECT (COUNT(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 END) / COUNT(card_id) * 100.0) AS percent_gold FROM card
SELECT d.client_id FROM disp d JOIN loan l ON d.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan)
SELECT d.A15 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id = 532
SELECT district_id FROM account WHERE account_id = (SELECT account_id FROM `order` WHERE order_id = 33333)
SELECT t.*  FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.client_id = 3356 AND t.operation = 'VYBER'
SELECT COUNT(*)  FROM `account` a JOIN `loan` l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE disp.client_id = 13539 AND disp.type = 'OWNER'
SELECT d.A3 FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.client_id = 3541
SELECT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT c.client_id  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN order o ON a.account_id = o.account_id  WHERE o.order_id = 32423
SELECT t.*  FROM `trans` t JOIN `account` a ON t.account_id = a.account_id WHERE a.district_id = 5;
SELECT COUNT(*) FROM `account` a JOIN `district` d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik'
SELECT DISTINCT d.client_id  FROM disp d  JOIN card c ON d.disp_id = c.disp_id  WHERE c.type = 'junior' AND c.issued >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client  WHERE district_id IN (SELECT district_id FROM district WHERE A11 > 10000)
SELECT ((SUM(CASE WHEN l.date BETWEEN '1997-01-01' AND '1997-12-31' THEN l.amount ELSE 0 END) - SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END)) / SUM(CASE WHEN l.date BETWEEN '1996-01-01' AND '1996-12-31' THEN l.amount ELSE 0 END)) * 100 AS growth_rate FROM loan l JOIN disp d ON l.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'
SELECT COUNT(*) FROM `trans` WHERE `operation` = 'VYBER KARTOU' AND `date` > '1995-12-31'
SELECT SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) AS difference FROM district
SELECT type, COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10  GROUP BY type;
SELECT a.frequency, SUM(o.amount)  FROM account a  JOIN order o ON a.account_id = o.account_id  WHERE a.account_id = 3  GROUP BY a.frequency;
SELECT YEAR(birth_date) FROM client WHERE client_id = 130
SELECT COUNT(DISTINCT d.account_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'
SELECT l.amount, l.status  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN client c ON a.district_id = c.district_id  WHERE c.client_id = 992;
SELECT SUM(t.balance), c.gender  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN client c ON a.district_id = c.district_id  WHERE c.client_id = 4 AND t.trans_id > 851;
SELECT c.type FROM card AS c JOIN disp AS d ON c.disp_id = d.disp_id WHERE d.client_id = 9
SELECT SUM(t.amount)  FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `client` c ON a.district_id = c.district_id WHERE c.client_id = 617 AND YEAR(t.date) = 1998;
SELECT c.client_id, c.birth_date  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN district d ON c.district_id = d.district_id  WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31'  AND d.A3 = 'East Bohemia'
SELECT c.client_id  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN loan l ON a.account_id = l.account_id  WHERE c.gender = 'F'  ORDER BY l.amount DESC  LIMIT 3
SELECT COUNT(DISTINCT c.district_id)  FROM client c  JOIN account a ON c.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND t.amount > 4000  AND t.k_symbol = 'SIPO'
SELECT COUNT(*) FROM `account` a JOIN `district` d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31'
SELECT COUNT(*)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card ca ON d.disp_id = ca.disp_id  WHERE c.gender = 'F' AND ca.type = 'junior'
SELECT CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE d.A3 = 'Prague'
SELECT CAST(COUNT(CASE WHEN c.gender = 'M' THEN 1 END) AS REAL) * 100 / COUNT(*) FROM client c JOIN account a ON c.district_id = a.district_id WHERE a.frequency = 'POPLATEK TYDNE'
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'
SELECT a.account_id  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.duration > 24 AND a.date < '1997-01-01'  ORDER BY l.amount ASC  LIMIT 1;
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') AND d.A11 = (SELECT MIN(A11) FROM district)
SELECT COUNT(*)  FROM `client` c  JOIN `district` d ON c.district_id = d.district_id  WHERE YEAR(c.birth_date) = 1920 AND d.A3 = 'east Bohemia';
SELECT COUNT(*) FROM `account` a JOIN `loan` l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.duration = 24
SELECT AVG(payments) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK PO OBRATU')
SELECT T1.client_id, T3.A2 FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'OWNER'
SELECT c.client_id, DATE_PART('year', AGE(c.birth_date)) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.type = 'gold' AND d.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl'
SELECT AVG(CASE WHEN element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-')
SELECT AVG(bond_count)  FROM (     SELECT m.molecule_id, COUNT(b.bond_type) AS bond_count     FROM molecule m     LEFT JOIN bond b ON m.molecule_id = b.molecule_id     WHERE m.label = '+' AND b.bond_type = '-'     GROUP BY m.molecule_id ) AS subquery;
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'na' AND m.label = '-'
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+'
SELECT (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.atom_id)) AS percentage  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '=';
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#'
SELECT COUNT(*) FROM `atom` WHERE `element` != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR004_8_9'
SELECT DISTINCT a.element  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '=';
SELECT label, COUNT(label) AS count_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY label ORDER BY count_label DESC LIMIT 1;
SELECT DISTINCT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'cl'
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')
SELECT a.atom_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE m.label = '-'
SELECT element, COUNT(element) AS count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' GROUP BY element ORDER BY count ASC LIMIT 1
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn')
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'
SELECT DISTINCT a.atom_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE a.molecule_id = 'TR181'  UNION  SELECT DISTINCT c.atom_id2  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id2  WHERE a.molecule_id = 'TR181'
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element != 'f' THEN m.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT m.molecule_id)  FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'
SELECT CAST(SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.molecule_id) AS percent  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE m.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3
SELECT bond_id FROM bond WHERE molecule_id = 'TR001' AND bond_id = 'TR001_2_6'
SELECT COUNT(CASE WHEN label = '+' THEN 1 END) - COUNT(CASE WHEN label = '-' THEN 1 END) AS difference FROM molecule
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT molecule_id FROM bond WHERE bond_type = '=' GROUP BY molecule_id ORDER BY molecule_id LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent  FROM bond  WHERE molecule_id = 'TR008'  GROUP BY molecule_id
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT a.element, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id = 'TR060'
SELECT bond_type, molecule_id, label  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE molecule_id = 'TR010'  GROUP BY bond_type  ORDER BY COUNT(bond_type) DESC  LIMIT 1;
SELECT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-' AND m.label = '-'  ORDER BY m.molecule_id  LIMIT 3
SELECT b.bond_id  FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.molecule_id = 'TR006' GROUP BY b.bond_id ORDER BY b.bond_id LIMIT 2
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009')
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+' AND a.element = 'br'
SELECT b.bond_type, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_id = 'TR001_6_9'
SELECT m.molecule_id, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS is_carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10'
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19'
SELECT element FROM atom WHERE molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT DISTINCT m.molecule_id, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25'  AND m.label = '+'
SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.bond_id = a2.atom_id WHERE a1.element = 'p' AND a2.element = 'n' UNION SELECT c.bond_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.bond_id = a2.atom_id WHERE a1.element = 'n' AND a2.element = 'p'
SELECT m.molecule_id, m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '='  GROUP BY m.molecule_id  ORDER BY COUNT(b.bond_type) DESC  LIMIT 1;
SELECT CAST(COUNT(bond_id) AS REAL) / COUNT(DISTINCT atom_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'i')
SELECT bond.bond_type, bond.bond_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE SUBSTR(connected.atom_id, 7, 2) + 0 = 45;
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected)
SELECT a1.atom_id, a2.atom_id  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.molecule_id = 'TR041' AND b.bond_type = '#'
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR144_8_19'
SELECT m.molecule_id, COUNT(b.bond_type) AS double_bond_count  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '+' AND b.bond_type = '='  GROUP BY m.molecule_id  ORDER BY double_bond_count DESC  LIMIT 1;
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE element = 'pb')
SELECT DISTINCT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'
SELECT CAST(COUNT(t1.bond_id) AS REAL) * 100 / (SELECT COUNT(atom_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM connected GROUP BY atom_id ORDER BY COUNT(atom_id) DESC LIMIT 1)) FROM bond AS t1 JOIN connected AS t2 ON t1.bond_id = t2.bond_id
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-';
SELECT COUNT(*) FROM `atom` WHERE `element` IN ('c', 'h')
SELECT atom_id2 FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 's')
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'sn'
SELECT COUNT(DISTINCT element)  FROM atom  WHERE molecule_id IN (     SELECT molecule_id      FROM bond      WHERE bond_type = '-' )
SELECT COUNT(*)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND a.element IN ('p', 'br')
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT molecule_id FROM bond WHERE bond_type = '-' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT (CAST(COUNT(CASE WHEN a.element = 'cl' THEN a.atom_id END) AS REAL) / COUNT(a.atom_id)) * 100 AS percent FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030'
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050' ORDER BY molecule_id;
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_10_11'
SELECT COUNT(DISTINCT b.bond_id)  FROM bond b  JOIN atom a ON b.molecule_id = a.molecule_id  WHERE a.element = 'i'
SELECT CASE WHEN SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS result FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR001_1_8'  AND a1.element = 'cl'  AND a2.element = 'c'
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-' LIMIT 2;
SELECT CAST(COUNT(CASE WHEN a.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT a.molecule_id) AS percentage  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001'
SELECT molecule_id FROM bond WHERE bond_type = '='
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR000_1_2'
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '-' AND m.label = '-';
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11'
SELECT b.bond_id, CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenic  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#';
SELECT element, COUNT(*) AS tally FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND SUBSTR(atom.atom_id, 7, 1) = '4' GROUP BY element;
SELECT m.label, CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(a.element) AS ratio FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.molecule_id = 'TR006' GROUP BY m.label;
SELECT m.label AS is_carcinogenic FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'
SELECT DISTINCT b.bond_type  FROM bond b  JOIN atom a ON b.molecule_id = a.molecule_id  WHERE a.element = 'c'
SELECT a1.element, a2.element  FROM atom a1  JOIN connected c1 ON a1.atom_id = c1.atom_id  JOIN bond b ON c1.bond_id = b.bond_id  JOIN connected c2 ON b.bond_id = c2.bond_id  JOIN atom a2 ON c2.atom_id = a2.atom_id  WHERE b.bond_id = 'TR001_10_11' AND a1.atom_id != a2.atom_id
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM bond) FROM bond WHERE bond_type = '#'
SELECT CAST(COUNT(CASE WHEN bond_type = '=' THEN bond_id ELSE NULL END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047'
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.atom_id = 'TR001_1'
SELECT label FROM molecule WHERE label = '+' AND molecule_id = 'TR151'
SELECT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'f', 'i', 'pb', 'te', 'sn')
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id, molecule_id, element FROM atom WHERE element = 'c' AND substr(molecule_id, 3, 3) >= '010' AND substr(molecule_id, 3, 3) <= '050'
SELECT COUNT(*) FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')
SELECT b.bond_id  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '=' AND m.label = '+'
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+'
SELECT bond.molecule_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE connected.atom_id = 'TR000_1' AND bond.bond_id = 'TR000_1_2'
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'
SELECT (CAST(COUNT(CASE WHEN m.label = '+' AND a.element = 'h' THEN m.molecule_id END) AS REAL) / COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id;
SELECT label FROM molecule WHERE label = '+' AND molecule_id = 'TR124'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR000_2_4'
SELECT COUNT(b.bond_id), m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.molecule_id = 'TR006' AND b.bond_type = '=';
SELECT m.molecule_id, a.element  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'
SELECT b.bond_id, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_type = '-'
SELECT atom.molecule_id, GROUP_CONCAT(DISTINCT atom.element) AS elements FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' GROUP BY atom.molecule_id;
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR000_2_3'
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_count FROM atom a LEFT JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;
SELECT COUNT(DISTINCT b.molecule_id) AS total_molecules, SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=';
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  LEFT JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element != 's' AND (b.bond_type != '=' OR b.bond_type IS NULL)
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '-'
SELECT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'
SELECT m.molecule_id, m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'c' AND m.label = '-';
SELECT CAST(SUM(CASE WHEN m.label = '+' AND a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT a.molecule_id) AS percentage FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id;
SELECT DISTINCT a.molecule_id  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_1_7'
SELECT COUNT(*) FROM `atom` a JOIN `connected` c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_3_4'
SELECT b.bond_type FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2' OR c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1'
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE label = 'TR000'
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'n' AND m.label = '+';
SELECT DISTINCT a.molecule_id  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element = 's' AND b.bond_type = '=';
SELECT m.molecule_id, m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '-'  GROUP BY m.molecule_id  HAVING COUNT(a.atom_id) > 5;
SELECT DISTINCT a.element  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '=' AND a.molecule_id = 'TR024'
SELECT m.molecule_id, m.label, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id, m.label ORDER BY atom_count DESC LIMIT 1;
SELECT (SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE a.element = 'h' AND b.bond_type = '#'
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+'
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element = 'o' AND b.bond_type = '=';
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND m.label = '-'
SELECT a.element, b.bond_type  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) AND b.bond_id = c.bond_id  WHERE a.molecule_id = 'TR002'
SELECT a.atom_id  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR012'
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element = 'o'
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT * FROM `cards` WHERE `borderColor` IS NULL AND `cardKingdomId` IS NOT NULL AND `cardKingdomFoilId` IS NULL
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)
SELECT id FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015'
SELECT c.id, c.uuid  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned'
SELECT c.name, l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage'
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL)   AND l.format = 'commander'   AND l.status = 'Legal'
SELECT c.id, r.text, c.hasContentWarning  FROM cards c  LEFT JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Stephen Daniele'  AND c.hasContentWarning = 1;
SELECT c.text AS card_text, r.text AS ruling_text  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  GROUP BY c.uuid  ORDER BY COUNT(r.uuid) DESC  LIMIT 1;
SELECT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Annul' AND c.number = '29'
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese'
SELECT (CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) / COUNT(id)) * 100 AS percentage FROM foreign_data
SELECT s.name, s.totalSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian'
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT st.language FROM cards c JOIN set s ON c.id = s.card_id JOIN set_translations st ON s.set_translation_id = st.id WHERE c.name = 'Angel of Mercy'
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'restricted' AND c.isTextless = 0;
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn'
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.isStarter = 1 AND l.status = 'restricted'
SELECT l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'
SELECT `format` FROM `legalities` WHERE `uuid` = (SELECT `uuid` FROM `cards` WHERE `name` = 'Benalish Knight')
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Phyrexian'
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN id END) * 100.0 / COUNT(id)) AS percentage FROM cards
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'German' AND c.isReprint = 1
SELECT COUNT(*)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE c.borderColor = 'borderless' AND f.language = 'Russian'
SELECT CAST(COUNT(CASE WHEN fd.language = 'French' THEN c.id END) AS REAL) * 100 / COUNT(c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.isStorySpotlight = 1;
SELECT COUNT(*) FROM `cards` WHERE `toughness` = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'black' AND `availability` = 'mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0.0
SELECT layout FROM cards WHERE keywords = 'Flying'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel' AND subtypes IS NOT NULL;
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Chinese Simplified'
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.availability = 'paper' AND fd.language = 'Japanese'  GROUP BY c.name  HAVING COUNT(DISTINCT c.availability) = 1 AND COUNT(DISTINCT fd.language) = 1
SELECT COUNT(*) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white'
SELECT c.uuid, fd.language  FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN foreign_data fd ON c.uuid = fd.uuid WHERE l.format = 'legacy'
SELECT r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Beacon of Immortality'
SELECT COUNT(c.id) AS numberOfCards, l.id AS legalityStatus FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' GROUP BY l.id;
SELECT id, colors FROM cards WHERE setCode = 'OGW'
SELECT c.id, st.language  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE c.setCode = '10E' AND c.convertedManaCost = 5;
SELECT c.uuid, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.originalType = 'Creature - Elf'
SELECT c.colors, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.id BETWEEN 1 AND 20;
SELECT c.name, c.uuid, fd.name AS foreign_name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B'
SELECT c.name, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3;
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1
SELECT COUNT(*) FROM cards WHERE frameVersion LIKE '%1993%' AND availability LIKE '%paper%' AND hasContentWarning = 1
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'
SELECT SUM(CAST(REPLACE(manaCost, '{', '') AS INTEGER)) AS total_unconverted_mana FROM cards WHERE artist = 'Rob Alexander';
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability LIKE '%arena%' AND (subtypes IS NOT NULL OR supertypes IS NOT NULL)
SELECT setCode FROM set_translations WHERE language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'
SELECT (CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(id)) * 100 AS percentage, id  FROM cards  WHERE isStorySpotlight = 1 AND isTextless = 0  ORDER BY id;
SELECT name, (100.0 * COUNT(*) OVER (PARTITION BY language) / COUNT(*) OVER ()) AS percentage  FROM foreign_data  WHERE language = 'Spanish'  ORDER BY name;
SELECT `language` FROM `set_translations` WHERE `setCode` IN (SELECT `code` FROM `sets` WHERE `baseSetSize` = 309)
SELECT COUNT(*) FROM `sets` AS s JOIN `set_translations` AS st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)'
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal'
SELECT DISTINCT c.subtypes, c.supertypes  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE f.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  JOIN rulings r ON c.uuid = r.uuid  WHERE l.format = 'premodern'  AND r.text = 'This is a triggered mana ability.'  AND c.side IS NULL;
SELECT c.id  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = 'Erica Yang' AND c.availability = 'paper' AND l.format = 'pauper'
SELECT artist FROM cards WHERE uuid IN (SELECT uuid FROM foreign_data WHERE flavorText = 'Das perfekte Gegenmittel zu einer dichten Formation')
SELECT fd.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'French' AND c.types = 'Creature' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson'
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'rare' AND r.date = '2007-02-01'
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.baseSetSize = 180 AND s.block = 'Ravnica'
SELECT (CAST(COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) AS REAL) / COUNT(c.id)) * 100  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'commander' AND l.status = 'Legal'
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'
SELECT CAST(SUM(CASE WHEN st.language = 'Japanese' AND s.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(st.language)  FROM set_translations st  JOIN sets s ON st.setCode = s.code;
SELECT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'borderless' AND `edhrecRank` > 12000
SELECT COUNT(*) FROM `cards` WHERE `isOversized` = 1 AND `isReprint` = 1 AND `isPromo` = 1
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3
SELECT language FROM foreign_data WHERE multiverseid = 149934
SELECT cardKingdomFoilId, cardKingdomId  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  ORDER BY cardKingdomFoilId  LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT id FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'
SELECT `name`  FROM `sets`  WHERE `mtgoCode` IS NULL OR `mtgoCode` = ''  ORDER BY `name`  LIMIT 3
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.code = 'ARC'
SELECT s.name, st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 5;
SELECT st.language, s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206
SELECT s.id, s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.block = 'Shadowmoor'  ORDER BY s.name  LIMIT 2
SELECT s.id, s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.isFoilOnly = 1 AND s.isForeignOnly = 1 AND st.language = 'Japanese'
SELECT s.code, s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Russian'  ORDER BY s.baseSetSize DESC  LIMIT 1;
SELECT (CAST(SUM(CASE WHEN st.language = 'Chinese Simplified' AND s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(s.isOnlineOnly)) * 100 AS percentage FROM sets s JOIN set_translations st ON s.code = st.setCode;
SELECT COUNT(DISTINCT s.code)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '')
SELECT id FROM cards WHERE borderColor = 'black'
SELECT COUNT(id) AS count, id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id
SELECT id FROM cards WHERE borderColor = 'black' AND isFullArt = 1
SELECT language FROM set_translations WHERE id = 174
SELECT name FROM sets WHERE code = 'ALL'
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT code FROM sets WHERE type = 'expansion'
SELECT fd.name, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'boros'
SELECT fd.language, fd.flavorText, c.watermark  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'colorpie'
SELECT (CAST(COUNT(CASE WHEN cards.convertedManaCost = 10 THEN 1 ELSE NULL END) AS REAL) / COUNT(cards.convertedManaCost)) * 100 AS percentage  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Abyssal Horror'
SELECT code FROM sets WHERE type = 'expansion commander'
SELECT fd.name, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'abzan'
SELECT fd.language, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'azorius'
SELECT COUNT(*)  FROM `cards`  WHERE `artist` = 'Aaron Miller'  AND `cardKingdomFoilId` IS NOT NULL  AND `cardKingdomId` IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'
SELECT name FROM cards WHERE isTextless = 0
SELECT LENGTH(manaCost) - LENGTH(REPLACE(manaCost, '{', '')) + 1 AS unconvertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE border_color = 'black' AND availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE name = 'Serra Angel' OR name = 'Shrine Keeper' ORDER BY convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  WHERE st.language = 'Italian' AND c.name = 'Ancestor''s Chosen'
SELECT COUNT(DISTINCT `translation`) FROM `set_translations` WHERE `setCode` IN (SELECT `setCode` FROM `cards` WHERE `name` = 'Angel of Mercy')
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'
SELECT st.translation  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Korean'
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'
SELECT baseSetSize FROM sets WHERE code = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition')
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified'
SELECT s.mtgoCode IS NOT NULL AS appearedOnline FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy'
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen'
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL
SELECT s.isForeignOnly FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Adarkar Valkyrie'
SELECT COUNT(DISTINCT s.code)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.baseSetSize < 100;
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')
SELECT name FROM cards WHERE setCode = 'CSP' AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode = 'CSP')
SELECT artist FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap') AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = '4'
SELECT COUNT(*)  FROM cards AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
SELECT fd.flavorText FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'Italian' AND c.name = 'Ancestor''s Chosen'
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL
SELECT T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'
SELECT c.name, fd.text  FROM cards c  JOIN sets s ON c.setCode = s.code  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE s.name = 'Coldsnap' AND fd.language = 'Italian'
SELECT fd.name  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  JOIN sets s ON c.setCode = s.code  WHERE fd.language = 'Italian' AND s.name = 'Coldsnap'  AND c.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap'))
SELECT r.date  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name = 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT c.text, r.text, c.hasContentWarning  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Jim Pavelec'
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation'
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara'
SELECT s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Huitième édition'
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  WHERE st.language = 'French' AND c.name = 'Tendo Ice Bridge'
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL
SELECT st.translation  FROM set_translations st  JOIN cards c ON st.setCode = c.setCode  WHERE st.language = 'Japanese' AND c.name = 'Fellwar Stone'
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Journey into Nyx Hero''s Path'  ORDER BY c.convertedManaCost DESC  LIMIT 1
SELECT s.releaseDate FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío'
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3.0
SELECT st.translation FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Chinese Simplified' AND s.name = 'Mirrodin'
SELECT (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) / COUNT(st.language)) * 100 AS percentage FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM sets s  JOIN set_translations st  ON s.code = st.setCode  WHERE st.language = 'Portuguese (Brazil)'
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  GROUP BY frameEffects  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND hasFoil = 0 AND (power IS NULL OR power = '*')
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT c.name, c.manaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel'  ORDER BY LENGTH(c.manaCost) - LENGTH(REPLACE(c.manaCost, '{', '')) DESC  LIMIT 10;
SELECT c.originalReleaseDate, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'mythic' AND l.status = 'legal'  ORDER BY c.originalReleaseDate ASC  LIMIT 1;
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French'
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.name = 'Abundance'  AND c.rarity = 'rare'  AND c.types = 'Enchantment'  AND l.status = 'Legal'
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format HAVING COUNT(l.status) = (     SELECT MAX(banned_count)      FROM (         SELECT COUNT(status) AS banned_count         FROM legalities         WHERE status = 'Banned'         GROUP BY format     ) )
SELECT st.language FROM set_translations st INNER JOIN sets s ON st.id = s.id WHERE s.name = 'Battlebond'
SELECT c.artist, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = (     SELECT artist     FROM cards     GROUP BY artist     ORDER BY COUNT(*) ASC     LIMIT 1 )
SELECT l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = '1997'  AND c.artist = 'D. Alexander Gregory'  AND (c.hasContentWarning = 1 OR c.artist = 'Wizards of the Coast')  AND l.format = 'legacy'
SELECT c.name, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.edhrecRank = 1 AND l.status = 'Banned'
SELECT AVG(T1.id) AS annual_avg_sets, (SELECT language FROM set_translations WHERE id = (SELECT id FROM (SELECT id, COUNT(language) AS lang_count FROM set_translations GROUP BY id ORDER BY lang_count DESC LIMIT 1))) AS common_language FROM sets AS T1 WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(T1.releaseDate)
SELECT artist FROM cards WHERE availability = 'arena' AND artist IN (SELECT artist FROM cards WHERE artist IN (SELECT artist FROM cards WHERE availability = 'mtgo,paper') AND artist IN (SELECT artist FROM cards WHERE availability = 'arena'))
SELECT uuid FROM legalities WHERE `format` = 'oldschool' AND (`status` = 'banned' OR `status` = 'restricted')
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'Matthew D. Wilson' AND `availability` = 'paper'
SELECT r.date, r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.artist = 'Kev Walker'  ORDER BY r.date DESC;
SELECT c.name, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'
SELECT s.name FROM sets s WHERE s.code IN (SELECT setCode FROM set_translations WHERE language = 'Korean') AND s.code NOT IN (SELECT setCode FROM set_translations WHERE language = 'Japanese')
SELECT c.frameVersion, c.name  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = 'Allen Williams' AND l.status = 'Banned'
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011'
SELECT COUNT(*) FROM `users` WHERE `LastAccessDate` > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1
SELECT COUNT(*) FROM users WHERE Views > 10 AND CreationDate > '2013-12-31 23:59:59.999'
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'  ORDER BY p.ViewCount DESC  LIMIT 1;
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT SUM(CommentCount) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT MAX(p.AnswerCount)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20
SELECT u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.Count = (SELECT MAX(Count) FROM tags)
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT COUNT(*)  FROM `badges` b JOIN `users` u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND YEAR(b.Date) = 2011;
SELECT `DisplayName`  FROM `users`  WHERE `Id` = (     SELECT `UserId`      FROM `badges`      GROUP BY `UserId`      ORDER BY COUNT(`Id`) DESC      LIMIT 1 )
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.Id)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Views > 200;
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Score > 5
SELECT COUNT(*) FROM `votes` WHERE `UserId` = 58 AND `CreationDate` = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)
SELECT COUNT(c.Id) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount = 1910
SELECT p.FavoriteCount FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE c.CreationDate = '2014-04-23 20:29:39.0' AND c.UserId = 3025
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 LIMIT 1
SELECT p.Id, CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.CreationDate = '2013-07-12 09:08:18.0' AND c.UserId = 23853;
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041
SELECT COUNT(*) FROM `posts` p JOIN `users` u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini'
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(p.Id) AS FLOAT) / COUNT(v.Id)  FROM posts p  LEFT JOIN votes v ON p.OwnerUserId = v.UserId  WHERE p.OwnerUserId = 24;
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT `DisplayName` FROM `users` WHERE `WebsiteUrl` = 'http://stackoverflow.com'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'thank you user93!'
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'A Lion.'
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Necromancer'  LIMIT 10
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  JOIN users e ON p.LastEditorUserId = e.Id  WHERE e.DisplayName = 'Yevgeny'  GROUP BY u.WebsiteUrl;
SELECT ph.Comment  FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?';
SELECT SUM(BountyAmount) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data%')
SELECT u.DisplayName  FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT p.Title, c.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN comments c ON p.Id = c.PostId WHERE t.TagName = 'humor' GROUP BY p.Title, c.Text;
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT Id FROM users ORDER BY Views ASC LIMIT 1
SELECT COUNT(*) FROM `badges` WHERE `Name` = 'Supporter' AND STRFTIME('%Y', `Date`) = '2011'
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'New York, NY'  AND b.Name IN ('Teacher', 'Supporter')  GROUP BY b.UserId  HAVING COUNT(DISTINCT b.Name) = 2
SELECT u.Id, u.Reputation FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.PostId = 1
SELECT u.Id  FROM users u JOIN postHistory ph ON u.Id = ph.UserId JOIN posts p ON ph.PostId = p.Id WHERE p.ViewCount >= 1000 GROUP BY u.Id HAVING COUNT(DISTINCT ph.PostId) = 1;
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  JOIN (     SELECT UserId, COUNT(Id) as comment_count      FROM comments      GROUP BY UserId ) c ON u.Id = c.UserId  WHERE c.comment_count = (     SELECT MAX(comment_count)      FROM (         SELECT COUNT(Id) as comment_count          FROM comments          GROUP BY UserId     ) )
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'India' AND b.Name = 'Teacher'
SELECT ((COUNT(CASE WHEN Name = 'Student' AND strftime('%Y', Date) = '2010' THEN 1 END) * 100.0 / COUNT(*)) - (COUNT(CASE WHEN Name = 'Student' AND strftime('%Y', Date) = '2011' THEN 1 END) * 100.0 / COUNT(*))) AS PercentageDifference FROM badges
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId)  FROM postHistory ph  LEFT JOIN comments c ON ph.PostId = c.PostId  WHERE ph.PostId = 3720  GROUP BY ph.PostHistoryTypeId;
SELECT p.Id, p.ViewCount  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE pl.PostId = 61217;
SELECT p.Score, pl.LinkTypeId  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE pl.LinkTypeId = 395;
SELECT p.Id, ph.UserId  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  WHERE p.Score > 60
SELECT SUM(posts.FavoriteCount)  FROM postHistory  JOIN posts ON postHistory.PostId = posts.Id  WHERE postHistory.UserId = 686 AND strftime('%Y', postHistory.CreationDate) = '2011'
SELECT CAST(SUM(u.UpVotes) AS REAL) / COUNT(u.Id) AS AvgUpVotes, CAST(SUM(u.Age) AS REAL) / COUNT(u.Id) AS AvgAge  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  GROUP BY u.Id  HAVING COUNT(p.Id) > 10
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE score > 60
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'
SELECT COUNT(*) FROM posts WHERE Score = 10
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT u.Reputation  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'
SELECT b.Date  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'
SELECT (CAST(COUNT(CASE WHEN b.Name = 'Teacher' THEN b.UserId END) AS REAL) / COUNT(u.Id)) * 100  FROM badges b  JOIN users u ON b.UserId = u.Id
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Organizer'
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0'
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'
SELECT users.Age  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE users.Location = 'Vienna, Austria'
SELECT COUNT(*) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65
SELECT u.Views FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:07.0'
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'
SELECT COUNT(*)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age > 65
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(*) FROM `users` WHERE `Location` = 'New York, NY'
SELECT COUNT(*) FROM `votes` WHERE YEAR(CreationDate) = 2010
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT CAST(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 END) AS FLOAT) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 END) FROM votes
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier'
SELECT COUNT(*) FROM postHistory WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan')
SELECT p.Id  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  WHERE u.DisplayName = 'slashnick'  ORDER BY p.AnswerCount DESC  LIMIT 1;
SELECT p.Id, p.ViewCount, u.DisplayName  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder')  ORDER BY p.ViewCount DESC  LIMIT 1;
SELECT COUNT(*)  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  JOIN votes v ON p.Id = v.PostId  WHERE u.DisplayName = 'Matt Parker'  GROUP BY p.Id  HAVING COUNT(v.Id) > 4;
SELECT COUNT(c.Id)  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan'
SELECT DISTINCT p.Tags  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  WHERE u.DisplayName = 'Mark Meckes' AND p.CommentCount = 0;
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Organizer'
SELECT CAST(COUNT(CASE WHEN t.TagName = 'r' THEN ph.PostId END) AS REAL) / COUNT(ph.PostId) AS percentage  FROM postHistory ph  JOIN users u ON ph.UserId = u.Id  JOIN tags t ON t.ExcerptPostId = ph.PostId  WHERE u.DisplayName = 'Community'
SELECT SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS ViewCountDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id;
SELECT COUNT(*) FROM `badges` WHERE `Name` = 'Commentator' AND YEAR(`Date`) = 2014
SELECT COUNT(*) FROM `postHistory` WHERE `CreationDate` BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT `DisplayName`, `Age` FROM `users` WHERE `Views` = (SELECT MAX(`Views`) FROM `users`)
SELECT `LastEditDate`, `LastEditorUserId` FROM `posts` WHERE `Title` = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM `comments` WHERE `UserId` = 13 AND `Score` < 60;
SELECT p.Title, c.UserDisplayName  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.Score > 60;
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE STRFTIME('%Y', b.Date) = '2011' AND u.Location = 'North Pole'
SELECT u.DisplayName, u.WebsiteUrl  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.FavoriteCount > 150;
SELECT p.Title, COUNT(ph.Id) AS PostHistoryCount, p.LastEditDate  FROM posts p  LEFT JOIN postHistory ph ON p.Id = ph.PostId  WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'  GROUP BY p.Id, p.Title, p.LastEditDate
SELECT users.LastAccessDate, users.Location  FROM users  JOIN badges ON users.Id = badges.UserId  WHERE badges.Name = 'Outliers'
SELECT p2.Title  FROM postLinks pl  JOIN posts p1 ON pl.PostId = p1.Id  JOIN posts p2 ON pl.RelatedPostId = p2.Id  WHERE p1.Title = 'How to tell if something happened in a data set which monitors a value over time'
SELECT ph.PostId, b.Name  FROM postHistory ph  JOIN badges b ON ph.UserId = b.UserId  WHERE ph.UserDisplayName = 'Samuel' AND YEAR(ph.CreationDate) = 2013 AND YEAR(b.Date) = 2013;
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.TagName = 'hypothesis-testing'
SELECT p.Title, pl.LinkTypeId  FROM postLinks pl  JOIN posts p ON p.Id = pl.RelatedPostId  JOIN posts mainPost ON mainPost.Id = pl.PostId  WHERE mainPost.Title = 'What are principal component scores?';
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Id = (     SELECT ParentId      FROM posts      WHERE ParentId IS NOT NULL      ORDER BY Score DESC      LIMIT 1 )
SELECT u.DisplayName, u.WebsiteUrl  FROM users u  JOIN votes v ON u.Id = v.UserId  WHERE v.VoteTypeId = 8  ORDER BY v.BountyAmount DESC  LIMIT 1;
SELECT Title FROM posts WHERE ViewCount IS NOT NULL ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM `tags` WHERE `Count` BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(DISTINCT v.PostId)  FROM votes v  WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50;
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'
SELECT CAST(COUNT(pl.Id) AS FLOAT) / 12 AS AvgMonthlyLinks FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE STRFTIME('%Y', pl.CreationDate) = '2010' AND p.AnswerCount <= 2
SELECT p.Id  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE v.UserId = 1465  ORDER BY p.FavoriteCount DESC  LIMIT 1;
SELECT p.Title  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  ORDER BY p.CreaionDate  LIMIT 1
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  GROUP BY u.Id  ORDER BY COUNT(b.Id) DESC  LIMIT 1;
SELECT MIN(CreationDate)  FROM votes  JOIN users ON votes.UserId = users.Id  WHERE users.DisplayName = 'chl'
SELECT MIN(p.CreaionDate)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age = (SELECT MAX(Age) FROM users)
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date ASC  LIMIT 1
SELECT COUNT(DISTINCT p.OwnerUserId)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id FROM users WHERE Age = (SELECT MAX(Age) FROM users))
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM `users` WHERE `Reputation` > 2000 AND `Views` > 1000
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreaionDate) = 2010;
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts)
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner')
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011;
SELECT p.Id, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.CreationDate BETWEEN '2010-01-01' AND '2010-12-31'  ORDER BY p.FavoriteCount DESC  LIMIT 1;
SELECT (CAST(COUNT(p.Id) AS FLOAT) / (SELECT COUNT(Id) FROM posts)) * 100  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Reputation > 1000 AND STRFTIME('%Y', p.CreaionDate) = '2011'
SELECT CAST(COUNT(Id) FILTER (WHERE Age BETWEEN 13 AND 18) AS REAL) * 100 / COUNT(Id) AS percentage FROM users;
SELECT p.ViewCount, u.DisplayName  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON p.LastEditorUserId = u.Id  WHERE ph.Text = 'Computer Game Datasets'
SELECT COUNT(*) FROM `posts` WHERE `ViewCount` > (SELECT AVG(`ViewCount`) FROM `posts` WHERE `ViewCount` IS NOT NULL)
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)
SELECT COUNT(*) FROM `posts` WHERE `ViewCount` > 35000 AND `CommentCount` = 0
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC  LIMIT 1;
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1
SELECT COUNT(*) FROM `users` WHERE `Age` BETWEEN 19 AND 65 AND `UpVotes` > 5000;
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon'
SELECT p.OwnerUserId, COUNT(p.Id) AS NumberOfPosts, COUNT(c.Id) AS NumberOfComments FROM posts p LEFT JOIN comments c ON p.Id = c.PostId WHERE p.OwnerUserId = (SELECT Id FROM users WHERE CreationDate = (SELECT MAX(CreationDate) FROM users)) GROUP BY p.OwnerUserId;
SELECT c.Text, u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'Analysing wind data with R'  ORDER BY c.CreationDate DESC  LIMIT 10;
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(*) FROM tags WHERE TagName = 'careers'
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT AnswerCount, CommentCount FROM posts WHERE Title = 'Clustering 1D data'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM `posts` WHERE `Score` < 20;
SELECT COUNT(*) FROM `tags` WHERE `Id` < 15 AND `Count` <= 20;
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT u.Reputation, u.UpVotes FROM users u INNER JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)'
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1
SELECT u.CreationDate, u.Age  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Id IN (     SELECT Id      FROM comments      WHERE CreationDate LIKE '%http://%' )
SELECT COUNT(DISTINCT c.PostId)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0;
SELECT COUNT(DISTINCT u.Id)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40;
SELECT p.Id, c.Text  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE p.Title = 'Group differences on a five point Likert item'
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.'
SELECT c.Text  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE u.DisplayName = 'Harvey Motulsky'
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.Id)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 5 AND 10;
SELECT sp.power_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sh.superhero_name = '3-D Man'
SELECT COUNT(DISTINCT hero_id)  FROM hero_power  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength'
SELECT COUNT(*)  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;
SELECT full_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_power GROUP BY hero_id HAVING COUNT(power_id) > 15)
SELECT COUNT(*) FROM `superhero` WHERE `eye_colour_id` = (SELECT `id` FROM `colour` WHERE `colour` = 'Blue')
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.skin_colour_id WHERE s.superhero_name = 'Apocalypse'
SELECT COUNT(DISTINCT hp.hero_id)  FROM hero_power hp  JOIN superpower sp ON hp.power_id = sp.id  JOIN superhero sh ON hp.hero_id = sh.id  JOIN colour c ON sh.eye_colour_id = c.id  WHERE sp.power_name = 'Agility' AND c.colour = 'Blue'
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON s.eye_colour_id = e.id  JOIN colour h ON s.hair_colour_id = h.id  WHERE e.colour = 'Blue' AND h.colour = 'Blond'
SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics')
SELECT s.superhero_name, s.height_cm  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'Marvel Comics'  ORDER BY s.height_cm DESC;
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name = 'Sauron'
SELECT c.colour, COUNT(s.id) AS count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count DESC;
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'
SELECT COUNT(*) FROM `superhero` AS sh JOIN `publisher` AS p ON sh.publisher_id = p.id WHERE p.publisher_name = 'DC Comics'
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;
SELECT COUNT(*)  FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id JOIN `publisher` p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics'
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM `superhero` s JOIN `colour` c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond'
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Intelligence'  ORDER BY ha.attribute_value ASC  LIMIT 1;
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.superhero_name = 'Copycat'
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch'
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;
SELECT `superhero_name` FROM `superhero` WHERE `id` = (SELECT `hero_id` FROM `hero_power` GROUP BY `hero_id` ORDER BY COUNT(`hero_id`) DESC LIMIT 1)
SELECT COUNT(*) FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'
SELECT      CAST(SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) AS percentage,      SUM(CASE WHEN p.publisher_name = 'Marvel Comics' AND a.alignment = 'Bad' THEN 1 ELSE 0 END) AS marvel_bad_superheroes FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id JOIN      publisher p ON s.publisher_id = p.id;
SELECT (SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(attribute_value) FROM hero_attribute
SELECT COUNT(*) FROM `superhero` WHERE `full_name` IS NULL OR `full_name` = '-'
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero sh ON hp.hero_id = sh.id WHERE sh.superhero_name = 'Deathlok'
SELECT AVG(s.weight_kg)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Female'
SELECT sp.power_name FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' LIMIT 5;
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT `superhero_name` FROM `superhero` JOIN `colour` ON `superhero.eye_colour_id` = `colour.id` WHERE `height_cm` BETWEEN 170 AND 190 AND `colour.colour` = 'No Colour'
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56
SELECT `full_name` FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Demi-God') LIMIT 5
SELECT COUNT(*) FROM `superhero` WHERE `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Bad')
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.weight_kg = 169
SELECT c.colour  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN colour c ON s.hair_colour_id = c.id  WHERE s.height_cm = 185 AND r.race = 'human'
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)
SELECT CAST(SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.height_cm BETWEEN 150 AND 180
SELECT superhero_name FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)
SELECT power_name FROM superpower WHERE id = (SELECT power_id FROM hero_power GROUP BY power_id ORDER BY COUNT(power_id) DESC LIMIT 1)
SELECT `attribute_value` FROM `hero_attribute` WHERE `hero_id` = (SELECT `id` FROM `superhero` WHERE `superhero_name` = 'Abomination')
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  WHERE hp.hero_id = 1;
SELECT COUNT(DISTINCT hero_id) FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'stealth')
SELECT s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength'  ORDER BY ha.attribute_value DESC  LIMIT 1;
SELECT CAST(COUNT(s.id) AS REAL) / COUNT(*) FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE c.colour = 'No Colour'
SELECT COUNT(*) FROM `superhero` AS sh JOIN `publisher` AS p ON sh.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics'
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability'  ORDER BY ha.attribute_value DESC  LIMIT 1;
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien'
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Flight'
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'
SELECT s.superhero_name, p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id;
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.superhero_name = 'A-Bomb'
SELECT CAST(COUNT(CASE WHEN c.colour = 'Blue' THEN s.id END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN colour c ON s.skin_colour_id = c.id  WHERE g.gender = 'Female'
SELECT T1.superhero_name, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'
SELECT g.gender FROM gender g JOIN superhero s ON g.id = s.gender_id WHERE s.superhero_name = 'Agent 13'
SELECT sh.superhero_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Adaptation'
SELECT COUNT(power_id) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo')
SELECT sp.power_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sh.full_name = 'Hunter Zolomon'
SELECT height_cm FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Amber')
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Black') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Black')
SELECT c.colour AS eye_colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN colour c2 ON s.skin_colour_id = c2.id  WHERE c2.colour = 'Gold'
SELECT s.full_name  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE r.race = 'Vampire'
SELECT superhero_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT COUNT(hero_id)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))
SELECT r.race, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN g.gender = 'Female' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN publisher p ON s.publisher_id = p.id
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT (SUM(CASE WHEN full_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) - SUM(CASE WHEN full_name = 'Charles Chandler' THEN weight_kg ELSE 0 END)) AS weight_difference FROM superhero
SELECT AVG(height_cm) AS average_height FROM superhero
SELECT sp.power_name  FROM superhero sh  JOIN hero_power hp ON sh.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sh.superhero_name = 'Abomination'
SELECT COUNT(*) FROM `superhero` WHERE `race_id` = 21 AND `gender_id` = 1
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON a.id = ha.attribute_id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM `superhero` WHERE `alignment_id` = 3
SELECT a.attribute_name, ha.attribute_value  FROM hero_attribute ha  JOIN superhero s ON ha.hero_id = s.id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = '3-D Man'
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON e.id = s.eye_colour_id  JOIN colour h ON h.id = s.hair_colour_id  WHERE e.colour = 'Blue' AND h.colour = 'Brown'
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = 1;
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `superhero`)) AS percentage  FROM `superhero`  WHERE `eye_colour_id` = 7;
SELECT CAST(COUNT(CASE WHEN g.gender = 'Male' THEN s.id END) AS REAL) / COUNT(CASE WHEN g.gender = 'Female' THEN s.id END) AS ratio  FROM superhero s  JOIN gender g ON s.gender_id = g.id
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT id FROM superpower WHERE power_name = 'cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan'
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr'
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id WHERE s.weight_kg = 108 AND s.height_cm = 188;
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.id = 38
SELECT r.race  FROM race r  JOIN superhero s ON r.id = s.race_id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)
SELECT T1.superhero_name, T2.power_name  FROM superhero AS T1  JOIN hero_power AS T3 ON T1.id = T3.hero_id  JOIN superpower AS T2 ON T3.power_id = T2.id  WHERE T1.superhero_name = 'Atom IV'
SELECT superhero.superhero_name  FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  WHERE colour.colour = 'Blue'  LIMIT 5;
SELECT AVG(attribute_value)  FROM hero_attribute  WHERE hero_id IN (     SELECT id      FROM superhero      WHERE alignment_id = 3 )
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = 100;
SELECT COUNT(*) FROM `superhero` WHERE `alignment_id` = 1 AND `gender_id` = 2
SELECT superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE attribute_value BETWEEN 75 AND 80
SELECT r.race  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN colour c ON s.hair_colour_id = c.id  JOIN race r ON s.race_id = r.id  WHERE g.gender = 'Male' AND c.colour = 'Blue'
SELECT CAST(SUM(CASE WHEN g.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN alignment a ON s.alignment_id = a.id  WHERE a.id = 2;
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS difference  FROM superhero AS T1  JOIN colour AS T2  ON T1.eye_colour_id = T2.id  WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;
SELECT hero_attribute.attribute_value  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  JOIN superhero ON hero_attribute.hero_id = superhero.id  WHERE attribute.attribute_name = 'Strength' AND superhero.superhero_name = 'Hulk'
SELECT sp.power_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Ajax'
SELECT COUNT(*)  FROM `superhero`  JOIN `colour` ON `superhero.skin_colour_id` = `colour.id`  JOIN `alignment` ON `superhero.alignment_id` = `alignment.id`  WHERE `colour.colour` = 'Green' AND `alignment.alignment` = 'Bad';
SELECT COUNT(*)  FROM `superhero` s JOIN `gender` g ON s.gender_id = g.id JOIN `publisher` p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Wind Control'  ORDER BY s.superhero_name ASC
SELECT g.gender  FROM gender g  JOIN superhero s ON g.id = s.gender_id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Phoenix Force'
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'DC Comics'  ORDER BY s.weight_kg DESC  LIMIT 1;
SELECT AVG(height_cm) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.race <> 'Human' AND T3.publisher_name = 'Dark Horse Comics'
SELECT COUNT(*)  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;
SELECT (SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id
SELECT a.attribute_name  FROM attribute a  JOIN hero_attribute ha ON a.id = ha.attribute_id  JOIN superhero s ON ha.hero_id = s.id  WHERE s.superhero_name = 'Black Panther'  ORDER BY ha.attribute_value ASC  LIMIT 1;
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'George Lucas'
SELECT CAST(SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN alignment a ON s.alignment_id = a.id  WHERE p.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM `superhero` WHERE `full_name` LIKE 'John%'
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT `superhero`.`full_name`  FROM `superhero`  JOIN `colour` ON `superhero`.`eye_colour_id` = `colour`.`id`  WHERE `superhero`.`weight_kg` < 100 AND `colour`.`colour` = 'Auburn'
SELECT attribute_value FROM hero_attribute WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Aquababy')
SELECT `superhero`.`weight_kg`, `race`.`race` FROM `superhero` JOIN `race` ON `superhero`.`race_id` = `race`.`id` WHERE `superhero`.`id` = 40;
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT hero_id FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Intelligence')
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id WHERE s.superhero_name = 'Blackwulf'
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 20 AND q.q1 IN (     SELECT MAX(q1)      FROM qualifying      WHERE raceId = 20      GROUP BY raceId      ORDER BY MAX(q1) DESC      LIMIT 5 )
SELECT d.surname  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 19  ORDER BY q.q2  LIMIT 1;
SELECT DISTINCT r.year  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.location = 'Shanghai'
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya' LIMIT 1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany'
SELECT cs.position  FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId WHERE c.name = 'Renault'
SELECT COUNT(*) FROM `races` r JOIN `circuits` c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.country NOT IN ('Malaysia', 'Bahrain', 'Spain', 'Turkey', 'Monaco')
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain'
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Australian Grand Prix'
SELECT r.url  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit'
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit'
SELECT lat, lng FROM circuits WHERE circuitId = (SELECT circuitId FROM races WHERE name = 'Abu Dhabi Grand Prix')
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 24 AND cr.points = 1;
SELECT q1 FROM qualifying JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND raceId = 354;
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40'
SELECT number FROM qualifying WHERE raceId = 903 AND q3 LIKE '0:01:54%'
SELECT COUNT(*)  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE r.name = 'Bahrain Grand Prix' AND r.year = 2007 AND res.time IS NULL;
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;
SELECT d.forename, d.surname, d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 161 AND lt.time LIKE '1:27%'
SELECT d.nationality  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 933  ORDER BY CAST(REPLACE(r.fastestLapSpeed, ',', '.') AS REAL) DESC  LIMIT 1;
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Malaysian Grand Prix'
SELECT c.url  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE cr.raceId = 9  ORDER BY cr.points DESC  LIMIT 1;
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15'
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 45 AND q.q3 LIKE '0:01:33%'
SELECT r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE r.raceId = 743 AND d.forename = 'Bruce' AND d.surname = 'McLaren'
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NULL
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;
SELECT d.forename, d.surname  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  WHERE lt.raceId = 348  ORDER BY lt.time  LIMIT 1;
SELECT d.nationality  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT ((CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL) - CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 854 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL)) / CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL)) * 100) AS percent_faster
SELECT CAST(COUNT(CASE WHEN results.time IS NOT NULL THEN results.driverId END) AS REAL) / COUNT(results.driverId) AS race_completion_rate FROM races JOIN results ON races.raceId = results.raceId WHERE races.date = '1983-07-16'
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*), name FROM races WHERE year = 2005 ORDER BY name DESC
SELECT name FROM races WHERE strftime('%Y-%m', date) = (SELECT strftime('%Y-%m', MIN(date)) FROM races)
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999)
SELECT year FROM races GROUP BY year ORDER BY MAX(round) DESC LIMIT 1
SELECT name FROM races WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000)
SELECT c.country, c.name, c.location  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'European Grand Prix'  ORDER BY r.year ASC  LIMIT 1;
SELECT MAX(year) FROM races WHERE name = 'British Grand Prix' AND circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Brands Hatch')
SELECT COUNT(*) FROM `races` WHERE `name` = 'British Grand Prix' AND `circuitId` = (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Silverstone Circuit')
SELECT d.forename, d.surname  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE r.name = 'Singapore Grand Prix' AND r.year = 2010  ORDER BY ds.position;
SELECT d.forename, d.surname, MAX(ds.points)  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId;
SELECT d.forename, d.surname, ds.points  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN races r ON r.raceId = ds.raceId  WHERE r.name = 'Chinese Grand Prix' AND r.year = 2017  ORDER BY ds.points DESC  LIMIT 3
SELECT d.forename, d.surname, r.name, l.milliseconds FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId WHERE l.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009;
SELECT CAST(SUM(CASE WHEN ds.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ds.raceId)  FROM driverStandings ds  JOIN drivers d ON ds.driverId = d.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.surname = 'Hamilton' AND r.year >= 2010;
SELECT d.forename, d.surname, d.nationality, MAX(ds.points) AS max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.driverId ORDER BY COUNT(ds.wins) DESC LIMIT 1;
SELECT `forename`, `surname`, YEAR(CURRENT_TIMESTAMP) - YEAR(`dob`) AS age FROM `drivers` WHERE `nationality` = 'Japanese' ORDER BY `dob` DESC LIMIT 1;
SELECT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE YEAR(r.date) BETWEEN 1990 AND 2000  GROUP BY c.name  HAVING COUNT(r.raceId) = 4;
SELECT c.name, c.location, r.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'USA' AND r.year = 2006;
SELECT r.name, c.name, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;
SELECT r.name, r.year, r.round  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;
SELECT COUNT(ds.wins)  FROM driverStandings ds JOIN races r ON ds.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId JOIN drivers d ON ds.driverId = d.driverId WHERE c.name = 'Sepang International Circuit' AND d.forename = 'Michael' AND d.surname = 'Schumacher' AND ds.wins = 1;
SELECT r.name, r.year  FROM races r  JOIN lapTimes l ON r.raceId = l.raceId  JOIN drivers d ON l.driverId = d.driverId  WHERE d.forename = 'Michael' AND d.surname = 'Schumacher'  ORDER BY l.milliseconds ASC  LIMIT 1;
SELECT AVG(ds.points)  FROM driverStandings ds JOIN races r ON ds.raceId = r.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND r.year = 2000;
SELECT r.name, ds.points  FROM races r  JOIN driverStandings ds ON r.raceId = ds.raceId  JOIN drivers d ON ds.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY r.year ASC  LIMIT 1;
SELECT r.name, c.country, r.date  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2017  ORDER BY r.date;
SELECT r.name, r.year, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  JOIN lapTimes l ON r.raceId = l.raceId  GROUP BY r.raceId  ORDER BY MAX(l.lap) DESC  LIMIT 1;
SELECT (CAST(COUNT(CASE WHEN c.country = 'Germany' THEN r.circuitId ELSE NULL END) AS REAL) / COUNT(r.circuitId)) * 100  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)
SELECT COUNT(*) FROM `drivers` WHERE `code` IS NULL
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009
SELECT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')
SELECT races.url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone'
SELECT time FROM races WHERE year = 2010 AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Yas Marina Circuit')
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'
SELECT `date` FROM `races` WHERE `circuitId` = (SELECT `circuitId` FROM `circuits` WHERE `name` = 'Circuit de Barcelona-Catalunya')
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009
SELECT MIN(r.fastestLapTime)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId ORDER BY r.fastestLapSpeed DESC LIMIT 1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 AND r.positionOrder = 1;
SELECT r.name  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT r.name  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY res.rank ASC  LIMIT 1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT DISTINCT races.year  FROM results  JOIN races ON results.raceId = races.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT d.forename, d.surname, r.positionOrder  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Chinese Grand Prix' AND ra.year = 2008;
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 1989 AND r.grid = 4
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND time IS NOT NULL
SELECT fastestLap FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)
SELECT r.time  FROM results r  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.positionOrder = 2
SELECT d.forename, d.surname, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.time LIKE '%:%:%'
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE d.nationality = 'British' AND ra.year = 2008 AND ra.name = 'Australian Grand Prix'
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2008 AND r.time IS NOT NULL;
SELECT SUM(points) AS total_points FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(CAST(SUBSTR(r.fastestLapTime, 4) AS REAL) + CAST(SUBSTR(r.fastestLapTime, 1, 2) AS REAL) * 60) AS average_fastest_lap_time FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Hamilton' AND d.surname = 'Lewis'
SELECT CAST(COUNT(CASE WHEN results.time IS NOT NULL THEN results.raceId ELSE NULL END) AS REAL) / COUNT(races.raceId)  FROM races  JOIN results ON races.raceId = results.raceId  WHERE races.name = 'Australian Grand Prix' AND races.year = 2008;
SELECT ((STRFTIME('%s', T2.time) - STRFTIME('%s', T1.time)) * 100.0 / (STRFTIME('%s', T2.time) - STRFTIME('%s', '00:00:00'))) AS percentage_faster FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.positionOrder = 1 UNION SELECT ((STRFTIME('%s', T2.time, '+', (SELECT T3.time FROM results AS T3 WHERE T3.raceId = T1.raceId AND T3.positionOrder = 1)) - STRFTIME('%s', (SELECT T3.time FROM results AS T3 WHERE T3.raceId = T1.raceId AND T3.positionOrder = 1))) * 100.0 / STRFTIME('%s', T2.time, '+', (SELECT T3.time FROM results AS T3 WHERE T3.raceId = T1.raceId AND T3.positionOrder = 1)) - STRFTIME('%s', '00:00:00')) AS percentage_faster FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.positionOrder = (SELECT MAX(positionOrder) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008))
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01'
SELECT MAX(points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British'
SELECT c.name  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  ORDER BY cs.points DESC  LIMIT 1
SELECT c.name  FROM constructors c  LEFT JOIN constructorStandings cs ON c.constructorId = cs.constructorId AND cs.raceId = 291  WHERE cs.points IS NULL OR cs.points = 0;
SELECT COUNT(*)  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Japanese'  GROUP BY c.constructorId  HAVING COUNT(cs.raceId) = 2 AND SUM(cs.points) = 0;
SELECT c.name FROM constructors c JOIN results r ON c.constructorId = r.constructorId WHERE r.rank = 1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  WHERE c.nationality = 'French' AND r.laps > 50;
SELECT CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN res.driverId END) AS REAL) * 100 / COUNT(res.driverId)  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races ra ON res.raceId = ra.raceId  WHERE d.nationality = 'Japanese' AND ra.year BETWEEN 2007 AND 2009;
SELECT r.year, AVG(CAST(SUBSTR(res.time, 1, 2) AS INTEGER) * 3600 + CAST(SUBSTR(res.time, 4, 2) AS INTEGER) * 60 + CAST(SUBSTR(res.time, 7, 6) AS REAL)) AS average_time FROM races r JOIN results res ON r.raceId = res.raceId JOIN driverStandings ds ON ds.raceId = r.raceId AND ds.driverId = res.driverId WHERE r.year < 1975 AND ds.position = 1 AND res.time IS NOT NULL GROUP BY r.year;
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.dob > '1975-12-31' AND r.rank = 2;
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND driverId NOT IN (SELECT driverId FROM results WHERE time IS NOT NULL)
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  ORDER BY r.fastestLapTime ASC  LIMIT 1;
SELECT fastestLap FROM results WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009) AND time LIKE '1:%'
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT r.name, r.year  FROM races r  JOIN results res  ON r.raceId = res.raceId  WHERE res.milliseconds IS NOT NULL  GROUP BY r.raceId  ORDER BY MIN(res.milliseconds)  LIMIT 1;
SELECT CAST(COUNT(CASE WHEN YEAR(d.dob) < 1985 AND r.laps > 50 THEN 1 END) AS REAL) * 100 / COUNT(d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year BETWEEN 2000 AND 2005
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  WHERE d.nationality = 'French' AND lt.time < '02:00.00'
SELECT code FROM drivers WHERE nationality = 'America'
SELECT raceId FROM races WHERE year = 2009
SELECT COUNT(DISTINCT driverId) FROM driverStandings WHERE raceId = 18
SELECT COUNT(*) FROM (SELECT nationality, dob FROM drivers ORDER BY dob DESC LIMIT 3) AS top3 WHERE nationality = 'Dutch'
SELECT `driverRef` FROM `drivers` WHERE `forename` = 'Robert' AND `surname` = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'
SELECT d.driverId, d.dob, d.nationality, p.time  FROM drivers d  JOIN pitStops p ON d.driverId = p.driverId  WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31'  ORDER BY p.time ASC  LIMIT 3;
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT d.driverId, d.code  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE YEAR(d.dob) = 1971  ORDER BY r.fastestLapTime ASC  LIMIT 1;
SELECT d.driverId, MAX(ps.time) AS latest_lap_time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982-01-01' GROUP BY d.driverId ORDER BY latest_lap_time DESC LIMIT 10;
SELECT r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)
SELECT year FROM races WHERE raceId IN (SELECT raceId FROM lapTimes GROUP BY raceId ORDER BY MAX(time) ASC LIMIT 1)
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5
SELECT COUNT(*) FROM results WHERE raceId > 50 AND raceId < 100 AND time IS NOT NULL AND statusId = 2;
SELECT location, lat, lng FROM circuits WHERE country = 'Austria'
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL
SELECT races.year, races.name, races.date, races.time  FROM races  JOIN qualifying ON races.raceId = qualifying.raceId  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE drivers.dob = (SELECT MAX(dob) FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying GROUP BY driverId HAVING MIN(raceId)))  AND races.date = (SELECT MIN(date) FROM races WHERE raceId IN (SELECT raceId FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE dob = (SELECT MAX(dob) FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying)))))
SELECT COUNT(*)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN status s ON r.statusId = s.statusId  WHERE d.nationality = 'American' AND s.status = 'Puncture'
SELECT c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1;
SELECT c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  GROUP BY c.constructorId  ORDER BY SUM(cs.wins) DESC  LIMIT 1
SELECT driverId, MAX(time) AS slowest_time  FROM lapTimes  WHERE raceId = (SELECT raceId FROM races WHERE name = 'French Grand Prix') AND lap = 3  GROUP BY driverId  ORDER BY slowest_time DESC  LIMIT 1;
SELECT raceId, MIN(milliseconds) AS fastest_lap_time FROM lapTimes WHERE lap = 1 GROUP BY raceId ORDER BY fastest_lap_time LIMIT 1;
SELECT AVG(fastestLapTime) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix') AND rank < 11
SELECT d.forename, d.surname, AVG(CAST(p.milliseconds AS REAL)) AS avg_pitstop_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId ORDER BY avg_pitstop_duration ASC LIMIT 3;
SELECT r.name, res.time  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE r.name = 'Canadian Grand Prix' AND r.year = 2008 AND res.time LIKE '%:%:%.%';
SELECT c.constructorRef, c.url  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Singapore Grand Prix' AND ra.year = 2009 AND r.time = (SELECT MIN(r.time) FROM results r WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Singapore Grand Prix' AND year = 2009))
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND dob BETWEEN '1981-01-01' AND '1991-12-31'
SELECT forename || ' ' || surname AS full_name, url, dob  FROM drivers  WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31'  ORDER BY dob DESC;
SELECT name, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT c.name, c.nationality, cr.points  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  JOIN races r ON r.year = cr.year  WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010  ORDER BY cr.points DESC  LIMIT 1;
SELECT AVG(ds.points)  FROM driverStandings ds  JOIN drivers d ON ds.driverId = d.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Turkish Grand Prix'
SELECT AVG(COUNT(*)) AS annual_avg_races FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY year;
SELECT nationality AS citizenship FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT wins FROM driverStandings ORDER BY points ASC LIMIT 1 OFFSET 90
SELECT r.name  FROM races r  JOIN results res  ON r.raceId = res.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)
SELECT c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races)
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON r.year = 2008 AND r.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Marina Bay Street Circuit') WHERE q.q3 = (SELECT MIN(q3) FROM qualifying)
SELECT d.forename, d.surname, d.nationality, r.name  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.dob = (SELECT MAX(dob) FROM drivers)  LIMIT 1;
SELECT COUNT(*)  FROM results r  JOIN races ra ON r.raceId = ra.raceId  JOIN status s ON r.statusId = s.statusId  WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident'  GROUP BY r.driverId  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT d.forename, d.surname, ds.wins  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  WHERE d.dob = (SELECT MIN(dob) FROM drivers)
SELECT MAX(duration) FROM pitStops
SELECT MIN(`time`) FROM `lapTimes`
SELECT MAX(duration) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT lap FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix')
SELECT duration FROM pitStops WHERE raceId IN (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix')
SELECT MIN(time) AS fastest_lap FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT d.forename, d.surname  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  GROUP BY d.driverId  ORDER BY MIN(lt.time)  LIMIT 20;
SELECT position FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND time = (SELECT MIN(time) FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))
SELECT MIN(r.fastestLapTime) AS lap_record FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit'
SELECT c.circuitId, c.country, r.raceId  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'Italy'  ORDER BY r.raceId ASC;
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit' AND r.raceId IN (SELECT raceId FROM results GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1)
SELECT pitStops.duration  FROM pitStops  JOIN races ON races.raceId = pitStops.raceId  JOIN circuits ON circuits.circuitId = races.circuitId  WHERE races.name = 'Austrian Grand Prix' AND pitStops.duration = (     SELECT MIN(pitStops.duration)      FROM pitStops      JOIN races ON races.raceId = pitStops.raceId      WHERE races.name = 'Austrian Grand Prix' )
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.raceId IN (SELECT raceId FROM lapTimes WHERE time = '1:29.488')
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player)
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) LIMIT 1
SELECT COUNT(*) FROM `Player_Attributes` WHERE `overall_rating` >= 60 AND `overall_rating` < 65 AND `defensive_work_rate` = 'low'
SELECT id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016'  GROUP BY L.name  ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC  LIMIT 1;
SELECT home_team, COUNT(*) AS lost_matches FROM matches WHERE season = '2015/2016' AND (home_team_goal - away_team_goal) < 0 GROUP BY home_team ORDER BY lost_matches LIMIT 1;
SELECT player_name FROM players ORDER BY penalties DESC LIMIT 10; 
SELECT Team.team_long_name FROM Match JOIN Team ON Match.away_team_api_id = Team.team_api_id WHERE Match.season = '2009/2010' AND Match.league_id = (SELECT league_id FROM League WHERE name = 'Scotland Premier League') AND Match.away_team_goal > Match.home_team_goal GROUP BY Team.team_long_name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT teamName, buildUpPlaySpeed FROM teams ORDER BY buildUpPlaySpeed DESC LIMIT 4; 
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016' AND M.home_team_goal = M.away_team_goal  GROUP BY L.name  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT strftime('%Y', 'now') - strftime('%Y', birthday) - (strftime('%m', 'now') || strftime('%d', 'now') < strftime('%m', birthday) || strftime('%d', birthday)) AS age  FROM Player  WHERE EXISTS (SELECT 1 FROM PlayerStats WHERE PlayerStats.player_id = Player.id AND sprint_speed >= 97 AND YEAR(date) >= '2013' AND YEAR(date) <= '2015')
SELECT league_name, COUNT(league_id) AS match_count FROM matches GROUP BY league_id ORDER BY match_count DESC LIMIT 1; 
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE substr(date,1,4) = '2010') AND substr(date,1,4) = '2010'
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60
SELECT team_long_name FROM team_attributes WHERE strftime('%Y', date) = '2012'   AND buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM team_attributes WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012') 
SELECT (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100) / COUNT(player_fifa_api_id) AS percentage_left_footed FROM players WHERE YEAR(birthday) BETWEEN '1987' AND '1992';
SELECT league_name, SUM(home_team_goal + away_team_goal) AS total_goals FROM matches JOIN leagues ON matches.league_id = leagues.league_id GROUP BY league_name ORDER BY total_goals ASC LIMIT 5; 
SELECT CAST(SUM(long_shots) AS FLOAT) / COUNT(player_fifa_api_id) AS average_long_shots FROM Player_Attributes WHERE player_fifa_api_id = (SELECT fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag'); 
SELECT P.name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.name ORDER BY SUM(PA.heading_accuracy) / COUNT(PA.player_fifa_api_id) DESC LIMIT 10; 
SELECT team_long_name FROM Team WHERE buildUpPlayDribblingClass = 'Normal'   AND date >= '2014-01-01 00:00:00'   AND date <= '2014-01-31 00:00:00'   AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team WHERE buildUpPlayDribblingClass = 'Normal' AND date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00') ORDER BY chanceCreationPassing DESC; 
SELECT League.name FROM Match JOIN League ON Match.league_id = League.id WHERE Match.season = '2009/2010' GROUP BY League.name HAVING SUM(Match.home_team_goal) / COUNT(DISTINCT Match.id) > SUM(Match.away_team_goal) / COUNT(DISTINCT Match.id) 
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE substr(birthday, 1, 4) = '1970' AND substr(birthday, 6, 2) = '10'
SELECT attacking_work_rate FROM players WHERE name = 'Franco Zennaro'; 
SELECT buildUpPlayPositioningClass  FROM team  WHERE team_long_name = 'ADO Den Haag'; 
SELECT heading_accuracy FROM football_player_stats WHERE player_name = 'Francois Affolter' AND date = '2014-09-18 00:00:00'
SELECT overall_rating  FROM players  WHERE name = 'Gabriel Tamas' AND strftime('%Y', date) = '2011'; 
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016'; 
SELECT preferred_foot FROM players WHERE birthday = (SELECT MAX(birthday) FROM players) 
SELECT potential FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT COUNT(*)  FROM players  WHERE weight < 130 AND preferred_foot = 'left'
SELECT team_short_name FROM teams WHERE chanceCreationPassingClass = 'Risky'
SELECT defensive_work_rate  FROM players  WHERE name = 'David Wilson'; 
SELECT birthday FROM players WHERE overall_rating = (SELECT MAX(overall_rating) FROM players); 
SELECT League.name FROM League WHERE League.country = 'Netherlands'
SELECT AVG(home_team_goal)  FROM Match  WHERE country_name = 'Poland' AND season = '2010/2011'
SELECT p.player_api_id, AVG(pa.finishing) AS avg_finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height IN ((SELECT MAX(height) FROM Player), (SELECT MIN(height) FROM Player)) GROUP BY p.player_api_id ORDER BY avg_finishing DESC LIMIT 1;
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*) FROM `Player` WHERE strftime('%Y', `birthday`) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND weight > 170
SELECT player_name FROM players WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010'
SELECT potential  FROM players  WHERE name = 'Aaron Doran'; 
SELECT * FROM players WHERE preferred_foot = 'left'
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Fast'
SELECT buildUpPlayPassingClass FROM teams WHERE team_short_name = 'CLB'
SELECT team_short_name FROM teams WHERE buildUpPlayPassing > 70
SELECT SUM(t2.overall_rating) / COUNT(t2.id) AS average_overall_rating FROM Player AS t1 JOIN Player_Attributes AS t2 ON t1.id = t2.player_id WHERE t1.height > 170 AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015'
SELECT player_name FROM football_players WHERE height = (SELECT MIN(height) FROM football_players)
SELECT Country.name  FROM Country  JOIN League ON Country.id = League.country_id  WHERE League.name = 'Italy Serie A'
SELECT team_short_name FROM team WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32
SELECT AVG(overall_rating) AS average_overall_rating FROM players WHERE name = 'Aaron Doran';
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10'; 
SELECT team_short_name FROM matches WHERE home_team_goal = 10
SELECT *  FROM football_players  WHERE potential = 61 AND balance = (SELECT MAX(balance) FROM football_players WHERE potential = 61) 
SELECT (SUM(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Abdou Diallo' THEN id ELSE NULL END)) - (SUM(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Aaron Appindangoye' THEN id ELSE NULL END)) AS diff_avg_ball_control FROM players
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT country FROM League WHERE name = 'Belgium Jupiler League'
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany'
SELECT player_name FROM players WHERE overall_rating = (SELECT MAX(overall_rating) FROM players)
SELECT COUNT(DISTINCT player_id) FROM players WHERE strftime('%Y', birthday) < '1986' AND defensive_work_rate = 'high'; 
SELECT player_name FROM players WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1; 
SELECT heading_accuracy FROM players WHERE name = 'Ariel Borysiuk'; 
SELECT COUNT(*)  FROM players  WHERE height > 180 AND volleys > 70;
SELECT name FROM players WHERE volleys > 70 AND dribbling > 70
SELECT COUNT(*)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Belgium' AND Match.season = '2008/2009'; 
SELECT long_passing FROM players WHERE birthday = (SELECT MIN(birthday) FROM players) 
SELECT COUNT(*) FROM `Match` WHERE `league_id` = (SELECT `id` FROM `League` WHERE `name` = 'Belgium Jupiler League') AND SUBSTR(`date`, 1, 7) = '2009-04'
SELECT L.name  FROM League L  JOIN Match M ON L.id = M.league_id  WHERE M.season = '2008/2009'  GROUP BY L.name  ORDER BY COUNT(M.id) DESC  LIMIT 1;
SELECT CAST(SUM(overall_rating) AS REAL) / COUNT(id) AS average_overall_rating FROM players WHERE strftime('%Y', birthday) < '1986';
SELECT (CAST((t1.overall_rating - t2.overall_rating) AS FLOAT) / t2.overall_rating) * 100 AS percentage_difference FROM (SELECT overall_rating FROM players WHERE player_name = 'Ariel Borysiuk') t1, (SELECT overall_rating FROM players WHERE player_name = 'Paulin Puel') t2
SELECT AVG(buildUpPlaySpeed)  FROM team  WHERE team_long_name = 'Heart of Midlothian'; 
SELECT AVG(T1.overall_rating) FROM player_ratings AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing)  FROM Player_Stats AS T1  JOIN Players AS T2  ON T1.player_id = T2.player_id  WHERE T2.player_name = 'Aaron Lennox'; 
SELECT MAX(chanceCreationPassing) AS highest_chance_creation_passing_score, chanceCreationPassingClass  FROM match_statistics  WHERE team_long_name = 'Ajax'  GROUP BY chanceCreationPassingClass  ORDER BY highest_chance_creation_passing_score DESC  LIMIT 1; 
SELECT preferred_foot FROM players WHERE player_name = 'Abdou Diallo'
SELECT MAX(overall_rating) FROM T2 WHERE player_name = 'Dorlan Pabon'
SELECT AVG(away_team_goal)  FROM Match  WHERE away_team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Parma')  AND country_id = (SELECT id FROM Country WHERE name = 'Italy')
SELECT name FROM players WHERE overall_rating = 77 AND date LIKE '2016-06-23%' ORDER BY birthday ASC LIMIT 1; 
SELECT overall_rating FROM players WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%'
SELECT potential FROM players WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'
SELECT attacking_work_rate FROM player_stats WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%'
SELECT defensive_work_rate FROM player_stats WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_name = 'Kevin Constant') ORDER BY date ASC LIMIT 1
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_long_name = 'Willem II' AND date = '2012-02-22'
SELECT build_up_play_dribbling_class  FROM match_data  WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'; 
SELECT build_up_play_passing_class FROM team_attributes WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%'; 
SELECT chance_creation_passing_class  FROM match  WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'
SELECT chance_creation_crossing_class  FROM match_details  WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'
SELECT defence_aggression_class FROM team_attributes WHERE team_long_name = 'Hannover 96' AND date LIKE '2015-09-10%'
SELECT AVG(overall_rating)  FROM player_ratings  WHERE player_name = 'Marko Arnautovic'  AND SUBSTR(date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'
SELECT ((t1.overall_rating - t2.overall_rating) * 100.0 / t1.overall_rating)  FROM players t1, players t2  WHERE t1.player_name = 'Landon Donovan' AND t2.player_name = 'Jordan Bowery' AND t1.date = '2013-07-12' AND t2.date = '2013-07-12'
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) > 34
SELECT COUNT(home_team_goal)  FROM matches  JOIN players ON matches.home_team_goal = players.player_id  WHERE players.player_name = 'Aaron Lennon'; 
SELECT SUM(away_team_goal)  FROM match_goals  WHERE player_name IN ('Daan Smith', 'Filipe Ferreira'); 
SELECT COUNT(*)  FROM Player  WHERE julianday('now') - julianday(birthday) < 365 * 31;
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT name FROM players WHERE potential = (SELECT MAX(potential) FROM players)
SELECT name FROM players WHERE attacking_work_rate = 'high'; 
SELECT name  FROM players  WHERE finishing = 1  ORDER BY datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) DESC  LIMIT 1;
SELECT player_name FROM players WHERE country = 'Belgium'
SELECT p.name, c.country_name  FROM players p  JOIN countries c ON p.country_id = c.country_id  WHERE p.vision > 89;
SELECT country, AVG(weight) AS average_weight FROM players GROUP BY country ORDER BY average_weight DESC LIMIT 1; 
SELECT team_long_name  FROM teams  WHERE buildUpPlaySpeedClass = 'Slow'; 
SELECT team_short_name FROM team WHERE chanceCreationPassingClass = 'Safe'
SELECT AVG(height) FROM Player WHERE id IN (SELECT id FROM Country WHERE id = 1)
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3
SELECT COUNT(*) FROM `Player` WHERE `player_name` LIKE 'Aaron%' AND `birthday` > '1990-01-01'
SELECT (jumping - (SELECT jumping FROM players WHERE id = 23)) AS difference FROM players WHERE id = 6
SELECT player_api_id FROM Player_Attributes WHERE potential IN (SELECT MIN(potential) FROM Player_Attributes WHERE preferred_foot = 'right') AND preferred_foot = 'right' LIMIT 5
SELECT COUNT(*)  FROM Player_Attributes  WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Player_Attributes) FROM Player_Attributes WHERE stamina > 80 AND strength > 80
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'
SELECT home_team_goal, away_team_goal  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.date LIKE '2008-09-24%' AND League.name = 'Belgium Jupiler League'
SELECT pa.sprint_speed, pa.agility, pa.acceleration  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Alexis Blin'
SELECT buildUpPlaySpeedClass  FROM team  WHERE team_long_name = 'KSV Cercle Brugge'; 
SELECT COUNT(*)  FROM games  WHERE season = '2015/2016' AND league = 'Italian Serie A'
SELECT MAX(home_team_goal) AS highest_score FROM matches WHERE league_id = (SELECT id FROM leagues WHERE name = 'Netherlands Eredivisie')
SELECT pa.finishing, pa.curve  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.weight = (SELECT MAX(weight) FROM Player)
SELECT L.name, COUNT(M.id) AS game_count FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY game_count DESC LIMIT 4;
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)
SELECT overall_rating FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 1
SELECT CAST(COUNT(CASE WHEN height < 180 AND overall_strength > 70 THEN 1 END) AS FLOAT) / COUNT(id) * 100 FROM players
SELECT    CASE      WHEN COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) > COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END) THEN 'In-patient'     ELSE 'Out-patient'   END AS "More",   (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) * 100.0 / COUNT(CASE WHEN SEX = 'M' THEN 1 END) AS "DeviationPercentage" FROM Patient
SELECT CAST(COUNT(CASE WHEN strftime('%Y', Birthday) > '1930' THEN 1 ELSE NULL END) AS REAL) / COUNT(*) FROM Patient WHERE SEX = 'F'
SELECT CAST(COUNT(CASE WHEN Admission = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM Patient WHERE Diagnosis = 'SLE'
SELECT p.Diagnosis, l.Date  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.ID = 30609;
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.ID = 163109;
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH > 500;
SELECT p.ID, YEAR(CURDATE()) - YEAR(p.Birthday) AS Age  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RVVT = '+'
SELECT P.ID, P.SEX, P.Diagnosis  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.Thrombosis = 2;
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(p.Birthday) = 1937 AND l.`T-CHO` >= 250;
SELECT P.ID, P.SEX, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALB < 3.5;
SELECT CAST(COUNT(DISTINCT CASE WHEN P.SEX = 'F' AND (L.TP < 6.0 OR L.TP > 8.5) THEN P.ID END) AS REAL) * 100 / COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID;
SELECT AVG(`aCL IgG`)  FROM `Examination`  JOIN `Patient` ON `Examination`.`ID` = `Patient`.`ID`  WHERE `Patient`.`Admission` = '+' AND (STRFTIME('%Y', 'now') - STRFTIME('%Y', `Patient`.`Birthday`)) >= 50;
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'F' AND YEAR(`Description`) = 1997 AND `Admission` = '-'
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS Age FROM `Patient` WHERE `Birthday` IS NOT NULL
SELECT COUNT(*)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.`Thrombosis` = 1 AND YEAR(E.`Examination Date`) = 1997 AND P.SEX = 'F'
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap  FROM Patient  WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200)
SELECT E.Symptoms, P.Diagnosis FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Symptoms IS NOT NULL))
SELECT CAST(COUNT(DISTINCT ID) AS REAL) / 12  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE SEX = 'M' AND Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT L.Date, (YEAR(P.`First Date`) - YEAR(P.Birthday)) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SJS'  ORDER BY P.Birthday ASC  LIMIT 1;
SELECT CAST(SUM(CASE WHEN P.SEX = 'M' AND L.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN P.SEX = 'F' AND L.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID;
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE DATE_ADD(p.`First Date`, INTERVAL 1 YEAR) <= e.`Examination Date`
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE YEAR(e.`Examination Date`) BETWEEN 1990 AND 1993  AND (YEAR(e.`Examination Date`) - YEAR(p.Birthday)) < 18;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0
SELECT Diagnosis, COUNT(Diagnosis) AS DiagnosisCount  FROM Examination  WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY Diagnosis  ORDER BY DiagnosisCount DESC  LIMIT 1;
SELECT AVG(1999 - YEAR(P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT MAX(L.HGB) AS MaxHGB, P.Diagnosis, YEAR(L.Date) - YEAR(P.Birthday) AS Age FROM Laboratory L JOIN Patient P ON L.ID = P.ID GROUP BY L.ID, P.Diagnosis, P.Birthday ORDER BY MaxHGB DESC LIMIT 1;
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT CASE WHEN `T-CHO` < 250 THEN 'Normal' ELSE 'Not Normal' END AS Cholesterol_Status FROM `Laboratory` WHERE `ID` = 2927464 AND `Date` = '1995-09-04'
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1
SELECT E.`aCL IgM`  FROM `Examination` E  JOIN `Patient` P ON E.ID = P.ID  WHERE P.Diagnosis = 'SLE' AND P.Description = '1994-02-19' AND E.`Examination Date` = '1993-11-12'
SELECT P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT = 9 AND L.Date = '1992-06-12'
SELECT (YEAR('1991-10-21') - YEAR(P.Birthday)) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date = '1991-10-21' AND L.UA = 8.4;
SELECT COUNT(L.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.`First Date` = '1991-06-13' AND P.Diagnosis = 'SJS' AND YEAR(L.`Date`) = 1995;
SELECT p.Diagnosis FROM Patient p INNER JOIN Examination e ON p.ID = e.ID WHERE e.`Examination Date` = '1997-01-27' AND e.Diagnosis LIKE '%SLE%' AND p.`First Date` IS NOT NULL;
SELECT E.Symptoms  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE P.Birthday = '1959-03-01' AND E.`Examination Date` = '1993-09-27'
SELECT (SUM(CASE WHEN Date LIKE '1981-11-%' THEN `T-CHO` END) - SUM(CASE WHEN Date LIKE '1981-12-%' THEN `T-CHO` END)) AS DecreaseRate FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Birthday = '1959-02-18'
SELECT ID FROM Examination WHERE Diagnosis LIKE '%Behcet%' AND `Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'
SELECT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 GROUP BY ID
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+'
SELECT COUNT(*)  FROM `Examination`  WHERE `Thrombosis` = 2  AND `ANA Pattern` = 'S'  AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM `Examination`)
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'M' AND STRFTIME('%Y', `First Date`) = '1981'
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Admission = '-'  AND L.Date LIKE '1991-10-%'  AND L.`T-BIL` < 2.0;
SELECT COUNT(*)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE P.SEX = 'F' AND E.`ANA Pattern` != 'P' AND P.Birthday BETWEEN '1980-01-01' AND '1989-12-31'
SELECT P.SEX  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE E.Diagnosis LIKE '%PSS%' AND L.CRP > 2 AND L.CRE = 1 AND L.LDH = 123;
SELECT AVG(ALB) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE SEX = 'F' AND Diagnosis = 'SLE' AND PLT > 400
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1
SELECT `First Date`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'F' AND `Diagnosis` = 'APS'
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE YEAR(Date) = 1997 AND (ALB < 6 OR ALB > 8.5)
SELECT CAST(COUNT(CASE WHEN Symptoms LIKE '%thrombocytopenia%' AND Diagnosis LIKE '%SLE%' THEN 1 END) AS FLOAT) / COUNT(CASE WHEN Symptoms LIKE '%thrombocytopenia%' THEN 1 END) * 100 FROM Examination
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100  FROM Patient  WHERE Diagnosis = 'RA' AND YEAR(Birthday) = 1980;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND p.Diagnosis = 'Behcet'  AND p.Admission = '-'  AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'F' AND l.WBC < 3.5
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM `Examination` JOIN `Patient` ON `Examination`.`ID` = `Patient`.`ID` WHERE `Patient`.`ID` = 821298;
SELECT CASE WHEN P.SEX = 'M' AND L.UA > 8.0 THEN 'Yes' WHEN P.SEX = 'F' AND L.UA > 6.5 THEN 'Yes' ELSE 'No' END AS Is_UA_Normal FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.ID = 57266;
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT < 60 AND YEAR(L.Date) = 1994;
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.GPT >= 60;
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GPT > 60 ORDER BY p.Birthday ASC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500 AND LDH IS NOT NULL
SELECT P.ID, YEAR(CURDATE()) - YEAR(P.Birthday) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH BETWEEN 600 AND 800;
SELECT P.ID, P.Admission  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALP < 300;
SELECT p.ID, CASE WHEN l.ALP < 300 THEN 'Yes' ELSE 'No' END AS Is_ALP_Normal FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01'
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TP < 6.0
SELECT (L.TP - 8.5) AS Deviation FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.TP > 8.5;
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND (l.ALB <= 3.5 OR l.ALB >= 5.5)  ORDER BY p.Birthday DESC;
SELECT p.ID, CASE WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Range' ELSE 'Out of Range' END AS Albumin_Status FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982;
SELECT CAST(COUNT(CASE WHEN L.UA > 6.5 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F'
SELECT AVG(UA)  FROM ( 	SELECT L.UA, L.Date, P.SEX  	FROM Laboratory L  	JOIN Patient P ON L.ID = P.ID  	WHERE (P.SEX = 'F' AND L.UA < 6.5) OR (P.SEX = 'M' AND L.UA < 8.0) ) AS NormalUA  WHERE Date = ( 	SELECT MAX(Date)  	FROM Laboratory  	WHERE ID = NormalUA.ID )
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.UN = 29;
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'RA' AND L.UN < 30;
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.CRE >= 1.5;
SELECT (SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END)) AS Result  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.CRE >= 1.5;
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)
SELECT P.SEX, GROUP_CONCAT(DISTINCT P.ID) AS Patient_IDs FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` >= 2.0 GROUP BY P.SEX;
SELECT p.ID, l.`T-CHO` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) ORDER BY l.`T-CHO` DESC LIMIT 1;
SELECT AVG(YEAR(CURDATE()) - YEAR(Birthday)) AS average_age  FROM Patient  WHERE SEX = 'M' AND ID IN (     SELECT ID      FROM Laboratory      WHERE `T-CHO` >= 250 )
SELECT P.ID, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TG > 300;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG >= 200 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 50;
SELECT DISTINCT L.ID  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Admission = '-' AND L.CPK < 250;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND YEAR(T1.Birthday) BETWEEN '1936' AND '1956' AND T2.CPK >= 250
SELECT p.ID, p.SEX, DATE_PART('year', AGE(p.Birthday)) AS age  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GLU >= 180 AND l.`T-CHO` < 250;
SELECT P.ID, L.GLU  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE YEAR(P.`First Date`) = 1991 AND L.GLU < 180;
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.WBC <= 3.5 OR l.WBC >= 9.0  GROUP BY p.SEX  ORDER BY p.Birthday ASC;
SELECT P.ID, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RBC < 3.5;
SELECT p.ID, p.Admission  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'F' AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) >= 50 AND (l.RBC <= 3.5 OR l.RBC >= 6.0)
SELECT DISTINCT p.ID, p.SEX  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.HGB < 10;
SELECT P.ID, P.SEX  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17  ORDER BY P.Birthday ASC  LIMIT 1;
SELECT P.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID HAVING COUNT(L.ID) > 2
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;
SELECT      (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT < 100) -      (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT > 400) AS Difference,     (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT < 100) AS LowerThanNormal,     (SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE PLT > 400) AS HigherThanNormal
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(l.Date) = 1984  AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 50  AND l.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN T2.PT >= 14 AND T1.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE DATE('now') - T1.Birthday > 55 * 365;
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.`First Date` > '1992-12-31' AND l.PT < 14;
SELECT COUNT(*) FROM `Laboratory` WHERE `Date` > '1997-01-01' AND `APTT` < 45
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Thrombosis = 0 AND l.APTT > 45;
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.WBC > 3.5 AND L.WBC < 9.0 AND (L.FG <= 150 OR L.FG >= 450)
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Birthday > '1980-01-01' AND (L.FG < 150 OR L.FG > 450)
SELECT DISTINCT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`U-PRO` >= 30;
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.`U-PRO` BETWEEN 0 AND 30;
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.IGG > 900 AND L.IGG < 2000 AND E.Symptoms IS NOT NULL;
SELECT p.diagnosis FROM patients p WHERE p.IGA = (SELECT MAX(IGA) FROM patients WHERE IGA BETWEEN 80 AND 500) 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.IGA > 80 AND l.IGA < 500 AND p.`First Date` >= '1990-01-01'
SELECT Diagnosis  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE IGM <= 40 OR IGM >= 400 )  GROUP BY Diagnosis  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT COUNT(*) FROM Patient WHERE CRP = '+' AND Description IS NULL;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 70;
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Examination E ON L.ID = E.ID  WHERE L.RA IN ('-', '+-') AND E.KCT = '+'
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Birthday > '1985-01-01' AND L.RA IN ('-', '+-')
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RF < 20 AND (YEAR(CURDATE()) - YEAR(P.Birthday)) > 60;
SELECT COUNT(DISTINCT l.ID)  FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.RF < 20 AND e.Thrombosis = 0;
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.C3 > 35 AND E.`ANA Pattern` LIKE '%P%';
SELECT `ID` FROM `Examination` WHERE `aCL IgA` = (SELECT MAX(`aCL IgA`) FROM `Examination` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `HCT` NOT BETWEEN 29 AND 52))
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis LIKE '%APS%' AND l.C4 > 10;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND (l.RNP = '-' OR l.RNP = '+-')
SELECT p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RNP NOT IN ('-', '+-')  ORDER BY p.Birthday DESC  LIMIT 1;
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.SM IN ('-', '+-') AND E.Thrombosis = 0;
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.SM NOT IN ('negative', '0')  ORDER BY P.Birthday DESC  LIMIT 3;
SELECT ID FROM Laboratory WHERE Date > '1997-01-01' AND SC170 IN ('negative', '0')
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F' AND e.Symptoms IS NULL AND e.SSC170 IN ('negative', '0')
SELECT COUNT(DISTINCT p.ID)  FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.SSA IN ('-', '+-') AND YEAR(p.`First Date`) < 2000;
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSA NOT IN ('negative', '0')  ORDER BY p.`First Date`  LIMIT 1;
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.SSB IN ('-', '0')
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M'  AND l.SSB IN ('-', '+-')  AND l.CENTROMEA IN ('-', '+-');
SELECT DISTINCT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.DNA >= 8;
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Description IS NULL AND L.DNA < 8;
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.IGG > 900 AND L.IGG < 2000 AND P.Admission = '+';
SELECT CAST(COUNT(CASE WHEN p.Diagnosis = 'SLE' THEN l.ID END) AS REAL) * 100 / COUNT(l.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GOT >= 60;
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.GOT < 60;
SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60)
SELECT p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GPT < 60  GROUP BY p.ID  ORDER BY MAX(l.GPT) DESC  LIMIT 3;
SELECT COUNT(P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT < 60 AND P.SEX = 'M'
SELECT MIN(T1.`First Date`) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.LDH DESC LIMIT 1
SELECT p.`First Date`, l.LDH  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH >= 500  ORDER BY p.`First Date` DESC  LIMIT 1;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.ALP >= 300;
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Admission = '-' AND L.ALP < 300;
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TP < 6.0;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5;
SELECT `Date` FROM `Laboratory` WHERE `ALB` = (SELECT MAX(`ALB`) FROM `Laboratory` WHERE `ALB` > 3.5 AND `ALB` < 5.5)
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.ALB > 3.5 AND L.ALB < 5.5 AND L.TP BETWEEN 6.0 AND 8.5;
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA`  FROM `Examination` E  JOIN `Patient` P ON E.ID = P.ID  JOIN `Laboratory` L ON L.ID = P.ID  WHERE P.SEX = 'F' AND L.UA > 6.50  ORDER BY L.UA DESC  LIMIT 1;
SELECT MAX(ANA)  FROM Examination  WHERE ID IN (SELECT ID FROM Laboratory WHERE CRE < 1.5)
SELECT E.ID  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.CRE < 1.5  GROUP BY E.ID  HAVING E.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination)
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-BIL` >= 2.0 AND E.`ANA Pattern` LIKE '%P%'
SELECT E.ANA FROM Examination E JOIN Patient P ON E.ID = P.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0)
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-CHO` >= 250 AND E.KCT = '-';
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-CHO` < 250 AND E.`ANA Pattern` LIKE '%P%'
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.TG < 200 AND E.Symptoms IS NOT NULL;
SELECT Diagnosis FROM Examination WHERE ID = (SELECT ID FROM Laboratory WHERE TG < 200 ORDER BY TG DESC LIMIT 1)
SELECT E.ID  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.Thrombosis = 0 AND L.CPK < 250;
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+')
SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GLU > 180)
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  JOIN Examination E ON P.ID = E.ID  WHERE L.GLU < 180 AND E.Thrombosis = 0;
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0;
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.RBC <= 3.5 OR l.RBC >= 6.0 AND p.Admission = '+'
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.PLT > 100 AND l.PLT < 400 AND p.Diagnosis IS NOT NULL;
SELECT L.PLT  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Diagnosis = 'MCTD' AND L.PLT > 100 AND L.PLT < 400;
SELECT AVG(PT) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND PT < 14
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.Thrombosis = 1 AND L.PT < 14;
SELECT m.major_name FROM major m JOIN member mb ON m.major_id = mb.link_to_major WHERE mb.first_name = 'Angela' AND mb.last_name = 'Sanders'
SELECT COUNT(*)  FROM `member` m  JOIN `major` ma  ON m.link_to_major = ma.major_id  WHERE ma.college = 'College of Engineering'
SELECT member.first_name, member.last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.department = 'Art and Design Department'
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` = (SELECT `event_id` FROM `event` WHERE `event_name` = 'Women''s Soccer')
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium'
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id, e.event_name ORDER BY COUNT(a.link_to_event) DESC LIMIT 1
SELECT t1.college FROM major AS t1 JOIN member AS t2 ON t1.major_id = t2.link_to_major WHERE t2.position = 'Vice President'
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean'
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND STRFTIME('%Y', e.event_date) = '2019'
SELECT COUNT(*)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type = 'Meeting'  GROUP BY e.event_id  HAVING COUNT(a.link_to_event) > 10;
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM attendance GROUP BY link_to_event HAVING COUNT(link_to_event) > 20) AND type != 'fundraiser'
SELECT CAST(COUNT(a.link_to_event) AS REAL) / COUNT(DISTINCT e.event_id)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type = 'Meeting' AND strftime('%Y', e.event_date) = '2020'
SELECT expense_description, MAX(cost) FROM expense WHERE expense_description IN ('Post Cards, Posters', 'Water, Cookies', 'Pizza', 'Posters', 'Parking') GROUP BY expense_description ORDER BY cost DESC LIMIT 1
SELECT COUNT(*) FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'
SELECT m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Laugh Out Loud'
SELECT m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies'
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey'
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt'
SELECT SUM(amount) FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')
SELECT SUM(spent) FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE category = 'Food' AND event_name = 'September Meeting'
SELECT z.city, z.state FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.position = 'President'
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois'
SELECT SUM(spent) FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement' AND event.event_name = 'September Meeting'
SELECT m.department  FROM major m  JOIN member mb ON m.major_id = mb.link_to_major  WHERE mb.last_name IN ('Pierce', 'Guidi')  GROUP BY m.department  HAVING COUNT(DISTINCT mb.last_name) = 2;
SELECT SUM(amount) FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Speaker'
SELECT e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08T00:00:00' AND e.approved = 'true'
SELECT AVG(cost) AS average_cost  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen'  AND (SUBSTR(e.expense_date, 6, 2) = '09' OR SUBSTR(e.expense_date, 6, 2) = '10')
SELECT SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) - SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END) AS difference FROM event e JOIN budget b ON e.event_id = b.link_to_event;
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'
SELECT COUNT(*) FROM `major` WHERE `college` = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT z.county FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.first_name = 'Adela' AND m.last_name = 'O''Gallagher'
SELECT COUNT(*) FROM `budget` JOIN `event` ON `budget.link_to_event` = `event.event_id` WHERE `event.event_name` = 'November Meeting' AND `budget.remaining` < 0
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker'
SELECT b.event_status FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Post Cards, Posters' AND e.expense_date = '2019-08-20'
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Brent' AND mem.last_name = 'Thomason'
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T1.t_shirt_size = 'Medium'
SELECT z.type FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson'
SELECT m.major_name  FROM major m  JOIN member mb  ON m.major_id = mb.link_to_major  WHERE mb.position = 'Vice President'
SELECT z.state FROM zip_code z JOIN member m ON z.zip_code = m.zip WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison'
SELECT m.department  FROM major m  JOIN member mm ON m.major_id = mm.link_to_major  WHERE mm.position = 'President'
SELECT date_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues'
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END)  FROM budget b  JOIN event e  ON b.link_to_event = e.event_id  WHERE b.category = 'Advertisement'
SELECT (SUM(CASE WHEN category = 'Parking' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event_name = 'November Speaker'
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT z.city, z.county, z.state  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth'
SELECT expense_description FROM expense WHERE link_to_budget = (SELECT budget_id FROM budget ORDER BY remaining ASC LIMIT 1)
SELECT m.member_id  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'October Meeting'
SELECT college FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.link_to_major IS NOT NULL GROUP BY college ORDER BY COUNT(college) DESC LIMIT 1
SELECT m.major_name FROM major m JOIN member mb ON m.major_id = mb.link_to_major WHERE mb.phone = '809-555-3360'
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event GROUP BY e.event_name ORDER BY SUM(b.amount) DESC LIMIT 1
SELECT expense_description FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')
SELECT COUNT(*) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'
SELECT i.date_received FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Casey' AND m.last_name = 'Mason'
SELECT COUNT(*) FROM `member` m JOIN `zip_code` z ON m.zip = z.zip_code WHERE z.state = 'Maryland'
SELECT COUNT(*) FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE phone = '954-555-6240')
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'School of Applied Sciences, Technology and Education'
SELECT e.event_name, MAX(b.spent / b.amount) AS ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' GROUP BY e.event_name ORDER BY ratio DESC LIMIT 1;
SELECT COUNT(*) FROM `member` WHERE `position` = 'President'
SELECT MAX(spent) FROM budget
SELECT COUNT(*) FROM `event` WHERE `type` = 'Meeting' AND strftime('%Y', `event_date`) = '2020'
SELECT SUM(spent) FROM budget WHERE category = 'Food'
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN major mg ON m.link_to_major = mg.major_id WHERE mg.major_name = 'Interior Design' AND e.event_name = 'Community Theater'
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina'
SELECT SUM(amount) FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour')
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40
SELECT SUM(e.cost)  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'Yearly Kickoff'
SELECT m.first_name, m.last_name FROM member m INNER JOIN expense e ON m.member_id = e.link_to_member INNER JOIN budget b ON e.link_to_budget = b.budget_id INNER JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'
SELECT m.first_name, m.last_name, i.source, i.amount  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE i.amount = (SELECT MAX(amount) FROM income)
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  GROUP BY e.event_id  ORDER BY SUM(ex.cost) ASC  LIMIT 1
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) / SUM(ex.cost)) * 100 AS percentage FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY COUNT(*) DESC LIMIT 1
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'
SELECT COUNT(*) FROM `member` WHERE `link_to_major` = (SELECT `major_id` FROM `major` WHERE `major_name` = 'Physics Teaching')
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND strftime('%Y', event.event_date) = '2019'
SELECT COUNT(a.link_to_event) AS events_attended, m.major_name  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi'  GROUP BY m.member_id, m.major_name;
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC LIMIT 1
SELECT COUNT(*)  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON e.event_id = a.link_to_event  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer'
SELECT (SUM(type = 'Community Service') / COUNT(*)) * 100 FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'
SELECT expense.cost FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Posters' AND event.event_name = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.event_status = 'Closed' AND b.remaining < 0  ORDER BY b.remaining ASC  LIMIT 1;
SELECT SUM(e.cost) AS total_value, ev.type  FROM event ev  JOIN budget b ON ev.event_id = b.link_to_event  JOIN expense e ON b.budget_id = e.link_to_budget  WHERE ev.event_name = 'October Meeting'  GROUP BY ev.type;
SELECT category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_budgeted ASC;
SELECT * FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')
SELECT budget_id, category, amount  FROM budget  WHERE category = 'Advertisement'  ORDER BY amount DESC  LIMIT 3
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE e.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;
SELECT expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'
SELECT expense_description FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE t_shirt_size = 'X-Large')
SELECT m.zip  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost < 50;
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'
SELECT position FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business')
SELECT COUNT(*)  FROM `member` m  JOIN `major` mj ON m.link_to_major = mj.major_id  WHERE mj.major_name = 'Business' AND m.t_shirt_size = 'Medium'
SELECT DISTINCT e.type  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 30;
SELECT DISTINCT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215'
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_date = '2020-03-24T12:00:00'
SELECT m.major_name FROM major m JOIN member mb ON m.major_id = mb.link_to_major WHERE mb.position = 'Vice President'
SELECT (SUM(CASE WHEN position = 'Member' AND link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business') THEN 1 ELSE 0 END) / COUNT(member_id)) * 100 FROM member
SELECT DISTINCT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215'
SELECT COUNT(*) FROM `income` WHERE `amount` = 50
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large'
SELECT COUNT(major_id) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'
SELECT m.last_name, maj.department, maj.college  FROM member m  JOIN major maj ON m.link_to_major = maj.major_id  WHERE maj.major_name = 'Environmental Engineering'  AND m.position = 'Member';
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0.0
SELECT z.city, z.state  FROM member m  JOIN major mj ON m.link_to_major = mj.major_id  JOIN zip_code z ON m.zip = z.zip_code  WHERE mj.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member'
SELECT E.event_name FROM event E JOIN attendance A ON E.event_id = A.link_to_event JOIN member M ON A.link_to_member = M.member_id WHERE E.type = 'Social' AND M.position = 'Vice President' AND E.location = '900 E. Washington St.'
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10'
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member'
SELECT (COUNT(i.income_id) / (SELECT COUNT(*) FROM member WHERE t_shirt_size = 'Medium' AND position = 'Member')) * 100 AS percentage FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member' AND i.amount = 50;
SELECT county FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'
SELECT DISTINCT a.link_to_event  FROM attendance a  JOIN expense e ON a.link_to_member = e.link_to_member  WHERE e.cost > 50;
SELECT m.member_id, a.link_to_event  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN attendance a ON m.member_id = a.link_to_member  WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT m.college FROM major m JOIN member mb ON m.major_id = mb.link_to_major WHERE mb.first_name = 'Katy' AND mb.link_to_major = 'rec1N0upiVLy5esTO'
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Business'
SELECT m.email  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'  AND e.cost > 20;
SELECT COUNT(*)  FROM `member` m  JOIN `major` maj ON m.link_to_major = maj.major_id  WHERE maj.major_name = 'education' AND m.position = 'Member';
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(budget_id) * 100 FROM budget
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT (SUM(type = 'PO Box') / COUNT(zip_code)) * 100 AS percentage FROM zip_code
SELECT e.event_name, e.location  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 0;
SELECT e.event_name, e.event_date  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;
SELECT m.first_name, m.last_name, maj.major_name  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN major maj ON m.link_to_major = maj.major_id  WHERE e.cost > 100;
SELECT z.city, z.county  FROM member m  JOIN income i ON m.member_id = i.link_to_member  JOIN zip_code z ON m.zip = z.zip_code  GROUP BY z.city, z.county  HAVING COUNT(i.amount) > 40;
SELECT m.member_id, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_cost DESC LIMIT 1;
SELECT AVG(cost) FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position != 'Member')
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Parking' AND ex.cost < (SELECT SUM(ex2.cost) / COUNT(DISTINCT e2.event_id) FROM event e2 JOIN budget b2 ON e2.event_id = b2.link_to_event JOIN expense ex2 ON b2.budget_id = ex2.link_to_budget WHERE b2.category = 'Parking')
SELECT (SUM(e.cost) / COUNT(DISTINCT b.link_to_event)) * 100 AS percentage_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.type = 'Meeting'
SELECT `link_to_budget` FROM `expense` WHERE `expense_description` = 'Water, Cookies' ORDER BY `cost` DESC LIMIT 1
SELECT m.first_name, m.last_name  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN budget b ON e.link_to_budget = b.budget_id  GROUP BY m.member_id  ORDER BY SUM(b.spent) DESC  LIMIT 5
SELECT m.first_name, m.last_name, m.phone  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost > (SELECT AVG(cost) FROM expense)  GROUP BY m.member_id;
SELECT (SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) - SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END)) / COUNT(m.position = 'Member') AS difference_percentage FROM member m JOIN zip_code z ON m.zip = z.zip_code;
SELECT m.major_name, m.department  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.last_name = 'Gerke' AND mem.first_name = 'Garrett'
SELECT m.first_name, m.last_name, e.cost  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Water, Veggie tray, supplies'
SELECT m.last_name, m.phone  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Elementary Education'
SELECT b.category, b.amount  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'Officers meeting - January' AND b.category = 'Speaker Gifts'
SELECT e.event_name  FROM event e  JOIN budget b  ON e.event_id = b.link_to_event  WHERE b.category = 'Food'
SELECT m.first_name, m.last_name, i.amount  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.date_received = '2019-09-09'
SELECT b.category  FROM budget b  JOIN expense e ON b.budget_id = e.link_to_budget  WHERE e.expense_description = 'Posters'
SELECT m.first_name, m.last_name, maj.college  FROM member m  JOIN major maj ON m.link_to_major = maj.major_id  WHERE m.position = 'Secretary'
SELECT SUM(b.spent) AS total_spent, e.event_name  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE b.category = 'Speaker Gifts'  GROUP BY e.event_name
SELECT T1.city FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'
SELECT m.first_name, m.last_name, m.position  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092;
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT CAST(COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) AS REAL) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) FROM customers
SELECT c.CustomerID, MIN(y.Consumption) AS MinConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.CustomerID BETWEEN 201201 AND 201212 GROUP BY c.CustomerID ORDER BY MinConsumption ASC LIMIT 1;
SELECT AVG(Consumption) / 12 AS Average_Monthly_Consumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND yearmonth.Date BETWEEN '201301' AND '201312'
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK' AND ym.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY SUM(ym.Consumption) DESC LIMIT 1;
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Segment = 'KAM' AND ym.Date BETWEEN '201201' AND '201212' AND ym.Consumption < 30000;
SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS ConsumptionDifference FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2012'
SELECT SUBSTR(y.Date, 1, 4) AS Year, SUM(y.Consumption) AS TotalConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1;
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK') GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;
SELECT y.Date, MAX(y.Consumption)  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Segment = 'SME' AND y.Date BETWEEN '201301' AND '201312'  GROUP BY y.Date  ORDER BY y.Consumption DESC  LIMIT 1;
SELECT      (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN y.CustomerID END)) AS SME_LAM_Diff,     (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN y.CustomerID END)) AS LAM_KAM_Diff,     (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN y.CustomerID END)) AS KAM_SME_Diff FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      SUBSTR(y.Date, 1, 4) = '2013' AND c.Currency = 'CZK'
SELECT      c.Segment,      (SUM(CASE WHEN y.Date LIKE '2013%' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN y.Date LIKE '2012%' THEN y.Consumption ELSE 0 END)) / SUM(CASE WHEN y.Date LIKE '2013%' THEN y.Consumption ELSE 0 END) * 100 AS PercentageChange FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID GROUP BY      c.Segment ORDER BY      PercentageChange DESC LIMIT 1  UNION ALL  SELECT      c.Segment,      (SUM(CASE WHEN y.Date LIKE '2013%' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN y.Date LIKE '2012%' THEN y.Consumption ELSE 0 END)) / SUM(CASE WHEN y.Date LIKE '2013%' THEN y.Consumption ELSE 0 END) * 100 AS PercentageChange FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID GROUP BY      c.Segment ORDER BY      PercentageChange ASC LIMIT 1
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT SUM(CASE WHEN Country = 'CZE' AND Segment = 'Value for money' THEN 1 ELSE 0 END) - SUM(CASE WHEN Country = 'SVK' AND Segment = 'Value for money' THEN 1 ELSE 0 END) AS discount_difference FROM gasstations
SELECT (t2.Consumption - t1.Consumption) AS Difference  FROM yearmonth t1  JOIN yearmonth t2 ON t1.Date = t2.Date  WHERE t1.CustomerID = 5 AND t2.CustomerID = 7 AND t1.Date = '201304'
SELECT      (SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END)) AS Amount_of_more_SMEs FROM      customers WHERE      Segment = 'SME'
SELECT c.CustomerID, c.Segment, c.Currency, y.Consumption  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310'  ORDER BY y.Consumption DESC  LIMIT 1;
SELECT c.CustomerID, y.Consumption  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'KAM'  ORDER BY y.Consumption DESC  LIMIT 1;
SELECT SUM(ym.Consumption)  FROM yearmonth ym  JOIN customers c ON ym.CustomerID = c.CustomerID  WHERE c.Segment = 'KAM' AND ym.Date = '201305';
SELECT CAST(COUNT(CASE WHEN y.Consumption > 46.73 THEN c.CustomerID END) AS REAL) * 100 / COUNT(c.CustomerID)  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'LAM'
SELECT Country, COUNT(*) AS Total FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY Total DESC LIMIT 1;
SELECT (COUNT(CASE WHEN Segment = 'KAM' THEN 1 END) / CAST(COUNT(CASE WHEN Segment = 'KAM' THEN 1 END) AS FLOAT)) * 100 AS Percentage FROM customers WHERE Currency = 'EUR' AND Segment = 'KAM'
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth WHERE Date = '201202'
SELECT (CAST(COUNT(CASE WHEN Segment = 'Premium' THEN 1 END) AS FLOAT) / COUNT(*)) * 100 AS PremiumPercentage FROM gasstations WHERE Country = 'SVK'
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1
SELECT c.Segment FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY SUM(y.Consumption) ASC LIMIT 1
SELECT c.CustomerID  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Segment = 'SME' AND ym.Date = '201206'  ORDER BY ym.Consumption ASC  LIMIT 1;
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'
SELECT MAX(Consumption / 12) FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR'
SELECT DISTINCT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  WHERE strftime('%Y%m', t.Date) = '201309'
SELECT DISTINCT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE strftime('%Y-%m', t.Date) = '2013-06'
SELECT DISTINCT g.ChainID  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'
SELECT DISTINCT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'
SELECT AVG(Amount) AS AverageTotalPrice FROM transactions_1k WHERE Date BETWEEN '2012-01-01' AND '2012-01-31'
SELECT COUNT(DISTINCT y.CustomerID)  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR' AND y.Consumption > 1000;
SELECT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE'
SELECT DISTINCT T1.Time  FROM transactions_1k AS T1  JOIN gasstations AS T2  ON T1.GasStationID = T2.GasStationID  WHERE T2.ChainID = 11;
SELECT COUNT(*)  FROM `transactions_1k` t JOIN `gasstations` g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;
SELECT COUNT(*)  FROM `transactions_1k` t JOIN `gasstations` g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'
SELECT AVG(t1.Price) FROM transactions_1k AS t1 JOIN gasstations AS t2 ON t1.GasStationID = t2.GasStationID WHERE t2.Country = 'CZE'
SELECT AVG(t1.Price)  FROM transactions_1k t1 JOIN customers c ON t1.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';
SELECT CustomerID, SUM(Price) AS TotalSpent FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY TotalSpent DESC LIMIT 1;
SELECT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE t.Date = '2012-08-25'  ORDER BY t.Time ASC  LIMIT 1;
SELECT c.Currency  FROM customers c  JOIN transactions_1k t  ON c.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00'
SELECT Segment FROM customers WHERE CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE CustomerID = (SELECT CustomerID FROM customers WHERE Segment IS NOT NULL LIMIT 1)) LIMIT 1
SELECT COUNT(*)  FROM `transactions_1k`  WHERE `Date` = '2012-08-26' AND `Time` < '13:00:00' AND `CustomerID` IN (SELECT `CustomerID` FROM `customers` WHERE `Currency` = 'CZK')
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'
SELECT y.Date, y.Consumption  FROM yearmonth y JOIN transactions_1k t ON y.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Price = 124.05 AND y.Date = '201201'
SELECT COUNT(*)  FROM `transactions_1k` t JOIN `gasstations` g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26' AND t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE'
SELECT c.Currency  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = 667467
SELECT gs.Country  FROM gasstations gs  JOIN transactions_1k t  ON gs.GasStationID = t.GasStationID  WHERE t.Date = '2012-08-24' AND t.Price = 548.4;
SELECT CAST(COUNT(DISTINCT CASE WHEN c.Currency = 'EUR' THEN t.CustomerID END) AS REAL) * 100 / COUNT(DISTINCT t.CustomerID)  FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-25'
SELECT (y2012.Consumption - y2013.Consumption) / y2012.Consumption AS DecreaseRate FROM (     SELECT CustomerID, SUM(Consumption) AS Consumption     FROM yearmonth     WHERE Date LIKE '2012%'     GROUP BY CustomerID ) y2012 JOIN (     SELECT CustomerID, SUM(Consumption) AS Consumption     FROM yearmonth     WHERE Date LIKE '2013%'     GROUP BY CustomerID ) y2013 ON y2012.CustomerID = y2013.CustomerID JOIN transactions_1k t ON y2012.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' AND t.Price = 634.8;
SELECT GasStationID, SUM(Price) AS TotalRevenue  FROM transactions_1k  GROUP BY GasStationID  ORDER BY TotalRevenue DESC  LIMIT 1;
SELECT      CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      gasstations AS T2  WHERE      T2.Country = 'SVK'
SELECT SUM(Price) AS TotalSpent FROM transactions_1k WHERE CustomerID = 38508;  SELECT SUM(Price) AS TotalSpent_Jan2012 FROM transactions_1k WHERE CustomerID = 38508 AND Date = '2012-01-01';
SELECT p.Description, SUM(t.Amount) as Total_Sales FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY Total_Sales DESC LIMIT 5;
SELECT c.CustomerID, AVG(t.Price / t.Amount) AS AveragePricePerItem, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE c.CustomerID = (     SELECT CustomerID     FROM transactions_1k     GROUP BY CustomerID     ORDER BY SUM(Amount) DESC     LIMIT 1 ) GROUP BY c.CustomerID, c.Currency;
SELECT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE t.ProductID = 2  ORDER BY t.Price DESC  LIMIT 1;
SELECT y.Consumption  FROM transactions_1k t  JOIN yearmonth y ON t.CustomerID = y.CustomerID  WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29 AND y.Date = '201208'
