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
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*) FROM atom WHERE element = 'cl' AND molecule_id IN ( SELECT molecule_id FROM bond )
SELECT T1.atom_id, COUNT(DISTINCT T2.bond_type) AS bond_count FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id; 
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '= ' ) AND label = '+'
SELECT COUNT(*) FROM molecule WHERE molecule_id NOT IN ( SELECT T1.molecule_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 's' OR T3.bond_type = ' = ' )
SELECT T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4' AND T1.label = '+'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'; 
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'
SELECT T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label != '-'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id; 
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(element) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM connected WHERE bond_id = 'TR001_3_4' )
SELECT T1.bond_type FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR000_1' AND T2.atom_id2 = 'TR000_2') OR (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_1')
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id IN ('TR000_2', 'TR000_4') 
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT CASE WHEN T1.label = '+' THEN 'Carcinogenic' ELSE 'Non-Carcinogenic' END AS carcinogenicity FROM molecule AS T1 WHERE T1.molecule_id = 'TR000'
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond; 
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+'
SELECT m.label FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '='; 
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR024' AND b.bond_type = '='; 
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.label ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.element = 'h' AND T1.bond_id IN ( SELECT bond_id FROM bond WHERE bond_type = '#' ) 
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-'); 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'; 
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = ' = ' )
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '-'
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' AND T3.bond_type = ' = ' AND T1.molecule_id = 'TR012'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT name FROM cards WHERE borderColor = 'black' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL
SELECT name FROM cards WHERE faceConvertedManaCost = ( SELECT MAX(faceConvertedManaCost) FROM cards ); 
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015';
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Banned' AND T2.format = 'gladiator'
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.types = 'Artifact' AND T2.side IS NULL AND T1.format = 'vintage'
SELECT T1.id, T1.artist FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'Legal' AND (T1.power = '*' OR T1.power IS NULL)
SELECT T1.id FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Stephen Daniel' AND T1.hasContentWarning = 1
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Sublime Epiphany' AND T2.number = '74s'
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.id ORDER BY COUNT(T2.uuid) DESC LIMIT 1
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM foreign_data; 
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'; 
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE power = '*';
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT T3.language FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isTextless = 0
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'restricted' AND T1.isStarter = 1
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Cloudchaser Eagle'; 
SELECT type FROM cards WHERE name = 'Benalish Knight';
SELECT T1.format FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Benalish Knight'
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT COUNT(*) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'German' AND T2.isReprint = 1
SELECT COUNT(*) FROM foreign_data WHERE language = 'Russian' AND uuid IN ( SELECT uuid FROM cards WHERE borderColor = 'borderless' )
SELECT CAST(SUM(CASE WHEN T1.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.isStorySpotlight = 1; 
SELECT COUNT(*) FROM cards WHERE toughness = 99;
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%'; 
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel';
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white';
SELECT T1.uuid, T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T3.format = 'legacy'
SELECT text FROM rulings WHERE uuid IN ( SELECT uuid FROM cards WHERE name = 'Beacon of Immortality' )
SELECT COUNT(*) AS card_count FROM cards WHERE frameVersion = 'future' AND uuid IN ( SELECT uuid FROM legalities WHERE status = 'legal' )
SELECT name, colorIdentity FROM cards WHERE setCode = 'OGW';
SELECT T1.name, T2.language FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.convertedManaCost = 5 AND T2.setCode = '10E'
SELECT T1.name, T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT T1.colors ,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B' AND T2.language IS NOT NULL
SELECT T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND hasFoil = 1 AND cardKingdomFoilId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE artist LIKE '%UDON%' AND availability = 'mtgo' AND hand = -1;
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1; 
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability = 'mtgo,paper'; 
SELECT SUM(REPLACE(manaCost, '[', '') - REPLACE(manaCost, ']', '')) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander'; 
SELECT DISTINCT subtype FROM cards WHERE availability = 'arena' UNION SELECT DISTINCT supertype FROM cards WHERE availability = 'arena'
SELECT DISTINCT T1.setCode FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) , id FROM cards WHERE isStorySpotlight = 1 GROUP BY id
SELECT CAST(SUM(CASE WHEN language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) ,  name FROM foreign_data GROUP BY name
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 309
SELECT COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Portuguese (Brazil)' AND s.block = 'Commander'; 
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal')
SELECT T2.subtypes, T2.supertypes FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'German' AND T2.subtypes IS NOT NULL AND T2.supertypes IS NOT NULL GROUP BY T2.subtypes, T2.supertypes
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'; 
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'premodern' AND T1.text LIKE '%This is a triggered mana ability.%' AND T1.side IS NULL
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN ( SELECT uuid FROM legalities WHERE format = 'pauper' )
SELECT artist FROM cards WHERE text LIKE '%perfekte Gegenmittel zu einer dichten Formation%'
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T2.language = 'French' AND T1.type = 'Creature' AND T1.layout = 'normal' AND T1.borderColor = 'black'; 
SELECT COUNT(*) FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.date = '2007-02-01' AND T2.rarity = 'rare'
SELECT T1.language FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.baseSetSize = 180 AND T2.block = 'Ravnica'
SELECT CAST(SUM(CASE WHEN T2.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'commander' AND T1.Status = 'legal'
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'
SELECT CAST(SUM(CASE WHEN T2.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.type = 'expansion'
SELECT DISTINCT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arena%' ORDER BY name LIMIT 3
SELECT language FROM foreign_data WHERE multiverseid = 149934;
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT number FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3
SELECT DISTINCT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.code = 'ARC'
SELECT T1.name ,  T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 5
SELECT T1.language, T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.id = 206;
SELECT T1.id FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' ORDER BY T1.name LIMIT 2
SELECT T1.id FROM sets AS T1 INNER JOIN foreign_data AS T2 ON T1.code = T2.language WHERE T1.isForeignOnly = 1 AND T1.isFoilOnly = 1 AND T2.language = 'Japanese'
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isOnlineOnly = 1
SELECT COUNT(*) FROM sets WHERE code IN (     SELECT setCode FROM set_translations WHERE language = 'Japanese' ) AND (mtgoCode IS NULL OR mtgoCode = ''); 
SELECT id FROM cards WHERE borderColor = 'black';
SELECT id FROM cards WHERE frameEffects = 'extendedart'; 
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174
SELECT name FROM sets WHERE code = 'ALL'
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT setCode FROM sets WHERE type = 'expansion';
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Boros'
SELECT T1.language, T1.flavorText, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'colorpie'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'
SELECT setCode FROM sets WHERE type = 'expansion' AND contains('Commander')
SELECT T1.name, T1.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'
SELECT T1.language, T3.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN cards AS T3 ON T2.id = T3.id WHERE T2.watermark = 'Azorius' LIMIT 1
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT T1.purchaseUrls FROM cards AS T1 WHERE T1.promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT COUNT(*) FROM foreign_data WHERE uuid IN ( SELECT uuid FROM cards WHERE name = 'Angel of Mercy' )
SELECT T1.name FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT EXISTS(SELECT 1 FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND language = 'Korean')
SELECT COUNT(*) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition' AND T1.artist = 'Adam Rex'; 
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT T1.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Angel of Mercy' AND T1.mtgoCode IS NOT NULL
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Ancestor''s Chosen'
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(DISTINCT s.id) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL; 
SELECT T1.isForeignOnly FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Adarkar Valkyrie'
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.baseSetSize < 100
SELECT COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' ) AND borderColor = 'black'
SELECT T1.name FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT DISTINCT artist FROM cards WHERE setCode = ( SELECT code FROM sets WHERE name = 'Coldsnap' ) AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT number FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' ) AND number = 4
SELECT COUNT(*) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.setCode = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
SELECT T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Italian' AND T1.name = 'Ancestor''s Chosen'
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'
SELECT T1.text FROM rulings AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN cards AS T3 ON T2.uuid = T3.uuid INNER JOIN sets AS T4 ON T3.setCode = T4.code WHERE T4.name = 'Coldsnap' AND T2.language = 'Italian'
SELECT T1.name  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  JOIN sets AS T3 ON T1.setCode = T3.code  WHERE T3.name = 'Coldsnap' AND T2.language = 'Italian'  ORDER BY T1.convertedManaCost DESC LIMIT 1; 
SELECT T1.date FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN T2.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE name = 'Coldsnap'; 
SELECT code FROM sets WHERE releaseDate = '2017-07-14'; 
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';
SELECT TYPE FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT c.name, r.text, c.hasContentWarning  FROM cards c  JOIN rulings r ON c.uuid = r.uuid  WHERE c.artist = 'Jim Pavelec'; 
SELECT T1.releaseDate FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'
SELECT T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'French' AND T2.name LIKE '%Tendo Ice Bridge%'
SELECT COUNT(*) FROM set_translations WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Tenth Edition' ) AND translation IS NOT NULL
SELECT T3.translation FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T3.setCode = T1.setCode WHERE T2.name = 'Fellwar Stone' AND T2.language = 'Japanese'
SELECT name FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Journey into Nyx Hero''s Path') ORDER BY convertedManaCost DESC LIMIT 1; 
SELECT T2.releaseDate FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Ola de frío'
SELECT T1.type FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3;
SELECT T1.translation FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Mirrodin' AND T1.language = 'Chinese Simplified'; 
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'; 
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Portuguese (Brazil)'
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'; 
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY T1.manaCost DESC LIMIT 10
SELECT T1.originalReleaseDate, GROUP_CONCAT(DISTINCT T2.format) AS legal_formats FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' ORDER BY T1.originalReleaseDate ASC LIMIT 1
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'
SELECT COUNT(*) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Abundance' AND T1.types = 'Enchantment' AND T1.rarity = 'rare' AND T2.status = 'Legal'; 
SELECT format, GROUP_CONCAT(name) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE status = 'Banned' GROUP BY format ORDER BY COUNT(status = 'Banned') DESC LIMIT 1
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'; 
SELECT artist, GROUP_CONCAT(DISTINCT format) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.status FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.frameVersion = '1997' AND T2.artist = 'D. Alexander Gregory' AND T2.hasContentWarning = 1 AND T1.format = 'legacy'
SELECT T1.name, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'
SELECT AVG(T1.id), T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena' GROUP BY artist;
SELECT T1.uuid FROM legalities AS T1 JOIN sets AS T2 ON T1.set_code = T2.code WHERE T2.name LIKE '%Old School%' AND T1.status IN ('banned', 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'; 
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.artist = 'Kev Walker' ORDER BY T1.date DESC
SELECT T1.name ,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T3.name = 'Hour of Devastation' AND T2.status = 'Legal'
SELECT T1.name FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language LIKE '%Korean%' AND T2.language NOT LIKE '%Japanese%'
SELECT T1.frameVersion, T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' UNION SELECT T1.status, T2.name FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Banned'
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1; 
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1; 
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1; 
SELECT COUNT(Id) FROM users WHERE CreationDate LIKE '2014%' AND Views > 10
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'; 
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT OwnerDisplayName FROM posts WHERE Title = 'Eliciting priors from experts'
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT SUM(T1.CommentCount) AS TotalComments FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'; 
SELECT MAX(T2.AnswerCount) AS MaxAnswers FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'; 
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL; 
SELECT DISTINCT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20; 
SELECT T1.Location FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Eliciting priors from experts'
SELECT Body FROM posts WHERE Id = ( SELECT ExcerptPostId FROM tags WHERE TagName = 'bayesian' )
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.Count = ( SELECT MAX(Count) FROM tags )
SELECT COUNT(Id) FROM badges WHERE UserId IN ( SELECT Id FROM users WHERE DisplayName = 'csgillespie' )
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT COUNT(*) FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND STRFTIME('%Y', Date) = '2011'; 
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1)
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'; 
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(DISTINCT T2.DisplayName) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'; 
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'; 
SELECT p.Title FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.Score = ( SELECT MAX(Score) FROM comments )
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910)
SELECT FavoriteCount FROM posts WHERE Id = (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0') 
SELECT Text FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ParentId = 107829 AND CommentCount = 1) LIMIT 1
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'; 
SELECT Reputation FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Id = 65041)
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Tiago Pasqualini'; 
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms') 
SELECT CAST(COUNT(posts.Id) AS REAL) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN votes ON posts.OwnerUserId = votes.UserId AND posts.Id = votes.PostId WHERE posts.OwnerUserId = 24; 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'; 
SELECT UserDisplayName FROM comments WHERE Text = 'thank you user93!'
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion'; 
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Understanding what Dassault iSight is doing?'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Necromancer' LIMIT 10
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Open source tools for visualizing multi-dimensional data?'
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'
SELECT SUM(T1.Score) AS TotalScore, T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Yevgeny'
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'; 
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%' AND T2.VoteTypeId = 8
SELECT u.DisplayName FROM users AS u JOIN votes AS v ON u.Id = v.UserId JOIN posts AS p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT AVG(T1.ViewCount), T1.Title, T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Tags LIKE '%<humor>%';
SELECT COUNT(*) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT OwnerUserId FROM posts ORDER BY ViewCount ASC LIMIT 1
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND STRFTIME('%Y', Date) = '2011'
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5; 
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name IN ('Teacher', 'Supporter') AND UserId IN ( SELECT Id FROM users WHERE Location = 'New York, NY' )
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1; 
SELECT UserId FROM posts WHERE Views >= 1000 GROUP BY UserId HAVING COUNT(PostHistoryId) = 1
SELECT u.DisplayName, b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Id = (SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1)
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'; 
SELECT ((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(*)) - (SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(*))) * 100 AS PercentageDifference FROM badges WHERE Name = 'Student'
SELECT PostHistoryTypeId ,  COUNT(DISTINCT UserId) FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId
SELECT p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217; 
SELECT Score ,  LinkTypeId FROM postlinks WHERE PostId = 395;
SELECT Id, OwnerUserId FROM posts WHERE Score > 60; 
SELECT SUM(FavoriteCount) FROM posts WHERE OwnerUserId = 686 AND STRFTIME('%Y', CreationDate) = '2011'; 
SELECT AVG(T2.UpVotes), AVG(T1.Age) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId GROUP BY T1.Id HAVING COUNT(T2.UserId) > 10
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'; 
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE Score > 60; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT T2.Reputation FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'
SELECT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) AS Percentage FROM badges; 
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) AS PercentageOfTeenagers FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'; 
SELECT SUM(Score) AS TotalCommentScore FROM comments WHERE PostId IN (     SELECT Id     FROM posts     WHERE CreationDate = '2010-07-19 19:19:56.0' ); 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'
SELECT Age FROM users WHERE Location = 'Vienna, Austria'; 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND Id IN ( SELECT UserId FROM badges WHERE Name = 'Supporter' )
SELECT SUM(views) FROM users WHERE id IN (SELECT userid FROM badges WHERE date = '2010-07-19 19:39:08.0')
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId ORDER BY T1.Reputation ASC LIMIT 1
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Sharpie')
SELECT COUNT(b.UserId) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY'
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) FROM votes
SELECT T1.TagName FROM tags AS T1 INNER JOIN postTags AS T2 ON T1.Id = T2.TagId INNER JOIN posts AS T3 ON T2.PostId = T3.Id INNER JOIN users AS T4 ON T3.OwnerUserId = T4.Id WHERE T4.DisplayName = 'John Salvatier'
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Daniel Vassallo'; 
SELECT COUNT(*) FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'
SELECT Id FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1
SELECT DisplayName, SUM(ViewCount) AS TotalViews FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY DisplayName ORDER BY TotalViews DESC LIMIT 1; 
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId JOIN users AS u ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Matt Parker' AND v.VoteTypeId = 2 AND v.BountyAmount > 4
SELECT COUNT(c.Id) AS NegativeCommentsCount FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score < 60 AND u.DisplayName = 'Neil McGuigan'; 
SELECT DISTINCT t.TagName FROM tags AS t JOIN posts AS p ON t.Id = p.Tags WHERE p.OwnerDisplayName = 'Mark Meckes' AND p.CommentCount = 0
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T2.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId INNER JOIN posthistory AS T3 ON T1.Id = T3.PostId WHERE T3.UserDisplayName = 'Community'
