SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda';	california_schools
SELECT s.School, f."Percent (%) Eligible Free (Ages 5-17)" AS EligibleFreeRate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.DOCType = 'Continuation' ORDER BY EligibleFreeRate ASC LIMIT 3	california_schools
SELECT DISTINCT T2.Zip FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.DOC = 'Fresno County Office of Education'	california_schools
SELECT T2.MailStreet FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.F RPMCount (K-12) DESC LIMIT 1	california_schools
SELECT Phone FROM schools WHERE CDSCode IN (SELECT CDSCode FROM frpm WHERE `Charter School (Y/N)` = 1 AND `Charter Funding Type` = 'Direct funded') AND OpenDate > '2000-01-01'	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrMath > 400 AND s.Virtual = 'F'	california_schools
SELECT s.School FROM schools s JOIN satscores sat ON s.CDSCode = sat.cds WHERE sat.NumTstTakr > 500 AND s.Magnet = 1	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)	california_schools
SELECT s.NumTstTakr FROM satscores AS s JOIN frpm AS f ON s.cds = f.CDSCode ORDER BY f.F RPMCount (K-12) DESC LIMIT 1	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM satscores ss  JOIN schools s ON ss.cds = s.CDSCode  WHERE ss.AvgScrMath > 560 AND s.FundingType = 'Charter'	california_schools
SELECT T1.`FRPM Count (Ages 5-17)`  FROM frpm AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)	california_schools
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500	california_schools
SELECT MAX(f.`Percent (%) Eligible Free (Ages 5-17)`)  FROM frpm f  JOIN satscores s ON f.CDSCode = s.cds  WHERE s.NumGE1500 / s.NumTstTakr > 0.3	california_schools
SELECT s.Phone FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumTstTakr > 0 ORDER BY sc.NumGE1500 / sc.NumTstTakr DESC LIMIT 3	california_schools
SELECT s.NCESSchool FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.Enrollment (Ages 5-17) DESC LIMIT 5	california_schools
SELECT dname, AVG(AvgScrRead) AS AvgReadingScore FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.StatusType = 'Active' GROUP BY dname ORDER BY AvgReadingScore DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM satscores WHERE cds IN (SELECT CDSCode FROM schools WHERE County = 'Alameda') AND NumTstTakr < 100	california_schools
SELECT s.School, s.CharterNum, ss.AvgScrWrite  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL  ORDER BY ss.AvgScrWrite DESC	california_schools
SELECT COUNT(DISTINCT s.School)  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE s.County = 'Fresno' AND s.FundingType = 'Direct funded' AND ss.NumTstTakr <= 250	california_schools
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = 9 AND `High Grade` = 12	california_schools
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Los Angeles' AND frpm.`Free Meal Count (K-12)` > 500 AND frpm.`FRPM Count (K-12)` < 700	california_schools
SELECT sname FROM satscores WHERE cds IN (SELECT CDSCode FROM schools WHERE County = 'Contra Costa') ORDER BY NumTstTakr DESC LIMIT 1	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)` > 30	california_schools
SELECT s.School  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  JOIN satscores sc ON s.CDSCode = sc.cds  WHERE (f.FreeMealCountK12 / f.EnrollmentK12) > 0.1 AND sc.NumGE1500 > 0	california_schools
SELECT s.School, s.FundingType  FROM schools s  JOIN (     SELECT cds, AVG(AvgScrMath) AS AvgMathScore      FROM satscores      GROUP BY cds ) ss ON s.CDSCode = ss.cds  WHERE s.County = 'Riverside' AND ss.AvgMathScore > 400	california_schools
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Monterey' AND f.`FRPM Count (Ages 5-17)` > 800 AND s.GSoffered LIKE '%12%'	california_schools
SELECT s.School, ss.AvgScrWrite, s.Phone  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01'	california_schools
SELECT s.School, s.DOCType  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE s.FundingType = 'Local' AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`)      FROM frpm f2      JOIN schools s2 ON f2.CDSCode = s2.CDSCode      WHERE s2.FundingType = 'Local' )	california_schools
SELECT OpenDate FROM schools WHERE CDSCode = (SELECT CDSCode FROM frpm ORDER BY Enrollment__K_12_ DESC LIMIT 1)	california_schools
SELECT T1.City, T2.enroll12 FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.enroll12 ASC LIMIT 5	california_schools
SELECT "Free Meal Count (K-12)" / "Enrollment (K-12)" AS EligibleFreeRate FROM frpm ORDER BY "Enrollment (K-12)" DESC LIMIT 9, 2	california_schools
SELECT s.School, f.`FRPM Count (K-12)`, f.`Enrollment (K-12)`, (f.`FRPM Count (K-12)` / f.`Enrollment (K-12)`) AS Eligible_FRPM_Rate FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.SOC = '66' ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 5	california_schools
SELECT s.School, s.Website  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000	california_schools
SELECT (T1.`Free Meal Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)`) AS FreeRate FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson';	california_schools
SELECT AdmEmail1 FROM schools WHERE CDSCode = (SELECT CDSCode FROM frpm WHERE `Charter School (Y/N)` = 1 ORDER BY `Enrollment (K-12)` ASC LIMIT 1)	california_schools
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3 FROM schools s JOIN (     SELECT cds, MAX(NumGE1500) AS max_num_ge_1500     FROM satscores     GROUP BY cds ) ss ON s.CDSCode = ss.cds WHERE ss.max_num_ge_1500 = (     SELECT MAX(NumGE1500)     FROM satscores )	california_schools
SELECT Street, City, Zip, State FROM schools WHERE CDSCode = (SELECT cds FROM satscores ORDER BY CAST(NumGE1500 AS REAL) / NumTstTakr ASC LIMIT 1)	california_schools
SELECT s.Website  FROM schools s  JOIN satscores sat ON s.CDSCode = sat.cds  WHERE s.County = 'Los Angeles' AND sat.NumTstTakr BETWEEN 2000 AND 3000	california_schools
SELECT AVG(s.NumTstTakr) FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.County = 'Fresno' AND STRFTIME('%Y', sch.OpenDate) = '1980'	california_schools
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' ORDER BY ss.AvgScrRead ASC LIMIT 1	california_schools
SELECT s.School FROM schools s JOIN (     SELECT cds, AVG(AvgScrRead) AS AvgReadScore     FROM satscores     GROUP BY cds ) ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' ORDER BY s.County, ss.AvgReadScore DESC LIMIT 5	california_schools
SELECT T1.SOCType FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1	california_schools
SELECT s.AvgScrMath, fr.County Name FROM satscores s JOIN schools fr ON s.cds = fr.CDSCode ORDER BY (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) ASC LIMIT 1	california_schools
SELECT s.City, sa.AvgScrWrite FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores )	california_schools
SELECT s.School, ss.AvgScrWrite FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich'	california_schools
SELECT s.School, f."Enrollment (K-12)"  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.DOC = '31'  ORDER BY f."Enrollment (K-12)" DESC  LIMIT 1;	california_schools
SELECT COUNT(CDSCode) / 12 AS MonthlyAverage FROM schools WHERE County = 'Alameda' AND DOC = 52 AND STRFTIME('%Y', OpenDate) = '1980'	california_schools
SELECT      SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) /      SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS Ratio FROM      schools WHERE      County = 'Orange' AND StatusType = 'Merged'	california_schools
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' GROUP BY County, School, ClosedDate ORDER BY COUNT(*) DESC LIMIT 1	california_schools
SELECT s.MailStreet, s.School FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds ORDER BY sa.AvgScrMath DESC LIMIT 6, 1	california_schools
SELECT s.MailStreet, s.School  FROM schools s  JOIN satscores sa ON s.CDSCode = sa.cds  ORDER BY sa.AvgScrRead ASC  LIMIT 1	california_schools
SELECT COUNT(DISTINCT s.CDSCode)  FROM satscores sat  JOIN schools s ON sat.cds = s.CDSCode  WHERE (sat.AvgScrRead + sat.AvgScrMath + sat.AvgScrWrite) >= 1500 AND s.MailCity = 'Lakeport'	california_schools
SELECT SUM(T1.NumTstTakr) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Fresno'	california_schools
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'	california_schools
SELECT CAST(COUNT(CASE WHEN County = 'Colusa' THEN CDSCode END) AS REAL) / COUNT(CASE WHEN County = 'Humboldt' THEN CDSCode END) AS Ratio FROM schools WHERE MailState = 'California'	california_schools
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active'	california_schools
SELECT T1.Phone, T1.Ext FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrWrite DESC LIMIT 332, 1	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName2 = 'Mike' AND AdmLName2 = 'Larson') OR (AdmFName3 = 'Mike' AND AdmLName3 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez') OR (AdmFName2 = 'Dante' AND AdmLName2 = 'Alvarez') OR (AdmFName3 = 'Dante' AND AdmLName3 = 'Alvarez')	california_schools
SELECT Website FROM schools WHERE County = 'San Joaquin' AND Virtual = 'P' AND Charter = 1	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = 52	california_schools
SELECT COUNT(*) FROM frpm AS f JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND s.Charter = 0 AND f.`Percent (%) Eligible Free (K-12)` < 0.18	california_schools
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3, School, City FROM schools WHERE Charter = 1 AND CharterNum = '00D2'	california_schools
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'	california_schools
SELECT (COUNT(CASE WHEN FundingType = 'Local' THEN CDSCode END) / COUNT(CDSCode)) * 100 AS Ratio_Percentage FROM schools WHERE County = 'Santa Clara' AND Charter = 1	california_schools
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'	california_schools
SELECT COUNT(*) FROM schools WHERE ClosedDate LIKE '1989%' AND DOCType = 'Community College District' AND City = 'San Francisco'	california_schools
SELECT County, COUNT(*) AS ClosureCount FROM schools WHERE ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND SOC = 11 GROUP BY County ORDER BY ClosureCount DESC LIMIT 1	california_schools
SELECT NCESDist FROM schools WHERE SOC = '31'	california_schools
SELECT COUNT(*) AS TotalSchools, StatusType FROM schools WHERE County = 'Alpine' AND DOCType = 'Community Day School' GROUP BY StatusType	california_schools
SELECT DISTINCT DistrictCode FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE City = 'Fresno' AND Magnet = 0)	california_schools
SELECT SUM(f."Enrollment (Ages 5-17)")  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE s.School = 'State Special School' AND s.City = 'Fremont' AND s.EdOpsCode = 'SSS' AND f.`Academic Year` = '2014-2015'	california_schools
SELECT T1.`FRPM Count (Ages 5-17)`  FROM frpm AS T1  JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T2.School = 'Youth Authority School' AND T2.MailStreet = 'PO Box 1040'	california_schools
SELECT LowGrade FROM frpm WHERE CDSCode IN (SELECT CDSCode FROM schools WHERE NCESDist = '0613360' AND EdOpsCode = 'SPECON') ORDER BY LowGrade ASC LIMIT 1	california_schools
SELECT s.School, f."Educational Option Type"  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f."County Code" = '37' AND f."NSLP Provision Status" = 'Breakfast Provision 2'	california_schools
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County Name = 'Merced' AND T1.Low Grade = '9' AND T1.High Grade = '12' AND T2.EILCode = 'HS' AND T1.NSLP Provision Status = '2'	california_schools
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) * 100 AS PercentEligibleFRPMAges5to17 FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND f.`Low Grade` = 'K' AND f.`High Grade` = '9'	california_schools
SELECT GSserved, COUNT(*) as count FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY count DESC LIMIT 1	california_schools
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1	california_schools
SELECT T2.SchoolType, T1.School, T1.Latitude  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  ORDER BY T1.Latitude DESC  LIMIT 1	california_schools
SELECT s.City, f.Low_Grade, f.School_Name FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1	california_schools
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1	california_schools
SELECT s.City, COUNT(s.School) AS NumberOfSchools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Magnet = 1 AND s.GSoffered = 'K-8' AND f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY s.City	california_schools
SELECT AdmFName1, District, COUNT(*) as count FROM schools GROUP BY AdmFName1, District ORDER BY count DESC LIMIT 2	california_schools
SELECT s.DistrictCode, f.`Percent (%) Eligible Free (K-12)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Alusine' OR s.AdmFName2 = 'Alusine' OR s.AdmFName3 = 'Alusine'	california_schools
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = '40'	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)	california_schools
SELECT s.AdmEmail1, s.School FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores )	california_schools
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'Hlavní město Praha'	financial
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague')	financial
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district	financial
SELECT COUNT(DISTINCT T1.district_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.district_id HAVING AVG(T1.A11) > 6000 AND AVG(T1.A11) < 10000	financial
SELECT COUNT(*)  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000	financial
SELECT a.account_id, d.A11, MAX(d.A11) - MIN(d.A11) AS salary_gap FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district di ON c.district_id = di.district_id WHERE c.gender = 'F' GROUP BY a.account_id, d.A11 ORDER BY c.birth_date ASC, d.A11 ASC LIMIT 1;	financial
SELECT T1.account_id  FROM account AS T1  JOIN disp AS T2 ON T1.account_id = T2.account_id  JOIN client AS T3 ON T2.client_id = T3.client_id  JOIN district AS T4 ON T3.district_id = T4.district_id  WHERE T3.birth_date = (SELECT MAX(birth_date) FROM client)  AND T4.A11 = (SELECT MAX(A11) FROM district)	financial
SELECT COUNT(*) FROM account AS a JOIN disp AS d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'	financial
SELECT T2.client_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.type = 'DISPONENT'	financial
SELECT a.account_id  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE l.date LIKE '1997%'  AND a.frequency = 'POPLATEK TYDNE'  AND l.amount = (     SELECT MIN(amount)      FROM loan      WHERE date LIKE '1997%' )	financial
SELECT a.account_id, a.date, l.amount, l.duration FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND a.date LIKE '1993-%' ORDER BY l.amount DESC LIMIT 1	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN district dist ON c.district_id = dist.district_id  WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND dist.A2 = 'Sokolov'	financial
SELECT account_id FROM trans WHERE date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY date ASC LIMIT 1	financial
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.amount > 3000	financial
SELECT T2.client_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued = '1994-03-03'	financial
SELECT a.date FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14'	financial
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'	financial
SELECT MAX(t.amount) FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.issued = '1996-10-21'	financial
SELECT c.gender  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district di ON c.district_id = di.district_id  WHERE c.birth_date = (     SELECT MIN(c.birth_date)      FROM client c      JOIN disp d ON c.client_id = d.client_id      JOIN account a ON d.account_id = a.account_id      JOIN district di ON c.district_id = di.district_id      WHERE di.A11 = (         SELECT MAX(A11)          FROM district     ) )	financial
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.loan_id = (SELECT loan_id FROM loan ORDER BY amount DESC LIMIT 1) ORDER BY t.date ASC LIMIT 1	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON c.district_id = dis.district_id  WHERE c.gender = 'F' AND dis.A2 = 'Jesenik'	financial
SELECT T1.disp_id FROM disp AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 5100 AND T2.date = '1998-09-02'	financial
SELECT COUNT(*) FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND strftime('%Y', account.date) = '1996'	financial
SELECT T3.A2 FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'	financial
SELECT T3.birth_date FROM loan AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03'	financial
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1	financial
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'Stredocesky kraj' ORDER BY T1.A4 DESC LIMIT 1	financial
SELECT ((MAX(CASE WHEN T2.date = '1998-12-27' THEN T2.balance ELSE 0 END) - MAX(CASE WHEN T2.date = '1993-03-22' THEN T2.balance ELSE 0 END)) / MAX(CASE WHEN T2.date = '1993-03-22' THEN T2.balance ELSE 0 END)) * 100 AS increase_rate FROM loan AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T1.date = '1993-07-05' AND T2.date IN ('1993-03-22', '1998-12-27')	financial
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage FROM loan	financial
SELECT (SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage FROM loan WHERE amount < 100000	financial
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date LIKE '1993%' AND a.frequency = 'POPLATEK PO OBRATU'	financial
SELECT T1.account_id, T1.frequency, T2.client_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.date BETWEEN '1995-01-01' AND '2000-12-31' AND T3.A3 = 'Hlavní město Praha' AND T2.type = 'OWNER'	financial
SELECT T1.account_id, T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'	financial
SELECT T2.A2 AS District, T2.A3 AS Region FROM loan AS T1 JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.loan_id = 4990	financial
SELECT T1.account_id, T2.A2 AS district, T2.A3 AS region FROM loan AS T1 JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.amount > 300000	financial
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60	financial
SELECT d.A3, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM loan l JOIN disp dp ON l.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id JOIN district d ON c.district_id = d.district_id WHERE l.status = 'D'	financial
SELECT CAST(SUM(CASE WHEN T2.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1993'	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'	financial
SELECT T2.A2, COUNT(*) AS num_female_holders FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.district_id ORDER BY num_female_holders DESC LIMIT 9	financial
SELECT d.A2, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN district d ON c.district_id = d.district_id  LEFT JOIN disp dp ON c.client_id = dp.client_id  LEFT JOIN card cr ON dp.disp_id = cr.disp_id  WHERE d.A3 = 'South Bohemia' AND cr.card_id IS NULL	financial
SELECT T1.A3 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status IN ('C', 'D') GROUP BY T1.district_id ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT AVG(loan.amount) FROM loan JOIN disp ON loan.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M'	financial
SELECT A2 AS district_name, A7 AS branch_location, A13 AS unemployment_rate FROM district ORDER BY A13 DESC LIMIT 1	financial
SELECT COUNT(*)  FROM account  WHERE district_id = (     SELECT district_id      FROM district      ORDER BY A16 DESC      LIMIT 1 )  AND strftime('%Y', date) = '1996'	financial
SELECT COUNT(DISTINCT t.account_id)  FROM trans t  JOIN account a ON t.account_id = a.account_id  WHERE t.operation = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE'	financial
SELECT COUNT(DISTINCT l.account_id)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.amount >= 250000  AND a.frequency = 'POPLATEK MESICNE'  AND l.status = 'A'  AND l.date BETWEEN '1995-01-01' AND '1997-12-31'	financial
SELECT COUNT(*) FROM loan WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 1) AND status IN ('C', 'D')	financial
SELECT COUNT(*) FROM client WHERE district_id = (SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1, 1) AND gender = 'M'	financial
SELECT COUNT(*) FROM card AS c JOIN disp AS d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER'	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek')	financial
SELECT DISTINCT d.district_id FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.amount > 10000 AND strftime('%Y', t.date) = '1997'	financial
SELECT account_id FROM order WHERE k_symbol = 'SIPO' AND account_id IN (SELECT account_id FROM district WHERE A2 = 'Pisek')	financial
SELECT DISTINCT T1.account_id FROM disp AS T1 JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'gold'	financial
SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date LIKE '2021%'	financial
SELECT DISTINCT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.operation = 'VYBER KARTOU' AND T3.amount < (SELECT AVG(amount) FROM trans WHERE operation = 'VYBER KARTOU' AND date LIKE '1998%') AND T3.date LIKE '1998%'	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' AND cr.type IN ('gold', 'classic', 'junior')	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 = 'South Bohemia'	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district di ON a.district_id = di.district_id WHERE di.A2 = 'Tabor' AND d.type = 'OWNER'	financial
SELECT DISTINCT a.frequency  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.account_id NOT IN (     SELECT disp.account_id      FROM disp      WHERE disp.type = 'OWNER' )  AND d.A11 > 8000 AND d.A11 <= 9000	financial
SELECT COUNT(DISTINCT t.account_id)  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.bank = 'AB' AND d.A3 = 'North Bohemia'	financial
SELECT DISTINCT T3.A2 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ'	financial
SELECT AVG(A15) FROM district WHERE A15 > 4000 AND district_id IN (SELECT district_id FROM account WHERE strftime('%Y', date) >= '1997')	financial
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'classic' AND d.type = 'OWNER'	financial
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha'	financial
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card	financial
SELECT T3.client_id FROM loan AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T2.type = 'OWNER' ORDER BY T1.amount DESC LIMIT 1	financial
SELECT T1.A15 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532	financial
SELECT T1.district_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN `order` AS T3 ON T2.account_id = T3.account_id WHERE T3.order_id = 33333	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 3356) AND operation = 'VYBER'	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000	financial
SELECT card.type FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE disp.client_id = 13539	financial
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541	financial
SELECT T1.A2 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(*) DESC LIMIT 1	financial
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN order AS T4 ON T3.account_id = T4.account_id WHERE T4.order_id = 32423	financial
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5)	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik'	financial
SELECT T2.client_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'junior' AND T1.issued >= '1997-01-01'	financial
SELECT CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  JOIN district di ON c.district_id = di.district_id  WHERE di.A11 > 10000	financial
SELECT ((SUM(CASE WHEN strftime('%Y', l.date) = '1997' THEN l.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) * 100 AS growth_rate FROM loan l JOIN disp d ON l.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'	financial
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'	financial
SELECT SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END) AS crime_difference FROM district	financial
SELECT type, COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type	financial
SELECT frequency, SUM(amount) AS total_debit FROM account JOIN trans ON account.account_id = trans.account_id WHERE account.account_id = 3 AND k_symbol = 'POPLATEK' GROUP BY frequency;	financial
SELECT birth_date FROM client WHERE client_id = 130	financial
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.type = 'OWNER'	financial
SELECT SUM(amount) AS total_debt, SUM(CASE WHEN status = 'A' THEN 1 ELSE 0 END) AS on_time_payments, SUM(CASE WHEN status != 'A' THEN 1 ELSE 0 END) AS late_payments FROM loan WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 992)	financial
SELECT SUM(t.amount) AS total_amount, c.gender FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE t.trans_id > 851 AND c.client_id = 4	financial
SELECT type FROM card WHERE disp_id = (SELECT disp_id FROM disp WHERE client_id = 9)	financial
SELECT SUM(amount) FROM trans WHERE account_id = (SELECT account_id FROM disp WHERE client_id = 617) AND date LIKE '1998%'	financial
SELECT client.client_id FROM client JOIN account ON client.client_id = disp.client_id JOIN disp ON account.account_id = disp.account_id JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.A3 = 'Hlavní město Praha'	financial
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN trans t ON d.account_id = t.account_id  WHERE c.gender = 'M'  AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31'  AND t.k_symbol = 'SIPO'  AND t.amount > 4000	financial
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31'	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card ca ON d.disp_id = ca.disp_id  WHERE c.gender = 'F' AND ca.type = 'junior'	financial
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.client_id) FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 LIKE '%Prague%'	financial
SELECT CAST(SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE'	financial
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN account a ON d.account_id = a.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER';	financial
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND l.status = 'A' AND a.date < '1997-01-01' ORDER BY l.amount ASC LIMIT 1	financial
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district di ON c.district_id = di.district_id WHERE c.gender = 'F' GROUP BY a.account_id HAVING AVG(di.A11) = (     SELECT MIN(avg_salary)     FROM (         SELECT AVG(di.A11) AS avg_salary         FROM account a         JOIN disp d ON a.account_id = d.account_id         JOIN client c ON d.client_id = c.client_id         JOIN district di ON c.district_id = di.district_id         WHERE c.gender = 'F'         GROUP BY c.birth_date         ORDER BY c.birth_date ASC         LIMIT 1     ) )	financial
SELECT COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE client.birth_date LIKE '1920%' AND district.A3 = 'Hlavní město Praha'	financial
SELECT COUNT(*) FROM loan AS L JOIN account AS A ON L.account_id = A.account_id WHERE L.duration = 24 AND A.frequency = 'POPLATEK TYDNE'	financial
SELECT AVG(amount) FROM loan WHERE status IN ('C', 'D') AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK PO OBRATU')	financial
SELECT c.client_id, c.district_id  FROM client c  JOIN disp d ON c.client_id = d.client_id  WHERE d.type = 'OWNER'	financial
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER'	financial
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '-' AND a.element = 'cl'	toxicology
SELECT AVG(CASE WHEN T1.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+'	toxicology
SELECT COUNT(*) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-'	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id)  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  JOIN bond AS T3 ON T2.bond_id = T3.bond_id  WHERE T3.bond_type = '='	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9'	toxicology
SELECT DISTINCT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '='	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(m.label) DESC LIMIT 1	toxicology
SELECT DISTINCT b.bond_type  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'cl'	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '-'	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN molecule m ON c.molecule_id = m.molecule_id WHERE m.label = '-'	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1	toxicology
SELECT bond_type FROM bond WHERE bond_id = (SELECT bond_id FROM connected WHERE (atom_id = 'TR004_8' AND atom_id2 = 'TR004_20') OR (atom_id = 'TR004_20' AND atom_id2 = 'TR004_8'))	toxicology
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn')	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'	toxicology
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') UNION SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')	toxicology
SELECT CAST(COUNT(DISTINCT CASE WHEN T1.element != 'f' THEN T2.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) AS percent FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3	toxicology
SELECT T1.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR001' AND T2.bond_id = 'TR001_2_6'	toxicology
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' ORDER BY m.molecule_id ASC LIMIT 5	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008'	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) FROM molecule	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'	toxicology
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR000'	toxicology
SELECT T2.element, T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'	toxicology
SELECT bond_type, COUNT(*) as count FROM bond WHERE molecule_id = 'TR010' GROUP BY bond_type ORDER BY count DESC LIMIT 1	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' ORDER BY m.molecule_id LIMIT 3	toxicology
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id LIMIT 2	toxicology
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND molecule_id = 'TR009'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'br'	toxicology
SELECT bond.bond_type, connected.atom_id, connected.atom_id2  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  WHERE bond.bond_id = 'TR001_6_9'	toxicology
SELECT m.molecule_id, CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Not Carcinogenic' END AS carcinogenic_status FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'	toxicology
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR004'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'	toxicology
SELECT DISTINCT b.bond_id  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p')	toxicology
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1	toxicology
SELECT CAST(COUNT(DISTINCT c.bond_id) AS REAL) / COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE a.element = 'i'	toxicology
SELECT bond.bond_type, bond.bond_id  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom ON connected.atom_id = atom.atom_id  WHERE CAST(SUBSTR(atom.atom_id, 7, 2) AS INTEGER) = 45	toxicology
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected UNION SELECT atom_id2 FROM connected)	toxicology
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR144_8_19'	toxicology
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1	toxicology
SELECT element FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1	toxicology
SELECT c.atom_id2 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'pb'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'	toxicology
SELECT CAST(COUNT(b.bond_id) AS REAL) * 100 / (SELECT COUNT(*) FROM connected)  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE (a1.element, a2.element) = (     SELECT a1.element, a2.element      FROM connected c      JOIN atom a1 ON c.atom_id = a1.atom_id      JOIN atom a2 ON c.atom_id2 = a2.atom_id      GROUP BY a1.element, a2.element      ORDER BY COUNT(*) DESC      LIMIT 1 )  JOIN bond b ON c.bond_id = b.bond_id	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')	toxicology
SELECT T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'	toxicology
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'sn'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br')	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'	toxicology
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'i'	toxicology
SELECT label, COUNT(*) as count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE element = 'ca' GROUP BY label ORDER BY count DESC LIMIT 1	toxicology
SELECT DISTINCT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  WHERE c.bond_id = 'TR001_1_8'  AND a.element IN ('cl', 'c')	toxicology
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON m.molecule_id = b.molecule_id  JOIN connected c ON b.bond_id = c.bond_id  WHERE a.element = 'c' AND b.bond_type = '#' AND m.label = '-'  LIMIT 2	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT molecule_id FROM bond WHERE bond_type = '='	toxicology
SELECT c.atom_id, c.atom_id2  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.bond_type = '#'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '-' AND b.bond_type = '-'	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT b.bond_id, m.label AS carcinogenic_status FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#'	toxicology
SELECT m.molecule_id, a.element  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND SUBSTR(a.atom_id, 7, 1) = '4'	toxicology
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(element) AS ratio, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.molecule_id = 'TR006'	toxicology
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'	toxicology
SELECT DISTINCT bond.bond_type  FROM bond  JOIN connected ON bond.bond_id = connected.bond_id  JOIN atom ON connected.atom_id = atom.atom_id  WHERE atom.element = 'c'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' UNION SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11'	toxicology
SELECT (COUNT(CASE WHEN bond_type = '#' THEN 1 ELSE NULL END) * 100.0 / COUNT(DISTINCT molecule_id)) FROM bond	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047'	toxicology
SELECT CASE WHEN m.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenic_status FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1'	toxicology
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR151'	toxicology
SELECT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND molecule_id BETWEEN 'TR010' AND 'TR050'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')	toxicology
SELECT bond.bond_id FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '=' AND molecule.label = '+'	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' AND molecule.label = '+'	toxicology
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR000_1_2' AND T2.atom_id = 'TR000_1'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR124'	toxicology
SELECT atom_id, element FROM atom WHERE molecule_id = 'TR186'	toxicology
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(CASE WHEN T2.bond_type = '=' THEN 1 ELSE NULL END) AS double_bonds, CASE WHEN T1.label = '+' THEN 'carcinogenic' ELSE 'non-carcinogenic' END AS carcinogenic_status FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'	toxicology
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'	toxicology
SELECT b.bond_id, c.atom_id, c.atom_id2 FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-'	toxicology
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE b.bond_type = '#'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'	toxicology
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'cl'	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_type_count FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id	toxicology
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules, SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '='	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  LEFT JOIN atom a ON m.molecule_id = a.molecule_id  LEFT JOIN bond b ON m.molecule_id = b.molecule_id  WHERE a.element != 's' AND b.bond_type != '='	toxicology
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(atom_id) FROM atom WHERE molecule_id = 'TR001'	toxicology
SELECT COUNT(*) FROM bond WHERE bond_type = '-'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'	toxicology
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'	toxicology
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_3_4'	toxicology
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2') OR (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_1')	toxicology
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4') GROUP BY T1.label HAVING COUNT(DISTINCT T2.atom_id) = 2	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1'	toxicology
SELECT CASE WHEN label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS status FROM molecule WHERE molecule_id = 'TR000'	toxicology
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'n' AND m.label = '+'	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '='	toxicology
SELECT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '-'  GROUP BY m.molecule_id  HAVING COUNT(a.atom_id) > 5	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR004'	toxicology
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1	toxicology
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'h' AND b.bond_type = '#'	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'o' AND b.bond_type = '='	toxicology
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '-'	toxicology
SELECT T1.element, T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR002'	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' AND T3.bond_type = '=' AND T1.molecule_id = 'TR012'	toxicology
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o'	toxicology
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT * FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)	card_games
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)	card_games
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100	card_games
SELECT c.name  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator'	card_games
SELECT l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage'	card_games
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'	card_games
SELECT c.id, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Missing or Degraded' ELSE 'No Issues' END AS propertyStatus FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele'	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'	card_games
SELECT c.name, c.artist, c.isPromo  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  GROUP BY c.uuid  ORDER BY COUNT(r.id) DESC  LIMIT 1;	card_games
SELECT DISTINCT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'	card_games
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid	card_games
SELECT st.translation, s.totalSetSize FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Italian'	card_games
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';	card_games
SELECT COUNT(*) FROM cards WHERE power = '*';	card_games
SELECT promoTypes FROM cards WHERE name = 'Duress'	card_games
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';	card_games
SELECT DISTINCT T3.language FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.status = 'Restricted' AND c.isTextless = 0	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'	card_games
SELECT COUNT(*) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Restricted' AND cards.isStarter = 1	card_games
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'	card_games
SELECT type FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT rulings.text  FROM rulings  JOIN cards ON rulings.uuid = cards.uuid  WHERE cards.name = 'Benalish Knight'	card_games
SELECT DISTINCT T2.artist FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Phyrexian'	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.isReprint = 1 AND fd.language = 'German'	card_games
SELECT COUNT(DISTINCT c.uuid)  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.borderColor = 'borderless' AND fd.language = 'Russian'	card_games
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1	card_games
SELECT COUNT(*) FROM cards WHERE toughness = '99'	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT id FROM cards WHERE convertedManaCost = 0	card_games
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL AND hasFoil = 1 AND hasNonFoil = 1	card_games
SELECT id FROM cards WHERE duelDeck = 'a'	card_games
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'	card_games
SELECT DISTINCT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'	card_games
SELECT c.name  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.availability = 'paper' AND fd.language = 'Japanese'	card_games
SELECT COUNT(*) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white'	card_games
SELECT l.uuid, f.language FROM legalities l JOIN foreign_data f ON l.uuid = f.uuid WHERE l.format = 'legacy'	card_games
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'	card_games
SELECT COUNT(c.id), l.status  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.frameVersion = 'future' AND l.status = 'Legal'	card_games
SELECT name, colors FROM cards WHERE setCode = 'OGW'	card_games
SELECT c.name, st.language  FROM cards c  JOIN set_translations st ON c.setCode = st.setCode  WHERE c.setCode = '10E' AND c.convertedManaCost = 5	card_games
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf'	card_games
SELECT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20	card_games
SELECT c.name, fd.language, fd.translation FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B'	card_games
SELECT c.name  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND (cardKingdomId IS NULL OR cardKingdomFoilId IS NULL)	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'	card_games
SELECT SUM(manaCost) FROM cards WHERE artist = 'Rob Alexander'	card_games
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena'	card_games
SELECT DISTINCT setCode FROM set_translations WHERE language = 'Spanish'	card_games
SELECT CAST(SUM(IIF(isOnlineOnly = 1, 1, 0)) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'	card_games
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage, id FROM cards WHERE isStorySpotlight = 1 GROUP BY id	card_games
SELECT T1.name, CAST(SUM(CASE WHEN T2.language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) AS percentage FROM cards AS T1 LEFT JOIN foreign_data AS T2 ON T1.uuid = T2.uuid GROUP BY T1.name	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309	card_games
SELECT COUNT(*) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)'	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'Legal'	card_games
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid LEFT JOIN rulings AS r ON c.uuid = r.uuid WHERE l.format = 'premodern' AND r.text = 'This is a triggered mana ability.' AND c.side IS NULL	card_games
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'	card_games
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.text = 'Das perfekte Gegenmittel zu einer dichten Formation'	card_games
SELECT T2.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French' AND T1.type = 'Creature' AND T1.layout = 'normal' AND T1.borderColor = 'black' AND T1.artist = 'Matthew D. Wilson'	card_games
SELECT COUNT(DISTINCT c.id) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'	card_games
SELECT DISTINCT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'	card_games
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'Legal'	card_games
SELECT CAST(SUM(IIF(T1.language = 'French' AND (T2.power IS NULL OR T2.power = '*'), 1, 0)) AS REAL) * 100 / SUM(IIF(T2.power IS NULL OR T2.power = '*', 1, 0)) FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid	card_games
SELECT CAST(SUM(CASE WHEN T2.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese'	card_games
SELECT availability FROM cards WHERE artist = 'Daren Bader'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1	card_games
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3	card_games
SELECT T1.language FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.multiverseId = 149934	card_games
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards	card_games
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%'	card_games
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.setCode = 'ARC'	card_games
SELECT s.name, st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 5;	card_games
SELECT T2.language, T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 206	card_games
SELECT s.id, s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Italian' AND s.block = 'Shadowmoor'  ORDER BY s.name  LIMIT 2	card_games
SELECT s.id, s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 0 AND s.isFoilOnly = 1 AND st.language = 'Japanese'	card_games
SELECT s.name  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.language = 'Russian'  ORDER BY s.baseSetSize DESC  LIMIT 1	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Chinese Simplified'	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '')	card_games
SELECT COUNT(id), id FROM cards WHERE borderColor = 'black'	card_games
SELECT COUNT(id), id FROM cards WHERE frameEffects = 'extendedart'	card_games
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1	card_games
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE id = 174)	card_games
SELECT name FROM sets WHERE code = 'ALL'	card_games
SELECT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar'	card_games
SELECT code FROM sets WHERE releaseDate = '2007-07-13'	card_games
SELECT baseSetSize, setCode FROM sets WHERE block IN ('Masques', 'Mirage')	card_games
SELECT code FROM sets WHERE type = 'expansion'	card_games
SELECT T2.name, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'boros'	card_games
SELECT T2.language, T2.flavorText, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'	card_games
SELECT DISTINCT T1.setCode FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T1.type LIKE '%Expansion%'	card_games
SELECT T2.name, T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'abzan'	card_games
SELECT T2.language, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'azorius'	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'	card_games
SELECT name FROM cards WHERE isTextless = 0	card_games
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)	card_games
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'	card_games
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'	card_games
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3	card_games
SELECT T3.translation FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T3.language = 'Italian'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy')	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'	card_games
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Korean'	card_games
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'	card_games
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'	card_games
SELECT CASE WHEN T1.mtgoCode IS NOT NULL THEN 'Yes' ELSE 'No' END AS AppearsOnMTGO FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Angel of Mercy'	card_games
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'	card_games
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL	card_games
SELECT s.isForeignOnly FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Adarkar Valkyrie'	card_games
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100	card_games
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND borderColor = 'black'	card_games
SELECT c.name  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE s.name = 'Coldsnap'  ORDER BY c.convertedManaCost DESC  LIMIT 1	card_games
SELECT DISTINCT artist FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT * FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') AND number = 4	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)	card_games
SELECT T2.flavorText FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'	card_games
SELECT DISTINCT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL	card_games
SELECT T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Coldsnap' AND st.language = 'Italian'	card_games
SELECT t2.name FROM sets AS s JOIN cards AS c ON s.code = c.setCode JOIN set_translations AS t ON s.code = t.setCode WHERE s.name = 'Coldsnap' AND t.language = 'Italian' ORDER BY c.convertedManaCost DESC LIMIT 1	card_games
SELECT rulings.date FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce'	card_games
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT CAST(SUM(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14'	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'	card_games
SELECT type FROM sets WHERE name = 'From the Vault: Lore'	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'	card_games
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'	card_games
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'	card_games
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'	card_games
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'	card_games
SELECT T3.translation FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T3.language = 'French' AND T1.name = 'Tendo Ice Bridge'	card_games
SELECT COUNT(*) FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Tenth Edition') AND translation IS NOT NULL	card_games
SELECT T3.translation FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Fellwar Stone' AND T3.language = 'Japanese'	card_games
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1	card_games
SELECT T1.releaseDate FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'	card_games
SELECT T2.type FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'World Championship Decks 2004') AND convertedManaCost = 3	card_games
SELECT translation FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE name = 'Mirrodin') AND language = 'Chinese Simplified'	card_games
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'	card_games
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 0	card_games
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1	card_games
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1	card_games
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1	card_games
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a'	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1	card_games
SELECT c.name, c.manaCost  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'duel'  ORDER BY c.convertedManaCost DESC  LIMIT 10	card_games
SELECT MIN(c.originalReleaseDate), l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal'	card_games
SELECT COUNT(DISTINCT c.id)  FROM cards c  JOIN foreign_data f ON c.uuid = f.uuid  WHERE c.artist = 'Volkan Baǵa' AND f.language = 'French'	card_games
SELECT COUNT(DISTINCT c.uuid) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Abundance' AND c.types = 'Enchantment' AND c.rarity = 'rare' AND l.status = 'Legal' GROUP BY c.uuid HAVING COUNT(DISTINCT l.format) = (SELECT COUNT(DISTINCT format) FROM legalities)	card_games
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format HAVING COUNT(l.status) = (     SELECT COUNT(status)     FROM legalities     WHERE status = 'Banned'     GROUP BY format     ORDER BY COUNT(status) DESC     LIMIT 1 )	card_games
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'	card_games
SELECT T1.artist, T2.format  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  GROUP BY T1.artist  HAVING COUNT(T1.id) = (     SELECT COUNT(id)      FROM cards      GROUP BY artist      ORDER BY COUNT(id) ASC      LIMIT 1 )	card_games
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '1997' AND T1.artist = 'D. Alexander Gregory' AND T1.hasContentWarning = 1 AND T2.format = 'legacy'	card_games
SELECT c.name, l.format  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE c.edhrecRank = 1 AND l.status = 'Banned'	card_games
SELECT AVG(sets_count) AS avg_sets_per_year, common_language FROM (     SELECT COUNT(*) AS sets_count,             EXTRACT(YEAR FROM releaseDate) AS year,            (SELECT language              FROM set_translations              WHERE setCode = s.code              GROUP BY language              ORDER BY COUNT(*) DESC              LIMIT 1) AS common_language     FROM sets s     WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'     GROUP BY year ) subquery	card_games
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'	card_games
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted')	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'	card_games
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC	card_games
SELECT c.name, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'	card_games
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Korean' AND s.code NOT IN (SELECT setCode FROM set_translations WHERE language LIKE '%Japanese%')	card_games
SELECT DISTINCT T1.frameVersion, T1.name, T2.status  FROM cards AS T1  JOIN legalities AS T2 ON T1.uuid = T2.uuid  WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned'	card_games
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'	codebase_community
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1	codebase_community
SELECT COUNT(*) FROM users WHERE Views > 10 AND STRFTIME('%Y', CreationDate) > '2013'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.FavoriteCount DESC LIMIT 1	codebase_community
SELECT SUM(T1.CommentCount) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AnswerCount FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') ORDER BY AnswerCount DESC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20	codebase_community
SELECT T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')	codebase_community
SELECT T1.Body FROM posts AS T1 JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId ORDER BY T2.Count DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND STRFTIME('%Y', Date) = '2011'	codebase_community
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.DisplayName) AS AverageBadges FROM users u LEFT JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE p.Score > 5	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1	codebase_community
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'	codebase_community
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)	codebase_community
SELECT COUNT(*) FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910	codebase_community
SELECT FavoriteCount FROM posts WHERE Id = (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0')	codebase_community
SELECT T1.Text FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ParentId = 107829 AND T2.CommentCount = 1	codebase_community
SELECT CASE WHEN T1.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM posts AS T1 JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 23853 AND T2.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041)	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T2.DisplayName FROM votes AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347	codebase_community
SELECT COUNT(v.Id)  FROM votes v  JOIN posts p ON v.PostId = p.Id  WHERE p.Title LIKE '%data visualization%'	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms'	codebase_community
SELECT CAST(COUNT(DISTINCT p.Id) AS REAL) / COUNT(DISTINCT v.Id)  FROM posts p  LEFT JOIN votes v ON p.Id = v.PostId  WHERE p.OwnerUserId = 24	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'SilentGhost'	codebase_community
SELECT T2.DisplayName FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'thank you user93!'	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion'	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10	codebase_community
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'	codebase_community
SELECT Title FROM posts WHERE LastEditorUserId = (SELECT Id FROM users WHERE DisplayName = 'Vebjorn Ljosa')	codebase_community
SELECT SUM(p.Score), u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'	codebase_community
SELECT SUM(v.BountyAmount) FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data%'	codebase_community
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'	codebase_community
SELECT p.Title, ph.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Tags LIKE '%<humor>%' GROUP BY p.Id, p.Title, ph.Text	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT Id FROM users ORDER BY Views ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'	codebase_community
SELECT COUNT(UserId) FROM (SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) > 5)	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b1 ON u.Id = b1.UserId AND b1.Name = 'Teacher' JOIN badges b2 ON u.Id = b2.UserId AND b2.Name = 'Supporter' WHERE u.Location = 'New York'	codebase_community
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1	codebase_community
SELECT u.UserId FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN postHistory ph ON p.Id = ph.PostId WHERE u.Views >= 1000 GROUP BY u.UserId, p.Id HAVING COUNT(ph.Id) = 1	codebase_community
SELECT b.Name FROM badges b JOIN (     SELECT UserId, COUNT(Id) AS CommentCount     FROM comments     GROUP BY UserId     ORDER BY CommentCount DESC     LIMIT 1 ) c ON b.UserId = c.UserId	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher'	codebase_community
SELECT      ((CAST(SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) -       (CAST(SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) AS REAL) / COUNT(*))) * 100 AS PercentageDifference FROM badges WHERE Name = 'Student'	codebase_community
SELECT DISTINCT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueCommenters FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId	codebase_community
SELECT p.Id, p.ViewCount  FROM posts p  JOIN postLinks pl ON p.Id = pl.RelatedPostId  WHERE pl.PostId = 61217  UNION  SELECT p.Id, p.ViewCount  FROM posts p  JOIN postLinks pl ON p.Id = pl.PostId  WHERE pl.RelatedPostId = 61217	codebase_community
SELECT T1.Score, T2.LinkTypeId FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T1.Id = 395	codebase_community
SELECT Id, OwnerUserId FROM posts WHERE Score > 60	codebase_community
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND STRFTIME('%Y', CreaionDate) = '2011'	codebase_community
SELECT SUM(T1.UpVotes) / COUNT(DISTINCT T1.Id) AS AvgUpVotes, SUM(T1.Age) / COUNT(DISTINCT T1.Id) AS AvgAge FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId GROUP BY T1.Id HAVING COUNT(T2.Id) > 10	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(*) FROM comments WHERE Score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'	codebase_community
SELECT COUNT(Id) FROM posts WHERE Score = 10	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT badges.Name FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Pierre'	codebase_community
SELECT badges.Date  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.Location = 'Rochester, NY'	codebase_community
SELECT CAST(COUNT(DISTINCT CASE WHEN Name = 'Teacher' THEN UserId ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT UserId) FROM badges	codebase_community
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(u.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Organizer'	codebase_community
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT u.Age  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(u.Views)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Supporter' AND u.Age > 65	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(*) FROM users WHERE Location = 'New York'	codebase_community
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) AS Ratio FROM votes	codebase_community
SELECT T3.TagName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId JOIN postTags AS T4 ON T2.Id = T4.PostId JOIN tags AS T3 ON T4.TagId = T3.Id WHERE T1.DisplayName = 'John Salvatier'	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')	codebase_community
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan')	codebase_community
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1	codebase_community
SELECT p.Title, MAX(p.ViewCount) AS ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.Title ORDER BY ViewCount DESC LIMIT 1;	codebase_community
SELECT COUNT(DISTINCT p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  JOIN votes v ON p.Id = v.PostId  WHERE u.DisplayName = 'Matt Parker'  GROUP BY p.Id  HAVING COUNT(v.Id) > 4	codebase_community
SELECT COUNT(*) FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60	codebase_community
SELECT T1.Tags FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Mark Meckes' AND T1.CommentCount = 0	codebase_community
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'	codebase_community
SELECT CAST(SUM(CASE WHEN T1.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.PostId) AS percentage FROM tags AS T1 JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T2.OwnerDisplayName = 'Community'	codebase_community
SELECT SUM(CASE WHEN T2.DisplayName = 'Mornington' THEN T1.ViewCount ELSE 0 END) - SUM(CASE WHEN T2.DisplayName = 'Amos' THEN T1.ViewCount ELSE 0 END) AS ViewCountDifference FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'	codebase_community
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60	codebase_community
SELECT p.Title, c.UserDisplayName  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.Score > 60;	codebase_community
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND STRFTIME('%Y', b.Date) = '2011'	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150	codebase_community
SELECT COUNT(ph.Id) AS PostHistoryCounts, p.LastEditDate FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'	codebase_community
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time')	codebase_community
SELECT p.Id, b.Name  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  JOIN badges b ON u.Id = b.UserId  WHERE u.DisplayName = 'Samuel' AND STRFTIME('%Y', p.CreationDate) = '2013' AND STRFTIME('%Y', b.Date) = '2013'	codebase_community
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT u.DisplayName, u.Location  FROM users u  JOIN tags t ON u.Id = t.ExcerptPostId  WHERE t.TagName = 'hypothesis-testing'	codebase_community
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title = 'What are principal component scores?'	codebase_community
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ParentId IS NOT NULL ORDER BY T1.Score DESC LIMIT 1	codebase_community
SELECT u.DisplayName, u.WebsiteUrl FROM votes v JOIN users u ON v.UserId = u.Id WHERE v.VoteTypeId = 8 ORDER BY v.BountyAmount DESC LIMIT 1	codebase_community
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5	codebase_community
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(DISTINCT v.PostId) FROM votes v JOIN posts p ON v.PostId = p.Id WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50	codebase_community
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(pl.Id) AS REAL) / 12 FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE STRFTIME('%Y', pl.CreationDate) = '2010' AND p.AnswerCount <= 2	codebase_community
SELECT p.Id FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1	codebase_community
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId ORDER BY pl.CreationDate ASC LIMIT 1	codebase_community
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Name) DESC LIMIT 1	codebase_community
SELECT MIN(CreationDate) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'chl')	codebase_community
SELECT MIN(p.CreaionDate)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age = (SELECT MIN(Age) FROM users)	codebase_community
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date ASC LIMIT 1	codebase_community
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4	codebase_community
SELECT AVG(v.PostId)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.Age = (SELECT MAX(Age) FROM users)	codebase_community
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND STRFTIME('%Y', CreaionDate) = '2010'	codebase_community
SELECT Id, Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1	codebase_community
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1	codebase_community
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner')	codebase_community
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND STRFTIME('%Y', p.CreationDate) = '2011'	codebase_community
SELECT Id, OwnerDisplayName FROM posts WHERE STRFTIME('%Y', CreaionDate) = '2010' ORDER BY FavoriteCount DESC LIMIT 1	codebase_community
SELECT CAST(SUM(CASE WHEN YEAR(p.CreaionDate) = 2011 AND u.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id	codebase_community
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) AS percentage FROM users	codebase_community
SELECT T1.ViewCount, T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Computer Game Datasets'	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
SELECT T2.DisplayName, T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Id = 183 ORDER BY T1.LastEditDate DESC LIMIT 1	codebase_community
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Emmett'  ORDER BY b.Date DESC  LIMIT 1	codebase_community
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000	codebase_community
SELECT strftime('%J', badges.Date) - strftime('%J', users.CreationDate) AS Days FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Zolomon';	codebase_community
SELECT COUNT(DISTINCT p.Id) AS PostCount, COUNT(DISTINCT c.Id) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users)	codebase_community
SELECT c.Text, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(*) FROM posts INNER JOIN postTags ON posts.Id = postTags.PostId INNER JOIN tags ON postTags.TagId = tags.Id WHERE tags.TagName = 'careers'	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT COUNT(DISTINCT CASE WHEN T2.PostTypeId = 2 THEN T2.Id END) AS AnswerCount, COUNT(DISTINCT CASE WHEN T2.PostTypeId = 1 THEN T1.Id END) AS CommentCount FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >= 30	codebase_community
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)	codebase_community
SELECT COUNT(*) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT u.Reputation, u.UpVotes  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text = 'fine, you win :)'	codebase_community
SELECT c.Text  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE p.Title LIKE '%linear regression%'	codebase_community
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1	codebase_community
SELECT u.CreationDate, u.Age  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text LIKE '%http://%';	codebase_community
SELECT COUNT(DISTINCT c.PostId) FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE CommentCount = 1) AND Score = 0	codebase_community
SELECT COUNT(DISTINCT c.UserId)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40	codebase_community
SELECT p.Id, c.Text  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE p.Title = 'Group differences on a five point Likert item'	codebase_community
SELECT T1.UpVotes FROM users AS T1 JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'R is also lazy evaluated.'	codebase_community
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky'	codebase_community
SELECT DISTINCT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0	codebase_community
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10	codebase_community
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'	superhero
SELECT COUNT(*) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND h.height_cm > 200	superhero
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue'	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN colour c ON h.eye_colour_id = c.id JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility'	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Blond'	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'Marvel Comics' ORDER BY height_cm DESC	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT c.colour, COUNT(s.id) as popularity FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN colour c ON s.eye_colour_id = c.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY popularity DESC	superhero
SELECT AVG(height_cm) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')	superhero
SELECT s.superhero_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'	superhero
SELECT COUNT(*) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics'	superhero
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero AS h JOIN colour AS c ON h.eye_colour_id = c.id JOIN publisher AS p ON h.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics'	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero AS h JOIN colour AS c ON h.hair_colour_id = c.id WHERE c.colour = 'Blond'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female' AND a.attribute_name = 'Strength' AND ha.attribute_value = 100	superhero
SELECT superhero_name FROM superhero WHERE id = (SELECT hero_id FROM hero_power GROUP BY hero_id ORDER BY COUNT(power_id) DESC LIMIT 1)	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id), SUM(CASE WHEN T1.alignment = 'Bad' AND T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) FROM alignment AS T1 JOIN superhero AS T2 ON T1.id = T2.alignment_id	superhero
SELECT SUM(CASE WHEN T.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS difference FROM (     SELECT DISTINCT T2.publisher_name     FROM superhero AS T1     JOIN publisher AS T2 ON T1.publisher_id = T2.id     WHERE T2.publisher_name IN ('Marvel Comics', 'DC Comics') ) AS T	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'	superhero
SELECT AVG(attribute_value) FROM hero_attribute	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')	superhero
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id JOIN gender g ON sh.gender_id = g.id WHERE g.gender = 'Male' GROUP BY sp.power_name LIMIT 5	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'No Colour')	superhero
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.height_cm = 185 AND T3.race = 'Human'	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180	superhero
SELECT superhero_name FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT power_name FROM superpower WHERE id = (SELECT power_id FROM hero_power GROUP BY power_id ORDER BY COUNT(*) DESC LIMIT 1)	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination'	superhero
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1	superhero
SELECT COUNT(*) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth'	superhero
SELECT s.full_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength'  ORDER BY ha.attribute_value DESC  LIMIT 1	superhero
SELECT CAST(SUM(CASE WHEN T1.skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight'	superhero
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'	superhero
SELECT CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Female')	superhero
SELECT T1.superhero_name, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'	superhero
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'	superhero
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Adaptation'	superhero
SELECT COUNT(*) FROM hero_power AS hp JOIN superhero AS s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo'	superhero
SELECT sp.power_name FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE h.full_name = 'Hunter Zolomon'	superhero
SELECT height_cm FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Amber')	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'	superhero
SELECT DISTINCT c.colour FROM colour c JOIN superhero s ON c.id = s.eye_colour_id JOIN colour sc ON sc.id = s.skin_colour_id WHERE sc.colour = 'Gold'	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute ha2 JOIN attribute a2 ON ha2.attribute_id = a2.id WHERE a2.attribute_name = 'Strength')	superhero
SELECT race, alignment FROM superhero JOIN race ON superhero.race_id = race.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero_name = 'Cameron Hicks'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'	superhero
SELECT AVG(weight_kg) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference	superhero
SELECT AVG(height_cm) AS average_height FROM superhero	superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3	superhero
SELECT attribute.attribute_name, hero_attribute.attribute_value FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = '3-D Man'	superhero
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Brown'	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1	superhero
SELECT CAST(SUM(CASE WHEN T2.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.superhero_name) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id	superhero
SELECT CAST(SUM(CASE WHEN T2.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS ratio FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis'	superhero
SELECT superhero_name FROM superhero WHERE id = 294	superhero
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'	superhero
SELECT sp.power_name FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE h.full_name = 'Helen Parr'	superhero
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38	superhero
SELECT r.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN race r ON s.race_id = r.id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)	superhero
SELECT T3.alignment, T5.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN alignment AS T3 ON T1.alignment_id = T3.id JOIN superpower AS T5 ON T2.power_id = T5.id WHERE T1.superhero_name = 'Atom IV'	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5	superhero
SELECT AVG(attribute_value) FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE alignment_id = 3)	superhero
SELECT DISTINCT c.colour  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN colour c ON s.skin_colour_id = c.id  WHERE ha.attribute_value = 100	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80	superhero
SELECT race.race FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN colour ON superhero.hair_colour_id = colour.id JOIN race ON superhero.race_id = race.id WHERE gender.gender = 'Male' AND colour.colour = 'Blue'	superhero
SELECT CAST(SUM(CASE WHEN T2.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM alignment AS T1 JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T1.id = 2	superhero
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk'	superhero
SELECT sp.power_name FROM superhero AS h JOIN hero_power AS hp ON h.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE h.superhero_name = 'Ajax'	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';	superhero
SELECT COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC	superhero
SELECT g.gender FROM gender g JOIN superhero s ON g.id = s.gender_id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force'	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1	superhero
SELECT AVG(height_cm) FROM superhero WHERE race_id != (SELECT id FROM race WHERE race = 'Human') AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')	superhero
SELECT COUNT(*) FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100	superhero
SELECT      SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -      SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id;	superhero
SELECT T2.attribute_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T1.attribute_value ASC LIMIT 1	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'	superhero
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN publisher AS T3 ON T3.id = T2.publisher_id WHERE T3.publisher_name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM alignment AS T1 JOIN superhero AS T2 ON T1.id = T2.alignment_id JOIN publisher AS T3 ON T3.id = T2.publisher_id WHERE T3.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'	superhero
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1	superhero
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')	superhero
SELECT T1.full_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'	superhero
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Aquababy'	superhero
SELECT T1.weight_kg, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40	superhero
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3	superhero
SELECT ha.hero_id FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence'	superhero
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'	superhero
SELECT sp.power_name  FROM superhero h  JOIN hero_power hp ON h.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE h.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)	superhero
SELECT driverRef FROM drivers WHERE driverId IN (SELECT driverId FROM qualifying WHERE raceId = 20 ORDER BY q1 DESC LIMIT 5)	formula_1
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 ORDER BY T2.q2 ASC LIMIT 1	formula_1
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.location = 'Shanghai'	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Circuit de Barcelona-Catalunya"	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Germany'	formula_1
SELECT T2.position FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid WHERE T1.name = 'Renault'	formula_1
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitid IN (SELECT circuitid FROM circuits WHERE country NOT IN ('Asia', 'Europe'))	formula_1
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Spain"	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'	formula_1
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT T2.country FROM constructorResults AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 24 AND T1.points = 1	formula_1
SELECT q.q1 FROM qualifying AS q JOIN drivers AS d ON q.driverId = d.driverId WHERE q.raceId = 354 AND d.forename = 'Bruno' AND d.surname = 'Senna'	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 355 AND T2.q2 = '0:01:40'	formula_1
SELECT T1.number FROM qualifying AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 903 AND T1.q3 LIKE '1:54%'	formula_1
SELECT COUNT(*) FROM results INNER JOIN races ON results.raceId = races.raceId INNER JOIN status ON results.statusId = status.statusId WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND status.status != 'Finished'	formula_1
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901	formula_1
SELECT COUNT(*) FROM results AS R JOIN races AS Ra ON R.raceId = Ra.raceId WHERE Ra.date = '2015-11-29' AND R.time IS NOT NULL	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT d.forename, d.surname, d.url FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE l.raceid = 161 AND l.time = '0:01:27'	formula_1
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 ORDER BY T1.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Malaysian Grand Prix'	formula_1
SELECT T2.url FROM constructorResults AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi') AND raceId = 345	formula_1
SELECT T2.nationality FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 347 AND T1.q2 = '0:01:15'	formula_1
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 45 AND T2.q3 LIKE '%1:33%'	formula_1
SELECT T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Bruce' AND T1.surname = 'McLaren' AND T2.raceid = 743	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2	formula_1
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceId = 901	formula_1
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId != 1	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 348 ORDER BY T2.time ASC LIMIT 1	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1	formula_1
SELECT ((T1.fastestLapSpeed - T2.fastestLapSpeed) / T1.fastestLapSpeed) * 100 AS percentage FROM results AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.raceId = 853 AND T2.raceId = 854 AND T3.forename = 'Paul' AND T3.surname = 'di Resta'	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) AS completion_rate FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.date = '1983-07-16'	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'	formula_1
SELECT name FROM races WHERE year = 2005 ORDER BY name DESC	formula_1
SELECT name FROM races WHERE date = (SELECT MIN(date) FROM races)	formula_1
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1	formula_1
SELECT year FROM races GROUP BY year ORDER BY COUNT(raceId) DESC LIMIT 1	formula_1
SELECT name FROM races WHERE YEAR = 2017 AND raceId NOT IN (SELECT raceId FROM races WHERE YEAR = 2000)	formula_1
SELECT T1.country, T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Europe' ORDER BY T2.year ASC LIMIT 1	formula_1
SELECT MAX(r.year) FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE c.name = 'Brands Hatch' AND r.name = 'British Grand Prix'	formula_1
SELECT COUNT(DISTINCT T2.year) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone' AND T1.country = 'United Kingdom' AND T2.name = 'British Grand Prix'	formula_1
SELECT d.forename, d.surname FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 2010 AND ra.name = 'Singapore Grand Prix' ORDER BY r.positionOrder	formula_1
SELECT T1.forename, T1.surname, MAX(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid GROUP BY T1.driverid ORDER BY SUM(T2.points) DESC LIMIT 1	formula_1
SELECT d.forename, d.surname, ds.points FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid JOIN races r ON ds.raceid = r.raceid WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3	formula_1
SELECT MIN(T1.milliseconds), T2.forename, T2.surname, T3.name FROM laptimes AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T1.raceid = T3.raceid	formula_1
SELECT AVG(laptimes.milliseconds) FROM laptimes JOIN drivers ON laptimes.driverid = drivers.driverid JOIN races ON laptimes.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009	formula_1
SELECT CAST(SUM(CASE WHEN T3.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.raceId) FROM drivers AS T1 JOIN results AS T3 ON T1.driverid = T3.driverid JOIN races AS T2 ON T3.raceid = T2.raceid WHERE T1.surname = 'Hamilton' AND T2.year >= 2010	formula_1
SELECT d.forename, d.surname, d.nationality, MAX(ds.points) AS max_points FROM drivers d JOIN driverstandings ds ON d.driverid = ds.driverid GROUP BY d.driverid ORDER BY SUM(ds.wins) DESC LIMIT 1	formula_1
SELECT forename, surname, YEAR(CURRENT_TIMESTAMP) - YEAR(dob) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.name HAVING COUNT(r.raceid) = 4	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006	formula_1
SELECT races.name, circuits.name AS circuit_name, circuits.location  FROM races  JOIN circuits ON races.circuitid = circuits.circuitid  WHERE MONTH(races.date) = 9 AND YEAR(races.date) = 2005	formula_1
SELECT races.name FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20	formula_1
SELECT COUNT(*)  FROM results r  JOIN races ra ON r.raceId = ra.raceId  JOIN circuits c ON ra.circuitId = c.circuitId  JOIN drivers d ON r.driverId = d.driverId  WHERE c.name = 'Sepang International Circuit'  AND d.forename = 'Michael'  AND d.surname = 'Schumacher'  AND r.position = 1	formula_1
SELECT r.name, r.year FROM results res JOIN races r ON res.raceId = r.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestlapspeed DESC LIMIT 1	formula_1
SELECT AVG(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T3.year = 2000	formula_1
SELECT races.name, results.points FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY races.year ASC LIMIT 1;	formula_1
SELECT r.name, c.country FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.year = 2017 ORDER BY r.date	formula_1
SELECT r.name, r.year, c.location  FROM results res  JOIN races r ON res.raceId = r.raceId  JOIN circuits c ON r.circuitId = c.circuitId  GROUP BY r.raceId  ORDER BY SUM(res.laps) DESC  LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'	formula_1
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian'	formula_1
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson';	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';	formula_1
SELECT c.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix'	formula_1
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = "Silverstone Circuit"	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone'	formula_1
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Abu Dhabi Grand Prix' AND T2.year = 2010	formula_1
SELECT COUNT(*) FROM races AS r JOIN circuits AS c ON r.circuitid = c.circuitid WHERE c.country = 'Italy'	formula_1
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Barcelona-Catalunya'	formula_1
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT MIN(T1.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverid = r.driverid WHERE r.fastestlapspeed = (     SELECT MAX(fastestlapspeed) FROM results )	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2007 AND T2.positionOrder = 1	formula_1
SELECT r.name FROM results res JOIN races r ON res.raceid = r.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT races.name  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'  ORDER BY results.rank ASC  LIMIT 1	formula_1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT DISTINCT s.year FROM seasons s JOIN races r ON s.year = r.year JOIN results res ON r.raceid = res.raceid JOIN drivers d ON res.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT T1.positionOrder FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' AND T2.name = 'Chinese Grand Prix' AND T2.year = 2008	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4	formula_1
SELECT COUNT(*) FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN status AS s ON r.statusId = s.statusId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND s.status = 'Finished' AND r.time IS NOT NULL	formula_1
SELECT MIN(milliseconds) AS FastestLapMilliseconds FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN drivers d ON r.driverId = d.driverId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix' AND T2.year = 2008 AND T1.position = 2	formula_1
SELECT d.forename, d.surname, d.url FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix' AND r.time LIKE '%:%:%.%'	formula_1
SELECT COUNT(*) FROM results AS R JOIN races AS Ra ON R.raceId = Ra.raceId JOIN drivers AS D ON R.driverId = D.driverId WHERE Ra.year = 2008 AND Ra.name = 'Australian Grand Prix' AND D.nationality = 'British'	formula_1
SELECT COUNT(DISTINCT T2.driverId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN status AS T3 ON T2.statusId = T3.statusId WHERE T1.year = 2008 AND T1.name = 'Chinese Grand Prix' AND T3.status = 'Finished'	formula_1
SELECT SUM(points) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(CAST(SUBSTR(T2.fastestLapTime, 1, INSTR(T2.fastestLapTime, ':') - 1) AS REAL) * 60 + CAST(SUBSTR(T2.fastestLapTime, INSTR(T2.fastestLapTime, ':') + 1) AS REAL)) AS average_fastest_lap_time_seconds FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.raceId) FROM lapTimes AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'	formula_1
SELECT ((SUBSTR(T1.time, -12) - SUBSTR(T2.time, -12)) / SUBSTR(T2.time, -12)) * 100 AS percentage_difference FROM results AS T1 JOIN (     SELECT time     FROM results     JOIN races ON results.raceId = races.raceId     JOIN circuits ON races.circuitId = circuits.circuitId     WHERE races.year = 2008 AND circuits.name = 'Albert Park Grand Prix Circuit'     ORDER BY CAST(SUBSTR(time, -12) AS TIME) DESC     LIMIT 1 ) AS T2 JOIN races ON T1.raceId = races.raceId JOIN circuits ON races.circuitId = circuits.circuitId WHERE T1.position = 1 AND races.year = 2008 AND circuits.name = 'Albert Park Grand Prix Circuit'	formula_1
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-12-31'	formula_1
SELECT MAX(points) FROM constructorstandings WHERE constructorid IN (SELECT constructorid FROM constructors WHERE nationality = 'British')	formula_1
SELECT T2.name FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid GROUP BY T2.name ORDER BY SUM(T1.points) DESC LIMIT 1	formula_1
SELECT T2.name FROM constructorresults AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 291 AND T1.points = 0	formula_1
SELECT COUNT(*) FROM (SELECT constructorId FROM constructorStandings WHERE points = 0 AND constructorId IN (SELECT constructorId FROM constructors WHERE nationality = 'Japanese') GROUP BY constructorId HAVING COUNT(raceId) = 2)	formula_1
SELECT DISTINCT T2.name FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.position = 1	formula_1
SELECT COUNT(DISTINCT c.constructorId)  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'French' AND cs.raceId IN (     SELECT raceId      FROM lapTimes      WHERE lap > 50 )	formula_1
SELECT CAST(SUM(CASE WHEN T3.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T3 ON T1.driverId = T3.driverId JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.nationality = 'Japanese' AND T2.year BETWEEN 2007 AND 2009	formula_1
SELECT r.year, AVG(strftime('%s', r.time)) AS avg_time_seconds FROM results r JOIN status s ON r.statusId = s.statusId WHERE r.year < 1975 AND s.status = 'Finished' AND r.position = 1 GROUP BY r.year	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.dob > '1975-12-31' AND r.rank = 2	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE d.nationality = 'Italian' AND r.time IS NULL	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1	formula_1
SELECT T1.fastestLap FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T1.position = 1	formula_1
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009	formula_1
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds IS NOT NULL ORDER BY T2.milliseconds ASC LIMIT 1	formula_1
SELECT CAST(SUM(CASE WHEN d.dob < '1985-01-01' AND r.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(r.driverId) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE r.year BETWEEN 2000 AND 2005	formula_1
SELECT COUNT(DISTINCT d.driverId)  FROM drivers d  JOIN laptimes l ON d.driverId = l.driverId  WHERE d.nationality = 'French' AND l.milliseconds < 120000	formula_1
SELECT code FROM drivers WHERE nationality = 'American'	formula_1
SELECT raceId FROM races WHERE year = 2009	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18	formula_1
SELECT code FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) FROM drivers WHERE nationality = 'Dutch' AND driverId IN (SELECT driverId FROM drivers ORDER BY dob DESC LIMIT 3);	formula_1
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'	formula_1
SELECT d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'German' AND STRFTIME('%Y', d.dob) BETWEEN '1980' AND '1990' GROUP BY d.driverid ORDER BY earliest_lap_time ASC LIMIT 3	formula_1
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1	formula_1
SELECT d.driverid, d.code FROM drivers d JOIN results r ON d.driverid = r.driverid WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime IS NOT NULL	formula_1
SELECT d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'Spanish' AND STRFTIME('%Y', d.dob) < '1982' GROUP BY d.driverid ORDER BY latest_lap_time DESC LIMIT 10	formula_1
SELECT year FROM races WHERE raceId = (SELECT raceId FROM results ORDER BY fastestLapTime ASC LIMIT 1)	formula_1
SELECT T1.year FROM races AS T1 JOIN laptimes AS T2 ON T1.raceid = T2.raceid ORDER BY T2.milliseconds DESC LIMIT 1	formula_1
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5	formula_1
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND time IS NOT NULL	formula_1
SELECT COUNT(*), location, lat, lng FROM circuits WHERE country = 'Austria'	formula_1
SELECT raceId, COUNT(*) AS finisher_count FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finisher_count DESC LIMIT 1	formula_1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL	formula_1
SELECT races.year, drivers.forename, drivers.surname, races.date, qualifying.q1  FROM qualifying  JOIN races ON qualifying.raceId = races.raceId  JOIN drivers ON qualifying.driverId = drivers.driverId  WHERE drivers.dob = (SELECT MAX(dob) FROM drivers)  ORDER BY races.date ASC  LIMIT 1	formula_1
SELECT COUNT(*) FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId JOIN status AS s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture';	formula_1
SELECT c.name, c.url  FROM constructors c  JOIN constructorstandings cs ON c.constructorid = cs.constructorid  WHERE c.nationality = 'Italian'  GROUP BY c.constructorid  ORDER BY SUM(cs.points) DESC  LIMIT 1	formula_1
SELECT T1.url FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid GROUP BY T1.constructorid ORDER BY SUM(T2.wins) DESC LIMIT 1	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN races r ON d.driverid = lt.driverid JOIN laptimes lt ON d.driverid = lt.driverid WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.time DESC LIMIT 1	formula_1
SELECT r.name, lt.milliseconds FROM races r JOIN laptimes lt ON r.raceid = lt.raceid WHERE lt.lap = 1 ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(TIME) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2006 AND name = 'United States Grand Prix') AND rank < 11	formula_1
SELECT d.forename, d.surname FROM drivers d JOIN pitstops p ON d.driverid = p.driverid WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverid ORDER BY AVG(p.duration) ASC LIMIT 3	formula_1
SELECT T3.forename, T3.surname, T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T2.name = 'Canadian Grand Prix' AND T2.year = 2008 ORDER BY T1.positionorder LIMIT 1	formula_1
SELECT T2.constructorRef, T2.url FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid JOIN races AS T3 ON T1.raceid = T3.raceid WHERE T3.year = 2009 AND T3.name = 'Singapore Grand Prix' ORDER BY T1.points DESC LIMIT 1	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'	formula_1
SELECT forename || ' ' || surname AS fullname, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT cs.points, c.name, c.nationality  FROM constructorstandings cs  JOIN constructors c ON cs.constructorid = c.constructorid  JOIN races r ON cs.raceid = r.raceid  WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010  ORDER BY cs.points DESC  LIMIT 1	formula_1
SELECT AVG(T1.points) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId JOIN drivers AS T4 ON T1.driverId = T4.driverId WHERE T4.forename = 'Lewis' AND T4.surname = 'Hamilton' AND T3.country = 'Turkey'	formula_1
SELECT AVG(race_count) FROM (SELECT YEAR(date) AS race_year, COUNT(*) AS race_count FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY YEAR(date))	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1	formula_1
SELECT SUM(wins) FROM driverstandings WHERE points = 91	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid ORDER BY T2.fastestLapTime ASC LIMIT 1	formula_1
SELECT T1.location, T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid ORDER BY T2.date DESC LIMIT 1	formula_1
SELECT T2.forename, T2.surname FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId JOIN circuits AS T4 ON T3.circuitid = T4.circuitid WHERE T4.name = 'Marina Bay Street Circuit' AND T3.year = 2008 ORDER BY T1.q3 LIMIT 1	formula_1
SELECT d.forename || ' ' || d.surname AS FullName, d.nationality, r.name AS FirstRaceName FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (     SELECT MAX(dob) FROM drivers ) LIMIT 1	formula_1
SELECT COUNT(*)  FROM results r  JOIN races ra ON r.raceId = ra.raceId  JOIN status s ON r.statusId = s.statusId  WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident'  GROUP BY r.driverId  ORDER BY COUNT(*) DESC  LIMIT 1	formula_1
SELECT T1.forename, T1.surname, COUNT(T2.wins) AS wins FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.wins = 1 GROUP BY T1.driverid ORDER BY T1.dob ASC LIMIT 1	formula_1
SELECT MAX(duration) FROM pitStops	formula_1
SELECT MIN(milliseconds) FROM lapTimes	formula_1
SELECT MAX(T1.duration) FROM pitstops AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'	formula_1
SELECT lap FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2011)	formula_1
SELECT d.forename, d.surname, p.duration FROM pitStops p JOIN races r ON p.raceId = r.raceId JOIN drivers d ON p.driverId = d.driverId WHERE r.name = 'Australian Grand Prix' AND r.year = 2011	formula_1
SELECT MIN(time) AS lap_record FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT d.forename, d.surname, l.time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid ORDER BY l.time ASC LIMIT 20;	formula_1
SELECT c.name, c.location  FROM circuits c  JOIN races r ON c.circuitid = r.circuitid  JOIN results res ON r.raceid = res.raceid  JOIN drivers d ON res.driverid = d.driverid  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  ORDER BY res.fastestlaptime ASC  LIMIT 1	formula_1
SELECT MIN(T1.time) AS FastestLapTime FROM laptimes AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T2.circuitid = T3.circuitid WHERE T3.name = 'Austrian Grand Prix'	formula_1
SELECT c.name AS CircuitName, MIN(l.time) AS FastestLapTime FROM circuits c JOIN races r ON c.circuitid = r.circuitid JOIN laptimes l ON r.raceid = l.raceid WHERE c.country = 'Italy' GROUP BY c.name	formula_1
SELECT r.name, lt.time FROM races r JOIN laptimes lt ON r.raceId = lt.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix Circuit' ORDER BY lt.milliseconds ASC LIMIT 1;	formula_1
SELECT ps.duration  FROM pitstops ps  JOIN races r ON ps.raceid = r.raceid  JOIN circuits c ON r.circuitid = c.circuitid  JOIN laptimes lt ON ps.raceid = lt.raceid AND ps.driverid = lt.driverid  WHERE c.name = 'Austrian Grand Prix Circuit'  AND lt.time = (     SELECT MIN(time)      FROM laptimes      WHERE raceid = r.raceid )	formula_1
SELECT c.lat, c.lng FROM circuits c JOIN races r ON c.circuitid = r.circuitid JOIN laptimes l ON r.raceid = l.raceid WHERE l.time = '1:29.488'	formula_1
SELECT AVG(milliseconds) FROM pitStops WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT AVG(T3.milliseconds) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN laptimes AS T3 ON T2.raceid = T3.raceid WHERE T1.country = 'Italy'	formula_1
SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1	european_football_2
SELECT player_name, height FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'	european_football_2
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5	european_football_2
SELECT L.name FROM League AS L JOIN Match AS M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T1.team_long_name  FROM Team AS T1  JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id  WHERE T2.season = '2015/2016' AND T2.home_team_goal < T2.away_team_goal  GROUP BY T1.team_api_id  ORDER BY COUNT(*) ASC  LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.penalties DESC LIMIT 10	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id JOIN League AS T3 ON T2.league_id = T3.id WHERE T3.name = 'Scotland Premier League' AND T2.season = '2009/2010' AND T2.away_team_goal > T2.home_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT buildUpPlaySpeed FROM Team_Attributes ORDER BY buildUpPlaySpeed DESC LIMIT 4	european_football_2
SELECT L.name  FROM Match M  JOIN League L ON M.league_id = L.id  WHERE M.season = '2015/2016' AND M.home_team_goal = M.away_team_goal  GROUP BY L.name  ORDER BY COUNT(*) DESC  LIMIT 1	european_football_2
SELECT strftime('%Y', 'now') - strftime('%Y', P.birthday) AS age FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.sprint_speed >= 97 AND strftime('%Y', PA.date) BETWEEN '2013' AND '2015'	european_football_2
SELECT T1.name, COUNT(T2.league_id) as match_count FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T2.league_id ORDER BY match_count DESC LIMIT 1	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' ORDER BY overall_rating - (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%') DESC LIMIT 1	european_football_2
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE buildUpPlayPassing IS NOT NULL)	european_football_2
SELECT CAST(SUM(CASE WHEN T1.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.player_fifa_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T2.birthday) BETWEEN '1987' AND '1992'	european_football_2
SELECT L.name, SUM(M.home_team_goal + M.away_team_goal) AS total_goals FROM League L JOIN Match M ON L.id = M.league_id GROUP BY L.name ORDER BY total_goals ASC LIMIT 5;	european_football_2
SELECT CAST(SUM(T1.long_shots) AS REAL) / COUNT(T1.player_fifa_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ahmed Samir Farag'	european_football_2
SELECT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY AVG(PA.heading_accuracy) DESC LIMIT 10	european_football_2
SELECT T.team_long_name  FROM Team AS T  JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id  WHERE TA.buildUpPlayDribblingClass = 'Normal'  AND TA.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00'  AND TA.chanceCreationPassing < (     SELECT AVG(chanceCreationPassing)      FROM Team_Attributes      WHERE date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' )  ORDER BY TA.chanceCreationPassing DESC	european_football_2
SELECT L.name FROM League AS L JOIN Match AS M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING SUM(M.home_team_goal) > SUM(M.away_team_goal)	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'	european_football_2
SELECT player_name FROM Player WHERE birthday LIKE '1970-10%'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Franco Zennaro'	european_football_2
SELECT T1.buildUpPlayPositioningClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'ADO Den Haag'	european_football_2
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Francois Affolter' AND T1.date = '2014-09-18 00:00:00'	european_football_2
SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') AND strftime('%Y', date) = '2011'	european_football_2
SELECT COUNT(*) FROM Match AS M JOIN League AS L ON M.league_id = L.id WHERE M.season = '2015/2016' AND L.name = 'Scotland Premier League'	european_football_2
SELECT T2.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.birthday DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY potential DESC LIMIT 1)	european_football_2
SELECT COUNT(DISTINCT P.player_api_id) FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.weight < 130 AND PA.preferred_foot = 'left'	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'	european_football_2
SELECT T2.defensive_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson'	european_football_2
SELECT P.birthday FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id ORDER BY PA.overall_rating DESC LIMIT 1	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Netherlands'	european_football_2
SELECT AVG(home_team_goal) FROM Match INNER JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Poland' AND Match.season = '2010/2011'	european_football_2
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.height = (SELECT MAX(height) FROM Player) OR p.height = (SELECT MIN(height) FROM Player)  GROUP BY p.player_name  ORDER BY AVG(pa.finishing) DESC  LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE height > 180	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170	european_football_2
SELECT DISTINCT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating > 80 AND strftime('%Y', PA.date) BETWEEN '2008' AND '2010'	european_football_2
SELECT T2.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'left')	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'	european_football_2
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'CLB'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70	european_football_2
SELECT SUM(t2.overall_rating) / COUNT(t2.id) AS avg_overall_rating FROM Player t1 JOIN Player_Attributes t2 ON t1.player_api_id = t2.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170	european_football_2
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Italy Serie A'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'	european_football_2
SELECT COUNT(*) FROM Match INNER JOIN League ON Match.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10'	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = 61 ORDER BY T2.balance DESC LIMIT 1	european_football_2
SELECT (SUM(CASE WHEN T2.player_name = 'Abdou Diallo' THEN T1.ball_control ELSE 0 END) / COUNT(CASE WHEN T2.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T2.player_name = 'Aaron Appindangoye' THEN T1.ball_control ELSE 0 END) / COUNT(CASE WHEN T2.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) AS diff FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'	european_football_2
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday ASC LIMIT 1	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'	european_football_2
SELECT Country.name FROM Country JOIN League ON Country.id = League.country_id WHERE League.name = 'Belgium Jupiler League'	european_football_2
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany'	european_football_2
SELECT Player.player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  ORDER BY Player_Attributes.overall_rating DESC  LIMIT 1	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'high'	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1)	european_football_2
SELECT T2.heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(DISTINCT P.player_api_id) FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 AND PA.volleys > 70	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70	european_football_2
SELECT COUNT(*) FROM Match AS m JOIN Country AS c ON m.country_id = c.id WHERE c.name = 'Belgium' AND m.season = '2008/2009'	european_football_2
SELECT T1.long_passing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.birthday ASC LIMIT 1	european_football_2
SELECT COUNT(*) FROM Match INNER JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(Match.date, 1, 7) = '2009-04'	european_football_2
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'	european_football_2
SELECT ((MAX(CASE WHEN T2.player_name = 'Ariel Borysiuk' THEN T1.overall_rating END) - MAX(CASE WHEN T2.player_name = 'Paulin Puel' THEN T1.overall_rating END)) * 100.0 / MAX(CASE WHEN T2.player_name = 'Paulin Puel' THEN T1.overall_rating END)) AS percentage_difference FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT AVG(T1.buildUpPlaySpeed) FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(T1.chanceCreationPassing), T1.chanceCreationPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Ajax'	european_football_2
SELECT T2.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo'	european_football_2
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(away_team_goal) FROM Match AS M JOIN Team AS T ON M.away_team_api_id = T.team_api_id JOIN Country AS C ON M.country_id = C.id WHERE T.team_long_name = 'Parma' AND C.name = 'Italy'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1	european_football_2
SELECT T2.overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Mooy' AND T2.date LIKE '2016-02-04%'	european_football_2
SELECT potential FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Francesco Parravicini') AND date = '2010-08-30 00:00:00'	european_football_2
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date LIKE '2015-05-01%'	european_football_2
SELECT T1.defensive_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22 00:00:00'	european_football_2
SELECT date FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Kevin Constant') ORDER BY crossing DESC LIMIT 1	european_football_2
SELECT T1.buildUpPlaySpeedClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Willem II' AND T1.date = '2012-02-22'	european_football_2
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00'	european_football_2
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'	european_football_2
SELECT T1.chanceCreationPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00'	european_football_2
SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id JOIN Team AS T3 ON T2.home_team_api_id = T3.team_api_id WHERE T3.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00' UNION SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id JOIN Team AS T3 ON T2.away_team_api_id = T3.team_api_id WHERE T3.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'	european_football_2
SELECT T1.defenceAggressionClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(T2.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT CAST((MAX(CASE WHEN T1.player_name = 'Landon Donovan' THEN T2.overall_rating ELSE 0 END) - MAX(CASE WHEN T1.player_name = 'Jordan Bowery' THEN T2.overall_rating ELSE 0 END)) AS REAL) * 100 / MAX(CASE WHEN T1.player_name = 'Landon Donovan' THEN T2.overall_rating ELSE 0 END) AS Percentage FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.date = '2013-07-12' AND T1.player_name IN ('Landon Donovan', 'Jordan Bowery')	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10	european_football_2
SELECT player_name FROM Player WHERE (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', birthday)) > 34	european_football_2
SELECT SUM(CASE WHEN T1.player_name = 'Aaron Lennon' THEN 1 ELSE 0 END) AS home_team_goals FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.home_player_1 OR T1.player_api_id = T2.home_player_2 OR T1.player_api_id = T2.home_player_3 OR T1.player_api_id = T2.home_player_4 OR T1.player_api_id = T2.home_player_5 OR T1.player_api_id = T2.home_player_6 OR T1.player_api_id = T2.home_player_7 OR T1.player_api_id = T2.home_player_8 OR T1.player_api_id = T2.home_player_9 OR T1.player_api_id = T2.home_player_10 OR T1.player_api_id = T2.home_player_11	european_football_2
SELECT SUM(CASE WHEN T1.player_name = 'Daan Smith' THEN T2.away_team_goal ELSE 0 END) +        SUM(CASE WHEN T1.player_name = 'Filipe Ferreira' THEN T2.away_team_goal ELSE 0 END) AS total_away_goals FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id IN (     T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5,     T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11 ) WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')	european_football_2
SELECT SUM(CASE WHEN (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T2.birthday)) <= 30 THEN T1.home_team_goal ELSE 0 END) AS total_home_team_goals FROM Match AS T1 JOIN Player AS T2 ON T1.home_player_1 = T2.player_api_id OR T1.home_player_2 = T2.player_api_id OR T1.home_player_3 = T2.player_api_id OR T1.home_player_4 = T2.player_api_id OR T1.home_player_5 = T2.player_api_id OR T1.home_player_6 = T2.player_api_id OR T1.home_player_7 = T2.player_api_id OR T1.home_player_8 = T2.player_api_id OR T1.home_player_9 = T2.player_api_id OR T1.home_player_10 = T2.player_api_id OR T1.home_player_11 = T2.player_api_id	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.strength DESC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = (SELECT MAX(potential) FROM Player_Attributes)	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE attacking_work_rate = 'high')	european_football_2
SELECT P.player_name FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.finishing = 1 ORDER BY datetime(P.birthday) ASC LIMIT 1	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.home_player_1 OR T1.player_api_id = T2.home_player_2 OR T1.player_api_id = T2.home_player_3 OR T1.player_api_id = T2.home_player_4 OR T1.player_api_id = T2.home_player_5 OR T1.player_api_id = T2.home_player_6 OR T1.player_api_id = T2.home_player_7 OR T1.player_api_id = T2.home_player_8 OR T1.player_api_id = T2.home_player_9 OR T1.player_api_id = T2.home_player_10 OR T1.player_api_id = T2.home_player_11 OR T1.player_api_id = T2.away_player_1 OR T1.player_api_id = T2.away_player_2 OR T1.player_api_id = T2.away_player_3 OR T1.player_api_id = T2.away_player_4 OR T1.player_api_id = T2.away_player_5 OR T1.player_api_id = T2.away_player_6 OR T1.player_api_id = T2.away_player_7 OR T1.player_api_id = T2.away_player_8 OR T1.player_api_id = T2.away_player_9 OR T1.player_api_id = T2.away_player_10 OR T1.player_api_id = T2.away_player_11 JOIN Country AS T3 ON T2.country_id = T3.id WHERE T3.name = 'Belgium'	european_football_2
SELECT P.player_name, C.name  FROM Player_Attributes PA  JOIN Player P ON PA.player_api_id = P.player_api_id  JOIN Match M ON P.player_api_id IN (     M.home_player_1, M.home_player_2, M.home_player_3, M.home_player_4, M.home_player_5,      M.home_player_6, M.home_player_7, M.home_player_8, M.home_player_9, M.home_player_10, M.home_player_11,      M.away_player_1, M.away_player_2, M.away_player_3, M.away_player_4, M.away_player_5,      M.away_player_6, M.away_player_7, M.away_player_8, M.away_player_9, M.away_player_10, M.away_player_11 )  JOIN Team T ON T.team_api_id = M.home_team_api_id OR T.team_api_id = M.away_team_api_id  JOIN League L ON L.id = M.league_id  JOIN Country C ON C.id = L.country_id  WHERE PA.vision > 89  GROUP BY P.player_name, C.name	european_football_2
SELECT C.name  FROM Country C  JOIN League L ON C.id = L.country_id  JOIN Match M ON L.id = M.league_id  JOIN Player P ON M.home_player_1 = P.player_api_id OR M.home_player_2 = P.player_api_id OR M.home_player_3 = P.player_api_id OR M.home_player_4 = P.player_api_id OR M.home_player_5 = P.player_api_id OR M.home_player_6 = P.player_api_id OR M.home_player_7 = P.player_api_id OR M.home_player_8 = P.player_api_id OR M.home_player_9 = P.player_api_id OR M.home_player_10 = P.player_api_id OR M.home_player_11 = P.player_api_id OR M.away_player_1 = P.player_api_id OR M.away_player_2 = P.player_api_id OR M.away_player_3 = P.player_api_id OR M.away_player_4 = P.player_api_id OR M.away_player_5 = P.player_api_id OR M.away_player_6 = P.player_api_id OR M.away_player_7 = P.player_api_id OR M.away_player_8 = P.player_api_id OR M.away_player_9 = P.player_api_id OR M.away_player_10 = P.player_api_id OR M.away_player_11 = P.player_api_id  GROUP BY C.name  ORDER BY AVG(P.weight) DESC  LIMIT 1	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Slow'	european_football_2
SELECT T.team_short_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Safe'	european_football_2
SELECT AVG(height) FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Match WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy'))	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE player_api_id = 6) - (SELECT jumping FROM Player_Attributes WHERE player_api_id = 23) AS jumping_difference	european_football_2
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5	european_football_2
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'	european_football_2
SELECT CAST(SUM(CASE WHEN strength > 80 AND stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes	european_football_2
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'	european_football_2
SELECT home_team_goal, away_team_goal FROM Match INNER JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND Match.date LIKE '2008-09-24%'	european_football_2
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin'	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' AND L.name = 'Italy Serie A'	european_football_2
SELECT MAX(home_team_goal) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie')	european_football_2
SELECT T2.finishing, T2.curve FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T1.weight DESC LIMIT 1	european_football_2
SELECT L.name  FROM League AS L  JOIN Match AS M ON L.id = M.league_id  WHERE M.season = '2015/2016'  GROUP BY L.name  ORDER BY COUNT(M.id) DESC  LIMIT 4	european_football_2
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id ORDER BY T2.away_team_goal DESC LIMIT 1	european_football_2
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes ORDER BY overall_rating DESC LIMIT 1)	european_football_2
SELECT CAST(SUM(CASE WHEN T1.height < 180 AND T2.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id	european_football_2
SELECT      (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) AS Deviation,     (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) AS Percentage_Deviation FROM      Patient WHERE      SEX = 'M'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Birthday > '1930-12-31' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE Birthday BETWEEN '1930-01-01' AND '1940-12-31'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS Ratio FROM Patient WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT P.Diagnosis, L.Date  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.ID = 30609	thrombosis_prediction
SELECT Patient.SEX, Patient.Birthday, Examination.`Examination Date`, Examination.Symptoms  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  WHERE Patient.ID = 163109	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH > 500	thrombosis_prediction
SELECT P.ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.RVVT = '+'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE E.Thrombosis = 2	thrombosis_prediction
SELECT P.ID, P.Birthday, L.`T-CHO` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE strftime('%Y', P.Birthday) = '1937' AND L.`T-CHO` >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.ALB < 3.5	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' AND (T1.TP < 6.0 OR T1.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT AVG(E.`aCL IgG`)  FROM Examination E  JOIN Patient P ON E.ID = P.ID  WHERE P.Admission = '+' AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) >= 50	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND STRFTIME('%Y', Description) = '1997' AND Admission = '-'	thrombosis_prediction
SELECT MIN(YEAR(`First Date`) - YEAR(Birthday)) AS Age FROM Patient	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'F' AND E.Thrombosis = 1 AND strftime('%Y', E.`Examination Date`) = '1997'	thrombosis_prediction
SELECT MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday)) AS AgeGap FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM Examination WHERE ID = (SELECT ID FROM Patient ORDER BY Birthday DESC LIMIT 1) AND Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) / 12 AS AverageMalePatientsPerMonth FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'	thrombosis_prediction
SELECT MAX(L.Date) AS Latest_Lab_Date, (STRFTIME('%Y', P.`First Date`) - STRFTIME('%Y', P.Birthday)) AS Age_At_Arrival FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS'	thrombosis_prediction
SELECT  SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE 0 END) /  SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) AS Ratio FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  LEFT JOIN Examination E ON P.ID = E.ID  WHERE E.ID IS NULL OR strftime('%Y', E.`Examination Date`) - strftime('%Y', P.`First Date`) < 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  WHERE strftime('%Y', P.Birthday) + 18 > strftime('%Y', E.`Examination Date`)  AND strftime('%Y', E.`Examination Date`) BETWEEN '1990' AND '1993'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-BIL` >= 2.0	thrombosis_prediction
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1	thrombosis_prediction
SELECT AVG(1999 - strftime('%Y', P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-31'	thrombosis_prediction
SELECT (strftime('%Y', E.`Examination Date`) - strftime('%Y', P.Birthday)) AS Age, P.Diagnosis  FROM Examination E  JOIN Patient P ON E.ID = P.ID  JOIN Laboratory L ON L.ID = P.ID AND L.Date = E.`Examination Date`  ORDER BY L.HGB DESC  LIMIT 1	thrombosis_prediction
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'	thrombosis_prediction
SELECT CASE WHEN T_CHO < 250 THEN 'Normal' ELSE 'Not Normal' END AS Cholesterol_Status FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04'	thrombosis_prediction
SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY T1.First_Date ASC LIMIT 1	thrombosis_prediction
SELECT T2.`aCL IgM` FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T1.Description = '1994-02-19' AND T2.`Examination Date` = '1993-11-12'	thrombosis_prediction
SELECT Patient.SEX FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GPT = 9 AND Laboratory.Date = '1992-06-12'	thrombosis_prediction
SELECT 1991 - strftime('%Y', Birthday) AS Age FROM Patient WHERE ID = (SELECT ID FROM Laboratory WHERE Date = '1991-10-21' AND UA = '8.4')	thrombosis_prediction
SELECT COUNT(L.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.`First Date` = '1991-06-13' AND P.Diagnosis = 'SJS' AND STRFTIME('%Y', L.Date) = '1995'	thrombosis_prediction
SELECT Patient.Diagnosis FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.`Examination Date` = '1997-01-27' AND Examination.Diagnosis = 'SLE'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE ID = (SELECT ID FROM Patient WHERE Birthday = '1959-03-01') AND `Examination Date` = '1993-09-27'	thrombosis_prediction
SELECT (SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) -         SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-12-%' THEN T2.`T-CHO` ELSE 0 END)) /         SUM(CASE WHEN T1.Birthday = '1959-02-18' AND T2.Date LIKE '1981-11-%' THEN T2.`T-CHO` ELSE 0 END) AS DecreaseRate FROM Patient T1 JOIN Laboratory T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Diagnosis = 'Behcet' AND E.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'	thrombosis_prediction
SELECT COUNT(ID) FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM Examination E WHERE E.Thrombosis = 2 AND E.`ANA Pattern` = 'S' AND E.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'M' AND STRFTIME('%Y', `First Date`) = '1981'	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX, P.Birthday, P.Description, P.`First Date`, P.Admission, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.`T-BIL` < 2.0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T1.Birthday BETWEEN '1980-01-01' AND '1989-12-31' AND T2.`ANA Pattern` != 'P'	thrombosis_prediction
SELECT Patient.SEX  FROM Patient  JOIN Examination ON Patient.ID = Examination.ID  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Examination.Diagnosis = 'PSS' AND Laboratory.CRP > 2 AND Laboratory.CRE = 1 AND Laboratory.LDH = 123	thrombosis_prediction
SELECT AVG(L.ALB) FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE'	thrombosis_prediction
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473	thrombosis_prediction
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE STRFTIME('%Y', Date) = '1997' AND (TP <= 6 OR TP >= 8.5)	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE YEAR(Birthday) = 1980 AND Diagnosis = 'RA'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.SEX = 'M' AND E.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND P.Diagnosis = 'Behcet' AND P.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5	thrombosis_prediction
SELECT DATEDIFF(E.`Examination Date`, P.`First Date`) AS Days_Before_Evaluation FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.ID = 821298	thrombosis_prediction
SELECT CASE WHEN L.UA > 8.0 AND P.SEX = 'M' OR L.UA > 6.5 AND P.SEX = 'F' THEN 'Yes' ELSE 'No' END AS Normal_Range FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.ID = 57266	thrombosis_prediction
SELECT Date FROM Laboratory WHERE ID = 48473 AND GOT >= 60	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT < 60 AND STRFTIME('%Y', L.Date) = '1994'	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.GPT >= 60	thrombosis_prediction
SELECT P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GPT > 60 ORDER BY P.Birthday ASC	thrombosis_prediction
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500	thrombosis_prediction
SELECT P.ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800	thrombosis_prediction
SELECT P.ID, P.Admission  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALP < 300 AND P.Admission IN ('+', '-')	thrombosis_prediction
SELECT P.ID, CASE WHEN L.ALP < 300 THEN 'Yes' ELSE 'No' END AS ALP_Normal_Range FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday = '1982-04-01'	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TP < 6.0	thrombosis_prediction
SELECT P.ID, P.SEX, L.TP, L.TP - 8.5 AS Deviation FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.TP > 8.5	thrombosis_prediction
SELECT P.*  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5)  ORDER BY P.Birthday DESC	thrombosis_prediction
SELECT P.ID, CASE WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range' ELSE 'Outside Normal Range' END AS AlbuminStatus FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) = '1982'	thrombosis_prediction
SELECT (COUNT(CASE WHEN L.UA > 6.5 THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS Percentage FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F'	thrombosis_prediction
SELECT AVG(L.UA)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE (P.SEX = 'M' AND L.UA < 8.0) OR (P.SEX = 'F' AND L.UA < 6.5)  AND L.Date = (     SELECT MAX(Date)      FROM Laboratory      WHERE ID = L.ID )	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.UN = 29	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'RA' AND L.UN < 30	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CRE >= 1.5	thrombosis_prediction
SELECT SUM(CASE WHEN T1.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END) AS result FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, L.`T-BIL` FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory)	thrombosis_prediction
SELECT SEX, GROUP_CONCAT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 GROUP BY SEX	thrombosis_prediction
SELECT P.ID, L.`T-CHO` FROM Patient P JOIN Laboratory L ON P.ID = L.ID ORDER BY P.Birthday ASC, L.`T-CHO` DESC LIMIT 1	thrombosis_prediction
SELECT AVG(STRFTIME('%Y', DATE('now')) - STRFTIME('%Y', P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-CHO` >= 250	thrombosis_prediction
SELECT Patient.ID, Patient.Diagnosis  FROM Patient  JOIN Laboratory ON Patient.ID = Laboratory.ID  WHERE Laboratory.TG > 300;	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200 AND strftime('%Y', current_timestamp) - strftime('%Y', P.Birthday) > 50	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Admission = '-' AND L.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) BETWEEN '1936' AND '1956' AND P.SEX = 'M' AND L.CPK >= 250	thrombosis_prediction
SELECT P.ID, P.SEX, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250	thrombosis_prediction
SELECT P.ID, L.GLU FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Description) = '1991' AND L.GLU < 180	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.WBC <= 3.5 OR L.WBC >= 9.0  GROUP BY P.SEX  ORDER BY (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) ASC	thrombosis_prediction
SELECT P.ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', P.Birthday) AS Age, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RBC < 3.5	thrombosis_prediction
SELECT P.ID, P.Admission  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'F'  AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) >= 50  AND (L.RBC <= 3.5 OR L.RBC >= 6.0)	thrombosis_prediction
SELECT DISTINCT P.ID, P.SEX FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '-' AND L.HGB < 10	thrombosis_prediction
SELECT P.ID, P.SEX FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 ORDER BY P.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT P.ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', P.Birthday) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.HCT >= 52 GROUP BY P.ID HAVING COUNT(L.ID) >= 2	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29	thrombosis_prediction
SELECT SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS Difference FROM Laboratory	thrombosis_prediction
SELECT P.ID, P.Birthday, L.Date, L.PLT  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE STRFTIME('%Y', L.Date) = '1984'  AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) < 50  AND L.PLT BETWEEN 100 AND 400	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN P.SEX = 'F' AND L.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) > 55 AND L.PT >= 14	thrombosis_prediction
SELECT P.ID, P.SEX, P.Birthday, P.Description, P.First_Date, P.Admission, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE strftime('%Y', P.First_Date) > '1992' AND L.PT < 14	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND ID IN (SELECT ID FROM Laboratory WHERE APTT >= 45)	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE L.APTT > 45 AND E.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.WBC > 3.5 AND L.WBC < 9.0 AND (L.FG <= 150 OR L.FG >= 450)	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Birthday > '1980-01-01' AND (L.FG < 150 OR L.FG > 450)	thrombosis_prediction
SELECT DISTINCT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.`U-PRO` >= 30	thrombosis_prediction
SELECT DISTINCT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.Diagnosis = 'SLE' AND L.`U-PRO` > 0 AND L.`U-PRO` < 30	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE IGG >= 2000	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGG > 900 AND T2.IGG < 2000 AND T1.Symptoms IS NOT NULL	thrombosis_prediction
SELECT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.IGA BETWEEN 80 AND 500 ORDER BY L.IGA DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGA > 80 AND T2.IGA < 500 AND STRFTIME('%Y', T1.`First Date`) >= '1990'	thrombosis_prediction
SELECT Diagnosis FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE IGM <= 40 OR IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 LEFT JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRP = '+' AND T2.Description IS NULL	thrombosis_prediction
SELECT COUNT(*) FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE L.CRE >= 1.5 AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) < 70	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.RA IN ('-', '+-') AND T2.KCT = '+'	thrombosis_prediction
SELECT P.Diagnosis FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE STRFTIME('%Y', P.Birthday) >= '1985' AND L.RA IN ('-', '+-')	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < 20 AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) > 60	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE l.RF < 20 AND e.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`ANA Pattern` = 'P' AND T2.C3 > 35	thrombosis_prediction
SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT NOT BETWEEN 29 AND 52 ORDER BY T1.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Examination E ON P.ID = E.ID  JOIN Laboratory L ON P.ID = L.ID  WHERE E.Thrombosis = 1 AND L.C4 > 10	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.RNP IN ('-', '+-')	thrombosis_prediction
SELECT P.Birthday  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.RNP NOT IN ('-', '+-')  ORDER BY P.Birthday DESC  LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.SM IN ('-', '+-') AND E.Thrombosis = 0	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3	thrombosis_prediction
SELECT DISTINCT E.ID FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE E.`Examination Date` > '1997-01-01' AND L.SC170 IN ('negative', '0')	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.SC170 IN ('negative', '0') AND P.SEX = 'F' AND E.Symptoms IS NULL	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` < '2000-01-01' AND T2.SSA IN ('-', '+-')	thrombosis_prediction
SELECT P.ID  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.SSA NOT IN ('negative', '0')  ORDER BY P.`First Date` ASC  LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Diagnosis = 'SLE' AND L.SSB IN ('-', '+-')	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.SSB IN ('negative', '0') AND T2.Symptoms IS NOT NULL	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CENTROMEA IN ('-', '+-') AND L.SSB IN ('-', '+-') AND P.SEX = 'M'	thrombosis_prediction
SELECT DISTINCT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.DNA >= 8	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 LEFT JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Description IS NULL AND (T2.DNA IS NULL OR T2.DNA < 8)	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.IGG > 900 AND T2.IGG < 2000	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60	thrombosis_prediction
SELECT MAX(P.Birthday) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GOT >= 60	thrombosis_prediction
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT < 60 ORDER BY L.GPT DESC LIMIT 3	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT < 60 AND P.SEX = 'M'	thrombosis_prediction
SELECT MIN(P.`First Date`)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH < 500  ORDER BY L.LDH DESC  LIMIT 1	thrombosis_prediction
SELECT MAX(P.`First Date`)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.LDH >= 500	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.ALP >= 300 AND P.Admission = '+'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.ALP < 300	thrombosis_prediction
SELECT DISTINCT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TP < 6.0	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5	thrombosis_prediction
SELECT T2.`Examination Date`  FROM Laboratory AS T1  JOIN Examination AS T2 ON T1.ID = T2.ID  WHERE T1.ALB BETWEEN 3.5 AND 5.5  ORDER BY T1.ALB DESC  LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.ALB BETWEEN 3.5 AND 5.5 AND L.TP BETWEEN 6.0 AND 8.5	thrombosis_prediction
SELECT E.`aCL IgG`, E.`aCL IgM`, E.`aCL IgA` FROM Examination E JOIN Patient P ON E.ID = P.ID JOIN Laboratory L ON L.ID = P.ID WHERE P.SEX = 'F' AND L.UA <= 6.50 ORDER BY L.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(T1.ANA) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5	thrombosis_prediction
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.CRE < 1.5 ORDER BY L.`aCL IgA` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  JOIN Examination e ON p.ID = e.ID  WHERE l.`T-BIL` >= 2.0 AND e.`ANA Pattern` LIKE '%P%'	thrombosis_prediction
SELECT T2.ANA FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` < 2.0 ORDER BY T1.`T-BIL` DESC LIMIT 1	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-CHO` >= 250 AND T2.KCT = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  JOIN Laboratory l ON p.ID = l.ID  WHERE l.`T-CHO` < 250 AND e.`ANA Pattern` = 'P'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 AND T2.Symptoms IS NOT NULL	thrombosis_prediction
SELECT P.Diagnosis  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.TG < 200  ORDER BY L.TG DESC  LIMIT 1	thrombosis_prediction
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Thrombosis = 0 AND L.CPK < 250	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CPK < 250 AND (T2.KCT = '+' OR T2.RVVT = '+' OR T2.LAC = '+')	thrombosis_prediction
SELECT Birthday FROM Patient WHERE ID = (SELECT ID FROM Laboratory WHERE GLU > 180 ORDER BY Birthday ASC LIMIT 1)	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID JOIN Examination E ON P.ID = E.ID WHERE L.GLU < 180 AND E.Thrombosis = 0	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '+' AND L.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.WBC BETWEEN 3.5 AND 9.0	thrombosis_prediction
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE (L.RBC <= 3.5 OR L.RBC >= 6.0) AND P.Admission = '-'	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.PLT > 100 AND L.PLT < 400 AND P.Diagnosis IS NOT NULL	thrombosis_prediction
SELECT T1.PLT FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.PLT > 100 AND T1.PLT < 400 AND T2.Diagnosis = 'MCTD'	thrombosis_prediction
SELECT AVG(L.PT) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.PT < 14	thrombosis_prediction
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE (E.Thrombosis = 1 OR E.Thrombosis = 2) AND L.PT < 14	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering')	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design'	student_club
SELECT COUNT(DISTINCT link_to_member) FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer')	student_club
SELECT DISTINCT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Student_Club'	student_club
SELECT COUNT(*) FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium'	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  GROUP BY e.event_id  ORDER BY COUNT(a.link_to_member) DESC  LIMIT 1	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'McLean'	student_club
SELECT COUNT(*) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND e.type = 'Student_Club' AND STRFTIME('%Y', e.event_date) = '2019'	student_club
SELECT COUNT(*) FROM event WHERE event_id IN (SELECT link_to_event FROM attendance GROUP BY link_to_event HAVING COUNT(link_to_member) > 10) AND type = 'Meeting'	student_club
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type != 'fundraiser'  GROUP BY e.event_name  HAVING COUNT(a.link_to_member) > 20	student_club
SELECT CAST(COUNT(T1.event_id) AS REAL) / COUNT(DISTINCT T1.event_name) AS average_attendance FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND STRFTIME('%Y', T1.event_date) = '2020'	student_club
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense)	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS mj ON m.link_to_major = mj.major_id WHERE mj.major_name = 'Environmental Engineering'	student_club
SELECT T3.first_name, T3.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Laugh Out Loud'	student_club
SELECT T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'	student_club
SELECT SUM(amount) FROM income WHERE link_to_member IN (SELECT member_id FROM member WHERE position = 'Vice President')	student_club
SELECT SUM(b.spent)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE b.category = 'Food' AND e.event_name = 'September Meeting'	student_club
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois'	student_club
SELECT SUM(spent) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Meeting') AND category = 'Advertisement'	student_club
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Pierce' OR T1.first_name = 'Guidi'	student_club
SELECT SUM(b.amount) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker'	student_club
SELECT e.expense_id, e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08'	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Elijah' AND last_name = 'Allen') AND SUBSTR(expense_date, 5, 2) IN ('09', '10')	student_club
SELECT      SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) -      SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END) AS difference FROM      budget b JOIN      event e ON b.link_to_event = e.event_id	student_club
SELECT location FROM event WHERE event_name = 'Spring Budget Review'	student_club
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'	student_club
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs';	student_club
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'	student_club
SELECT COUNT(*) FROM budget AS b JOIN event AS e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Meeting' AND b.remaining < 0	student_club
SELECT SUM(amount) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'September Speaker')	student_club
SELECT T1.event_status FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'	student_club
SELECT COUNT(*) FROM member WHERE link_to_major = (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium'	student_club
SELECT T2.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'	student_club
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'	student_club
SELECT date_received FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Connor' AND last_name = 'Hilton') AND source = 'Dues';	student_club
SELECT first_name, last_name FROM member WHERE member_id = (SELECT link_to_member FROM income WHERE source = 'Dues' ORDER BY date_received ASC LIMIT 1)	student_club
SELECT SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T2.amount ELSE 0 END) / SUM(CASE WHEN T1.event_name = 'October Meeting' THEN T2.amount ELSE 0 END) AS ratio FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement'	student_club
SELECT CAST(SUM(CASE WHEN T1.category = 'Parking' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'November Speaker'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'	student_club
SELECT COUNT(city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'	student_club
SELECT T2.city, T2.county, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'	student_club
SELECT e.expense_description FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget)	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'October Meeting'	student_club
SELECT major.college  FROM member  JOIN major ON member.link_to_major = major.major_id  GROUP BY major.college  ORDER BY COUNT(member.member_id) DESC  LIMIT 1	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event ORDER BY b.amount DESC LIMIT 1	student_club
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'	student_club
SELECT COUNT(*) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'	student_club
SELECT T2.date_received FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Casey' AND T1.last_name = 'Mason'	student_club
SELECT COUNT(*) FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland'	student_club
SELECT COUNT(DISTINCT e.event_id) FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240'	student_club
SELECT m.first_name, m.last_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed'  ORDER BY b.spent / b.amount DESC  LIMIT 1	student_club
SELECT COUNT(*) FROM member WHERE position = 'president';	student_club
SELECT MAX(spent) FROM budget	student_club
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'	student_club
SELECT SUM(spent) FROM budget WHERE category = 'Food'	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  GROUP BY m.member_id  HAVING COUNT(a.link_to_event) > 7	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE ma.major_name = 'Interior Design' AND e.event_name = 'Community Theater'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'	student_club
SELECT SUM(amount) FROM income WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Grant' AND last_name = 'Gilmour')	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40	student_club
SELECT SUM(expense.cost) FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name  FROM member m  JOIN budget b ON m.member_id = b.link_to_member  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'Yearly Kickoff'	student_club
SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (     SELECT MAX(amount) FROM income )	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget ORDER BY ex.cost ASC LIMIT 1	student_club
SELECT CAST(SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) AS REAL) * 100 / SUM(ex.cost) FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id	student_club
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1	student_club
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Physics Teaching'	student_club
SELECT COUNT(*) FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Community Theater' AND STRFTIME('%Y', event.event_date) = '2019'	student_club
SELECT COUNT(DISTINCT e.event_id), m.major_name  FROM member mem  JOIN attendance a ON mem.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  JOIN major m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Luisa' AND mem.last_name = 'Guidi'	student_club
SELECT SUM(spent) / COUNT(spent) AS average_spent FROM budget WHERE category = 'Food' AND event_status = 'Closed'	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.category = 'Advertisement'  ORDER BY b.spent DESC  LIMIT 1	student_club
SELECT CASE WHEN COUNT(*) > 0 THEN 'Yes' ELSE 'No' END AS attended FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Maya' AND m.last_name = 'McLean' AND e.event_name = 'Women''s Soccer';	student_club
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'	student_club
SELECT e.cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE e.expense_description = 'Posters' AND ev.event_name = 'September Speaker'	student_club
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1	student_club
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed' AND b.remaining < 0  ORDER BY b.remaining ASC  LIMIT 1	student_club
SELECT e.expense_description, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'Yes' GROUP BY e.expense_description	student_club
SELECT SUM(b.amount) AS total_budget, b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'April Speaker'  GROUP BY b.category  ORDER BY total_budget ASC	student_club
SELECT * FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1	student_club
SELECT budget_id, amount FROM budget WHERE category = 'Advertising' ORDER BY amount DESC LIMIT 3	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'	student_club
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name	student_club
SELECT expense_description FROM expense WHERE link_to_member = (SELECT member_id FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison')	student_club
SELECT DISTINCT e.expense_description FROM expense AS e JOIN member AS m ON e.link_to_member = m.member_id WHERE m.t_shirt_size = 'X-Large'	student_club
SELECT T1.zip FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost < 50	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'	student_club
SELECT T1.position FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'	student_club
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'	student_club
SELECT DISTINCT e.type  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.remaining > 30	student_club
SELECT DISTINCT budget.category FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.location = 'MU 215'	student_club
SELECT budget.category FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_date = '2020-03-24T12:00:00'	student_club
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'	student_club
SELECT CAST(SUM(CASE WHEN T1.position = 'Member' AND T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id	student_club
SELECT DISTINCT budget.category  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.location = 'MU 215'	student_club
SELECT COUNT(*) FROM income WHERE amount = 50	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'	student_club
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'	student_club
SELECT T1.last_name, T2.department, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT DISTINCT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0	student_club
SELECT T3.city, T3.state FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T2.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'	student_club
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.'	student_club
SELECT T1.last_name, T1.position FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Pizza' AND T2.expense_date = '2019-09-10'	student_club
SELECT T3.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer' AND T3.position = 'Member'	student_club
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box'	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico'	student_club
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'	student_club
SELECT link_to_event FROM expense WHERE cost > 50	student_club
SELECT m.first_name, m.last_name, a.link_to_event FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN expense e ON m.member_id = e.link_to_member WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'	student_club
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major = 'rec1N0upiVLy5esTO'	student_club
SELECT T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business'	student_club
SELECT m.email FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND e.cost > 20	student_club
SELECT COUNT(*) FROM member AS m JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Education' AND ma.college = 'College of Education & Human Services' AND m.position = 'Member';	student_club
SELECT CAST(SUM(CASE WHEN remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) FROM budget	student_club
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'	student_club
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code	student_club
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0	student_club
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100	student_club
SELECT T3.city, T3.state FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN zip_code AS T3 ON T2.zip = T3.zip_code JOIN attendance AS T4 ON T2.member_id = T4.link_to_member JOIN event AS T5 ON T4.link_to_event = T5.event_id GROUP BY T5.event_id HAVING COUNT(T1.income_id) > 40	student_club
SELECT m.member_id, m.first_name, m.last_name, SUM(e.cost) AS total_expense FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id GROUP BY m.member_id HAVING COUNT(DISTINCT b.link_to_event) > 1 ORDER BY total_expense DESC LIMIT 1	student_club
SELECT AVG(cost) FROM expense WHERE link_to_member IN (SELECT member_id FROM member WHERE position != 'Member')	student_club
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE b.category = 'Parking' AND ex.cost < (SELECT AVG(ex2.cost) FROM expense ex2 JOIN budget b2 ON ex2.link_to_budget = b2.budget_id WHERE b2.category = 'Parking')	student_club
SELECT CAST(SUM(CASE WHEN e.type = 'Meeting' THEN ex.cost ELSE 0 END) AS REAL) * 100 / SUM(ex.cost) FROM expense ex JOIN budget b ON ex.link_to_budget = b.budget_id JOIN event e ON b.link_to_event = e.event_id	student_club
SELECT link_to_budget FROM expense WHERE expense_description = 'Water, chips, cookies' ORDER BY cost DESC LIMIT 1	student_club
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id ORDER BY total_spent DESC LIMIT 5	student_club
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (     SELECT AVG(cost)     FROM expense )	student_club
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) / CAST(SUM(CASE WHEN T1.position = 'Member' THEN 1 ELSE 0 END) AS REAL)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) / CAST(SUM(CASE WHEN T1.position = 'Member' THEN 1 ELSE 0 END) AS REAL)) AS difference FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code	student_club
SELECT T2.major_name, T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT T1.first_name, T1.last_name, T2.cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT T1.last_name, T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'	student_club
SELECT T1.category, T1.amount FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'	student_club
SELECT T1.event_name FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '9/9/2019'	student_club
SELECT T2.category FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'	student_club
SELECT m.first_name, m.last_name, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE m.position = 'Secretary'	student_club
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name	student_club
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'	student_club
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092	student_club
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers	debit_card_specializing
SELECT c.CustomerID, c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID, c.Segment ORDER BY TotalConsumption ASC LIMIT 1;	debit_card_specializing
SELECT AVG(Consumption) / 12 AS AverageMonthlyConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND yearmonth.Date BETWEEN '201301' AND '201312'	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'KAM' AND y.Date BETWEEN '201201' AND '201212' AND y.Consumption < 30000	debit_card_specializing
SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS Difference FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date BETWEEN '201201' AND '201212'	debit_card_specializing
SELECT SUBSTR(t.Date, 1, 4) AS Year, SUM(y.Consumption) AS TotalConsumption FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID JOIN yearmonth y ON t.CustomerID = y.CustomerID AND SUBSTR(t.Date, 1, 6) = y.Date WHERE c.Currency = 'EUR' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT CustomerID FROM yearmonth GROUP BY CustomerID ORDER BY SUM(Consumption) ASC LIMIT 1)	debit_card_specializing
SELECT SUBSTR(Date, 1, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT ym.Date, MAX(ym.Consumption) AS PeakConsumption FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND ym.Date BETWEEN '201301' AND '201312' GROUP BY ym.Date ORDER BY PeakConsumption DESC LIMIT 1	debit_card_specializing
SELECT      (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN c.CustomerID ELSE NULL END)) -     (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN c.CustomerID ELSE NULL END)) AS SME_LAM_Diff,     (SUM(CASE WHEN c.Segment = 'LAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'LAM' THEN c.CustomerID ELSE NULL END)) -     (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN c.CustomerID ELSE NULL END)) AS LAM_KAM_Diff,     (SUM(CASE WHEN c.Segment = 'KAM' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'KAM' THEN c.CustomerID ELSE NULL END)) -     (SUM(CASE WHEN c.Segment = 'SME' THEN y.Consumption ELSE 0 END) / COUNT(DISTINCT CASE WHEN c.Segment = 'SME' THEN c.CustomerID ELSE NULL END)) AS KAM_SME_Diff FROM      customers c JOIN      yearmonth y ON c.CustomerID = y.CustomerID WHERE      y.Date BETWEEN '201301' AND '201312'     AND c.Currency = 'CZK' GROUP BY      c.Segment ORDER BY      c.Segment;	debit_card_specializing
SELECT Segment,         ((MAX(CASE WHEN SUBSTR(Date, 1, 4) = '2013' THEN Consumption END) -           MAX(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption END)) /          MAX(CASE WHEN SUBSTR(Date, 1, 4) = '2012' THEN Consumption END)) * 100 AS PercentageIncrease FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Segment IN ('SME', 'LAM', 'KAM') GROUP BY Segment HAVING COUNT(DISTINCT SUBSTR(Date, 1, 4)) > 1;	debit_card_specializing
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'	debit_card_specializing
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS Difference	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference	debit_card_specializing
SELECT      SUM(CASE WHEN T1.Currency = 'CZK' THEN 1 ELSE 0 END) -      SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS More_SMEs_CZK_than_EUR FROM      customers AS T1 JOIN      transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE      T1.Segment = 'SME'	debit_card_specializing
SELECT c.CustomerID, c.Segment, c.Currency, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1	debit_card_specializing
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption)  FROM yearmonth y  JOIN customers c ON y.CustomerID = c.CustomerID  WHERE c.Segment = 'KAM' AND y.Date = '201305'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'	debit_card_specializing
SELECT Country, COUNT(*) AS Total FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers WHERE Segment = 'KAM'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date = '201202'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'CZE'	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1	debit_card_specializing
SELECT c.CustomerID, c.Segment, y.Consumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'SME' AND y.Date = '201206' ORDER BY y.Consumption ASC LIMIT 1	debit_card_specializing
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'	debit_card_specializing
SELECT MAX(y.Consumption) FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE t.Date LIKE '2013-09%'	debit_card_specializing
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE SUBSTR(T1.Date, 1, 4) = '2013' AND SUBSTR(T1.Date, 6, 2) = '06'	debit_card_specializing
SELECT DISTINCT T2.ChainID FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR'	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT AVG(Amount * Price) FROM transactions_1k WHERE Date LIKE '2012-01%'	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Currency = 'EUR' AND y.Consumption > 1000	debit_card_specializing
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T.Time FROM transactions_1k AS T JOIN gasstations AS G ON T.GasStationID = G.GasStationID WHERE G.ChainID = 11	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Price > 1000	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'	debit_card_specializing
SELECT AVG(t.Price * t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'	debit_card_specializing
SELECT AVG(t.Price * t.Amount) AS AverageTotalPrice FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'	debit_card_specializing
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' ORDER BY Amount DESC LIMIT 1	debit_card_specializing
SELECT T1.Country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-25' ORDER BY T2.TransactionID ASC LIMIT 1	debit_card_specializing
SELECT Currency FROM customers WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Time = '16:25:00')	debit_card_specializing
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS t JOIN customers AS c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-26' AND t.Time < '13:00:00' AND c.Currency = 'CZK'	debit_card_specializing
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'	debit_card_specializing
SELECT Date, Amount FROM transactions_1k WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Amount = 124.05) AND Date LIKE '2012-01-%'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k AS t JOIN gasstations AS g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-26' AND t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE'	debit_card_specializing
SELECT Currency FROM customers WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date LIKE '2013-06%' GROUP BY CustomerID HAVING SUM(Amount * Price) = 214582.17)	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467	debit_card_specializing
SELECT Currency FROM customers WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-24' AND Amount = 548.4)	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25'	debit_card_specializing
SELECT (y2012.Consumption - y2013.Consumption) / y2012.Consumption AS DecreaseRate FROM yearmonth y2012 JOIN yearmonth y2013 ON y2012.CustomerID = y2013.CustomerID WHERE y2012.Date LIKE '2012%' AND y2013.Date LIKE '2013%' AND y2012.CustomerID = (     SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' AND Amount = 634.8 )	debit_card_specializing
SELECT GasStationID, SUM(Amount * Price) AS Revenue FROM transactions_1k GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations WHERE Country = 'SVK'	debit_card_specializing
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508; SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 AND Date = '201201';	debit_card_specializing
SELECT p.Description, COUNT(t.ProductID) AS SalesCount FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY t.ProductID ORDER BY SalesCount DESC LIMIT 5	debit_card_specializing
SELECT c.CustomerID, c.Currency, SUM(t.Price) / SUM(t.Amount) AS AvgPricePerItem FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID ORDER BY SUM(t.Price * t.Amount) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2 ORDER BY t.Price DESC LIMIT 1	debit_card_specializing
SELECT y.Consumption  FROM transactions_1k t  JOIN yearmonth y ON t.CustomerID = y.CustomerID  WHERE t.ProductID = 5 AND t.Price / t.Amount > 29.00 AND y.Date = '201208'	debit_card_specializing
