SELECT MAX("Percent (%) Eligible Free (K-12)") AS HighestEligibleFreeRate FROM frpm WHERE "County Name" = 'Alameda'; 
SELECT MIN(`Percent (%) Eligible Free (Ages 5-17)`) FROM frpm WHERE `School Type` = 'Continuation' LIMIT 3
SELECT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Fresno' AND T1.`Charter School (Y/N)` = 1
SELECT T2.MailStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.FRPM_Count_K_12 DESC LIMIT 1
SELECT T2.Phone FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F'; 
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 500 AND T2.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT SUM(T1.NumTstTakr) FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T2.`Percent (%) Eligible Free (K-12)` = ( SELECT MAX(`Percent (%) Eligible Free (K-12)`) FROM frpm )
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath > 560 AND T1.`Charter Funding Type` = 'Directly funded'
SELECT T1.`FRPM Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.rtype = 'S' ORDER BY T2.AvgScrRead DESC LIMIT 1
SELECT CDSCode FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500; 
SELECT MAX(f."Percent (%) Eligible Free (Ages 5-17)") AS MaxEligibleFreeRate FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE s.NumGE1500 * 1.0 / s.NumTstTakr > 0.3; 
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 0 ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr DESC LIMIT 3
SELECT T2.NCESDist FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T1.District FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.StatusType = 'Active' GROUP BY T1.District ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 1
SELECT COUNT(*) FROM satscores WHERE NumTstTakr < 100 AND cname = 'Alameda'; 
SELECT T1.CDSCode, T1.CharterNum FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite > 499 AND T1.CharterNum IS NOT NULL ORDER BY T2.AvgScrWrite DESC
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.City = 'Fresno' AND T1.NumTstTakr <= 250 AND T2.FundingType = 'Directly funded'
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT COUNT(*) FROM frpm WHERE County = 'Amador' AND Low_Grade = '9' AND High_Grade = '12'; 
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Percent (%) Eligible Free (K-12)` > 50 AND `Percent (%) Eligible Free (K-12)` < 70;
SELECT sname FROM satscores WHERE dname = 'Contra Costa County Office of Education' ORDER BY NumTstTakr DESC LIMIT 1
SELECT T2.School, T2.Street, T2.City, T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) > 30
SELECT T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Percent (%) Eligible Free (K-12)` > 0.1 AND T2.`Free Meal Count (K-12)` >= 1500
SELECT s.School, s.FundingType FROM schools s JOIN satscores st ON s.CDSCode = st.cds WHERE s.County = 'Riverside' AND AVG(st.AvgScrMath) > 400; 
SELECT T1.School, T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Monterey' AND T2.`Enrollment (Ages 5-17)` > 800 AND T2.`Percent (%) Eligible Free (Ages 5-17)` + T2.`Percent (%) Eligible FRPM (Ages 5-17)` > 0
SELECT T2.sname ,  T2.AvgScrWrite ,  T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.OpenDate > '1991-12-31' OR T1.ClosedDate < '2000-01-01'
SELECT s.School, s.DOCType FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Enrollment (K-12) - f.Enrollment (Ages 5-17) > (     SELECT AVG(f2.Enrollment (K-12) - f2.Enrollment (Ages 5-17))     FROM frpm f2     JOIN schools s2 ON f2.CDSCode = s2.CDSCode     WHERE s2.FundingType = 'Locally Funded' ) AND s.FundingType = 'Locally Funded'; 
SELECT T1.OpenDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.GSoffered = 'K-12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT T2.`Percent (%) Eligible Free (K-12)` FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.enroll12 DESC LIMIT 10, 1
SELECT T1.School, (T1.`FRPM Count (K-12)` / T1.`Enrollment (K-12)`) AS `Eligible Free or Reduced Price Meal Rate` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Ownership = 66 AND T1.HighGrade = '12' ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 5; 
SELECT T1.Website, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT (SUM(T1.`Free Meal Count (Ages 5-17)`) / SUM(T1.`Enrollment (Ages 5-17)`)) AS FreeRate FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Kacey Gibson'; 
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1
SELECT T1.AdmFName1, T1.AdmLName1, T1.AdmFName2, T1.AdmLName2, T1.AdmFName3, T1.AdmLName3 FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores )
SELECT T2.Street, T2.City, T2.State, T2.Zip FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr ASC LIMIT 1
SELECT T2.Website FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr BETWEEN 2000 AND 3000
SELECT AVG(s.NumTstTakr) FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.City = 'Fresno' AND strftime('%Y', sc.OpenDate) = '1980'; 
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT s.School, AVG(ss.AvgScrRead) AS AvgReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY s.County, AvgReadingScore DESC LIMIT 5; 
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT AVG(AvgScrMath), T2.County FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL AND T1.AvgScrRead IS NOT NULL AND T1.AvgScrWrite IS NOT NULL ORDER BY (T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite) ASC LIMIT 1; 
SELECT AVG(AvgScrWrite), T2.City FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE NumGE1500 > 0 GROUP BY T2.City ORDER BY SUM(NumGE1500) DESC LIMIT 1
SELECT s.School, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School
SELECT T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.DOC = 31 AND T2.enroll12 IS NOT NULL ORDER BY T2.enroll12 DESC LIMIT 1; 
SELECT COUNT(CDSCode) / 12 AS AvgMonthlyOpened FROM schools WHERE OpenDate LIKE '1980%' AND DOC = 52; 
SELECT SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE County = 'Orange' AND StatusType = 'Merged'
SELECT T1.County, T1.School, T1.ClosedDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T1.County ORDER BY COUNT(T1.School) DESC LIMIT 1
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 6, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite >= 1500 AND T2.MailCity = 'Lakeport'
SELECT SUM(NumTstTakr) AS TotalTestTakers FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Fresno'; 
SELECT T2.School, T2.MailZip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Avetik' AND T2.AdmLName1 = 'Atoian'
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE MailState = 'CA'; 
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND City = 'San Jose' AND StatusType = 'Active'; 
SELECT T2.Phone, T2.Ext FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 332, 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' OR AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez';
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin'
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1; 
SELECT COUNT(*) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T2.Charter = 0 AND (T1.`Free Meal Count (K-12)` * 100 / T1.`Enrollment (K-12)`) < 0.18; 
SELECT T1.School, T1.City, T1.AdmFName1, T1.AdmLName1, T1.AdmFName2, T1.AdmLName2, T1.AdmFName3, T1.AdmLName3 FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T1.CharterNum = '00D2'
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4';
SELECT CAST(SUM(CASE WHEN T1.FundingType = 'Locally Funded' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Santa Clara'
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND County = 'Stanislaus';
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate BETWEEN '1989-01-01' AND '1989-12-31'; 
SELECT s.County, COUNT(s.CDSCode) AS ClosedSchoolCount FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.SOC = '11' AND s.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY s.County ORDER BY ClosedSchoolCount DESC LIMIT 1; 
SELECT NCESDist FROM schools WHERE SOC = 31
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') AND DOC = 'District Community Day School'; 
SELECT District FROM schools WHERE City = 'Fresno' AND Magnet = 0 LIMIT 1
SELECT SUM(`Enrollment (Ages 5-17)`) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'State Special School' AND T2.City = 'Fremont' AND T1.`Academic Year` = '2014-2015' AND T2.EdOpsCode = 'SSS'
SELECT T1.`Free Meal Count (Ages 5-17)` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority' AND T2.MailStreet = 'PO Box 1040'
SELECT MIN(LowGrade) AS LowestGrade FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.NCESDist = '0613360' AND schools.EdOpsCode = 'SPECON'; 
SELECT T2.School ,  T1.EducationalOptionType FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter Funding Type` = 'Breakfast Provision 2' AND T2.`County Code` = 37
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.School Type = 'High Schools (Public)' AND T1.Low Grade = '9' AND T1.High Grade = '12' AND T2.County = 'Merced' AND T2.EILCode = 'HS'
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)` * 100) AS "Percent (%) Eligible FRPM (Ages 5-17)" FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND f.LowGrade = 'K' AND f.HighGrade = '9'; 
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS NumberOfVirtualSchools FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F'; 
SELECT T1.School, T1.Latitude, T1.Longitude FROM schools AS T1 ORDER BY T1.Latitude DESC LIMIT 1
SELECT T1.City, T1.School, MIN(T1.Latitude), MIN(T2.LowGrade) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA'
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1
SELECT COUNT(T1.CDSCode), T1.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Magnet = 1 AND T1.GSserved = 'K-8' AND T2.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY T1.City
SELECT AdmFName1, District FROM schools GROUP BY AdmFName1, District ORDER BY COUNT(*) DESC LIMIT 2
SELECT T1.`Percent (%) Eligible Free (K-12)`, T2.District FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`AdmFName1` = 'Alusine'
SELECT T1.AdmLName1, T2.District, T2.County, T2.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterNum = '40'; 
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54);
SELECT T1.AdmEmail1, T1.School FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumGE1500 DESC LIMIT 1; 
SELECT COUNT(account_id) FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A3 = 'East Bohemia' ) AND date > ( SELECT MIN(date) FROM trans ); 
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' AND T1.account_id IN ( SELECT account_id FROM loan )
SELECT AVG(A12) AS avg_1995, AVG(A13) AS avg_1996 FROM district WHERE A12 IS NOT NULL AND A13 IS NOT NULL
SELECT COUNT(*) FROM district WHERE A11 > 6000 AND A11 < 10000
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A3 LIKE '%North Bohemia%' AND T2.A11 > 8000
SELECT AVG(T1.A11) - MIN(AVG(T1.A11)) AS gap FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T2.client_id ORDER BY MAX(T2.birth_date) DESC LIMIT 1; 
SELECT T1.account_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id GROUP BY T1.account_id ORDER BY AVG(T2.birth_date) DESC LIMIT 1
SELECT COUNT(*) FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK TYDNE' AND T1.type = 'OWNER'
SELECT T1.client_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'DISPONENT' AND T2.frequency = 'POPLATEK PO OBRATU'
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) = '1997' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 12 AND strftime('%Y', T2.date) = '1993' ORDER BY T1.amount DESC LIMIT 1
SELECT COUNT(client.client_id) FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.A2 = 'Sokolov'; 
SELECT account_id FROM trans WHERE STRFTIME('%Y', date) = '1995' ORDER BY date ASC LIMIT 1
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T2.amount > 3000
SELECT T1.client_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.issued LIKE '1994-03-03%'
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.`date` = '1998-10-14'
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25'
SELECT MAX(t.amount) FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE d.disp_id IN ( SELECT disp_id FROM card WHERE issued = '1996-10-21' )
SELECT T2.gender FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id ORDER BY T1.A11 DESC LIMIT 1
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.account_id = (     SELECT l.account_id     FROM loan l     ORDER BY l.amount DESC     LIMIT 1 ) ORDER BY t.date ASC LIMIT 1; 
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.date LIKE '%Jesenik%' AND T1.gender = 'F'
SELECT T1.disp_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND STRFTIME('%Y-%m-%d', T3.date) = '1998-09-02'
SELECT COUNT(account_id) FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A2 = 'Litomerice' ) AND strftime('%Y', date) = '1996'
SELECT T1.A2 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T2.birth_date = '1976-01-29'
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T4.amount = 98832 AND T4.date LIKE '1996-01-03%'
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date LIMIT 1
SELECT CAST(SUM(IIF(T1.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 LIKE '%south Bohemia%' ORDER BY T2.A4 DESC LIMIT 1
SELECT ((T2.balance - T3.balance) / T3.balance) * 100 AS increase_rate FROM loan AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T1.date = '1993-07-05' AND T2.date = '1993-03-22' AND T3.date = '1998-12-27'
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000
SELECT T1.account_id, T3.A2, T3.A3 FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE STRFTIME('%Y', T1.date) = '1993' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T2.account_id ,  T2.frequency FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A5 BETWEEN 1 AND 2 AND T2.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T1.A2, T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.loan_id = 4990
SELECT T1.account_id ,  T3.A2 ,  T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000
SELECT T1.loan_id ,  T2.A3 ,  AVG(T2.A11) FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id
SELECT T2.A12 ,  T2.A13 ,  ((T2.A13 - T2.A12) / T2.A12) * 100 FROM loan AS T1 INNER JOIN district AS T2 ON T1.account_id = T2.district_id WHERE T1.status = 'D'
SELECT CAST(SUM(CASE WHEN T1.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T2.date) = '1993'; 
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.A2 ORDER BY COUNT(T1.client_id) DESC LIMIT 9
SELECT T1.A2, SUM(T3.amount) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.date LIKE '1996-01%' AND T3.type = 'VYDAJ' GROUP BY T1.A2 ORDER BY SUM(T3.amount) DESC LIMIT 10
SELECT COUNT(*) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 = 'South Bohemia' AND T2.type != 'OWNER'
SELECT T1.A3 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status IN ('C', 'D') GROUP BY T1.A3 ORDER BY COUNT(T3.loan_id) DESC LIMIT 1
SELECT AVG(loan.amount) FROM loan JOIN disp ON loan.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M'
SELECT T1.A2 FROM district AS T1 WHERE T1.A13 = ( SELECT MAX(A13) FROM district )
SELECT COUNT(account_id) AS num_accounts_opened FROM account WHERE district_id = (     SELECT district_id     FROM district     ORDER BY A16 DESC     LIMIT 1 ) AND date LIKE '1996%'; 
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T2.frequency = 'POPLATEK MESICNE' AND T1.balance < 0
SELECT COUNT(*) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date BETWEEN '1995-01-01' AND '1997-12-31' AND T1.amount >= 250000 AND T2.frequency = 'POPLATEK MESICNE' AND T1.status = 'A'
SELECT COUNT(*) FROM loan WHERE status IN ('C', 'D') AND account_id IN ( SELECT account_id FROM account WHERE district_id = 1 )
SELECT COUNT(client_id) FROM client WHERE district_id IN ( SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1, 1 ) AND gender = 'M'
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'
SELECT COUNT(account_id) FROM account WHERE district_id = ( SELECT district_id FROM district WHERE A2 = 'Pisek' )
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount > 10000 AND strftime('%Y', T3.date) = '1997' GROUP BY T1.A2
SELECT T1.account_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'SIPO' AND T2.district_id IN ( SELECT district_id FROM district WHERE A3 = 'Pisek' )
SELECT T1.account_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'
SELECT AVG(amount) AS avg_credit_card_amount FROM trans WHERE type = 'VYBER KARTOU' AND date BETWEEN '2021-01-01' AND '2021-12-31'; 
SELECT T1.account_id FROM disp AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.operation = 'VYBER KARTOU' AND T2.amount < ( SELECT AVG(amount) FROM trans WHERE STRFTIME('%Y', date) = '1998' )
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id INNER JOIN loan AS T4 ON T2.account_id = T4.account_id WHERE T1.gender = 'F' AND T3.type = 'gold' OR T3.type = 'classic'
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A3 LIKE '%south Bohemia%'
SELECT DISTINCT T1.account_id FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A2 = 'Tabor' AND T1.type = 'OWNER'
SELECT T1.type FROM card AS T1 JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T1.type NOT IN ( SELECT T1.type FROM card AS T1 JOIN disp AS T2 ON T1.card_id = T2.card_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T2.type = 'OWNER' ) AND T3.district_id IN ( SELECT district_id FROM district WHERE A11 BETWEEN 8000 AND 9000 )
SELECT COUNT(DISTINCT T1.account_id) FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'North Bohemia' AND T1.bank = 'AB'
SELECT T3.A2 FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(T2.A15) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A15 > 4000 AND T1.date LIKE '1997%'
SELECT COUNT(*) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'
SELECT COUNT(client_id) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha')
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER' AND T2.account_id IN (SELECT account_id FROM loan ORDER BY amount DESC LIMIT 1)
SELECT T1.A15 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532
SELECT T2.district_id FROM `order` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 3356) AND operation = 'VYBER';
SELECT COUNT(DISTINCT T2.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000
SELECT T2.type FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 13539
SELECT T1.A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541
SELECT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(T3.loan_id) DESC LIMIT 1
SELECT client_id FROM disp WHERE account_id = (SELECT account_id FROM `order` WHERE order_id = 32423)
SELECT T1.trans_id, T1.date, T1.type, T1.operation, T1.amount, T1.balance, T1.k_symbol, T1.bank, T1.account FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 5
SELECT COUNT(account_id) FROM account WHERE district_id IN ( SELECT district_id FROM district WHERE A3 = 'Jesenik' )
SELECT T1.client_id FROM disp AS T1 INNER JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'junior' AND T2.issued >= '1997-01-01'
SELECT SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) * 100 / COUNT(*) FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.date <= ( SELECT AVG(date) FROM account )
SELECT ((SUM(CASE WHEN T1.date LIKE '1997%' THEN T1.amount ELSE 0 END) - SUM(CASE WHEN T1.date LIKE '1996%' THEN T1.amount ELSE 0 END)) / SUM(CASE WHEN T1.date LIKE '1996%' THEN T1.amount ELSE 0 END)) * 100 AS growth_rate FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'; 
SELECT SUM(CASE WHEN T1.A3 = 'East Bohemia' THEN T1.A16 ELSE 0 END) - SUM(CASE WHEN T1.A3 = 'North Bohemia' THEN T1.A16 ELSE 0 END) AS CrimeDifference FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T2.date) = '1996'
SELECT type ,  COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type
SELECT T1.date, T1.k_symbol FROM trans AS T1 WHERE T1.account_id = 3 AND T1.amount = -3539; 
SELECT T1.birth_date FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.disp_id = 130
SELECT COUNT(*) FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU'
SELECT SUM(loan.amount - loan.payments) AS total_debt, AVG(loan.payments / loan.amount) AS payment_ratio FROM loan JOIN disp ON loan.account_id = disp.account_id WHERE disp.client_id = 992
SELECT SUM(T1.amount), T3.gender FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T1.trans_id = 851 AND T3.client_id = 4
SELECT T1.type FROM card AS T1 INNER JOIN disp AS T2 ON T1.card_id = T2.card_id WHERE T2.client_id = 9 AND T1.type LIKE '%credit%'
SELECT SUM(amount) FROM trans WHERE account_id IN (SELECT account_id FROM disp WHERE client_id = 617) AND date LIKE '1998%'
SELECT T2.client_id FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T1.A3 LIKE '%East Bohemia%'
SELECT T1.client_id FROM client AS T1 INNER JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' ORDER BY T2.amount DESC LIMIT 3
SELECT COUNT(*) FROM client AS c JOIN disp AS d ON c.client_id = d.client_id JOIN trans AS t ON d.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'UTRANEC' AND t.amount > 4000; 
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Beroun' AND T1.date > '1996-12-31'
SELECT COUNT(*) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.gender = 'F' AND T3.type = 'junior'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'Prague'
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.client_id = T2.district_id WHERE T2.frequency = 'POPLATEK TYDNE'
SELECT COUNT(DISTINCT T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' ORDER BY T2.amount LIMIT 1
SELECT T1.account_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T3.A11) ASC LIMIT 1
SELECT COUNT(client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.birth_date) = '1920' AND T2.A3 LIKE '%East Bohemia%'
SELECT COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration = 24 AND T1.frequency = 'POPLATEK TYDNE'; 
SELECT AVG(T2.amount) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.status IN ('C', 'D') AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T1.client_id ,  T1.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER'
SELECT T2.client_id ,  julianday('now') - julianday(T1.birth_date) AS age FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold' AND T2.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.molecule_id) AS count_of_molecules FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'; 
SELECT AVG(CASE WHEN T3.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '-'
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) / COUNT(T2.atom_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.label = '+'
SELECT COUNT(*) FROM atom WHERE element = 'na' AND molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' )
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+'
SELECT CAST(COUNT(CASE WHEN T3.element = 'c' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'; 
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'
SELECT DISTINCT T3.element FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '='
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT T3.atom_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.label = '-'
SELECT T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T2.element ORDER BY COUNT(T2.element) ASC LIMIT 1
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8') 
SELECT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element = 'sn' )
SELECT COUNT(DISTINCT T2.atom_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE (T2.element = 'i' OR T2.element = 's') AND T3.bond_type = '-'
SELECT T1.atom_id, T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT DISTINCT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR181'; 
SELECT CAST(SUM(CASE WHEN T2.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '#' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR000' GROUP BY element ORDER BY COUNT(*) DESC LIMIT 3
SELECT atom.element FROM atom JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_2_6' AND atom.molecule_id = 'TR001'; 
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' ORDER BY T1.label LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM atom WHERE molecule_id = 'TR206'
SELECT DISTINCT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT T2.element, T3.label FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.molecule_id = 'TR060'; 
SELECT T1.bond_type ,  IIF(SUM(CASE WHEN T1.molecule_id = 'TR010' THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.molecule_id != 'TR010' THEN 1 ELSE 0 END), 'Yes', 'No') AS is_carcinogenic FROM bond AS T1 GROUP BY T1.bond_type ORDER BY COUNT(T1.bond_type) DESC LIMIT 1
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.bond_id) = 1 ORDER BY T1.molecule_id LIMIT 3
SELECT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type ASC LIMIT 2
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009'); 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'
SELECT T2.bond_type, T1.atom_id AS atom1, T1.atom_id2 AS atom2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'; 
SELECT T1.label ,  CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS Carcinogenicity FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_10'
SELECT COUNT(*) FROM bond WHERE bond_type = '#';
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';
SELECT element FROM atom WHERE molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'; 
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T2.label = '+'
SELECT b.bond_id FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p'); 
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = ' = ' AND T1.label = '+' ORDER BY ( SELECT COUNT(*) FROM connected AS T3 INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T4.bond_type = ' = ' AND T3.atom_id = T2.atom_id ) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.element = 'i' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id
SELECT T1.bond_type, T1.bond_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T2.atom_id2, 7, 2) AS INT) = 45 OR CAST(SUBSTR(T2.atom_id, 7, 2) AS INT) = 45
SELECT element FROM atom WHERE atom_id NOT IN ( SELECT atom_id FROM connected )
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR041' AND T3.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'; 
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.label ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT element FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT CAST(COUNT(*) AS REAL) * 100 / ( SELECT MAX(cnt) FROM ( SELECT COUNT(atom_id) AS cnt FROM atom GROUP BY molecule_id ) ) FROM bond WHERE molecule_id IN ( SELECT molecule_id FROM atom GROUP BY molecule_id HAVING COUNT(DISTINCT element) = 2 ) 
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')
SELECT T1.atom_id2 FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'sn'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT COUNT(DISTINCT T1.atom_id) AS total_atoms FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE (T1.element = 'p' OR T1.element = 'br') AND T3.bond_type = '#'; 
SELECT T2.bond_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label != '-'
SELECT CAST(SUM(CASE WHEN T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'; 
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'; 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'
SELECT MAX(T3.label) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'ca'
SELECT CASE WHEN EXISTS ( SELECT 1 FROM atom WHERE element = 'cl' AND atom_id IN ( SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8' ) ) AND EXISTS ( SELECT 1 FROM atom WHERE element = 'c' AND atom_id IN ( SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8' ) ) THEN 'Yes' ELSE 'No' END AS result
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '-' AND EXISTS ( SELECT 1 FROM atom AS T3 WHERE T3.molecule_id = T1.molecule_id AND T3.element = 'c' ) LIMIT 2
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR001'; 
SELECT molecule_id FROM bond WHERE bond_type = '= ';
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(DISTINCT b.molecule_id) AS non_carcinogenic_single_bond_molecules FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT T1.bond_id ,  T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '+'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND SUBSTR(T1.atom_id, 7, 1) = '4' GROUP BY T1.element
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element) AS ratio, T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' 
SELECT CASE WHEN EXISTS ( SELECT 1 FROM atom WHERE element = 'ca' AND molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' ) ) THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS result
SELECT T2.bond_type FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_10_11'
SELECT CAST(SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR047'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1' AND T1.label = '+'
SELECT CASE WHEN EXISTS (SELECT 1 FROM molecule WHERE molecule_id = 'TR151' AND label = '+') THEN 'Yes' ELSE 'No' END AS carcinogenicity; 
SELECT T.element FROM atom AS T WHERE T.molecule_id = 'TR151'; 
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR010' AND 'TR050' AND T1.element = 'c'
SELECT COUNT(*) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '+' )
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '='
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' AND T2.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR000_1_2' AND T1.label = '+'
SELECT atom_id FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM molecule WHERE label = '-' ) AND element = 'c'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS carcinogenic FROM molecule WHERE molecule_id = 'TR124'
SELECT element FROM atom WHERE molecule_id = 'TR186'; 
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'
SELECT COUNT(*) AS double_bonds, CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' AND T2.bond_type = ' = ';
SELECT T1.label, T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IN ('cl', 'c', 'h')
SELECT T1.bond_id, T2.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'
