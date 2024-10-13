SELECT MAX("Percent (%) Eligible Free (K-12)") AS MaxEligibleFreeRate FROM frpm WHERE "County Name" = 'Alameda'; 
SELECT s.School, f."Percent (%) Eligible Free (Ages 5-17)" AS EligibleFreeRate FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.School IS NOT NULL AND f."Percent (%) Eligible Free (Ages 5-17)" IS NOT NULL AND s.EdOpsCode = 'CON' ORDER BY EligibleFreeRate ASC LIMIT 3; 
SELECT DISTINCT frpm.Zip  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Fresno' AND frpm.`Charter School (Y/N)` = 1; 
SELECT MailStreet FROM frpm WHERE School IN (     SELECT School FROM schools ORDER BY SUM(FRPMCount_K_12) DESC LIMIT 1 ); 
SELECT T2.Phone FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 AND T2.OpenDate > '2000-01-01'; 
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F'; 
SELECT DISTINCT s.School, s.Magnet FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.NumTstTakr > 500 AND s.Magnet = 1; 
SELECT s.Phone FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores); 
SELECT SUM(s.NumTstTakr) AS TotalSATTestTakers FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.FRPMCount >= ALL (     SELECT MAX(FRPMCount)     FROM frpm ); 
SELECT COUNT(s.CDSCode) AS DirectCharterSchoolCount FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE ss.AvgScrMath > 560 AND s.FundingType = 'Directly funded'; 
SELECT f.FRPMCount FROM satscores s JOIN frpm f ON s.cds = CAST(f.CDSCode AS TEXT) ORDER BY s.AvgScrRead DESC LIMIT 1; 
SELECT CDSCode FROM schools WHERE (Enrollment ('K-12') + Enrollment ('Ages 5-17')) > 500; 
SELECT MAX(f."Percent (%) Eligible Free (Ages 5-17)") AS MaxEligibleFreeRate FROM satscores s JOIN frpm f ON s.cds::text = f.CDSCode::text WHERE s.NumGE1500 > 0 AND s.NumTstTakr > 0 AND f."Percent (%) Eligible Free (Ages 5-17)" IS NOT NULL; 
SELECT T1.Phone  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr DESC  LIMIT 3 
SELECT NCESSchool FROM frpm ORDER BY "Enrollment (Ages 5-17)" DESC LIMIT 5 
SELECT s.District, AVG(ss.AvgScrRead) AS AvgReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AvgReadingScore DESC LIMIT 1; 
SELECT COUNT(*) FROM satscores WHERE cds IN (     SELECT cds FROM schools WHERE county = 'Alameda' AND StatusType = 'Merged' ) AND NumTstTakr < 100; 
SELECT s.CharterNum, AVG(sw.AvgScrWrite) AS AvgWritingScore FROM satscores sw JOIN schools s ON sw.cds = s.CDSCode WHERE sw.AvgScrWrite > 499 AND s.CharterNum IS NOT NULL GROUP BY s.CharterNum ORDER BY AvgWritingScore DESC; 
SELECT COUNT(*) FROM satscores WHERE cds IN (     SELECT cds FROM schools WHERE city = 'Fresno' AND fundingtype = 'Directly funded' ) AND numtesttaker <= 250; 
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrMath DESC LIMIT 1
SELECT COUNT(*) FROM schools WHERE County = 'Amador' AND LowGrade = '9' AND HighGrade = '12'; 
SELECT COUNT(*) FROM frpm WHERE County = 'Los Angeles' AND Free_Meal_Count_K_12 > 500 AND FRPM_Count_K_12 < 700; 
SELECT sname FROM satscores WHERE cds IN (     SELECT CDSCode FROM schools WHERE County = 'Contra Costa' AND StatusType = 'Active' ) ORDER BY NumTstTakr DESC LIMIT 1; 
SELECT s.School, s.Street, s.City, s.State, s.Zip, s.MailStreet, s.MailCity, s.MailState, s.MailZip FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE ABS(s."Enrollment (K-12)" - f."Enrollment (Ages 5-17)") > 30; 
SELECT s.sname FROM satscores s JOIN frpm f ON s.cds = f.CDSCode WHERE f.[Percent (%) Eligible Free (K-12)] > 0.1 AND s.NumGE1500 >= 1500; 
SELECT s.School, s.FundingType FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE s.County = 'Riverside' AND AVG(ss.AvgScrMath) > 400; 
SELECT      s.School AS "School Name",     s.Street AS "Street",     s.City AS "City",     s.State AS "State",     s.Zip AS "Zip" FROM      schools s JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.GSserved LIKE '%12' AND     f.Percent_(_Eligible_FRPM_(Ages_5_17)) > 0.6 AND     s.County = 'Monterey'; 
SELECT s.sname, s.Phone, AVG(sw.AvgScrWrite) AS AvgScoreWrite FROM satscores sw JOIN schools s ON sw.cds = s.CDSCode WHERE s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01' GROUP BY s.sname, s.Phone; 
SELECT s.School, s.DOCType, AVG(s.Enrollment_K_12 - s.Enrollment_Ages_5_17) AS DiffFromAverage FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.Charter_Funding_Type = 'Locally funded' GROUP BY s.School, s.DOCType HAVING ABS(DiffFromAverage) > (     SELECT AVG(s.Enrollment_K_12 - s.Enrollment_Ages_5_17) AS AvgDiff     FROM schools s     JOIN frpm f ON s.CDSCode = f.CDSCode     WHERE f.Charter_Funding_Type = 'Locally funded' ); 
SELECT MIN(OpenDate) AS First_Opening_Date FROM schools WHERE GSoffered = 'K-12'; 
SELECT City FROM schools ORDER BY CAST(REPLACE(SUBSTRING(City, CHARINDEX(' ', City) + 1), ',', '') AS INTEGER) ASC LIMIT 5; 
SELECT "Percent (%) Eligible Free (K-12)"  FROM frpm  ORDER BY "Enrollment (K-12)" DESC  LIMIT 10; 
SELECT TOP 5      s.School AS SchoolName,     f.[Percent (%) Eligible FRPM (K-12)] AS EligibleFRPMRate FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      s.SOCType = 'High Schools (Public)' ORDER BY      f.[FRPM Count (K-12)] DESC; 
SELECT T2.Website, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Free_Meal_Count_Ages_5_17 BETWEEN 1900 AND 2000
SELECT "Percent (%) Eligible Free (Ages 5-17)" AS FreeRate FROM frpm JOIN schools ON frpm.School = schools.School AND frpm.County = schools.County WHERE schools.AdmFName1 = 'Kacey' AND schools.AdmLName1 = 'Gibson'; 
SELECT AdmEmail1 FROM schools WHERE CDSCode IN (     SELECT CDSCode FROM frpm WHERE Charter_School_Y_N = 1 ORDER BY Enrollment_K_12 ASC LIMIT 1 ); 
SELECT      COALESCE(s.AdmFName1, s.AdmFName2, s.AdmFName3) AS AdminFirstName,     COALESCE(s.AdmLName1, s.AdmLName2, s.AdmLName3) AS AdminLastName FROM      satscores ss JOIN      schools s ON ss.cds = s.CDSCode WHERE      ss.NumGE1500 IS NOT NULL AND ss.NumGE1500 > 0 ORDER BY      ss.NumGE1500 DESC LIMIT 1; 
SELECT s.Street, s.City, s.State, s.Zip FROM schools s JOIN satscores ss ON s.cds = ss.cds WHERE ss.NumTstTakr > 0 ORDER BY CAST(ss.NumGE1500 AS REAL) / ss.NumTstTakr ASC LIMIT 1
SELECT T2.Website  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.NumTstTakr BETWEEN 2000 AND 3000 AND T2.County = 'Los Angeles'; 
SELECT AVG(s.NumTstTakr) AS AvgTestTakers FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE sch.City = 'Fresno' AND YEAR(sch.OpenDate) = 1980; 
SELECT s.Phone FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE s.District = 'Fresno Unified' ORDER BY ss.AvgScrRead ASC LIMIT 1; 
SELECT s.School, AVG(s.AvgScrRead) AS AvgReadingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' GROUP BY s.County, s.School ORDER BY s.County, AvgReadingScore DESC LIMIT 5
SELECT DISTINCT T1.EdOpsName  FROM schools AS T1  JOIN satscores AS T2 ON T1.CDSCode = T2.cds  WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores); 
SELECT AVG(AvgScrMath), County FROM satscores JOIN schools ON satscores.cds = schools.CDSCode GROUP BY County ORDER BY SUM(AvgScrMath + AvgScrRead + AvgScrWrite) ASC LIMIT 1; 
SELECT AVG(s.AvgScrWrite), s.City FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode WHERE s.NumGE1500 = (     SELECT MAX(NumGE1500)     FROM satscores ) GROUP BY s.City; 
SELECT s.School, AVG(ss.AvgScrWrite) AS AverageWritingScore FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds JOIN (     SELECT CDSCode     FROM schools     WHERE AdmFName1 = 'Ricci' AND AdmLName1 = 'Ulrich' ) admin ON s.CDSCode = admin.CDSCode GROUP BY s.School; 
SELECT s.School, s.County, SUM(s.enroll12) AS TotalEnrollment FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.DOC = 31 AND s.GSserved = 'K-12' GROUP BY s.School, s.County ORDER BY TotalEnrollment DESC LIMIT 1; 
SELECT COUNT(*) / 12 AS MonthlyAverage FROM schools WHERE County = 'Alameda' AND DOC = 52 AND YEAR(OpenDate) = 1980; 
SELECT      SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS Unified_School_Districts,     SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS Elementary_School_Districts,     CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS Ratio FROM      schools WHERE      County = 'Orange' AND StatusType = 'Merged'; 
SELECT DISTINCT s.County, s.School, s.ClosedDate FROM schools s WHERE s.StatusType = 'Closed' ORDER BY s.County DESC, COUNT(s.School) DESC LIMIT 1; 
SELECT Street, School FROM schools WHERE CDSCode = (SELECT cds FROM satscores ORDER BY avgscrmath DESC LIMIT 1 OFFSET 5); 
SELECT T2.MailStreet, T1.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 AND T2.MailCity = 'Lakeport'; 
SELECT SUM(f.NumTstTakr) AS TotalTestTakers FROM satscores s JOIN schools sch ON s.cds = sch.CDSCode JOIN frpm f ON sch.CDSCode = f.CDSCode WHERE sch.MailCity = 'Fresno'; 
SELECT s.School, s.MailZip  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.AdmFName1 = 'Avetik' AND f.AdmLName1 = 'Atoian'; 
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE MailState = 'CA'; 
SELECT COUNT(*) FROM schools WHERE State = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active'; 
SELECT T1.Phone, T1.Ext FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrWrite DESC LIMIT 1 OFFSET 332; 
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT DISTINCT s.Website FROM schools s JOIN (     SELECT AdmFName1, AdmLName1     FROM schools     WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez') ) a ON s.AdmFName1 = a.AdmFName1 AND s.AdmLName1 = a.AdmLName1 WHERE s.StatusType IN ('Active', 'Pending'); 
SELECT Website FROM schools WHERE Charter = 1 AND Virtual = 'P' AND County = 'San Joaquin'
SELECT COUNT(*)  FROM schools  WHERE Charter = 1 AND City = 'Hickman' AND DOC = 52; 
SELECT COUNT(*) FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.enroll12 > 0 AND T2.County = 'Los Angeles' AND T2.`Percent (%) Eligible Free (K-12)` < 0.18; 
SELECT AdmFName1, AdmLName1, AdmFName2, AdmLName2, AdmFName3, AdmLName3, School, City FROM schools WHERE Charter = 1 AND CharterNum = '00D2'
SELECT COUNT(*)  FROM schools  WHERE CharterNum = '00D4' AND MailCity = 'Hickman'; 
SELECT (COUNT(CASE WHEN FundingType = 'Locally funded' THEN 1 ELSE NULL END) / COUNT(*)) * 100 AS LocalFundingRatio FROM schools WHERE County = 'Santa Clara'; 
SELECT COUNT(*)  FROM schools  WHERE FundingType = 'Directly Funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'; 
SELECT COUNT(*) FROM schools WHERE StatusType = 'Closed' AND City = 'San Francisco' AND YEAR(ClosedDate) = 1989; 
SELECT County FROM schools WHERE Year(ClosedDate) BETWEEN 1980 AND 1989 AND SOC = '11' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT DISTINCT NCESSDist FROM schools WHERE SOC = '31'; 
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND DOCType = 'Unified School District' AND SOCType = 'District Community Day Schools'; 
SELECT DISTINCT f.DistrictCode FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.City = 'Fresno' AND s.Magnet = 0; 
SELECT SUM("Percent (%) Eligible Free (Ages 5-17)") * 100 AS TotalEligibleFreeStudents FROM "frpm" JOIN "schools" ON "frpm"."CDSCode" = "schools"."CDSCode" WHERE "EdOpsCode" = 'SSS' AND "School" = 'State Special School' AND "Academic Year" = '2014-2015'; 
SELECT "FRPM Count (Ages 5-17)" FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.School = 'Youth Authority School' AND T1.MailStreet = 'PO Box 1040';
SELECT MIN(LowGrade) AS LowestGrade FROM schools WHERE NCESDist = '0613360' AND EdOpsCode = 'SPECON'; 
SELECT T2.EILName, T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County_Code = 37 AND T1.NSLP_Provision_Status = 'Breakfast Provision 2'; 
SELECT s.City  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.EILCode = 'HS'  AND f.CountyName = 'Merced'  AND s.LowGrade = '9'  AND s.HighGrade = '12'  AND f.Percent_(_Eligible_FRPM_(K-12)) = 2; 
SELECT s.School, f."Percent (%) Eligible FRPM (Ages 5-17)"  FROM schools s  JOIN frpm f ON s.CDSCode = CAST(f.CDSCode AS TEXT)  WHERE s.County = 'Los Angeles' AND s.GSserved = 'K-9'; 
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT COUNT(*) AS NumberOfSchools, c.County FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Virtual = 'F' AND s.County IN ('San Diego', 'Santa Barbara') GROUP BY c.County ORDER BY NumberOfSchools DESC LIMIT 1; 
SELECT T1.School, T1.Latitude FROM schools AS T1 ORDER BY T1.Latitude DESC LIMIT 1
SELECT s.School, s.City, MIN(s.Latitude), s.LowGrade FROM schools s WHERE s.State = 'CA' GROUP BY s.School, s.City, s.LowGrade ORDER BY MIN(s.Latitude) ASC LIMIT 1
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1; 
SELECT COUNT(DISTINCT c.City), COUNT(s.School) AS NumSchools FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.GSoffered = 'K-8' AND s.Magnet = 1 AND f.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY c.City; 
SELECT AdmFName1, COUNT(*) AS count, District FROM schools GROUP BY AdmFName1 ORDER BY count DESC LIMIT 2
SELECT f."Percent (%) Eligible Free (K-12)", s.DistrictCode FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Alusine'; 
SELECT DISTINCT T1.AdmLName1, T2.District, T2.County, T2.School FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.CharterNum = '40'
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = '62' OR DOC = '54'); 
SELECT s.AdmEmail1, s.School FROM schools s JOIN (     SELECT cds     FROM satscores     WHERE NumGE1500 IS NOT NULL AND NumGE1500 > 0     GROUP BY cds     ORDER BY SUM(NumGE1500) DESC     LIMIT 1 ) ss ON s.cds = ss.cds; 
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYBER KARTOU' AND d.A3 = 'east Bohemia'; 
SELECT COUNT(DISTINCT t1.account_id) AS eligible_accounts FROM account AS t1 JOIN district AS t2 ON t1.district_id = t2.district_id WHERE t2.A3 = 'Prague'; 
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM district ORDER BY (AVG(A13) - AVG(A12)) DESC LIMIT 1; 
SELECT COUNT(*) FROM district WHERE A11 BETWEEN 6000 AND 10000 AND EXISTS (SELECT 1 FROM client WHERE gender = 'F' AND district_id = district.district_id); 
SELECT COUNT(*)  FROM client  JOIN district ON client.district_id = district.district_id  WHERE client.gender = 'M' AND district.A3 = 'north Bohemia' AND district.A11 > 8000; 
WITH avg_salary AS (     SELECT c.district_id, AVG(d.A11) AS avg_sal     FROM client c     JOIN district d ON c.district_id = d.district_id     WHERE c.gender = 'F'     GROUP BY c.district_id ), min_max_avg_sal AS (     SELECT MIN(avg_sal) AS min_sal, MAX(avg_sal) AS max_sal     FROM avg_salary ) SELECT min_max_avg_sal.max_sal - min_max_avg_sal.min_sal AS salary_gap,        (SELECT account_id FROM account WHERE district_id IN (            SELECT district_id FROM avg_salary ORDER BY avg_sal ASC LIMIT 1        )) AS account_number; 
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.birth_date IN (     SELECT MIN(birth_date)     FROM client ) AND T2.A11 = (     SELECT MAX(A11)     FROM client ); 
SELECT COUNT(DISTINCT c.client_id) AS num_customers FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'; 
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'DISPONENT'; 
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE YEAR(l.date) = 1997 ORDER BY l.amount ASC, a.frequency = 'POPLATEK TYDNE' LIMIT 1; 
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 12 AND YEAR(a.date) = 1993 ORDER BY l.amount DESC LIMIT 1; 
SELECT COUNT(client_id) FROM client JOIN district ON client.district_id = district.district_id WHERE gender = 'F' AND birth_date < '1950-01-01' AND A2 = 'Sokolov'; 
SELECT account_id FROM trans WHERE EXTRACT(YEAR FROM date) = 1995 ORDER BY date ASC LIMIT 1
SELECT DISTINCT account_id FROM trans WHERE date < '1997-01-01' GROUP BY account_id HAVING SUM(amount) > 3000; 
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.issued = '1994-03-03'
SELECT T1.date FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'; 
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'
SELECT MAX(t.amount) AS max_transaction_amount FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.issued = '19961021'; 
SELECT T2.gender FROM district AS T1 JOIN client AS T2 ON T2.district_id = T1.district_id WHERE T1.A11 = (SELECT MAX(A11) FROM district) ORDER BY T2.birth_date ASC LIMIT 1; 
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE c.client_id IN (     SELECT d.client_id     FROM disp d     JOIN loan l ON d.account_id = l.account_id     ORDER BY l.amount DESC     LIMIT 1 ) ORDER BY t.date ASC LIMIT 1; 
SELECT COUNT(c.client_id)  FROM client c  JOIN account a ON c.client_id = a.client_id  JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Jesenik' AND c.gender = 'F'; 
SELECT T1.disp_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 5100 AND T3.date = '1998-09-02'; 
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Litomerice') AND EXTRACT(YEAR FROM date) = 1996; 
SELECT d.A2 AS district_name FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND c.birth_date = '1976-01-29'; 
SELECT T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 98832 AND T3.date = '1996-01-03'; 
SELECT account_id FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague') ORDER BY date ASC LIMIT 1; 
SELECT (COUNT(CASE WHEN T1.gender = 'M' THEN 1 END) / COUNT(T1.client_id)) * 100 AS percentage_male_clients FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'south Bohemia' ORDER BY CAST(REPLACE(T2.A4, ',', '') AS INT) DESC LIMIT 1; 
SELECT      ((t1.balance - t2.balance) / t2.balance) * 100 AS increase_rate FROM      trans t1 JOIN      trans t2 ON t1.account_id = t2.account_id AND t1.date = '1998-12-27' WHERE      t1.type = 'PRIJEM' AND t1.date = '1993-03-22'; 
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) FROM loan 
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000 
SELECT a.account_id, d.A2 AS district_name, d.A3 AS district_region FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date LIKE '1993%' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT c.client_id, a.account_id, a.frequency FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dis ON a.district_id = dis.district_id WHERE dis.A3 = 'east Bohemia' AND EXTRACT(YEAR FROM a.date) BETWEEN 1995 AND 2000; 
SELECT T1.account_id, T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'; 
SELECT T1.A2, T1.A3 FROM district AS T1 JOIN loan AS T2 ON T1.district_id = T2.district_id WHERE T2.loan_id = '4990'
SELECT DISTINCT l.account_id, d.A2 AS district, d.A3 AS region FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.amount > 300000; 
SELECT l.loan_id, d.A3, AVG(d.A11) AS avg_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60 GROUP BY l.loan_id, d.A3; 
SELECT      d.A3 AS region,     d.A12 AS unemployment_rate_1995,     d.A13 AS unemployment_rate_1996,     ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment_rate FROM      district d JOIN      account a ON d.district_id = a.district_id JOIN      disp dp ON a.account_id = dp.account_id JOIN      loan l ON dp.account_id = l.account_id WHERE      l.status = 'D'; 
SELECT      (COUNT(CASE WHEN d.A2 = 'Decin' THEN 1 ELSE NULL END) * 100.0 / COUNT(t.account_id)) AS percentage FROM      trans t JOIN      account a ON t.account_id = a.account_id JOIN      district d ON a.district_id = d.district_id WHERE      EXTRACT(YEAR FROM t.date) = 1993; 
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'; 
SELECT T2.A2 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.A2 ORDER BY COUNT(T1.client_id) DESC LIMIT 9
SELECT d.A2 AS district_name, SUM(t.amount) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN account a ON c.client_id = a.client_id JOIN district d ON a.district_id = d.district_id LEFT JOIN card ca ON a.account_id = ca.account_id AND ca.type = 'credit' WHERE d.A3 = 'south Bohemia' AND ca.card_id IS NULL; 
SELECT d.A3 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') GROUP BY d.district_id ORDER BY COUNT(l.loan_id) DESC LIMIT 1; 
SELECT AVG(loan.amount) FROM loan JOIN disp ON loan.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.gender = 'M'
SELECT d.A2 AS district_name, d.A3 AS region FROM district d ORDER BY d.A13 DESC LIMIT 5; 
SELECT COUNT(account_id) FROM account WHERE district_id = (     SELECT district_id     FROM district     ORDER BY A16 DESC     LIMIT 1 ); 
SELECT COUNT(DISTINCT t1.account_id) FROM trans AS t1 JOIN disp AS d ON t1.account_id = d.account_id WHERE t1.type = 'VYDAJ' AND t1.operation = 'VYBER KARTOU' AND t1.balance < 0 AND d.type = 'OWNER'; 
SELECT COUNT(DISTINCT l.loan_id) AS loan_count FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.amount >= 250000 AND a.frequency = 'POPLATEK MESICNE'; 
SELECT COUNT(DISTINCT T1.account_id) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 1 AND T1.status = 'C'
SELECT COUNT(client_id) AS male_clients_count FROM client WHERE district_id IN (     SELECT district_id     FROM district     ORDER BY A15 DESC     LIMIT 1 OFFSET 1 ) AND gender = 'M'; 
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER'; 
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek'; 
SELECT T1.A2 FROM district AS T1 JOIN trans AS T2 ON T1.district_id = T2.district_id WHERE T2.amount > 10000 AND EXTRACT(YEAR FROM T2.date) = 1997 GROUP BY T1.district_id HAVING SUM(T2.amount) > 10000
SELECT DISTINCT o.account_id FROM order o JOIN account a ON o.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE o.k_symbol = 'SIPO' AND d.A2 = 'Pisek'; 
SELECT DISTINCT T1.account_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold'
SELECT AVG(amount) AS avg_credit_card_amount FROM trans WHERE type = 'VYDAJ' AND date BETWEEN '2021-01-01' AND '2021-12-31'; 
SELECT DISTINCT d.account_id FROM disp d JOIN card c ON d.disp_id = c.disp_id JOIN trans t ON d.account_id = t.account_id WHERE c.type = 'junior' AND t.date BETWEEN '1998-01-01' AND '1998-12-31' AND t.amount < (SELECT AVG(amount) FROM trans WHERE date BETWEEN '1998-01-01' AND '1998-12-31') AND t.operation = 'VYBER KARTOU'; 
SELECT c.client_id, c.gender, d.account_id FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id JOIN account a ON d.account_id = a.account_id WHERE c.gender = 'F' AND EXISTS (SELECT 1 FROM loan l WHERE l.account_id = a.account_id)
SELECT COUNT(DISTINCT c.client_id) AS female_clients_in_south_bohemia FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 = 'south Bohemia'; 
SELECT DISTINCT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN district dt ON a.district_id = dt.district_id WHERE dt.A2 = 'Tabor' AND d.type = 'OWNER'; 
SELECT d.type, AVG(di.A11) AS avg_income FROM disp d JOIN account acc ON d.account_id = acc.account_id JOIN district di ON acc.district_id = di.district_id WHERE d.type <> 'OWNER' GROUP BY d.type HAVING AVG(di.A11) BETWEEN 8000 AND 9000; 
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'north Bohemia' AND t.bank = 'AB'; 
SELECT DISTINCT d.A2 FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ'; 
SELECT AVG(T1.A15) AS avg_crimes_1995 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND T2.date >= '1997-01-01'; 
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'classic' AND d.type = 'OWNER'; 
SELECT COUNT(client_id) FROM client  JOIN district ON client.district_id = district.district_id  WHERE gender = 'M' AND A2 = 'Hl.m. Praha'; 
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card
SELECT c.client_id, c.gender, c.birth_date, d.A2 AS district_name FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account acc ON d.account_id = acc.account_id JOIN loan l ON acc.account_id = l.account_id WHERE d.type = 'OWNER' ORDER BY l.amount DESC LIMIT 1; 
SELECT SUM(T1.A15) AS total_crimes_1995 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532; 
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333; 
SELECT t.trans_id, t.date, t.amount FROM trans t JOIN disp d ON t.account_id = d.account_id WHERE t.operation = 'VYBER' AND d.client_id = 3356; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN loan l ON d.client_id = l.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND l.amount < 200000; 
SELECT T2.type FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.client_id = 13539
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT d.A2 AS district_name FROM district d JOIN account a ON d.district_id = a.district_id JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY d.district_id ORDER BY COUNT(l.loan_id) DESC LIMIT 1; 
SELECT c.client_id, c.gender, c.birth_date, d.A2 AS district_name FROM client c JOIN disp d ON c.client_id = d.client_id JOIN order o ON d.disp_id = o.account_id WHERE o.order_id = 32423; 
SELECT t.* FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5; 
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik')
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'junior' AND T3.issued >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A11 > 10000; 
SELECT      ((SUM(CASE WHEN YEAR(l.date) = 1997 THEN l.amount ELSE 0 END) - SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) /       SUM(CASE WHEN YEAR(l.date) = 1996 THEN l.amount ELSE 0 END)) * 100 AS growth_rate FROM      loan l JOIN      disp d ON l.account_id = d.account_id JOIN      client c ON d.client_id = c.client_id WHERE      c.gender = 'M'; 
SELECT COUNT(*) FROM trans WHERE type = 'VYDAJ' AND operation = 'VYBER KARTOU' AND date > '1995-12-31'; 
SELECT SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) AS crime_difference FROM district
SELECT type, COUNT(*) AS count FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type; 
SELECT      t.date,     t.k_symbol FROM      trans t WHERE      t.account_id = 3 AND t.type = 'VYBER'; 
SELECT c.birth_date FROM client AS c JOIN disp AS d ON c.client_id = d.client_id WHERE d.disp_id = 130 AND d.type = 'OWNER'; 
SELECT COUNT(*) FROM disp JOIN account ON disp.account_id = account.account_id WHERE disp.type = 'OWNER' AND account.frequency = 'POPLATEK PO OBRATU'; 
SELECT SUM(l.amount - l.payments * (julianday(t.date) - julianday(l.date)) / 30) AS debt, CASE WHEN SUM(l.amount - l.payments * (julianday(t.date) - julianday(l.date)) / 30) > 0 THEN 'In Debt' ELSE 'Not In Debt' END AS status FROM loan l JOIN trans t ON l.account_id = t.account_id AND l.status != 'A' WHERE l.account_id IN (     SELECT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE c.client_id = 992 ); 
SELECT SUM(t.amount), c.gender  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN client c ON a.client_id = c.client_id  WHERE t.trans_id = 851 AND c.client_id = 4; 
SELECT c.type FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE d.client_id = 9; 
SELECT SUM(amount) AS total_payment FROM trans WHERE account_id IN (     SELECT account_id     FROM disp     WHERE client_id = 617 AND type = 'OWNER' ) AND EXTRACT(YEAR FROM date) = 1998; 
SELECT c.client_id, c.gender, c.birth_date, d.A3 AS region FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'east Bohemia'; 
SELECT c.client_id FROM client c JOIN loan l ON c.client_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN trans t ON c.client_id = t.account_id WHERE c.gender = 'M' AND t.date BETWEEN '1974-01-01' AND '1976-12-31' AND t.type = 'VYDAJ' AND t.k_symbol = 'SIPO' AND t.amount > 4000; 
SELECT COUNT(account_id) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Beroun') AND date > '1996-12-31'; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE c.gender = 'F' AND ca.type = 'junior'
SELECT (COUNT(CASE WHEN T1.gender = 'F' THEN 1 ELSE NULL END) * 100.0 / COUNT(T1.client_id)) AS percentage_female_clients FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 LIKE '%Prague%'; 
SELECT (COUNT(CASE WHEN T1.gender = 'M' THEN 1 ELSE NULL END) * 100.0 / COUNT(T1.client_id)) AS percentage FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER' AND T1.frequency = 'POPLATEK TYDNE'; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN disp d ON c.client_id = d.client_id WHERE c.gender = 'F' AND d.type = 'OWNER' AND c.frequency = 'POPLATEK TYDNE'; 
SELECT a.account_id FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.duration > 24 AND a.date < '1997-01-01' ORDER BY l.amount ASC, a.date ASC LIMIT 1; 
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T1.account_id ORDER BY AVG(T2.A11) ASC LIMIT 1
SELECT COUNT(client_id) FROM client JOIN district ON client.district_id = district.district_id WHERE EXTRACT(YEAR FROM birth_date) = 1920 AND A3 = 'east Bohemia'; 
SELECT COUNT(DISTINCT l.account_id) FROM loan l JOIN disp d ON l.account_id = d.account_id JOIN account a ON d.account_id = a.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE'; 
SELECT AVG(l.amount) AS avg_loan_amount FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id JOIN trans t ON a.account_id = t.account_id WHERE l.status = 'C' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT DISTINCT d.client_id, d.district_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE d.type = 'OWNER'; 
SELECT c.client_id, EXTRACT(YEAR FROM AGE(c.birth_date)) AS age FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card ca ON d.disp_id = ca.disp_id WHERE ca.type = 'gold' AND d.type = 'OWNER'; 
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT m.molecule_id) AS count_non_carcinogenic_with_chlorine FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl'; 
SELECT AVG(CASE WHEN T3.element = 'o' THEN 1 ELSE 0 END) AS avg_oxygen_atoms FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '-'; 
SELECT AVG(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS avg_carcinogenic_single_bonds FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.bond_type = '-'; 
SELECT COUNT(DISTINCT m.molecule_id) AS non_carcinogenic_molecules FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'na' AND m.label = '-'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+'; 
SELECT CAST(SUM(CASE WHEN T3.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '='; 
SELECT COUNT(*) FROM bond WHERE bond_type = '#'; 
SELECT COUNT(*) FROM atom WHERE element != 'br'; 
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'; 
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.element  =  'c' GROUP BY T1.molecule_id
SELECT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE c.bond_id = 'TR004_8_9'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '='; 
SELECT label FROM atom WHERE element = 'h' GROUP BY label ORDER BY COUNT(label) DESC LIMIT 1; 
SELECT DISTINCT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'cl'; 
SELECT DISTINCT a1.element AS atom1, a2.element AS atom2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-'; 
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_type != 'None' AND T1.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT element  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '-'  GROUP BY element  ORDER BY COUNT(element) ASC  LIMIT 1; 
SELECT bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN ( SELECT molecule_id FROM atom WHERE element = 'sn' )
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'; 
SELECT DISTINCT a1.atom_id, a2.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '#'; 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE c.bond_id IN (     SELECT b.bond_id     FROM bond b     WHERE b.molecule_id = 'TR181' ); 
SELECT CAST(COUNT(DISTINCT CASE WHEN T2.element = 'f' THEN T1.molecule_id END) AS FLOAT) * 100 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'; 
SELECT CAST(SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percent FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.molecule_id = 'TR000' ORDER BY a.element ASC LIMIT 3; 
SELECT atom_id, atom_id2 FROM connected WHERE molecule_id = 'TR001' AND bond_id = 'TR001_2_6'; 
SELECT SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM molecule
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'; 
SELECT m.label, m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.label, m.molecule_id ORDER BY m.label ASC, m.molecule_id ASC LIMIT 5; 
SELECT ROUND((SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) / COUNT(bond_id)) * 100, 5) AS percent FROM bond WHERE molecule_id = 'TR008'; 
SELECT ROUND(CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(molecule_id), 3) AS percent FROM molecule
SELECT ROUND(CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(atom_id), 4) AS percent FROM atom WHERE molecule_id = 'TR206'; 
SELECT DISTINCT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000'
SELECT T1.element, T4.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T1.molecule_id = 'TR060'; 
SELECT bond_type, COUNT(*) AS count FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.molecule_id = 'TR010' GROUP BY bond_type ORDER BY count DESC LIMIT 1; SELECT label FROM molecule WHERE molecule_id = 'TR010'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-' AND m.label = '-' ORDER BY m.molecule_id ASC LIMIT 3; 
SELECT b.bond_id, b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE c.molecule_id = 'TR006'  ORDER BY b.bond_id ASC  LIMIT 2; 
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND molecule_id = 'TR009'; 
SELECT COUNT(DISTINCT m.molecule_id) AS carcinogenic_molecules_with_bromine FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br'; 
SELECT b.bond_type, c1.atom_id AS atom1, c2.atom_id AS atom2 FROM bond b JOIN connected c1 ON b.bond_id = c1.bond_id JOIN connected c2 ON b.bond_id = c2.bond_id AND c1.atom_id <> c2.atom_id WHERE b.bond_id = 'TR001_6_9'; 
SELECT m.label, m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10'; 
SELECT COUNT(*) FROM bond WHERE bond_type = '#'; 
SELECT COUNT(*) AS connection_count FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'; 
SELECT DISTINCT t1.element FROM atom AS t1 JOIN molecule AS t2 ON t1.molecule_id = t2.molecule_id WHERE t2.molecule_id = 'TR004'; 
SELECT COUNT(*) FROM molecule WHERE label = '-'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'; 
SELECT b.bond_id, b.bond_type, m.label FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p'); 
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '=' GROUP BY m.label ORDER BY COUNT(b.bond_id) DESC LIMIT 1; 
SELECT AVG(COUNT(T2.bond_id)) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i' GROUP BY T1.atom_id
SELECT b.bond_type, b.bond_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE CAST(SUBSTR(c.atom_id, 7, 2) AS INT) = 45 OR CAST(SUBSTR(c.atom_id2, 7, 2) AS INT) = 45; 
SELECT element FROM atom WHERE atom_id NOT IN (SELECT DISTINCT atom_id OR atom_id2 FROM connected)
SELECT DISTINCT a1.element AS atom1, a2.element AS atom2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR144_8_19'; 
SELECT m.molecule_id, COUNT(b.bond_id) AS double_bond_count FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY double_bond_count DESC LIMIT 1; 
SELECT element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE (a.element = 'pb' AND c.atom_id != a.atom_id) OR (a.element = 'pb' AND c.atom_id2 != a.atom_id) 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'; 
SELECT      (COUNT(bond_id) * 100.0 / (         SELECT              MAX(cnt)          FROM (             SELECT                  COUNT(*) AS cnt              FROM                  connected                  JOIN atom ON connected.atom_id = atom.atom_id                  JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id              GROUP BY                  atom.element, atom2.element         ) AS subquery     )) AS percentage FROM      connected      JOIN atom ON connected.atom_id = atom.atom_id      JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id; 
SELECT ROUND((SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(c.bond_id)), 5) AS percentage_single_bonds_carcinogenic FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'; 
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h'); 
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id) WHERE a.element = 'sn'; 
SELECT COUNT(DISTINCT a.element) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'; 
SELECT COUNT(DISTINCT a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE (a.element = 'p' OR a.element = 'br') AND b.bond_type = '#'; 
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT CAST(SUM(CASE WHEN T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id OR T1.atom_id2 = T3.atom_id WHERE T2.bond_type = '-'; 
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002'); 
SELECT molecule_id FROM molecule WHERE label = '-'; 
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'; 
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'; 
SELECT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE c.bond_id = 'TR001_10_11'; 
SELECT COUNT(DISTINCT T1.bond_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id OR T2.atom_id2 = T3.atom_id WHERE T3.element = 'i'; 
SELECT MAX(T2.label) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca'; 
SELECT CASE WHEN EXISTS (     SELECT 1 FROM atom WHERE atom_id IN (         SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8'     ) AND element = 'cl' ) AND EXISTS (     SELECT 1 FROM atom WHERE atom_id IN (         SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_1_8'     ) AND element = 'c' ) THEN 'Yes' ELSE 'No' END AS result; 
SELECT DISTINCT m1.molecule_id, m2.molecule_id FROM molecule m1 JOIN bond b ON m1.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'c' AND b.bond_type = '#' AND m1.label = '-'; 
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.molecule_id = 'TR001'; 
SELECT molecule_id FROM bond WHERE bond_type = '=';
SELECT c1.atom_id AS first_atom_id, c2.atom_id AS second_atom_id FROM connected c1 JOIN connected c2 ON c1.bond_id = c2.bond_id AND c1.atom_id <> c2.atom_id JOIN bond b ON c1.bond_id = b.bond_id WHERE b.bond_type = '#'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_1_2'; 
SELECT COUNT(DISTINCT m.molecule_id) AS non_carcinogenic_single_bond_molecules FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_10_11'; 
SELECT b.bond_id, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label IN ('+', '-'); 
SELECT DISTINCT t1.element FROM atom AS t1 JOIN connected AS t2 ON t1.atom_id = t2.atom_id2 JOIN molecule AS t3 ON t1.molecule_id = t3.molecule_id WHERE t1.substr(atom_id, 7, 1) = '4' AND t3.label = '+'; 
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) AS ratio, label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule_id = 'TR006'; 
SELECT m.label  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'ca'; 
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'c' GROUP BY b.bond_type; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE c.bond_id = 'TR001_10_11'; 
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id; 
SELECT CAST(SUM(CASE WHEN b.bond_type = '=' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS percent FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.molecule_id = 'TR047'; 
