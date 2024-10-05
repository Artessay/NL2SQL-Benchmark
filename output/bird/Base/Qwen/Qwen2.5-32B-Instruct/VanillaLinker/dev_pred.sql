SELECT MAX(`Percent (%) Eligible Free (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda'; 
SELECT `School Name`, (`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS Eligible_Free_Rate FROM frpm WHERE `School Type` = 'Continuation High Schools (Public)' ORDER BY Eligible_Free_Rate ASC LIMIT 3; 
SELECT DISTINCT s.Zip  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.`Charter School (Y/N)` = 1 AND s.District = 'Fresno County Office of Education'; 
SELECT s.MailStreet || ', ' || s.MailCity || ', ' || s.MailState || ' ' || s.MailZip AS FullMailAddress FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.FRPM_Count_K_12 = (     SELECT MAX(f2.FRPM_Count_K_12)     FROM frpm f2 ) 
SELECT Phone  FROM schools  WHERE Charter = 1  AND FundingType = 'Directly funded'  AND OpenDate > '2000-01-01'; 
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath > 400 AND s.Virtual = 'F'; 
SELECT s.School, s.District, s.County, s.Magnet FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 500 AND s.Magnet = 1; 
SELECT s.Phone  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores WHERE NumGE1500 > 0)
SELECT NumTstTakr  FROM satscores  WHERE cds = (     SELECT CDSCode      FROM frpm      ORDER BY `FRPM Count (K-12)` DESC      LIMIT 1 ); 
SELECT COUNT(DISTINCT s.CDSCode) FROM satscores ss JOIN frpm f ON ss.cds = f.CDSCode JOIN schools s ON s.CDSCode = f.CDSCode WHERE ss.AvgScrMath > 560 AND f.Charter = 1 AND f.Charter Funding Type = 'Directly funded'; 
SELECT t1.`FRPM Count (Ages 5-17)` FROM frpm AS t1 JOIN satscores AS t2 ON t1.CDSCode = t2.cds WHERE t2.AvgScrRead = (     SELECT MAX(AvgScrRead)     FROM satscores ) 
SELECT CDSCode  FROM frpm  WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500; 
SELECT MAX(t2.`Free Meal Count (Ages 5-17)` / t2.`Enrollment (Ages 5-17)`) AS HighestEligibleFreeRate FROM satscores t1 JOIN frpm t2 ON t1.cds = t2.CDSCode WHERE t1.NumGE1500 / t1.NumTstTakr > 0.3; 
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.rtype = 'S' ORDER BY (ss.NumGE1500 / ss.NumTstTakr) DESC LIMIT 3; 
SELECT s.NCESSchool, f.`Enrollment (Ages 5-17)` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (Ages 5-17)` DESC LIMIT 5; 
SELECT dname, AVG(AvgScrRead) AS AvgReadingScore FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE rtype = 'D' AND sch.StatusType = 'Active' GROUP BY dname ORDER BY AvgReadingScore DESC LIMIT 1;
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Alameda' AND ss.NumTstTakr < 100
SELECT s.CDSCode, s.CharterNum, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL GROUP BY s.CDSCode, s.CharterNum ORDER BY AvgWritingScore DESC; 
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Fresno' AND s.FundingType = 'Directly funded' AND ss.NumTstTakr <= 250; 
SELECT s.Phone  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12';
SELECT COUNT(*)  FROM frpm  WHERE `County Name` = 'Los Angeles'    AND `Free Meal Count (K-12)` > 500    AND `FRPM Count (K-12)` < 700; 
SELECT sname FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1
SELECT s.School, s.Street || ', ' || s.City || ', ' || s.State AS FullStreetAddress FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30; 
SELECT s.School  FROM frpm f JOIN satscores ss ON f.CDSCode = ss.cds JOIN schools s ON f.CDSCode = s.CDSCode WHERE (f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)`) > 0.1 AND ss.NumGE1500 >= 1; 
SELECT s.FundingType FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Riverside' GROUP BY s.School HAVING SUM(ss.AvgScrMath) / COUNT(DISTINCT ss.cds) > 400; 
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.School IS NOT NULL   AND s.SOC = '66'   AND s.County = 'Monterey'   AND f.`Free Meal Count (Ages 5-17)` > 800; 
SELECT s.School, ss.AvgScrWrite, s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01') AND s.Phone IS NOT NULL; 
SELECT s.School, s.DOCType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter Funding Type` = 'Locally funded' AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (     SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`)     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     WHERE f2.`Charter Funding Type` = 'Locally funded' ) 
SELECT OpenDate  FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.LowGrade = 'K' AND f.HighGrade = '12' ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1; 
SELECT s.City, f.`Enrollment (K-12)`  FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`Enrollment (K-12)` ASC LIMIT 5; 
SELECT `School Name`, (`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS Eligible_Free_Rate FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 10, 10; 
SELECT      `School Name`,      (`FRPM Count (K-12)` / `Enrollment (K-12)`) AS EligibleRate FROM      frpm WHERE      `CDSCode` IN (         SELECT              `CDSCode`         FROM              schools         WHERE              SOC = '66'     ) ORDER BY      `FRPM Count (K-12)` DESC LIMIT 5; 
SELECT s.School, s.Website FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.Free Meal Count (Ages 5-17) BETWEEN 1900 AND 2000; 
SELECT t1.`Free Meal Count (Ages 5-17)` / t1.`Enrollment (Ages 5-17)` AS FreeRate FROM frpm AS t1 JOIN schools AS t2 ON t1.CDSCode = t2.CDSCode WHERE t2.AdmFName1 = 'Kacey' AND t2.AdmLName1 = 'Gibson'; 
SELECT AdmEmail1  FROM schools  WHERE CDSCode IN (     SELECT CDSCode      FROM frpm      WHERE `Charter School (Y/N)` = 1      ORDER BY `Enrollment (K-12)` ASC      LIMIT 1 ) 
SELECT s.AdmFName1, s.AdmLName1, s.AdmFName2, s.AdmLName2, s.AdmFName3, s.AdmLName3 FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores ); 
SELECT s.Street, s.City, s.Zip, s.State FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 0 ORDER BY (ss.NumGE1500 / ss.NumTstTakr) ASC LIMIT 1; 
SELECT Website  FROM schools  JOIN satscores ON schools.CDSCode = satscores.cds  WHERE schools.County = 'Los Angeles' AND satscores.NumTstTakr BETWEEN 2000 AND 3000; 
SELECT AVG(s.NumTstTakr)  FROM satscores s  JOIN schools sch ON s.cds = sch.CDSCode  WHERE sch.County = 'Fresno' AND YEAR(sch.OpenDate) = 1980; 
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.District = 'Fresno Unified' ORDER BY ss.AvgScrRead ASC LIMIT 1; 
SELECT s.School  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE s.Virtual = 'F'  AND ss.rtype = 'S' QUALIFY ROW_NUMBER() OVER (PARTITION BY s.County ORDER BY ss.AvgScrRead DESC) <= 5; 
SELECT T1.School_Type FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT s.cname AS County, MIN(t.AvgScrMath) AS MinMathScore FROM (     SELECT cds, AVG(AvgScrRead + AvgScrMath + AvgScrWrite) / 3 AS AvgTotalScore, AvgScrMath     FROM satscores     GROUP BY cds ) t JOIN schools s ON t.cds = s.CDSCode GROUP BY t.cds ORDER BY t.AvgTotalScore ASC LIMIT 1; 
SELECT AVG(T2.AvgScrWrite) AS AvgWritingScore, T1.City FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores ) GROUP BY T1.City; 
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School; 
SELECT s.School, s.State, f.`Enrollment (K-12)`  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.DOC = '31'  ORDER BY f.`Enrollment (K-12)` DESC  LIMIT 1; 
SELECT COUNT(*) / 12 AS avg_schools_opened FROM schools WHERE County = 'Alameda'   AND SUBSTR(OpenDate, 1, 4) = '1980'   AND DOC = '52'; 
SELECT      SUM(CASE WHEN T1.DOC = '54' THEN 1 ELSE 0 END) / SUM(CASE WHEN T1.DOC = '52' THEN 1 ELSE 0 END) AS Ratio FROM      schools T1 WHERE      T1.County = 'Orange' AND T1.StatusType = 'Merged'; 
SELECT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed' ORDER BY s.County DESC, s.ClosedDate DESC; 
SELECT s.School, s.Street AS Postal_Street_Address FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds ORDER BY ss.AvgScrMath DESC LIMIT 1 OFFSET 6; 
SELECT s.MailStreet, s.School  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.AvgScrRead = (SELECT MIN(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL) 
SELECT COUNT(DISTINCT s.CDSCode) FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE (ss.AvgScrRead + ss.AvgScrMath + ss.AvgScrWrite) >= 1500 AND s.MailCity = 'Lakeport'; 
SELECT SUM(NumTstTakr) AS TotalTestTakers FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.MailCity = 'Fresno'; 
SELECT s.School, s.MailZip FROM schools s WHERE s.AdmFName1 = 'Avetik' AND s.AdmLName1 = 'Atoian'; 
SELECT      CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS ratio FROM      schools WHERE      State = 'CA'; 
SELECT COUNT(*)  FROM schools  WHERE State = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active'; 
SELECT s.Phone, s.Ext  FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.NumGE1500 = 333; 
SELECT s.Phone, s.Ext, s.School  FROM schools s  WHERE s.Zip = '95203-3704'; 
SELECT Website  FROM schools  WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson'     OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez'; 
SELECT Website  FROM schools  WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin'; 
SELECT COUNT(*)  FROM schools  WHERE Charter = 1  AND City = 'Hickman'  AND DOC = '52'; 
SELECT COUNT(*)  FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles'  AND s.Charter = 0  AND (f.`Free Meal Count (K-12)` * 100 / f.`Enrollment (K-12)`) < 0.18; 
SELECT s.AdmFName1, s.AdmLName1, s.School, s.City FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2' UNION SELECT s.AdmFName2, s.AdmLName2, s.School, s.City FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2' UNION SELECT s.AdmFName3, s.AdmLName3, s.School, s.City FROM schools s WHERE s.Charter = 1 AND s.CharterNum = '00D2'; 
SELECT COUNT(*)  FROM schools  WHERE MailCity = 'Hickman' AND CharterNum = '00D4'; 
SELECT      (COUNT(CASE WHEN T1.FundingType = 'Locally funded' THEN 1 END) / COUNT(*)) * 100 AS RatioPercentage FROM      schools AS T1 WHERE      T1.County = 'Santa Clara'; 
SELECT COUNT(*)  FROM schools  WHERE FundingType = 'Directly funded'  AND County = 'Stanislaus'  AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'; 
SELECT COUNT(*)  FROM schools  WHERE ClosedDate LIKE '1989%' AND City = 'San Francisco' AND District = 'Community College District';
SELECT County  FROM schools  WHERE ClosedDate BETWEEN '1980-01-01' AND '1989-12-31'    AND SOC = '11'  GROUP BY County  ORDER BY COUNT(*) DESC  LIMIT 1; 
SELECT NCESDist  FROM schools  WHERE SOC = '31'; 
SELECT COUNT(*)  FROM schools  WHERE County = 'Alpine'  AND (StatusType = 'Active' OR StatusType = 'Closed')  AND SOCType = 'Community Day Schools'; 
SELECT `District Code`  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.Magnet = 0 AND schools.City = 'Fresno'; 
SELECT Enrollment (Ages 5-17)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE `Academic Year` = '2014-2015'  AND School = 'State Special School'  AND City = 'Fremont'  AND EdOpsCode = 'SSS'; 
SELECT FRPMCount FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.MailStreet = 'PO Box 1040' AND schools.School = 'Youth Authority School'; 
SELECT LowGrade  FROM frpm  WHERE CDSCode IN (     SELECT CDSCode      FROM schools      WHERE NCESDist = '0613360' AND EdOpsCode = 'SPECON' ); 
SELECT s.School AS School_Name, f.`Educational Option Type` AS Educational_Level_Name FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`NSLP Provision Status` = 'Breakfast Provision 2' AND f.`County Code` = '37'; 
SELECT s.City FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Low Grade` = '9'  AND f.`High Grade` = '12'  AND f.`County Name` = 'Merced'  AND f.`NSLP Provision Status` = 'Breakfast Provision 2'  AND s.EILCode = 'HS'; 
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)`) * 100 AS `Percent (%) Eligible FRPM (Ages 5-17)` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved = 'K-9'; 
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT County, COUNT(*) AS SchoolCount FROM schools WHERE Virtual = 'F' AND County IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY SchoolCount DESC LIMIT 1; 
SELECT s.School AS School_Name, s.Latitude, f.`School Type` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Latitude = (SELECT MAX(Latitude) FROM schools)
SELECT s.City, s.Low Grade, f.`School Name` FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1; 
SELECT GSoffered  FROM schools  WHERE ABS(Longitude) = (     SELECT MAX(ABS(Longitude))      FROM schools ) 
SELECT      s.City,      COUNT(s.CDSCode) AS NumberOfSchools FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.Magnet = 1      AND s.GSserved = 'K-8'      AND f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY      s.City; 
SELECT AdmFName1, District FROM schools WHERE AdmFName1 IS NOT NULL GROUP BY AdmFName1 ORDER BY COUNT(*) DESC LIMIT 2
SELECT frpm.`Percent (%) Eligible Free (K-12)`, frpm.`District Code` FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Alusine'; 
SELECT s.AdmLName1, s.District, s.County, s.School  FROM schools s  WHERE s.CharterNum = '40'; 
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino'  AND District = 'San Bernardino City Unified'  AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'  AND (SOC = '62' OR DOC = '54'); 
SELECT s.School, s.AdmEmail1 FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumGE1500 IS NOT NULL ORDER BY ss.NumGE1500 DESC LIMIT 1; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id JOIN card ca ON d.disp_id = ca.disp_id WHERE a.frequency = 'POPLATEK PO OBRATU' AND dist.A3 = 'East Bohemia'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague'; 
SELECT      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END AS year_with_higher_unemployment FROM district
SELECT COUNT(DISTINCT d.district_id) FROM district d JOIN client c ON d.district_id = c.district_id WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000; 
SELECT COUNT(c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000; 
SELECT      a.account_id,     MIN(d.A11) AS lowest_avg_salary,     (SELECT MAX(A11) FROM district) - MIN(d.A11) AS salary_gap FROM      account a JOIN      disp d1 ON a.account_id = d1.account_id JOIN      client c ON d1.client_id = c.client_id JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' GROUP BY      a.account_id, c.birth_date HAVING      c.birth_date = (SELECT MIN(birth_date) FROM client WHERE gender = 'F') ORDER BY      AVG(d.A11) LIMIT 1; 
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dis ON c.district_id = dis.district_id WHERE c.birth_date = (     SELECT MAX(birth_date)     FROM client ) AND dis.A11 = (     SELECT MAX(A11)     FROM district ); 
SELECT COUNT(DISTINCT d.client_id) FROM disp d JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'; 
SELECT DISTINCT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE d.type = 'DISPONENT' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.date LIKE '1997-%' GROUP BY a.account_id HAVING l.amount = (     SELECT MIN(amount)     FROM loan     WHERE date LIKE '1997-%' ) AND a.frequency = 'POPLATEK TYDNE'; 
SELECT l.account_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration > 12 AND l.status = 'A' AND YEAR(a.date) = 1993 ORDER BY l.amount DESC LIMIT 1; 
SELECT COUNT(DISTINCT c.client_id)  FROM client c  JOIN account a ON c.client_id = (     SELECT disp.client_id      FROM disp      WHERE disp.account_id = a.account_id AND disp.type = 'OWNER' ) JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date < '1950-01-01' AND d.A2 = 'Sokolov'; 
SELECT account_id FROM account WHERE date = (SELECT MIN(date) FROM account WHERE date >= '1995-01-01' AND date < '1996-01-01') 
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE a.date < '1997-01-01' AND t.balance > 3000; 
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id WHERE cd.issued = '1994-03-03'; 
SELECT a.date  FROM account a JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14'; 
SELECT account.district_id  FROM account  JOIN loan ON account.account_id = loan.account_id  WHERE loan.date = '1994-08-25'; 
SELECT MAX(t.amount)  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN card cd ON d.disp_id = cd.disp_id  WHERE YEAR(cd.issued) = 1996 AND MONTH(cd.issued) = 10 AND DAY(cd.issued) = 21; 
SELECT c.gender  FROM client c  JOIN account a ON c.client_id = (     SELECT d.client_id      FROM disp d      WHERE d.account_id = a.account_id      LIMIT 1 )  JOIN district dis ON c.district_id = dis.district_id  WHERE a.date = (     SELECT MIN(date)      FROM account      WHERE district_id = dis.district_id )  AND c.birth_date = (     SELECT MIN(birth_date)      FROM client      WHERE district_id = dis.district_id )  ORDER BY dis.A11 DESC  LIMIT 1; 
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN loan l ON a.account_id = l.account_id WHERE c.client_id = (     SELECT l2.client_id     FROM (         SELECT d2.client_id, MAX(l2.amount) AS max_loan         FROM loan l2         JOIN disp d2 ON l2.account_id = d2.account_id         GROUP BY d2.client_id     ) subquery     WHERE subquery.max_loan = (         SELECT MAX(amount)         FROM loan     ) ) AND t.date > a.date ORDER BY t.date LIMIT 1; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dist ON a.district_id = dist.district_id WHERE dist.A2 = 'Jesenik' AND c.gender = 'F'; 
SELECT d.disp_id FROM disp d JOIN account a ON d.account_id = a.account_id JOIN trans t ON t.account_id = a.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02'; 
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND YEAR(a.date) = 1996; 
SELECT d.A2 FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29'; 
SELECT c.birth_date FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03'; 
SELECT a.account_id  FROM account a  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  JOIN district dist ON c.district_id = dist.district_id  WHERE dist.A3 = 'Prague'  ORDER BY a.date ASC  LIMIT 1; 
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) / COUNT(c.client_id)) * 100 AS male_percentage FROM      client c JOIN      district d ON c.district_id = d.district_id WHERE      d.A3 = 'south Bohemia' ORDER BY      d.A4 DESC LIMIT 1; 
SELECT      ((t2.balance - t1.balance) / t1.balance) * 100 AS increase_rate FROM      trans t1,     trans t2,     loan l,     account a WHERE      l.date = (SELECT MIN(date) FROM loan WHERE date >= '1993-07-05')     AND l.account_id = a.account_id     AND t1.account_id = a.account_id     AND t2.account_id = a.account_id     AND t1.date = '1993-03-22'     AND t2.date = '1998-12-27'; 
SELECT (SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) / SUM(amount)) * 100 AS percentage_paid_with_no_issue FROM loan; 
SELECT      (COUNT(CASE WHEN l.status = 'C' THEN l.account_id END) / COUNT(DISTINCT l.account_id::float)) * 100 AS percentage_running_no_issue FROM      loan l WHERE      l.amount < 100000; 
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE YEAR(a.date) = 1993 AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT a.account_id, a.frequency, c.client_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id WHERE dist.A2 = 'east Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31' AND d.type = 'OWNER'; 
SELECT a.account_id, a.date FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice'; 
SELECT d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.loan_id = 4990; 
SELECT l.account_id, d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000; 
SELECT l.loan_id, d.A3 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60; 
SELECT d.A2 AS district,         ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increment FROM district d JOIN account a ON d.district_id = a.district_id JOIN disp dp ON a.account_id = dp.account_id JOIN client c ON dp.client_id = c.client_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'D'; 
SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM account WHERE strftime('%Y', date) = '1993') AS percentage FROM      account a JOIN      district d ON a.district_id = d.district_id WHERE      strftime('%Y', a.date) = '1993' AND d.A2 = 'Decin'; 
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'; 
SELECT d.A2, COUNT(c.client_id) AS female_account_holders FROM district d JOIN client c ON d.district_id = c.district_id JOIN disp dp ON c.client_id = dp.client_id JOIN account a ON dp.account_id = a.account_id WHERE c.gender = 'F' GROUP BY d.A2 ORDER BY female_account_holders DESC LIMIT 9; 
SELECT d.A2 AS district_name, t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' ORDER BY t.amount DESC LIMIT 10; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id LEFT JOIN card ca ON d.disp_id = ca.disp_id WHERE dist.A3 = 'South Bohemia' AND ca.card_id IS NULL; 
SELECT d.A3 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY COUNT(l.loan_id) DESC LIMIT 1; 
SELECT AVG(l.amount)  FROM loan l  JOIN account a ON l.account_id = a.account_id  JOIN disp d ON a.account_id = d.account_id  JOIN client c ON d.client_id = c.client_id  WHERE c.gender = 'M'; 
SELECT A2 AS district_name, A13 AS unemployment_rate FROM district WHERE A13 = (SELECT MAX(A13) FROM district) ORDER BY unemployment_rate DESC; 
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A16 = (     SELECT MAX(A16)      FROM district ) AND YEAR(a.date) = 1996; 
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU' AND t.balance < 0 AND a.frequency = 'POPLATEK MESICNE'; 
SELECT COUNT(DISTINCT l.loan_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.amount >= 250000 AND a.frequency = 'POPLATEK MESICNE'; 
SELECT COUNT(DISTINCT l.account_id)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE a.district_id = 1 AND (l.status = 'C' OR l.status = 'D'); 
SELECT COUNT(c.client_id) AS male_clients_count FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.district_id = (     SELECT district_id     FROM district     ORDER BY A15 DESC     LIMIT 1 OFFSET 1 ) 
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER'; 
SELECT COUNT(account_id)  FROM account  WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek'); 
SELECT DISTINCT d.district_id, d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.amount > 10000 AND YEAR(t.date) = 1997; 
SELECT DISTINCT o.account_id FROM `order` o WHERE o.k_symbol = 'SIPO' AND EXISTS (     SELECT 1     FROM account a     JOIN district d ON a.district_id = d.district_id     WHERE a.account_id = o.account_id     AND d.A2 = 'Pisek' ); 
SELECT DISTINCT d.account_id  FROM disp d  JOIN card c ON d.disp_id = c.disp_id  WHERE c.type = 'gold'
SELECT AVG(amount) AS avg_amount FROM trans WHERE type = 'VYBER KARTOU' AND YEAR(date) = 2021; 
SELECT DISTINCT t.account_id FROM trans t JOIN card c ON t.account_id = (     SELECT d.account_id      FROM disp d      WHERE d.disp_id = c.disp_id ) WHERE t.type = 'VYBER KARTOU' AND t.date LIKE '1998-%' AND t.amount < (     SELECT AVG(amount)      FROM trans      WHERE type = 'VYBER KARTOU' AND date LIKE '1998-%' ); 
SELECT DISTINCT c.client_id, c.gender FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN card ca ON d.disp_id = ca.disp_id JOIN loan l ON a.account_id = l.account_id WHERE c.gender = 'F'; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id WHERE c.gender = 'F' AND dist.A3 = 'south Bohemia'; 
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dist ON a.district_id = dist.district_id WHERE dist.A2 = 'Tabor' AND d.type = 'OWNER'; 
SELECT a.frequency, d.A11 AS average_income FROM account a JOIN district d ON a.district_id = d.district_id LEFT JOIN disp dp ON a.account_id = dp.account_id WHERE dp.type != 'OWNER' AND d.A11 > 8000 AND d.A11 <= 9000 GROUP BY a.frequency, d.A11; 
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB'; 
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ'; 
SELECT AVG(district.A15) AS avg_crimes_1995 FROM district JOIN account ON district.district_id = account.district_id WHERE district.A15 > 4000 AND YEAR(account.date) >= 1997; 
SELECT COUNT(DISTINCT c.card_id) FROM card c JOIN disp d ON c.disp_id = d.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.type = 'classic' AND d.type = 'OWNER'; 
SELECT COUNT(c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha'; 
SELECT      (COUNT(CASE WHEN c.type = 'gold' AND c.issued < '1998-01-01' THEN 1 END) / COUNT(c.card_id)) * 100.0 AS gold_percent FROM      card c; 
SELECT c.client_id, c.gender, c.birth_date, c.district_id  FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE l.amount = (SELECT MAX(amount) FROM loan) AND d.type = 'OWNER'; 
SELECT A15 AS number_of_crimes_1995 FROM account JOIN district ON account.district_id = district.district_id WHERE account.account_id = 532; 
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333
SELECT t.* FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 3356 AND t.type = 'VYBER'; 
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000; 
SELECT c.type  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE d.client_id = 13539; 
SELECT d.A3  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.client_id = 3541; 
SELECT d.A2 AS district_name, COUNT(l.loan_id) AS loan_count FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY loan_count DESC LIMIT 1; 
SELECT a.account_id, c.client_id, c.gender, c.birth_date, d.A2 AS district_name FROM `order` o JOIN `account` a ON o.account_id = a.account_id JOIN `disp` di ON a.account_id = di.account_id JOIN `client` c ON di.client_id = c.client_id JOIN `district` d ON c.district_id = d.district_id WHERE o.order_id = 32423; 
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5; 
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Jesenik'; 
SELECT DISTINCT d.client_id FROM disp d JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'junior' AND c.issued >= '1997-01-01'; 
SELECT      CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM      client c JOIN      account a ON c.client_id = (         SELECT d.client_id          FROM disp d          WHERE d.account_id = a.account_id AND d.type = 'OWNER'     ) JOIN      district d ON a.district_id = d.district_id WHERE      d.A11 > 10000; 
SELECT      ((SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) - SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) / SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) * 100 AS growth_rate FROM      loan l JOIN      disp d ON l.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.gender = 'M' AND (YEAR(l.date) = 1996 OR YEAR(l.date) = 1997) 
SELECT COUNT(*)  FROM trans  WHERE type = 'VYBER KARTOU' AND date > '1995-12-31'; 
SELECT      SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) -     SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) AS crime_difference FROM district; 
SELECT type, COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10  GROUP BY type; 
SELECT COUNT(*)  FROM trans  WHERE account_id = 3 AND type = 'VYBER' AND amount = 3539 AND k_symbol IS NOT NULL; 
SELECT birth_date FROM client WHERE client_id = 130; 
SELECT COUNT(*)  FROM account a JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT l.amount AS debt_amount, l.status AS payment_status FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE d.client_id = 992; 
SELECT c.gender, SUM(t.amount) AS total_amount FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE d.client_id = 4 AND t.trans_id < 851 GROUP BY c.gender; 
SELECT type FROM card JOIN disp ON card.disp_id = disp.disp_id WHERE disp.client_id = 9; 
SELECT SUM(amount) AS total_paid FROM trans WHERE account_id IN (     SELECT account_id     FROM disp     WHERE client_id = 617 ) AND YEAR(date) = 1998; 
SELECT c.client_id, c.gender, c.birth_date, d.A2 AS district_name FROM client c JOIN district d ON c.district_id = d.district_id JOIN disp dp ON c.client_id = dp.client_id JOIN account a ON dp.account_id = a.account_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A2 = 'East Bohemia'; 
SELECT c.client_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN loan l ON d.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN trans t ON d.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.k_symbol = 'SIPO' AND t.amount > 4000; 
SELECT COUNT(*)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Beroun' AND a.date > '1996-01-01'; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior'; 
SELECT      COUNT(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0 / COUNT(c.client_id) AS female_proportion FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id JOIN      district dist ON a.district_id = dist.district_id WHERE      dist.A3 = 'Prague'; 
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 END) / COUNT(a.account_id)) * 100 AS percentage_male_weekly FROM      client c JOIN      disp d ON c.client_id = d.client_id JOIN      account a ON d.account_id = a.account_id WHERE      a.frequency = 'POPLATEK TYDNE'; 
SELECT COUNT(DISTINCT d.client_id) FROM disp d JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'; 
SELECT l.account_id, MIN(l.amount) AS min_amount FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' AND l.status = 'A' GROUP BY l.account_id; 
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id JOIN district dist ON c.district_id = dist.district_id WHERE c.gender = 'F' AND c.birth_date = (     SELECT MIN(birth_date)     FROM client     WHERE gender = 'F' ) AND dist.A11 = (     SELECT MIN(A11)     FROM district     WHERE district_id IN (         SELECT district_id         FROM client         WHERE gender = 'F'     ) ) 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date LIKE '1920-%' AND d.A3 = 'east Bohemia'; 
SELECT COUNT(DISTINCT l.account_id)  FROM loan l  JOIN account a ON l.account_id = a.account_id  WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE'; 
SELECT AVG(l.amount) AS avg_loan_amount FROM loan l JOIN trans t ON l.account_id = t.account_id WHERE l.status IN ('C', 'D') AND t.type = 'POPLATEK PO OBRATU'; 
SELECT c.client_id, c.district_id FROM client c JOIN disp d ON c.client_id = d.client_id WHERE d.type = 'OWNER'; 
SELECT c.client_id, TIMESTAMPDIFF(YEAR, c.birth_date, CURDATE()) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cd ON d.disp_id = cd.disp_id WHERE cd.type = 'gold' AND d.type = 'OWNER'; 
SELECT bond_type  FROM bond  GROUP BY bond_type  ORDER BY COUNT(bond_type) DESC  LIMIT 1; 
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '-' AND a.element = 'cl'; 
SELECT AVG(oxygen_count) AS avg_oxygen_atoms FROM (     SELECT m.molecule_id, SUM(a.element = 'o') AS oxygen_count     FROM molecule m     JOIN bond b ON m.molecule_id = b.molecule_id     JOIN connected c ON b.bond_id = c.bond_id     JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id     WHERE b.bond_type = '-'     GROUP BY m.molecule_id ) AS subquery; 
SELECT AVG(single_bonds_count) AS avg_single_bonds FROM (     SELECT COUNT(b.bond_id) AS single_bonds_count     FROM molecule m     JOIN bond b ON m.molecule_id = b.molecule_id     WHERE m.label = '+' AND b.bond_type = '-'     GROUP BY m.molecule_id ) AS subquery; 
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'na' AND m.label = '-'; 
SELECT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '#' AND m.label = '+'; 
SELECT      (SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS percentage_carbon FROM      atom a JOIN      bond b ON a.molecule_id = b.molecule_id WHERE      b.bond_type = '='; 
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#'; 
SELECT COUNT(*)  FROM atom  WHERE element != 'br'; 
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+'; 
SELECT DISTINCT molecule_id  FROM atom  WHERE element = 'c'; 
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR004_8_9'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '='; 
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(m.label) DESC LIMIT 1; 
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl'; 
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'; 
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '-'; 
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '-'  GROUP BY element  ORDER BY COUNT(element) ASC  LIMIT 1; 
SELECT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20')     OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8') 
SELECT DISTINCT m.label FROM molecule m WHERE m.molecule_id NOT IN (     SELECT a.molecule_id     FROM atom a     WHERE a.element = 'sn' ) 
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  WHERE a.element IN ('i', 's') AND b.bond_type = '-'; 
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'; 
SELECT DISTINCT a1.atom_id FROM atom a1 JOIN connected c ON a1.atom_id = c.atom_id OR a1.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR181'; 
SELECT      (COUNT(DISTINCT m.molecule_id) - COUNT(DISTINCT CASE WHEN a.element = 'f' THEN m.molecule_id END)) * 100.0 / COUNT(DISTINCT m.molecule_id) AS percentage FROM      molecule m LEFT JOIN      atom a ON m.molecule_id = a.molecule_id WHERE      m.label = '+'; 
SELECT      SUM(CASE WHEN b.bond_type = '#' THEN 1 ELSE 0 END) * 100 / COUNT(b.bond_id) AS percent FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      m.label = '+'; 
SELECT element  FROM atom  WHERE molecule_id = 'TR000'  GROUP BY element  ORDER BY element  LIMIT 3; 
SELECT a1.atom_id, a2.atom_id FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_6' AND a1.molecule_id = 'TR001' AND a2.molecule_id = 'TR001'; 
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule
SELECT atom_id, atom_id2  FROM connected  WHERE bond_id = 'TR000_2_5'; 
SELECT bond_id  FROM connected  WHERE atom_id2 = 'TR000_2'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' ORDER BY m.molecule_id LIMIT 5; 
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond WHERE molecule_id = 'TR008';
SELECT      ROUND((SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) / COUNT(molecule_id)) * 100, 3) AS percent  FROM molecule; 
SELECT      CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM      atom WHERE      molecule_id = 'TR006'; 
SELECT bond_type  FROM bond  WHERE molecule_id = 'TR000'; 
SELECT a.element, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR060'; 
SELECT      b.bond_type,      m.label FROM      bond b JOIN      molecule m ON b.molecule_id = m.molecule_id WHERE      b.molecule_id = 'TR010' GROUP BY      b.bond_type,      m.label ORDER BY      COUNT(b.bond_type) DESC LIMIT 1; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' ORDER BY m.molecule_id LIMIT 3 
SELECT bond_id  FROM bond  WHERE molecule_id = 'TR006'  ORDER BY bond_id  LIMIT 2; 
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c WHERE (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12')  AND c.bond_id IN (     SELECT b.bond_id      FROM bond b      WHERE b.molecule_id = 'TR009' ); 
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'br' AND m.label = '+'; 
SELECT b.bond_type, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE b.bond_id = 'TR001_6_9'; 
SELECT m.molecule_id, m.label  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR001_10'; 
SELECT COUNT(DISTINCT molecule_id)  FROM bond  WHERE bond_type = '#'; 
SELECT COUNT(bond_id)  FROM connected  WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'; 
SELECT element  FROM atom  WHERE molecule_id = 'TR004'; 
SELECT COUNT(*)  FROM molecule  WHERE label = '-'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'; 
SELECT DISTINCT b.bond_id FROM bond b JOIN connected c ON b.bond_id IN (c.bond_id) JOIN atom a1 ON c.atom_id = a1.atom_id AND a1.element = 'p' JOIN atom a2 ON c.atom_id2 = a2.atom_id AND a2.element = 'n' UNION SELECT DISTINCT b.bond_id FROM bond b JOIN connected c ON b.bond_id IN (c.bond_id) JOIN atom a1 ON c.atom_id = a1.atom_id AND a1.element = 'n' JOIN atom a2 ON c.atom_id2 = a2.atom_id AND a2.element = 'p' 
SELECT m.label  FROM molecule m  JOIN (     SELECT b.molecule_id, COUNT(*) AS dbl_bond_count      FROM bond b      WHERE b.bond_type = '='      GROUP BY b.molecule_id ) AS db ON m.molecule_id = db.molecule_id  WHERE db.dbl_bond_count = (     SELECT MAX(dbl_bond_count)      FROM (         SELECT COUNT(*) AS dbl_bond_count          FROM bond          WHERE bond_type = '='          GROUP BY molecule_id     ) AS max_db ); 
SELECT AVG(num_bonds) AS avg_bonds FROM (     SELECT a.atom_id, COUNT(c.bond_id) AS num_bonds     FROM atom a     LEFT JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2     WHERE a.element = 'i'     GROUP BY a.atom_id ) AS subquery; 
SELECT b.bond_type, b.bond_id  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id  WHERE SUBSTR(a.atom_id, 7, 2) + 0 = 45; 
SELECT element  FROM atom  WHERE atom_id NOT IN (SELECT atom_id FROM connected); 
SELECT a1.atom_id, a2.atom_id  FROM atom a1  JOIN connected c1 ON a1.atom_id = c1.atom_id  JOIN bond b ON c1.bond_id = b.bond_id  JOIN connected c2 ON b.bond_id = c2.bond_id  JOIN atom a2 ON c2.atom_id2 = a2.atom_id  WHERE b.molecule_id = 'TR041' AND b.bond_type = '#' 
SELECT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR144_8_19'; 
SELECT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.label = '+' AND b.bond_type = '='  GROUP BY m.molecule_id  ORDER BY COUNT(b.bond_id) DESC  LIMIT 1; 
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'  GROUP BY element  ORDER BY COUNT(*) ASC  LIMIT 1; 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 JOIN atom a2 ON c.atom_id = a2.atom_id WHERE a2.element = 'pb'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'; 
SELECT      (COUNT(c.bond_id) * 100.0 / (SELECT COUNT(*) FROM connected)) AS percentage FROM      connected c JOIN      atom a1 ON c.atom_id = a1.atom_id JOIN      atom a2 ON c.atom_id2 = a2.atom_id GROUP BY      a1.element, a2.element ORDER BY      COUNT(c.bond_id) DESC LIMIT 1; 
SELECT ROUND(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.bond_id), 5) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'; 
SELECT COUNT(*)  FROM atom  WHERE element IN ('c', 'h'); 
SELECT c.atom_id2  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 's'; 
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn'; 
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE b.bond_type = '-'; 
SELECT COUNT(DISTINCT a.atom_id) AS total_atoms FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br') 
SELECT bond_id  FROM bond  WHERE molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE label = '+' ); 
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(a.atom_id)) * 100 AS percent FROM      atom a JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      b.bond_type = '-'; 
SELECT molecule_id, label  FROM molecule  WHERE molecule_id IN ('TR000', 'TR001', 'TR002'); 
SELECT molecule_id  FROM molecule  WHERE label = '-'; 
SELECT COUNT(*)  FROM molecule  WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030'; 
SELECT bond_type  FROM bond  WHERE molecule_id BETWEEN 'TR000' AND 'TR050'; 
SELECT a1.element, a2.element  FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_10_11'; 
SELECT COUNT(DISTINCT c.bond_id)  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id  WHERE a.element = 'i'; 
SELECT MAX(label) AS predominant_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'; 
SELECT CASE WHEN COUNT(DISTINCT a.element) = 2 THEN 'Yes' ELSE 'No' END AS has_both_elements FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_1_8' AND a.element IN ('cl', 'c') 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND b.bond_type = '#' AND a.element = 'c' LIMIT 2; 
SELECT      (SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(DISTINCT a.molecule_id)) * 100 AS percentage FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '+'; 
SELECT DISTINCT a.element  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE b.molecule_id = 'TR001'; 
SELECT molecule_id FROM bond WHERE bond_type = '='; 
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_1_2'; 
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT m.label  FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11'; 
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#'; 
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'   AND SUBSTR(a.atom_id, 7, 1) = '4'; 
SELECT      m.label,     CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(a.element) AS ratio FROM      atom a JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      a.molecule_id = 'TR006' GROUP BY      m.label; 
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'ca'; 
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'c'; 
SELECT a1.element, a2.element FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON b.bond_id = c2.bond_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id = a2.atom_id WHERE b.bond_id = 'TR001_10_11'; 
SELECT      (COUNT(DISTINCT CASE WHEN b.bond_type = '#' THEN m.molecule_id END) / COUNT(DISTINCT m.molecule_id)) * 100 AS percentage_triple_bond FROM      molecule m LEFT JOIN      bond b ON m.molecule_id = b.molecule_id; 
SELECT      CAST(SUM(CASE WHEN b.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) AS percent FROM      bond b WHERE      b.molecule_id = 'TR047'; 
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.atom_id = 'TR001_1'; 
SELECT label FROM molecule WHERE molecule_id = 'TR151'; 
SELECT DISTINCT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id, element  FROM atom  WHERE molecule_id BETWEEN 'TR010' AND 'TR050'  AND element = 'c'; 
SELECT COUNT(*)  FROM atom  WHERE molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE label = '+' ); 
SELECT b.bond_id  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '=' AND m.label = '+'; 
SELECT COUNT(a.atom_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'h' AND m.label = '+'; 
SELECT b.molecule_id  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE c.atom_id = 'TR000_1' AND b.bond_id = 'TR000_1_2'; 
SELECT atom_id  FROM atom  WHERE element = 'c'  AND molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE label = '-' ); 
SELECT      (SUM(CASE WHEN m.label = '+' AND a.element = 'h' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id; 
SELECT label  FROM molecule  WHERE molecule_id = 'TR124'; 
SELECT atom_id, element  FROM atom  WHERE molecule_id = 'TR186'; 
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'; 
SELECT a1.element, a2.element  FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE c.bond_id = 'TR001_2_4'; 
SELECT COUNT(b.bond_id) AS double_bonds, m.label AS carcinogenic FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.molecule_id = 'TR006' AND b.bond_type = '='; 
SELECT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'; 
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2, m.molecule_id FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON c1.bond_id = c2.bond_id AND c1.atom_id <> c2.atom_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id = a2.atom_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'; 
SELECT m.molecule_id, a.element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON m.molecule_id = a.molecule_id WHERE b.bond_type = '#' ORDER BY m.molecule_id, a.element; 
SELECT a1.element, a2.element  FROM connected c  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE c.bond_id = 'TR000_2_3'; 
SELECT COUNT(DISTINCT c.bond_id)  FROM connected AS c  JOIN atom AS a1 ON c.atom_id = a1.atom_id  JOIN atom AS a2 ON c.atom_id2 = a2.atom_id  WHERE a1.element = 'cl' OR a2.element = 'cl'; 
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_types_count FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id; 
SELECT COUNT(DISTINCT b.molecule_id) AS total_molecules_with_double_bond,        SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_compounds FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '='; 
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  LEFT JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element != 's' AND b.bond_type != '=' OR b.bond_type IS NULL; 
SELECT m.label  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_id = 'TR001_2_4'; 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-'; 
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'cl' AND m.label = '+' 
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'c' AND m.label = '-'; 
SELECT      (SUM(CASE WHEN m.label = '+' AND a.element = 'cl' THEN 1 ELSE 0 END) / COUNT(DISTINCT m.molecule_id)) * 100 AS percentage FROM      molecule m LEFT JOIN      atom a ON m.molecule_id = a.molecule_id; 
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT a.element)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  WHERE c.bond_id = 'TR001_3_4'; 
SELECT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE (c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2') OR (c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1') 
SELECT a1.molecule_id  FROM atom a1  JOIN connected c ON a1.atom_id = c.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4'; 
SELECT element FROM atom WHERE atom_id = 'TR000_1'; 
SELECT label  FROM molecule  WHERE molecule_id = 'TR000'; 
SELECT      CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(bond_id) * 100 AS percentage FROM      bond; 
SELECT COUNT(DISTINCT a.molecule_id)  FROM atom a  JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'n' AND m.label = '+'; 
SELECT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 's' AND b.bond_type = '='; 
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024'; 
SELECT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'  GROUP BY m.molecule_id  ORDER BY COUNT(a.atom_id) DESC  LIMIT 1; 
SELECT      (CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT m.molecule_id)) * 100.0 AS percentage FROM      molecule m JOIN      atom a ON m.molecule_id = a.molecule_id JOIN      connected c ON a.atom_id = c.atom_id JOIN      bond b ON c.bond_id = b.bond_id WHERE      a.element = 'h' AND b.bond_type = '#'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  WHERE b.molecule_id BETWEEN 'TR004' AND 'TR010'  AND b.bond_type = '-'; 
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR008' AND element = 'c'; 
SELECT element  FROM atom  WHERE atom_id = 'TR004_7' AND molecule_id IN (     SELECT molecule_id      FROM molecule      WHERE label = '-' ); 
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id  WHERE b.bond_type = '=' AND a.element = 'o'; 
SELECT COUNT(DISTINCT b.molecule_id)  FROM bond b  JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND m.label = '-'; 
SELECT a.element, b.bond_type  FROM atom a  JOIN bond b  ON a.molecule_id = b.molecule_id  WHERE a.molecule_id = 'TR002'; 
SELECT c.atom_id FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id JOIN atom AS a ON c.atom_id = a.atom_id WHERE b.bond_type = '=' AND a.element = 'c' AND b.molecule_id = 'TR012'; 
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o'; 
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT * FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards); 
SELECT name  FROM cards  WHERE edhrecRank < 100 AND frameVersion = '2015'; 
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'gladiator' AND l.status = 'Banned' AND c.rarity = 'mythic'; 
SELECT c.name, l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage'; 
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal' AND (c.power = '*' OR c.power IS NULL); 
SELECT      c.id AS card_id,      r.text AS ruling_text,      CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_or_degraded_properties FROM      cards c LEFT JOIN      rulings r ON c.uuid = r.uuid WHERE      c.artist = 'Stephen Daniele'; 
SELECT r.text  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'; 
SELECT c.name, c.artist, c.isPromo FROM cards c JOIN (     SELECT uuid, COUNT(uuid) AS ruling_count     FROM rulings     GROUP BY uuid ) r ON c.uuid = r.uuid WHERE r.ruling_count = (     SELECT MAX(ruling_count)     FROM (         SELECT uuid, COUNT(uuid) AS ruling_count         FROM rulings         GROUP BY uuid     ) t ) ORDER BY c.isPromo DESC LIMIT 1; 
SELECT language FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Annul' AND T2.number = '29'; 
SELECT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese'; 
SELECT (COUNT(CASE WHEN t.language = 'Chinese Simplified' THEN 1 END) / CAST((SELECT COUNT(*) FROM cards) AS REAL)) * 100 AS percentage FROM set_translations t JOIN sets s ON t.setCode = s.code JOIN cards c ON c.setCode = s.code; 
SELECT s.code, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'; 
SELECT COUNT(DISTINCT types)  FROM cards  WHERE artist = 'Aaron Boyd'; 
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'; 
SELECT COUNT(*)  FROM cards  WHERE power = '*'; 
SELECT promoTypes FROM cards WHERE name = 'Duress'; 
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'; 
SELECT originalType FROM cards WHERE name = 'Ancestor\'s Chosen'; 
SELECT DISTINCT st.language FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Angel of Mercy'; 
SELECT COUNT(c.id) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isTextless = 0; 
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn'; 
SELECT COUNT(c.id) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'restricted' AND c.isStarter = 1; 
SELECT l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Cloudchaser Eagle'; 
SELECT type FROM cards WHERE name = 'Benalish Knight'; 
SELECT l.format, l.status FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.name = 'Benalish Knight'; 
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Phyrexian'; 
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN id END) / COUNT(id)) * 100 AS percentage_borderless FROM cards; 
SELECT COUNT(c.id) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'German' AND c.isReprint = 1; 
SELECT COUNT(*)  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian'; 
SELECT      (COUNT(CASE WHEN fd.language = 'French' THEN 1 END) * 100.0 / COUNT(c.isStorySpotlight)) AS french_story_spotlight_percentage FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.isStorySpotlight = 1; 
SELECT COUNT(*) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'; 
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'black' AND availability = 'mtgo'; 
SELECT id FROM cards WHERE convertedManaCost = 0; 
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'; 
SELECT COUNT(*)  FROM cards  WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'; 
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL AND hasFoil = 1; 
SELECT id FROM cards WHERE duelDeck = 'a'; 
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'; 
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Chinese Simplified'; 
SELECT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.availability = 'paper' AND f.language = 'Japanese'; 
SELECT COUNT(c.uuid) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.status = 'Banned' AND c.borderColor = 'white'; 
SELECT l.uuid, f.language FROM legalities l JOIN foreign_data f ON l.uuid = f.uuid WHERE l.format = 'legacy'; 
SELECT text FROM rulings WHERE uuid = (SELECT uuid FROM cards WHERE name = 'Beacon of Immortality'); 
SELECT COUNT(c.uuid) AS future_frame_count, l.status FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'Legal' GROUP BY l.status; 
SELECT c.name, c.colors FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW'; 
SELECT c.name, st.language FROM cards c JOIN sets s ON c.setCode = s.code LEFT JOIN set_translations st ON s.code = st.setCode WHERE c.setCode = '10E' AND c.convertedManaCost = 5 AND st.translation IS NOT NULL; 
SELECT c.name, r.date FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf'; 
SELECT c.id, c.colors, l.format FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20; 
SELECT c.name FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B'; 
SELECT c.name FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3; 
SELECT COUNT(*)  FROM cards  WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NULL; 
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*)  FROM cards  WHERE artist = 'UDON'  AND availability LIKE '%mtgo%'  AND hand = '-1'; 
SELECT COUNT(*)  FROM cards  WHERE frameVersion = '1993'  AND availability LIKE '%paper%'  AND hasContentWarning = 1; 
SELECT manaCost  FROM cards  WHERE layout = 'normal'    AND frameVersion = '2003'    AND borderColor = 'black'    AND availability = 'mtgo,paper'; 
SELECT SUM(CAST(REPLACE(manaCost, '{', '') AS REAL)) AS total_unconverted_mana FROM cards WHERE artist = 'Rob Alexander'; 
SELECT DISTINCT supertypes, subtypes  FROM cards  WHERE availability = 'arena'; 
SELECT DISTINCT s.setCode FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets s ON c.setCode = s.code WHERE fd.language = 'Spanish'; 
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage FROM cards WHERE frameEffects = 'legendary'; 
SELECT      id,     (COUNT(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN id END) * 100.0 / COUNT(id)) AS percentage FROM      cards GROUP BY      id; 
SELECT      (SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END) * 100.0 / COUNT(id)) AS spanish_percentage,     name FROM      foreign_data GROUP BY      name; 
SELECT st.translation, st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.baseSetSize = 309; 
SELECT COUNT(DISTINCT st.setCode)  FROM sets st  JOIN set_translations tr  ON st.setCode = tr.setCode  WHERE st.block = 'Commander' AND tr.language = 'Portuguese (Brasil)'; 
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal'; 
SELECT DISTINCT fd.type AS subtype, c.supertypes AS supertype FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'German' AND fd.type IS NOT NULL AND c.supertypes IS NOT NULL; 
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*'  AND text LIKE '%triggered ability%'; 
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'premodern' AND EXISTS (     SELECT 1     FROM rulings r     WHERE r.uuid = c.uuid     AND r.text = 'This is a triggered mana ability.' ) AND c.side IS NULL; 
SELECT id  FROM cards  WHERE artist = 'Erica Yang'  AND 'pauper' IN (SELECT format FROM legalities WHERE status = 'Legal' AND uuid = cards.uuid) AND availability = 'paper'; 
SELECT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.text = 'Das perfekte Gegenmittel zu einer dichten Formation'; 
SELECT fd.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Matthew D. Wilson'   AND c.type LIKE '%Creature%'   AND c.layout = 'normal'   AND c.borderColor = 'black'   AND fd.language = 'French'; 
SELECT COUNT(DISTINCT c.id) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'; 
SELECT st.language, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica'; 
SELECT      (COUNT(CASE WHEN c.hasContentWarning = 0 THEN 1 END) / COUNT(l.id)) * 100 AS percentage FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      l.format = 'commander' AND l.status = 'Legal'; 
SELECT      (COUNT(CASE WHEN fd.language = 'French' AND c.power IS NULL OR c.power = '*' THEN 1 END) * 100.0 / COUNT(CASE WHEN c.power IS NULL OR c.power = '*' THEN 1 END)) AS percentage FROM      cards c LEFT JOIN      foreign_data fd ON c.uuid = fd.uuid WHERE      c.power IS NULL OR c.power = '*'; 
SELECT      CAST(SUM(CASE WHEN t.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(t.language) AS percentage FROM      set_translations t JOIN      sets s ON t.setCode = s.code WHERE      s.type = 'expansion'; 
SELECT availability FROM cards WHERE artist = 'Daren Bader'; 
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless' AND edhrecRank > 12000; 
SELECT COUNT(*)  FROM cards  WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1; 
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name LIMIT 3; 
SELECT language FROM foreign_data WHERE multiverseid = 149934; 
SELECT id  FROM cards  WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL  ORDER BY cardKingdomFoilId ASC  LIMIT 3; 
SELECT      (COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) / COUNT(CASE WHEN isTextless = 1 THEN 1 END)) * 100 AS proportion FROM      cards; 
SELECT number  FROM cards  WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%'; 
SELECT code, name  FROM sets  WHERE mtgoCode IS NULL OR mtgoCode = ''  ORDER BY name  LIMIT 3; 
SELECT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.setCode = 'ARC'; 
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5; 
SELECT s.language, s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 206; 
SELECT s.name, s.code  FROM sets s JOIN cards c ON s.code = c.setCode JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Italian' AND s.block = 'Shadowmoor' GROUP BY s.name, s.code ORDER BY s.name ASC LIMIT 2; 
SELECT s.id, s.name  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1  AND s.isFoilOnly = 1  AND st.language = 'Japanese'; 
SELECT s.name, s.baseSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1; 
SELECT      (COUNT(CASE WHEN s.isOnlineOnly = 1 THEN 1 END) * 100.0 / COUNT(s.isOnlineOnly)) AS percentage FROM      sets s JOIN      set_translations st ON s.code = st.setCode WHERE      st.language = 'Chinese Simplified'; 
SELECT COUNT(*)  FROM sets s WHERE EXISTS (     SELECT 1      FROM set_translations st      WHERE st.setCode = s.code AND st.language = 'Japanese' )  AND (s.mtgoCode IS NULL OR s.mtgoCode = ''); 
SELECT id FROM cards WHERE borderColor = 'black'; 
SELECT id FROM cards WHERE frameEffects = 'extendedart'; 
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1; 
SELECT language FROM set_translations WHERE setCode = (SELECT code FROM sets WHERE id = 174); 
SELECT name FROM sets WHERE code = 'ALL'; 
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'; 
SELECT code FROM sets WHERE releaseDate = '2007-07-13'; 
SELECT baseSetSize, code  FROM sets  WHERE block IN ('Masques', 'Mirage'); 
SELECT code AS setCode FROM sets WHERE type = 'expansion'; 
SELECT fd.name, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'boros'; 
SELECT fd.language, fd.flavorText, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.watermark IS NOT NULL; 
SELECT      (COUNT(CASE WHEN t1.convertedManaCost = 10 THEN 1 END) / COUNT(t1.convertedManaCost)) * 100 AS percentage FROM      cards t1 JOIN      sets t2 ON t1.setCode = t2.code WHERE      t1.name = 'Abyssal Horror'; 
SELECT DISTINCT s.code AS setCode FROM sets s JOIN legalities l ON s.code = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal'; 
SELECT fd.name, c.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.watermark = 'abzan'; 
SELECT fd.language, c.type FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.watermark = 'azorius'; 
SELECT COUNT(*)  FROM cards  WHERE artist = 'Aaron Miller'  AND cardKingdomFoilId IS NOT NULL  AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*)  FROM cards  WHERE availability LIKE '%paper%' AND hand = '3'; 
SELECT name FROM cards WHERE isTextless = 0; 
SELECT manaCost FROM cards WHERE name = 'Ancestor''s Chosen'; 
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'white' AND (power = '*' OR power IS NULL); 
SELECT name  FROM cards  WHERE isPromo = 1 AND side IS NOT NULL; 
SELECT supertypes, subtypes  FROM cards  WHERE name = 'Molimo, Maro-Sorcerer'; 
SELECT c.purchaseUrls FROM cards c WHERE c.promoTypes = 'bundle'; 
SELECT COUNT(DISTINCT artist)  FROM cards  WHERE borderColor = 'black'  AND availability LIKE '%arena,mtgo%'; 
SELECT name, convertedManaCost  FROM cards  WHERE name IN ('Serra Angel', 'Shrine Keeper')  ORDER BY convertedManaCost DESC  LIMIT 1; 
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'; 
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3; 
SELECT st.translation  FROM sets st  JOIN cards c ON st.code = c.setCode  JOIN set_translations stt ON st.code = stt.setcode  WHERE c.name = 'Ancestor''s Chosen' AND stt.language = 'Italian'; 
SELECT COUNT(*)  FROM set_translations st JOIN sets s ON st.setCode = s.code JOIN cards c ON c.setCode = s.code WHERE c.name = 'Angel of Mercy'; 
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'; 
SELECT fd.id, fd.name, fd.language  FROM foreign_data fd  JOIN cards c ON fd.uuid = c.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Korean'; 
SELECT COUNT(c.id) FROM cards c JOIN sets s ON c.setCode = s.code JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'; 
SELECT baseSetSize  FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'; 
SELECT st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified'; 
SELECT c.name, s.mtgoCode FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL; 
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen'; 
SELECT s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Hauptset Zehnte Edition'; 
SELECT COUNT(DISTINCT s.code) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL; 
SELECT s.name AS set_name, s.isForeignOnly FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Adarkar Valkyrie'; 
SELECT COUNT(s.id) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND st.translation IS NOT NULL AND s.baseSetSize < 100; 
SELECT COUNT(*)  FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.borderColor = 'black'; 
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1; 
SELECT DISTINCT artist  FROM cards  WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')  AND setCode = 'CSP'; 
SELECT name  FROM cards  WHERE number = '4' AND.setCode = 'CSP'; 
SELECT COUNT(*)  FROM cards AS T1  JOIN sets AS T2 ON T1.setCode = T2.code  WHERE T2.name = 'Coldsnap'  AND T1.convertedManaCost > 5  AND (T1.power = '*' OR T1.power IS NULL) 
SELECT flavorText  FROM foreign_data  WHERE language = 'Italian'  AND name = 'Ancestor''s Chosen'; 
SELECT DISTINCT fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL; 
SELECT fd.type  FROM cards c  JOIN foreign_data fd ON c.uuid = fd.uuid  WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'German'; 
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN sets s ON c.setCode = s.code JOIN foreign_data fd ON c.uuid = fd.uuid WHERE s.name = 'Coldsnap' AND fd.language = 'Italian'; 
SELECT fd.name FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND fd.language = 'Italian' AND c.convertedManaCost = (     SELECT MAX(convertedManaCost)     FROM cards     WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap') ) 
SELECT r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Reminisce'; 
SELECT      (SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) / COUNT(c.id)) * 100 AS percentage FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap'; 
SELECT      (SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) / COUNT(c.id)) * 100 AS percentage_incredibly_powerful FROM      cards c JOIN      sets s ON c.setCode = s.code WHERE      s.name = 'Coldsnap'; 
SELECT code FROM sets WHERE releaseDate = '2017-07-14'; 
SELECT keyruneCode FROM sets WHERE code = 'PKHC'; 
SELECT mcmId FROM sets WHERE code = 'SS2'; 
SELECT mcmName  FROM sets  WHERE releaseDate = '2017-06-09'; 
SELECT type FROM sets WHERE name LIKE 'From the Vault: Lore'; 
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'; 
SELECT c.name, r.text AS ruling_text, c.hasContentWarning FROM cards c LEFT JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'; 
SELECT s.releaseDate FROM sets s JOIN cards c ON s.code = c.setCode WHERE c.name = 'Evacuation'; 
SELECT s.baseSetSize  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Rinascita di Alara'; 
SELECT s.type  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Huitième édition'; 
SELECT st.translation  FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN sets st ON c.setCode = st.code JOIN set_translations stt ON st.code = stt.setCode WHERE fd.name = 'Tendo Ice Bridge' AND stt.language = 'French'; 
SELECT COUNT(translation)  FROM set_translations AS st  JOIN sets AS s ON st.setCode = s.code  WHERE s.name = 'Tenth Edition' AND st.translation IS NOT NULL; 
SELECT st.translation FROM cards c JOIN sets st ON c.setCode = st.code JOIN set_translations stt ON st.code = stt.setCode WHERE c.name = 'Fellwar Stone' AND stt.language = 'Japanese'; 
SELECT c.name, MAX(c.convertedManaCost) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' GROUP BY c.name ORDER BY MAX(c.convertedManaCost) DESC LIMIT 1; 
SELECT s.releaseDate  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE st.translation = 'Ola de frío'; 
SELECT s.type  FROM cards c  JOIN sets s ON c.setCode = s.code  WHERE c.name = 'Samite Pilgrim'; 
SELECT COUNT(c.id) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3; 
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified'; 
SELECT      (SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) / COUNT(st.id)) * 100 AS percentage_non_foil FROM      cards c JOIN      foreign_data fd ON c.uuid = fd.uuid JOIN      sets s ON c.setCode = s.code JOIN      set_translations st ON s.code = st.setCode WHERE      fd.language = 'Japanese'; 
SELECT      (SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) / COUNT(st.id)) * 100 AS percentage_online_only FROM      set_translations st JOIN      sets s ON st.setCode = s.code WHERE      st.language = 'Portuguese (Brazil)'; 
SELECT DISTINCT availability  FROM cards  WHERE artist != 'Aleksi Briclot' AND isTextless = 1; 
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1; 
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1; 
SELECT MAX(frameEffects) AS most_common_frame_effects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*)  FROM cards  WHERE power IS NULL OR power = '*'  AND hasFoil = 0  AND duelDeck = 'a'; 
SELECT id  FROM sets  WHERE type = 'commander'  ORDER BY totalSetSize DESC  LIMIT 1; 
SELECT c.name, c.convertedManaCost FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' AND l.status = 'Legal' ORDER BY c.convertedManaCost DESC LIMIT 10; 
SELECT MIN(c.originalReleaseDate) AS oldestReleaseDate, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Legal' GROUP BY l.format; 
SELECT COUNT(DISTINCT c.id) FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.artist = 'Volkan Baǵa' AND f.language = 'French'; 
SELECT COUNT(c.id) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal'; 
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format ORDER BY COUNT(l.status) DESC LIMIT 1; 
SELECT st.translation, st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.name = 'Battlebond'; 
SELECT l.format, c.artist FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.artist IN (     SELECT artist     FROM cards     GROUP BY artist     HAVING COUNT(id) = (         SELECT MIN(cnt)         FROM (             SELECT COUNT(id) AS cnt             FROM cards             GROUP BY artist         ) AS subquery     ) ) GROUP BY l.format, c.artist; 
SELECT L.status FROM cards C JOIN legalities L ON C.uuid = L.uuid WHERE C.frameVersion = '1997'   AND C.artist = 'D. Alexander Gregory'   AND C.hasContentWarning = 1   AND L.format = 'legacy'; 
SELECT c.name, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'; 
SELECT AVG(set_count) AS avg_sets_per_year, common_language FROM (     SELECT YEAR(releaseDate) AS release_year, COUNT(*) AS set_count,             SUBSTRING_INDEX(GROUP_CONCAT(language ORDER BY lang_count DESC SEPARATOR ','), ',', 1) AS common_language     FROM sets s     LEFT JOIN set_translations st ON s.code = st.setCode     WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'     GROUP BY YEAR(releaseDate) ) AS yearly_sets GROUP BY common_language; 
SELECT DISTINCT c.artist FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.borderColor = 'black' AND c.availability = 'arena'; 
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'banned' OR status = 'restricted'); 
SELECT COUNT(*)  FROM cards  WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'; 
SELECT r.text, r.date FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC; 
SELECT DISTINCT c.name, l.format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'; 
SELECT s.name FROM sets s WHERE EXISTS (SELECT 1 FROM set_translations st WHERE st.setCode = s.code AND st.language = 'Korean') AND NOT EXISTS (SELECT 1 FROM set_translations st WHERE st.setCode = s.code AND st.language LIKE '%Japanese%') 
SELECT c.frameVersion, c.name, l.status FROM cards c LEFT JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' AND (l.status = 'Banned' OR l.status IS NULL) 
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1
SELECT DisplayName  FROM users  WHERE YEAR(CreationDate) = 2011; 
SELECT COUNT(*)  FROM users  WHERE LastAccessDate > '2014-09-01'; 
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1
SELECT COUNT(*) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'
SELECT COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'; 
SELECT u.DisplayName  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Title = 'Eliciting priors from experts'
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'  ORDER BY p.ViewCount DESC  LIMIT 1; 
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts) 
SELECT SUM(p.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'; 
SELECT MAX(p.AnswerCount) AS MaxAnswerCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'; 
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'; 
SELECT COUNT(*)  FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL; 
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL; 
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Age > 65 AND p.Score >= 20; 
SELECT u.Location  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Title = 'Eliciting priors from experts'
SELECT Body FROM posts WHERE Id = (SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian')
SELECT p.Body  FROM posts p  JOIN tags t ON p.Id = t.ExcerptPostId  WHERE t.Count = (SELECT MAX(Count) FROM tags)
SELECT COUNT(*) FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'; 
SELECT COUNT(*)  FROM badges AS b  JOIN users AS u ON b.UserId = u.Id  WHERE u.DisplayName = 'csgillespie' AND strftime('%Y', b.Date) = '2011'
SELECT U.DisplayName  FROM users U  JOIN (     SELECT UserId, COUNT(Id) AS BadgeCount      FROM badges      GROUP BY UserId      ORDER BY BadgeCount DESC      LIMIT 1 ) B ON U.Id = B.UserId
SELECT AVG(p.Score)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'
SELECT AVG(badge_count) AS avg_badges FROM (     SELECT u.DisplayName, COUNT(b.Id) AS badge_count     FROM users u     LEFT JOIN badges b ON u.Id = b.UserId     WHERE u.Views > 200     GROUP BY u.Id, u.DisplayName ) AS user_badges; 
SELECT      CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5; 
SELECT COUNT(*)  FROM votes  WHERE UserId = 58 AND CreationDate = '2010-07-19'; 
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1; 
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments) 
SELECT CommentCount FROM posts WHERE ViewCount = 1910
SELECT p.FavoriteCount  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0'; 
SELECT Text  FROM comments  WHERE PostId = 107829 AND UserId IS NOT NULL  LIMIT 1; 
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'; 
SELECT u.Reputation  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Id = 65041; 
SELECT COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Tiago Pasqualini'; 
SELECT u.DisplayName  FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.Id = 6347; 
SELECT COUNT(*) AS VoteCount FROM votes v JOIN posts p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms' 
SELECT COUNT(p.Id) / COUNT(v.Id) AS PostToVoteRatio FROM posts p LEFT JOIN votes v ON p.Id = v.PostId WHERE p.OwnerUserId = 24; 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17; 
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'thank you user93!' 
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion'; 
SELECT u.DisplayName, u.Reputation  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Title = 'Understanding what Dassault iSight is doing?'; 
SELECT c.Text  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10; 
SELECT u.DisplayName  FROM posts p  JOIN users u ON p.LastEditorUserId = u.Id  WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'; 
SELECT p.Title FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'; 
SELECT SUM(p.Score) AS TotalScore, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny'; 
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id JOIN postHistory ph ON ph.UserId = u.Id JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'; 
SELECT SUM(V.BountyAmount) AS TotalBountyAmount FROM votes V JOIN posts P ON V.PostId = P.Id WHERE P.Title LIKE '%data%'; 
SELECT u.DisplayName  FROM users u  JOIN votes v ON u.Id = v.UserId  JOIN posts p ON v.PostId = p.Id  WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'; 
SELECT p.Title, ph.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Tags LIKE '%<humor>%' GROUP BY p.Title, ph.Text; 
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT Id FROM users ORDER BY Views ASC LIMIT 1;
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5
SELECT COUNT(DISTINCT b1.UserId)  FROM badges b1  JOIN badges b2 ON b1.UserId = b2.UserId  JOIN users u ON b1.UserId = u.Id  WHERE b1.Name = 'Teacher' AND b2.Name = 'Supporter' AND u.Location = 'New York'; 
SELECT u.DisplayName, u.Reputation  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.Id = 1;
SELECT p.OwnerUserId FROM posts p JOIN (     SELECT PostId, COUNT(DISTINCT Id) AS postHistoryCount     FROM postHistory     GROUP BY PostId     HAVING postHistoryCount = 1 ) ph ON p.Id = ph.PostId WHERE p.ViewCount >= 1000 GROUP BY p.OwnerUserId; 
SELECT u.DisplayName, b.Name AS Badge FROM users u JOIN (     SELECT UserId, COUNT(*) AS CommentCount     FROM comments     GROUP BY UserId ) c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId WHERE c.CommentCount = (     SELECT MAX(CommentCount)     FROM (         SELECT COUNT(*) AS CommentCount         FROM comments         GROUP BY UserId     ) t ); 
SELECT COUNT(DISTINCT u.Id)  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE u.Location = 'India' AND b.Name = 'Teacher'
SELECT      ((SUM(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(*)) * 100 -      (SUM(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percentage_difference FROM      badges WHERE      Name = 'Student'; 
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId) AS UniqueCommenters FROM postHistory ph LEFT JOIN comments c ON ph.PostId = c.PostId WHERE ph.PostId = 3720 GROUP BY ph.PostHistoryTypeId; 
SELECT p.Id, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = 61217; 
SELECT p.Score, pl.LinkTypeId  FROM posts p  LEFT JOIN postLinks pl ON p.Id = pl.PostId  WHERE p.Id = 395;
SELECT p.Id AS PostID, p.OwnerUserId AS UserID FROM posts p WHERE p.Score > 60; 
SELECT SUM(FavoriteCount) AS TotalFavourites FROM posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011; 
SELECT      AVG(u.UpVotes) AS AvgUpVotes,      AVG(u.Age) AS AvgAge FROM      users u JOIN      posts p ON u.Id = p.OwnerUserId GROUP BY      u.Id HAVING      COUNT(p.Id) > 10; 
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'; 
SELECT COUNT(*)  FROM comments  WHERE Score > 60; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'; 
SELECT COUNT(Id) FROM posts WHERE Score = 10
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'
SELECT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'; 
SELECT      (COUNT(CASE WHEN b.Name = 'Teacher' THEN b.UserId END) / CAST(COUNT(DISTINCT u.Id) AS FLOAT)) * 100 AS Percentage FROM      users u LEFT JOIN      badges b ON u.Id = b.UserId; 
SELECT      (COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) / COUNT(b.UserId::float)) * 100 AS percentage FROM      badges b LEFT JOIN      users u ON b.UserId = u.Id WHERE      b.Name = 'Organizer'; 
SELECT Score  FROM comments  WHERE CreationDate = '2010-07-19 19:19:56.0'; 
SELECT Text  FROM comments  WHERE CreationDate = '2010-07-19 19:37:33.0'; 
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria'; 
SELECT COUNT(b.UserId)  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65; 
SELECT SUM(u.Views) AS TotalViews FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'; 
SELECT DISTINCT Name  FROM badges  WHERE UserId IN (     SELECT UserId      FROM users      WHERE Reputation = (         SELECT MIN(Reputation)          FROM users     ) ) 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'
SELECT COUNT(*)  FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65; 
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY'
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS vote_ratio FROM votes 
SELECT T3.TagName  FROM users AS T1  JOIN posts AS T2 ON T1.Id = T2.OwnerUserId  JOIN postTags AS T3 ON T2.Id = T3.PostId  WHERE T1.DisplayName = 'John Salvatier'; 
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')
SELECT COUNT(*)  FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan'; 
SELECT Id  FROM posts  WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'slashnick')  ORDER BY AnswerCount DESC  LIMIT 1; 
SELECT p.OwnerUserId, u.DisplayName, SUM(p.ViewCount) AS TotalViews FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.OwnerUserId, u.DisplayName ORDER BY TotalViews DESC LIMIT 1; 
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Matt Parker' AND p.Id > 4; 
SELECT COUNT(c.Id)  FROM comments c  JOIN posts p ON c.PostId = p.Id  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60; 
SELECT T3.Tags  FROM users AS T1  JOIN posts AS T2 ON T1.Id = T2.OwnerUserId  JOIN posts AS T3 ON T2.Id = T3.Id  WHERE T1.DisplayName = 'Mark Meckes' AND T3.CommentCount = 0; 
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Organizer'; 
SELECT CAST(SUM(CASE WHEN Tags LIKE '%<r>%' THEN 1 ELSE 0 END) AS REAL) / COUNT(Id) * 100 AS percentage FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Community') 
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id; 
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014; 
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'; 
SELECT U.DisplayName, U.Age  FROM users U  JOIN posts P ON U.Id = P.OwnerUserId  WHERE P.Views = (SELECT MAX(Views) FROM posts)
SELECT LastEditDate, LastEditorUserId  FROM posts  WHERE Title = 'Detecting a given face in a database of facial images'; 
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60;
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE YEAR(b.Date) = 2011 AND u.Location = 'North Pole' 
SELECT u.DisplayName, u.WebsiteUrl  FROM users u  JOIN posts p ON u.Id = p.OwnerUserId  WHERE p.FavoriteCount > 150;
SELECT p.Title, COUNT(ph.Id) AS PostHistoryCounts, MAX(ph.CreationDate) AS LastEditDate FROM posts p LEFT JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY p.Title; 
SELECT u.LastAccessDate, u.Location FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'; 
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time')
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId WHERE p.OwnerUserId IN (     SELECT Id FROM users WHERE DisplayName = 'Samuel' ) AND YEAR(p.CreationDate) = 2013 AND YEAR(b.Date) = 2013 
SELECT OwnerDisplayName FROM posts WHERE ViewCount = (SELECT MAX(ViewCount) FROM posts)
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing'; 
SELECT p.Title, pl.LinkTypeId FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = (SELECT Id FROM posts WHERE Title = 'What are principal component scores?'); 
SELECT p2.OwnerDisplayName FROM posts p1 JOIN posts p2 ON p1.ParentId = p2.Id WHERE p1.ParentId IS NOT NULL ORDER BY p1.Score DESC LIMIT 1; 
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN votes v ON u.Id = v.UserId WHERE v.VoteTypeId = 8 AND v.BountyAmount = (     SELECT MAX(BountyAmount)     FROM votes     WHERE VoteTypeId = 8 ) 
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1; 
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(DISTINCT p.Id) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND v.BountyAmount = 50; 
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)
SELECT SUM(Score) FROM posts WHERE LastActivityDate LIKE '2010-07-19%'
SELECT COUNT(pl.Id) / 12.0 AS avg_monthly_links FROM postLinks pl JOIN posts p ON pl.PostId = p.Id WHERE YEAR(pl.CreationDate) = 2010 AND p.AnswerCount <= 2; 
SELECT Id  FROM posts  WHERE Id IN (     SELECT PostId      FROM votes      WHERE UserId = 1465 )  ORDER BY FavoriteCount DESC  LIMIT 1; 
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks) 
SELECT U.DisplayName  FROM users U  JOIN (     SELECT UserId, COUNT(Name) AS BadgeCount      FROM badges      GROUP BY UserId      ORDER BY BadgeCount DESC      LIMIT 1 ) B ON U.Id = B.UserId
SELECT MIN(v.CreationDate)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.DisplayName = 'chl'; 
SELECT MIN(p.CreationDate) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users WHERE Age IS NOT NULL)
SELECT u.DisplayName  FROM users u  JOIN badges b ON u.Id = b.UserId  WHERE b.Name = 'Autobiographer'  ORDER BY b.Date ASC  LIMIT 1; 
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4; 
SELECT AVG(v.PostId)  FROM votes v  JOIN users u ON v.UserId = u.Id  WHERE u.Age = (SELECT MAX(Age) FROM users) 
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*)  FROM users  WHERE Reputation > 2000 AND Views > 1000; 
SELECT DisplayName  FROM users  WHERE Age BETWEEN 19 AND 65; 
SELECT COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Jay Stevens' AND YEAR(p.CreationDate) = 2010; 
SELECT p.Id, p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Harvey Motulsky'  ORDER BY p.ViewCount DESC  LIMIT 1; 
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1; 
SELECT AVG(Score) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Stephen Turner')
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011; 
SELECT p.Id, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1; 
SELECT      (COUNT(CASE WHEN u.Reputation > 1000 AND strftime('%Y', p.CreationDate) = '2011' THEN p.Id END) * 1.0 / COUNT(p.Id)) * 100 AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id; 
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) AS percentage FROM users; 
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Computer Game Datasets'; 
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)
SELECT COUNT(*)  FROM posts  WHERE ViewCount > 35000 AND CommentCount = 0; 
SELECT u.DisplayName, u.Location FROM users u JOIN posts p ON u.Id = p.LastEditorUserId WHERE p.Id = 183 AND p.LastEditDate = (     SELECT MAX(LastEditDate)      FROM posts      WHERE Id = 183 ) 
SELECT Name  FROM badges  JOIN users ON badges.UserId = users.Id  WHERE users.DisplayName = 'Emmett'  ORDER BY Date DESC  LIMIT 1; 
SELECT COUNT(*)  FROM users  WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000; 
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon'; 
SELECT COUNT(p.Id) AS PostCount, COALESCE(SUM(c.CommentCount), 0) AS CommentCount FROM users u LEFT JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN (     SELECT UserId, COUNT(Id) AS CommentCount     FROM comments     GROUP BY UserId ) c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users) GROUP BY u.Id; 
SELECT c.Text, c.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10; 
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(p.Id)  FROM posts p  JOIN postTags pt ON p.Id = pt.PostId  JOIN tags t ON pt.TagId = t.Id  WHERE t.TagName = 'careers'; 
SELECT u.Reputation, p.ViewCount  FROM users u  LEFT JOIN posts p ON u.Id = p.OwnerUserId  WHERE u.DisplayName = 'Jarrod Dixon'
SELECT COUNT(c.Id) AS CommentCount, COUNT(a.Id) AS AnswerCount FROM posts p LEFT JOIN comments c ON p.Id = c.PostId LEFT JOIN posts a ON p.Id = a.ParentId WHERE p.Title = 'Clustering 1D data'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'; 
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >= 30
SELECT      CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) AS Percentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.Reputation = (SELECT MAX(Reputation) FROM users) 
SELECT COUNT(*) FROM posts WHERE Score < 20
SELECT COUNT(*)  FROM tags  WHERE Id < 15 AND Count <= 20
SELECT ExcerptPostId, WikiPostId  FROM tags  WHERE TagName = 'sample'; 
SELECT u.Reputation, u.UpVotes  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text = 'fine, you win :)' 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1; 
SELECT c.CreationDate, u.Age FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.UserDisplayName IS NOT NULL AND c.UserDisplayName LIKE '%http://%'; 
SELECT COUNT(DISTINCT c.PostId)  FROM comments c  JOIN posts p ON c.PostId = p.Id  WHERE c.Score = 0 AND p.ViewCount < 5; 
SELECT COUNT(*)  FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0; 
SELECT COUNT(DISTINCT c.UserId)  FROM comments c  JOIN users u ON c.UserId = u.Id  WHERE c.Score = 0 AND u.Age = 40
SELECT c.PostId, c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Group differences on a five point Likert item'; 
SELECT COUNT(v.Id) AS UpVoteNumber FROM votes v JOIN comments c ON v.UserId = c.UserId WHERE c.Text = 'R is also lazy evaluated.'; 
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky'; 
SELECT c.UserDisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0; 
SELECT      (COUNT(CASE WHEN u.UpVotes = 0 THEN c.UserId END) * 100.0 / COUNT(c.UserId)) AS Percentage FROM      comments c JOIN      users u ON c.UserId = u.Id WHERE      c.Score BETWEEN 5 AND 10; 
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = '3-D Man'
SELECT COUNT(DISTINCT hero_id)  FROM hero_power HP  JOIN superpower SP ON HP.power_id = SP.id  WHERE SP.power_name = 'Super Strength'
SELECT COUNT(s.id)  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200; 
SELECT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.id, s.full_name HAVING COUNT(hp.power_id) > 15; 
SELECT COUNT(*) FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue'
SELECT c.colour  FROM superhero s  JOIN colour c ON s.skin_colour_id = c.id  WHERE s.superhero_name = 'Apocalypse'
SELECT COUNT(DISTINCT s.id)  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE c.colour = 'Blue' AND sp.power_name = 'Agility'; 
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON s.eye_colour_id = e.id  JOIN colour h ON s.hair_colour_id = h.id  WHERE e.colour = 'Blue' AND h.colour = 'Blond'
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT s.superhero_name, s.height_cm FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC; 
SELECT p.publisher_name  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  WHERE s.superhero_name = 'Sauron'; 
SELECT c.colour, COUNT(s.id) AS popularity FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY popularity DESC; 
SELECT AVG(height_cm)  FROM superhero  WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics'
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1; 
SELECT COUNT(*)  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN publisher p ON s.publisher_id = p.id  WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics'; 
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond')
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Intelligence'  ORDER BY ha.attribute_value ASC  LIMIT 1;
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'Copycat'
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  JOIN superpower sp ON hp.power_id = sp.id  WHERE sp.power_name = 'Death Touch'; 
SELECT COUNT(*)  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Female')  AND a.attribute_name = 'Strength'  AND ha.attribute_value = 100
SELECT s.superhero_name  FROM superhero s  JOIN hero_power hp ON s.id = hp.hero_id  GROUP BY s.id, s.superhero_name  ORDER BY COUNT(hp.power_id) DESC  LIMIT 1; 
SELECT COUNT(*) FROM superhero s JOIN race r ON s.race_id = r.id WHERE r.race = 'Vampire'
SELECT      (COUNT(CASE WHEN s.alignment_id = 2 THEN s.id END) * 100.0 / COUNT(s.id)) AS percentage_bad_alignment,     SUM(CASE WHEN p.publisher_name = 'Marvel Comics' AND s.alignment_id = 2 THEN 1 ELSE 0 END) AS marvel_comics_count FROM superhero s JOIN alignment a ON s.alignment_id = a.id LEFT JOIN publisher p ON s.publisher_id = p.id; 
SELECT      (SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -       SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name IN ('Marvel Comics', 'DC Comics') 
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'; 
SELECT AVG(attribute_value) FROM hero_attribute
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.id = 75
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = 'Deathlok'; 
SELECT AVG(weight_kg) FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female')
SELECT p.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Male') GROUP BY p.power_name LIMIT 5; 
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.height_cm BETWEEN 170 AND 190 AND c.colour = 'No Colour'; 
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56
SELECT full_name  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God')  LIMIT 5; 
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.weight_kg = 169; 
SELECT c.colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE s.height_cm = 185 AND r.race = 'Human'; 
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)
SELECT      COUNT(CASE WHEN s.publisher_id = 13 THEN 1 END) * 100.0 / COUNT(s.id) AS percentage FROM      superhero s WHERE      s.height_cm BETWEEN 150 AND 180; 
SELECT superhero_name  FROM superhero  WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero) 
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 1; 
SELECT ha.attribute_value  FROM superhero sh  JOIN hero_attribute ha ON sh.id = ha.hero_id  WHERE sh.superhero_name = 'Abomination'; 
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id WHERE hp.hero_id = 1
SELECT COUNT(DISTINCT hero_id) FROM hero_power WHERE power_id = (SELECT id FROM superpower WHERE power_name = 'stealth')
SELECT s.full_name  FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1; 
SELECT AVG(skin_colour_id = 1) AS average FROM superhero WHERE skin_colour_id = 1; 
SELECT COUNT(*) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics'
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1; 
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Abraham Sapien';
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight'; 
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id JOIN colour c3 ON s.skin_colour_id = c3.id JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics'; 
SELECT s.superhero_name, p.publisher_name  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.eye_colour_id AND s.hair_colour_id = s.skin_colour_id; 
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb'
SELECT      ROUND(COUNT(CASE WHEN c.colour = 'Blue' THEN 1 END) * 100.0 / COUNT(s.gender_id), 2) AS percentage FROM      superhero s JOIN      gender g ON s.gender_id = g.id LEFT JOIN      colour c ON s.skin_colour_id = c.id WHERE      g.gender = 'Female'; 
SELECT superhero_name, race FROM superhero JOIN race ON superhero.race_id = race.id WHERE full_name = 'Charles Chandler'
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id WHERE s.superhero_name = 'Agent 13'
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Adaptation'; 
SELECT COUNT(DISTINCT power_id)  FROM hero_power  WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo'); 
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.full_name = 'Hunter Zolomon'; 
SELECT s.height_cm  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE c.colour = 'Amber'; 
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON s.eye_colour_id = e.id  JOIN colour h ON s.hair_colour_id = h.id  WHERE e.colour = 'Black' AND h.colour = 'Black'
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  JOIN colour sc ON s.skin_colour_id = sc.id  WHERE sc.colour = 'Gold'
SELECT full_name  FROM superhero  JOIN race ON superhero.race_id = race.id  WHERE race.race = 'Vampire'; 
SELECT s.superhero_name  FROM superhero s  JOIN alignment a ON s.alignment_id = a.id  WHERE a.alignment = 'Neutral'
SELECT COUNT(DISTINCT ha.hero_id)  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (     SELECT MAX(attribute_value)      FROM hero_attribute      WHERE attribute_id = (         SELECT id FROM attribute WHERE attribute_name = 'Strength'     ) )
SELECT r.race, a.alignment  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN alignment a ON s.alignment_id = a.id  WHERE s.superhero_name = 'Cameron Hicks'; 
SELECT      ROUND(COUNT(CASE WHEN s.gender_id = 2 THEN 1 END) * 100.0 / COUNT(s.id), 2) AS percentage FROM      superhero s JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics'; 
SELECT AVG(weight_kg) FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Alien')
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference; 
SELECT AVG(height_cm) FROM superhero
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = 'Abomination'
SELECT COUNT(*)  FROM superhero  WHERE race_id = 21 AND gender_id = 1
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Speed'  ORDER BY ha.attribute_value DESC  LIMIT 1; 
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT a.attribute_name, ha.attribute_value FROM attribute a JOIN hero_attribute ha ON a.id = ha.attribute_id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = '3-D Man'; 
SELECT s.superhero_name  FROM superhero s  JOIN colour e ON s.eye_colour_id = e.id  JOIN colour h ON s.hair_colour_id = h.id  WHERE e.colour = 'Blue' AND h.colour = 'Brown'; 
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy'); 
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT      ROUND((COUNT(CASE WHEN s.eye_colour_id = 7 THEN s.superhero_name END) / COUNT(s.superhero_name)) * 100.0, 2) AS percentage_blue_eyes FROM      superhero s; 
SELECT      SUM(CASE WHEN s.gender_id = 1 THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero s; 
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT id FROM superpower WHERE power_name = 'cryokinesis'; 
SELECT superhero_name FROM superhero WHERE id = 294; 
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0;
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.full_name = 'Karen Beecher-Duncan'; 
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.full_name = 'Helen Parr'; 
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 108 AND s.height_cm = 188
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id WHERE s.id = 38;
SELECT s.race FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)
SELECT a.alignment, p.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id LEFT JOIN hero_power hp ON s.id = hp.hero_id LEFT JOIN superpower p ON hp.power_id = p.id WHERE s.superhero_name = 'Atom IV'; 
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;
SELECT AVG(t2.attribute_value)  FROM superhero AS t1  JOIN hero_attribute AS t2 ON t1.id = t2.hero_id  WHERE t1.alignment_id = 3
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value = 100; 
SELECT COUNT(*)  FROM superhero s  JOIN gender g ON s.gender_id = g.id  JOIN alignment a ON s.alignment_id = a.id  WHERE g.id = 2 AND a.id = 1
SELECT s.superhero_name  FROM superhero s  JOIN hero_attribute ha ON s.id = ha.hero_id  WHERE ha.attribute_value BETWEEN 75 AND 80; 
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id JOIN colour c ON s.hair_colour_id = c.id JOIN gender g ON s.gender_id = g.id WHERE c.colour = 'Blue' AND g.gender = 'Male'; 
SELECT      ROUND((SUM(CASE WHEN s.gender_id = 2 THEN 1 ELSE 0 END) / COUNT(s.alignment_id)) * 100.0, 2) AS percentage_female FROM      superhero s WHERE      s.alignment_id = 2; 
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0 
SELECT ha.attribute_value  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_id = a.id  JOIN superhero s ON ha.hero_id = s.id  WHERE a.attribute_name = 'Strength' AND s.superhero_name = 'Hulk'
SELECT sp.power_name  FROM superpower sp  JOIN hero_power hp ON sp.id = hp.power_id  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = 'Ajax'
SELECT COUNT(*)  FROM superhero s  JOIN alignment a ON s.alignment_id = a.id  JOIN colour c ON s.skin_colour_id = c.id  WHERE a.alignment = 'Bad' AND c.colour = 'Green'
SELECT COUNT(*)  FROM superhero s  JOIN publisher p ON s.publisher_id = p.id  JOIN gender g ON s.gender_id = g.id  WHERE p.publisher_name = 'Marvel Comics' AND g.gender = 'Female'
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name; 
SELECT g.gender FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force'; 
SELECT s.superhero_name  FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1; 
SELECT AVG(s.height_cm)  FROM superhero s  JOIN race r ON s.race_id = r.id  JOIN publisher p ON s.publisher_id = p.id  WHERE r.race <> 'Human' AND p.publisher_name = 'Dark Horse Comics' 
SELECT COUNT(*)  FROM superhero h  JOIN hero_attribute ha ON h.id = ha.hero_id  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100; 
SELECT      (SUM(CASE WHEN p.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -       SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero s JOIN publisher p ON s.publisher_id = p.id; 
SELECT a.attribute_name  FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Black Panther' ORDER BY ha.attribute_value ASC LIMIT 1; 
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'; 
SELECT      CASE          WHEN COUNT(s.id) = 0 THEN 0         ELSE CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id)     END AS female_percentage FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'George Lucas'; 
SELECT      ROUND((SUM(CASE WHEN a.alignment = 'Good' THEN 1 ELSE 0 END) / COUNT(s.id)) * 100.0, 2) AS good_percentage FROM      superhero s JOIN      alignment a ON s.alignment_id = a.id JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name = 'Marvel Comics'; 
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown'; 
SELECT ha.attribute_value  FROM superhero sh  JOIN hero_attribute ha ON sh.id = ha.hero_id  WHERE sh.superhero_name = 'Aquababy'
SELECT s.weight_kg, r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.id = 40; 
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = 3
SELECT h.id FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence'; 
SELECT c.colour  FROM superhero s  JOIN colour c ON s.eye_colour_id = c.id  WHERE s.superhero_name = 'Blackwulf'; 
SELECT sp.power_name FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero) 
SELECT d.driverRef FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 20 AND q.q1 IN (     SELECT MAX(q1)     FROM qualifying     WHERE raceId = 20     LIMIT 5 ) 
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 IS NOT NULL ORDER BY q.q2 ASC LIMIT 1; 
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai'; 
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya'; 
SELECT r.name  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.country = 'Germany'; 
SELECT c.position  FROM circuits c JOIN constructors con ON c.circuitId = con.constructorId WHERE con.name = 'Renault'; 
SELECT COUNT(*)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2010 AND c.country NOT IN ('Malaysia', 'Spain', 'Turkey')
SELECT r.name FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.country = 'Spain'
SELECT c.lat, c.lng  FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix'
SELECT r.url  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Sepang International Circuit'; 
SELECT r.time FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.name = 'Sepang International Circuit'
SELECT c.lat, c.lng  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Abu Dhabi Grand Prix'; 
SELECT c.nationality FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 24 AND cr.points = 1; 
SELECT q1  FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354; 
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 355 AND q.q2 = '0:01:40'; 
SELECT T1.number FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 903 AND T2.q3 LIKE '0:01:54' 
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Bahrain Grand Prix' AND ra.year = 2007 AND r.time IS NULL; 
SELECT s.url FROM seasons s JOIN races r ON s.year = r.year WHERE r.raceId = 901; 
SELECT COUNT(DISTINCT driverId)  FROM results  WHERE raceId IN (     SELECT raceId      FROM races      WHERE date = '2015-11-29' AND time IS NOT NULL ) 
SELECT d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob ASC LIMIT 1; 
SELECT d.url FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 161 AND lt.time LIKE '1:27.%'; 
SELECT D.nationality FROM results R JOIN drivers D ON R.driverId = D.driverId WHERE R.raceId = 933 AND R.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results     WHERE raceId = 933 ) 
SELECT c.lat, c.lng  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.name = 'Malaysian Grand Prix'; 
SELECT T3.url  FROM constructorResults AS T1  JOIN constructors AS T3 ON T1.constructorId = T3.constructorId  WHERE T1.raceId = 9  ORDER BY T1.points DESC  LIMIT 1 
SELECT q1 FROM qualifying WHERE raceId = 345 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '01:15' 
SELECT d.code FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 45 AND q.q3 LIKE '0:01:33'; 
SELECT time FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE surname = 'McLaren') AND raceId = 743; 
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'San Marino Grand Prix' AND ra.year = 2006 AND r.position = 2; 
SELECT s.url  FROM seasons s  JOIN races r ON s.year = r.year  WHERE r.raceId = 901; 
SELECT COUNT(*)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29' AND r.time IS NOT NULL AND r.statusId != 1; 
SELECT d.driverId, d.forename, d.surname, d.dob FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1; 
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.raceId = 348 AND lt.time = (     SELECT MIN(time)      FROM lapTimes      WHERE raceId = 348 ) 
SELECT d.nationality FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results ) 
SELECT      ((T1.fastestLapSpeed - T2.fastestLapSpeed) / T1.fastestLapSpeed) * 100 AS percent_faster FROM      results AS T1 JOIN      results AS T2  ON      T1.driverId = T2.driverId WHERE      T1.raceId = 853 AND T2.raceId = 854 AND T1.driverId = (         SELECT              driverId          FROM              drivers          WHERE              forename = 'Paul' AND surname = 'di Resta'     ); 
SELECT      COUNT(CASE WHEN r.time IS NOT NULL THEN r.driverId END) * 1.0 / COUNT(r.driverId) AS completion_rate FROM      results r JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.date = '1983-07-16'; 
SELECT MIN(year)  FROM races  WHERE name = 'Singapore Grand Prix'; 
SELECT COUNT(name) AS race_count, name FROM races WHERE year = 2005 ORDER BY name DESC
SELECT name  FROM races  WHERE YEAR(date) = (SELECT YEAR(min(date)) FROM races)  AND MONTH(date) = (SELECT MONTH(min(date)) FROM races); 
SELECT r.name, r.date FROM races r WHERE r.year = 1999 ORDER BY r.round DESC LIMIT 1; 
SELECT year FROM races GROUP BY year ORDER BY MAX(round) DESC LIMIT 1;
SELECT name  FROM races  WHERE year = 2017 AND name NOT IN (SELECT name FROM races WHERE year = 2000) 
SELECT c.name AS circuit_name, c.location, c.country  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Spanish Grand Prix' AND r.year = (     SELECT MIN(year)      FROM races      WHERE name = 'Spanish Grand Prix' ); 
SELECT MAX(r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Brands Hatch' AND r.name = 'British Grand Prix'; 
SELECT COUNT(DISTINCT r.year)  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE c.name = 'Silverstone Circuit' AND r.name = 'British Grand Prix'; 
SELECT d.forename, d.surname FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Singapore Grand Prix' AND ra.year = 2010 ORDER BY r.position; 
SELECT d.forename, d.surname, MAX(ds.points) AS points FROM driverStandings ds JOIN drivers d ON ds.driverId = d.driverId GROUP BY d.driverId ORDER BY points DESC LIMIT 1; 
SELECT d.forename, d.surname, ds.points  FROM driverstandings ds  JOIN drivers d ON ds.driverid = d.driverid  JOIN races r ON ds.raceid = r.raceid  WHERE r.name = 'Chinese Grand Prix' AND r.year = 2017  ORDER BY ds.points DESC  LIMIT 3
SELECT d.forename, d.surname, r.name FROM lapTimes lt JOIN drivers d ON lt.driverId = d.driverId JOIN races r ON lt.raceId = r.raceId WHERE lt.milliseconds = (     SELECT MIN(milliseconds) FROM lapTimes ) 
SELECT AVG(lapTimes.milliseconds) AS avg_lap_time FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId JOIN races ON lapTimes.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix'; 
SELECT CAST(SUM(CASE WHEN r.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(r.raceId) AS percentage FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.surname = 'Hamilton' AND ra.year >= 2010; 
SELECT d.forename, d.surname, d.nationality, MAX(ds.points) AS max_points FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.driverId ORDER BY SUM(ds.wins) DESC LIMIT 1; 
SELECT forename, surname, DATE_FORMAT(CURDATE(), '%Y') - DATE_FORMAT(dob, '%Y') AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1; 
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.name HAVING COUNT(r.raceId) = 4; 
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006; 
SELECT r.name, c.name AS circuit_name, c.location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE strftime('%Y-%m', r.date) = '2005-09'; 
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename || ' ' || d.surname = 'Alex Yoong' AND res.position < 20; 
SELECT COUNT(*)  FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher'  AND c.name = 'Sepang International Circuit'  AND r.points = (     SELECT MAX(points)      FROM results      WHERE raceId = r.raceId ) 
SELECT r.name AS race, r.year AS year FROM results res JOIN races r ON res.raceId = r.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY res.fastestLapTime ASC LIMIT 1; 
SELECT AVG(rs.points)  FROM results rs  JOIN races r ON rs.raceId = r.raceId  JOIN drivers d ON rs.driverId = d.driverId  WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND r.year = 2000; 
SELECT r.name AS race_name, res.points AS points FROM results res JOIN races r ON res.raceId = r.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.year ASC, r.round ASC LIMIT 1; 
SELECT r.name, c.country  FROM races r  JOIN circuits c ON r.circuitId = c.circuitId  WHERE r.year = 2017  ORDER BY r.date; 
SELECT r.name, r.year, c.location  FROM races r  JOIN results res ON r.raceId = res.raceId  JOIN circuits c ON r.circuitId = c.circuitId  WHERE res.laps = (SELECT MAX(laps) FROM results);
SELECT      (COUNT(CASE WHEN c.country = 'Germany' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      races r JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.name = 'European Grand Prix'; 
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'; 
SELECT name, lat FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1; 
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'; 
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT nationality FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers) 
SELECT surname FROM drivers WHERE nationality = 'Italian'; 
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'; 
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT c.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009
SELECT DISTINCT r.year  FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit'; 
SELECT r.url FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Silverstone Circuit'; 
SELECT r.time FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Abu Dhabi Circuit' AND r.year BETWEEN 2010 AND 2019
SELECT COUNT(*) FROM races AS R JOIN circuits AS C ON R.circuitId = C.circuitId WHERE C.country = 'Italy'
SELECT DISTINCT r.date FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Circuit de Barcelona-Catalunya'; 
SELECT c.url  FROM circuits c  JOIN races r ON c.circuitId = r.circuitId  WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009;
SELECT MIN(fastestLapTime) AS fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  ORDER BY r.fastestLapSpeed DESC  LIMIT 1;
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 AND r.position = 1; 
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'; 
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1; 
SELECT MAX(T2.fastestLapSpeed) AS max_speed  FROM races AS T1  JOIN results AS T2  ON T1.raceId = T2.raceId  WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009; 
SELECT DISTINCT s.year  FROM seasons s  JOIN races r ON s.year = r.year  JOIN results res ON r.raceId = res.raceId  JOIN drivers d ON res.driverId = d.driverId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT r.positionOrder FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Chinese Grand Prix' AND ra.year = 2008; 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4; 
SELECT COUNT(DISTINCT r.driverId)  FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.time IS NOT NULL; 
SELECT fastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND results.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)
SELECT r.time FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.position = 2; 
SELECT d.forename, d.surname, d.url  FROM results r  JOIN drivers d ON r.driverId = d.driverId  JOIN races ra ON r.raceId = ra.raceId  WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.position = 1; 
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND d.nationality = 'British'; 
SELECT COUNT(DISTINCT r.driverId) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2008 AND r.time IS NOT NULL; 
SELECT SUM(points) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT AVG(strftime('%s', fastestLapTime)) AS average_fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT CAST(SUM(CASE WHEN r.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(r.raceId) AS rate FROM races ra JOIN results r ON ra.raceId = r.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix'; 
SELECT      ((STRFTIME('%s', last_driver_time) - STRFTIME('%s', champion_time)) / STRFTIME('%s', last_driver_time)) * 100 AS percentage_faster FROM     (SELECT          MIN(time) AS champion_time,         MAX(time) AS last_driver_time      FROM results r      JOIN races ra ON r.raceId = ra.raceId      WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.time IS NOT NULL) 
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'
SELECT lat, lng  FROM circuits  WHERE country = 'USA'; 
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) > 1980
SELECT MAX(points)  FROM constructorStandings  JOIN constructors ON constructorStandings.constructorId = constructors.constructorId  WHERE constructors.nationality = 'British'; 
SELECT c.name  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  ORDER BY cs.points DESC  LIMIT 1
SELECT c.name FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 291 AND cr.points = 0; 
SELECT COUNT(DISTINCT c.constructorId) FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Japanese' AND cr.points = 0 GROUP BY c.constructorId HAVING COUNT(cr.raceId) = 2; 
SELECT DISTINCT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1
SELECT COUNT(DISTINCT c.constructorId) FROM constructors c JOIN results r ON c.constructorId = r.constructorId JOIN lapTimes lt ON r.raceId = lt.raceId AND r.driverId = lt.driverId WHERE c.nationality = 'French' AND lt.lap > 50; 
SELECT      (COUNT(CASE WHEN r.time IS NOT NULL THEN d.driverId END) * 100.0 / COUNT(d.driverId)) AS completion_percentage FROM      drivers d JOIN      results r ON d.driverId = r.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      d.nationality = 'Japanese' AND ra.year BETWEEN 2007 AND 2009; 
SELECT r.year, AVG(strftime('%s', r.time)) AS avg_time_seconds FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.position = 1 AND r.year < 1975 AND r.time IS NOT NULL GROUP BY r.year; 
SELECT forename, surname  FROM drivers  WHERE dob > '1975-12-31' AND driverId IN (     SELECT driverId      FROM results      WHERE rank = 2 ) 
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.time IS NULL; 
SELECT d.forename, d.surname  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE r.fastestLapTime = (     SELECT MIN(fastestLapTime)      FROM results      WHERE fastestLapTime IS NOT NULL )
SELECT fastestLap FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2009 AND position = 1; 
SELECT AVG(CAST(REPLACE(SUBSTR(T3.fastestLapSpeed, 1, LENGTH(T3.fastestLapSpeed) - 3), ',', '.') AS REAL))  FROM races AS T1  JOIN results AS T3 ON T1.raceId = T3.raceId  WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009; 
SELECT r.name, r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  WHERE res.milliseconds IS NOT NULL  ORDER BY res.milliseconds ASC  LIMIT 1; 
SELECT      (COUNT(CASE WHEN d.dob < '1985-01-01' AND r.laps > 50 THEN r.driverId END) /       COUNT(CASE WHEN r.year BETWEEN 2000 AND 2005 THEN r.driverId END)) * 100 AS percentage FROM      drivers d JOIN      results r ON d.driverId = r.driverId WHERE      r.year BETWEEN 2000 AND 2005; 
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND lt.milliseconds < 120000; 
SELECT code FROM drivers WHERE nationality = 'American'; 
SELECT raceId FROM races WHERE year = 2009
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18
SELECT d.code, COUNT(*) AS netherlands_count FROM drivers d LEFT JOIN (     SELECT driverId     FROM drivers     ORDER BY dob DESC     LIMIT 3 ) t ON d.driverId = t.driverId WHERE d.nationality = 'Dutch' GROUP BY d.code; 
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'; 
SELECT COUNT(*)  FROM drivers  WHERE nationality = 'British' AND YEAR(dob) = 1980; 
SELECT d.driverId, d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'German' AND YEAR(d.dob) BETWEEN 1980 AND 1990 GROUP BY d.driverId, d.forename, d.surname ORDER BY earliest_lap_time LIMIT 3; 
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1; 
SELECT d.driverId, d.code FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE YEAR(d.dob) = 1971 AND r.fastestLapTime IS NOT NULL; 
SELECT d.driverId, d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Spanish' AND YEAR(d.dob) < 1982 GROUP BY d.driverId, d.forename, d.surname ORDER BY latest_lap_time DESC LIMIT 10; 
SELECT r.year  FROM races r  JOIN results res ON r.raceId = res.raceId  ORDER BY res.fastestLapTime  LIMIT 1; 
SELECT r.year  FROM races r  JOIN lapTimes lt ON r.raceId = lt.raceId  ORDER BY lt.time DESC  LIMIT 1; 
SELECT driverId  FROM lapTimes  WHERE raceId = 1 AND lap = 1  ORDER BY time ASC  LIMIT 5; 
SELECT COUNT(*)  FROM results  WHERE raceId BETWEEN 50 AND 100    AND statusId = 2    AND time IS NOT NULL; 
SELECT location, lat, lng  FROM circuits  WHERE country = 'Austria'; 
SELECT raceId, COUNT(*) AS finisher_count FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY finisher_count DESC LIMIT 1; 
SELECT d.driverRef, d.nationality, d.dob FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 23 AND q.q2 IS NOT NULL; 
SELECT s.year, r.name, r.date, r.time FROM seasons s JOIN races r ON s.year = r.year JOIN qualifying q ON r.raceId = q.raceId JOIN drivers d ON q.driverId = d.driverId WHERE d.driverId = (     SELECT driverId     FROM drivers     ORDER BY dob DESC     LIMIT 1 ) ORDER BY r.date LIMIT 1; 
SELECT COUNT(DISTINCT d.driverId) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture'; 
SELECT c.url  FROM constructors c  JOIN constructorStandings cs ON c.constructorId = cs.constructorId  WHERE c.nationality = 'Italian'  ORDER BY cs.points DESC  LIMIT 1; 
SELECT c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId GROUP BY c.constructorId, c.url ORDER BY SUM(cs.wins) DESC LIMIT 1; 
SELECT d.driverId, d.forename, d.surname, lt.time FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId JOIN races r ON lt.raceId = r.raceId WHERE r.name = 'French Grand Prix' AND lt.lap = 3 ORDER BY lt.time DESC LIMIT 1; 
SELECT T1.raceId, MIN(T1.time), T1.milliseconds  FROM lapTimes AS T1  JOIN races AS T2 ON T1.raceId = T2.raceId  WHERE T1.lap = 1  GROUP BY T1.raceId
SELECT AVG(strftime('%s', fastestLapTime)) AS avg_fastest_lap_time FROM results WHERE raceId = (     SELECT raceId     FROM races     WHERE year = 2006 AND name = 'United States Grand Prix' ) AND rank < 11; 
SELECT d.forename, d.surname, AVG(p.duration) AS avg_pit_stop_duration FROM drivers d JOIN pitStops p ON d.driverId = p.driverId WHERE d.nationality = 'German' AND d.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY d.driverId ORDER BY avg_pit_stop_duration LIMIT 3; 
SELECT r.driverId, d.forename, d.surname, r.time FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 AND r.position = 1; 
SELECT c.constructorRef, c.url FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2009 ORDER BY cr.points DESC LIMIT 1; 
SELECT forename, surname, dob  FROM drivers  WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991; 
SELECT forename || ' ' || surname AS fullName, url AS wikipediaPage, dob FROM drivers WHERE nationality = 'German' AND YEAR(dob) BETWEEN 1971 AND 1985 ORDER BY dob DESC; 
SELECT location, country, lat, lng  FROM circuits  WHERE name = 'Hungaroring'; 
SELECT c.points AS score, co.name, co.nationality FROM constructorResults c JOIN races r ON c.raceId = r.raceId JOIN circuits ci ON r.circuitId = ci.circuitId JOIN constructors co ON c.constructorId = co.constructorId WHERE ci.name = 'Circuit de Monaco' AND r.year BETWEEN 1980 AND 2010 ORDER BY c.points DESC LIMIT 1; 
SELECT AVG(rs.points)  FROM results rs  JOIN races r ON rs.raceId = r.raceId  JOIN drivers d ON rs.driverId = d.driverId  WHERE r.name = 'Turkish Grand Prix' AND d.forename = 'Lewis' AND d.surname = 'Hamilton'; 
SELECT AVG(race_count) AS avg_races_per_year FROM (     SELECT year, COUNT(*) AS race_count     FROM races     WHERE date BETWEEN '2000-01-01' AND '2010-12-31'     GROUP BY year ) AS yearly_races; 
SELECT nationality, COUNT(*) AS count FROM drivers GROUP BY nationality ORDER BY count DESC LIMIT 1; 
SELECT wins FROM driverStandings WHERE points = 91; 
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId ORDER BY res.fastestLapTime LIMIT 1; 
SELECT c.name AS racetrack, c.location || ', ' || c.country AS full_location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.date = (SELECT MAX(date) FROM races) 
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Marina Bay Street Circuit' AND r.year = 2008 AND q.position = 1 ORDER BY q.q3 ASC LIMIT 1; 
SELECT d.forename || ' ' || d.surname AS fullName, d.nationality, r.name AS firstRaceName FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.dob = (SELECT MAX(dob) FROM drivers) ORDER BY r.date ASC LIMIT 1; 
SELECT COUNT(*) AS accident_count FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND r.statusId = 3 AND r.driverId = (     SELECT driverId     FROM results     JOIN races ON results.raceId = races.raceId     WHERE races.name = 'Canadian Grand Prix' AND results.statusId = 3     GROUP BY driverId     ORDER BY COUNT(*) DESC     LIMIT 1 ) 
SELECT d.forename, d.surname, ds.wins  FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (SELECT MIN(dob) FROM drivers) ORDER BY ds.wins DESC LIMIT 1; 
SELECT MAX(duration)  FROM pitStops; 
SELECT MIN(time) FROM lapTimes
SELECT MAX(duration)  FROM pitStops  JOIN drivers ON pitStops.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT lap, time FROM pitStops AS ps JOIN drivers AS d ON ps.driverId = d.driverId JOIN races AS r ON ps.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Australian Grand Prix' AND r.year = 2011
SELECT p.driverId, d.forename, d.surname, p.duration  FROM pitStops p JOIN drivers d ON p.driverId = d.driverId JOIN races r ON p.raceId = r.raceId WHERE r.name = 'Australian Grand Prix' AND r.year = 2011; 
SELECT MIN(time) AS fastest_lap_time FROM lapTimes WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'); 
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId WHERE lt.time = (     SELECT MIN(time)      FROM lapTimes ) ORDER BY lt.time LIMIT 20; 
SELECT r.name AS circuit_name, res.position AS position_during_fastest_lap FROM results res JOIN races r ON res.raceId = r.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND res.fastestLapTime = (     SELECT MIN(fastestLapTime)      FROM results      WHERE driverId = d.driverId ); 
SELECT MIN(time) AS fastest_lap_time FROM lapTimes WHERE raceId IN (     SELECT raceId     FROM races     WHERE name = 'Austrian Grand Prix' ); 
SELECT r.name AS race_name, c.name AS circuit_name, l.driverId, l.lap, l.time AS lap_time FROM races r JOIN circuits c ON r.circuitId = c.circuitId JOIN lapTimes l ON l.raceId = r.raceId WHERE c.country = 'Italy' ORDER BY l.time ASC LIMIT 1; 
SELECT r.name FROM races AS r JOIN lapTimes AS lt ON r.raceId = lt.raceId WHERE r.name = 'Austrian Grand Prix' ORDER BY lt.time LIMIT 1
SELECT T3.duration  FROM results AS T1  JOIN lapTimes AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId  JOIN pitStops AS T3 ON T1.raceId = T3.raceId AND T1.driverId = T3.driverId  WHERE T1.raceId = (     SELECT raceId      FROM races      WHERE name = 'Austrian Grand Prix' )  AND T2.time = (     SELECT MIN(time)      FROM lapTimes      WHERE raceId = T1.raceId ); 
SELECT c.lat, c.lng  FROM circuits c  JOIN lapTimes lt ON c.circuitId = (     SELECT r.circuitId      FROM races r      JOIN results res ON r.raceId = res.raceId      WHERE res.time = '1:29.488' )  WHERE lt.time = '1:29.488'; 
SELECT AVG(milliseconds)  FROM pitStops  JOIN drivers ON pitStops.driverId = drivers.driverId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT AVG(milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy'; 
SELECT pa.player_api_id, p.player_name, MAX(pa.overall_rating) FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id GROUP BY pa.player_api_id, p.player_name ORDER BY MAX(pa.overall_rating) DESC LIMIT 1; 
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player)
SELECT preferred_foot  FROM Player_Attributes  WHERE potential = (     SELECT MIN(potential)      FROM Player_Attributes ); 
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player_Attributes pa WHERE pa.overall_rating >= 60 AND pa.overall_rating < 65 AND pa.defensive_work_rate = 'low'; 
SELECT pa.player_api_id, p.player_name, MAX(pa.crossing) AS max_crossing FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id GROUP BY pa.player_api_id, p.player_name ORDER BY max_crossing DESC LIMIT 5; 
SELECT l.name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2015/2016' GROUP BY l.name ORDER BY SUM(m.home_team_goal + m.away_team_goal) DESC LIMIT 1; 
SELECT home_team_api_id, COUNT(*) AS losses FROM Match WHERE season = '2015/2016' AND home_team_goal < away_team_goal GROUP BY home_team_api_id ORDER BY losses ASC LIMIT 1; 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id GROUP BY p.player_name ORDER BY SUM(pa.penalties) DESC LIMIT 10; 
SELECT T3.team_long_name FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id JOIN Team AS T3 ON T1.away_team_api_id = T3.team_api_id WHERE T2.name = 'Scotland Premier League' AND T1.season = '2009/2010' AND T1.away_team_goal > T1.home_team_goal GROUP BY T1.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT team_long_name, MAX(buildUpPlaySpeed) AS max_buildUpPlaySpeed FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id GROUP BY team_long_name ORDER BY max_buildUpPlaySpeed DESC LIMIT 4; 
SELECT L.name FROM Match M JOIN League L ON M.league_id = L.id WHERE M.season = '2015/2016' AND M.home_team_goal = M.away_team_goal GROUP BY L.name ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT DISTINCT p.player_name, TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) AS age FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.sprint_speed >= 97 AND YEAR(pa.date) BETWEEN 2013 AND 2015; 
SELECT l.name, COUNT(m.league_id) AS match_count FROM Match m JOIN League l ON m.league_id = l.id GROUP BY l.name ORDER BY match_count DESC LIMIT 1; 
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00' 
SELECT player_api_id  FROM Player_Attributes  WHERE substr(date, 1, 4) = '2010'  AND overall_rating = (     SELECT MAX(overall_rating)      FROM Player_Attributes      WHERE substr(date, 1, 4) = '2010' ) 
SELECT DISTINCT ta.team_fifa_api_id FROM Team_Attributes ta WHERE ta.buildUpPlaySpeed > 50 AND ta.buildUpPlaySpeed < 60; 
SELECT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > (     SELECT AVG(buildUpPlayPassing)     FROM Team_Attributes     WHERE buildUpPlayPassing IS NOT NULL ) AND strftime('%Y', TA.date) = '2012' 
SELECT      CAST(SUM(CASE WHEN pa.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.player_fifa_api_id) AS percentage_left_foot FROM      Player p JOIN      Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE      strftime('%Y', p.birthday) BETWEEN '1987' AND '1992'; 
SELECT l.name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals FROM League l JOIN Match m ON l.id = m.league_id GROUP BY l.id, l.name ORDER BY total_goals ASC LIMIT 5; 
SELECT AVG(long_shots) AS average_long_shots FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Ahmed Samir Farag'; 
SELECT p.player_name, AVG(pa.heading_accuracy) AS avg_heading_accuracy FROM Player p JOIN Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE p.height > 180 GROUP BY p.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10; 
SELECT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayDribblingClass = 'Normal' AND TA.date >= '2014-01-01 00:00:00' AND TA.date <= '2014-01-31 00:00:00' AND TA.chanceCreationPassing < (     SELECT AVG(TA2.chanceCreationPassing)     FROM Team_Attributes AS TA2     WHERE TA2.buildUpPlayDribblingClass = 'Normal'     AND TA2.date >= '2014-01-01 00:00:00'     AND TA2.date <= '2014-01-31 00:00:00' ) ORDER BY TA.chanceCreationPassing DESC; 
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal) 
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'; 
SELECT player_name  FROM Player  WHERE strftime('%Y-%m', birthday) = '1970-10'; 
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Franco Zennaro'
SELECT buildUpPlayPositioningClass  FROM Team_Attributes  JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id  WHERE Team.team_long_name = 'ADO Den Haag'; 
SELECT pa.heading_accuracy  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Francois Affolter' AND pa.date = '2014-09-18 00:00:00'; 
SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011' 
SELECT COUNT(*)  FROM Match m  JOIN League l ON m.league_id = l.id  WHERE m.season = '2015/2016' AND l.name = 'Scotland Premier League'; 
SELECT preferred_foot  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  ORDER BY Player.birthday DESC  LIMIT 1; 
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.potential = (     SELECT MAX(potential)      FROM Player_Attributes ); 
SELECT COUNT(DISTINCT pa.player_api_id) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.weight < 130 AND pa.preferred_foot = 'left'; 
SELECT T.team_short_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'; 
SELECT preferred_foot, defensive_work_rate  FROM Player_Attributes  WHERE player_api_id = (     SELECT player_api_id      FROM Player      WHERE player_name = 'David Wilson' ); 
SELECT P.birthday FROM Player P JOIN Player_Attributes PA ON P.player_api_id = PA.player_api_id WHERE PA.overall_rating = (     SELECT MAX(overall_rating) FROM Player_Attributes ) LIMIT 1; 
SELECT L.name FROM League AS L JOIN Country AS C ON L.country_id = C.id WHERE C.name = 'Netherlands'
SELECT AVG(home_team_goal) AS average_home_team_goal FROM Match m JOIN Country c ON m.country_id = c.id WHERE c.name = 'Poland' AND m.season = '2010/2011'; 
SELECT      p.player_name,      AVG(pa.finishing) AS avg_finishing FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE      p.height IN (SELECT MAX(height) FROM Player)      OR p.height IN (SELECT MIN(height) FROM Player) GROUP BY      p.player_name ORDER BY      avg_finishing DESC LIMIT 1; 
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*)  FROM Player  WHERE strftime('%Y', birthday) > '1990'; 
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Adam%' AND weight > 170; 
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating > 80 AND strftime('%Y', pa.date) BETWEEN '2008' AND '2010' 
SELECT T2.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT player_name  FROM Player  JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.preferred_foot = 'left'; 
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'; 
SELECT ta.buildUpPlayPassingClass FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE t.team_short_name = 'CLB'; 
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > 70; 
SELECT SUM(t2.overall_rating) / COUNT(t2.id) AS avg_overall_rating FROM Player t1 JOIN Player_Attributes t2 ON t1.player_api_id = t2.player_api_id WHERE strftime('%Y', t2.date) BETWEEN '2010' AND '2015' AND t1.height > 170; 
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)
SELECT c.name FROM Country c JOIN League l ON c.id = l.country_id WHERE l.name = 'Italy Serie A'
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32; 
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Aaron Doran'
SELECT COUNT(*)  FROM Match m  JOIN League l ON m.league_id = l.id  WHERE l.name = 'Germany 1. Bundesliga'  AND strftime('%Y-%m', m.date) BETWEEN '2008-08' AND '2008-10'; 
SELECT DISTINCT T1.team_short_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10; 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = 61 AND pa.balance = (     SELECT MAX(balance)     FROM Player_Attributes     WHERE potential = 61 ); 
SELECT      (SUM(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.ball_control ELSE 0 END) / COUNT(CASE WHEN p.player_name = 'Abdou Diallo' THEN pa.id ELSE NULL END)) -     (SUM(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.ball_control ELSE 0 END) / COUNT(CASE WHEN p.player_name = 'Aaron Appindangoye' THEN pa.id ELSE NULL END)) AS ball_control_difference FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id; 
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'; 
SELECT p1.player_name AS older_player FROM Player p1 WHERE p1.player_name = 'Aaron Lennon' AND p1.birthday < (SELECT p2.birthday FROM Player p2 WHERE p2.player_name = 'Abdelaziz Barrada') UNION SELECT p2.player_name AS older_player FROM Player p2 WHERE p2.player_name = 'Abdelaziz Barrada' AND p2.birthday < (SELECT p1.birthday FROM Player p1 WHERE p1.player_name = 'Aaron Lennon'); 
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player) 
SELECT COUNT(*)  FROM Player_Attributes  WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'; 
SELECT c.name  FROM Country c  JOIN League l ON c.id = l.country_id  WHERE l.name = 'Belgium Jupiler League'
SELECT l.name FROM League l JOIN Country c ON l.country_id = c.id WHERE c.name = 'Germany'
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (     SELECT MAX(overall_rating)      FROM Player_Attributes ) LIMIT 1; 
SELECT COUNT(DISTINCT p.player_api_id) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high'; 
SELECT pa.player_fifa_api_id, p.player_name, MAX(pa.crossing) AS max_crossing FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') GROUP BY pa.player_fifa_api_id, p.player_name ORDER BY max_crossing DESC LIMIT 1; 
SELECT pa.heading_accuracy FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk'
SELECT COUNT(DISTINCT p.player_api_id) FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.height > 180 AND pa.volleys > 70; 
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.volleys > 70 AND pa.dribbling > 70; 
SELECT COUNT(*) FROM Match AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.season = '2008/2009' AND T2.name = 'Belgium'
SELECT pa.long_passing FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player) ORDER BY pa.date DESC LIMIT 1; 
SELECT COUNT(*)  FROM Match  WHERE league_id = (SELECT id FROM League WHERE name = 'Belgium Jupiler League')  AND SUBSTR(date, 1, 7) = '2009-04'; 
SELECT l.name  FROM League l  JOIN Match m ON l.id = m.league_id  WHERE m.season = '2008/2009'  GROUP BY l.name  ORDER BY COUNT(m.id) DESC  LIMIT 1; 
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986' 
SELECT      ((pa1.overall_rating - pa2.overall_rating) / pa2.overall_rating) * 100 AS percentage_difference FROM      Player_Attributes pa1 JOIN      Player p1 ON pa1.player_api_id = p1.player_api_id JOIN      Player_Attributes pa2 JOIN      Player p2 ON pa2.player_api_id = p2.player_api_id WHERE      p1.player_name = 'Ariel Borysiuk'      AND p2.player_name = 'Paulin Puel'; 
SELECT AVG(buildUpPlaySpeed)  FROM Team_Attributes  WHERE team_api_id IN (     SELECT team_api_id      FROM Team      WHERE team_long_name = 'Heart of Midlothian' ); 
SELECT AVG(T1.overall_rating)  FROM Player_Attributes AS T1  JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id  WHERE T2.player_name = 'Pietro Marino' 
SELECT SUM(crossing)  FROM Player_Attributes PA  JOIN Player P ON PA.player_api_id = P.player_api_id  WHERE P.player_name = 'Aaron Lennox'; 
SELECT MAX(chanceCreationPassing) AS max_chance_creation_passing, chanceCreationPassingClass FROM Team_Attributes JOIN Team ON Team_Attributes.team_api_id = Team.team_api_id WHERE Team.team_long_name = 'Ajax'; 
SELECT pa.preferred_foot  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Abdou Diallo'; 
SELECT MAX(pa.overall_rating)  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Dorlan Pabon'; 
SELECT AVG(away_team_goal)  FROM Match m  JOIN Team t ON m.away_team_api_id = t.team_api_id  JOIN Country c ON m.country_id = c.id  WHERE t.team_long_name = 'Parma' AND c.name = 'Italy'; 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1; 
SELECT pa.overall_rating FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date LIKE '2016-02-04%'; 
SELECT pa.potential FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Francesco Parravicini' AND pa.date = '2010-08-30 00:00:00'; 
SELECT attacking_work_rate  FROM Player_Attributes pa  JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Francesco Migliore' AND pa.date LIKE '2015-05-01%'; 
SELECT pa.defensive_work_rate  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Kevin Berigaud' AND pa.date = '2013-02-22 00:00:00'; 
SELECT pa.date FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Kevin Constant' ORDER BY pa.crossing DESC, pa.date ASC LIMIT 1; 
SELECT ta.buildUpPlaySpeedClass FROM Team t JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE t.team_long_name = 'Willem II' AND ta.date = '2012-02-22'; 
SELECT ta.buildUpPlayDribblingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_short_name = 'LEI' AND ta.date = '2015-09-10 00:00:00'; 
SELECT ta.buildUpPlayPassingClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'FC Lorient' AND ta.date LIKE '2010-02-22%'; 
SELECT T3.chanceCreationPassingClass  FROM Team AS T1  JOIN Team_Attributes AS T3 ON T1.team_api_id = T3.team_api_id  WHERE T1.team_long_name = 'PEC Zwolle' AND T3.date = '2013-09-20 00:00:00'; 
SELECT T2.chanceCreationCrossingClass  FROM Team AS T1  JOIN Team_Attributes AS T2  ON T1.team_api_id = T2.team_api_id  WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'; 
SELECT ta.defenceAggressionClass FROM Team_Attributes ta JOIN Team t ON ta.team_api_id = t.team_api_id WHERE t.team_long_name = 'Hannover 96' AND ta.date LIKE '2015-09-10%'; 
SELECT AVG(pa.overall_rating)  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE p.player_name = 'Marko Arnautovic'  AND SUBSTR(pa.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'; 
SELECT      ((a.overall_rating - b.overall_rating) / a.overall_rating) * 100 AS percentage_difference FROM      Player_Attributes a JOIN      Player p1 ON a.player_api_id = p1.player_api_id AND p1.player_name = 'Landon Donovan' JOIN      Player_Attributes b JOIN      Player p2 ON b.player_api_id = p2.player_api_id AND p2.player_name = 'Jordan Bowery' WHERE      a.date = '2013-07-12' AND b.date = '2013-07-12'; 
SELECT player_name  FROM Player  WHERE height = (SELECT MAX(height) FROM Player); 
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10; 
SELECT player_name  FROM Player  WHERE strftime('%Y', 'now') - strftime('%Y', birthday) >= 35; 
SELECT SUM(home_team_goal)  FROM Match  JOIN Player ON Match.home_player_1 = Player.player_api_id OR                Match.home_player_2 = Player.player_api_id OR                Match.home_player_3 = Player.player_api_id OR                Match.home_player_4 = Player.player_api_id OR                Match.home_player_5 = Player.player_api_id OR                Match.home_player_6 = Player.player_api_id OR                Match.home_player_7 = Player.player_api_id OR                Match.home_player_8 = Player.player_api_id OR                Match.home_player_9 = Player.player_api_id OR                Match.home_player_10 = Player.player_api_id OR                Match.home_player_11 = Player.player_api_id  WHERE Player.player_name = 'Aaron Lennon'; 
SELECT SUM(T2.away_team_goal) AS total_goals FROM Match AS T1 JOIN Player AS T3 ON T1.away_player_1 = T3.player_api_id OR T1.away_player_2 = T3.player_api_id OR T1.away_player_3 = T3.player_api_id OR T1.away_player_4 = T3.player_api_id OR T1.away_player_5 = T3.player_api_id OR T1.away_player_6 = T3.player_api_id OR T1.away_player_7 = T3.player_api_id OR T1.away_player_8 = T3.player_api_id OR T1.away_player_9 = T3.player_api_id OR T1.away_player_10 = T3.player_api_id OR T1.away_player_11 = T3.player_api_id JOIN Match AS T2 ON T1.id = T2.id WHERE T3.player_name IN ('Daan Smith', 'Filipe Ferreira') 
SELECT SUM(home_team_goal) AS total_goals FROM Match m JOIN Player p ON m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id OR m.home_player_11 = p.player_api_id WHERE strftime('%Y', 'now') - strftime('%Y', p.birthday) <= 30 
SELECT p.player_name  FROM Player p  JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id  WHERE pa.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes); 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.potential = (     SELECT MAX(potential) FROM Player_Attributes ) 
SELECT DISTINCT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.attacking_work_rate = 'high'; 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY p.birthday ASC LIMIT 1; 
SELECT p.player_name FROM Player p JOIN Match m ON p.player_api_id IN (m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11, m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5, m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11) JOIN Country c ON m.country_id = c.id WHERE c.name = 'Belgium'; 
SELECT DISTINCT p.player_name, c.name AS country FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id JOIN Match m ON p.player_api_id IN (m.home_player_1, m.home_player_2, m.home_player_3, m.home_player_4, m.home_player_5, m.home_player_6, m.home_player_7, m.home_player_8, m.home_player_9, m.home_player_10, m.home_player_11, m.away_player_1, m.away_player_2, m.away_player_3, m.away_player_4, m.away_player_5, m.away_player_6, m.away_player_7, m.away_player_8, m.away_player_9, m.away_player_10, m.away_player_11) JOIN Country c ON m.country_id = c.id WHERE pa.vision > 89; 
SELECT c.name  FROM Country c  JOIN League l ON c.id = l.country_id  JOIN Match m ON l.id = m.league_id  JOIN Player p ON m.home_player_1 = p.player_api_id OR m.away_player_1 = p.player_api_id  GROUP BY c.name  ORDER BY AVG(p.weight) DESC  LIMIT 1;
SELECT T.team_long_name FROM Team T JOIN Team_Attributes TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Slow'; 
SELECT DISTINCT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'; 
SELECT AVG(T2.height) FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Italy'
SELECT player_name  FROM Player  WHERE height > 180  ORDER BY player_name  LIMIT 3; 
SELECT COUNT(*)  FROM Player  WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01'; 
SELECT      (SELECT jumping FROM Player_Attributes WHERE player_api_id = 6) -      (SELECT jumping FROM Player_Attributes WHERE player_api_id = 23) AS jumping_difference; 
SELECT player_api_id  FROM Player_Attributes  WHERE preferred_foot = 'right'  ORDER BY potential ASC  LIMIT 5; 
SELECT COUNT(DISTINCT player_api_id) FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'; 
SELECT CAST(SUM(CASE WHEN strength > 80 AND stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM Player_Attributes; 
SELECT c.name  FROM Country c  JOIN League l ON c.id = l.country_id  WHERE l.name = 'Poland Ekstraklasa'
SELECT m.home_team_goal, m.away_team_goal FROM Match m JOIN League l ON m.league_id = l.id WHERE m.date LIKE '2008-09-24%' AND l.name = 'Belgium Jupiler League'; 
SELECT sprint_speed, agility, acceleration  FROM Player_Attributes  JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id  WHERE Player.player_name = 'Alexis Blin'; 
SELECT ta.buildUpPlaySpeedClass  FROM Team_Attributes ta  JOIN Team t ON ta.team_api_id = t.team_api_id  WHERE t.team_long_name = 'KSV Cercle Brugge'; 
SELECT COUNT(*)  FROM Match  WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A'); 
SELECT MAX(home_team_goal)  FROM Match  WHERE league_id = (SELECT id FROM League WHERE name = 'Netherlands Eredivisie'); 
SELECT pa.finishing, pa.curve  FROM Player p  JOIN Player_Attributes pa  ON p.player_api_id = pa.player_api_id  WHERE p.weight = (SELECT MAX(weight) FROM Player); 
SELECT L.name FROM League L JOIN Match M ON L.id = M.league_id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY COUNT(M.id) DESC LIMIT 4; 
SELECT T.team_long_name  FROM Match M  JOIN Team T ON M.away_team_api_id = T.team_api_id  WHERE M.away_team_goal = (SELECT MAX(away_team_goal) FROM Match); 
SELECT p.player_name FROM Player p JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = (     SELECT MAX(overall_rating) FROM Player_Attributes ); 
SELECT      (CAST(SUM(CASE WHEN p.height < 180 AND pa.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) / COUNT(p.id)) * 100 AS percentage FROM      Player p JOIN      Player_Attributes pa ON p.player_api_id = pa.player_api_id; 
SELECT      CASE          WHEN SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) > SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) THEN 'In-patient'         ELSE 'Outpatient'     END AS Majority,     ABS(         (SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) / COUNT(ID)) * 100 -          (SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) / COUNT(ID)) * 100     ) AS PercentageDeviation FROM Patient WHERE SEX = 'M'; 
SELECT      CAST(SUM(CASE WHEN YEAR(Birthday) > 1930 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID)  FROM Patient  WHERE SEX = 'F'; 
SELECT      (COUNT(CASE WHEN Admission = '+' THEN 1 END) / COUNT(*)) * 100 AS percentage_inpatient FROM      Patient WHERE      YEAR(Birthday) BETWEEN 1930 AND 1940; 
SELECT      CAST(SUM(CASE WHEN p.Admission = '+' THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN p.Admission = '-' THEN 1 ELSE 0 END) AS ratio FROM      Patient p WHERE      p.Diagnosis = 'SLE'; 
SELECT p.Diagnosis, l.Date FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.ID = 30609; 
SELECT p.SEX, p.Birthday, e.`Examination Date`, e.Symptoms FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE p.ID = 163109; 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.LDH > 500; 
SELECT p.ID, TIMESTAMPDIFF(YEAR, p.Birthday, CURRENT_TIMESTAMP) AS Age FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.RVVT = '+'; 
SELECT p.ID, p.SEX, p.Diagnosis FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis = 2; 
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.Description, p.`First Date`, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1937 AND l.`T-CHO` >= 250; 
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALB < 3.5; 
SELECT      (COUNT(CASE WHEN p.SEX = 'F' AND l.TP < 6.0 OR l.TP > 8.5 THEN p.ID END) / CAST(COUNT(p.ID) AS REAL)) * 100 AS Percentage FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID; 
SELECT AVG(e.`aCL IgG`)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE p.Admission = '+'  AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) >= 50; 
SELECT COUNT(*)  FROM Patient  WHERE SEX = 'F' AND YEAR(Description) = 1997 AND Admission = '-'; 
SELECT MIN(YEAR(`First Date`) - YEAR(`Birthday`)) AS Age FROM Patient WHERE `First Date` IS NOT NULL; 
SELECT COUNT(e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.Thrombosis = 1 AND YEAR(e.`Examination Date`) = 1997 AND p.SEX = 'F'; 
SELECT MAX(YEAR(P.Birthday)) - MIN(YEAR(P.Birthday)) AS AgeGap FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.TG >= 200; 
SELECT E.Symptoms, P.Diagnosis FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.Symptoms IS NOT NULL ORDER BY P.Birthday DESC LIMIT 1; 
SELECT COUNT(DISTINCT L.ID) / 12 AS avg_male_patients_tested FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.Date BETWEEN '1998-01-01' AND '1998-12-31'; 
SELECT p.ID, MAX(p.Birthday) AS OldestBirthday, l.Date AS LabWorkDate, TIMESTAMPDIFF(YEAR, p.Birthday, p.`First Date`) AS AgeAtFirstVisit FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' GROUP BY p.ID, l.Date, AgeAtFirstVisit ORDER BY OldestBirthday ASC LIMIT 1; 
SELECT      SUM(CASE WHEN p.SEX = 'M' AND l.UA <= 8.0 THEN 1 ELSE 0 END) /      SUM(CASE WHEN p.SEX = 'F' AND l.UA <= 6.5 THEN 1 ELSE 0 END) AS male_to_female_ratio FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p LEFT JOIN Examination e ON p.ID = e.ID WHERE DATEDIFF(e.`Examination Date`, p.`First Date`) >= 365 OR e.ID IS NULL; 
SELECT COUNT(DISTINCT e.ID) FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE YEAR(p.Birthday) > 1975 AND YEAR(e.`Examination Date`) BETWEEN 1990 AND 1993; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.`T-BIL` >= 2.0; 
SELECT Diagnosis, COUNT(*) AS DiagnosisCount FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY DiagnosisCount DESC LIMIT 1; 
SELECT AVG(YEAR('1999') - YEAR(P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-31'; 
SELECT p.ID, p.SEX, p.Birthday, e.`Examination Date`, e.Diagnosis,         TIMESTAMPDIFF(YEAR, p.Birthday, e.`Examination Date`) AS AgeAtExamination, l.HGB FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.HGB = (     SELECT MAX(HGB)      FROM Laboratory ) ORDER BY l.HGB DESC LIMIT 1; 
SELECT `ANA`  FROM `Examination`  WHERE `ID` = 3605340 AND `Examination Date` = '1996-12-02'; 
SELECT T3.`T-CHO`  FROM `Patient` AS T1  JOIN `Laboratory` AS T3 ON T1.ID = T3.ID  WHERE T1.ID = 2927464 AND T3.Date = '1995-09-04' AND T3.`T-CHO` < 250; 
SELECT P.SEX FROM Patient P WHERE P.Diagnosis = 'AORTITIS' ORDER BY P.`First Date` LIMIT 1; 
SELECT `aCL IgM`  FROM `Examination` AS E  JOIN `Patient` AS P ON E.ID = P.ID  WHERE P.Diagnosis = 'SLE' AND P.Description = '1994-02-19' AND E.`Examination Date` = '1993-11-12'; 
SELECT P.SEX  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.Date = '1992-06-12' AND L.GPT = 9; 
SELECT TIMESTAMPDIFF(YEAR, p.Birthday, l.Date) AS Age FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UA = 8.4 AND l.Date = '1991-10-21'; 
SELECT COUNT(L.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.`First Date` = '1991-06-13'  AND P.Diagnosis LIKE '%SJS%'  AND YEAR(L.Date) = 1995; 
SELECT p.Diagnosis  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE e.`Examination Date` = '1997-01-27' AND e.Diagnosis LIKE '%SLE%' AND p.`First Date` IS NOT NULL; 
SELECT Symptoms  FROM Examination  WHERE ID = (SELECT ID FROM Patient WHERE Birthday = '1959-03-01')  AND `Examination Date` = '1993-09-27'; 
SELECT      (SUM(CASE WHEN L.`Date` LIKE '1981-11-%' THEN L.`T-CHO` ELSE 0 END) -       SUM(CASE WHEN L.`Date` LIKE '1981-12-%' THEN L.`T-CHO` ELSE 0 END)) AS decrease_rate FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      P.Birthday = '1959-02-18'; 
SELECT DISTINCT P.ID FROM Patient P JOIN Examination E ON P.ID = E.ID WHERE P.Diagnosis = 'Behcet' AND E.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'; 
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND l.GPT > 30 AND l.ALB < 4; 
SELECT ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'; 
SELECT COUNT(DISTINCT ID)  FROM Examination  WHERE Thrombosis = 2  AND `ANA Pattern` = 'S'  AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination) 
SELECT      CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM      Laboratory WHERE      `U-PRO` > 0 AND `U-PRO` < 30; 
SELECT      CAST(SUM(CASE WHEN p.Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.ID)  FROM      Patient p  WHERE      p.SEX = 'M' AND YEAR(p.`First Date`) = 1981; 
SELECT DISTINCT p.ID, p.SEX, p.Birthday, p.First_Date, p.Admission, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.`T-BIL` < 2.0; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F'  AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31'  AND e.`ANA Pattern` != 'P'; 
SELECT P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Diagnosis = 'PSS' AND L.CRP = '2+' AND L.CRE = 1 AND L.LDH = 123; 
SELECT AVG(L.ALB)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE'; 
SELECT Symptoms, COUNT(*) AS SymptomCount FROM Examination WHERE Diagnosis LIKE '%SLE%' GROUP BY Symptoms ORDER BY SymptomCount DESC LIMIT 1; 
SELECT P.Description, P.Diagnosis  FROM Patient P  WHERE P.ID = 48473; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F' AND e.Diagnosis = 'APS'; 
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE YEAR(L.Date) = '1997' AND (L.TP <= 6 OR L.TP >= 8.5) 
SELECT      CAST(SUM(CASE WHEN E.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100 /      COUNT(CASE WHEN L.PLT < 150 THEN 1 END) AS Proportion FROM      Examination E JOIN      Laboratory L ON E.ID = L.ID WHERE      L.PLT < 150; 
SELECT      (SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) / COUNT(SEX)) * 100 AS percentage_women FROM      Patient WHERE      YEAR(Birthday) = 1980 AND Diagnosis = 'RA'; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE p.SEX = 'M' AND e.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND p.Diagnosis = 'Behcet' AND p.Admission = '-'; 
SELECT COUNT(DISTINCT P.ID) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.WBC < 3.5; 
SELECT DATEDIFF(E.`Examination Date`, P.`First Date`) AS DaysDifference FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.ID = 821298; 
SELECT e.ID, p.SEX, l.UA, CASE      WHEN p.SEX = 'M' AND l.UA > 8.0 THEN 'Normal'     WHEN p.SEX = 'F' AND l.UA > 6.5 THEN 'Normal'     ELSE 'Abnormal' END AS Uric_Acid_Range FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON e.ID = l.ID WHERE e.ID = 57266; 
SELECT `Date`  FROM `Laboratory`  WHERE `ID` = 48473 AND `GOT` >= 60; 
SELECT P.ID, P.SEX, P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.Date BETWEEN '1994-01-01' AND '1994-12-31' AND L.GOT < 60; 
SELECT DISTINCT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GPT >= 60; 
SELECT P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT > 60 ORDER BY P.Birthday ASC; 
SELECT AVG(LDH)  FROM Laboratory  WHERE LDH < 500; 
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_TIMESTAMP) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.LDH BETWEEN 600 AND 800; 
SELECT P.ID, P.Admission FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.ALP < 300; 
SELECT p.ID, l.ALP FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300; 
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0; 
SELECT P.ID, L.TP - 8.5 AS TP_Deviation FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.TP > 8.5; 
SELECT P.ID, P.SEX, P.Birthday, L.ALB FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC; 
SELECT p.ID, p.SEX, p.Birthday, l.ALB,         CASE             WHEN l.ALB BETWEEN 3.5 AND 5.5 THEN 'Within Normal Range'            ELSE 'Outside Normal Range'        END AS AlbuminRange FROM Patient p LEFT JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) = 1982; 
SELECT      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient WHERE SEX = 'F') AS Percentage FROM      Laboratory L JOIN      Patient P ON L.ID = P.ID WHERE      P.SEX = 'F' AND L.UA > 6.5; 
SELECT AVG(t2.UA) AS avg_ua FROM Patient t1 JOIN (     SELECT ID, UA, `Date`     FROM Laboratory     WHERE (`Date`, ID) IN (         SELECT MAX(`Date`), ID         FROM Laboratory         GROUP BY ID     ) ) t2 ON t1.ID = t2.ID WHERE (t1.SEX = 'M' AND t2.UA < 8.0) OR (t1.SEX = 'F' AND t2.UA < 6.5); 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.UN = 29; 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'RA' AND l.UN < 30; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.CRE >= 1.5; 
SELECT      SUM(CASE WHEN p.SEX = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN p.SEX = 'F' THEN 1 ELSE 0 END) AS result FROM      Patient p JOIN      Laboratory l ON p.ID = l.ID WHERE      l.CRE >= 1.5; 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` = (     SELECT MAX(`T-BIL`)      FROM Laboratory ) 
SELECT SEX, GROUP_CONCAT(DISTINCT ID) AS PatientIDs FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`T-BIL` >= 2.0 GROUP BY SEX; 
SELECT p.ID, l.T_CHO  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.T_CHO = (     SELECT MAX(T_CHO)      FROM Laboratory )  ORDER BY p.Birthday  LIMIT 1; 
SELECT AVG(YEAR(CURDATE()) - YEAR(P.Birthday)) AS AverageAge FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.T_CHO >= 250; 
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG > 300; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200 AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) > 50; 
SELECT DISTINCT p.ID FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.CPK < 250; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(p.Birthday) BETWEEN 1936 AND 1956  AND p.SEX = 'M'  AND l.CPK >= 250; 
SELECT P.ID, P.SEX, TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_TIMESTAMP) AS Age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.T_CHO < 250; 
SELECT P.ID, L.GLU FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(P.Description) = 1991 AND L.GLU < 180; 
SELECT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.WBC <= 3.5 OR l.WBC >= 9.0 ORDER BY p.SEX, p.Birthday ASC; 
SELECT P.ID, TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_TIMESTAMP) AS Age, P.Diagnosis FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RBC < 3.5; 
SELECT p.ID, p.SEX, p.Birthday, p.Admission FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) >= 50 AND (l.RBC <= 3.5 OR l.RBC >= 6.0) 
SELECT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.HGB < 10; 
SELECT P.ID, P.SEX FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE E.Diagnosis = 'SLE' AND L.HGB > 10 AND L.HGB < 17 ORDER BY P.Birthday ASC LIMIT 1; 
SELECT e.ID, TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) AS Age FROM Examination e JOIN Patient p ON e.ID = p.ID WHERE e.ID IN (     SELECT l.ID     FROM Laboratory l     WHERE l.HCT >= 52     GROUP BY l.ID     HAVING COUNT(l.ID) > 2 ) 
SELECT AVG(HCT) AS Average_HCT FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29; 
SELECT      SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) AS comparison_result FROM      Laboratory WHERE      PLT <= 100 OR PLT >= 400; 
SELECT DISTINCT p.ID, p.SEX, p.Birthday FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(l.Date) = '1984'   AND TIMESTAMPDIFF(YEAR, p.Birthday, CURDATE()) < 50   AND l.PLT BETWEEN 100 AND 400; 
SELECT      (SUM(CASE WHEN P.SEX = 'F' AND L.PT >= 14 THEN 1 ELSE 0 END) / COUNT(CASE WHEN L.PT >= 14 THEN 1 END)) * 100 AS percentage FROM      Patient P JOIN      Laboratory L ON P.ID = L.ID WHERE      TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) > 55; 
SELECT p.ID, p.SEX, p.Birthday, p.First_Date  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE YEAR(p.First_Date) > 1992 AND l.PT < 14; 
SELECT COUNT(*)  FROM Examination  WHERE `Examination Date` > '1997-01-01' AND APTT IS NOT NULL AND CAST(APTT AS INTEGER) < 45; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.APTT > 45 AND e.Thrombosis = 0; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.WBC > 3.5 AND l.WBC < 9.0 AND (l.FG <= 150 OR l.FG >= 450); 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Birthday > '1980-01-01' AND (l.FG < 150 OR l.FG > 450) 
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.`U-PRO` >= '30'; 
SELECT p.ID FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.`U-PRO` > 0 AND l.`U-PRO` < 30; 
SELECT COUNT(DISTINCT ID)  FROM Laboratory  WHERE IGG >= 2000; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.IGG > 900 AND l.IGG < 2000 AND e.Symptoms IS NOT NULL; 
SELECT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA BETWEEN 80 AND 500 ORDER BY l.IGA DESC LIMIT 1; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA > 80 AND l.IGA < 500 AND YEAR(p.`First Date`) >= 1990; 
SELECT Diagnosis, COUNT(*) AS Count FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.aCL IgM <= 40 OR E.aCL IgM >= 400 GROUP BY Diagnosis ORDER BY Count DESC LIMIT 1; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  LEFT JOIN Laboratory l ON p.ID = l.ID  WHERE l.CRP = '+' AND p.Description IS NULL; 
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE L.CRE >= 1.5 AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) < 70; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.KCT = '+' AND e.ID IN (     SELECT l.ID      FROM Laboratory l      WHERE l.RA IN ('-', '+-') ) 
SELECT p.ID, p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE YEAR(p.Birthday) >= 1985 AND l.RA IN ('-', '+-') GROUP BY p.ID, p.Diagnosis; 
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < '20' AND TIMESTAMPDIFF(YEAR, P.Birthday, CURDATE()) > 60; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.RF < 20 AND e.Thrombosis = 0; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.`ANA Pattern` = 'P' AND l.C3 > 35; 
SELECT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.HCT <= 29 OR l.HCT >= 52 ORDER BY e.`aCL IgA` DESC LIMIT 1; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.Thrombosis = 1 AND l.C4 > 10; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE (e.RNP = '-' OR e.RNP = '+-') AND p.Admission = '+'; 
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.RNP NOT IN ('-', '+-') ORDER BY P.Birthday DESC LIMIT 1; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.SM IN ('-', '+-') AND e.Thrombosis = 0; 
SELECT ID FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE SM NOT IN ('negative', '0')) ORDER BY Birthday DESC LIMIT 3; 
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.`Examination Date` > '1997-01-01' AND l.SC170 IN ('negative', '0') 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  WHERE e.SC170 IN ('negative', '0') AND p.SEX = 'F' AND e.Symptoms IS NULL; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSA IN ('-', '+-') AND YEAR(p.`First Date`) < 2000; 
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.SSA NOT IN ('negative', '0') ORDER BY P.`First Date` LIMIT 1; 
SELECT COUNT(DISTINCT ID)  FROM Examination  WHERE SSB IN ('-', '+-') AND Diagnosis = 'SLE'; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.SSB IN ('negative', '0') AND e.Symptoms IS NOT NULL; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.CENTROMEA IN ('-', '+-')  AND l.SSB IN ('-', '+-')  AND p.SEX = 'M'; 
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.DNA >= 8; 
SELECT COUNT(DISTINCT ID)  FROM Patient  WHERE ID IN (     SELECT ID      FROM Laboratory      WHERE DNA IS NULL AND Description IS NULL ); 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.IGG > 900 AND l.IGG < 2000 AND p.Admission = '+' 
SELECT CAST(SUM(CASE WHEN e.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(l.ID)  FROM Laboratory l  JOIN Examination e ON l.ID = e.ID  WHERE l.GOT >= 60; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.GOT < 60; 
SELECT MAX(P.Birthday)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.GOT >= 60; 
SELECT P.Birthday FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GPT < 60 ORDER BY L.GPT DESC LIMIT 3; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.GOT < 60; 
SELECT MIN(p.`First Date`)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.LDH = (SELECT MAX(LDH) FROM Laboratory WHERE LDH < 500); 
SELECT MAX(`Date`) AS LatestRecordDate FROM Laboratory WHERE ID = (     SELECT ID     FROM Patient     WHERE `First Date` = (         SELECT MAX(`First Date`)         FROM Patient     ) ) AND LDH >= 500; 
SELECT COUNT(DISTINCT L.ID)  FROM Laboratory L  JOIN Patient P ON L.ID = P.ID  WHERE L.ALP >= 300 AND P.Admission = '+' 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '-' AND l.ALP < 300; 
SELECT DISTINCT p.Diagnosis FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TP < 6.0; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE e.Diagnosis LIKE '%SjS%' AND l.TP > 6.0 AND l.TP < 8.5; 
SELECT e.`Examination Date` FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE l.ALB = (     SELECT MAX(ALB)     FROM Laboratory     WHERE ALB > 3.5 AND ALB < 5.5 ) 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP BETWEEN 6.0 AND 8.5; 
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN (     SELECT ID, MAX(UA) AS max_ua     FROM Laboratory     WHERE UA <= 6.50     GROUP BY ID ) l ON e.ID = l.ID WHERE p.SEX = 'F' ORDER BY l.max_ua DESC LIMIT 1; 
SELECT MAX(E.ANA)  FROM Examination E  JOIN Laboratory L ON E.ID = L.ID  WHERE L.CRE < 1.5; 
SELECT e.ID  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.CRE < 1.5  ORDER BY e.`aCL IgA` DESC  LIMIT 1; 
SELECT COUNT(DISTINCT L.ID) FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE L.`T-BIL` >= 2.0 AND E.`ANA Pattern` LIKE '%P%'; 
SELECT E.ANA FROM Examination E JOIN Laboratory L ON E.ID = L.ID WHERE L.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0) 
SELECT COUNT(DISTINCT l.ID) FROM Laboratory l JOIN Examination e ON l.ID = e.ID WHERE l.`T-CHO` >= 250 AND e.KCT = '-'; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.`ANA Pattern` = 'P' AND l.`T-CHO` < 250; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.TG < 200 AND e.Symptoms IS NOT NULL; 
SELECT p.Diagnosis  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.TG < 200  ORDER BY l.TG DESC  LIMIT 1; 
SELECT DISTINCT e.ID FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis = 0 AND l.CPK < 250; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.CPK < 250  AND (e.KCT = '+' OR e.RVVT = '+' OR e.LAC = '+') 
SELECT MIN(p.Birthday) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.GLU > 180; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE l.GLU < 180 AND e.Thrombosis = 0; 
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0; 
SELECT DISTINCT e.ID FROM Examination e JOIN Patient p ON e.ID = p.ID JOIN Laboratory l ON l.ID = p.ID WHERE l.RBC <= 3.5 OR l.RBC >= 6.0 AND p.Admission = '+'; 
SELECT COUNT(DISTINCT p.ID) FROM Patient p JOIN Examination e ON p.ID = e.ID JOIN Laboratory l ON p.ID = l.ID WHERE l.PLT > 100 AND l.PLT < 400 AND e.Diagnosis IS NOT NULL; 
SELECT L.PLT FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.Diagnosis = 'MCTD' AND L.PLT > 100 AND L.PLT < 400; 
SELECT AVG(L.PT)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE P.SEX = 'M' AND L.PT < 14; 
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Laboratory l ON e.ID = l.ID  WHERE e.Thrombosis IN (1, 2) AND l.PT < 14; 
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Angela' AND mem.last_name = 'Sanders'; 
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering')
SELECT first_name, last_name FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE department = 'Art and Design Department')
SELECT COUNT(*)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer'; 
SELECT m.phone FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer'; 
SELECT COUNT(*)  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  WHERE e.event_name = 'Women''s Soccer' AND m.t_shirt_size = 'Medium'; 
SELECT e.event_name, COUNT(a.link_to_event) AS attendance_count FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id, e.event_name ORDER BY attendance_count DESC LIMIT 1; 
SELECT m.college  FROM member m  JOIN major mj ON m.link_to_major = mj.major_id  WHERE m.position = 'Vice President'; 
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean'; 
SELECT COUNT(*)  FROM attendance a  JOIN event e ON a.link_to_event = e.event_id  JOIN member m ON a.link_to_member = m.member_id  WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND YEAR(e.event_date) = 2019; 
SELECT COUNT(*)  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  WHERE e.type = 'Meeting'  GROUP BY e.event_id  HAVING COUNT(a.link_to_event) > 10; 
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type != 'Fundraiser' GROUP BY e.event_id, e.event_name HAVING COUNT(a.link_to_member) > 20; 
SELECT AVG(attend_count) AS average_attendance FROM (     SELECT e.event_id, COUNT(a.link_to_member) AS attend_count     FROM event e     LEFT JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting' AND YEAR(e.event_date) = 2020     GROUP BY e.event_id ) subquery; 
SELECT expense_description, cost  FROM expense  ORDER BY cost DESC  LIMIT 1; 
SELECT COUNT(*)  FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Environmental Engineering'; 
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Laugh Out Loud'; 
SELECT m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Law and Constitutional Studies'; 
SELECT zip_code.county FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey'
SELECT T3.college FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'
SELECT SUM(amount) AS total_funds_received FROM income JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President'; 
SELECT SUM(e.cost) AS total_spent_on_food FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE b.category = 'Food' AND ev.event_name = 'September Meeting'; 
SELECT m.zip, z.city, z.state FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE m.position = 'President'
SELECT first_name, last_name  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.state = 'Illinois'; 
SELECT b.spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting'; 
SELECT m.department  FROM member AS mem1  JOIN major AS m ON mem1.link_to_major = m.major_id  WHERE mem1.last_name = 'Guidi'  INTERSECT  SELECT m.department  FROM member AS mem2  JOIN major AS m ON mem2.link_to_major = m.major_id  WHERE mem2.last_name = 'Pierce'; 
SELECT SUM(b.amount) AS total_budgeted_amount FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker'; 
SELECT e.expense_description, e.approved FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND ev.event_date = '2019-10-08'; 
SELECT AVG(e.cost) AS avg_cost FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen'  AND SUBSTR(e.expense_date, 6, 2) IN ('09', '10') 
SELECT      SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2019' THEN b.spent ELSE 0 END) -     SUM(CASE WHEN SUBSTR(e.event_date, 1, 4) = '2020' THEN b.spent ELSE 0 END) AS difference_spent FROM      event e JOIN      budget b ON e.event_id = b.link_to_event; 
SELECT location FROM event WHERE event_name = 'Spring Budget Review'; 
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'; 
SELECT MAX(b.remaining)  FROM budget b  WHERE b.category = 'Food'; 
SELECT notes  FROM income  WHERE source = 'Fundraising' AND date_received = '2019-09-14'; 
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'; 
SELECT zip_code.county  FROM member  JOIN zip_code ON member.zip = zip_code.zip_code  WHERE member.first_name = 'Adela' AND member.last_name = 'OGallagher'; 
SELECT COUNT(*)  FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Meeting' AND b.remaining < 0; 
SELECT SUM(b.amount)  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'September Speaker'; 
SELECT e.status FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense x ON b.budget_id = x.link_to_budget WHERE x.expense_description = 'Post Cards, Posters' AND x.expense_date = '2019-08-20'; 
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Brent' AND mem.last_name = 'Thomason'; 
SELECT COUNT(*)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name LIKE '%Business%' AND m.t_shirt_size = 'Medium'; 
SELECT T2.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'
SELECT m.major_name FROM member AS mem JOIN major AS m ON mem.link_to_major = m.major_id WHERE mem.position = 'Vice President'; 
SELECT T3.state FROM member AS T1 JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT m.link_to_major, ma.department  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.position = 'President'; 
SELECT i.date_received  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND i.source = 'Dues'; 
SELECT m.first_name, m.last_name  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.source = 'Dues'  ORDER BY i.date_received ASC  LIMIT 1; 
SELECT      SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) /      SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END) AS ratio FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      b.category = 'Advertisement'; 
SELECT      (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) / SUM(b.amount)) * 100 AS parking_percentage FROM      budget b JOIN      event e ON b.link_to_event = e.event_id WHERE      e.event_name = 'November Speaker'; 
SELECT SUM(cost) AS total_cost_of_pizzas FROM expense WHERE expense_description = 'Pizza'; 
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT z.city, z.county, z.state  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE m.first_name = 'Amy' AND m.last_name = 'Firth'; 
SELECT e.expense_description  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  WHERE b.remaining = (SELECT MIN(remaining) FROM budget); 
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting'; 
SELECT m.college  FROM member mem  JOIN major m ON mem.link_to_major = m.major_id  GROUP BY m.college  ORDER BY COUNT(mem.member_id) DESC  LIMIT 1; 
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.phone = '809-555-3360'; 
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  ORDER BY b.amount DESC  LIMIT 1; 
SELECT e.expense_description, e.cost  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.position = 'Vice President'; 
SELECT COUNT(*) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'
SELECT date_received  FROM income i  JOIN member m ON i.link_to_member = m.member_id  WHERE m.first_name = 'Casey' AND m.last_name = 'Mason'; 
SELECT COUNT(*) FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland')
SELECT COUNT(*)  FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.phone = '954-555-6240'; 
SELECT m.first_name, m.last_name  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.department = 'School of Applied Sciences, Technology and Education'; 
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed'  ORDER BY (b.spent / b.amount) DESC  LIMIT 1; 
SELECT COUNT(*)  FROM member  WHERE position = 'President'; 
SELECT MAX(spent) FROM budget
SELECT COUNT(*)  FROM event  WHERE type = 'Meeting' AND YEAR(event_date) = 2020; 
SELECT SUM(spent) AS total_spent_for_food  FROM budget  WHERE category = 'Food'; 
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7; 
SELECT m.first_name, m.last_name  FROM member m  JOIN attendance a ON m.member_id = a.link_to_member  JOIN event e ON a.link_to_event = e.event_id  JOIN major ma ON m.link_to_major = ma.major_id  WHERE e.event_name = 'Community Theater' AND ma.major_name = 'Interior Design'; 
SELECT m.first_name, m.last_name  FROM member m  JOIN zip_code z ON m.zip = z.zip_code  WHERE z.city = 'Georgetown' AND z.state = 'South Carolina'; 
SELECT SUM(amount) AS total_income  FROM income  WHERE link_to_member = (     SELECT member_id      FROM member      WHERE first_name = 'Grant' AND last_name = 'Gilmour' ); 
SELECT m.first_name, m.last_name  FROM member m  JOIN income i ON m.member_id = i.link_to_member  WHERE i.amount > 40; 
SELECT SUM(e.cost) AS total_expense FROM event ev JOIN budget b ON ev.event_id = b.link_to_event JOIN expense e ON b.budget_id = e.link_to_budget WHERE ev.event_name = 'Yearly Kickoff'; 
SELECT m.first_name, m.last_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'; 
SELECT m.first_name, m.last_name, i.source, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (     SELECT MAX(amount)     FROM income ); 
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  JOIN expense x ON b.budget_id = x.link_to_budget  ORDER BY x.cost ASC  LIMIT 1; 
SELECT      (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN ex.cost ELSE 0 END) / SUM(ex.cost)) * 100 AS percentage FROM      expense ex JOIN      budget b ON ex.link_to_budget = b.budget_id JOIN      event e ON b.link_to_event = e.event_id; 
SELECT      SUM(CASE WHEN m.major_name = 'Finance' THEN 1 ELSE 0 END) /      SUM(CASE WHEN m.major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM      member mem JOIN      major m ON mem.link_to_major = m.major_id; 
SELECT source  FROM income  WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30'  GROUP BY source  ORDER BY SUM(amount) DESC  LIMIT 1; 
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'; 
SELECT COUNT(*)  FROM member  WHERE link_to_major IN (     SELECT major_id      FROM major      WHERE major_name = 'Physics Teaching' ); 
SELECT COUNT(DISTINCT link_to_member)  FROM attendance  WHERE link_to_event IN (     SELECT event_id      FROM event      WHERE event_name = 'Community Theater' AND YEAR(event_date) = 2019 ) 
SELECT COUNT(a.link_to_event) AS events_attended, m.major_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Luisa' AND m.last_name = 'Guidi'; 
SELECT AVG(b.spent) AS avg_spent_on_food FROM budget b WHERE b.category = 'Food' AND b.event_status = 'Closed'; 
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.category = 'Advertisement'  ORDER BY b.spent DESC  LIMIT 1; 
SELECT CASE WHEN COUNT(*) > 0 THEN 'Yes' ELSE 'No' END AS attended FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer'; 
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / COUNT(event_id)) * 100 AS percentage_share FROM event WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'; 
SELECT e.cost FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE e.expense_description = 'Posters' AND ev.event_name = 'September Speaker'; 
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1; 
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE e.status = 'Closed'  AND b.remaining < 0  ORDER BY b.remaining  LIMIT 1; 
SELECT e.expense_description AS expense_type, SUM(e.cost) AS total_value FROM expense e JOIN budget b ON e.link_to_budget = b.budget_id JOIN event ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'October Meeting' AND e.approved = 'true' GROUP BY e.expense_description; 
SELECT b.category, SUM(b.amount) AS total_budgeted FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'April Speaker' GROUP BY b.category ORDER BY total_budgeted ASC; 
SELECT budget_id, amount  FROM budget  WHERE category = 'Food'  ORDER BY amount DESC  LIMIT 1; 
SELECT budget_id, amount  FROM budget  WHERE category = 'Advertisement'  ORDER BY amount DESC  LIMIT 3; 
SELECT SUM(cost) AS total_cost_spent FROM expense WHERE expense_description = 'Parking'; 
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20'; 
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.member_id; 
SELECT e.expense_description  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison'; 
SELECT e.expense_description  FROM expense e  JOIN member m ON e.link_to_member = m.member_id  WHERE m.t_shirt_size = 'X-Large'; 
SELECT m.zip FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50; 
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Phillip' AND mem.last_name = 'Cullen'; 
SELECT m.position  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name LIKE '%Business%'; 
SELECT COUNT(*)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name = 'Finance' AND m.t_shirt_size = 'Medium'; 
SELECT DISTINCT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30; 
SELECT type FROM event WHERE location = 'MU 215'; 
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00'; 
SELECT m.major_name  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.position = 'Vice President'; 
SELECT      (COUNT(CASE WHEN m.position = 'Member' AND m.link_to_major = (SELECT major_id FROM major WHERE major_name = 'Finance') THEN 1 END) / CAST(COUNT(m.member_id) AS REAL)) * 100 AS percentage FROM      member m; 
SELECT type FROM event WHERE location = 'MU 215'; 
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(*)  FROM member  WHERE position = 'Member' AND t_shirt_size = 'X-Large'; 
SELECT COUNT(*)  FROM major  WHERE college = 'College of Agriculture and Applied Sciences'  AND department = 'School of Applied Sciences, Technology and Education'; 
SELECT m.last_name, ma.department, ma.college FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'; 
SELECT b.category  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND b.spent = 0; 
SELECT m.zip, z.city, z.short_state FROM member m JOIN major ma ON m.link_to_major = ma.major_id JOIN zip_code z ON m.zip = z.zip_code WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member'; 
SELECT e.event_name  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.'; 
SELECT m.last_name, m.position  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10'; 
SELECT m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'Women''s Soccer' AND m.position = 'Member'; 
SELECT      (COUNT(CASE WHEN i.amount = 50 THEN 1 END) / COUNT(m.member_id::float)) * 100 AS percentage FROM      member m LEFT JOIN      income i ON m.member_id = i.link_to_member WHERE      m.t_shirt_size = 'Medium' AND m.position = 'Member'; 
SELECT state FROM zip_code WHERE type = 'PO Box'; 
SELECT zip_code  FROM zip_code  WHERE county = 'San Juan Municipio' AND state = 'Puerto Rico' AND type = 'PO Box'; 
SELECT event_name  FROM event  WHERE type = 'Game'    AND status = 'Closed'    AND event_date BETWEEN '2019-03-15' AND '2020-03-20'; 
SELECT DISTINCT a.link_to_event FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN income i ON i.link_to_member = m.member_id WHERE i.amount > 50; 
SELECT m.first_name, m.last_name, a.link_to_event  FROM member m  JOIN expense e ON m.member_id = e.link_to_member  JOIN attendance a ON m.member_id = a.link_to_member  WHERE e.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'; 
SELECT m.college  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Katy' AND mem.link_to_major = 'rec1N0upiVLy5esTO'; 
SELECT m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Agriculture and Applied Sciences' AND ma.major_name = 'Finance'; 
SELECT DISTINCT m.email FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.date_received BETWEEN '2019-09-10' AND '2019-11-19' AND i.amount > 20; 
SELECT COUNT(*)  FROM member m  JOIN major ma ON m.link_to_major = ma.major_id  WHERE ma.major_name LIKE '%education%' AND m.position = 'Member'; 
SELECT      (SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) / COUNT(e.event_id)) * 100 AS percentage_over_budget FROM      event e JOIN      budget b ON e.event_id = b.link_to_event; 
SELECT event_id, location, status  FROM event  WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'; 
SELECT expense_description  FROM expense  GROUP BY expense_description  HAVING AVG(cost) > 50; 
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'; 
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code)) * 100 AS percentage_po_boxes FROM zip_code; 
SELECT e.event_name, e.location FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 0; 
SELECT e.event_name, e.event_date FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense ex ON b.budget_id = ex.link_to_budget WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100; 
SELECT m.first_name, m.last_name, ma.major_name FROM member m JOIN expense e ON m.member_id = e.link_to_member JOIN major ma ON m.link_to_major = ma.major_id WHERE e.cost > 100; 
SELECT e.location, z.city, z.state  FROM event e  JOIN attendance a ON e.event_id = a.link_to_event  JOIN member m ON a.link_to_member = m.member_id  JOIN income i ON m.member_id = i.link_to_member  JOIN zip_code z ON m.zip = z.zip_code  GROUP BY e.event_id  HAVING COUNT(i.income_id) > 40; 
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING COUNT(DISTINCT e.expense_id) > 1 ORDER BY total_cost DESC LIMIT 1; 
SELECT AVG(amount) AS average_amount_paid FROM income i JOIN member m ON i.link_to_member = m.member_id WHERE m.position != 'Member'; 
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event JOIN expense x ON b.budget_id = x.link_to_budget WHERE x.expense_description = 'Parking' AND x.cost < (     SELECT AVG(x2.cost)     FROM expense x2     JOIN budget b2 ON x2.link_to_budget = b2.budget_id     WHERE b2.category = 'Parking' ) 
SELECT      (SUM(e.cost) / COUNT(DISTINCT ev.event_id)) * 100 AS percentage_cost FROM      expense e JOIN      budget b ON e.link_to_budget = b.budget_id JOIN      event ev ON b.link_to_event = ev.event_id WHERE      ev.type = 'Meeting'; 
SELECT b.budget_id, b.amount FROM budget b JOIN expense e ON b.budget_id = e.link_to_budget WHERE e.expense_description = 'Water, chips, cookies' ORDER BY e.cost DESC LIMIT 1; 
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_spent FROM member m JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id, m.first_name, m.last_name ORDER BY total_spent DESC LIMIT 5; 
SELECT m.first_name, m.last_name, m.phone FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > (SELECT AVG(cost) FROM expense) GROUP BY m.member_id; 
SELECT      SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(m.position) -      SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(m.position) AS difference FROM      member m JOIN      zip_code z ON m.zip = z.zip_code WHERE      m.position = 'Member'; 
SELECT m.major_name, m.department  FROM member AS mem  JOIN major AS m ON mem.link_to_major = m.major_id  WHERE mem.first_name = 'Garrett' AND mem.last_name = 'Gerke'; 
SELECT m.first_name, m.last_name, e.cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.expense_description = 'Water, Veggie tray, supplies'; 
SELECT m.last_name, m.phone FROM member m JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Elementary Education'; 
SELECT b.category, b.amount  FROM budget b  JOIN event e ON b.link_to_event = e.event_id  WHERE e.event_name = 'January Speaker'; 
SELECT e.event_name  FROM event e  JOIN budget b ON e.event_id = b.link_to_event  WHERE b.category = 'Food'; 
SELECT m.first_name, m.last_name, i.amount FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE DATE(i.date_received) = '2019-09-09'; 
SELECT b.category  FROM budget b  JOIN expense e ON b.budget_id = e.link_to_budget  WHERE e.expense_description = 'Posters'; 
SELECT m.first_name, m.last_name, ma.college  FROM member m  LEFT JOIN major ma ON m.link_to_major = ma.major_id  WHERE m.position = 'Secretary'; 
SELECT e.event_name, SUM(b.spent) AS total_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts' GROUP BY e.event_name; 
SELECT T3.city FROM member AS T1 JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke';
SELECT m.first_name, m.last_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND z.zip_code = 28092; 
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT      SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS ratio FROM      customers; 
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND y.Date BETWEEN '201201' AND '201212' GROUP BY c.CustomerID ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT AVG(y.Consumption) / 12 AS AvgMonthlyConsumption FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND y.Date BETWEEN '201301' AND '201312' 
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'CZK' AND y.Date BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY TotalConsumption DESC; 
SELECT COUNT(DISTINCT ym.CustomerID)  FROM yearmonth ym  JOIN customers c ON ym.CustomerID = c.CustomerID  WHERE c.Segment = 'KAM'  AND ym.Date BETWEEN '201201' AND '201212'  GROUP BY ym.CustomerID  HAVING SUM(ym.Consumption) < 30000; 
SELECT      SUM(CASE WHEN c.Currency = 'CZK' THEN y.Consumption ELSE 0 END) -     SUM(CASE WHEN c.Currency = 'EUR' THEN y.Consumption ELSE 0 END) AS Consumption_Difference FROM      yearmonth y JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      y.Date BETWEEN '201201' AND '201212'; 
SELECT strftime('%Y', Date) AS Year, SUM(Amount * Price) AS TotalUsage FROM transactions_1k AS T JOIN customers AS C ON T.CustomerID = C.CustomerID WHERE C.Currency = 'EUR' GROUP BY Year ORDER BY TotalUsage DESC LIMIT 1; 
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT LEFT(Date, 4) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'CZK' GROUP BY LEFT(Date, 4) ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT SUBSTR(t2.Date, 5, 2) AS Month, MAX(t2.Consumption) AS PeakConsumption FROM customers t1 JOIN yearmonth t2 ON t1.CustomerID = t2.CustomerID WHERE t1.Segment = 'SME' AND t2.Date BETWEEN '201301' AND '201312' GROUP BY SUBSTR(t2.Date, 5, 2) ORDER BY PeakConsumption DESC LIMIT 1; 
WITH filtered_customers AS (     SELECT c.CustomerID, c.Segment, SUM(y.Consumption) AS total_consumption     FROM customers c     JOIN yearmonth y ON c.CustomerID = y.CustomerID     WHERE y.Date BETWEEN '201301' AND '201312'     GROUP BY c.CustomerID, c.Segment ), min_consumption AS (     SELECT Segment, MIN(total_consumption) AS min_consumption     FROM filtered_customers     GROUP BY Segment ), segment_min_customers AS (     SELECT fc.Segment, COUNT(fc.CustomerID) AS num_customers, SUM(fc.total_consumption) AS total_segment_consumption     FROM filtered_customers fc     JOIN min_consumption mc ON fc.Segment = mc.Segment AND fc.total_consumption = mc.min_consumption     GROUP BY fc.Segment ), avg_consumption AS (     SELECT smc.Segment, smc.total_segment_consumption / smc.num_customers AS avg_annual_consumption     FROM segment_min_customers smc ) SELECT      (SELECT avg_annual_consumption FROM avg_consumption WHERE Segment = 'SME') - (SELECT avg_annual_consumption FROM avg_consumption WHERE Segment = 'LAM') AS diff_SME_LAM,     (SELECT avg_annual_consumption FROM avg_consumption WHERE Segment = 'LAM') - (SELECT avg_annual_consumption FROM avg_consumption WHERE Segment = 'KAM') AS diff_LAM_KAM,     (SELECT avg_annual_consumption FROM avg_consumption WHERE Segment = 'KAM') - (SELECT avg_annual_consumption FROM avg_consumption WHERE Segment = 'SME') AS diff_KAM_SME; 
SELECT Segment,         MAX(percentage_increase) AS max_percentage_increase,         MIN(percentage_increase) AS min_percentage_increase FROM (     SELECT c.Segment,             ((SUM(CASE WHEN SUBSTR(y.Date, 1, 4) = '2013' THEN y.Consumption ELSE 0 END) -               SUM(CASE WHEN SUBSTR(y.Date, 1, 4) = '2012' THEN y.Consumption ELSE 0 END)) /             SUM(CASE WHEN SUBSTR(y.Date, 1, 4) = '2013' THEN y.Consumption ELSE 0 END)) * 100 AS percentage_increase     FROM customers c     JOIN yearmonth y ON c.CustomerID = y.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY c.Segment ) AS segment_consumption GROUP BY Segment; 
SELECT SUM(Consumption)  FROM yearmonth  WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'; 
SELECT      (SUM(CASE WHEN g.Country = 'CZE' AND g.Segment = 'Value for money' THEN 1 ELSE 0 END) -       SUM(CASE WHEN g.Country = 'SVK' AND g.Segment = 'Value for money' THEN 1 ELSE 0 END)) AS more_discount_stations FROM      gasstations g; 
SELECT (t1.Consumption - t2.Consumption) AS Consumption_Difference FROM yearmonth t1 JOIN yearmonth t2 ON t1.Date = t2.Date WHERE t1.CustomerID = 7 AND t2.CustomerID = 5 AND t1.Date = '201304'; 
SELECT      SUM(CASE WHEN c.Currency = 'CZK' THEN 1 ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS more_SMEs_CZK FROM customers c WHERE c.Segment = 'SME'; 
SELECT c.CustomerID FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND ym.Date = '201310' ORDER BY ym.Consumption DESC LIMIT 1; 
SELECT c.CustomerID, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID GROUP BY c.CustomerID ORDER BY TotalConsumption DESC LIMIT 1; 
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID IN (     SELECT CustomerID     FROM customers     WHERE Segment = 'KAM' ) AND Date = '201305'; 
SELECT      (COUNT(CASE WHEN Consumption > 46.73 THEN CustomerID END) * 100.0 / COUNT(CustomerID)) AS Percentage FROM      yearmonth WHERE      CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM') 
SELECT Country, COUNT(*) AS ValueForMoneyCount FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country; 
SELECT      (COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) * 100.0 / COUNT(*)) AS Percentage_EUR FROM      customers WHERE      Segment = 'KAM'; 
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT CustomerID) FROM yearmonth)) AS percentage FROM      yearmonth WHERE      Date = '201202' AND Consumption > 528.3; 
SELECT      (COUNT(CASE WHEN g.Segment = 'Premium' THEN 1 END) * 100.0 / COUNT(g.GasStationID)) AS Percentage_Premium FROM      gasstations g WHERE      g.Country = 'SK'; 
SELECT CustomerID  FROM yearmonth  WHERE Date = '201309'  ORDER BY Consumption DESC  LIMIT 1; 
SELECT c.Segment, SUM(y.Consumption) AS TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1; 
SELECT c.CustomerID  FROM customers c  JOIN yearmonth y ON c.CustomerID = y.CustomerID  WHERE c.Segment = 'SME' AND y.Date = '201206'  ORDER BY y.Consumption ASC  LIMIT 1; 
SELECT MAX(Consumption)  FROM yearmonth  WHERE SUBSTR(Date, 1, 4) = '2012'; 
SELECT MAX(total_consumption / 12) AS biggest_monthly_consumption FROM (     SELECT c.CustomerID, SUM(y.Consumption) AS total_consumption     FROM customers c     JOIN yearmonth y ON c.CustomerID = y.CustomerID     WHERE c.Currency = 'EUR'     GROUP BY c.CustomerID ) 
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID WHERE strftime('%Y-%m', t.Date) = '2013-09' 
SELECT DISTINCT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE strftime('%Y-%m', t.Date) = '2013-06' 
SELECT DISTINCT g.ChainID FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'; 
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'; 
SELECT AVG(Price) AS AverageTotalPrice FROM transactions_1k WHERE Date LIKE '2012-01%'; 
SELECT COUNT(DISTINCT y.CustomerID) FROM yearmonth y JOIN customers c ON y.CustomerID = c.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000; 
SELECT DISTINCT p.Description FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'; 
SELECT DISTINCT Time  FROM transactions_1k AS t  JOIN gasstations AS g ON t.GasStationID = g.GasStationID  WHERE g.ChainID = 11; 
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE' AND t.Price > 1000; 
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE g.Country = 'CZE' AND t.Date > '2012-01-01'; 
SELECT AVG(Price) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'
SELECT AVG(total_price)  FROM (     SELECT CustomerID, SUM(Price) AS total_price      FROM transactions_1k      JOIN customers ON transactions_1k.CustomerID = customers.CustomerID      WHERE Currency = 'EUR'      GROUP BY CustomerID )
SELECT t.CustomerID, SUM(t.Price) AS TotalPaid FROM transactions_1k t WHERE DATE(t.Date) = '2012-08-25' GROUP BY t.CustomerID ORDER BY TotalPaid DESC LIMIT 1; 
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.Time LIMIT 1; 
SELECT c.Currency  FROM customers c  JOIN transactions_1k t ON c.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00'; 
SELECT c.Segment FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00'; 
SELECT COUNT(*)  FROM transactions_1k t  JOIN customers c ON t.CustomerID = c.CustomerID  WHERE c.Currency = 'CZK'  AND t.Date = '2012-08-26'  AND t.Time < '13:00:00'; 
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-24' AND t.Time = '12:42:00' 
SELECT ProductID  FROM transactions_1k  WHERE Date = '2012-08-23' AND Time = '21:20:00'; 
SELECT ym.Date, ym.Consumption  FROM yearmonth ym  JOIN transactions_1k t ON ym.CustomerID = t.CustomerID  WHERE t.Date = '2012-08-24' AND t.Price = 124.05 AND ym.Date LIKE '201201'; 
SELECT COUNT(*)  FROM transactions_1k t  JOIN gasstations g ON t.GasStationID = g.GasStationID  WHERE t.Date = '2012-08-26' AND t.Time BETWEEN '08:00:00' AND '09:00:00' AND g.Country = 'CZE'; 
SELECT Currency  FROM customers c JOIN yearmonth ym ON c.CustomerID = ym.CustomerID WHERE ym.Date = '201306' AND Consumption = 214582.17; 
SELECT g.Country FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.CardID = 667467 LIMIT 1; 
SELECT c.Segment FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Price = 548.4; 
SELECT      CAST(SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 AS Percentage FROM      customers c JOIN      transactions_1k t ON c.CustomerID = t.CustomerID WHERE      t.Date = '2012-08-25'; 
SELECT      ((SUM(CASE WHEN strftime('%Y', t.Date) = '2012' THEN y.Consumption ELSE 0 END) -        SUM(CASE WHEN strftime('%Y', t.Date) = '2013' THEN y.Consumption ELSE 0 END)) /      SUM(CASE WHEN strftime('%Y', t.Date) = '2012' THEN y.Consumption ELSE 0 END)) AS consumption_decrease_rate FROM      transactions_1k t JOIN      yearmonth y ON t.CustomerID = y.CustomerID WHERE      t.Price = 634.8 AND t.Date = '2012-08-25'; 
SELECT T.GasStationID, SUM(T.Price) AS TotalRevenue  FROM transactions_1k T  GROUP BY T.GasStationID  ORDER BY TotalRevenue DESC  LIMIT 1;
SELECT      (SUM(CASE WHEN g.Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0 / COUNT(g.Segment)) AS premium_percentage FROM      gasstations g WHERE      g.Country = 'SVK'; 
SELECT SUM(Price) AS TotalSpent FROM transactions_1k WHERE CustomerID = 38508;  SELECT SUM(Price) AS SpentInJanuary2012 FROM transactions_1k WHERE CustomerID = 38508 AND strftime('%Y%m', Date) = '201201'; 
SELECT p.Description, SUM(t.Amount) AS Total_Sold FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID, p.Description ORDER BY Total_Sold DESC LIMIT 5; 
SELECT c.CustomerID, AVG(t.Price * t.Amount / t.Amount) AS avg_price_per_item, c.Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(t.Price) DESC LIMIT 1; 
SELECT g.Country FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.ProductID = 2 ORDER BY t.Price DESC LIMIT 1; 
SELECT y.CustomerID, y.Consumption FROM yearmonth y JOIN transactions_1k t ON y.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND (t.Price / t.Amount) > 29.00 AND y.Date = '201208' 
