SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda';	california_schools
SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS `Eligible Free Rate` FROM `frpm` WHERE `Educational Option Type` = 'Continuation' ORDER BY `Eligible Free Rate` ASC LIMIT 3	california_schools
SELECT s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND f.`District Name` = 'Fresno County Office of Education'	california_schools
SELECT MailStreet FROM schools WHERE CDSCode = (SELECT CDSCode FROM frpm ORDER BY `FRPM Count (K-12)` DESC LIMIT 1)	california_schools
SELECT s.Phone  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Charter School (Y/N)` = 1 AND f.`Charter Funding Type` = 1 AND s.OpenDate > '2000-01-01'	california_schools
SELECT COUNT(*) FROM satscores AS s JOIN schools AS sch ON s.cds = sch.CDSCode WHERE s.AvgScrMath > 400 AND sch.Virtual = 'F'	california_schools
SELECT s.School  FROM schools s  JOIN satscores sc ON s.CDSCode = sc.cds  WHERE sc.NumTstTakr > 500 AND s.Magnet = 1	california_schools
SELECT Phone FROM schools WHERE CDSCode = (SELECT cds FROM satscores ORDER BY NumGE1500 DESC LIMIT 1)	california_schools
SELECT s.NumTstTakr  FROM satscores s  JOIN frpm f ON s.cds = f.CDSCode  ORDER BY f.`FRPM Count (K-12)` DESC  LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm f JOIN satscores s ON f.CDSCode = SUBSTR(s.cds, -7) WHERE s.AvgScrMath > 560 AND f.`Charter Funding Type` = 'Directly funded'	california_schools
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrRead DESC LIMIT 1	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500	california_schools
SELECT MAX(f.`Free Meal Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) AS HighestEligibleFreeRate FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE s.NumGE1500 / s.NumTstTakr > 0.3 AND f.`Enrollment (Ages 5-17)` IS NOT NULL AND f.`Free Meal Count (Ages 5-17)` IS NOT NULL	california_schools
SELECT s.Phone  FROM schools s  JOIN satscores sc ON s.CDSCode = sc.cds  WHERE sc.NumTstTakr IS NOT NULL  ORDER BY sc.NumGE1500 / sc.NumTstTakr DESC  LIMIT 3	california_schools
SELECT T1.NCESSchool FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`Enrollment (Ages 5-17)` DESC LIMIT 5	california_schools
SELECT District FROM schools WHERE CDSCode IN (SELECT cds FROM satscores ORDER BY AvgScrRead DESC LIMIT 1) AND StatusType = 'Active'	california_schools
SELECT COUNT(*) FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.County = 'Alameda' AND satscores.NumTstTakr < 100	california_schools
SELECT sname, CharterNum FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE AvgScrWrite > 499 AND CharterNum IS NOT NULL ORDER BY AvgScrWrite DESC	california_schools
SELECT COUNT(*) FROM satscores AS s JOIN schools AS sch ON s.cds = sch.CDSCode WHERE sch.County = 'Fresno' AND sch.FundingType = 'Direct funded' AND s.NumTstTakr <= 250	california_schools
SELECT Phone FROM schools WHERE CDSCode = (SELECT cds FROM satscores ORDER BY AvgScrMath DESC LIMIT 1)	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Amador' AND frpm.Low_Grade = '9' AND frpm.High_Grade = '12'	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700	california_schools
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1	california_schools
SELECT S.School, S.StreetAbr  FROM schools S  JOIN frpm F ON S.CDSCode = F.CDSCode  WHERE F.`Enrollment (K-12)` - F.`Enrollment (Ages 5-17)` > 30	california_schools
SELECT s.`School Name` FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) > 0.1 AND s.NumGE1500 >= 1	california_schools
SELECT s.`District Name`, s.`Charter Funding Type` FROM frpm s JOIN (     SELECT cds, AVG(AvgScrMath) AS AvgMathScore     FROM satscores     GROUP BY cds     HAVING AVG(AvgScrMath) > 400 ) ss ON s.CDSCode = ss.cds WHERE s.`District Name` = 'Riverside'	california_schools
SELECT T2.`School Name`, T1.Street, T1.City, T1.State, T1.Zip  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.County = 'Monterey' AND T2.`School Type` LIKE '%High%' AND T2.`Free Meal Count (Ages 5-17)` > 800	california_schools
SELECT s.School, s.Phone, CAST(SUBSTR(sc.AvgScrWrite, -3) AS INTEGER) AS AvgScrWrite FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.OpenDate > '1991-01-01' OR s.ClosedDate < '2000-01-01'	california_schools
SELECT s.School, s.DOC  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.FundingType = 'Locally funded'  AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`)      FROM schools s      JOIN frpm f ON s.CDSCode = f.CDSCode      WHERE s.FundingType = 'Locally funded' )	california_schools
SELECT OpenDate FROM schools WHERE CDSCode = (SELECT CDSCode FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 1)	california_schools
SELECT s.City, f.`Enrollment (K-12)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (K-12)` ASC LIMIT 5	california_schools
SELECT (`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS Eligible_Free_Rate FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 1 OFFSET 9	california_schools
SELECT s.CDSCode, (f.`FRPM Count (K-12)` / f.`Enrollment (K-12)`) AS FRPM_Rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.SOC = '66' ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 5	california_schools
SELECT s.Website, f.`School Name` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT CAST(f.`Free Meal Count (Ages 5-17)` AS REAL) / f.`Enrollment (Ages 5-17)` AS FreeRate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Kacey' AND s.AdmLName1 = 'Gibson'	california_schools
SELECT AdmEmail1 FROM schools WHERE CDSCode = (SELECT CDSCode FROM frpm WHERE `Charter School (Y/N)` = 1 ORDER BY `Enrollment (K-12)` ASC LIMIT 1)	california_schools
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3  FROM schools  WHERE CDSCode = (     SELECT cds      FROM satscores      ORDER BY NumGE1500 DESC      LIMIT 1 )	california_schools
SELECT s.Street, s.City, s.Zip, s.State  FROM schools s  JOIN satscores sc ON s.CDSCode = sc.cds  WHERE sc.NumTstTakr IS NOT NULL  ORDER BY (sc.NumGE1500 / sc.NumTstTakr) ASC  LIMIT 1	california_schools
SELECT Website FROM schools WHERE CDSCode IN (SELECT cds FROM satscores WHERE NumTstTakr BETWEEN 2000 AND 3000) AND County = 'Los Angeles'	california_schools
SELECT AVG(NumTstTakr) FROM satscores WHERE cds IN (SELECT CDSCode FROM schools WHERE County = 'Fresno' AND strftime('%Y', OpenDate) = '1980')	california_schools
SELECT s.Phone  FROM schools s  JOIN satscores sc ON s.CDSCode = sc.cds  WHERE s.District = 'Fresno Unified'  ORDER BY sc.AvgScrRead ASC  LIMIT 1	california_schools
SELECT s.School, s.County, sat.AvgScrRead FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE s.Virtual = 'F' AND (     SELECT COUNT(*) + 1     FROM satscores sat2     JOIN schools s2 ON sat2.cds = s2.CDSCode     WHERE s2.County = s.County AND sat2.AvgScrRead > sat.AvgScrRead AND s2.Virtual = 'F' ) <= 5 ORDER BY s.County, sat.AvgScrRead DESC	california_schools
SELECT EdOpsName FROM schools WHERE CDSCode = (SELECT cds FROM satscores ORDER BY AvgScrMath DESC LIMIT 1)	california_schools
SELECT s.AvgScrMath, sch.County FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) = (     SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite)     FROM satscores     WHERE AvgScrMath IS NOT NULL AND AvgScrRead IS NOT NULL AND AvgScrWrite IS NOT NULL )	california_schools
SELECT s.AvgScrWrite, sch.City  FROM satscores s  JOIN schools sch ON s.cds = sch.CDSCode  WHERE s.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)	california_schools
SELECT s.School, AVG(CAST(SUBSTR(ss.AvgScrWrite, 10, 3) AS INTEGER)) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School	california_schools
SELECT s.School, f.`Enrollment (K-12)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.DOC = '31' ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1;	california_schools
SELECT COUNT(CASE WHEN OpenDate LIKE '1980%' THEN 1 END) / 12 AS MonthlyAverage FROM schools WHERE DOC = '52' AND County = 'Alameda'	california_schools
SELECT (SUM(CASE WHEN DOC = '54' THEN 1 ELSE 0 END) / SUM(CASE WHEN DOC = '52' THEN 1 ELSE 0 END)) AS ratio FROM schools WHERE County = 'Orange'	california_schools
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT s.School, s.MailStreet  FROM schools s  JOIN satscores sa ON s.CDSCode = sa.cds  ORDER BY sa.AvgScrMath DESC  LIMIT 6, 1	california_schools
SELECT MailStreet, School FROM schools WHERE CDSCode = (SELECT cds FROM satscores ORDER BY AvgScrRead ASC LIMIT 1)	california_schools
SELECT COUNT(*) FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE (s.AvgScrRead + s.AvgScrMath + s.AvgScrWrite) >= 1500 AND sch.MailCity = 'Lakeport'	california_schools
SELECT SUM(s.NumTstTakr) FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.MailCity = 'Fresno'	california_schools
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian';	california_schools
SELECT CAST(COUNT(CASE WHEN County = 'Colusa' THEN 1 END) AS REAL) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 END) AS ratio FROM schools WHERE MailState = 'CA'	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'California' AND City = 'San Joaquin' AND StatusType = 'Active'	california_schools
SELECT T2.Phone, T2.Ext FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 332, 1	california_schools
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')	california_schools
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Charter = 1 AND Virtual = 'P'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = 52	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND (frpm.`Free Meal Count (K-12)` * 100 / frpm.`Enrollment (K-12)`) < 0.18	california_schools
SELECT AdmFName1, AdmLName1, School, City FROM schools WHERE Charter = 1 AND CharterNum = '00D2'	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'	california_schools
SELECT (SUM(CASE WHEN FundingType = 'Locally funded' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS RatioPercentage FROM schools WHERE County = 'Santa Clara'	california_schools
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate LIKE '1989%' AND DOCType = 'Community College District';	california_schools
SELECT County FROM schools WHERE ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND SOC = '11' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31'	california_schools
SELECT StatusType, COUNT(*) FROM schools WHERE County = 'Alpine' GROUP BY StatusType	california_schools
SELECT T1.`District Code` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.City = 'Fresno' AND T2.Magnet = 0	california_schools
SELECT SUM("Enrollment (Ages 5-17)") FROM frpm WHERE "Academic Year" = '2014-2015' AND CDSCode IN (SELECT CDSCode FROM schools WHERE EdOpsCode = 'SSS')	california_schools
SELECT `FRPM Count (Ages 5-17)` FROM `frpm` WHERE `CDSCode` = (SELECT `CDSCode` FROM `schools` WHERE `MailStreet` = 'PO Box 1040' AND `SOCType` = 'Youth Authority')	california_schools
SELECT MIN(`Low Grade`) FROM `frpm` WHERE `CDSCode` IN (SELECT `CDSCode` FROM `schools` WHERE `NCESDist` = '0613360' AND `EdOpsCode` = 'SPECON')	california_schools
SELECT T2.EILName, T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`County Code` = '37' AND T1.`NSLP Provision Status` = 'Breakfast Provision 2'	california_schools
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`NSLP Provision Status` = 'Breakfast Provision 2' AND f.`Low Grade` = '9' AND f.`High Grade` = '12' AND s.County = 'Merced' AND s.EILCode = 'HS'	california_schools
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) * 100 AS Percent_Eligible_FRPM FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved = 'K-9'	california_schools
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1	california_schools
SELECT T1.`School Name`, T1.`School Type`, T2.Latitude FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.Latitude DESC LIMIT 1	california_schools
SELECT s.City, f."Low Grade", f."School Name" FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1	california_schools
SELECT GSoffered FROM schools WHERE ABS(longitude) = (SELECT MAX(ABS(longitude)) FROM schools)	california_schools
SELECT s.City, COUNT(s.CDSCode) AS NumberOfSchools, SUM(CASE WHEN f.`NSLP Provision Status` = 'Multiple Provision Types' THEN 1 ELSE 0 END) AS NumberOfMultipleProvisionTypes FROM schools s LEFT JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.GSoffered = 0 AND s.Magnet = 1 GROUP BY s.City;	california_schools
SELECT AdmFName1, District, COUNT(*) as NameCount FROM schools WHERE AdmFName1 IS NOT NULL GROUP BY AdmFName1 ORDER BY NameCount DESC LIMIT 2	california_schools
SELECT (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) * 100 AS Percent_Eligible_Free, f.`District Code` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Alusine'	california_schools
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = '40'	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (DOC = 54 OR SOC = 62)	california_schools
SELECT AdmEmail1, School FROM schools WHERE CDSCode = (SELECT cds FROM satscores ORDER BY NumGE1500 DESC LIMIT 1)	california_schools
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'East Bohemia'	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' AND a.account_id IN (SELECT account_id FROM loan)	financial
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district	financial
SELECT COUNT(DISTINCT d.district_id)  FROM district d  JOIN client c ON d.district_id = c.district_id  WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000	financial
SELECT      a.account_id,      d.A11 AS average_salary,     MAX(d.A11) - MIN(d.A11) OVER () AS salary_gap FROM      account a JOIN      client c ON a.district_id = c.district_id JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' ORDER BY      c.birth_date ASC, d.A11 ASC LIMIT 1	financial
SELECT a.account_id FROM account a JOIN client c ON a.district_id = c.district_id JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (     SELECT MIN(birth_date)     FROM client ) AND d.A11 = (     SELECT MAX(A11)     FROM district )	financial
SELECT COUNT(*) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'	financial
SELECT client_id FROM disp WHERE type = 'DISPONENT' AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK PO OBRATU')	financial
SELECT account.account_id FROM account JOIN loan ON account.account_id = loan.account_id WHERE loan.date LIKE '1997%' AND account.frequency = 'POPLATEK TYDNE' ORDER BY loan.amount ASC LIMIT 1	financial
SELECT l.account_id FROM loan l JOIN disp d ON l.account_id = d.account_id WHERE l.duration > 12 AND l.amount = (     SELECT MAX(amount)     FROM loan     WHERE duration > 12 ) AND YEAR(d.date) = 1993	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolov'	financial
SELECT account_id, MIN(date) AS earliest_date FROM trans WHERE YEAR(date) = 1995 GROUP BY account_id;	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.amount > 3000	financial
SELECT T2.client_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued = '1994-03-03'	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14'	financial
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'	financial
SELECT MAX(amount) FROM trans WHERE account_id = (SELECT account_id FROM account WHERE date = '1996-10-21')	financial
SELECT c.gender FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A11 = (SELECT MAX(A11) FROM district) ORDER BY c.birth_date ASC LIMIT 1	financial
SELECT t.amount  FROM trans t  JOIN (     SELECT account_id, MAX(amount) AS max_loan      FROM loan      GROUP BY account_id      ORDER BY max_loan DESC      LIMIT 1 ) l ON t.account_id = l.account_id  ORDER BY t.date ASC  LIMIT 1	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F'	financial
SELECT disp_id FROM disp WHERE account_id = (SELECT account_id FROM trans WHERE date = '1998-09-02' AND amount = 5100)	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996	financial
SELECT T2.A2 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT c.birth_date FROM client c JOIN account a ON c.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03'	financial
SELECT account_id FROM account WHERE district_id = (SELECT district_id FROM district WHERE A3 = 'Prague') ORDER BY date ASC LIMIT 1	financial
SELECT CAST(SUM(IIF(T1.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'south Bohemia' ORDER BY T2.A4 DESC LIMIT 1	financial
SELECT ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM trans t1 JOIN trans t2 ON t1.account_id = t2.account_id JOIN loan l ON t1.account_id = l.account_id WHERE l.date = '1993-07-05' AND t1.date = '1993-03-22' AND t2.date = '1998-12-27'	financial
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan	financial
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE strftime('%Y', a.date) = '1993' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT a.account_id, a.frequency  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE d.A3 = 'east Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31'	financial
SELECT account_id, date FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Prachatice')	financial
SELECT T2.A2, T2.A3 FROM loan AS T1 JOIN account AS T3 ON T1.account_id = T3.account_id JOIN district AS T2 ON T3.district_id = T2.district_id WHERE T1.loan_id = 4990	financial
SELECT T1.account_id, T2.A2, T2.A3 FROM loan AS T1 JOIN account AS T3 ON T1.account_id = T3.account_id JOIN district AS T2 ON T3.district_id = T2.district_id WHERE T1.amount > 300000	financial
SELECT l.loan_id, d.A3, d.A11  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE l.duration = 60	financial
SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D'	financial
SELECT (SUM(CASE WHEN d.A2 = 'Decin' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1993	financial
SELECT account_id FROM account WHERE account_id IN (SELECT account_id FROM statement WHERE type = 'POPLATEK MESICNE')	financial
SELECT T2.A2, COUNT(T1.client_id) AS female_count FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.A2 ORDER BY female_count DESC LIMIT 9	financial
SELECT d.A2, COUNT(t.account_id) AS withdrawal_count FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY withdrawal_count DESC LIMIT 10	financial
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id LEFT JOIN disp dis ON c.client_id = dis.client_id WHERE d.A3 = 'South Bohemia' AND dis.type IS NULL	financial
SELECT d.A3 FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT AVG(amount) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE district_id IN (SELECT district_id FROM client WHERE gender = 'M'))	financial
SELECT A2 AS district_name, A13 AS unemployment_rate FROM district ORDER BY A13 DESC	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1)	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE a.frequency = 'POPLATEK MESICNE' AND t.operation = 'VYBER KARTOU' AND t.balance < 0	financial
SELECT COUNT(*) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.frequency = 'POPLATEK MESICNE' AND l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31'	financial
SELECT COUNT(*) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM account WHERE district_id = 1)	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1, 1)	financial
SELECT COUNT(*) FROM card AS c JOIN disp AS d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER'	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Pisek'	financial
SELECT DISTINCT d.district_id  FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.date LIKE '1997%' AND t.amount > 10000	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A2 = 'Pisek' AND t.k_symbol = 'SIPO'	financial
SELECT DISTINCT T2.account_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold'	financial
SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND YEAR(date) = 2021 GROUP BY MONTH(date)	financial
SELECT DISTINCT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN trans t ON d.account_id = t.account_id  WHERE t.operation = 'VYBER KARTOU'  AND t.date LIKE '1998%'  AND t.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date LIKE '1998%')	financial
SELECT c.client_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cd ON d.disp_id = cd.disp_id  JOIN loan l ON d.account_id = l.account_id  WHERE c.gender = 'F'	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 = 'South Bohemia'	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dis ON a.district_id = dis.district_id WHERE dis.A2 = 'Tabor' AND d.type = 'OWNER'	financial
SELECT d.type  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district di ON a.district_id = di.district_id  WHERE d.type != 'OWNER' AND di.A11 > 8000 AND di.A11 <= 9000	financial
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB'	financial
SELECT DISTINCT T2.A2 FROM trans AS T1 JOIN account AS T3 ON T1.account_id = T3.account_id JOIN district AS T2 ON T3.district_id = T2.district_id WHERE T1.type = 'VYDAJ'	financial
SELECT AVG(d.A15)  FROM district d  JOIN account a ON d.district_id = a.district_id  WHERE d.A15 > 4000 AND YEAR(a.date) >= 1997	financial
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'classic' AND d.type = 'OWNER'	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha'	financial
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card	financial
SELECT T1.client_id FROM disp AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' ORDER BY T2.amount DESC LIMIT 1	financial
SELECT T1.A15 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532	financial
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 3356) AND operation = 'VYBER'	financial
SELECT COUNT(*) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 13539 AND d.type = 'OWNER'	financial
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541	financial
SELECT d.district_id FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT client_id FROM client WHERE district_id = (SELECT district_id FROM account WHERE account_id = (SELECT account_id FROM order WHERE order_id = 32423))	financial
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik')	financial
SELECT T1.client_id FROM disp AS T1 JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'junior' AND T2.issued >= '1997-01-01'	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  WHERE T2.A11 > 10000	financial
SELECT ((SUM(CASE WHEN strftime('%Y', L.date) = '1997' THEN L.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', L.date) = '1996' THEN L.amount ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', L.date) = '1996' THEN L.amount ELSE 0 END)) * 100 AS growth_rate FROM loan L JOIN disp D ON L.account_id = D.account_id JOIN client C ON D.client_id = C.client_id WHERE C.gender = 'M'	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'	financial
SELECT SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) AS difference FROM district	financial
SELECT type, COUNT(*) as count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type	financial
SELECT frequency FROM account WHERE account_id = 3; SELECT SUM(amount) FROM order WHERE account_id = 3 AND k_symbol = 'UVER';	financial
SELECT YEAR(birth_date) FROM client WHERE client_id = 130	financial
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT SUM(amount), status FROM loan WHERE account_id = (SELECT account_id FROM account WHERE client_id = 992) GROUP BY status	financial
SELECT SUM(t.balance), c.gender  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN client c ON a.district_id = c.district_id  WHERE c.client_id = 4 AND t.trans_id > 851	financial
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 9	financial
SELECT SUM(t.amount) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE c.client_id = 617 AND YEAR(t.date) = 1998	financial
SELECT client.client_id FROM client JOIN account ON client.district_id = account.district_id JOIN district ON account.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.A3 = 'East Bohemia'	financial
SELECT c.client_id  FROM client c  JOIN loan l ON c.district_id = l.account_id  WHERE c.gender = 'F'  ORDER BY l.amount DESC  LIMIT 3	financial
SELECT COUNT(DISTINCT c.district_id)  FROM client c  JOIN trans t ON c.district_id = t.account_id  WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND t.k_symbol = 'SIPO'  AND t.amount > 4000	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND account.date > '1996-12-31'	financial
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id WHERE c.gender = 'F' AND cd.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague'	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1	financial
SELECT a.account_id  FROM account a  JOIN client c ON a.district_id = c.district_id  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F'  ORDER BY c.birth_date ASC, d.A11 ASC  LIMIT 1	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE YEAR(client.birth_date) = 1920 AND district.A3 = 'east Bohemia'	financial
SELECT COUNT(*) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(amount) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK PO OBRATU')	financial
SELECT T1.account_id, T3.district_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.type = 'OWNER'	financial
SELECT c.client_id, strftime('%Y', 'now') - strftime('%Y', c.birth_date) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(DISTINCT a.molecule_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl'	toxicology
SELECT AVG(CASE WHEN T1.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'	toxicology
SELECT CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+'	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-'	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT a.element FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '='	toxicology
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'h') GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1	toxicology
SELECT DISTINCT bond.bond_type FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'cl'	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')	toxicology
SELECT DISTINCT a.atom_id  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE m.label = '-'	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1	toxicology
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE (atom_id = 'TR004_8' AND atom_id2 = 'TR004_20') OR (atom_id = 'TR004_20' AND atom_id2 = 'TR004_8'))	toxicology
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn')	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'	toxicology
SELECT DISTINCT a2.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE a1.molecule_id = 'TR181'	toxicology
SELECT (SUM(CASE WHEN T1.element != 'f' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT T1.molecule_id)) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_type) AS percent FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3	toxicology
SELECT SUBSTR(bond_id, INSTR(bond_id, '_') + 1) AS atom1, SUBSTR(bond_id, INSTR(bond_id, '_', INSTR(bond_id, '_') + 1) + 1) AS atom2 FROM bond WHERE bond_id = 'TR001_2_6' AND molecule_id = 'TR001'	toxicology
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '=' ORDER BY molecule_id LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR000'	toxicology
SELECT atom.element, molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR060'	toxicology
SELECT bond_type, COUNT(*) as bond_count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY bond_count DESC LIMIT 1;	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' ORDER BY m.molecule_id LIMIT 3	toxicology
SELECT c.bond_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.molecule_id = 'TR006' ORDER BY c.bond_id LIMIT 2	toxicology
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12') AND b.molecule_id = 'TR009'	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br'	toxicology
SELECT b.bond_type, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_id = 'TR001_6_9'	toxicology
SELECT m.molecule_id, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenic_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-'	toxicology
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'	toxicology
SELECT c.bond_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element IN ('p', 'n') GROUP BY c.bond_id HAVING COUNT(DISTINCT a.element) = 2	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT CAST(COUNT(bond_id) AS REAL) / COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 'i'	toxicology
SELECT b.bond_type, b.bond_id  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE CAST(SUBSTR(c.atom_id, 7, 2) AS INTEGER) = 45	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected)	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'	toxicology
SELECT m.molecule_id, COUNT(b.bond_type) as double_bonds_count  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '+' AND b.bond_type = '='  GROUP BY m.molecule_id  ORDER BY double_bonds_count DESC  LIMIT 1	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1	toxicology
SELECT T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT CAST(SUM(CASE WHEN atom_count = max_atom_count THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT bond_id) FROM (     SELECT bond_id, COUNT(atom_id) AS atom_count, MAX(atom_count) OVER () AS max_atom_count     FROM connected     GROUP BY bond_id ) subquery	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')	toxicology
SELECT T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'	toxicology
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn'	toxicology
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#') AND element IN ('p', 'br')	toxicology
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(DISTINCT b.bond_id)  FROM bond b  JOIN atom a ON b.molecule_id = a.molecule_id  WHERE a.element = 'i'	toxicology
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'ca') GROUP BY label ORDER BY COUNT(*) DESC LIMIT 1	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_1_8' AND T1.element IN ('cl', 'c') HAVING COUNT(DISTINCT T1.element) = 2	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN bond b ON m.molecule_id = b.molecule_id WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-' LIMIT 2	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '='	toxicology
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '-' AND b.bond_type = '-'	toxicology
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'	toxicology
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#'	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND SUBSTR(a.atom_id, 7, 1) = '4'	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(element) AS ratio, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.molecule_id = 'TR006'	toxicology
SELECT DISTINCT CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS Carcinogenicity FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca'	toxicology
SELECT DISTINCT b.bond_type  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'c'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT (COUNT(CASE WHEN bond_type = '#' THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS percentage FROM bond	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047'	toxicology
SELECT CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenic_status FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1'	toxicology
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE label = 'TR151'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'f', 'i', 'sn', 'pb', 'te')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT * FROM atom WHERE element = 'c' AND CAST(SUBSTR(molecule_id, 3, 3) AS INTEGER) BETWEEN 10 AND 50	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT bond_id FROM bond WHERE bond_type = '=' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' AND molecule.label = '+'	toxicology
SELECT T1.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' AND T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE label = 'TR124'	toxicology
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_type = 'TR007_4_19'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_4'	toxicology
SELECT COUNT(b.bond_id) AS double_bonds_count, m.label AS carcinogenic_status  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.molecule_id = 'TR006' AND b.bond_type = '='	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_type = '-'	toxicology
SELECT DISTINCT a.molecule_id, a.element FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(DISTINCT bond_id) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_type_count FROM atom a LEFT JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules, SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM atom WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 's') AND molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type = '=')	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' AND T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2') OR (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_1')	toxicology
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_4') OR (T2.atom_id = 'TR000_4' AND T2.atom_id2 = 'TR000_2')	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS status FROM molecule WHERE label = 'TR000'	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'n'	toxicology
SELECT DISTINCT a.molecule_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element = 's' AND b.bond_type = '='	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' AND T1.molecule_id = 'TR024'	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) as atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT a.molecule_id) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' AND b.bond_type = '#'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE a.element = 'o' AND b.bond_type = '='	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '-'	toxicology
SELECT a.element, b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR002'	toxicology
SELECT a.atom_id FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR012'	toxicology
SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element = 'o'	toxicology
SELECT * FROM `cards` WHERE `cardKingdomFoilId` IS NOT NULL AND `cardKingdomId` IS NOT NULL	card_games
SELECT id, borderColor, cardKingdomId FROM cards WHERE borderColor = 'borderless' AND cardKingdomId IS NULL	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)	card_games
SELECT * FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100	card_games
SELECT c.id, c.uuid FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator'	card_games
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage'	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'	card_games
SELECT c.id, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Missing or Degraded' ELSE 'No Issues' END AS property_status FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele'	card_games
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s'	card_games
SELECT c.name, c.artist, CASE WHEN c.isPromo = 1 THEN 'Yes' ELSE 'No' END AS isPromotional FROM cards c JOIN (     SELECT uuid, COUNT(*) AS ruling_count     FROM rulings     GROUP BY uuid     ORDER BY ruling_count DESC     LIMIT 1 ) r ON c.uuid = r.uuid	card_games
SELECT DISTINCT language FROM foreign_data WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Annul' AND number = '29')	card_games
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM foreign_data	card_games
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT st.language FROM cards c JOIN set s ON c.id = s.card_id JOIN set_translations st ON s.set_translation_id = st.id WHERE c.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.isTextless = 0 AND l.status = 'restricted'	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn'	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.isStarter = 1 AND l.status = 'restricted'	card_games
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight'	card_games
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'	card_games
SELECT DISTINCT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT COUNT(*) FROM cards WHERE isReprint = 1 AND uuid IN (SELECT uuid FROM foreign_data WHERE language = 'German')	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.borderColor = 'borderless' AND f.language = 'Russian'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99'	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE keywords = 'Flying'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'	card_games
SELECT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.availability = 'paper' AND f.language = 'Japanese'	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.borderColor = 'white' AND l.status = 'Banned'	card_games
SELECT l.uuid, f.language FROM legalities l JOIN foreign_data f ON l.uuid = f.uuid WHERE l.format = 'legacy'	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality'	card_games
SELECT COUNT(c.id) AS card_count, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal'	card_games
SELECT id, colors FROM cards WHERE setCode = 'OGW'	card_games
SELECT c.id, c.convertedManaCost, st.language  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE c.setCode = '10E' AND c.convertedManaCost = 5	card_games
SELECT c.originalType, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf'	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20	card_games
SELECT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B'	card_games
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NULL	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion LIKE '%1993%' AND availability = 'paper' AND hasContentWarning = 1	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'	card_games
SELECT SUM(manaCost) FROM cards WHERE artist = 'Rob Alexander'	card_games
SELECT subtypes, supertypes FROM cards WHERE availability = 'arena'	card_games
SELECT setCode FROM set_translations WHERE language = 'Spanish';	card_games
SELECT CAST(SUM(IIF(isOnlineOnly = 1, 1, 0)) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage, id FROM cards GROUP BY id	card_games
SELECT name, (COUNT(CASE WHEN language = 'Spanish' THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS percentage FROM foreign_data GROUP BY name	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE baseSetSize = 309)	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)'	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal'	card_games
SELECT DISTINCT T1.subtypes, T1.supertypes FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid JOIN rulings AS r ON c.uuid = r.uuid WHERE l.format = 'premodern' AND r.text = 'This is a triggered mana ability.' AND c.side IS NULL	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'	card_games
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.flavorText = 'Das perfekte Gegenmittel zu einer dichten Formation'	card_games
SELECT fd.name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.borderColor = 'black' AND c.layout = 'normal' AND c.types = 'Creature' AND c.artist = 'Matthew D. Wilson' AND fd.language = 'French'	card_games
SELECT COUNT(DISTINCT c.id) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'	card_games
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'Legal'	card_games
SELECT CAST(SUM(CASE WHEN fd.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id) FROM cards c LEFT JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.power IS NULL OR c.power = '*'	card_games
SELECT CAST(SUM(CASE WHEN T1.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isPromo = 1 AND isReprint = 1	card_games
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes = 'arenaleague' ORDER BY name LIMIT 3	card_games
SELECT language FROM foreign_data WHERE multiverseid = 149934	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT id FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3	card_games
SELECT language FROM set_translations WHERE setCode = 'ARC'	card_games
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5	card_games
SELECT T2.language, T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 206	card_games
SELECT s.id, s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.block = 'Shadowmoor'  ORDER BY s.name  LIMIT 2	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese'	card_games
SELECT s.code, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Chinese Simplified'	card_games
SELECT COUNT(DISTINCT st.setCode) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '')	card_games
SELECT COUNT(*) AS NumberOfCards, GROUP_CONCAT(id) AS CardIDs FROM cards WHERE borderColor = 'black'	card_games
SELECT COUNT(id), id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT id FROM cards WHERE borderColor = 'black' AND isFullArt = 1	card_games
SELECT T2.language FROM set_contents AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.id WHERE T1.set_id = 174	card_games
SELECT name FROM sets WHERE code = 'ALL';	card_games
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13'	card_games
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT setCode FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE type = 'expansion')	card_games
SELECT T2.name, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'boros'	card_games
SELECT T2.language, T2.flavorText, T1.watermark FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'	card_games
SELECT CAST(SUM(IIF(c.convertedManaCost = 10, 1, 0)) AS REAL) * 100 / COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror'	card_games
SELECT DISTINCT setCode FROM set_translations WHERE setCode IN (SELECT code FROM sets WHERE type = 'expansion')	card_games
SELECT T2.name, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'abzan'	card_games
SELECT T2.language, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Azorius'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power IS NULL OR power = '*')	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE availability LIKE '%arena,mtgo%' AND border_color = 'black'	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT translation FROM set_translations WHERE setCode = (SELECT setCode FROM cards WHERE name = 'Ancestor''s Chosen') AND language = 'Italian'	card_games
SELECT COUNT(DISTINCT T2.translation) FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT c.name FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'	card_games
SELECT CASE WHEN EXISTS (SELECT 1 FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Korean') THEN 'Yes' ELSE 'No' END AS Korean_Version_Exists	card_games
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'	card_games
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'	card_games
SELECT CASE WHEN s.mtgoCode IS NOT NULL THEN 'Yes' ELSE 'No' END AS appeared_on_mtgo FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy'	card_games
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'	card_games
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL	card_games
SELECT s.isForeignOnly FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(*) FROM sets WHERE code IN (SELECT setCode FROM set_translations WHERE language = 'Italian') AND baseSetSize < 100	card_games
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND borderColor = 'black'	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'  ORDER BY c.convertedManaCost DESC  LIMIT 1	card_games
SELECT DISTINCT artist FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = '4'	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)	card_games
SELECT flavorText FROM foreign_data WHERE language = 'Italian' AND name = 'Ancestor''s Chosen'	card_games
SELECT DISTINCT language FROM foreign_data WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Ancestor''s Chosen') AND flavorText IS NOT NULL	card_games
SELECT type FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND language = 'German'	card_games
SELECT fd.text FROM foreign_data AS fd JOIN cards AS c ON fd.uuid = c.uuid JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND fd.language = 'Italian'	card_games
SELECT fd.name  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  JOIN sets s ON c.setCode = s.code  WHERE fd.language = 'Italian' AND s.name = 'Coldsnap'  ORDER BY c.convertedManaCost DESC  LIMIT 1	card_games
SELECT r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Reminisce'	card_games
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC'	card_games
SELECT mcmId FROM sets WHERE code = 'SS2'	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT c.text AS card_text, r.text AS ruling_text, CASE WHEN c.hasContentWarning = 1 THEN 'Missing or Degraded' ELSE 'No Issues' END AS property_status FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'	card_games
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'	card_games
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'	card_games
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'	card_games
SELECT st.translation FROM set_translations st JOIN cards c ON st.setCode = c.setCode WHERE c.name = 'Tendo Ice Bridge' AND st.language = 'French'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL	card_games
SELECT translation FROM set_translations WHERE setCode = (SELECT setCode FROM cards WHERE name = 'Fellwar Stone') AND language = 'Japanese'	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1	card_games
SELECT T1.releaseDate FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'	card_games
SELECT s.type FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3	card_games
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'	card_games
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE duelDeck = 'a' AND hasFoil = 0 AND (power IS NULL OR power = '*')	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT c.name  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel'  ORDER BY LENGTH(c.manaCost) DESC  LIMIT 10	card_games
SELECT c.originalReleaseDate, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal' ORDER BY c.originalReleaseDate ASC LIMIT 1	card_games
SELECT COUNT(*) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Volkan Baǵa' AND f.language = 'French'	card_games
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Abundance' AND c.rarity = 'rare' AND c.types = 'Enchantment' AND l.status = 'Legal' GROUP BY c.id HAVING COUNT(DISTINCT l.status) = 1	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format HAVING COUNT(l.format) = (     SELECT COUNT(format)     FROM legalities     WHERE status = 'Banned'     GROUP BY format     ORDER BY COUNT(format) DESC     LIMIT 1 )	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.id WHERE T1.name = 'Battlebond'	card_games
SELECT c.artist, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = (     SELECT artist      FROM cards      GROUP BY artist      ORDER BY COUNT(*) ASC      LIMIT 1 )	card_games
SELECT status FROM legalities WHERE uuid IN (SELECT uuid FROM cards WHERE artist = 'D. Alexander Gregory' AND frameVersion = '1997' AND hasContentWarning = 1) AND format = 'legacy'	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'	card_games
SELECT AVG(COUNT(s.id)) AS avg_sets_per_year, st.language AS common_language FROM sets s JOIN set_translations st ON s.id = st.id WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY YEAR(s.releaseDate), st.language ORDER BY COUNT(st.language) DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE availability = 'arena' AND BorderColor = 'black'	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted')	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC	card_games
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Korean' AND s.code NOT IN (SELECT setCode FROM set_translations WHERE language = 'Japanese')	card_games
SELECT DISTINCT c.frameVersion, c.name  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.artist = 'Allen Williams' OR l.status = 'Banned'	card_games
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND STRFTIME('%Y', CreationDate) > '2013'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'  ORDER BY p.ViewCount DESC  LIMIT 1	codebase_community
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount = (     SELECT MAX(FavoriteCount) FROM posts )	codebase_community
SELECT SUM(T1.CommentCount) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT MAX(p.AnswerCount) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL	codebase_community
SELECT DISTINCT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20	codebase_community
SELECT T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags ORDER BY Count DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie'	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie' AND STRFTIME('%Y', badges.Date) = '2011'	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.DisplayName)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Views > 200	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT p.Title  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910)	codebase_community
SELECT FavoriteCount FROM posts WHERE Id = (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0')	codebase_community
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ParentId = 107829 AND CommentCount = 1)	codebase_community
SELECT CASE WHEN p.ClosedDate IS NOT NULL THEN 'well-finished' ELSE 'not well-finished' END AS PostStatus FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041)	codebase_community
SELECT COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T1.DisplayName FROM users AS T1 JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347	codebase_community
SELECT COUNT(v.Id) FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT CAST(COUNT(DISTINCT p.Id) AS REAL) / COUNT(DISTINCT v.Id) AS ratio FROM posts p LEFT JOIN votes v ON p.OwnerUserId = v.UserId WHERE p.OwnerUserId = 24;	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'SilentGhost'	codebase_community
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'thank you user93!'	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion'	codebase_community
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT Text FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Title = 'How does gentle boosting differ from AdaBoost?')	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'	codebase_community
SELECT SUM(p.Score), u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'	codebase_community
SELECT T2.Comment FROM posts AS T1 JOIN postHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'	codebase_community
SELECT SUM(BountyAmount) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data%')	codebase_community
SELECT u.DisplayName  FROM users u  JOIN votes v ON u.Id = v.UserId  JOIN posts p ON v.PostId = p.Id  WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, ph.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN postLinks pl ON p.Id = pl.PostId JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' WHERE t.TagName = 'humor' GROUP BY p.Id, p.Title, ph.Text	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'	codebase_community
SELECT COUNT(UserId) FROM (SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) > 5)	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b1 ON u.Id = b1.UserId AND b1.Name = 'Teacher' JOIN badges b2 ON u.Id = b2.UserId AND b2.Name = 'Supporter' WHERE u.Location LIKE '%New York%'	codebase_community
SELECT users.Reputation FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE posts.Id = 1	codebase_community
SELECT UserId FROM postHistory GROUP BY PostId, UserId HAVING COUNT(*) = 1 JOIN posts ON postHistory.PostId = posts.Id WHERE posts.ViewCount >= 1000	codebase_community
SELECT b.Name  FROM badges b  JOIN (     SELECT UserId, COUNT(*) AS comment_count      FROM comments      GROUP BY UserId      ORDER BY comment_count DESC      LIMIT 1 ) c ON b.UserId = c.UserId	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Teacher' AND u.Location = 'India'	codebase_community
SELECT ((CAST(SUM(CASE WHEN Name = 'Student' AND STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) - (CAST(SUM(CASE WHEN Name = 'Student' AND STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) AS REAL) / COUNT(*))) * 100 FROM badges	codebase_community
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId;	codebase_community
SELECT T2.ViewCount FROM postLinks AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.RelatedPostId = 61217	codebase_community
SELECT T2.Score, T1.LinkTypeId FROM postLinks AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.PostId = 395	codebase_community
SELECT p.Id, ph.UserId FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Score > 60	codebase_community
SELECT SUM(p.FavoriteCount)  FROM postHistory ph  JOIN posts p ON ph.PostId = p.Id  WHERE ph.UserId = 686 AND STRFTIME('%Y', ph.CreationDate) = '2011'	codebase_community
SELECT AVG(u.UpVotes) AS AverageUpVotes, AVG(u.Age) AS AverageAge FROM users u JOIN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(Id) > 10 ) p ON u.Id = p.OwnerUserId	codebase_community
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE score > 60;	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'	codebase_community
SELECT COUNT(*) FROM posts WHERE Score = 10	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT T1.Reputation FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Pierre'	codebase_community
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN b.Name = 'Teacher' THEN b.UserId ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT u.Id) FROM badges b JOIN users u ON b.UserId = u.Id	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Organizer'	codebase_community
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT Age FROM users WHERE Id IN (SELECT UserId FROM badges) AND Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65	codebase_community
SELECT u.Views  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio FROM votes	codebase_community
SELECT T3.TagName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId JOIN postTags AS T4 ON T2.Id = T4.PostId JOIN tags AS T3 ON T4.TagId = T3.Id WHERE T1.DisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(*) FROM postHistory ph JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'Daniel Vassallo'	codebase_community
SELECT COUNT(*) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan'	codebase_community
SELECT p.Id FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1	codebase_community
SELECT p.ViewCount, u.DisplayName FROM postHistory ph JOIN posts p ON ph.PostId = p.Id JOIN users u ON ph.UserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY p.ViewCount DESC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT p.Id)  FROM posts p  JOIN postHistory ph ON p.Id = ph.PostId  JOIN users u ON ph.UserId = u.Id  JOIN votes v ON p.Id = v.PostId  WHERE u.DisplayName = 'Matt Parker' AND p.Id > 4	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60	codebase_community
SELECT DISTINCT T2.Tags FROM postHistory AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id JOIN users AS T3 ON T1.UserId = T3.Id WHERE T3.DisplayName = 'Mark Meckes' AND T2.CommentCount = 0	codebase_community
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN t.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ph.PostId) AS percentage FROM postHistory ph JOIN users u ON ph.UserId = u.Id LEFT JOIN posts p ON ph.PostId = p.Id LEFT JOIN postTags pt ON p.Id = pt.PostId LEFT JOIN tags t ON pt.TagId = t.Id WHERE u.DisplayName = 'Community'	codebase_community
SELECT SUM(CASE WHEN T2.DisplayName = 'Mornington' THEN T1.ViewCount ELSE 0 END) - SUM(CASE WHEN T2.DisplayName = 'Amos' THEN T1.ViewCount ELSE 0 END) AS ViewCountDifference FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'	codebase_community
SELECT COUNT(*) FROM postHistory WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND STRFTIME('%Y', b.Date) = '2011'	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.FavoriteCount > 150	codebase_community
SELECT COUNT(ph.Id) AS PostHistoryCount, p.LastEditDate FROM posts p LEFT JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY p.LastEditDate	codebase_community
SELECT T2.LastAccessDate, T2.Location FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Outliers'	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time')	codebase_community
SELECT ph.PostId, b.Name  FROM postHistory ph  JOIN badges b ON ph.UserId = b.UserId  WHERE ph.UserDisplayName = 'Samuel' AND STRFTIME('%Y', ph.CreationDate) = '2013' AND STRFTIME('%Y', b.Date) = '2013'	codebase_community
SELECT DisplayName FROM users WHERE Id = (SELECT OwnerUserId FROM posts ORDER BY ViewCount DESC LIMIT 1)	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT p.Title, pl.LinkTypeId  FROM postLinks pl  JOIN posts p ON pl.RelatedPostId = p.Id  WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'What are principal component scores?')	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ParentId = (SELECT ParentId FROM posts WHERE ParentId IS NOT NULL ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT u.DisplayName, u.WebsiteUrl  FROM users u  JOIN votes v ON u.Id = v.UserId  WHERE v.VoteTypeId = 8  ORDER BY v.BountyAmount DESC  LIMIT 1	codebase_community
SELECT Title FROM posts WHERE ViewCount IS NOT NULL ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(DISTINCT v.PostId) FROM votes v WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(pl.Id) AS REAL) / 12 AS AverageMonthlyLinks FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE strftime('%Y', pl.CreationDate) = '2010' AND p.AnswerCount <= 2	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId ORDER BY p.CreaionDate ASC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.DisplayName ORDER BY COUNT(T1.Id) DESC LIMIT 1	codebase_community
SELECT MIN(v.CreationDate) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl'	codebase_community
SELECT MIN(p.CreaionDate) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4	codebase_community
SELECT AVG(PostId) FROM votes WHERE UserId IN (SELECT Id FROM users WHERE Age = (SELECT MAX(Age) FROM users))	codebase_community
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', p.CreationDate) = '2010'	codebase_community
SELECT p.Id, p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner')	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreaionDate) = '2011'	codebase_community
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE STRFTIME('%Y', u.CreationDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN u.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE STRFTIME('%Y', p.CreaionDate) = '2011'	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) AS percentage FROM users	codebase_community
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id JOIN postHistory ph ON p.Id = ph.PostId WHERE ph.Text = 'Computer Game Datasets'	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC  LIMIT 1	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Emmett' ORDER BY T1.Date DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000	codebase_community
SELECT badges.Date - users.CreationDate AS TimeToBadge  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(DISTINCT p.Id) AS NumberOfPosts, COUNT(c.Id) AS NumberOfComments FROM users u JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON p.Id = c.PostId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users)	codebase_community
SELECT c.Text, c.UserDisplayName  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'Analysing wind data with R'  ORDER BY c.CreationDate DESC  LIMIT 10	codebase_community
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(*) FROM tags WHERE TagName = 'careers'	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT CommentCount, AnswerCount FROM posts WHERE Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30	codebase_community
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT users.Reputation, users.UpVotes  FROM users  JOIN comments ON users.Id = comments.UserId  WHERE comments.Text = 'fine, you win :)';	codebase_community
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%linear regression%')	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.ViewCount BETWEEN 100 AND 150  ORDER BY c.Score DESC  LIMIT 1	codebase_community
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.CreationDate LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = 0 AND p.ViewCount < 5	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1) AND Score = 0	codebase_community
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score = 0 AND u.Age = 40	codebase_community
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT T2.UpVotes FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'R is also lazy evaluated.'	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.UserId)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score BETWEEN 5 AND 10	codebase_community
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'	superhero
SELECT COUNT(DISTINCT hero_id) FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Super Strength')	superhero
SELECT COUNT(*) FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Super Strength' AND h.height_cm > 200	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id HAVING COUNT(hp.power_id) > 15	superhero
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue')	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(DISTINCT s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond')	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT superhero_name FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC	superhero
SELECT publisher_name FROM publisher WHERE id = (SELECT publisher_id FROM superhero WHERE superhero_name = 'Sauron')	superhero
SELECT c.colour, COUNT(s.id) as colour_count FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN colour c ON s.eye_colour_id = c.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY colour_count DESC	superhero
SELECT AVG(height_cm) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics'	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics'	superhero
SELECT publisher.publisher_name FROM publisher JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100	superhero
SELECT superhero_name FROM superhero WHERE id = (SELECT hero_id FROM hero_power GROUP BY hero_id ORDER BY COUNT(*) DESC LIMIT 1)	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT CAST(SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) AS percentage, SUM(CASE WHEN a.alignment = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS marvel_comics_count FROM superhero s JOIN alignment a ON s.alignment_id = a.id LEFT JOIN publisher p ON s.publisher_id = p.id	superhero
SELECT SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON sh.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour')	superhero
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56	superhero
SELECT T2.full_name FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Demi-God' LIMIT 5	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 169	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.height_cm = 185 AND T3.race = 'Human'	superhero
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id ORDER BY T2.weight_kg DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180	superhero
SELECT superhero_name FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT power_name FROM superpower WHERE id = (SELECT power_id FROM hero_power GROUP BY power_id ORDER BY COUNT(hero_id) DESC LIMIT 1)	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT T1.power_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T2.hero_id = 1	superhero
SELECT COUNT(DISTINCT hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth'	superhero
SELECT s.full_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1	superhero
SELECT CAST(COUNT(CASE WHEN T2.id = 1 THEN T1.id ELSE NULL END) AS REAL) / COUNT(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'	superhero
SELECT superhero_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'Flight'))	superhero
SELECT T3.eye_colour_id, T3.hair_colour_id, T3.skin_colour_id FROM gender AS T1 JOIN superhero AS T3 ON T1.id = T3.gender_id JOIN publisher AS T2 ON T3.publisher_id = T2.id WHERE T1.gender = 'Female' AND T2.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name, p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.skin_colour_id = c.id WHERE g.gender = 'Female'	superhero
SELECT T1.superhero_name, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation'	superhero
SELECT COUNT(DISTINCT power_id) FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo')	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'	superhero
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Black') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Black')	superhero
SELECT DISTINCT c.colour FROM colour c JOIN superhero s ON s.eye_colour_id = c.id JOIN colour sc ON s.skin_colour_id = sc.id WHERE sc.colour = 'Gold'	superhero
SELECT T2.full_name FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Vampire'	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))	superhero
SELECT r.race, a.alignment  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN alignment a ON s.alignment_id = a.id  WHERE s.superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS difference	superhero
SELECT AVG(height_cm) AS average_height FROM superhero;	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3	superhero
SELECT a.attribute_name, ha.attribute_value  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_id = a.id  JOIN superhero s ON ha.hero_id = s.id  WHERE s.superhero_name = '3-D Man'	superhero
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Brown')	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id IS NULL OR publisher_id NOT IN (SELECT id FROM publisher)	superhero
SELECT CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS ratio FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.weight_kg = 108 AND T2.height_cm = 188	superhero
SELECT publisher_name FROM publisher WHERE id = (SELECT publisher_id FROM superhero WHERE id = 38)	superhero
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id JOIN hero_attribute AS T3 ON T2.id = T3.hero_id ORDER BY T3.attribute_value DESC LIMIT 1	superhero
SELECT T4.alignment, T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id JOIN superhero_details AS T4 ON T1.id = T4.hero_id WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(T2.attribute_value) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3	superhero
SELECT c.colour FROM colour c JOIN superhero s ON c.id = s.skin_colour_id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1	superhero
SELECT superhero_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_attribute WHERE attribute_value BETWEEN 75 AND 80)	superhero
SELECT race.race FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN colour ON superhero.hair_colour_id = colour.id JOIN race ON superhero.race_id = race.id WHERE gender.gender = 'Male' AND colour.colour = 'Blue'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.id = 2	superhero
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL	superhero
SELECT T3.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad'	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Wind Control' ORDER BY s.superhero_name	superhero
SELECT g.gender FROM gender g JOIN superhero s ON g.id = s.gender_id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force'	superhero
SELECT superhero_name FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics') ORDER BY weight_kg DESC LIMIT 1	superhero
SELECT AVG(height_cm) FROM superhero WHERE race_id != (SELECT id FROM race WHERE race = 'Human') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100	superhero
SELECT SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id	superhero
SELECT T1.attribute_name FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1	superhero
SELECT colour FROM colour WHERE id = (SELECT eye_colour_id FROM superhero WHERE superhero_name = 'Abomination')	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T2.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT superhero.full_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown'	superhero
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy'	superhero
SELECT T2.weight_kg, T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT T1.hero_id FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'	superhero
SELECT colour FROM colour WHERE id = (SELECT eye_colour_id FROM superhero WHERE superhero_name = 'Blackwulf')	superhero
SELECT DISTINCT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT driverRef FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying WHERE raceId = 20 ORDER BY q1 DESC LIMIT 5)	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 ORDER BY T2.q2 ASC LIMIT 1	formula_1
SELECT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai'	formula_1
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Germany'	formula_1
SELECT T2.position FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.name = 'Renault'	formula_1
SELECT COUNT(*) FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.country NOT IN ('Malaysia', 'Bahrain', 'Spain', 'Turkey', 'Monaco')	formula_1
SELECT r.name FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Spain'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'	formula_1
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT c.nationality  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE cr.raceId = 24 AND cr.points = 1	formula_1
SELECT q.q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 355 AND T2.q2 = '0:01:40'	formula_1
SELECT T1.number FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 903 AND T2.q3 LIKE '1:54%'	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007) AND time IS NULL	formula_1
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1	formula_1
SELECT d.forename, d.surname, d.url  FROM drivers d  JOIN lapTimes l ON d.driverId = l.driverId  WHERE l.raceId = 161 AND l.time LIKE '1:27%'	formula_1
SELECT d.nationality  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.raceId = 933  ORDER BY CAST(REPLACE(r.fastestLapSpeed, ',', '.') AS REAL) DESC  LIMIT 1	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Malaysian Grand Prix'	formula_1
SELECT c.url  FROM constructors c  JOIN constructorResults cr ON c.constructorId = cr.constructorId  WHERE cr.raceId = 9  ORDER BY cr.points DESC  LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceId = 345	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 347 AND T2.q2 = '1:15'	formula_1
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 = '0:01:33'	formula_1
SELECT T1.time FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceId = 743	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2	formula_1
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId != 1	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE l.raceId = 348 ORDER BY l.time ASC LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY CAST(REPLACE(trim(T2.fastestLapSpeed, 'km/h'), ',', '.') AS REAL) DESC LIMIT 1	formula_1
SELECT ((r1.fastestLapSpeed - r2.fastestLapSpeed) / r1.fastestLapSpeed) * 100 AS percentage FROM results r1 JOIN results r2 ON r1.raceId = 853 AND r2.raceId = 854 JOIN drivers d ON r1.driverId = d.driverId WHERE d.forename = 'Paul' AND d.surname = 'di Resta'	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 LEFT JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '1983-07-16'	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'	formula_1
SELECT COUNT(*), name FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT name FROM races WHERE date = (SELECT MIN(date) FROM races)	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1	formula_1
SELECT `year` FROM `races` GROUP BY `year` ORDER BY COUNT(`round`) DESC LIMIT 1	formula_1
SELECT name FROM races WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000)	formula_1
SELECT c.country, c.name, c.location  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE c.country IN ('Spain', 'Italy', 'France', 'Germany', 'UK', 'Belgium', 'Netherlands', 'Hungary', 'Austria', 'Switzerland')  ORDER BY r.year ASC  LIMIT 1	formula_1
SELECT MAX(r.year) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch' AND r.name = 'British Grand Prix'	formula_1
SELECT COUNT(*) FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.name = 'British Grand Prix' AND c.name = 'Silverstone Circuit'	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid JOIN races r ON ds.raceid = r.raceid WHERE r.name = 'Singapore Grand Prix' AND r.year = 2010 ORDER BY ds.position	formula_1
SELECT d.forename, d.surname, ds.points  FROM drivers d  JOIN driverstandings ds ON d.driverid = ds.driverid  ORDER BY ds.points DESC  LIMIT 1	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid JOIN races r ON ds.raceid = r.raceid WHERE r.name = 'Chinese Grand Prix' AND r.year = 2017 ORDER BY ds.points DESC LIMIT 3	formula_1
SELECT d.forename, d.surname, r.name  FROM lapTimes lt  JOIN drivers d ON lt.driverId = d.driverId  JOIN races r ON lt.raceId = r.raceId  WHERE lt.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)	formula_1
SELECT AVG(laptimes.milliseconds) FROM laptimes JOIN drivers ON laptimes.driverid = drivers.driverid JOIN races ON laptimes.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009	formula_1
SELECT CAST(SUM(CASE WHEN ds.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ds.raceId)  FROM driverStandings ds  JOIN drivers d ON ds.driverId = d.driverId  JOIN races r ON ds.raceId = r.raceId  WHERE d.surname = 'Hamilton' AND r.year >= 2010	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(ds.points) AS max_points FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid GROUP BY d.driverid ORDER BY SUM(ds.wins) DESC, max_points DESC LIMIT 1	formula_1
SELECT forename, surname, YEAR(CURRENT_TIMESTAMP) - YEAR(dob) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE STRFTIME('%Y', r.date) BETWEEN '1990' AND '2000' GROUP BY c.circuitid HAVING COUNT(r.raceid) = 4	formula_1
SELECT c.name, c.location, r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006	formula_1
SELECT r.name, c.name, c.location  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005	formula_1
SELECT races.name  FROM results  JOIN races ON results.raceId = races.raceId  JOIN drivers ON results.driverId = drivers.driverId  WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20	formula_1
SELECT COUNT(*)  FROM driverStandings ds  JOIN races r ON ds.raceId = r.raceId  JOIN circuits c ON r.circuitId = c.circuitId  JOIN drivers d ON ds.driverId = d.driverId  WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' AND ds.wins = (SELECT MAX(wins) FROM driverStandings WHERE raceId = ds.raceId)	formula_1
SELECT r.name, r.year  FROM races r  JOIN laptimes lt ON r.raceid = lt.raceid  JOIN drivers d ON lt.driverid = d.driverid  WHERE d.forename = 'Michael' AND d.surname = 'Schumacher'  ORDER BY lt.milliseconds ASC  LIMIT 1	formula_1
SELECT AVG(ds.points) FROM driverStandings ds JOIN races r ON ds.raceId = r.raceId JOIN drivers d ON ds.driverId = d.driverId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND r.year = 2000	formula_1
SELECT r.name, ds.points FROM races r JOIN driverstandings ds ON r.raceid = ds.raceid JOIN drivers d ON ds.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.year ASC LIMIT 1	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.year = 2017 ORDER BY r.date	formula_1
SELECT r.name, r.year, c.location  FROM races r  JOIN circuits c ON r.circuitid = c.circuitid  JOIN (SELECT raceid, COUNT(lap) AS lap_count FROM laptimes GROUP BY raceid ORDER BY lap_count DESC LIMIT 1) lt ON r.raceid = lt.raceid	formula_1
SELECT CAST(SUM(IIF(T1.country = 'Germany' AND T2.name = 'European Grand Prix', 1, 0)) AS REAL) * 100 / COUNT(T2.name) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit'	formula_1
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit'	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Abu Dhabi Circuit' AND T1.year = 2010	formula_1
SELECT COUNT(*) FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy'	formula_1
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT MIN(fastestLapTime) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId ORDER BY r.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2007 AND T2.positionOrder = 1	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT races.name FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.rank ASC LIMIT 1	formula_1
SELECT MAX(r.fastestLapSpeed) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2009 AND ra.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T1.positionOrder FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T2.name = 'Chinese Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.year = 1989 AND T3.name = 'Australian Grand Prix' AND T1.grid = 4	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL	formula_1
SELECT T3.fastestLap FROM drivers AS T1 JOIN results AS T3 ON T1.driverId = T3.driverId JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.name = 'Australian Grand Prix' AND T2.year = 2008	formula_1
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Chinese Grand Prix' AND T2.position = 2	formula_1
SELECT d.forename, d.surname, d.url  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time LIKE '%:%:%.%'	formula_1
SELECT COUNT(*) FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN drivers AS d ON r.driverId = d.driverId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND d.nationality = 'British'	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Chinese Grand Prix' AND T1.time IS NOT NULL	formula_1
SELECT SUM(points) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(CAST(SUBSTR(T2.fastestLapTime, 4) AS REAL) + CAST(SUBSTR(T2.fastestLapTime, 1, 2) * 60 AS REAL)) AS average_fastest_lap_time_seconds FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'	formula_1
SELECT ((SUBSTR(T2.time, INSTR(T2.time, ':') + 1) - SUBSTR(T1.time, INSTR(T1.time, ':') + 1)) / SUBSTR(T2.time, INSTR(T2.time, ':') + 1)) * 100 AS percentage_difference FROM results AS T1 JOIN races AS T3 ON T1.raceId = T3.raceId JOIN (     SELECT raceId, MAX(positionOrder) AS last_position     FROM results     GROUP BY raceId ) AS T4 ON T1.raceId = T4.raceId AND T1.positionOrder = T4.last_position JOIN results AS T2 ON T1.raceId = T2.raceId AND T2.positionOrder = 1 WHERE T3.name = 'Australian Grand Prix' AND T3.year = 2008	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Melbourne' AND country = 'Australia'	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-12-31'	formula_1
SELECT MAX(T1.points) FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'British'	formula_1
SELECT c.name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId ORDER BY cs.points DESC LIMIT 1	formula_1
SELECT c.name FROM constructors c JOIN constructorstandings cs ON c.constructorid = cs.constructorid WHERE cs.raceid = 291 AND cs.points = 0	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Japanese' AND cs.points = 0  GROUP BY c.constructorId  HAVING COUNT(cs.raceId) = 2	formula_1
SELECT T1.name FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.rank = 1	formula_1
SELECT COUNT(*) FROM results r JOIN constructors c ON r.constructorId = c.constructorId WHERE c.nationality = 'French' AND r.laps > 50	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId)  FROM results AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  JOIN drivers AS T3 ON T1.driverId = T3.driverId  WHERE T3.nationality = 'Japanese' AND T2.year BETWEEN 2007 AND 2009	formula_1
SELECT r.year, AVG(CAST(SUBSTR(r.time, 1, INSTR(r.time, ':') - 1) AS INTEGER) * 3600 + CAST(SUBSTR(r.time, INSTR(r.time, ':') + 1, INSTR(r.time, ':', INSTR(r.time, ':') + 1) - INSTR(r.time, ':') - 1) AS INTEGER) * 60 + CAST(REPLACE(SUBSTR(r.time, INSTR(r.time, ':', INSTR(r.time, ':') + 1) + 1), '.', '') AS REAL) / 1000) AS avg_time_seconds FROM results r JOIN status s ON r.statusId = s.statusId WHERE r.year < 1975 AND s.status = 'Finished' AND r.position = 1 GROUP BY r.year	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob > '1975-12-31' AND r.rank = 2	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'Italian' AND driverId NOT IN (SELECT driverId FROM results)	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapTime ASC LIMIT 1	formula_1
SELECT T2.fastestLap FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T2.time LIKE '%:%:%.%'	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'	formula_1
SELECT r.name, r.year FROM races r JOIN results re ON r.raceId = re.raceId WHERE re.milliseconds IS NOT NULL ORDER BY re.milliseconds ASC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN d.dob < '1985-01-01' AND r.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(r.driverId) FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year BETWEEN 2000 AND 2005	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN lapTimes l ON d.driverId = l.driverId  WHERE d.nationality = 'French' AND        (SUBSTR(l.time, 1, INSTR(l.time, ':') - 1) * 60 + SUBSTR(l.time, INSTR(l.time, ':') + 1)) < 120	formula_1
SELECT code FROM drivers WHERE nationality = 'America'	formula_1
SELECT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM driverStandings WHERE raceId = 18	formula_1
SELECT dob, nationality FROM drivers ORDER BY dob DESC LIMIT 3;   SELECT COUNT(*) FROM (SELECT dob, nationality FROM drivers ORDER BY dob DESC LIMIT 3) AS top_drivers WHERE nationality = 'Dutch';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'	formula_1
SELECT d.driverId, d.dob, d.nationality, ps.time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1990' ORDER BY ps.time ASC LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE strftime('%Y', d.dob) = '1971' ORDER BY r.fastestLapTime ASC LIMIT 1	formula_1
SELECT d.driverId, d.dob, d.nationality, ps.time FROM drivers d JOIN pitStops ps ON d.driverId = ps.driverId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' ORDER BY ps.time DESC LIMIT 10	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T2.fastestLapTime ASC LIMIT 1	formula_1
SELECT r.year  FROM races r  JOIN lapTimes l ON r.raceId = l.raceId  GROUP BY r.year  ORDER BY MAX(l.time) DESC  LIMIT 1	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY CAST(SUBSTR(time, 1, INSTR(time, ':') - 1) AS REAL) * 60 + CAST(SUBSTR(time, INSTR(time, ':') + 1) AS REAL) ASC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 51 AND 99 AND statusId = 2 AND time IS NOT NULL	formula_1
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria'	formula_1
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL	formula_1
SELECT races.year, drivers.forename, drivers.surname, races.date, qualifying.q1  FROM qualifying  JOIN races ON qualifying.raceId = races.raceId  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE drivers.dob = (     SELECT MAX(dob) FROM drivers )  ORDER BY races.date ASC  LIMIT 1	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  JOIN status s ON r.statusId = s.statusId  WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1	formula_1
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId ORDER BY T2.wins DESC LIMIT 1	formula_1
SELECT T2.driverId FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'French Grand Prix' AND T2.lap = 3 ORDER BY T2.time DESC LIMIT 1	formula_1
SELECT raceId, MIN(milliseconds) AS fastest_time_ms FROM lapTimes WHERE lap = 1 GROUP BY raceId ORDER BY fastest_time_ms ASC LIMIT 1	formula_1
SELECT AVG(fastestLapTime) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix') AND rank < 11	formula_1
SELECT d.forename, d.surname, AVG(p.duration) as avg_duration FROM drivers d JOIN pitstops p ON d.driverid = p.driverid WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverid ORDER BY avg_duration ASC LIMIT 3	formula_1
SELECT r.time, ra.name FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.time LIKE '%:%:%.%'	formula_1
SELECT c.constructorRef, c.url  FROM constructors c  JOIN results r ON c.constructorId = r.constructorId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.year = 2009 AND ra.name = 'Singapore Grand Prix'  ORDER BY r.time ASC  LIMIT 1	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'	formula_1
SELECT forename || ' ' || surname AS full_name, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC	formula_1
SELECT name, country, lat, lng FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT cr.points, c.name, c.nationality FROM constructorResults cr JOIN constructors c ON cr.constructorId = c.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 ORDER BY cr.points DESC LIMIT 1	formula_1
SELECT AVG(points) FROM driverStandings WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId IN (SELECT raceId FROM races WHERE name LIKE '%Turkish Grand Prix%')	formula_1
SELECT AVG(race_count) AS annual_average_races FROM (     SELECT YEAR(date) AS race_year, COUNT(*) AS race_count     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY YEAR(date) ) AS yearly_races;	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT wins FROM driverStandings WHERE points = (SELECT DISTINCT points FROM driverStandings ORDER BY points DESC LIMIT 1 OFFSET 90)	formula_1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId ORDER BY res.fastestLapTime ASC LIMIT 1	formula_1
SELECT T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T3.year = 2008 AND T4.name = 'Marina Bay Street Circuit' ORDER BY T2.q3 ASC LIMIT 1	formula_1
SELECT d.forename || ' ' || d.surname AS fullname, d.nationality, r.name AS first_race_name FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid JOIN races r ON ds.raceid = r.raceid WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY ds.raceid ASC LIMIT 1	formula_1
SELECT COUNT(*) AS numberOfAccidents FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident' GROUP BY r.driverId ORDER BY numberOfAccidents DESC LIMIT 1	formula_1
SELECT d.forename, d.surname, ds.wins  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  WHERE d.dob = (SELECT MIN(dob) FROM drivers)	formula_1
SELECT MAX(duration) FROM pitStops	formula_1
SELECT MIN(time) FROM lapTimes	formula_1
SELECT MAX(T2.duration) FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT T3.lap FROM drivers AS T1 JOIN pitStops AS T3 ON T1.driverId = T3.driverId JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.name = 'Australian Grand Prix' AND T2.year = 2011	formula_1
SELECT T2.duration FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix'	formula_1
SELECT MIN(time) FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT d.forename, d.surname  FROM drivers d  JOIN laptimes l ON d.driverid = l.driverid  ORDER BY l.time ASC  LIMIT 20	formula_1
SELECT T2.position FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.time ASC LIMIT 1	formula_1
SELECT MIN(T3.fastestLapTime) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId JOIN results AS T3 ON T2.raceId = T3.raceId WHERE T2.name = 'Austrian Grand Prix'	formula_1
SELECT MIN(time) AS lap_record, c.circuitId, c.country FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE c.country = 'Italy' GROUP BY c.circuitId, c.country	formula_1
SELECT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  JOIN results res ON r.raceId = res.raceId  WHERE c.name = 'Austrian Grand Prix Circuit'  ORDER BY res.time ASC  LIMIT 1	formula_1
SELECT ps.duration FROM pitStops ps JOIN races r ON ps.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'Austrian Grand Prix' AND ps.driverId = (     SELECT res.driverId     FROM results res     JOIN races r ON res.raceId = r.raceId     JOIN circuits c ON r.circuitId = c.circuitId     WHERE r.name = 'Austrian Grand Prix'     ORDER BY res.position ASC     LIMIT 1 )	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitId = r.circuitId JOIN lapTimes l ON r.raceId = l.raceId WHERE l.time = '1:29.488'	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(milliseconds) FROM lapTimes WHERE raceId IN (SELECT raceId FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy'))	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'	european_football_2
SELECT id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5	european_football_2
SELECT L.name  FROM League L  JOIN Match M ON L.id = M.league_id  WHERE M.season = '2015/2016'  GROUP BY L.name  ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC  LIMIT 1	european_football_2
SELECT home_team, COUNT(*) AS losses FROM matches WHERE season = '2015/2016' AND home_team_goal < away_team_goal GROUP BY home_team ORDER BY losses ASC LIMIT 1;	european_football_2
SELECT player_name FROM players ORDER BY penalties DESC LIMIT 10	european_football_2
SELECT T1.team_long_name  FROM Team AS T1  JOIN Match AS M ON T1.team_api_id = M.away_team_api_id  JOIN League AS L ON M.league_id = L.league_id  WHERE L.name = 'Scotland Premier League' AND M.season = '2009/2010' AND M.away_team_goal > M.home_team_goal  GROUP BY T1.team_long_name  ORDER BY COUNT(*) DESC  LIMIT 1	european_football_2
SELECT teamName, buildUpPlaySpeed FROM teams ORDER BY buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016' AND M.home_team_goal = M.away_team_goal  GROUP BY L.name  ORDER BY COUNT(*) DESC  LIMIT 1	european_football_2
SELECT TIMESTAMPDIFF(YEAR, birthday, CURDATE()) AS age FROM Player WHERE id IN (SELECT player_id FROM SprintSpeed WHERE sprint_speed >= 97 AND YEAR(date) BETWEEN 2013 AND 2015)	european_football_2
SELECT l.name, COUNT(m.match_id) AS match_count FROM leagues l JOIN matches m ON l.league_id = m.league_id GROUP BY l.league_id, l.name ORDER BY match_count DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT DISTINCT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60	european_football_2
SELECT team_long_name FROM table_name WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM table_name WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL)	european_football_2
SELECT (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0 / COUNT(player_fifa_api_id)) AS percentage_left_foot_players FROM players WHERE YEAR(birthday) BETWEEN 1987 AND 1992;	european_football_2
SELECT league_name, SUM(home_team_goal + away_team_goal) AS total_goals FROM matches GROUP BY league_name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT SUM(long_shots) / COUNT(player_fifa_api_id) AS average_long_shots FROM player_attributes WHERE player_name = 'Ahmed Samir Farag';	european_football_2
SELECT Player.name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height > 180 GROUP BY Player.name ORDER BY AVG(Player_Attributes.heading_accuracy) DESC LIMIT 10;	european_football_2
SELECT team_long_name  FROM your_table_name  WHERE buildUpPlayDribblingClass = 'Normal'  AND date >= '2014-01-01 00:00:00'  AND date <= '2014-12-31 23:59:59'  AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM your_table_name WHERE date >= '2014-01-01 00:00:00' AND date <= '2014-12-31 23:59:59')  ORDER BY chanceCreationPassing DESC	european_football_2
SELECT League.name  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.season = '2009/2010'  GROUP BY League.name  HAVING AVG(Match.home_team_goal) > AVG(Match.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10'	european_football_2
SELECT attacking_work_rate FROM players WHERE name = 'Franco Zennaro';	european_football_2
SELECT buildUpPlayPositioningClass FROM teams WHERE team_long_name = 'ADO Den Haag'	european_football_2
SELECT heading_accuracy FROM players WHERE name = 'Francois Affolter' AND date = '2014-09-18 00:00:00';	european_football_2
SELECT overall_rating FROM player_ratings WHERE player_name = 'Gabriel Tamas' AND strftime('%Y', date) = '2011'	european_football_2
SELECT COUNT(*) FROM Match INNER JOIN League ON Match.league_id = League.id WHERE League.name = 'Scotland Premier League' AND Match.season = '2015/2016';	european_football_2
SELECT preferred_foot FROM players ORDER BY birthday DESC LIMIT 1	european_football_2
SELECT potential FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM players WHERE weight < 130 AND preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM teams WHERE chanceCreationPassingClass = 'Risky'	european_football_2
SELECT defensive_work_rate FROM players WHERE name = 'David Wilson';	european_football_2
SELECT birthday FROM players ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT League.name FROM League INNER JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands'	european_football_2
SELECT AVG(home_team_goal)  FROM Match  JOIN League ON Match.league_id = League.id  WHERE League.name = 'Poland' AND Match.season = '2010/2011';	european_football_2
SELECT p.player_api_id, AVG(pa.finishing) AS avg_finishing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height IN ((SELECT MAX(height) FROM Player), (SELECT MIN(height) FROM Player)) GROUP BY p.player_api_id ORDER BY avg_finishing DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT player_name FROM players WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010'	european_football_2
SELECT potential FROM players WHERE first_name = 'Aaron' AND last_name = 'Doran';	european_football_2
SELECT * FROM players WHERE preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT buildUpPlayPassingClass FROM teams WHERE team_short_name = 'CLB'	european_football_2
SELECT team_short_name FROM teams WHERE buildUpPlayPassing > 70	european_football_2
SELECT AVG(t2.overall_rating) FROM Player AS t1 JOIN Player_Stats AS t2 ON t1.id = t2.player_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170	european_football_2
SELECT name FROM players ORDER BY height ASC LIMIT 1	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A'	european_football_2
SELECT team_short_name FROM table_name WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32	european_football_2
SELECT AVG(overall_rating) FROM players WHERE name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10'	european_football_2
SELECT DISTINCT team_short_name FROM matches WHERE home_team_goal = 10	european_football_2
SELECT * FROM players WHERE potential = 61 ORDER BY balance DESC LIMIT 1	european_football_2
SELECT      (SUM(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Abdou Diallo' THEN id ELSE NULL END)) -     (SUM(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE 0 END) / COUNT(CASE WHEN player_name = 'Aaron Appindangoye' THEN id ELSE NULL END)) AS difference FROM players	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)	european_football_2
SELECT COUNT(player_api_id) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Belgium Jupiler League'	european_football_2
SELECT League.name  FROM League  JOIN Country ON League.country_id = Country.id  WHERE Country.name = 'Germany';	european_football_2
SELECT player_name FROM players ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT COUNT(DISTINCT player_id) FROM players WHERE strftime('%Y', birthday) < '1986' AND defensive_work_rate = 'high';	european_football_2
SELECT name FROM players WHERE name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1	european_football_2
SELECT heading_accuracy FROM pilots WHERE name = 'Ariel Borysiuk';	european_football_2
SELECT COUNT(*) FROM players WHERE height > 180 AND volleys > 70	european_football_2
SELECT name FROM players WHERE volleys > 70 AND dribbling > 70	european_football_2
SELECT COUNT(*)  FROM Match  JOIN Country ON Match.Country_ID = Country.Country_ID  WHERE Country.name = 'Belgium' AND Match.Season = '2008/2009'	european_football_2
SELECT long_passing FROM players ORDER BY birthday ASC LIMIT 1;	european_football_2
SELECT COUNT(*) FROM `Match` INNER JOIN League ON `Match`.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(`Match`.`date`, 1, 7) = '2009-04'	european_football_2
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2008/2009' GROUP BY L.name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT AVG(overall_rating) FROM players WHERE strftime('%Y', birthday) < '1986'	european_football_2
SELECT ((MAX(CASE WHEN player_name = 'Ariel Borysiuk' THEN overall_rating END) - MAX(CASE WHEN player_name = 'Paulin Puel' THEN overall_rating END)) / MAX(CASE WHEN player_name = 'Paulin Puel' THEN overall_rating END)) * 100 AS percentage_difference FROM players	european_football_2
SELECT AVG(buildUpPlaySpeed) FROM TeamAttributes WHERE team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM players AS T1 WHERE T1.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing)  FROM player_attributes AS T1  JOIN players AS T2  ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(chanceCreationPassing) AS highest_chance_creation_passing_score, chanceCreationPassingClass  FROM your_table_name  WHERE team_long_name = 'Ajax'	european_football_2
SELECT preferred_foot FROM players WHERE player_name = 'Abdou Diallo';	european_football_2
SELECT MAX(T1.overall_rating) FROM player_stats AS T1 JOIN players AS T2 ON T1.player_id = T2.player_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(T1.away_team_goal) FROM Match AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.away_team_long_name = 'Parma' AND T2.name = 'Italy'	european_football_2
SELECT name FROM players WHERE overall_rating = 77 AND date LIKE '2016-06-23%' ORDER BY birthday ASC LIMIT 1	european_football_2
SELECT overall_rating FROM player_ratings WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%';	european_football_2
SELECT potential FROM players WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'	european_football_2
SELECT attacking_work_rate FROM player_stats WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%'	european_football_2
SELECT defensive_work_rate FROM player_stats WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'	european_football_2
SELECT date FROM Player_Attributes WHERE player_name = 'Kevin Constant' ORDER BY crossing DESC LIMIT 1	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id JOIN Team AS T3 ON T1.team_api_id = T3.team_api_id WHERE T3.team_long_name = 'Willem II' AND T2.date = '2012-02-22'	european_football_2
SELECT build_up_play_dribbling FROM team_attributes WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'	european_football_2
SELECT buildUpPlayPassing FROM match WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%'	european_football_2
SELECT chance_creation_passing_class FROM match_events WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'	european_football_2
SELECT chance_creation_crossing FROM match_stats WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'	european_football_2
SELECT T1.defence_aggression FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND DATE(T1.date) = '2015-09-10'	european_football_2
SELECT AVG(overall_rating) FROM player_ratings WHERE player_name = 'Marko Arnautovic' AND SUBSTRING(date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT ((MAX(CASE WHEN player_name = 'Landon Donovan' THEN overall_rating END) - MAX(CASE WHEN player_name = 'Jordan Bowery' THEN overall_rating END)) / MAX(CASE WHEN player_name = 'Landon Donovan' THEN overall_rating END)) * 100 AS percentage_difference FROM player_ratings WHERE date = '2013-07-12' AND player_name IN ('Landon Donovan', 'Jordan Bowery')	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE strftime('%Y', datetime(CURRENT_TIMESTAMP, 'localtime')) - strftime('%Y', birthday) - (strftime('%m-%d', datetime(CURRENT_TIMESTAMP, 'localtime')) < strftime('%m-%d', birthday)) >= 35	european_football_2
SELECT SUM(home_team_goals)  FROM matches  JOIN goals ON matches.match_id = goals.match_id  WHERE player_name = 'Aaron Lennon' AND (home_team_player_id = player_id OR away_team_player_id = player_id)	european_football_2
SELECT SUM(away_team_goals)  FROM matches  WHERE match_id IN (     SELECT match_id      FROM goals      WHERE player_name = 'Daan Smith' AND team_type = 'away'     UNION     SELECT match_id      FROM goals      WHERE player_name = 'Filipe Ferreira' AND team_type = 'away' )	european_football_2
SELECT SUM(home_team_goals)  FROM Player  JOIN Matches ON Player.id = Matches.player_id  WHERE (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', Player.birthday) -         (strftime('%m-%d', CURRENT_TIMESTAMP) < strftime('%m-%d', Player.birthday))) <= 30	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.strength DESC LIMIT 1	european_football_2
SELECT name FROM players WHERE potential = (SELECT MAX(potential) FROM players)	european_football_2
SELECT name FROM players WHERE attacking_work_rate = 'high';	european_football_2
SELECT name FROM players WHERE finishing = 1 ORDER BY datetime(CURRENT_TIMESTAMP, 'localtime') - datetime(birthday) DESC LIMIT 1	european_football_2
SELECT player_name FROM players WHERE country = 'Belgium';	european_football_2
SELECT player_id, country FROM players WHERE vision > 89	european_football_2
SELECT country, AVG(weight) AS avg_weight FROM players GROUP BY country ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM teams WHERE buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT team_short_name FROM table_name WHERE chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(height) FROM Player WHERE id IN (SELECT player_id FROM CountryPlayer WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT (SELECT jumping FROM players WHERE id = 6) - (SELECT jumping FROM players WHERE id = 23) AS difference	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'	european_football_2
SELECT (COUNT(CASE WHEN stamina > 80 AND strength > 80 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS percentage FROM Player_Attributes	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Poland Ekstraklasa'	european_football_2
SELECT home_team_goal, away_team_goal  FROM Match  JOIN League ON Match.league_id = League.id  WHERE Match.date LIKE '2008-09-24%' AND League.name = 'Belgium Jupiler League'	european_football_2
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin'	european_football_2
SELECT buildUpPlaySpeedClass FROM teams WHERE team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM games WHERE season = '2015/2016' AND league = 'Italian Serie A';	european_football_2
SELECT MAX(home_team_goal) AS highest_home_team_score FROM matches WHERE league = 'Netherlands Eredivisie';	european_football_2
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.weight = (SELECT MAX(weight) FROM Player)	european_football_2
SELECT L.name, COUNT(M.id) AS game_count  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016'  GROUP BY L.name  ORDER BY game_count DESC  LIMIT 4	european_football_2
SELECT T1.team_long_name  FROM Team AS T1  JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id  GROUP BY T1.team_long_name  ORDER BY SUM(T2.away_team_goal) DESC  LIMIT 1	european_football_2
SELECT overall_rating FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT (COUNT(CASE WHEN height < 180 AND overall_rating > 70 THEN id ELSE NULL END) * 100.0 / COUNT(id)) AS percentage FROM players	european_football_2
SELECT      (COUNT(CASE WHEN Admission = '+' THEN 1 END) - COUNT(CASE WHEN Admission = '-' THEN 1 END)) AS deviation,     ((COUNT(CASE WHEN Admission = '+' THEN 1 END) * 100.0 / COUNT(*)) - (COUNT(CASE WHEN Admission = '-' THEN 1 END) * 100.0 / COUNT(*))) AS percentage_deviation FROM Patient WHERE SEX = 'M'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM Patient WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT Diagnosis, Date FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.ID = 30609	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Examination.`Examination Date`, Examination.Symptoms  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.ID = 163109	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH > 500	thrombosis_prediction
SELECT P.ID, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 2	thrombosis_prediction
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1937 AND l.`T-CHO` >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN P.SEX = 'F' AND (L.TP < 6.0 OR L.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.ID) FROM Patient P LEFT JOIN Laboratory L ON P.ID = L.ID	thrombosis_prediction
SELECT AVG(E.`aCL IgG`) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Admission = '+' AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) >= 50	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '-'	thrombosis_prediction
SELECT YEAR(`First Date`) - YEAR(Birthday) AS Age FROM Patient WHERE Birthday IS NOT NULL ORDER BY Age ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.`Examination Date` LIKE '1997%' AND e.Thrombosis = 1 AND p.SEX = 'F'	thrombosis_prediction
SELECT MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday)) AS AgeGap FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200	thrombosis_prediction
SELECT E.Symptoms, E.Diagnosis FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Birthday = (SELECT MAX(Birthday) FROM Patient) AND E.Symptoms IS NOT NULL	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT p.ID) AS REAL) / 12 AS AverageMalePatientsPerMonth FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT MAX(L.Date), strftime('%Y', P.`First Date`) - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN P.SEX = 'M' AND L.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN P.SEX = 'F' AND L.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio FROM Patient P JOIN Laboratory L ON P.ID = L.ID	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE ID NOT IN (SELECT ID FROM Examination WHERE strftime('%Y', `Examination Date`) - strftime('%Y', `First Date`) >= 1)	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE YEAR(E.`Examination Date`) BETWEEN 1990 AND 1993  AND TIMESTAMPDIFF(YEAR, P.Birthday, E.`Examination Date`) < 18	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-BIL` >= 2.0	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-31'	thrombosis_prediction
SELECT (strftime('%Y', L.Date) - strftime('%Y', P.Birthday)) AS Age, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HGB = (SELECT MAX(HGB) FROM Laboratory)	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT CASE WHEN T.`T-CHO` < 250 THEN 'Normal' ELSE 'Not Normal' END AS CholesterolStatus FROM Laboratory AS T WHERE T.ID = 2927464 AND T.Date = '1995-09-04'	thrombosis_prediction
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1	thrombosis_prediction
SELECT T1.`aCL IgM` FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Description = '1994-02-19' AND T2.Diagnosis = 'SLE' AND T1.`Examination Date` = '1993-11-12'	thrombosis_prediction
SELECT P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT = 9 AND L.Date = '1992-06-12'	thrombosis_prediction
SELECT TIMESTAMPDIFF(YEAR, P.Birthday, L.Date) AS Age  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.UA = 8.4 AND L.Date = '1991-10-21'	thrombosis_prediction
SELECT COUNT(L.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.`First Date` = '1991-06-13' AND P.Diagnosis = 'SJS' AND strftime('%Y', L.Date) = '1995'	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`Examination Date` = '1997-01-27' AND Examination.Diagnosis LIKE '%SLE%'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE ID = (SELECT ID FROM Patient WHERE Birthday = '1959-03-01') AND `Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT (SUM(CASE WHEN L.Date LIKE '1981-11-%' THEN L.`T-CHO` ELSE 0 END) - SUM(CASE WHEN L.Date LIKE '1981-12-%' THEN L.`T-CHO` ELSE 0 END)) / SUM(CASE WHEN L.Date LIKE '1981-11-%' THEN L.`T-CHO` ELSE 0 END) AS DecreaseRate FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = '1959-02-18'	thrombosis_prediction
SELECT ID FROM Examination WHERE Diagnosis LIKE '%Behcet%' AND `Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 GROUP BY ID	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Birthday) = '1964' AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'M' AND STRFTIME('%Y', `First Date`) = '1981'	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.`T-BIL` < 2.0	thrombosis_prediction
SELECT COUNT(*) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`ANA Pattern` != 'P' AND Patient.SEX = 'F' AND strftime('%Y', Patient.Birthday) BETWEEN '1980' AND '1989'	thrombosis_prediction
SELECT P.SEX  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE E.Diagnosis = 'PSS' AND L.CRP > 2 AND L.CRE = 1 AND L.LDH = 123	thrombosis_prediction
SELECT AVG(ALB) FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'F' AND P.Diagnosis = 'SLE' AND L.PLT > 400	thrombosis_prediction
SELECT Symptoms, COUNT(*) AS SymptomCount FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY SymptomCount DESC LIMIT 1	thrombosis_prediction
SELECT `First Date`, `Diagnosis` FROM `Patient` WHERE `ID` = 48473	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE YEAR(Date) = '1997' AND (ALB <= 6 OR ALB >= 8.5)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination WHERE Symptoms LIKE '%thrombocytopenia%'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE YEAR(Birthday) = 1980 AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND P.Diagnosis = 'Behcet' AND P.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(E.`Examination Date`, P.`First Date`) AS Days_Between FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.ID = 821298	thrombosis_prediction
SELECT CASE WHEN (P.SEX = 'M' AND L.UA > 8.0) OR (P.SEX = 'F' AND L.UA > 6.5) THEN 'Yes' ELSE 'No' END AS NormalRange FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.ID = 57266	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60	thrombosis_prediction
SELECT Patient.ID, Patient.SEX, Patient.Birthday  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE strftime('%Y', Laboratory.Date) = '1994' AND Laboratory.GOT < 60	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60	thrombosis_prediction
SELECT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT > 60 ORDER BY P.Birthday DESC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT P.ID, YEAR(CURRENT_TIMESTAMP) - YEAR(P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT P.ID, CASE WHEN P.Admission = '+' THEN 'Inpatient' ELSE 'Outpatient' END AS AdmissionType FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALP < 300 AND L.ALP IS NOT NULL	thrombosis_prediction
SELECT P.ID, CASE WHEN L.ALP < 300 THEN 'Yes' ELSE 'No' END AS ALP_Normal_Range FROM Patient P LEFT JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = '1982-04-01'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0	thrombosis_prediction
SELECT T2.TP - 8.5 AS Deviation FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.TP > 8.5	thrombosis_prediction
SELECT Patient.ID, Patient.Birthday  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Patient.SEX = 'M' AND (Laboratory.ALB <= 3.5 OR Laboratory.ALB >= 5.5)  ORDER BY Patient.Birthday DESC	thrombosis_prediction
SELECT P.ID, CASE WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END AS IsWithinNormalRange FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1982'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.UA > 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'	thrombosis_prediction
SELECT AVG(UA) FROM Laboratory WHERE ID IN (SELECT ID FROM Patient WHERE (SEX = 'M' AND UA < 8.0) OR (SEX = 'F' AND UA < 6.5)) AND Date = (SELECT MAX(Date) FROM Laboratory WHERE ID = Laboratory.ID)	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.UN = 29	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis LIKE '%RA%' AND L.UN < 30	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5	thrombosis_prediction
SELECT (SUM(CASE WHEN T1.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END)) AS result FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` IS NOT NULL)	thrombosis_prediction
SELECT GROUP_CONCAT(DISTINCT P.ID), P.SEX  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.`T-BIL` >= 2.0  GROUP BY P.SEX	thrombosis_prediction
SELECT p.ID, l.`T-CHO` FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = (SELECT MIN(Birthday) FROM Patient) AND l.`T-CHO` = (SELECT MAX(`T-CHO`) FROM Laboratory WHERE ID = p.ID)	thrombosis_prediction
SELECT AVG(STRFTIME('%Y', CURRENT_DATE) - STRFTIME('%Y', P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-CHO` >= 250	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) > 50	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND STRFTIME('%Y', P.Birthday) BETWEEN '1936' AND '1956' AND L.CPK >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND (L.`T-CHO` < 250 OR L.`T-CHO` IS NULL)	thrombosis_prediction
SELECT P.ID, L.GLU  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE STRFTIME('%Y', P.`First Date`) = '1991' AND L.GLU < 180	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.WBC <= 3.5 OR L.WBC >= 9.0  GROUP BY P.SEX  ORDER BY strftime('%Y', 'now') - strftime('%Y', P.Birthday) ASC	thrombosis_prediction
SELECT P.ID, strftime('%Y', current_timestamp) - strftime('%Y', P.Birthday) AS Age, P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RBC < 3.5	thrombosis_prediction
SELECT P.ID, CASE WHEN P.Admission = '+' THEN 'Yes' ELSE 'No' END AS Admitted FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) >= 50 AND (L.RBC <= 3.5 OR L.RBC >= 6.0)	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.HGB < 10	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 ORDER BY P.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID HAVING COUNT(L.ID) >= 2	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29	thrombosis_prediction
SELECT SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS difference FROM Laboratory	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE YEAR(L.Date) = 1984  AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) < 50  AND L.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND T2.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', 'now') - strftime('%Y', T1.Birthday) > 55	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.`First Date`) > 1992 AND L.PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory WHERE Date > '1997-01-01' AND APTT >= 45	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE L.APTT > 45 AND E.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.WBC > 3.5 AND L.WBC < 9.0 AND (L.FG <= 150 OR L.FG >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday > '1980-01-01' AND (L.FG < 150 OR L.FG > 450)	thrombosis_prediction
SELECT DISTINCT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`U-PRO` >= 30	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.`U-PRO` > 0 AND L.`U-PRO` < 30	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE L.IGG > 900 AND L.IGG < 2000 AND E.Symptoms IS NOT NULL	thrombosis_prediction
SELECT Diagnosis  FROM patients  WHERE IGA = (SELECT MAX(IGA) FROM patients WHERE IGA BETWEEN 80 AND 500)	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.IGA > 80 AND L.IGA < 500 AND STRFTIME('%Y', P.`First Date`) >= '1990'	thrombosis_prediction
SELECT Diagnosis FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE IGM <= 40 OR IGM >= 400) GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 LEFT JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRP = '+' AND T2.Description IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE >= 1.5 AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.RA IN ('-', '+-') AND T2.KCT = '+'	thrombosis_prediction
SELECT DISTINCT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE strftime('%Y', P.Birthday) >= '1985' AND L.RA IN ('-', '+-')	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < 20 AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) > 60	thrombosis_prediction
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 0 AND (l.RF IS NULL OR CAST(l.RF AS INTEGER) < 20)	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`ANA Pattern` = 'P' AND T2.C3 > 35	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT NOT BETWEEN 29 AND 52 ORDER BY T1.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%APS%' AND T2.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.RNP IN ('-', '+-')	thrombosis_prediction
SELECT MAX(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RNP NOT IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.SM IN ('-', '+-') AND E.Thrombosis = 0	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date > '1997-01-01' AND L.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.SC170 IN ('negative', '0') AND p.SEX = 'F' AND e.Symptoms IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` < '2000-01-01' AND T2.SSA IN ('-', '+-')	thrombosis_prediction
SELECT ID FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE SSA NOT IN ('negative', '0')) ORDER BY `First Date` ASC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.SSB IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CENTROMEA IN ('-', '+-') AND l.SSB IN ('-', '+-')	thrombosis_prediction
SELECT DISTINCT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.DNA >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 LEFT JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Description IS NULL AND (T2.DNA IS NULL OR T2.DNA < 8)	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.IGG BETWEEN 901 AND 1999	thrombosis_prediction
SELECT CAST(SUM(IIF(T2.GOT >= 60 AND T1.Diagnosis = 'SLE', 1, 0)) AS REAL) * 100 / SUM(IIF(T2.GOT >= 60, 1, 0)) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60	thrombosis_prediction
SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE GOT >= 60)	thrombosis_prediction
SELECT P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GPT < 60  ORDER BY L.GPT DESC  LIMIT 3	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60	thrombosis_prediction
SELECT MIN(`First Date`) FROM Patient WHERE ID = (SELECT ID FROM Laboratory WHERE LDH < 500 ORDER BY LDH DESC LIMIT 1)	thrombosis_prediction
SELECT MAX(P.`First Date`)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH >= 500	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.ALP >= 300	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.ALP < 300	thrombosis_prediction
SELECT DISTINCT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ALB BETWEEN 3.5 AND 5.5 ORDER BY ALB DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.ALB > 3.5 AND L.ALB < 5.5 AND L.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA` FROM Examination E JOIN Patient P ON E.ID = P.ID JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.UA <= 6.50 ORDER BY L.UA DESC LIMIT 1	thrombosis_prediction
SELECT MAX(E.ANA)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.CRE < 1.5	thrombosis_prediction
SELECT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.CRE < 1.5 ORDER BY E.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  JOIN Examination e ON p.ID = e.ID  WHERE l.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT E.ANA FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0)	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  JOIN Examination e ON p.ID = e.ID  WHERE l.`T-CHO` >= 250 AND e.KCT = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE e.`ANA Pattern` = 'P' AND l.`T-CHO` < 250	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.TG < 200 AND E.Symptoms IS NOT NULL	thrombosis_prediction
SELECT E.Diagnosis FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.TG < 200 ORDER BY L.TG DESC LIMIT 1	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.Thrombosis = 0 AND L.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  JOIN Examination e ON p.ID = e.ID  WHERE l.CPK < 250 AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+')	thrombosis_prediction
SELECT MIN(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU > 180	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  JOIN Examination e ON p.ID = e.ID  WHERE l.GLU < 180 AND e.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE (L.RBC <= 3.5 OR L.RBC >= 6.0) AND P.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.PLT > 100 AND L.PLT < 400 AND P.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT T2.PLT FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT > 100 AND T2.PLT < 400	thrombosis_prediction
SELECT AVG(T2.PT) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14	thrombosis_prediction
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE (E.Thrombosis = 2 OR E.Thrombosis = 1) AND L.PT < 14	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Art and Design Department'	student_club
SELECT COUNT(*) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'	student_club
SELECT m.phone  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer'	student_club
SELECT COUNT(*) FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium'	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_name ORDER BY COUNT(a.link_to_event) DESC LIMIT 1	student_club
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'McLean'	student_club
SELECT COUNT(*) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND STRFTIME('%Y', e.event_date) = '2019'	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND event_id IN (SELECT link_to_event FROM attendance GROUP BY link_to_event HAVING COUNT(link_to_event) > 10)	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type != 'fundraiser' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 20	student_club
SELECT CAST(COUNT(T1.event_id) AS REAL) / COUNT(DISTINCT T1.event_id) AS average_attendance FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND STRFTIME('%Y', T1.event_date) = '2020'	student_club
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense)	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud'	student_club
SELECT T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'	student_club
SELECT T1.college FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt'	student_club
SELECT SUM(amount) FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food' AND link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Meeting')	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois'	student_club
SELECT SUM(b.spent) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting'	student_club
SELECT T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.last_name IN ('Pierce', 'Guidi') GROUP BY T1.department HAVING COUNT(DISTINCT T2.last_name) = 2	student_club
SELECT SUM(amount) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'October Speaker')	student_club
SELECT e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08T00:00:00'	student_club
SELECT AVG(cost) FROM expense JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Elijah' AND member.last_name = 'Allen' AND (SUBSTR(expense.expense_date, 6, 1) IN ('9', '1') AND SUBSTR(expense.expense_date, 7, 1) IN ('0', '1'))	student_club
SELECT      (SUM(CASE WHEN SUBSTR(T1.event_date, 1, 4) = '2019' THEN T2.spent ELSE 0 END) -       SUM(CASE WHEN SUBSTR(T1.event_date, 1, 4) = '2020' THEN T2.spent ELSE 0 END)) AS difference FROM      event AS T1  JOIN      budget AS T2  ON      T1.event_id = T2.link_to_event	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'	student_club
SELECT remaining FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'November Meeting') AND remaining < 0	student_club
SELECT SUM(amount) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Speaker')	student_club
SELECT T1.event_status FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Business' AND m.t_shirt_size = 'Medium'	student_club
SELECT T1.type FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Christof' AND T2.last_name = 'Nielson'	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President'	student_club
SELECT date_received FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Connor' AND last_name = 'Hilton') AND source = 'Dues'	student_club
SELECT T2.first_name, T2.last_name FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.source = 'Dues' ORDER BY T1.date_received ASC LIMIT 1	student_club
SELECT SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) / SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END) AS ratio FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement'	student_club
SELECT CAST(SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) AS REAL) * 100 / SUM(b.amount) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT T1.city, T1.county, T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Amy' AND T2.last_name = 'Firth'	student_club
SELECT T2.expense_description FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T1.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT m.member_id FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting'	student_club
SELECT major.college FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.phone = '809-555-3360'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event ORDER BY T2.amount DESC LIMIT 1	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'	student_club
SELECT COUNT(*) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'	student_club
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'	student_club
SELECT COUNT(*) FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland'	student_club
SELECT COUNT(DISTINCT link_to_event) FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE phone = '954-555-6240')	student_club
SELECT member.first_name, member.last_name  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT e.event_name, MAX(b.spent / b.amount) as spend_to_budget_ratio  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed'  GROUP BY e.event_name  ORDER BY spend_to_budget_ratio DESC  LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE position = 'President';	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'	student_club
SELECT SUM(income.amount) FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'	student_club
SELECT member.first_name, member.last_name FROM member JOIN income ON member.member_id = income.link_to_member WHERE income.amount > 40	student_club
SELECT SUM(expense.cost) FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT MAX(amount) FROM income)	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget ORDER BY T3.cost ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) AS REAL) * 100 / SUM(ex.cost) FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id	student_club
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM major	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY COUNT(*) DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching'	student_club
SELECT COUNT(*) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Community Theater' AND STRFTIME('%Y', event.event_date) = '2019'	student_club
SELECT COUNT(DISTINCT a.link_to_event) AS number_of_events, m.major_name FROM member mem JOIN attendance a ON mem.member_id = a.link_to_member JOIN major m ON mem.link_to_major = m.major_id WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi'	student_club
SELECT SUM(spent) / COUNT(*) FROM budget WHERE category = 'Food' AND event_status = 'Closed'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1	student_club
SELECT CASE WHEN m.first_name = 'Maya' AND m.last_name = 'Mclean' THEN 'Yes' ELSE 'No' END AS attended FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.first_name = 'Maya' AND m.last_name = 'Mclean'	student_club
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Posters' AND link_to_budget IN (SELECT budget_id FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Speaker'))	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.event_status = 'Closed' ORDER BY b.remaining ASC LIMIT 1	student_club
SELECT e.type, SUM(ex.cost) AS total_value FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE e.event_name = 'October Meeting' GROUP BY e.type	student_club
SELECT category, SUM(amount) AS total_amount_budgeted FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY category ORDER BY total_amount_budgeted ASC	student_club
SELECT * FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')	student_club
SELECT amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id;	student_club
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'	student_club
SELECT expense_description FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE t_shirt_size = 'X-Large')	student_club
SELECT DISTINCT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Phillip' AND T2.last_name = 'Cullen'	student_club
SELECT member.position FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business'	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'	student_club
SELECT DISTINCT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30	student_club
SELECT DISTINCT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215'	student_club
SELECT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_date = '2020-03-24T12:00:00'	student_club
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'Vice President'	student_club
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT DISTINCT b.category FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education';	student_club
SELECT T1.last_name, T2.department, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT DISTINCT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T3.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.'	student_club
SELECT T2.last_name, T2.position FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'	student_club
SELECT T3.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer' AND T3.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN i.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(m.member_id) FROM member m LEFT JOIN income i ON m.member_id = i.link_to_member WHERE m.t_shirt_size = 'Medium' AND m.position = 'Member'	student_club
SELECT DISTINCT county FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT DISTINCT T1.link_to_event FROM attendance AS T1 JOIN expense AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.cost > 50	student_club
SELECT e.link_to_member, e.link_to_event FROM attendance e JOIN expense ex ON e.link_to_member = ex.link_to_member WHERE ex.approved = 'true' AND ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT phone FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND major_name = 'Business')	student_club
SELECT m.email  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Education' AND mj.college = 'College of Education & Human Services' AND m.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(budget_id) FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code	student_club
SELECT T1.event_name, T1.location FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100	student_club
SELECT member.first_name, member.last_name, major.major_name  FROM member  JOIN expense ON member.member_id = expense.link_to_member  JOIN major ON member.link_to_major = major.major_id  WHERE expense.cost > 100	student_club
SELECT z.city, z.county  FROM zip_code z  JOIN member m ON z.zip_code = m.zip  JOIN income i ON m.member_id = i.link_to_member  GROUP BY z.city, z.county  HAVING COUNT(i.amount) > 40	student_club
SELECT m.member_id, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id GROUP BY m.member_id HAVING COUNT(DISTINCT ev.event_id) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position != 'Member')	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Parking' AND ex.cost < (SELECT AVG(ex.cost) FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id WHERE b.category = 'Parking')	student_club
SELECT CAST(SUM(CASE WHEN e.type = 'Meeting' THEN ex.cost ELSE 0 END) AS REAL) * 100 / SUM(ex.cost) FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id	student_club
SELECT link_to_budget FROM expense WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1	student_club
SELECT m.first_name, m.last_name, SUM(b.spent) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense)	student_club
SELECT (CAST(SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.member_id)) - (CAST(SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.member_id)) AS difference FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member'	student_club
SELECT T1.major_name, T1.department FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'	student_club
SELECT m.first_name, m.last_name, e.cost  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE e.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T2.last_name, T2.phone FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Elementary Education'	student_club
SELECT category, amount FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'January Speaker')	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'	student_club
SELECT T2.first_name, T2.last_name, T1.amount FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.date_received = '2019-09-09'	student_club
SELECT b.category FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Posters';	student_club
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'	student_club
SELECT SUM(b.spent), e.event_name FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts'	student_club
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T1.zip = 28092	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers	debit_card_specializing
SELECT c.CustomerID, MIN(y.Consumption) AS LeastConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.CustomerID BETWEEN 201201 AND 201212 GROUP BY c.CustomerID ORDER BY LeastConsumption ASC LIMIT 1	debit_card_specializing
SELECT AVG(T2.Consumption) / 12 AS AvgMonthlyConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT c.CustomerID FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' ORDER BY y.Consumption DESC LIMIT 1	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'KAM' AND y.Date BETWEEN '201201' AND '201212' AND y.Consumption < 30000	debit_card_specializing
SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS Difference FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT SUBSTR(T2.Date, 1, 4) AS Year, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT CustomerID FROM yearmonth GROUP BY CustomerID ORDER BY SUM(Consumption) ASC LIMIT 1)	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT ym.Date, MAX(ym.Consumption) AS PeakConsumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND ym.Date BETWEEN '201301' AND '201312' GROUP BY ym.Date ORDER BY PeakConsumption DESC LIMIT 1	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN c.CustomerID ELSE NULL END)) -     (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN c.CustomerID ELSE NULL END)) AS SME_LAM_Difference,     (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN c.CustomerID ELSE NULL END)) -     (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN c.CustomerID ELSE NULL END)) AS LAM_KAM_Difference,     (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN c.CustomerID ELSE NULL END)) -     (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN c.CustomerID ELSE NULL END)) AS KAM_SME_Difference FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      c.Currency = 'CZK' AND y.Date BETWEEN '201301' AND '201312' AND c.CustomerID IN (         SELECT CustomerID FROM (             SELECT CustomerID, Segment, MIN(Consumption) as MinConsumption FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' GROUP BY CustomerID         ) subquery         JOIN customers ON subquery.CustomerID = customers.CustomerID         GROUP BY Segment     )	debit_card_specializing
SELECT Segment,         ((MAX(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) -           MAX(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption ELSE 0 END)) /          MAX(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption ELSE 0 END) * 100 AS PercentageIncrease FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Segment IN ('SME', 'LAM', 'KAM') GROUP BY Segment ORDER BY PercentageIncrease DESC	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS Difference	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference	debit_card_specializing
SELECT (SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) - SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END)) AS More_SMEs_CZK_than_EUR FROM customers WHERE Segment = 'SME'	debit_card_specializing
SELECT c.CustomerID  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310'  ORDER BY y.Consumption DESC  LIMIT 1	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT SUM(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T2.Date = '201305'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN y.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM'	debit_card_specializing
SELECT Country, COUNT(*) AS TotalValueForMoneyStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country	debit_card_specializing
SELECT (SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Percentage FROM customers WHERE Segment = 'KAM'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth WHERE Date = '201202'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1	debit_card_specializing
SELECT c.CustomerID, y.Consumption  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'SME' AND y.Date = '201206'  ORDER BY y.Consumption ASC  LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012'	debit_card_specializing
SELECT MAX(SUM(y.Consumption) / 12) AS BiggestMonthlyConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' GROUP BY c.CustomerID	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2013' AND SUBSTR(y.Date, 5, 2) = '09'	debit_card_specializing
SELECT DISTINCT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID JOIN yearmonth AS T3 ON T2.CustomerID = T3.CustomerID WHERE SUBSTR(T3.Date, 1, 4) = '2013' AND SUBSTR(T3.Date, 5, 2) = '06'	debit_card_specializing
SELECT DISTINCT T2.ChainID FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR'	debit_card_specializing
SELECT DISTINCT p.Description  FROM products p  JOIN transactions_1k t ON p.ProductID = t.ProductID  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT AVG(Amount) FROM transactions_1k WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000	debit_card_specializing
SELECT DISTINCT p.Description  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  JOIN products p ON t.ProductID = p.ProductID  WHERE g.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T1.Time FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(Price) FROM transactions_1k WHERE GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')	debit_card_specializing
SELECT AVG(t.Price)  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT CustomerID, SUM(Price) AS TotalSpent FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY TotalSpent DESC LIMIT 1;	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-25' ORDER BY T2.Time ASC LIMIT 1	debit_card_specializing
SELECT c.Currency  FROM customers c  JOIN transactions_1k t ON c.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00'	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE datetime('now', '-10 years') = '2012-08-23 21:20:00')	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-26' AND T1.Time < '13:00:00' AND T2.Currency = 'CZK'	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM transactions_1k)	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT y.Date, y.Consumption  FROM transactions_1k t  JOIN yearmonth y ON t.CustomerID = y.CustomerID  WHERE t.Date = '2012-08-24' AND t.Price = 124.05 AND y.Date = '201201'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26' AND t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE'	debit_card_specializing
SELECT Currency FROM customers WHERE CustomerID = (SELECT CustomerID FROM yearmonth WHERE Date LIKE '201306%' AND Consumption = 214582.17)	debit_card_specializing
SELECT Country FROM gasstations WHERE GasStationID = (SELECT GasStationID FROM transactions_1k WHERE CardID = 667467)	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24' AND T2.Price = 548.4	debit_card_specializing
SELECT CAST(SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT t.CustomerID)  FROM transactions_1k t  LEFT JOIN customers c ON t.CustomerID = c.CustomerID  WHERE t.Date = '2012-08-25'	debit_card_specializing
SELECT (y2012.Consumption - y2013.Consumption) / y2012.Consumption AS DecreaseRate FROM yearmonth y2012 JOIN yearmonth y2013 ON y2012.CustomerID = y2013.CustomerID JOIN transactions_1k t ON t.CustomerID = y2012.CustomerID AND t.Date = '2012-08-25' WHERE t.Price = 634.8 AND y2012.Date LIKE '2012%' AND y2013.Date LIKE '2013%'	debit_card_specializing
SELECT GasStationID, SUM(Price) AS TotalRevenue FROM transactions_1k GROUP BY GasStationID ORDER BY TotalRevenue DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT SUM(Price) FROM transactions_1k WHERE CustomerID = 38508 AND Date LIKE '2012-01-%'	debit_card_specializing
SELECT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.Description ORDER BY SUM(t.Amount) DESC LIMIT 5	debit_card_specializing
SELECT c.CustomerID, SUM(t.Price) / SUM(t.Amount) AS AvgPricePerItem, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Amount) DESC LIMIT 1	debit_card_specializing
SELECT g.Country  FROM gasstations g  JOIN transactions_1k t ON g.GasStationID = t.GasStationID  WHERE t.ProductID = 2  ORDER BY t.Price DESC  LIMIT 1	debit_card_specializing
SELECT y.Consumption  FROM transactions_1k t  JOIN yearmonth y ON t.CustomerID = y.CustomerID  WHERE t.ProductID = 5 AND t.Price / t.Amount > 29 AND y.Date = '201208'	debit_card_specializing
