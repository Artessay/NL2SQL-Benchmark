SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda' AND `Academic Year` = '2014-2015' AND `Enrollment (K-12)` > 0;	california_schools
SELECT `School Name`, `Percent (%) Eligible Free (Ages 5-17)`  FROM `frpm`  WHERE `School Type` = 'Continuation Schools (Public)'  ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC  LIMIT 3;	california_schools
SELECT DISTINCT s.Zip  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.County = 'Fresno' AND f.`Charter School (Y/N)` = 1;	california_schools
SELECT s.MailStreet, s.MailCity, s.MailState, s.MailZip  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)	california_schools
SELECT s.Phone  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Charter School (Y/N)` = 1 AND s.OpenDate > '2000-01-01' AND f.`Charter Funding Type` = 'Directly funded'	california_schools
SELECT COUNT(DISTINCT s.cds)  FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.AvgScrMath > 400 AND sc.Virtual = 'F'	california_schools
SELECT s.CDSCode, s.School, s.District, s.County, s.Magnet  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.NumTstTakr > 500 AND s.Magnet = 1;	california_schools
SELECT s.Phone  FROM schools s  JOIN satscores sa  ON s.CDSCode = sa.cds  WHERE sa.NumGE1500 > 0  ORDER BY sa.NumGE1500 DESC  LIMIT 1;	california_schools
SELECT s.NumTstTakr FROM satscores s JOIN (SELECT CDSCode FROM frpm WHERE `FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)) f ON s.cds = f.CDSCode	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM satscores sa  JOIN schools s ON sa.cds = s.CDSCode  WHERE sa.AvgScrMath > 560 AND s.FundingType = 'Directly funded' AND s.Charter = 1;	california_schools
SELECT t1.`FRPM Count (Ages 5-17)`  FROM frpm t1  JOIN satscores t2  ON t1.CDSCode = t2.cds  WHERE t2.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)	california_schools
SELECT CDSCode FROM frpm WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500	california_schools
SELECT MAX(f.`Percent (%) Eligible Free (Ages 5-17)`)  FROM `frpm` f  JOIN `satscores` s  ON f.CDSCode = s.cds  WHERE (s.NumGE1500 / s.NumTstTakr) > 0.3;	california_schools
SELECT s.Phone  FROM schools s  JOIN satscores sa ON s.CDSCode = sa.cds  WHERE sa.rtype = 'S'  ORDER BY (sa.NumGE1500 * 1.0 / sa.NumTstTakr) DESC  LIMIT 3;	california_schools
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)`  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  ORDER BY f.`Enrollment (Ages 5-17)` DESC  LIMIT 5;	california_schools
SELECT `dname`  FROM `satscores`  JOIN `schools` ON `satscores.cds` = `schools.CDSCode`  WHERE `schools.StatusType` = 'Active' AND `satscores.rtype` = 'D'  GROUP BY `dname`  ORDER BY AVG(`AvgScrRead`) DESC  LIMIT 1;	california_schools
SELECT COUNT(DISTINCT s.cds)  FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE s.NumTstTakr < 100 AND sc.County = 'Alameda';	california_schools
SELECT s.CDSCode, s.CharterNum, ss.AvgScrWrite  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL  ORDER BY ss.AvgScrWrite DESC;	california_schools
SELECT COUNT(DISTINCT s.cds)  FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.County = 'Fresno' AND sc.FundingType = 'Directly funded' AND s.NumTstTakr <= 250;	california_schools
SELECT s.Phone  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT COUNT(*) FROM `frpm` WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12'	california_schools
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Los Angeles'    AND `Free Meal Count (K-12)` > 500    AND `FRPM Count (K-12)` < 700;	california_schools
SELECT sname, MAX(NumTstTakr)  FROM satscores  WHERE cds IN (SELECT CDSCode FROM schools WHERE County = 'Contra Costa')  GROUP BY sname  ORDER BY NumTstTakr DESC  LIMIT 1;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30;	california_schools
SELECT s.School  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  JOIN satscores sa ON s.CDSCode = sa.cds  WHERE f.`Percent (%) Eligible Free (K-12)` > 0.1 AND sa.NumGE1500 >= 1500;	california_schools
SELECT s.School, s.FundingType FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE s.County = 'Riverside' GROUP BY s.CDSCode HAVING AVG(ss.AvgScrMath) > 400;	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.County = 'Monterey' AND f.`Percent (%) Eligible FRPM (Ages 5-17)` > 0.8 AND s.SOCType = 'High Schools (Public)'	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01'  GROUP BY s.School, ss.AvgScrWrite, s.Phone;	california_schools
SELECT s.School, s.DOCType  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Charter Funding Type` = 'Locally funded'  AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`)      FROM frpm      WHERE `Charter Funding Type` = 'Locally funded' )	california_schools
SELECT OpenDate FROM schools WHERE GSserved = 'K-12' ORDER BY Enrollment (K-12) DESC LIMIT 1	california_schools
SELECT `City`, `Enrollment (K-12)`  FROM `schools`  JOIN `frpm` ON `schools`.`CDSCode` = `frpm`.`CDSCode`  ORDER BY `Enrollment (K-12)` ASC  LIMIT 5;	california_schools
SELECT `School Name`, `Percent (%) Eligible Free (K-12)`  FROM `frpm`  ORDER BY `Enrollment (K-12)` DESC  LIMIT 10, 1;	california_schools
SELECT `School Name`, `FRPM Count (K-12)`, `Enrollment (K-12)`, (`FRPM Count (K-12)` / `Enrollment (K-12)`) AS `Eligible FRPM Rate (K-12)` FROM `frpm` WHERE `CDSCode` IN (     SELECT `CDSCode`     FROM `schools`     WHERE `SOC` = '66' ) ORDER BY `FRPM Count (K-12)` DESC LIMIT 5;	california_schools
SELECT s.School, s.Website  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000;	california_schools
SELECT (Free Meal Count (Ages 5-17) / Enrollment (Ages 5-17)) AS FreeRate  FROM frpm  WHERE CDSCode IN (     SELECT CDSCode      FROM schools      WHERE AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson' )	california_schools
SELECT s.AdmEmail1  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Charter School (Y/N)` = 1  ORDER BY f.`Enrollment (K-12)` ASC  LIMIT 1;	california_schools
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)	california_schools
SELECT s.Street, s.City, s.Zip, s.State  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE (ss.NumGE1500 * 1.0 / ss.NumTstTakr) = (     SELECT MIN(NumGE1500 * 1.0 / NumTstTakr)      FROM satscores      WHERE NumTstTakr > 0 )	california_schools
SELECT s.Website  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.NumTstTakr BETWEEN 2000 AND 3000 AND s.County = 'Los Angeles'	california_schools
SELECT AVG(NumTstTakr)  FROM satscores  WHERE cds IN (     SELECT CDSCode      FROM schools      WHERE County = 'Fresno' AND YEAR(OpenDate) = 1980 )	california_schools
SELECT s.Phone  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.dname = 'Fresno Unified'  ORDER BY ss.AvgScrRead ASC  LIMIT 1;	california_schools
SELECT s.School FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' AND s.School IS NOT NULL AND ss.AvgScrRead IS NOT NULL AND s.CDSCode IN (     SELECT cds     FROM (         SELECT cds, RANK() OVER (PARTITION BY cname ORDER BY AvgScrRead DESC) as rank         FROM satscores     ) ranked_scores     WHERE rank <= 5 )	california_schools
SELECT s.SOCType  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)	california_schools
SELECT s.AvgScrMath, sch.County  FROM satscores s  JOIN schools sch ON s.cds = sch.CDSCode  WHERE s.cds = (     SELECT cds      FROM satscores      WHERE AvgScrMath IS NOT NULL AND AvgScrRead IS NOT NULL AND AvgScrWrite IS NOT NULL      ORDER BY (AvgScrMath + AvgScrRead + AvgScrWrite) / 3      LIMIT 1 )	california_schools
SELECT s.AvgScrWrite, sch.City  FROM satscores s  JOIN schools sch ON s.cds = sch.CDSCode  WHERE s.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)  LIMIT 1;	california_schools
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmLName1 = 'Ulrich' AND s.AdmFName1 = 'Ricci' GROUP BY s.School;	california_schools
SELECT s.School, s.County, s.District, f.`Enrollment (K-12)`  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.DOC = '31'  ORDER BY f.`Enrollment (K-12)` DESC  LIMIT 1;	california_schools
SELECT CAST(COUNT(*) AS REAL) / 12 AS MonthlyAverage FROM schools WHERE County = 'Alameda' AND DOC = '52' AND strftime('%Y', OpenDate) = '1980'	california_schools
SELECT CAST(SUM(CASE WHEN t1.DOC = '54' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN t1.DOC = '52' THEN 1 ELSE 0 END) AS Ratio FROM schools t1 JOIN (     SELECT CDSCode, COUNT(*) AS merge_count     FROM schools     GROUP BY CDSCode     HAVING COUNT(*) > 1 ) t2 ON t1.CDSCode = t2.CDSCode WHERE t1.County = 'Orange' AND t1.DOC IN ('52', '54')	california_schools
SELECT s.County, s.School, s.ClosedDate  FROM schools s  WHERE s.StatusType = 'Closed'  GROUP BY s.County  ORDER BY COUNT(s.CDSCode) DESC  LIMIT 1;	california_schools
SELECT s.School, s.Street AS PostalStreetAddress FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.AvgScrMath = (SELECT DISTINCT AvgScrMath FROM satscores ORDER BY AvgScrMath DESC LIMIT 1 OFFSET 6)	california_schools
SELECT s.MailStreet, s.School  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores)	california_schools
SELECT COUNT(DISTINCT s.cds)  FROM satscores s  JOIN schools sc  ON s.cds = sc.CDSCode  WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500 AND sc.MailCity = 'Lakeport'	california_schools
SELECT SUM(NumTstTakr) FROM satscores WHERE cds IN (SELECT CDSCode FROM schools WHERE MailCity = 'Fresno')	california_schools
SELECT s.School, s.MailZip  FROM schools s  WHERE s.AdmLName1 = 'Atoian' AND s.AdmFName1 = 'Avetik';	california_schools
SELECT CAST(COUNT(CASE WHEN County = 'Colusa' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 ELSE NULL END) AS Ratio FROM schools WHERE MailState = 'CA'	california_schools
SELECT COUNT(*)  FROM `schools`  WHERE `MailState` = 'CA'  AND `City` = 'San Joaquin'  AND `StatusType` = 'Active';	california_schools
SELECT s.Phone, s.Ext  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  ORDER BY ss.AvgScrWrite DESC  LIMIT 1 OFFSET 332;	california_schools
SELECT `School`, `Phone`, `Ext` FROM `schools` WHERE `Zip` = '95203-3704'	california_schools
SELECT Website FROM schools WHERE AdmLName1 = 'Larson' AND AdmFName1 = 'Mike' OR AdmLName1 = 'Alvarez' AND AdmFName1 = 'Dante'	california_schools
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52'	california_schools
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles'  AND schools.Charter = 0  AND (frpm.`Free Meal Count (K-12)` * 100 / frpm.`Enrollment (K-12)`) < 0.18;	california_schools
SELECT s.School, s.City, s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3  FROM schools s  WHERE s.Charter = 1 AND s.CharterNum = '00D2'	california_schools
SELECT COUNT(*)  FROM `schools`  WHERE `MailCity` = 'Hickman' AND `CharterNum` = '00D4';	california_schools
SELECT (CAST(SUM(CASE WHEN T1.FundingType = 'Locally funded' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.FundingType)) * 100 FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Santa Clara' AND T1.Charter = 1	california_schools
SELECT COUNT(*)  FROM `schools`  WHERE `County` = 'Stanislaus'  AND `FundingType` = 'Directly funded'  AND `OpenDate` BETWEEN '2000-01-01' AND '2005-12-31';	california_schools
SELECT COUNT(*) FROM `schools` WHERE `City` = 'San Francisco' AND `ClosedDate` LIKE '1989%' AND `District` LIKE '%Community College%'	california_schools
SELECT County, COUNT(*) AS ClosureCount FROM schools WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY ClosureCount DESC LIMIT 1;	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31' AND SOCType = 'State Special Schools' AND EdOpsCode IS NOT NULL;	california_schools
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine' AND District = 'Alpine County Office of Education' AND (StatusType = 'Active' OR StatusType = 'Closed') AND SOCType = 'Community Day School';	california_schools
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0 LIMIT 1	california_schools
SELECT `Enrollment (Ages 5-17)` FROM `frpm` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `EdOpsCode` = 'SSS' AND `City` = 'Fremont') AND `Academic Year` = '2014-2015'	california_schools
SELECT `FRPM Count (Ages 5-17)`  FROM `frpm`  JOIN `schools` ON `frpm.CDSCode` = `schools.CDSCode`  WHERE `schools.MailStrAbr` = 'PO Box 1040' AND `schools.SOCType` = 'Youth Authority School'	california_schools
SELECT MIN(`Low Grade`)  FROM `frpm`  WHERE `CDSCode` IN (     SELECT `CDSCode`      FROM `schools`      WHERE `NCESDist` = '0613360' AND `EdOpsCode` = 'SPECON' )	california_schools
SELECT s.School, s.SOCType  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`County Code` = '37' AND f.`NSLP Provision Status` = 'Breakfast Provision 2'	california_schools
SELECT s.City  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.County = 'Merced'  AND f.Low Grade = '9'  AND f.High Grade = '12'  AND f.Educational Option Type = 'Breakfast Provision 2'  AND s.EILCode = 'HS'	california_schools
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) * 100 AS 'Percent (%) Eligible FRPM (Ages 5-17)' FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved = 'K-9'	california_schools
SELECT `GSserved` FROM `schools` WHERE `City` = 'Adelanto' GROUP BY `GSserved` ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE Virtual = 'F' AND (County = 'San Diego' OR County = 'Santa Barbara') GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1;	california_schools
SELECT School, Latitude, SchoolType  FROM schools  WHERE Latitude = (SELECT MAX(Latitude) FROM schools)	california_schools
SELECT s.City, f.Low Grade, s.School  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.State = 'CA'  ORDER BY s.Latitude ASC  LIMIT 1;	california_schools
SELECT GSoffered FROM schools WHERE Longitude = (SELECT MAX(ABS(Longitude)) FROM schools)	california_schools
SELECT COUNT(DISTINCT s.City) AS NumberOfCities, s.City, COUNT(s.CDSCode) AS NumberOfSchools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.GSserved = 'K-8' AND s.Magnet = 1 AND f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY s.City;	california_schools
SELECT AdmFName1, dname, COUNT(*) as count  FROM schools  WHERE AdmFName1 IS NOT NULL  GROUP BY AdmFName1, dname  ORDER BY count DESC  LIMIT 2;	california_schools
SELECT T1.District_Code, T1.`Percent (%) Eligible Free (K-12)` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine' OR T2.AdmFName2 = 'Alusine' OR T2.AdmFName3 = 'Alusine'	california_schools
SELECT s.District, s.County, s.School, a.AdmLName1  FROM schools s  JOIN (     SELECT CDSCode, AdmLName1      FROM schools      WHERE CharterNum = '40' ) a ON s.CDSCode = a.CDSCode;	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = '62' OR DOC = '54') AND AdmEmail1 IS NOT NULL AND AdmEmail1 <> '' UNION SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = '62' OR DOC = '54') AND AdmEmail2 IS NOT NULL AND AdmEmail2 <> '' UNION SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = '62' OR DOC = '54') AND AdmEmail3 IS NOT NULL AND AdmEmail3 <> ''	california_schools
SELECT s.School, s.AdmEmail1  FROM schools s  JOIN satscores sa ON s.CDSCode = sa.cds  WHERE sa.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)	california_schools
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'East Bohemia'	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A3 = 'Prague'  AND a.account_id IN (SELECT account_id FROM loan)	financial
SELECT CASE WHEN AVG(A12) > AVG(A13) THEN '1995' ELSE '1996' END AS higher_unemployment_year FROM district	financial
SELECT COUNT(DISTINCT d.district_id)  FROM district d  JOIN client c ON d.district_id = c.district_id  WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'north bohemia' AND d.A11 > 8000;	financial
SELECT a.account_id, (SELECT MAX(d.A11) - MIN(d.A11) FROM district d) AS salary_gap FROM client c JOIN disp d2 ON c.client_id = d2.client_id JOIN account a ON d2.account_id = a.account_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' GROUP BY a.account_id HAVING MIN(c.birth_date) AND MIN(d.A11)	financial
SELECT a.account_id  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district dis ON c.district_id = dis.district_id  WHERE c.birth_date = (SELECT MAX(c.birth_date) FROM client c)  AND dis.A11 = (SELECT MAX(dis.A11) FROM district dis)	financial
SELECT COUNT(*)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'	financial
SELECT DISTINCT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'DISPONENT'	financial
SELECT a.account_id, a.frequency  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.status = 'A' AND l.date LIKE '1997%' AND a.frequency = 'POPLATEK TYDNE'  GROUP BY a.account_id, a.frequency  HAVING MIN(l.amount)  ORDER BY l.amount ASC  LIMIT 1;	financial
SELECT a.account_id, l.amount  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.duration > 12 AND a.date LIKE '1993%'  ORDER BY l.amount DESC  LIMIT 1;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  JOIN disp dp ON c.client_id = dp.client_id  WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolov';	financial
SELECT account_id FROM trans WHERE date = (SELECT MIN(date) FROM trans WHERE date >= '1995-01-01' AND date < '1996-01-01')	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000;	financial
SELECT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cr ON d.disp_id = cr.disp_id  WHERE cr.issued = '1994-03-03'	financial
SELECT a.date  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount = 840 AND t.date = '1998-10-14'	financial
SELECT account.district_id FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.date = '1994-08-25'	financial
SELECT MAX(t.amount)  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN card c ON d.disp_id = c.disp_id  WHERE c.issued = '1996-10-21' AND d.type = 'OWNER';	financial
SELECT c.gender  FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id WHERE d.A11 = (SELECT MAX(A11) FROM district) ORDER BY c.birth_date ASC LIMIT 1;	financial
SELECT t1.amount  FROM trans t1  JOIN account a ON t1.account_id = a.account_id  JOIN loan l ON a.account_id = l.account_id  JOIN client c ON a.account_id = (SELECT account_id FROM disp WHERE client_id = c.client_id AND type = 'OWNER')  WHERE t1.date > a.date  AND c.client_id = (SELECT client_id FROM disp WHERE account_id = (SELECT account_id FROM loan GROUP BY account_id ORDER BY SUM(amount) DESC LIMIT 1))  ORDER BY t1.date ASC  LIMIT 1;	financial
SELECT COUNT(*)  FROM client c JOIN district d ON c.district_id = d.district_id JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' AND d.A2 = 'Jesenik';	financial
SELECT disp_id FROM disp WHERE account_id = (SELECT account_id FROM trans WHERE date = '1998-09-02' AND amount = 5100)	financial
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996;	financial
SELECT d.A2  FROM client c  JOIN disp dp ON c.client_id = dp.client_id  JOIN account a ON dp.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE c.gender = 'F' AND c.birth_date = '1976-01-29'	financial
SELECT c.birth_date  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN loan l ON a.account_id = l.account_id  WHERE l.amount = 98832 AND l.date = '1996-01-03' AND l.currency = 'USD'	financial
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp dp ON a.account_id = dp.account_id  JOIN client c ON dp.client_id = c.client_id  WHERE d.A3 = 'Prague'  ORDER BY a.date  LIMIT 1;	financial
SELECT (CAST(COUNT(CASE WHEN c.gender = 'M' THEN 1 ELSE NULL END) AS REAL) / COUNT(c.client_id)) * 100 AS male_percentage FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 ='south Bohemia' GROUP BY d.A3 ORDER BY CAST(d.A4 AS INTEGER) DESC LIMIT 1;	financial
SELECT ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id JOIN loan l ON t1.account_id = l.account_id JOIN disp d ON t1.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE t1.date = '1993-03-22' AND t2.date = '1998-12-27' AND l.date = '1993-07-05' AND d.type = 'OWNER' AND c.client_id = (SELECT client_id FROM disp WHERE account_id = (SELECT account_id FROM loan WHERE date = '1993-07-05' LIMIT 1) AND type = 'OWNER')	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM loan	financial
SELECT (CAST(COUNT(CASE WHEN amount < 100000 AND status = 'C' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN amount < 100000 THEN 1 ELSE NULL END)) * 100 FROM loan	financial
SELECT a.account_id, d.A2, d.A3  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.date >= '1993-01-01' AND a.date <= '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT a.account_id, a.frequency  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district dis ON c.district_id = dis.district_id  WHERE d.type = 'OWNER' AND dis.A3 = 'east Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT a.account_id, a.date  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Prachatice'	financial
SELECT d.A2, d.A3  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.loan_id = 4990;	financial
SELECT l.account_id, d.A2 AS district, d.A3 AS region  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.amount > 300000;	financial
SELECT l.loan_id, d.A3, d.A11  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.duration = 60;	financial
SELECT d.A2, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'D'	financial
SELECT CAST(SUM(CASE WHEN d.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE STRFTIME('%Y', a.date) = '1993'	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT d.A2, COUNT(c.client_id) AS female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id JOIN disp dp ON c.client_id = dp.client_id JOIN account a ON dp.account_id = a.account_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9;	financial
SELECT d.A2, t.amount  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%'  ORDER BY t.amount DESC  LIMIT 10;	financial
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON a.district_id = dis.district_id  LEFT JOIN card c ON d.disp_id = c.disp_id  WHERE dis.A3 = 'South Bohemia' AND c.card_id IS NULL;	financial
SELECT d.A3, COUNT(*) AS active_loans FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY active_loans DESC LIMIT 1;	financial
SELECT AVG(loan.amount)  FROM loan  JOIN disp ON loan.account_id = disp.account_id  JOIN client ON disp.client_id = client.client_id  WHERE client.gender = 'M';	financial
SELECT A2, A3 FROM district WHERE A13 = (SELECT MAX(A13) FROM district)	financial
SELECT COUNT(*)  FROM account  WHERE district_id = (     SELECT district_id      FROM district      ORDER BY A16 DESC      LIMIT 1 ) AND date >= '1996-01-01' AND date <= '1996-12-31';	financial
SELECT COUNT(DISTINCT t.account_id)  FROM trans t  JOIN account a ON t.account_id = a.account_id  WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0;	financial
SELECT COUNT(DISTINCT l.loan_id)  FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.frequency = 'POPLATEK MESICNE'  AND l.amount >= 250000  AND l.date BETWEEN '1995-01-01' AND '1997-12-31'	financial
SELECT COUNT(DISTINCT account_id) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM account WHERE district_id = 1)	financial
SELECT COUNT(*)  FROM client  WHERE gender = 'M' AND district_id = (     SELECT district_id      FROM district      ORDER BY A15 DESC      LIMIT 1 OFFSET 1 )	financial
SELECT COUNT(*) FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER'	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')	financial
SELECT DISTINCT d.A2  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount > 10000 AND t.date BETWEEN '1997-01-01' AND '1997-12-31'	financial
SELECT DISTINCT o.account_id  FROM order o  JOIN account a ON o.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE o.k_symbol = 'SIPO' AND d.A2 = 'Pisek'	financial
SELECT DISTINCT account_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card WHERE type = 'gold')	financial
SELECT AVG(amount) AS average_amount FROM trans WHERE operation = 'VYBER KARTOU' AND date >= '2021-01-01' AND date < '2022-01-01'	financial
SELECT DISTINCT d.client_id  FROM disp d  JOIN trans t ON d.account_id = t.account_id  WHERE t.operation = 'VYBER KARTOU' AND t.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date LIKE '1998%') AND t.date LIKE '1998%'	financial
SELECT DISTINCT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card cr ON d.disp_id = cr.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F' AND d.type = 'OWNER'	financial
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON a.district_id = dis.district_id  JOIN client c ON d.client_id = c.client_id  WHERE c.gender = 'F' AND dis.A3 ='south Bohemia'	financial
SELECT a.account_id  FROM account a  JOIN district d ON a.district_id = d.district_id  JOIN disp dp ON a.account_id = dp.account_id  WHERE d.A2 = 'Tabor' AND dp.type = 'OWNER'	financial
SELECT DISTINCT d.type  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON a.district_id = dis.district_id  WHERE d.type!= 'OWNER' AND dis.A11 > 8000 AND dis.A11 <= 9000;	financial
SELECT COUNT(DISTINCT t.account_id)  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.bank = 'AB' AND d.A3 = 'North Bohemia'	financial
SELECT DISTINCT d.A2  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.type = 'VYDAJ'	financial
SELECT AVG(A15)  FROM district  WHERE A15 > 4000  AND district_id IN (     SELECT district_id      FROM account      WHERE date >= '1997-01-01' )	financial
SELECT COUNT(DISTINCT c.card_id)  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE c.type = 'classic' AND d.type = 'OWNER';	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha')	financial
SELECT (CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) / COUNT(card_id)) * 100 FROM card	financial
SELECT c.client_id, c.gender, c.birth_date, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE d.type = 'OWNER' AND l.amount = (SELECT MAX(amount) FROM loan);	financial
SELECT d.A15 FROM district d JOIN account a ON d.district_id = a.district_id WHERE a.account_id = 532	financial
SELECT district_id FROM account WHERE account_id = (SELECT account_id FROM `order` WHERE order_id = 33333)	financial
SELECT t.*  FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.client_id = 3356 AND t.operation = 'VYBER'	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000;	financial
SELECT T2.type FROM disp AS T1 JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 13539	financial
SELECT T1.A3 FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541	financial
SELECT d.A2, COUNT(*) AS num_accounts FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.A2 ORDER BY num_accounts DESC LIMIT 1;	financial
SELECT c.client_id, c.gender, c.birth_date, d.A2, d.A3  FROM client c  JOIN disp dp ON c.client_id = dp.client_id  JOIN account a ON dp.account_id = a.account_id  JOIN order o ON a.account_id = o.account_id  JOIN district d ON c.district_id = d.district_id  WHERE o.order_id = 32423;	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik'	financial
SELECT DISTINCT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cr ON d.disp_id = cr.disp_id  WHERE cr.type = 'junior' AND cr.issued >= '1997-01-01'	financial
SELECT CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  JOIN account a ON c.district_id = a.district_id  WHERE d.A11 > 10000;	financial
SELECT ((SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) - SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) / SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END) * 100) AS growth_rate FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'	financial
SELECT (SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END)) AS difference FROM district WHERE A3 IN ('north Bohemia', 'east Bohemia')	financial
SELECT type, COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10  GROUP BY type;	financial
SELECT COUNT(*) AS statement_requests, k_symbol AS debit_purpose  FROM trans  WHERE account_id = 3 AND amount = 3539  GROUP BY k_symbol;	financial
SELECT birth_date FROM client WHERE client_id = (SELECT client_id FROM disp WHERE disp_id = 130)	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT l.amount, l.status  FROM loan l  JOIN disp d ON l.account_id = d.account_id  WHERE d.client_id = 992;	financial
SELECT SUM(t.amount), c.gender  FROM trans t  JOIN disp d ON t.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE t.trans_id > 851 AND d.client_id = 4  GROUP BY c.gender;	financial
SELECT T2.type FROM disp AS T1 JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 9	financial
SELECT SUM(t.amount)  FROM trans t  JOIN disp d ON t.account_id = d.account_id  WHERE d.client_id = 617 AND t.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.type = 'VYDAJ';	financial
SELECT c.client_id, c.gender, c.birth_date  FROM client c  JOIN district d ON c.district_id = d.district_id  JOIN account a ON c.district_id = a.district_id  WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31'  AND d.A3 = 'east Bohemia'	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN order o ON d.account_id = o.account_id  WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND o.k_symbol = 'SIPO'  AND o.amount > 4000;	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-12-31'	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cr ON d.disp_id = cr.disp_id  WHERE c.gender = 'F' AND cr.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON a.district_id = dis.district_id  WHERE dis.A3 = 'Prague'	financial
SELECT CAST(COUNT(CASE WHEN c.gender = 'M' THEN 1 END) AS REAL) * 100 / COUNT(*) FROM client c JOIN account a ON c.district_id = a.district_id WHERE a.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT d.client_id)  FROM disp d  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'	financial
SELECT a.account_id, l.amount, a.date  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.duration > 24 AND a.date < '1997-01-01'  ORDER BY l.amount ASC  LIMIT 1;	financial
SELECT a.account_id  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district dis ON c.district_id = dis.district_id  WHERE c.gender = 'F'  GROUP BY a.account_id  ORDER BY c.birth_date ASC, AVG(dis.A11) ASC  LIMIT 1;	financial
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.birth_date LIKE '1920%' AND d.A3 = 'east Bohemia'	financial
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND loan.duration = 24;	financial
SELECT AVG(amount)  FROM loan  WHERE status IN ('C', 'D')  AND account_id IN (     SELECT account_id      FROM account      WHERE frequency = 'POPLATEK PO OBRATU' )	financial
SELECT DISTINCT c.client_id, d.A2  FROM client c  JOIN disp dp ON c.client_id = dp.client_id  JOIN account a ON dp.account_id = a.account_id  WHERE dp.type = 'OWNER'  JOIN district d ON c.district_id = d.district_id;	financial
SELECT c.client_id, (strftime('%Y', 'now') - strftime('%Y', c.birth_date)) - (strftime('%m-%d', 'now') < strftime('%m-%d', c.birth_date)) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE cr.type = 'gold' AND d.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '-' AND a.element = 'cl'	toxicology
SELECT AVG(oxygen_count)  FROM (     SELECT molecule_id, COUNT(*) AS oxygen_count     FROM atom     WHERE element = 'o' AND molecule_id IN (         SELECT molecule_id         FROM bond         WHERE bond_type = '-'     )     GROUP BY molecule_id ) AS subquery;	toxicology
SELECT CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN molecule m ON m.molecule_id = a.molecule_id  WHERE m.label = '+';	toxicology
SELECT COUNT(*)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '-' AND a.element = 'na'	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT (CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS REAL) / COUNT(a.atom_id)) * 100 AS percentage FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element!= 'br'	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` BETWEEN 'TR000' AND 'TR099' AND `label` = '+'	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'	toxicology
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT a1.element, a2.element  FROM bond b  JOIN connected c1 ON b.bond_id = c1.bond_id  JOIN connected c2 ON b.bond_id = c2.bond_id  JOIN atom a1 ON c1.atom_id = a1.atom_id  JOIN atom a2 ON c2.atom_id = a2.atom_id  WHERE b.bond_type = '=' AND a1.atom_id!= a2.atom_id;	toxicology
SELECT label, COUNT(label) AS label_count FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE element = 'h' GROUP BY label ORDER BY label_count DESC LIMIT 1;	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'cl'	toxicology
SELECT a1.element, a2.element  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_type = '-'	toxicology
SELECT a1.atom_id, a2.atom_id  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  JOIN molecule m ON a1.molecule_id = m.molecule_id  WHERE m.label = '-'	toxicology
SELECT element  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')  GROUP BY element  ORDER BY COUNT(element)  LIMIT 1;	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE (atom_id = 'TR004_8' AND atom_id2 = 'TR004_20') OR (atom_id = 'TR004_20' AND atom_id2 = 'TR004_8'))	toxicology
SELECT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element ='sn') GROUP BY label	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE (a.element = 'i' OR a.element ='s') AND b.bond_type = '-'	toxicology
SELECT a1.atom_id, a2.atom_id, b.bond_id  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_type = '#'	toxicology
SELECT a2.atom_id, a2.element  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE a1.molecule_id = 'TR181'	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN a.element!= 'f' THEN m.molecule_id END) AS REAL) * 100 / COUNT(DISTINCT m.molecule_id)  FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3	toxicology
SELECT a1.atom_id, a2.atom_id  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN atom a2 ON a2.atom_id = c.atom_id2  WHERE c.bond_id = 'TR001_2_6' AND a1.molecule_id = 'TR001' AND a2.molecule_id = 'TR001'	toxicology
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' ORDER BY m.molecule_id LIMIT 5;	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'	toxicology
SELECT a.element, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.molecule_id = 'TR060'	toxicology
SELECT b.bond_type, m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.molecule_id = 'TR010'  GROUP BY b.bond_type  ORDER BY COUNT(b.bond_type) DESC  LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' GROUP BY m.molecule_id ORDER BY m.molecule_id LIMIT 3;	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2	toxicology
SELECT COUNT(*) FROM `connected` WHERE `atom_id` = 'TR009_12' OR `atom_id2` = 'TR009_12'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'br'	toxicology
SELECT b.bond_type, a1.atom_id, a2.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.bond_id = 'TR001_6_9'	toxicology
SELECT m.molecule_id, CASE WHEN m.label = '+' THEN 'carcinogenic' ELSE 'not carcinogenic' END AS is_carcinogenic FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '-'	toxicology
SELECT DISTINCT m.molecule_id, m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25'	toxicology
SELECT b.bond_id, b.bond_type  FROM bond b  JOIN connected c1 ON b.bond_id = c1.bond_id  JOIN atom a1 ON c1.atom_id = a1.atom_id  JOIN connected c2 ON b.bond_id = c2.bond_id  JOIN atom a2 ON c2.atom_id = a2.atom_id  WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p')	toxicology
SELECT m.molecule_id, m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '='  GROUP BY m.molecule_id, m.label  ORDER BY COUNT(b.bond_id) DESC  LIMIT 1;	toxicology
SELECT CAST(COUNT(DISTINCT bond_id) AS REAL) / COUNT(DISTINCT atom_id)  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.element = 'i'	toxicology
SELECT bond_type, bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE SUBSTR(atom_id, 7, 2) + 0 = 45)	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected)	toxicology
SELECT a1.atom_id, a2.atom_id  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE b.molecule_id = 'TR041' AND b.bond_type = '#'	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR144_8_19'	toxicology
SELECT m.molecule_id, COUNT(b.bond_id) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1;	toxicology
SELECT element, COUNT(*) as count  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'  GROUP BY element  ORDER BY count  LIMIT 1;	toxicology
SELECT DISTINCT a2.atom_id, a2.element  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE a1.element = 'pb'	toxicology
SELECT a1.element, a2.element  FROM bond b  JOIN connected c1 ON b.bond_id = c1.bond_id  JOIN connected c2 ON b.bond_id = c2.bond_id  JOIN atom a1 ON c1.atom_id = a1.atom_id  JOIN atom a2 ON c2.atom_id = a2.atom_id  WHERE b.bond_type = '#' AND a1.atom_id!= a2.atom_id;	toxicology
SELECT CAST(COUNT(b.bond_id) AS REAL) / (SELECT MAX(cnt) FROM (SELECT COUNT(a1.atom_id) AS cnt FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id GROUP BY a1.element, a2.element)) * 100 AS percentage FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id GROUP BY a1.element, a2.element ORDER BY percentage DESC LIMIT 1;	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'	toxicology
SELECT COUNT(*) FROM `atom` WHERE `element` IN ('c', 'h')	toxicology
SELECT atom_id2 FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element ='s')	toxicology
SELECT bond.bond_type FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element ='sn'	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '-';	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE (a.element = 'p' OR a.element = 'br') AND b.bond_type = '#'	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT (CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) / COUNT(a.atom_id)) * 100 AS percent FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-'	toxicology
SELECT molecule_id, label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*)  FROM `molecule`  WHERE `molecule_id` BETWEEN 'TR000' AND 'TR030'  AND `label` = '+';	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(DISTINCT bond_id)  FROM connected  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.element = 'i'	toxicology
SELECT CASE WHEN SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN m.label = '-' THEN 1 ELSE 0 END) THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS result FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'	toxicology
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR001_1_8'  AND a1.element = 'cl'  AND a2.element = 'c'	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON m.molecule_id = b.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE a.element = 'c'  AND b.bond_type = '#'  AND m.label = '-'  LIMIT 2	toxicology
SELECT CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT m.molecule_id) * 100 AS percentage FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type ='= '	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'	toxicology
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11'	toxicology
SELECT b.bond_id, m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#'	toxicology
SELECT element, COUNT(*)  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')  AND substr(atom_id, 7, 1) = '4'  GROUP BY element;	toxicology
SELECT m.label, CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(a.element) AS ratio FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.molecule_id = 'TR006' GROUP BY m.label;	toxicology
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'ca'	toxicology
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'c')	toxicology
SELECT a1.element, a2.element  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN atom a2 ON a2.atom_id = c.atom_id2  WHERE c.bond_id = 'TR001_10_11'	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN bond_type = '#' THEN molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT molecule_id) FROM bond	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent  FROM bond  WHERE molecule_id = 'TR047'	toxicology
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.atom_id = 'TR001_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151' AND label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'i', 'f', 'pb', 'te','sn')	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+'	toxicology
SELECT atom_id, molecule_id, element  FROM atom  WHERE element = 'c' AND substr(molecule_id, 3, 3) >= 10 AND substr(molecule_id, 3, 3) <= 50	toxicology
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+';	toxicology
SELECT b.bond_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+'	toxicology
SELECT COUNT(*)  FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND m.label = '+';	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR000_1_2' AND EXISTS (SELECT 1 FROM connected WHERE bond_id = 'TR000_1_2' AND atom_id = 'TR000_1')	toxicology
SELECT a.atom_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT (SUM(CASE WHEN m.label = '+' AND a.element = 'h' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id;	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124' AND label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) AS double_bonds, label AS is_carcinogenic  FROM bond  JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE bond.molecule_id = 'TR006' AND bond.bond_type = '=';	toxicology
SELECT m.molecule_id, a.element  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'	toxicology
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2, b.molecule_id FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON b.bond_id = c2.bond_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id = a2.atom_id WHERE b.bond_type = '-' AND a1.atom_id < a2.atom_id;	toxicology
SELECT m.molecule_id, GROUP_CONCAT(a.element) AS elements FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '#' GROUP BY m.molecule_id;	toxicology
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(DISTINCT bond_id)  FROM connected  WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')  OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl')	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.molecule_id = 'TR346'  GROUP BY a.atom_id	toxicology
SELECT COUNT(DISTINCT b.molecule_id) AS total_molecules, COUNT(DISTINCT m.molecule_id) AS carcinogenic_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+';	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  LEFT JOIN bond b ON m.molecule_id = b.molecule_id  WHERE a.element!='s' OR a.element IS NULL  AND b.bond_type!= '='  AND b.bond_type IS NOT NULL;	toxicology
SELECT m.label  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' AND a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT m.molecule_id) AS percentage FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id;	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_3_4'	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE (atom_id = 'TR000_1' AND atom_id2 = 'TR000_2') OR (atom_id = 'TR000_2' AND atom_id2 = 'TR000_1'))	toxicology
SELECT a1.molecule_id  FROM atom a1  JOIN atom a2 ON a1.molecule_id = a2.molecule_id  WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000'	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond	toxicology
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'n' AND m.label = '+';	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE a.element ='s' AND b.bond_type = '=';	toxicology
SELECT molecule_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY molecule_id HAVING COUNT(molecule_id) > 5	toxicology
SELECT a.element  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE b.bond_type = '=' AND a.molecule_id = 'TR024'  GROUP BY a.element	toxicology
SELECT molecule_id, COUNT(atom_id) AS atom_count FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY molecule_id ORDER BY atom_count DESC LIMIT 1;	toxicology
SELECT (SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'h' AND b.bond_type = '#'	toxicology
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id  WHERE b.bond_type = '=' AND a.element = 'o'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '-';	toxicology
SELECT a.element, b.bond_type  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) AND b.bond_id = c.bond_id  WHERE a.molecule_id = 'TR002'	toxicology
SELECT a.atom_id  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON a.atom_id = c.atom_id AND b.bond_id = c.bond_id  WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR012'	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element = 'o'	toxicology
SELECT name, cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT name, uuid FROM cards WHERE borderColor IS NULL AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL	card_games
SELECT name, MAX(faceConvertedManaCost) AS maxFaceConvertedManaCost FROM cards GROUP BY name ORDER BY maxFaceConvertedManaCost DESC;	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity ='mythic' AND l.format = 'gladiator' AND l.status = 'Banned'	card_games
SELECT c.name, l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage'	card_games
SELECT c.id, c.artist  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE (c.power = '*' OR c.power IS NULL)  AND l.format = 'commander'  AND l.status = 'Legal'	card_games
SELECT c.id, r.text, c.hasContentWarning  FROM cards c  LEFT JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Stephen Daniele'	card_games
SELECT r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'	card_games
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  GROUP BY c.uuid  ORDER BY COUNT(r.uuid) DESC  LIMIT 1;	card_games
SELECT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'	card_games
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese'	card_games
SELECT CAST(COUNT(CASE WHEN st.language = 'Chinese Simplified' THEN 1 ELSE NULL END) AS REAL) / COUNT(s.id) * 100 AS percentage FROM sets s LEFT JOIN set_translations st ON s.code = st.setCode;	card_games
SELECT s.setCode, s.totalSetSize  FROM sets s  JOIN set_translations st  ON s.setCode = st.setCode  WHERE st.language = 'Italian';	card_games
SELECT COUNT(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT DISTINCT set_translations.language  FROM cards  JOIN sets ON cards.setCode = sets.code  JOIN set_translations ON sets.code = set_translations.setCode  WHERE cards.name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Restricted' AND cards.isTextless = 0;	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Condemn')	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.status = 'Restricted' AND c.isStarter = 1;	card_games
SELECT status FROM legalities WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle')	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT T2.format, T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'	card_games
SELECT DISTINCT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian' AND T1.artist IS NOT NULL	card_games
SELECT CAST(COUNT(CASE WHEN borderColor = 'borderless' THEN id ELSE NULL END) AS REAL) * 100 / COUNT(id) FROM cards	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'German' AND c.isReprint = 1;	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.borderColor = 'borderless' AND fd.language = 'Russian';	card_games
SELECT CAST(COUNT(CASE WHEN fd.language = 'French' THEN c.id END) AS REAL) * 100 / COUNT(c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.isStorySpotlight = 1;	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99'	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability ='mtgo' AND hasNonFoil = 0 AND hasFoil = 0;	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel' AND subtypes!= 'Angel';	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT DISTINCT c.artist  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'Chinese Simplified'	card_games
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.availability = 'paper' AND fd.language = 'Japanese'	card_games
SELECT COUNT(*)  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE legalities.status = 'Banned' AND cards.borderColor = 'white';	card_games
SELECT DISTINCT c.uuid, fd.language  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE l.format = 'legacy' AND l.status = 'Legal'	card_games
SELECT text FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Beacon of Immortality')	card_games
SELECT COUNT(DISTINCT c.id) AS card_count, l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = 'future' AND l.status = 'legal'  GROUP BY l.status;	card_games
SELECT name, colors FROM cards WHERE setCode = 'OGW'	card_games
SELECT c.name, t.language  FROM cards c  JOIN set_translations t ON c.setCode = t.setCode  WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.originalType = 'Creature - Elf'	card_games
SELECT id, colors, GROUP_CONCAT(DISTINCT format) AS formats FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE id BETWEEN 1 AND 20 GROUP BY id, colors;	card_games
SELECT c.name, fd.language, fd.text  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language!= 'English'	card_games
SELECT c.name  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3;	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability ='mtgo' AND hand = '-1'	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability ='mtgo,paper'	card_games
SELECT SUM(CAST(REPLACE(SUBSTR(manaCost, 2, LENGTH(manaCost) - 2), '{', '') AS REAL)) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander'	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena' AND (subtypes IS NOT NULL OR supertypes IS NOT NULL)	card_games
SELECT DISTINCT s.setCode  FROM sets s  JOIN set_translations st  ON s.setCode = st.setCode  WHERE st.language = 'Spanish'	card_games
SELECT CAST(COUNT(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT (CAST(COUNT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN id END) AS REAL) / COUNT(id)) * 100 AS percentage, id  FROM cards  WHERE isStorySpotlight = 1 AND isTextless = 0  GROUP BY id  ORDER BY id;	card_games
SELECT c.name, (CAST(SUM(CASE WHEN fd.language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) / COUNT(c.id)) * 100 AS percentage FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid GROUP BY c.name ORDER BY c.name;	card_games
SELECT DISTINCT t.language  FROM set_translations t  JOIN sets s ON t.setCode = s.code  WHERE s.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM set_translations WHERE language = 'Portuguese (Brasil)' AND setCode IN (SELECT code FROM sets WHERE block = 'Commander')	card_games
SELECT c.id  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.types = 'Creature' AND l.status = 'Legal'	card_games
SELECT DISTINCT c.supertypes, c.subtypes  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE fd.language = 'German' AND c.subtypes IS NOT NULL AND c.supertypes IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*)  FROM cards  WHERE uuid IN (     SELECT uuid      FROM rulings      WHERE text = 'This is a triggered mana ability.' )  AND side IS NULL  AND uuid IN (     SELECT uuid      FROM legalities      WHERE format = 'premodern' )	card_games
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND (SELECT status FROM legalities WHERE legalities.uuid = cards.uuid AND format = 'pauper') = 'Legal'	card_games
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text = 'Das perfekte Gegenmittel zu einer dichten Formation'	card_games
SELECT fd.name  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE fd.language = 'French'  AND c.layout = 'normal'  AND c.borderColor = 'black'  AND c.artist = 'Matthew D. Wilson'  AND c.type LIKE '%Creature%';	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'rare' AND r.date = '2007-02-01'	card_games
SELECT st.language  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Ravnica' AND s.baseSetSize = 180;	card_games
SELECT CAST(COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) AS REAL) * 100 / COUNT(c.id)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'commander' AND l.status = 'legal'	card_games
SELECT CAST(COUNT(CASE WHEN fd.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'French' OR (c.power IS NULL OR c.power = '*')	card_games
SELECT CAST(COUNT(CASE WHEN st.language = 'Japanese' AND s.type = 'expansion' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN st.language = 'Japanese' THEN 1 END)  FROM set_translations st  JOIN sets s ON st.setCode = s.code	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1	card_games
SELECT name, power, promoTypes  FROM cards  WHERE (power IS NULL OR power = '*') AND promoTypes LIKE '%arenaleague%'  ORDER BY name  LIMIT 3;	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934	card_games
SELECT c1.id, c2.id  FROM cards c1  JOIN cards c2 ON c1.cardKingdomFoilId = c2.cardKingdomId  WHERE c1.cardKingdomFoilId IS NOT NULL AND c1.cardKingdomId IS NOT NULL  ORDER BY c1.cardKingdomFoilId ASC  LIMIT 3;	card_games
SELECT CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN isTextless = 1 THEN 1 END) FROM cards	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%'	card_games
SELECT code, name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3	card_games
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  JOIN sets s ON c.setCode = s.code  WHERE s.setCode = 'ARC' AND s.mcmName = 'Archenemy'	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5	card_games
SELECT s.type, st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 206;	card_games
SELECT s.id, s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.block = 'Shadowmoor'  ORDER BY s.name ASC  LIMIT 2;	card_games
SELECT s.id  FROM sets s  JOIN set_translations st ON s.code = st.setCode  JOIN foreign_data fd ON s.code = fd.multiverseid  WHERE s.isForeignOnly = 1  AND s.isFoilOnly = 1  AND st.language = 'Japanese'  AND fd.language = 'Japanese'	card_games
SELECT s.code, s.name, s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Russian'  ORDER BY s.baseSetSize DESC  LIMIT 1;	card_games
SELECT (CAST(COUNT(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE NULL END) AS REAL) / COUNT(T1.isOnlineOnly)) * 100 AS percentage  FROM sets AS T1  JOIN set_translations AS T2 ON T1.code = T2.setCode  WHERE T2.language = 'Chinese Simplified' AND T1.isOnlineOnly = 1	card_games
SELECT COUNT(DISTINCT s.setCode)  FROM sets s  LEFT JOIN set_translations st ON s.setCode = st.setCode  WHERE st.language = 'Japanese' AND s.mtgoCode IS NULL OR s.mtgoCode = ''	card_games
SELECT id FROM cards WHERE borderColor = 'black'	card_games
SELECT id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE id = 174)	card_games
SELECT name FROM sets WHERE code = 'ALL'	card_games
SELECT T1.language FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13'	card_games
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT code FROM sets WHERE type = 'expansion'	card_games
SELECT fd.name, fd.type  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.watermark = 'boros'	card_games
SELECT T2.language, T2.flavorText, T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'	card_games
SELECT CAST(SUM(CASE WHEN convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(convertedManaCost) FROM cards WHERE name = 'Abyssal Horror'	card_games
SELECT code FROM sets WHERE type = 'expansion' AND name LIKE '%Commander%'	card_games
SELECT fd.name, fd.type  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.watermark = 'abzan'	card_games
SELECT T2.language, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'azorius'	card_games
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT supertypes, subtypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT DISTINCT c.purchaseUrls  FROM cards c  WHERE c.promoTypes LIKE '%bundle%'	card_games
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'  AND availability LIKE '%arena,mtgo%'	card_games
SELECT name, convertedManaCost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT st.translation  FROM set_translations st  JOIN sets s ON st.setCode = s.code  JOIN cards c ON s.code = c.setCode  WHERE st.language = 'Italian' AND c.name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy')	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND st.language = 'German'	card_games
SELECT fd.id, fd.flavorText, fd.language, fd.multiverseid, fd.name, fd.text, fd.type, fd.uuid  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean'	card_games
SELECT COUNT(*)  FROM cards  JOIN set_translations ON cards.setCode = set_translations.setCode  WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex'	card_games
SELECT baseSetSize FROM sets WHERE code = (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition')	card_games
SELECT translation FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Eighth Edition') AND language = 'Chinese Simplified'	card_games
SELECT s.name, s.mtgoCode  FROM sets s  JOIN cards c ON c.setCode = s.code  WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Ancestor''s Chosen'	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND st.language = 'German'	card_games
SELECT COUNT(DISTINCT st.setCode)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;	card_games
SELECT s.isForeignOnly  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(*)  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.baseSetSize < 100;	card_games
SELECT COUNT(*) FROM cards WHERE setCode = 'CSP' AND borderColor = 'black'	card_games
SELECT name FROM cards WHERE setCode = 'CSP' AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode = 'CSP')	card_games
SELECT artist FROM cards WHERE setCode = 'CSP' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT * FROM cards WHERE setCode = 'CSP' AND number = '4'	card_games
SELECT COUNT(*)  FROM cards  WHERE setCode = 'CSP'    AND convertedManaCost > 5    AND (power = '*' OR power IS NULL)	card_games
SELECT fd.flavorText  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE fd.language = 'Italian' AND c.name = 'Ancestor''s Chosen'	card_games
SELECT DISTINCT fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL;	card_games
SELECT T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'	card_games
SELECT r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  JOIN set_translations st ON c.setCode = st.setCode  WHERE st.language = 'Italian' AND c.setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap')	card_games
SELECT fd.name  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  JOIN sets s ON c.setCode = s.code  WHERE fd.language = 'Italian'  AND s.name = 'Coldsnap'  AND c.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap'))	card_games
SELECT date FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Reminisce')	card_games
SELECT CAST(SUM(CASE WHEN convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode = 'CSP'	card_games
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM cards  WHERE setCode = 'CSP'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT c.name, r.text, c.hasContentWarning  FROM cards c  LEFT JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Jim Pavelec'	card_games
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation'	card_games
SELECT s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara' AND st.language = 'Italian'	card_games
SELECT s.type FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Huitième édition'	card_games
SELECT st.translation  FROM set_translations st  JOIN sets s ON st.setCode = s.code  JOIN cards c ON s.code = c.setCode  WHERE st.language = 'French' AND c.name = 'Tendo Ice Bridge'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL	card_games
SELECT st.translation  FROM cards c  JOIN sets s ON c.setCode = s.code  JOIN set_translations st ON s.code = st.setCode  WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese'	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Journey into Nyx Hero''s Path'  ORDER BY c.convertedManaCost DESC  LIMIT 1;	card_games
SELECT s.releaseDate  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Ola de frío'	card_games
SELECT s.type FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3;	card_games
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setCode IN (SELECT code FROM sets WHERE name = 'Mirrodin')	card_games
SELECT CAST(SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 AS percentage FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON s.code = c.setCode WHERE st.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM set_translations AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T1.language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT frameEffects  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  GROUP BY frameEffects  ORDER BY COUNT(*) DESC  LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a'	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT c.name, c.manaCost, c.convertedManaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel' AND l.status = 'Legal'  ORDER BY c.convertedManaCost DESC  LIMIT 10;	card_games
SELECT c.originalReleaseDate, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity ='mythic' AND l.status = 'legal'  ORDER BY c.originalReleaseDate ASC  LIMIT 1;	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French'	card_games
SELECT COUNT(*)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'rare'  AND c.types = 'Enchantment'  AND c.name = 'Abundance'  AND l.status = 'Legal'  GROUP BY c.uuid  HAVING COUNT(DISTINCT l.format) = (SELECT COUNT(DISTINCT format) FROM legalities)	card_games
SELECT l.format, GROUP_CONCAT(c.name) AS card_names FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format ORDER BY COUNT(l.status) DESC LIMIT 1;	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Battlebond')	card_games
SELECT c.artist, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  GROUP BY c.artist, l.format  ORDER BY COUNT(c.artist)  LIMIT 1;	card_games
SELECT l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = '1997'  AND c.artist = 'D. Alexander Gregory'  AND c.hasContentWarning = 1  AND l.format = 'legacy'	card_games
SELECT c.name, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.edhrecRank = 1 AND l.status = 'Banned'	card_games
SELECT AVG(id) AS annual_average_sets, (SELECT language FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31') GROUP BY language ORDER BY COUNT(language) DESC LIMIT 1) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY strftime('%Y', releaseDate)	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'banned' OR status ='restricted')	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT r.text, r.date  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.artist = 'Kev Walker'  ORDER BY r.date DESC;	card_games
SELECT c.name, l.format  FROM cards c  JOIN sets s ON c.setCode = s.code  JOIN legalities l ON c.uuid = l.uuid  WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'	card_games
SELECT s.name  FROM sets s  JOIN set_translations st_ko ON s.code = st_ko.setCode AND st_ko.language = 'Korean'  LEFT JOIN set_translations st_ja ON s.code = st_ja.setCode AND st_ja.language = 'Japanese'  WHERE st_ja.id IS NULL;	card_games
SELECT c.frameVersion, c.name, l.status  FROM cards c  LEFT JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = 'Allen Williams' AND l.status = 'Banned'  GROUP BY c.frameVersion, c.name, l.status;	card_games
SELECT DisplayName, Reputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT COUNT(*)  FROM users  WHERE UpVotes > 100 AND DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'  ORDER BY p.ViewCount DESC  LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT SUM(CommentCount) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT MAX(AnswerCount) AS MaxAnswers  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL;	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age > 65 AND p.Score >= 20;	codebase_community
SELECT u.Location  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.TagName = 'bayesian'	codebase_community
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND YEAR(b.Date) = 2011;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  GROUP BY b.UserId  ORDER BY COUNT(b.Id) DESC  LIMIT 1;	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.DisplayName)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Views > 200;	codebase_community
SELECT CAST(COUNT(CASE WHEN u.Age > 65 THEN p.Id ELSE NULL END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Score > 5;	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT p.Title  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT CommentCount FROM posts WHERE ViewCount = 1910	codebase_community
SELECT p.FavoriteCount  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0'	codebase_community
SELECT Text FROM comments WHERE PostId = 107829 LIMIT 1	codebase_community
SELECT p.Title, p.ClosedDate  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NOT NULL;	codebase_community
SELECT u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 65041	codebase_community
SELECT COUNT(*) FROM `posts` WHERE `OwnerDisplayName` = 'Tiago Pasqualini'	codebase_community
SELECT u.DisplayName  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE v.Id = 6347;	codebase_community
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT CAST(COUNT(p.Id) AS REAL) / COUNT(v.Id)  FROM posts p  LEFT JOIN votes v ON p.Id = v.PostId  WHERE p.OwnerUserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'	codebase_community
SELECT u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Text = 'thank you user93!';	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion.'	codebase_community
SELECT u.DisplayName, u.Reputation  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?';	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Necromancer'  LIMIT 10;	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Open source tools for visualizing multi-dimensional data?'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE u.DisplayName = 'Yevgeny'  GROUP BY u.WebsiteUrl;	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND ph.PostHistoryTypeId = 5;	codebase_community
SELECT SUM(v.BountyAmount)  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE p.Title LIKE '%data%'  AND v.BountyAmount IS NOT NULL;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN votes v ON u.Id = v.UserId  JOIN posts p ON v.PostId = p.Id  WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, c.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' JOIN comments c ON p.Id = c.PostId WHERE t.TagName = 'humor' GROUP BY p.Id, p.Title, c.Text;	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011'	codebase_community
SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) > 5	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b1 ON u.Id = b1.UserId AND b1.Name = 'Teacher'  JOIN badges b2 ON u.Id = b2.UserId AND b2.Name = 'Supporter'  WHERE u.Location = 'New York, NY'	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1	codebase_community
SELECT u.Id, u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId WHERE p.ViewCount >= 1000 GROUP BY u.Id, u.DisplayName HAVING COUNT(DISTINCT ph.PostId) = 1;	codebase_community
SELECT u.Id, u.DisplayName, b.Name  FROM users u  JOIN badges b ON u.Id = b.UserId  JOIN (     SELECT UserId, COUNT(Id) as commentCount      FROM comments      GROUP BY UserId ) c ON u.Id = c.UserId  ORDER BY c.commentCount DESC  LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher'	codebase_community
SELECT ((COUNT(CASE WHEN YEAR(Date) = 2010 THEN Name END) / COUNT(Name)) * 100 - (COUNT(CASE WHEN YEAR(Date) = 2011 THEN Name END) / COUNT(Name)) * 100) AS PercentageDifference FROM badges WHERE Name = 'Student'	codebase_community
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId)  FROM postHistory ph  LEFT JOIN comments c ON c.PostId = 3720  WHERE ph.PostId = 3720  GROUP BY ph.PostHistoryTypeId;	codebase_community
SELECT p.Id, p.ViewCount  FROM posts p  JOIN postLinks pl ON p.Id = pl.RelatedPostId  WHERE pl.PostId = 61217  UNION  SELECT p.Id, p.ViewCount  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE pl.RelatedPostId = 61217;	codebase_community
SELECT p.Score, pl.LinkTypeId  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE p.Id = 395;	codebase_community
SELECT p.Id, p.OwnerUserId FROM posts p WHERE p.Score > 60	codebase_community
SELECT SUM(FavoriteCount)  FROM posts  WHERE OwnerUserId = 686 AND strftime('%Y', CreaionDate) = '2011'	codebase_community
SELECT AVG(u.UpVotes) AS AvgUpVotes, AVG(u.Age) AS AvgAge FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.Id) > 10;	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'	codebase_community
SELECT b.Date  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'	codebase_community
SELECT CAST(COUNT(CASE WHEN Name = 'Teacher' THEN UserId ELSE NULL END) AS REAL) * 100 / COUNT(UserId) FROM badges	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(u.Id)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Organizer'	codebase_community
SELECT c.Score  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreaionDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(*)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;	codebase_community
SELECT u.Views  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT DISTINCT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(DISTINCT b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age > 65;	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT CAST(COUNT(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN Id ELSE NULL END) AS REAL) / COUNT(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN Id ELSE NULL END) FROM votes	codebase_community
SELECT t.TagName FROM tags t JOIN posts p ON t.Id = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan')	codebase_community
SELECT p.Id  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName ='slashnick'  ORDER BY p.AnswerCount DESC  LIMIT 1;	codebase_community
SELECT p.OwnerUserId, p.ViewCount, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder')  ORDER BY p.ViewCount DESC  LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  JOIN votes v ON p.Id = v.PostId  WHERE u.DisplayName = 'Matt Parker'  GROUP BY p.Id  HAVING COUNT(v.Id) > 4;	codebase_community
SELECT COUNT(*)  FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT T.TagName FROM posts P JOIN tags T ON P.Id = T.ExcerptPostId WHERE P.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Mark Meckes') AND P.CommentCount = 0	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Organizer'	codebase_community
SELECT CAST(COUNT(CASE WHEN t.TagName = 'r' THEN p.Id ELSE NULL END) AS REAL) / COUNT(p.Id) AS percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE u.DisplayName = 'Community'	codebase_community
SELECT SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS ViewCountDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT COUNT(DISTINCT UserId)  FROM badges  WHERE Name = 'Commentator' AND YEAR(Date) = 2014;	codebase_community
SELECT COUNT(*) FROM `posts` WHERE `CreaionDate` BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, u.DisplayName  FROM posts p  JOIN comments c ON p.Id = c.PostId  JOIN users u ON c.UserId = u.Id  WHERE c.Score > 60;	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011;	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.FavoriteCount > 150;	codebase_community
SELECT ph.PostId, COUNT(ph.Id) AS PostHistoryCount, MAX(ph.LastEditDate) AS LastEditDate FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY ph.PostId;	codebase_community
SELECT u.LastAccessDate, u.Location  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Outliers'	codebase_community
SELECT p.Title  FROM posts p  JOIN postLinks pl ON p.Id = pl.RelatedPostId  WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time')	codebase_community
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN badges ba ON u.Id = ba.UserId WHERE u.DisplayName = 'Samuel' AND YEAR(p.CreationDate) = 2013 AND YEAR(ba.Date) = 2013;	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN tags t ON u.Id = t.ExcerptPostId  WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT p.Title, pl.LinkTypeId  FROM postLinks pl  JOIN posts p ON p.Id = pl.RelatedPostId  WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'What are principal component scores?')	codebase_community
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Id = (     SELECT ParentId      FROM posts      WHERE ParentId IS NOT NULL      ORDER BY Score DESC      LIMIT 1 )	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM users u  JOIN votes v ON u.Id = v.UserId  WHERE v.VoteTypeId = 8  ORDER BY v.BountyAmount DESC  LIMIT 1;	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(DISTINCT p.Id)  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE YEAR(p.CreaionDate) = 2011 AND v.BountyAmount = 50;	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(Id) AS FLOAT) / 12 AS AverageMonthlyLinks FROM postLinks WHERE YEAR(CreationDate) = 2010 AND PostId IN (SELECT Id FROM posts WHERE AnswerCount <= 2)	codebase_community
SELECT p.Id  FROM posts p  JOIN votes v ON p.Id = v.PostId  WHERE v.UserId = 1465  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT p.Title  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  ORDER BY pl.CreationDate  LIMIT 1;	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  GROUP BY u.Id  ORDER BY COUNT(b.Name) DESC  LIMIT 1;	codebase_community
SELECT MIN(v.CreationDate)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.DisplayName = 'chl'	codebase_community
SELECT MIN(p.CreaionDate)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date  LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT p.OwnerUserId)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4;	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id FROM users WHERE Age = (SELECT MAX(Age) FROM users))	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM `users` WHERE `Reputation` > 2000 AND `Views` > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(*)  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens')  AND YEAR(CreationDate) = 2010;	codebase_community
SELECT Id, Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT p.Id, p.Title FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner')	codebase_community
SELECT DISTINCT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.ViewCount > 20000 AND YEAR(p.CreaionDate) = 2011;	codebase_community
SELECT p.Id, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.CreationDate BETWEEN '2010-01-01' AND '2010-12-31'  ORDER BY p.FavoriteCount DESC  LIMIT 1;	codebase_community
SELECT (CAST(COUNT(CASE WHEN p.CreationDate >= '2011-01-01' AND p.CreationDate < '2012-01-01' AND u.Reputation > 1000 THEN p.Id ELSE NULL END) AS REAL) / COUNT(p.Id)) * 100 AS Percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id;	codebase_community
SELECT CAST(COUNT(Id) FILTER (WHERE Age BETWEEN 13 AND 18) AS REAL) * 100 / COUNT(Id) AS percentage FROM users;	codebase_community
SELECT p.ViewCount, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Title = 'Computer Game Datasets'	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts))	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.LastEditorUserId  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC  LIMIT 1;	codebase_community
SELECT b.Name  FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65  AND UpVotes > 5000;	codebase_community
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon'	codebase_community
SELECT u.Id, COUNT(DISTINCT p.Id) AS PostCount, COUNT(DISTINCT c.Id) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.Id;	codebase_community
SELECT c.Text, u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'Analysing wind data with R'  ORDER BY c.CreationDate DESC  LIMIT 10;	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(*) FROM posts p JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' WHERE t.TagName = 'careers'	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(c.Id) AS Comments, COUNT(a.Id) AS Answers FROM comments c JOIN posts p ON c.PostId = p.Id LEFT JOIN posts a ON a.ParentId = p.Id WHERE p.Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;	codebase_community
SELECT CAST(COUNT(CASE WHEN p.Score > 50 THEN p.Id ELSE NULL END) AS REAL) / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName ='sample'	codebase_community
SELECT u.Reputation, u.UpVotes  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text = 'fine, you win :)';	codebase_community
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1;	codebase_community
SELECT c.CreationDate, u.Age  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Text LIKE '%http://%'	codebase_community
SELECT COUNT(DISTINCT c.PostId)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;	codebase_community
SELECT COUNT(*)  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE p.CommentCount = 1 AND c.Score = 0;	codebase_community
SELECT COUNT(DISTINCT c.UserId)  FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40;	codebase_community
SELECT p.Id, c.Text  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT u.UpVotes  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text = 'R is also lazy evaluated.'	codebase_community
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky'	codebase_community
SELECT DISTINCT u.DisplayName  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0;	codebase_community
SELECT (CAST(COUNT(CASE WHEN u.UpVotes = 0 THEN c.UserId END) AS REAL) / COUNT(c.UserId)) * 100  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 5 AND 10;	codebase_community
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero sh ON hp.hero_id = sh.id  WHERE sh.superhero_name = '3-D Man'	superhero
SELECT COUNT(hero_id) FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Super Strength')	superhero
SELECT COUNT(*)  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  GROUP BY s.full_name  HAVING COUNT(hp.power_id) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE s.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(DISTINCT h.id)  FROM superhero h  JOIN colour c ON h.eye_colour_id = c.id  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE c.colour = 'Blue' AND sp.power_name = 'Agility';	superhero
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON s.eye_colour_id = e.id  JOIN colour h ON s.hair_colour_id = h.id  WHERE e.colour = 'Blue' AND h.colour = 'Blond'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT s.superhero_name, s.height_cm  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'Marvel Comics'  ORDER BY s.height_cm DESC;	superhero
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name = 'Sauron'	superhero
SELECT c.colour, COUNT(s.id) AS eye_colour_count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY eye_colour_count DESC;	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT p.publisher_name  FROM publisher p  JOIN superhero s ON p.id = s.publisher_id  WHERE s.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Intelligence'  ORDER BY ha.attribute_value ASC  LIMIT 1;	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.superhero_name = 'Copycat'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Death Touch'	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  GROUP BY s.id  ORDER BY COUNT(s.id) DESC  LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT      (CAST(SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)) AS percentage,     SUM(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS marvel_count FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id JOIN      publisher p ON s.publisher_id = p.id;	superhero
SELECT SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.id = 75;	superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero sh ON hp.hero_id = sh.id  WHERE sh.superhero_name = 'Deathlok'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')	superhero
SELECT p.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT s.superhero_name  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.height_cm BETWEEN 170 AND 190 AND c.colour = 'No Colour'	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 56	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.weight_kg = 169;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.hair_colour_id = c.id  JOIN race r ON s.race_id = r.id  WHERE s.height_cm = 185 AND r.race = 'Human'	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)	superhero
SELECT CAST(SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.height_cm BETWEEN 150 AND 180;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Male'  AND s.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT p.power_name FROM superpower p JOIN hero_power hp ON p.id = hp.power_id GROUP BY p.power_name ORDER BY COUNT(p.power_name) DESC LIMIT 1;	superhero
SELECT ha.attribute_value  FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1	superhero
SELECT COUNT(hero_id) FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name ='stealth')	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength'  ORDER BY ha.attribute_value DESC  LIMIT 1;	superhero
SELECT COUNT(s.id) / SUM(CASE WHEN s.skin_colour_id = 1 THEN 1 ELSE 0 END) AS average FROM superhero s;	superhero
SELECT COUNT(*) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Flight'	superhero
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id;	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN s.skin_colour_id = c.id AND c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  JOIN gender g ON s.gender_id = g.id  WHERE g.gender = 'Female'	superhero
SELECT superhero_name, race FROM superhero JOIN race ON superhero.race_id = race.id WHERE full_name = 'Charles Chandler'	superhero
SELECT g.gender  FROM superhero s  JOIN gender g ON s.gender_id = g.id  WHERE s.superhero_name = 'Agent 13'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Adaptation'	superhero
SELECT COUNT(power_id) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo')	superhero
SELECT sp.power_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.full_name = 'Hunter Zolomon'	superhero
SELECT s.height_cm FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN colour c1 ON s.eye_colour_id = c1.id  JOIN colour c2 ON s.hair_colour_id = c2.id  WHERE c1.colour = 'Black' AND c2.colour = 'Black'	superhero
SELECT c.colour AS eye_colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour sc ON s.skin_colour_id = sc.id WHERE sc.colour = 'Gold'	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT COUNT(hero_id)  FROM hero_attribute  WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')  AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))	superhero
SELECT r.race, a.alignment  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN alignment a ON s.alignment_id = a.id  WHERE s.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference	superhero
SELECT superhero_name, AVG(height_cm) AS average_height FROM superhero GROUP BY superhero_name;	superhero
SELECT sp.power_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Abomination'	superhero
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3	superhero
SELECT a.attribute_name, ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON s.eye_colour_id = e.id  JOIN colour h ON s.hair_colour_id = h.id  WHERE e.colour = 'Blue' AND h.colour = 'Brown'	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = 1	superhero
SELECT CAST(COUNT(CASE WHEN c.colour = 'Blue' THEN s.superhero_name END) AS REAL) * 100 / COUNT(s.superhero_name)  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id;	superhero
SELECT CAST(SUM(CASE WHEN s.gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero s	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Karen Beecher-Duncan'	superhero
SELECT sp.power_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.full_name = 'Helen Parr'	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.id = 38	superhero
SELECT r.race  FROM race r  JOIN superhero s ON r.id = s.race_id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT a.alignment, sp.power_name  FROM superhero s  JOIN alignment a ON s.alignment_id = a.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Atom IV'	superhero
SELECT s.superhero_name, s.full_name  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE c.colour = 'Blue'  LIMIT 5;	superhero
SELECT AVG(attribute_value)  FROM hero_attribute  WHERE hero_id IN (     SELECT id      FROM superhero      WHERE alignment_id = 3 );	superhero
SELECT c.colour  FROM colour c  JOIN superhero s ON c.id = s.skin_colour_id  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value = 100;	superhero
SELECT COUNT(*)  FROM superhero  JOIN alignment ON superhero.alignment_id = alignment.id  JOIN gender ON superhero.gender_id = gender.id  WHERE alignment.id = 1 AND gender.id = 2;	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value BETWEEN 75 AND 80;	superhero
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN colour c ON s.hair_colour_id = c.id  JOIN gender g ON s.gender_id = g.id  WHERE c.colour = 'Blue' AND g.gender = 'Male'	superhero
SELECT CAST(SUM(CASE WHEN g.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM superhero s  JOIN alignment a ON s.alignment_id = a.id  JOIN gender g ON s.gender_id = g.id  WHERE a.id = 2;	superhero
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS difference  FROM superhero AS T1  JOIN colour AS T2  ON T1.eye_colour_id = T2.id  WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT ha.attribute_value  FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk'	superhero
SELECT sp.power_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE s.superhero_name = 'Ajax'	superhero
SELECT COUNT(*)  FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*)  FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC	superhero
SELECT g.gender  FROM gender g  JOIN superhero s ON g.id = s.gender_id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Phoenix Force'	superhero
SELECT s.superhero_name, s.weight_kg  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'DC Comics'  ORDER BY s.weight_kg DESC  LIMIT 1;	superhero
SELECT AVG(height_cm) FROM superhero WHERE race_id!= (SELECT id FROM race WHERE race = 'Human') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')	superhero
SELECT COUNT(*)  FROM hero_attribute  JOIN attribute ON hero_attribute.attribute_id = attribute.id  WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;	superhero
SELECT (SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT a.attribute_name  FROM attribute a  JOIN hero_attribute ha ON a.id = ha.attribute_id  JOIN superhero s ON ha.hero_id = s.id  WHERE s.superhero_name = 'Black Panther'  ORDER BY ha.attribute_value ASC  LIMIT 1;	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN publisher p ON s.publisher_id = p.id  WHERE p.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN alignment a ON s.alignment_id = a.id  WHERE p.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'	superhero
SELECT s.full_name  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg < 100 AND c.colour = 'Brown'	superhero
SELECT ha.attribute_value, a.attribute_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.superhero_name = 'Aquababy'	superhero
SELECT weight_kg, race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.id = 40;	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3	superhero
SELECT hero_id FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Intelligence')	superhero
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf'	superhero
SELECT sp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 20 AND q.q1 IN (SELECT MAX(q1) FROM qualifying WHERE raceId = 20 LIMIT 5)	formula_1
SELECT d.surname  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 19  ORDER BY q.q2  LIMIT 1;	formula_1
SELECT DISTINCT r.year  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.location = 'Shanghai'	formula_1
SELECT url FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Circuit de Barcelona-Catalunya' LIMIT 1	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany'	formula_1
SELECT c.circuitId, c.name, c.location, c.country  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  JOIN constructorResults cr ON r.raceId = cr.raceId  JOIN constructors con ON cr.constructorId = con.constructorId  WHERE con.name = 'Renault'  GROUP BY c.circuitId, c.name, c.location, c.country;	formula_1
SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2010 AND c.country NOT IN ('Malaysia', 'Bahrain', 'Spain', 'Turkey', 'Monaco', 'China', 'Singapore', 'Japan', 'South Korea', 'Abu Dhabi', 'Belgium', 'Germany', 'Italy', 'United Kingdom', 'France')	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain'	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix'	formula_1
SELECT r.url  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Sepang International Circuit'	formula_1
SELECT time FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Sepang International Circuit')	formula_1
SELECT lat, lng FROM circuits WHERE circuitId IN (SELECT circuitId FROM races WHERE name = 'Abu Dhabi Grand Prix')	formula_1
SELECT constructors.nationality  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructorResults.raceId = 24 AND constructorResults.points = 1;	formula_1
SELECT q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 354 AND d.forename = 'Bruno' AND d.surname = 'Senna'	formula_1
SELECT d.nationality  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 355 AND q.q2 = '0:01:40'	formula_1
SELECT T1.number FROM qualifying AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 903 AND T1.q3 LIKE '0:01:54%'	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NULL	formula_1
SELECT s.year, s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1;	formula_1
SELECT d.url  FROM drivers d  JOIN lapTimes l ON d.driverId = l.driverId  WHERE l.raceId = 161 AND l.time LIKE '1:27%'	formula_1
SELECT d.nationality  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 933 AND r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results WHERE raceId = 933)	formula_1
SELECT lat, lng FROM circuits WHERE circuitId IN (SELECT circuitId FROM races WHERE name = 'Malaysian Grand Prix')	formula_1
SELECT constructors.url  FROM constructors  JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructorResults.raceId = 9  ORDER BY constructorResults.points DESC  LIMIT 1;	formula_1
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId = (SELECT driverId FROM drivers WHERE surname = 'di Grassi' AND forename = 'Lucas')	formula_1
SELECT d.nationality  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 347 AND q.q2 = '0:01:15'	formula_1
SELECT d.code  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 45 AND q.q3 LIKE '1:33%'	formula_1
SELECT time FROM results WHERE raceId = 743 AND driverId = (SELECT driverId FROM drivers WHERE surname = 'McLaren')	formula_1
SELECT d.forename, d.surname  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2;	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  WHERE lt.raceId = 348  GROUP BY d.driverId  ORDER BY MIN(lt.time)  LIMIT 1;	formula_1
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT ((CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL) - CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 854 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL)) / CAST((SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS REAL)) * 100) AS percentageDifference	formula_1
SELECT CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN r.driverId END) AS REAL) / COUNT(r.driverId) AS race_completion_rate FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '1983-07-16'	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'	formula_1
SELECT COUNT(*), name FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT name FROM races WHERE strftime('%Y-%m', date) = (SELECT strftime('%Y-%m', MIN(date)) FROM races)	formula_1
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999)	formula_1
SELECT year, COUNT(*) AS race_count FROM races GROUP BY year ORDER BY race_count DESC LIMIT 1;	formula_1
SELECT name FROM races WHERE year = 2017 AND circuitId NOT IN (SELECT circuitId FROM races WHERE year = 2000)	formula_1
SELECT c.country, c.name, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.name = 'European Grand Prix'  ORDER BY r.year ASC  LIMIT 1;	formula_1
SELECT MAX(year)  FROM races  WHERE name = 'British Grand Prix' AND circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Brands Hatch')	formula_1
SELECT COUNT(*) FROM races WHERE name = 'British Grand Prix' AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Singapore Grand Prix' AND ra.year = 2010  ORDER BY r.positionOrder;	formula_1
SELECT d.forename, d.surname, MAX(r.points)  FROM drivers d  JOIN results r ON d.driverId = r.driverId;	formula_1
SELECT d.forename, d.surname, r.points  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2017  ORDER BY r.positionOrder ASC  LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.name, l.time  FROM lapTimes l  JOIN drivers d ON l.driverId = d.driverId  JOIN races r ON l.raceId = r.raceId  WHERE l.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009;	formula_1
SELECT CAST(COUNT(CASE WHEN r.position > 1 THEN rs.raceId END) AS REAL) / COUNT(rs.raceId) * 100 AS percentage FROM results rs JOIN races r ON rs.raceId = r.raceId JOIN drivers d ON rs.driverId = d.driverId WHERE d.surname = 'Hamilton' AND r.year >= 2010;	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(ds.points)  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  WHERE d.driverId IN (     SELECT r.driverId      FROM results r      WHERE r.position = 1      GROUP BY r.driverId      ORDER BY COUNT(r.driverId) DESC      LIMIT 1 )  GROUP BY d.driverId;	formula_1
SELECT surname, forename, YEAR(CURRENT_TIMESTAMP) - YEAR(dob) AS age  FROM drivers  WHERE nationality = 'Japanese'  ORDER BY dob DESC  LIMIT 1;	formula_1
SELECT c.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.year BETWEEN 1990 AND 2000  GROUP BY c.name  HAVING COUNT(r.raceId) = 4;	formula_1
SELECT c.name, c.location, r.name  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country = 'USA' AND r.year = 2006;	formula_1
SELECT r.name, c.name, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT r.name  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20;	formula_1
SELECT COUNT(*)  FROM results r  JOIN races ra ON r.raceId = ra.raceId  JOIN circuits c ON ra.circuitId = c.circuitId  JOIN drivers d ON r.driverId = d.driverId  WHERE c.name = 'Sepang International Circuit' AND d.surname = 'Schumacher' AND r.positionOrder = 1;	formula_1
SELECT r.name, r.year  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Michael' AND d.surname = 'Schumacher'  ORDER BY res.fastestLapTime  LIMIT 1;	formula_1
SELECT AVG(points) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Eddie' AND surname = 'Irvine') AND year = 2000;	formula_1
SELECT r.name, r.year, r.date, res.points  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY r.year, r.round  LIMIT 1;	formula_1
SELECT r.name, c.country  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2017  ORDER BY r.date;	formula_1
SELECT r.name, r.year, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  JOIN results res ON r.raceId = res.raceId  GROUP BY r.raceId  ORDER BY MAX(res.laps) DESC  LIMIT 1;	formula_1
SELECT (CAST(COUNT(CASE WHEN c.country = 'Germany' THEN r.raceId ELSE NULL END) AS REAL) / COUNT(r.raceId)) * 100 AS percentage FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT url FROM drivers WHERE surname = 'Davidson' AND forename = 'Anthony'	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009	formula_1
SELECT DISTINCT year FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')	formula_1
SELECT url FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Silverstone Circuit')	formula_1
SELECT time FROM races WHERE year = 2010 AND name = 'Abu Dhabi Grand Prix'	formula_1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'	formula_1
SELECT date FROM races WHERE circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya')	formula_1
SELECT c.url FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009	formula_1
SELECT MIN(fastestLapTime) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 AND r.rank = 1	formula_1
SELECT r.name, r.date, r.circuitId  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.driverRef = 'hamilton'  ORDER BY r.date;	formula_1
SELECT r.name, r.year, r.round  FROM results res  JOIN drivers d ON res.driverId = d.driverId  JOIN races r ON res.raceId = r.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY res.rank ASC  LIMIT 1;	formula_1
SELECT MAX(fastestLapSpeed) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009	formula_1
SELECT DISTINCT r.year  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT r.positionOrder  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Chinese Grand Prix' AND ra.year = 2008	formula_1
SELECT d.forename, d.surname  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Australian Grand Prix' AND ra.year = 1989 AND r.grid = 4;	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL	formula_1
SELECT l.time  FROM lapTimes l JOIN drivers d ON l.driverId = d.driverId JOIN races r ON l.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Australian Grand Prix' AND r.year = 2008 ORDER BY l.milliseconds ASC LIMIT 1;	formula_1
SELECT r.time  FROM results r  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2008 AND r.positionOrder = 2	formula_1
SELECT d.forename, d.surname, d.url  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.time LIKE '%:%:%.%'	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE d.nationality = 'British' AND ra.name = 'Australian Grand Prix' AND ra.year = 2008;	formula_1
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE name = 'Chinese Grand Prix' AND year = 2008 ) AND time IS NOT NULL;	formula_1
SELECT SUM(points) AS total_points FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(strftime('%s', fastestLapTime, 'unixepoch') - strftime('%s', '00:00.000', 'unixepoch')) AS average_fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND fastestLapTime IS NOT NULL;	formula_1
SELECT CAST(COUNT(CASE WHEN time IS NOT NULL THEN 1 ELSE NULL END) AS REAL) / COUNT(raceId)  FROM results  WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')	formula_1
SELECT ((STRFTIME('%s', T1.time) - STRFTIME('%s', T2.time)) / STRFTIME('%s', T1.time)) * 100 AS percentage_faster FROM results AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.position = 1 AND T2.position = (SELECT MAX(position) FROM results WHERE raceId = T1.raceId) AND T1.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND T1.time IS NOT NULL AND T2.time IS NOT NULL	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01'	formula_1
SELECT MAX(points) FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructors.nationality = 'British'	formula_1
SELECT constructors.name  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  GROUP BY constructors.name  ORDER BY SUM(constructorStandings.points) DESC  LIMIT 1;	formula_1
SELECT constructors.name  FROM constructors  LEFT JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructorResults.raceId = 291 AND constructorResults.points = 0;	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE c.nationality = 'Japanese'  GROUP BY c.constructorId  HAVING COUNT(DISTINCT cr.raceId) = 2 AND SUM(cr.points) = 0;	formula_1
SELECT constructors.name  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  WHERE constructorStandings.position = 1  GROUP BY constructors.name;	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  JOIN lapTimes l ON r.raceId = l.raceId AND r.driverId = l.driverId  WHERE c.nationality = 'French' AND l.lap > 50;	formula_1
SELECT (CAST(SUM(CASE WHEN r.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(d.driverId)) * 100 AS race_completion_percentage FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.nationality = 'Japanese' AND ra.year BETWEEN 2007 AND 2009;	formula_1
SELECT r.year, AVG(CAST(strftime('%s', t.time) AS REAL)) AS avg_time FROM results t JOIN races r ON t.raceId = r.raceId WHERE r.year < 1975 AND t.position = 1 AND t.time IS NOT NULL GROUP BY r.year;	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.dob > '1975-12-31' AND r.rank = 2;	formula_1
SELECT COUNT(*)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  WHERE d.nationality = 'Italian' AND r.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT fastestLap FROM results WHERE year = 2009 AND positionText = '1'	formula_1
SELECT AVG(fastestLapSpeed) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009)	formula_1
SELECT r.name, r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.milliseconds IS NOT NULL  GROUP BY r.raceId  ORDER BY MIN(res.milliseconds)  LIMIT 1;	formula_1
SELECT CAST(SUM(CASE WHEN YEAR(d.dob) < 1985 AND r.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(r.driverId)  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN lapTimes lt ON d.driverId = lt.driverId  WHERE d.nationality = 'French' AND lt.milliseconds < 120000;	formula_1
SELECT code FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18	formula_1
SELECT code, COUNT(*) AS netherlandic_count FROM (     SELECT code, nationality     FROM drivers     ORDER BY dob DESC     LIMIT 3 ) AS top_youngest WHERE nationality = 'Dutch' GROUP BY code;	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980'	formula_1
SELECT d.driverId, d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1990-12-31' GROUP BY d.driverId, d.forename, d.surname ORDER BY earliest_lap_time ASC LIMIT 3;	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT d.driverId, d.code  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime IS NOT NULL;	formula_1
SELECT d.driverId, d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Spanish' AND d.dob < '1982-01-01' GROUP BY d.driverId, d.forename, d.surname ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT r.year  FROM results res  JOIN races r ON res.raceId = r.raceId  WHERE res.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)	formula_1
SELECT r.year  FROM races r  JOIN lapTimes l ON r.raceId = l.raceId  GROUP BY r.year  ORDER BY MAX(l.milliseconds) DESC  LIMIT 1;	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 GROUP BY driverId ORDER BY MIN(time) ASC LIMIT 5	formula_1
SELECT COUNT(*)  FROM results  WHERE raceId BETWEEN 50 AND 100  AND time IS NOT NULL  AND statusId = 2;	formula_1
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria' GROUP BY location, lat, lng	formula_1
SELECT raceId, COUNT(*) AS finishers FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finishers DESC LIMIT 1;	formula_1
SELECT d.driverRef, d.nationality, d.dob  FROM drivers d  JOIN qualifying q ON d.driverId = q.driverId  WHERE q.raceId = 23 AND q.q2 IS NOT NULL;	formula_1
SELECT MIN(races.date) AS race_date, races.year, drivers.forename, drivers.surname, races.name, races.time  FROM drivers  JOIN qualifying ON drivers.driverId = qualifying.driverId  JOIN races ON qualifying.raceId = races.raceId  WHERE drivers.dob = (SELECT MAX(dob) FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying)) GROUP BY drivers.driverId, races.year, races.name, races.time;	formula_1
SELECT COUNT(*)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN status ON results.statusId = status.statusId  WHERE drivers.nationality = 'American' AND status.status = 'Puncture'	formula_1
SELECT c.name, c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1;	formula_1
SELECT constructors.url  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  GROUP BY constructors.constructorId  ORDER BY SUM(constructorStandings.wins) DESC  LIMIT 1;	formula_1
SELECT d.forename, d.surname, l.time  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  JOIN lapTimes l ON r.raceId = l.raceId AND r.driverId = l.driverId  WHERE ra.name = 'French Grand Prix' AND l.lap = 3  ORDER BY l.time DESC  LIMIT 1;	formula_1
SELECT r.name, l.milliseconds  FROM races r  JOIN lapTimes l ON r.raceId = l.raceId  WHERE l.lap = 1  ORDER BY l.milliseconds ASC  LIMIT 1;	formula_1
SELECT AVG(fastestLapTime) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix') AND rank < 11	formula_1
SELECT d.forename, d.surname, AVG(CAST(SUBSTR(p.duration, 4, 6) AS REAL)) AS avg_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId ORDER BY avg_duration ASC LIMIT 3;	formula_1
SELECT d.forename, d.surname, r.time  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1;	formula_1
SELECT c.constructorRef, c.url  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Singapore Grand Prix' AND ra.year = 2009 AND r.positionOrder = 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND dob BETWEEN '1981-01-01' AND '1991-12-31'	formula_1
SELECT forename ||'' || surname AS fullName, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT c.name, c.nationality, SUM(cr.points) AS total_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 GROUP BY c.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(points)  FROM results  JOIN races ON results.raceId = races.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.driverRef = 'hamilton' AND races.name = 'Turkish Grand Prix'	formula_1
SELECT AVG(COUNT(*))  FROM races  WHERE date BETWEEN '2000-01-01' AND '2010-12-31'  GROUP BY year;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT COUNT(*) AS victories  FROM results  WHERE driverId = (SELECT driverId FROM driverStandings WHERE position = 91) AND position = 1;	formula_1
SELECT r.name  FROM results res  JOIN races r ON res.raceId = r.raceId  WHERE res.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT c.name, c.location, c.country  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.date = (SELECT MAX(date) FROM races)	formula_1
SELECT d.forename, d.surname  FROM qualifying q  JOIN races r ON q.raceId = r.raceId  JOIN drivers d ON q.driverId = d.driverId  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2008 AND c.name = 'Marina Bay Street Circuit' AND q.q3 = (SELECT MIN(q3) FROM qualifying WHERE raceId = r.raceId)	formula_1
SELECT d.forename, d.surname, d.nationality, r.name  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.dob = (SELECT MAX(dob) FROM drivers)  LIMIT 1;	formula_1
SELECT COUNT(*) AS accident_count FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident' GROUP BY r.driverId ORDER BY accident_count DESC LIMIT 1;	formula_1
SELECT d.forename, d.surname, COUNT(r.wins) AS wins FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) GROUP BY d.driverId;	formula_1
SELECT MAX(duration) FROM pitStops	formula_1
SELECT MIN(time) FROM lapTimes	formula_1
SELECT MAX(duration) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT lap FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE year = 2011 AND name = 'Australian Grand Prix')	formula_1
SELECT d.forename, d.surname, ps.duration  FROM pitStops ps  JOIN drivers d ON ps.driverId = d.driverId  JOIN races r ON ps.raceId = r.raceId  WHERE r.name = 'Australian Grand Prix' AND r.year = 2011;	formula_1
SELECT MIN(lapTimes.time) AS lap_record FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.driverRef = 'hamilton'	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results) LIMIT 20	formula_1
SELECT c.circuitId, c.name, l.position  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  JOIN lapTimes l ON r.raceId = l.raceId AND d.driverId = l.driverId  WHERE d.driverRef = 'hamilton' AND l.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE driverRef = 'hamilton'))	formula_1
SELECT MIN(lapTimes.time) AS lapRecord FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Austrian Grand Prix Circuit'	formula_1
SELECT c.name, l.time  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  JOIN lapTimes l ON r.raceId = l.raceId  WHERE c.country = 'Italy'  GROUP BY c.name  ORDER BY l.time ASC;	formula_1
SELECT r.name, l.time  FROM races r  JOIN lapTimes l ON r.raceId = l.raceId  WHERE r.name = 'Austrian Grand Prix'  ORDER BY l.milliseconds ASC  LIMIT 1;	formula_1
SELECT pitStops.duration  FROM pitStops JOIN results ON pitStops.raceId = results.raceId AND pitStops.driverId = results.driverId JOIN races ON results.raceId = races.raceId JOIN lapTimes ON results.raceId = lapTimes.raceId AND results.driverId = lapTimes.driverId WHERE races.name = 'Austrian Grand Prix' AND lapTimes.time = (     SELECT MIN(lapTimes.time)     FROM lapTimes     JOIN races ON lapTimes.raceId = races.raceId     WHERE races.name = 'Austrian Grand Prix' )	formula_1
SELECT lat, lng FROM circuits WHERE circuitId IN (SELECT circuitId FROM races WHERE raceId IN (SELECT raceId FROM lapTimes WHERE time = '1:29.488'))	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId IN (SELECT raceId FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy'))	formula_1
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) LIMIT 1	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE overall_rating >= 60 AND overall_rating < 65 AND defensive_work_rate = 'low';	european_football_2
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5	european_football_2
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016'  GROUP BY L.name  ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC  LIMIT 1;	european_football_2
SELECT home_team_api_id, COUNT(*) AS lost_matches  FROM Match  WHERE season = '2015/2016' AND (home_team_goal - away_team_goal) < 0  GROUP BY home_team_api_id  ORDER BY lost_matches ASC  LIMIT 1;	european_football_2
SELECT P.player_name  FROM Player P  JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id  GROUP BY P.player_name  ORDER BY MAX(PA.penalties) DESC  LIMIT 10;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id JOIN League AS T3 ON T2.league_id = T3.id WHERE T3.name = 'Scotland Premier League' AND T2.season = '2009/2010' AND T2.away_team_goal > T2.home_team_goal GROUP BY T2.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT team_long_name, buildUpPlaySpeed  FROM Team  JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id  WHERE buildUpPlaySpeed IN (SELECT MAX(buildUpPlaySpeed) FROM Team_Attributes GROUP BY team_api_id ORDER BY buildUpPlaySpeed DESC LIMIT 4)  ORDER BY buildUpPlaySpeed DESC;	european_football_2
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016' AND M.home_team_goal = M.away_team_goal  GROUP BY L.name  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT (strftime('%Y', 'now') - strftime('%Y', P.birthday)) - (strftime('%m-%d', 'now') < strftime('%m-%d', P.birthday)) AS age FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.sprint_speed >= 97 AND strftime('%Y', PA.date) BETWEEN '2013' AND '2015'	european_football_2
SELECT L.name, COUNT(M.id) AS match_count  FROM League L  JOIN Match M ON L.id = M.league_id  GROUP BY L.id  ORDER BY match_count DESC  LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'	european_football_2
SELECT player_api_id  FROM Player_Attributes  WHERE overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE substr(date,1,4) = '2010')  AND substr(date,1,4) = '2010'  GROUP BY player_api_id  HAVING overall_rating = MAX(overall_rating)	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012') AND strftime('%Y', T2.date) = '2012'	european_football_2
SELECT CAST(SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(player_fifa_api_id)  FROM Player  WHERE strftime('%Y', birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT L.name, SUM(M.home_team_goal + M.away_team_goal) AS total_goals FROM Match M JOIN League L ON M.league_id = L.id GROUP BY L.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT CAST(SUM(T2.long_shots) AS REAL) / COUNT(T2.player_fifa_api_id)  FROM Player AS T1  JOIN Player_Attributes AS T2  ON T1.player_fifa_api_id = T2.player_fifa_api_id  WHERE T1.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT P.player_name, AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T1.team_long_name  FROM Team AS T1  JOIN Team_Attributes AS T2  ON T1.team_api_id = T2.team_api_id  WHERE T2.buildUpPlayDribblingClass = 'Normal'  AND T2.date >= '2014-01-01 00:00:00'  AND T2.date <= '2014-01-31 00:00:00'  AND T2.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00')  ORDER BY T2.chanceCreationPassing DESC;	european_football_2
SELECT L.name  FROM League L  JOIN Match M ON L.id = M.league_id  WHERE M.season = '2009/2010'  GROUP BY L.name  HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE substr(birthday, 1, 7) = '1970-10'	european_football_2
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Franco Zennaro'	european_football_2
SELECT buildUpPlayPositioningClass  FROM Team_Attributes  JOIN Team ON Team.team_api_id = Team_Attributes.team_api_id  WHERE Team.team_long_name = 'ADO Den Haag'  LIMIT 1;	european_football_2
SELECT heading_accuracy FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Francois Affolter') AND date = '2014-09-18 00:00:00'	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Gabriel Tamas') AND strftime('%Y', date) = '2011'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League')	european_football_2
SELECT p.preferred_foot  FROM Player p  ORDER BY p.birthday DESC  LIMIT 1;	european_football_2
SELECT p.player_name, pa.potential  FROM Player p  JOIN Player_Attributes pa  ON p.player_api_id = pa.player_api_id  WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson'	european_football_2
SELECT P.birthday  FROM Player P  JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id  WHERE PA.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT L.name FROM League L JOIN Country C ON L.country_id = C.id WHERE C.name = 'Netherlands'	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN Country ON Match.country_id = Country.id  WHERE Country.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_name, AVG(pa.finishing) AS avg_finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height IN (SELECT MAX(height) FROM Player UNION SELECT MIN(height) FROM Player) GROUP BY p.player_api_id ORDER BY avg_finishing DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT DISTINCT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran') LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE preferred_foot = 'left'	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_short_name = 'CLB')	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70	european_football_2
SELECT SUM(t2.overall_rating) / COUNT(t2.id) AS average_overall_rating FROM Player AS t1 JOIN Player_Attributes AS t2 ON t1.player_api_id = t2.player_api_id WHERE t1.height > 170 AND strftime('%Y', t2.date) BETWEEN '2010' AND '2015'	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)	european_football_2
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Doran')	european_football_2
SELECT COUNT(*)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61)  AND pa.potential = 61;	european_football_2
SELECT (SUM(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE 0 END) / COUNT(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.id ELSE NULL END)) - (SUM(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE 0 END) / COUNT(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.id ELSE NULL END)) AS difference FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id;	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League'	european_football_2
SELECT L.name FROM League L JOIN Country C ON L.country_id = C.id WHERE C.name = 'Germany'	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT COUNT(DISTINCT p.player_api_id)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high';	european_football_2
SELECT p.player_name, pa.crossing  FROM Player p  JOIN Player_Attributes pa  ON p.player_api_id = pa.player_api_id  WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone')  ORDER BY pa.crossing DESC  LIMIT 1;	european_football_2
SELECT pa.heading_accuracy  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Ariel Borysiuk'  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.height > 180 AND pa.volleys > 70;	european_football_2
SELECT P.player_name  FROM Player P  JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id  WHERE PA.volleys > 70 AND PA.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id = (SELECT id FROM Country WHERE name = 'Belgium')	european_football_2
SELECT p.player_name, pa.long_passing  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.birthday = (SELECT MIN(birthday) FROM Player)  ORDER BY pa.date DESC  LIMIT 1;	european_football_2
SELECT COUNT(*)  FROM `Match`  JOIN `League` ON `Match`.league_id = `League`.id  WHERE `League`.name = 'Belgium Jupiler League'  AND SUBSTR(`Match`.date, 1, 7) = '2009-04';	european_football_2
SELECT L.name  FROM League L  JOIN Match M ON L.id = M.league_id  WHERE M.season = '2008/2009'  GROUP BY L.name  ORDER BY COUNT(*) DESC  LIMIT 1;	european_football_2
SELECT AVG(overall_rating)  FROM Player_Attributes  WHERE player_api_id IN (     SELECT player_api_id      FROM Player      WHERE strftime('%Y', birthday) < '1986' )	european_football_2
SELECT (CAST((SELECT overall_rating FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Ariel Borysiuk' LIMIT 1) - (SELECT overall_rating FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Paulin Puel' LIMIT 1) AS REAL) / (SELECT overall_rating FROM Player_Attributes PA JOIN Player P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Paulin Puel' LIMIT 1)) * 100 AS percentage_difference	european_football_2
SELECT AVG(buildUpPlaySpeed) FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Heart of Midlothian')	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(T2.chanceCreationPassing) AS highest_chance_creation_passing, T2.chanceCreationPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax'	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Abdou Diallo') LIMIT 1	european_football_2
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal)  FROM Match  JOIN Team ON Match.away_team_api_id = Team.team_api_id  JOIN Country ON Match.country_id = Country.id  WHERE Team.team_long_name = 'Parma' AND Country.name = 'Italy';	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%'  ORDER BY p.birthday ASC  LIMIT 1;	european_football_2
SELECT pa.overall_rating  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Aaron Mooy' AND pa.date LIKE '2016-02-04%'	european_football_2
SELECT pa.potential  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francesco Parravicini' AND pa.date = '2010-08-30 00:00:00'	european_football_2
SELECT pa.attacking_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francesco Migliore' AND pa.date LIKE '2015-05-01%'	european_football_2
SELECT pa.defensive_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Kevin Berigaud' AND pa.date = '2013-02-22 00:00:00'	european_football_2
SELECT pa.date  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Kevin Constant'  ORDER BY pa.crossing DESC  LIMIT 1;	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Willem II') AND date = '2012-02-22'	european_football_2
SELECT buildUpPlayDribblingClass FROM Team_Attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'	european_football_2
SELECT buildUpPlayPassingClass FROM Team_Attributes WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%'	european_football_2
SELECT chanceCreationPassingClass FROM Team_Attributes WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'	european_football_2
SELECT T2.chanceCreationCrossingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'	european_football_2
SELECT T2.defenceAggressionClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(pa.overall_rating)  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Marko Arnautovic'  AND SUBSTR(pa.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT ((LDonovan.overall_rating - JBowery.overall_rating) * 100.0 / LDonovan.overall_rating) AS percentage_difference FROM (     SELECT pa.overall_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Landon Donovan' AND pa.date = '2013-07-12 00:00:00' ) LDonovan, (     SELECT pa.overall_rating     FROM Player p     JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id     WHERE p.player_name = 'Jordan Bowery' AND pa.date = '2013-07-12 00:00:00' ) JBowery;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) > 34	european_football_2
SELECT SUM(T1.home_team_goal)  FROM Match AS T1  JOIN Player AS T2  ON T1.home_player_1 = T2.player_api_id  OR T1.home_player_2 = T2.player_api_id  OR T1.home_player_3 = T2.player_api_id  OR T1.home_player_4 = T2.player_api_id  OR T1.home_player_5 = T2.player_api_id  OR T1.home_player_6 = T2.player_api_id  OR T1.home_player_7 = T2.player_api_id  OR T1.home_player_8 = T2.player_api_id  OR T1.home_player_9 = T2.player_api_id  OR T1.home_player_10 = T2.player_api_id  OR T1.home_player_11 = T2.player_api_id  WHERE T2.player_name = 'Aaron Lennon'	european_football_2
SELECT SUM(T1.away_team_goal)  FROM Match AS T1  JOIN Player AS T2 ON T1.away_player_1 = T2.player_api_id  OR T1.away_player_2 = T2.player_api_id  OR T1.away_player_3 = T2.player_api_id  OR T1.away_player_4 = T2.player_api_id  OR T1.away_player_5 = T2.player_api_id  OR T1.away_player_6 = T2.player_api_id  OR T1.away_player_7 = T2.player_api_id  OR T1.away_player_8 = T2.player_api_id  OR T1.away_player_9 = T2.player_api_id  OR T1.away_player_10 = T2.player_api_id  OR T1.away_player_11 = T2.player_api_id  WHERE T2.player_name = 'Daan Smith'  OR T2.player_name = 'Filipe Ferreira'	european_football_2
SELECT SUM(T1.home_team_goal)  FROM Match AS T1  JOIN Player AS T2  ON T1.home_player_1 = T2.player_api_id  OR T1.home_player_2 = T2.player_api_id  OR T1.home_player_3 = T2.player_api_id  OR T1.home_player_4 = T2.player_api_id  OR T1.home_player_5 = T2.player_api_id  OR T1.home_player_6 = T2.player_api_id  OR T1.home_player_7 = T2.player_api_id  OR T1.home_player_8 = T2.player_api_id  OR T1.home_player_9 = T2.player_api_id  OR T1.home_player_10 = T2.player_api_id  OR T1.home_player_11 = T2.player_api_id  WHERE julianday('now') - julianday(T2.birthday) <= 365 * 30	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT P.player_name  FROM Player P  JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id  WHERE PA.attacking_work_rate = 'high'  GROUP BY P.player_name;	european_football_2
SELECT P.player_name  FROM Player P  JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id  WHERE PA.finishing = 1  ORDER BY datetime('now') - datetime(P.birthday) DESC  LIMIT 1;	european_football_2
SELECT P.player_name FROM Player P JOIN Country C ON P.birthday LIKE '%' || C.name || '%' WHERE C.name = 'Belgium'	european_football_2
SELECT P.player_name, C.name  FROM Player P  JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id  JOIN Team T ON P.player_api_id = T.team_api_id  JOIN League L ON T.team_api_id = L.id  JOIN Country C ON L.country_id = C.id  WHERE PA.vision > 89;	european_football_2
SELECT C.name  FROM Player P  JOIN Country C ON P.country_id = C.id  GROUP BY C.name  ORDER BY AVG(P.weight) DESC  LIMIT 1;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(P.height)  FROM Player P  JOIN Team T ON P.player_api_id = T.team_api_id  JOIN League L ON T.team_api_id = L.id  JOIN Country C ON L.country_id = C.id  WHERE C.name = 'Italy'	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01'	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE player_api_id = 6) - (SELECT jumping FROM Player_Attributes WHERE player_api_id = 23) AS difference	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5	european_football_2
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left'  AND crossing = (SELECT MAX(crossing) FROM Player_Attributes);	european_football_2
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Player_Attributes) FROM Player_Attributes WHERE stamina > 80 AND strength > 80	european_football_2
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Poland Ekstraklasa'	european_football_2
SELECT M.home_team_goal, M.away_team_goal  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE L.name = 'Belgium Jupiler League' AND M.date LIKE '2008-09-24%'	european_football_2
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin'	european_football_2
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'KSV Cercle Brugge')	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie')	european_football_2
SELECT finishing, curve FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE weight = (SELECT MAX(weight) FROM Player)) LIMIT 1	european_football_2
SELECT L.name, COUNT(M.id) AS game_count FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY game_count DESC LIMIT 4;	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT CAST(COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN 1 END) AS REAL) / COUNT(id) * 100  FROM Player  JOIN Player_Attributes  ON Player.player_api_id = Player_Attributes.player_api_id;	european_football_2
SELECT    (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') AS in_patient_count,   (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-') AS out_patient_count,   (SELECT CAST((SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '+') AS REAL) / (SELECT COUNT(ID) FROM Patient WHERE SEX = 'M' AND Admission = '-') * 100) AS percentage_deviation	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN strftime('%Y', Birthday) > '1930' THEN ID ELSE NULL END) AS REAL) / COUNT(CASE WHEN SEX = 'F' THEN ID ELSE NULL END) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)  FROM Patient  WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT p.Diagnosis, l.Date  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.ID = 30609;	thrombosis_prediction
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.ID = 163109;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH > 500;	thrombosis_prediction
SELECT p.ID, (YEAR(CURDATE()) - YEAR(p.Birthday)) AS age  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.RVVT = '+';	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.Thrombosis = 2;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.`T-CHO` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.Birthday) = 1937 AND L.`T-CHO` >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.ALB < 3.5;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN L.TP < 6.0 OR L.TP > 8.5 THEN P.ID END) AS REAL) * 100 / COUNT(P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'F'	thrombosis_prediction
SELECT AVG(`aCL IgG`)  FROM `Examination`  JOIN `Patient` ON `Examination`.`ID` = `Patient`.`ID`  WHERE `Patient`.`Admission` = '+' AND (YEAR(CURDATE()) - YEAR(`Patient`.`Birthday`)) >= 50;	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-'	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS `Youngest Patient Age` FROM `Patient` WHERE `First Date` IS NOT NULL AND `Birthday` IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.Thrombosis = 1 AND P.SEX = 'F' AND YEAR(E.`Examination Date`) = 1997;	thrombosis_prediction
SELECT MAX(YEAR(Birthday)) - MIN(YEAR(Birthday)) AS AgeGap FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE TG >= 200 )	thrombosis_prediction
SELECT E.Symptoms, P.Diagnosis  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.Symptoms IS NOT NULL  ORDER BY P.Birthday DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID) / 12.0 AS AvgMalePatientsPerMonth FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT L.Date, (YEAR(P.`First Date`) - YEAR(P.Birthday)) AS Age FROM `Patient` P JOIN `Laboratory` L ON P.ID = L.ID WHERE P.Diagnosis LIKE '%SJS%' ORDER BY P.Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN L.UA <= 8.0 AND P.SEX = 'M' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN L.UA <= 6.5 AND P.SEX = 'F' THEN 1 ELSE 0 END) AS Ratio FROM Laboratory L JOIN Patient P ON L.ID = P.ID;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  LEFT JOIN Examination e ON p.ID = e.ID  WHERE e.`Examination Date` IS NULL OR DATEDIFF(e.`Examination Date`, p.`First Date`) >= 365;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Birthday > DATE_SUB(e.`Examination Date`, INTERVAL 18 YEAR)  AND YEAR(e.`Examination Date`) BETWEEN 1990 AND 1993;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.`T-BIL` >= 2.0;	thrombosis_prediction
SELECT Diagnosis, COUNT(Diagnosis) AS DiagnosisCount  FROM Examination  WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY Diagnosis  ORDER BY DiagnosisCount DESC  LIMIT 1;	thrombosis_prediction
SELECT AVG(1999 - YEAR(P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-30'	thrombosis_prediction
SELECT (YEAR(e.`Examination Date`) - YEAR(p.`Birthday`)) AS Age, p.`Diagnosis` FROM `Examination` e JOIN `Patient` p ON e.`ID` = p.`ID` JOIN `Laboratory` l ON l.`ID` = p.`ID` WHERE l.`HGB` = (SELECT MAX(`HGB`) FROM `Laboratory`) LIMIT 1;	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT CASE WHEN T-CHO < 250 THEN 'Normal' ELSE 'Abnormal' END AS Cholesterol_Status FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04'	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis LIKE '%AORTITIS%' LIMIT 1	thrombosis_prediction
SELECT E.`aCL IgM`  FROM `Examination` E  JOIN `Patient` P ON E.ID = P.ID  WHERE P.Diagnosis = 'SLE' AND P.Description = '1994-02-19' AND E.`Examination Date` = '1993-11-12'	thrombosis_prediction
SELECT P.SEX  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.Date = '1992-06-12' AND L.GPT = 9;	thrombosis_prediction
SELECT (YEAR(L.Date) - YEAR(P.Birthday)) AS Age FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.Date = '1991-10-21' AND L.UA = 8.4;	thrombosis_prediction
SELECT COUNT(L.ID)  FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.First_Date = '1991-06-13' AND P.Diagnosis = 'SJS' AND YEAR(L.Date) = 1995;	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`Examination Date` = '1997-01-27' AND e.Diagnosis = 'SLE'  ORDER BY p.`First Date` ASC  LIMIT 1;	thrombosis_prediction
SELECT E.Symptoms  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE P.Birthday = '1959-03-01' AND E.`Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT (SUM(CASE WHEN L.Date LIKE '1981-11-%' THEN L.`T-CHO` END) - SUM(CASE WHEN L.Date LIKE '1981-12-%' THEN L.`T-CHO` END)) AS DecreaseRate FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Birthday = '1959-02-18'	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Diagnosis LIKE '%Behcet%'  AND e.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND l.GPT > 30 AND l.ALB < 4;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  WHERE E.Thrombosis = 2  AND E.ANA = 256  AND E.ANA Pattern = 'S'  AND E.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Laboratory  WHERE U_PRO > 0 AND U_PRO < 30;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Patient  WHERE SEX = 'M' AND YEAR(`First Date`) = 1981;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, P.Description, P.First_Date, P.Admission, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-'  AND L.Date LIKE '1991-10%'  AND L.`T-BIL` < 2.0;	thrombosis_prediction
SELECT COUNT(*)  FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'F'  AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31' AND (e.`ANA Pattern` IS NULL OR e.`ANA Pattern`!= 'P')	thrombosis_prediction
SELECT p.SEX  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.Diagnosis LIKE '%PSS%'  AND l.CRP = '2.7'  AND l.CRE = 1  AND l.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'F' AND Diagnosis = 'SLE') AND PLT > 400	thrombosis_prediction
SELECT Symptoms, COUNT(*) AS Count FROM Examination WHERE Diagnosis LIKE '%SLE%' GROUP BY Symptoms ORDER BY Count DESC LIMIT 1	thrombosis_prediction
SELECT `Description`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE YEAR(Date) = 1997 AND (TP <= 6 OR TP >= 8.5)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Examination WHERE Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) / COUNT(SEX) * 100  FROM Patient  WHERE Diagnosis = 'RA' AND YEAR(Birthday) = 1980;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'M'  AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'  AND p.Diagnosis LIKE '%Behcet%'  AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'F' AND l.WBC < 3.5;	thrombosis_prediction
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM `Examination` E JOIN `Patient` P ON E.ID = P.ID WHERE P.ID = 821298 AND `Examination Date` IS NOT NULL AND `First Date` IS NOT NULL ORDER BY `Examination Date` ASC LIMIT 1	thrombosis_prediction
SELECT CASE WHEN (P.SEX = 'M' AND L.UA > 8.0) OR (P.SEX = 'F' AND L.UA > 6.5) THEN 'Yes' ELSE 'No' END AS UA_Normal FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.ID = 57266;	thrombosis_prediction
SELECT `Date` FROM `Laboratory` WHERE `ID` = 48473 AND `GOT` >= 60	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT < 60 AND YEAR(L.Date) = 1994;	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.GPT >= 60;	thrombosis_prediction
SELECT P.ID, P.Birthday, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GPT > 60  ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT p.ID, (YEAR(CURDATE()) - YEAR(p.Birthday)) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT P.ID, P.Admission  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALP < 300;	thrombosis_prediction
SELECT p.ID, CASE WHEN l.ALP < 300 THEN 'Yes' ELSE 'No' END AS ALP_Normal FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01'	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TP < 6.0;	thrombosis_prediction
SELECT P.ID, L.TP - 8.5 AS TP_Deviation FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.TP > 8.5;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5)  ORDER BY P.Birthday DESC;	thrombosis_prediction
SELECT p.ID, p.Birthday, l.ALB, CASE WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Normal' ELSE 'Abnormal' END AS Albumin_Range FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN L.UA > 6.5 AND P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'F'	thrombosis_prediction
SELECT AVG(UA)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE UA < CASE WHEN P.SEX = 'M' THEN 8.0 ELSE 6.5 END  AND L.Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = L.ID)	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.UN = 29;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'RA' AND l.UN < 30;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.CRE >= 1.5;	thrombosis_prediction
SELECT (SUM(CASE WHEN P.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END)) AS Result  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.CRE >= 1.5;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT ID) AS Patient_List FROM Patient WHERE ID IN (     SELECT ID     FROM Laboratory     WHERE `T-BIL` >= 2.0 ) GROUP BY SEX;	thrombosis_prediction
SELECT p.ID, l.`T-CHO`  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient)  ORDER BY l.`T-CHO` DESC  LIMIT 1;	thrombosis_prediction
SELECT AVG(YEAR(CURDATE()) - YEAR(Birthday))  FROM Patient  WHERE SEX = 'M' AND ID IN (     SELECT ID      FROM Laboratory      WHERE `T-CHO` >= 250 )	thrombosis_prediction
SELECT P.ID, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG >= 200 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 50;	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '-' AND T1.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND YEAR(p.Birthday) BETWEEN 1936 AND 1956 AND l.CPK >= 250;	thrombosis_prediction
SELECT p.ID, p.SEX, (YEAR(CURDATE()) - YEAR(p.Birthday)) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU >= 180 AND l.`T-CHO` < 250;	thrombosis_prediction
SELECT p.ID, l.GLU FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Description >= '1991-01-01' AND p.Description <= '1991-12-31' AND l.GLU < 180;	thrombosis_prediction
SELECT p.ID, p.SEX, p.Birthday  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.WBC <= 3.5 OR l.WBC >= 9.0  GROUP BY p.SEX  ORDER BY (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) ASC;	thrombosis_prediction
SELECT p.ID, (YEAR(CURDATE()) - YEAR(p.Birthday)) AS Age, p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RBC < 3.5;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, P.Admission  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'F'  AND (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) >= 50  AND (L.RBC <= 3.5 OR L.RBC >= 6.0)	thrombosis_prediction
SELECT DISTINCT p.ID, p.SEX  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.HGB < 10;	thrombosis_prediction
SELECT p.ID, p.SEX  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SLE' AND l.HGB > 10 AND l.HGB < 17  ORDER BY p.Birthday ASC  LIMIT 1;	thrombosis_prediction
SELECT p.ID, (YEAR(CURDATE()) - YEAR(p.Birthday)) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.HCT >= 52 GROUP BY p.ID HAVING COUNT(p.ID) > 2;	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
SELECT (SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END)) AS Calculation, SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) AS LowerThanNormal, SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS HigherThanNormal FROM Laboratory WHERE PLT < 100 OR PLT > 400	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.PLT  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE YEAR(L.Date) = 1984  AND (YEAR(CURDATE()) - YEAR(P.Birthday)) < 50  AND L.PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN L.PT >= 14 AND P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN L.PT >= 14 THEN 1 ELSE 0 END) AS Percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE (YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday)) > 55;	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, P.First_Date, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.First_Date > '1992-12-31' AND L.PT < 14;	thrombosis_prediction
SELECT COUNT(*)  FROM Examination  WHERE `Examination Date` > '1997-01-01' AND `APTT` < 45;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.Thrombosis = 0 AND L.APTT > 45;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.WBC > 3.5 AND l.WBC < 9.0 AND (l.FG <= 150 OR l.FG >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Birthday > '1980-01-01' AND (L.FG < 150 OR L.FG > 450)	thrombosis_prediction
SELECT DISTINCT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`U-PRO` >= 30;	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SLE' AND l.`U-PRO` BETWEEN 0 AND 30;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.IGG > 900 AND L.IGG < 2000 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`aCL IgA` = (SELECT MAX(`aCL IgA`) FROM Examination WHERE `aCL IgA` BETWEEN 80 AND 500)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.IGA > 80 AND l.IGA < 500 AND p.`First Date` >= '1990-01-01';	thrombosis_prediction
SELECT Diagnosis  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE (L.IGM <= 40 OR L.IGM >= 400)  GROUP BY Diagnosis  ORDER BY COUNT(Diagnosis) DESC  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRP = '+' AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) < 70;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.KCT = '+' AND P.RF IN ('-', '+-');	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Birthday > '1985-01-01' AND L.RA IN ('-', '+-')	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RF < 20 AND (YEAR(CURDATE()) - YEAR(p.Birthday)) > 60;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.RF < 20 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.`ANA Pattern` = 'P' AND L.C3 > 35;	thrombosis_prediction
SELECT `ID` FROM `Examination` WHERE `HCT` < 29 OR `HCT` > 52 ORDER BY `aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.Thrombosis = 1 AND L.C4 > 10;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.Admission = '+' AND (e.RNP = '-' OR e.RNP = '+-');	thrombosis_prediction
SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE RNP NOT IN ('-', '+-'))	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.SM IN ('-', '+-') AND E.Thrombosis = 0;	thrombosis_prediction
SELECT P.ID  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE E.SM NOT IN ('negative', '0')  ORDER BY P.Birthday DESC  LIMIT 3;	thrombosis_prediction
SELECT DISTINCT E.ID  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.`Examination Date` > '1997-01-01' AND L.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'F' AND e.Symptoms IS NULL AND l.SC170 IN ('negative', '0');	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSA IN ('-', '+-') AND YEAR(p.`First Date`) < 2000;	thrombosis_prediction
SELECT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSA NOT IN ('negative', '0')  ORDER BY p.`First Date`  LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE E.SSB IN ('-', '+-') AND P.Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CENTROMEA IN ('-', '+-')  AND l.SSB IN ('-', '+-')  AND p.SEX = 'M';	thrombosis_prediction
SELECT DISTINCT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.DNA >= 8;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  LEFT JOIN Laboratory l ON p.ID = l.ID  WHERE l.DNA < 8 AND p.Description IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE L.IGG > 900 AND L.IGG < 2000 AND P.Admission = '+';	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T1.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN T1.ID ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN T1.GOT >= 60 THEN T1.ID ELSE NULL END) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE GOT < 60 AND ID IN (SELECT ID FROM Patient WHERE SEX = 'M')	thrombosis_prediction
SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60)	thrombosis_prediction
SELECT P.ID, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GPT < 60  GROUP BY P.ID, P.Birthday  ORDER BY MAX(L.GPT) DESC  LIMIT 3;	thrombosis_prediction
SELECT COUNT(*)  FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;	thrombosis_prediction
SELECT MIN(P.First_Date)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH < 500  GROUP BY P.ID  ORDER BY MAX(L.LDH) DESC  LIMIT 1;	thrombosis_prediction
SELECT MAX(L.Date)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.First_Date = (SELECT MAX(First_Date) FROM Patient)  AND L.LDH >= 500;	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE L.ALP >= 300 AND P.Admission = '+';	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE ALP < 300 AND ID IN (SELECT ID FROM Patient WHERE Admission = '-')	thrombosis_prediction
SELECT DISTINCT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TP < 6.0;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5;	thrombosis_prediction
SELECT `Examination Date` FROM `Examination` WHERE `ID` = (SELECT `ID` FROM `Laboratory` WHERE `ALB` = (SELECT MAX(`ALB`) FROM `Laboratory` WHERE `ALB` > 3.5 AND `ALB` < 5.5))	thrombosis_prediction
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'M' AND L.ALB > 3.5 AND L.ALB < 5.5 AND L.TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA`  FROM `Examination` E  JOIN `Patient` P ON E.ID = P.ID  JOIN `Laboratory` L ON L.ID = P.ID  WHERE P.SEX = 'F' AND L.UA > 6.50  ORDER BY L.UA DESC  LIMIT 1;	thrombosis_prediction
SELECT MAX(e.ANA)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.CRE < 1.5;	thrombosis_prediction
SELECT E.ID  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.CRE < 1.5  GROUP BY E.ID  HAVING MAX(E.`aCL IgA`) = (SELECT MAX(`aCL IgA`) FROM Examination)	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-BIL` >= 2.0 AND E.`ANA Pattern` LIKE '%P%';	thrombosis_prediction
SELECT `ANA` FROM `Examination` WHERE `ID` = (SELECT `ID` FROM `Laboratory` WHERE `T-BIL` = (SELECT MAX(`T-BIL`) FROM `Laboratory` WHERE `T-BIL` < 2.0))	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-CHO` >= 250 AND E.KCT = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.`T-CHO` < 250 AND E.`ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.TG < 200 AND E.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG < 200  ORDER BY l.TG DESC  LIMIT 1;	thrombosis_prediction
SELECT DISTINCT E.ID  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.Thrombosis = 0 AND L.CPK < 250;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+')	thrombosis_prediction
SELECT MIN(P.Birthday)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GLU > 180;	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.GLU < 180 AND e.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE WBC BETWEEN 3.5 AND 9.0 AND ID IN (SELECT ID FROM Patient WHERE Admission = '+')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT DISTINCT p.ID  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE (l.RBC <= 3.5 OR l.RBC >= 6.0) AND p.Admission = '-';	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.PLT > 100 AND L.PLT < 400 AND E.Diagnosis IS NOT NULL;	thrombosis_prediction
SELECT L.ID, L.PLT  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.Diagnosis = 'MCTD' AND L.PLT > 100 AND L.PLT < 400;	thrombosis_prediction
SELECT AVG(PT) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND PT < 14;	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE E.Thrombosis IN (1, 2) AND L.PT < 14;	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*)  FROM `member` m  JOIN `major` maj ON m.link_to_major = maj.major_id  WHERE maj.college = 'College of Engineering'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design Department'	student_club
SELECT COUNT(*) FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'	student_club
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(*)  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium'	student_club
SELECT e.event_name, COUNT(a.link_to_event) AS attendance_count  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  GROUP BY e.event_id  ORDER BY attendance_count DESC  LIMIT 1;	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean'	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND strftime('%Y', e.event_date) = '2019'	student_club
SELECT COUNT(*)  FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(e.event_id) > 10;	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  GROUP BY e.event_id  HAVING COUNT(e.event_id) > 20  AND e.type!= 'Fundraiser'	student_club
SELECT CAST(COUNT(link_to_event) AS REAL) / COUNT(DISTINCT event_name) AS average_attendance FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'	student_club
SELECT expense_description, MAX(cost) FROM expense GROUP BY expense_description ORDER BY MAX(cost) DESC LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Environmental Engineering')	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Laugh Out Loud'	student_club
SELECT last_name FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Law and Constitutional Studies')	student_club
SELECT T1.county FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Sherri' AND T2.last_name = 'Ramsey'	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'	student_club
SELECT SUM(amount) FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food' AND link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Meeting')	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Illinois'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Advertisement' AND link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Meeting')	student_club
SELECT T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Pierce' OR T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'	student_club
SELECT SUM(amount) FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Speaker')	student_club
SELECT e.expense_description, e.approved  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08'	student_club
SELECT AVG(e.cost) AS average_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen' AND (SUBSTR(e.expense_date, 6, 2) = '09' OR SUBSTR(e.expense_date, 6, 2) = '10')	student_club
SELECT SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) - SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END) AS spent_difference FROM event e JOIN budget b ON e.event_id = b.link_to_event;	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'	student_club
SELECT MAX(remaining) FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'	student_club
SELECT T1.county FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Adela' AND T2.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Meeting' AND T1.remaining < 0	student_club
SELECT SUM(amount) FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'September Speaker')	student_club
SELECT T1.event_status FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(*) FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE ma.major_name LIKE '%Business%' AND m.t_shirt_size = 'Medium'	student_club
SELECT T1.type FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielson'	student_club
SELECT m.major_name FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.position = 'Vice President'	student_club
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'	student_club
SELECT date_received FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Connor' AND last_name = 'Hilton') AND source = 'Dues'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.source = 'Dues' ORDER BY i.date_received ASC LIMIT 1	student_club
SELECT SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount END) / SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount END)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE b.category = 'Advertisement'	student_club
SELECT (SUM(CASE WHEN category = 'Parking' THEN cost ELSE 0 END) / SUM(CASE WHEN T2.event_name = 'November Speaker' THEN T1.cost ELSE 0 END)) * 100 AS percentage  FROM expense AS T1  JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id  JOIN event AS T3 ON T2.link_to_event = T3.event_id  WHERE T3.event_name = 'November Speaker'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth'	student_club
SELECT expense_description FROM expense WHERE link_to_budget IN (SELECT budget_id FROM budget WHERE remaining = (SELECT MIN(remaining) FROM budget))	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting'	student_club
SELECT major.college, COUNT(*) AS member_count  FROM member  JOIN major ON member.link_to_major = major.major_id  GROUP BY major.college  ORDER BY member_count DESC  LIMIT 1;	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  GROUP BY e.event_name  ORDER BY MAX(b.amount) DESC  LIMIT 1;	student_club
SELECT e.expense_description, e.expense_date, e.cost  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.position = 'Vice President'	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer')	student_club
SELECT date_received FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Casey' AND last_name = 'Mason')	student_club
SELECT COUNT(*) FROM `member` AS T1 JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Maryland'	student_club
SELECT COUNT(*) FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE phone = '954-555-6240')	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT e.event_name, MAX(b.spent / b.amount) AS spend_to_budget_ratio FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' GROUP BY e.event_name ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'President'	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Georgetown' AND z.state = 'South Carolina'	student_club
SELECT SUM(amount) FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour')	student_club
SELECT m.first_name, m.last_name FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount > 40 GROUP BY m.first_name, m.last_name	student_club
SELECT SUM(e.cost) AS total_expense FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN budget b ON m.member_id = b.link_to_member  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name, i.source, MAX(i.amount)  FROM member m  JOIN income i ON m.member_id = i.link_to_member  GROUP BY m.member_id  ORDER BY MAX(i.amount) DESC  LIMIT 1;	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  GROUP BY e.event_name  ORDER BY SUM(b.spent) ASC  LIMIT 1;	student_club
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) / SUM(ex.cost)) * 100 AS percentage FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget;	student_club
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM major INNER JOIN member ON major.major_id = member.link_to_major	student_club
SELECT source, SUM(amount) AS total_amount FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY total_amount DESC LIMIT 1;	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Physics Teaching')	student_club
SELECT COUNT(*)  FROM attendance a JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Community Theater' AND strftime('%Y', e.event_date) = '2019'	student_club
SELECT COUNT(a.link_to_event) AS events_attended, m.major_name  FROM attendance a  JOIN member m ON a.link_to_member = m.member_id  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi'  GROUP BY m.major_name;	student_club
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Advertisement' ORDER BY b.spent DESC LIMIT 1	student_club
SELECT COUNT(*)  FROM `member` m  JOIN `attendance` a ON m.member_id = a.link_to_member  JOIN `event` e ON a.link_to_event = e.event_id  WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer'	student_club
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0 / COUNT(event_id)) AS percentage FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT e.cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE e.expense_description = 'Posters' AND ev.event_name = 'September Speaker'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed' AND b.remaining < 0  ORDER BY b.remaining ASC  LIMIT 1;	student_club
SELECT b.category, SUM(e.cost)  FROM budget b  JOIN expense e ON b.budget_id = e.link_to_budget  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.event_name = 'October Meeting' AND e.approved = 'true'  GROUP BY b.category;	student_club
SELECT category, SUM(amount) AS total_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event_name = 'April Speaker' GROUP BY category ORDER BY total_budgeted ASC	student_club
SELECT * FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT `budget_id`, `category`, `amount`, `spent`, `remaining`, `event_status`, `link_to_event`  FROM `budget`  WHERE `category` = 'Advertisement'  ORDER BY `amount` DESC  LIMIT 3	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT m.first_name, m.last_name, SUM(e.cost)  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE m.member_id ='rec4BLdZHS2Blfp4v'  GROUP BY m.first_name, m.last_name;	student_club
SELECT expense_description FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'	student_club
SELECT DISTINCT e.expense_description  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.t_shirt_size = 'X-Large'	student_club
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50 GROUP BY m.zip	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT T1.position FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(*) FROM `member` m JOIN `major` ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Finance' AND m.t_shirt_size = 'Medium'	student_club
SELECT DISTINCT e.type  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 30;	student_club
SELECT type FROM event WHERE location = 'MU 215'	student_club
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT (SUM(CASE WHEN position = 'Member' AND major_name = 'Business' THEN 1 ELSE 0 END) / COUNT(member_id)) * 100 AS percentage FROM member JOIN major ON member.link_to_major = major.major_id	student_club
SELECT type FROM event WHERE location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'	student_club
SELECT DISTINCT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0;	student_club
SELECT T1.city, T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T3.department = 'Electrical and Computer Engineering Department' AND T2.position = 'Member'	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE e.type = 'Social' AND m.position = 'Vice President' AND m.location = '900 E. Washington St.'	student_club
SELECT m.last_name, m.position FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10'	student_club
SELECT m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE m.position = 'Member' AND e.event_name = 'Women''s Soccer'	student_club
SELECT (COUNT(CASE WHEN i.amount = 50 THEN i.amount END) / COUNT(m.member_id)) * 100 AS percentage FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member'	student_club
SELECT DISTINCT state, short_state  FROM zip_code  WHERE type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND city IN (SELECT city FROM zip_code WHERE county = 'San Juan Municipio' AND state = 'Puerto Rico')	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT DISTINCT a.link_to_event FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN income i ON i.link_to_member = m.member_id WHERE i.amount > 50	student_club
SELECT m.first_name, m.last_name, a.link_to_event  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN attendance a ON m.member_id = a.link_to_member  WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major ='rec1N0upiVLy5esTO'	student_club
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Business'	student_club
SELECT m.email  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'  AND e.cost > 20;	student_club
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `major_name` = 'education' AND `college` = 'College of Education & Human Services') AND `position` = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) / COUNT(link_to_event) * 100 AS over_budget_percentage FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) / COUNT(zip_code) * 100 FROM zip_code	student_club
SELECT e.event_name, e.location  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, maj.major_name  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN major maj ON m.link_to_major = maj.major_id  WHERE e.cost > 100;	student_club
SELECT DISTINCT z.city, z.state, z.country  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  JOIN zip_code z ON m.zip = z.zip_code  JOIN income i ON m.member_id = i.link_to_member  GROUP BY e.event_id  HAVING COUNT(i.income_id) > 40;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT SUM(e.cost) / COUNT(DISTINCT a.link_to_event) AS average_amount_paid FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id JOIN attendance a ON ev.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.position!= 'Member'	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense ex ON b.budget_id = ex.link_to_budget  WHERE b.category = 'Parking'  GROUP BY e.event_name  HAVING SUM(ex.cost) < (SELECT SUM(ex2.cost) / COUNT(DISTINCT e2.event_id)                         FROM event e2                         JOIN budget b2 ON e2.event_id = b2.link_to_event                         JOIN expense ex2 ON b2.budget_id = ex2.link_to_budget                         WHERE b2.category = 'Parking')	student_club
SELECT (SUM(e.cost) / COUNT(DISTINCT a.link_to_event)) * 100 AS percentage_cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id JOIN attendance a ON a.link_to_event = ev.event_id WHERE ev.type = 'Meeting'	student_club
SELECT b.budget_id, b.category, b.amount, b.link_to_event  FROM budget b  JOIN expense e ON b.budget_id = e.link_to_budget  WHERE e.expense_description = 'Water, chips, cookies'  ORDER BY e.cost DESC  LIMIT 1;	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5;	student_club
SELECT m.first_name, m.last_name, m.phone  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT (SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) - SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END)) * 100.0 / COUNT(CASE WHEN m.position = 'Member' THEN 1 ELSE NULL END) AS percentage_difference FROM member m JOIN zip_code z ON m.zip = z.zip_code;	student_club
SELECT T1.major_name, T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT m.first_name, m.last_name, e.cost  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education'	student_club
SELECT b.category, b.amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'January Speaker'	student_club
SELECT DISTINCT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.category = 'Food'	student_club
SELECT m.first_name, m.last_name, i.amount  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.date_received = '2019-09-09'	student_club
SELECT b.category FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Posters'	student_club
SELECT m.first_name, m.last_name, maj.college  FROM member m  JOIN major maj ON m.link_to_major = maj.major_id  WHERE m.position = 'Secretary'	student_club
SELECT SUM(spent) AS total_spent, event_name  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE category = 'Speaker Gifts'  GROUP BY event_name;	student_club
SELECT T1.city FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT m.first_name, m.last_name, m.position  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND m.zip = 28092;	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) AS REAL) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) FROM customers	debit_card_specializing
SELECT CustomerID, MIN(Consumption) AS LeastConsumption FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') GROUP BY CustomerID ORDER BY LeastConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT c.CustomerID, SUM(ym.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date BETWEEN '201101' AND '201112' AND c.Currency = 'CZK' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT CustomerID)  FROM yearmonth  WHERE Date BETWEEN '201201' AND '201212'  AND Consumption < 30000  AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM')	debit_card_specializing
SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS ConsumptionDifference FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE y.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT SUBSTR(T.Date, 1, 4) AS Year, SUM(T.Amount * T.Price) AS TotalGasUseEUR FROM transactions_1k T JOIN customers C ON T.CustomerID = C.CustomerID WHERE C.Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUseEUR DESC LIMIT 1;	debit_card_specializing
SELECT Segment FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID GROUP BY Segment ORDER BY SUM(Consumption) ASC LIMIT 1	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUBSTR(Date, 5, 2) AS Month, MAX(Consumption) AS MaxConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE Date BETWEEN '201301' AND '201312' AND Segment = 'SME' GROUP BY Month ORDER BY MaxConsumption DESC LIMIT 1;	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN y.CustomerID END)) AS SME_LAM_Diff,     (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN y.CustomerID END)) AS LAM_KAM_Diff,     (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN y.CustomerID END)) -      (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN y.CustomerID END)) AS KAM_SME_Diff FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      y.Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT      Segment,      (SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END) - SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END)) / SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END) * 100 AS PercentageIncrease FROM      yearmonth  JOIN      customers ON yearmonth.CustomerID = customers.CustomerID WHERE      Segment IN ('SME', 'LAM', 'KAM') GROUP BY      Segment ORDER BY      PercentageIncrease DESC LIMIT 1 UNION ALL SELECT      Segment,      (SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END) - SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END)) / SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END) * 100 AS PercentageIncrease FROM      yearmonth  JOIN      customers ON yearmonth.CustomerID = customers.CustomerID WHERE      Segment IN ('SME', 'LAM', 'KAM') GROUP BY      Segment ORDER BY      PercentageIncrease ASC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money') AS Difference	debit_card_specializing
SELECT (t1.Consumption - t2.Consumption) AS Difference FROM yearmonth t1, yearmonth t2 WHERE t1.CustomerID = 7 AND t1.Date = '201304' AND t2.CustomerID = 5 AND t2.Date = '201304'	debit_card_specializing
SELECT (SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END)) AS More_SMEs FROM customers WHERE Segment = 'SME'	debit_card_specializing
SELECT c.CustomerID, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, MAX(ym.Consumption) AS MaxConsumption FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY MaxConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM') AND Date = '201305'	debit_card_specializing
SELECT (COUNT(CASE WHEN y.Consumption > 46.73 THEN 1 END) * 100.0 / COUNT(*)) AS Percentage FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'LAM'	debit_card_specializing
SELECT Country, COUNT(*) AS NumberOfValueForMoneyStations  FROM gasstations  WHERE Segment = 'Value for money'  GROUP BY Country  ORDER BY NumberOfValueForMoneyStations DESC;	debit_card_specializing
SELECT (CAST(COUNT(CASE WHEN Currency = 'EUR' THEN 1 ELSE NULL END) AS REAL) / COUNT(*)) * 100 AS Percentage FROM customers WHERE Segment = 'KAM'	debit_card_specializing
SELECT CAST(COUNT(CASE WHEN Consumption > 528.3 THEN CustomerID ELSE NULL END) AS REAL) * 100 / COUNT(CustomerID)  FROM yearmonth  WHERE Date LIKE '201202%'	debit_card_specializing
SELECT (CAST(COUNT(CASE WHEN Segment = 'Premium' THEN 1 ELSE NULL END) AS REAL) / COUNT(*)) * 100 AS Percentage FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT c.Segment FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201309' GROUP BY c.Segment ORDER BY SUM(ym.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, y.Consumption  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'SME' AND y.Date = '201206'  ORDER BY y.Consumption ASC  LIMIT 1;	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'	debit_card_specializing
SELECT MAX(TotalConsumption) AS BiggestMonthlyConsumption FROM (     SELECT SUM(Consumption) / 12 AS TotalConsumption     FROM yearmonth     WHERE CustomerID IN (         SELECT CustomerID         FROM customers         WHERE Currency = 'EUR'     )     GROUP BY CustomerID, Date ) AS MonthlyConsumptionTable;	debit_card_specializing
SELECT DISTINCT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  JOIN yearmonth ym ON t.CustomerID = ym.CustomerID  WHERE SUBSTR(ym.Date, 1, 4) = '2013' AND SUBSTR(ym.Date, 5, 2) = '09'	debit_card_specializing
SELECT DISTINCT g.Country  FROM gasstations g  JOIN transactions_1k t  ON g.GasStationID = t.GasStationID  WHERE strftime('%Y%m', t.Date) = '201306'	debit_card_specializing
SELECT DISTINCT gs.ChainID  FROM gasstations gs  JOIN transactions_1k t ON gs.GasStationID = t.GasStationID  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT p.Description  FROM transactions_1k t  JOIN products p ON t.ProductID = p.ProductID  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT y.CustomerID)  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR' AND y.Consumption > 1000;	debit_card_specializing
SELECT p.Description  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  JOIN products p ON t.ProductID = p.ProductID  WHERE g.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T1.Time FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000;	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(t.Price * t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'	debit_card_specializing
SELECT AVG(TotalPrice)  FROM (     SELECT CustomerID, SUM(Price) AS TotalPrice     FROM transactions_1k     WHERE CustomerID IN (         SELECT CustomerID          FROM customers          WHERE Currency = 'EUR'     )     GROUP BY CustomerID ) AS subquery;	debit_card_specializing
SELECT CustomerID, SUM(Amount * Price) AS TotalPaid FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY TotalPaid DESC LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-25' ORDER BY T2.Time ASC LIMIT 1	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN transactions_1k t  ON c.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00'	debit_card_specializing
SELECT c.Segment  FROM customers c  JOIN transactions_1k t  ON c.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k  WHERE Date = '2012-08-26' AND Time < '13:00:00' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT y.Date, y.Consumption  FROM yearmonth y  WHERE y.CustomerID = (     SELECT t.CustomerID      FROM transactions_1k t      WHERE t.Date = '2012-08-24' AND t.Price = 124.05 ) AND y.Date LIKE '201201%'	debit_card_specializing
SELECT COUNT(*)  FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26' AND t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE'	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE ym.Date = '201306' AND ym.Consumption = 214582.17;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = 667467	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency  FROM customers c  JOIN transactions_1k t  ON c.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Price = 548.4;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT CASE WHEN Currency = 'EUR' THEN CustomerID END) AS REAL) * 100 / COUNT(DISTINCT CustomerID)  FROM transactions_1k  WHERE Date = '2012-08-25'  AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')	debit_card_specializing
SELECT (SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END) - SUM(CASE WHEN Date LIKE '2013%' THEN Consumption ELSE 0 END)) / SUM(CASE WHEN Date LIKE '2012%' THEN Consumption ELSE 0 END) AS ConsumptionDecreaseRate FROM yearmonth WHERE CustomerID = (     SELECT CustomerID     FROM transactions_1k     WHERE Date = '2012-08-25' AND Price = 634.8 )	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS TotalRevenue FROM transactions_1k GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT      (CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) * 100 AS PremiumPercentage FROM      gasstations AS T2 WHERE      T2.Country = 'SVK';	debit_card_specializing
SELECT SUM(t.Amount * t.Price) AS TotalSpent FROM transactions_1k t WHERE t.CustomerID = 38508;  SELECT SUM(t.Amount * t.Price) AS TotalSpentInJan2012 FROM transactions_1k t WHERE t.CustomerID = 38508 AND strftime('%Y%m', t.Date) = '201201';	debit_card_specializing
SELECT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  GROUP BY p.ProductID  ORDER BY SUM(t.Amount) DESC  LIMIT 5	debit_card_specializing
SELECT c.CustomerID, AVG(t.Price / t.Amount) AS AvgPricePerItem, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID ORDER BY SUM(t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ProductID = 2 AND T2.Amount = 1 ORDER BY T2.Price DESC LIMIT 1	debit_card_specializing
SELECT y.Consumption  FROM transactions_1k t  JOIN yearmonth y ON t.CustomerID = y.CustomerID  WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29.00 AND y.Date = '201208'	debit_card_specializing
