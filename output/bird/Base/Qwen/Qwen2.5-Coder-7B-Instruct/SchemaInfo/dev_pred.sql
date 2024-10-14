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
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_1'
SELECT label FROM molecule WHERE molecule_id = 'TR151'; 
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR151'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT DISTINCT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT bond_id FROM bond WHERE bond_type = '=' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+'); 
SELECT COUNT(DISTINCT atom_id) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE element = 'h' AND label = '+'; 
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2'; 
SELECT DISTINCT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE a.element = 'c' AND NOT EXISTS (     SELECT 1     FROM molecule m     JOIN connected c2 ON m.molecule_id = c2.molecule_id     WHERE (a.atom_id = c2.atom_id AND m.label = '-') OR (a.atom_id = c2.atom_id2 AND m.label = '-') ); 
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T3.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id OR T2.atom_id2 = T3.atom_id WHERE T3.element = 'h'; 
SELECT label FROM molecule WHERE molecule_id = 'TR124'; 
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'; 
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id IN (c.atom_id, c.atom_id2) WHERE c.bond_id = 'TR001_2_4'; 
SELECT COUNT(*) AS double_bonds_count, m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id = 'TR006' AND b.bond_type = '='
SELECT m.label, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'; 
SELECT b.bond_id, a1.element AS atom1_element, a2.element AS atom2_element FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-'
SELECT DISTINCT m.label, a.element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '#' AND a.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca'); 
SELECT DISTINCT t1.element FROM atom AS t1 JOIN connected AS t2 ON t1.atom_id = t2.atom_id WHERE t2.bond_id = 'TR000_2_3'; 
SELECT COUNT(*) AS bond_count FROM connected JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'cl'; 
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS bond_type_count FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id; 
SELECT COUNT(*) AS total_double_bonds,        SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_double_bonds FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '='; 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element != 's' AND b.bond_type != '='; 
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4'; 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'; 
SELECT COUNT(*) FROM bond WHERE bond_type = '-'; 
SELECT DISTINCT m.molecule_id, m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'; 
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'; 
SELECT CAST(COUNT(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE NULL END) AS FLOAT) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'; 
SELECT COUNT(DISTINCT T1.element) AS element_count FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_3_4'; 
SELECT bond_type FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id = 'TR000_1' AND atom_id2 = 'TR000_2'); 
SELECT m.label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id AND a.atom_id2 = c.atom_id2 WHERE (a.atom_id = 'TR000_2' AND a.atom_id2 = 'TR000_4') OR (a.atom_id = 'TR000_4' AND a.atom_id2 = 'TR000_2'); 
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT label FROM molecule WHERE molecule_id = 'TR000';
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(T2.bond_id) AS percentage FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id; 
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+'
SELECT DISTINCT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '='; 
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5; 
SELECT DISTINCT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND c.molecule_id = 'TR024'; 
SELECT m.molecule_id, COUNT(a.atom_id) AS atom_count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id ORDER BY atom_count DESC LIMIT 1; 
SELECT CAST(COUNT(CASE WHEN T3.label = '+' THEN 1 ELSE NULL END) AS FLOAT) * 100 / COUNT(*) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'h' AND T3.bond_type = '#'; 
SELECT COUNT(*) FROM molecule WHERE label = '+'; 
SELECT COUNT(DISTINCT m.molecule_id) AS single_bonded_molecules FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.molecule_id BETWEEN 'TR004' AND 'TR010' AND b.bond_type = '-'; 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'; 
SELECT element FROM atom WHERE atom_id = 'TR004_7' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-'); 
SELECT COUNT(DISTINCT m.molecule_id) AS total_molecules_with_double_bonded_oxygen FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON b.atom_id = a.atom_id AND b.atom_id2 = (SELECT atom_id FROM atom WHERE molecule_id = m.molecule_id AND element = 'o') WHERE b.bond_type = '='; 
SELECT COUNT(*) FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '-'; 
SELECT T3.element, T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON (T1.atom_id = T3.atom_id OR T1.atom_id2 = T3.atom_id) WHERE T3.molecule_id = 'TR002'; 
SELECT DISTINCT C1.atom_id FROM atom AS C1 JOIN connected AS CO ON C1.atom_id = CO.atom_id JOIN bond AS B ON CO.bond_id = B.bond_id WHERE C1.element = 'c' AND B.bond_type = '='; 
SELECT DISTINCT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.label = '+' AND T1.element = 'o'; 
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT name FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL OR cardKingdomId IS NULL; 
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards); 
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100; 
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned'; 
SELECT L.status FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.types = 'Artifact' AND C.side IS NULL AND L.format = 'vintage'
SELECT cards.id, cards.artist  FROM cards  JOIN legalities ON cards.uuid = legalities.uuid  WHERE (cards.power = '*' OR cards.power IS NULL) AND legalities.format = 'commander' AND legalities.status = 'Legal'; 
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniel'; 
SELECT t.text FROM cards AS c JOIN rulings AS t ON c.uuid = t.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'; 
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.id ORDER BY COUNT(T2.uuid) DESC LIMIT 1
SELECT DISTINCT t2.language FROM cards AS t1 JOIN foreign_data AS t2 ON t1.uuid = t2.uuid WHERE t1.name = 'Annul' AND t1.number = '29'; 
SELECT DISTINCT c.name FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese'; 
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data 
SELECT s.name AS setName, st.totalSetSize AS totalCards FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'; 
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'; 
SELECT COUNT(*) FROM cards WHERE power = '*'; 
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'; 
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'; 
SELECT DISTINCT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id IN (     SELECT SETID     FROM cards     WHERE name = 'Angel of Mercy' ); 
SELECT COUNT(*) FROM cards WHERE isTextless = 0 AND uuid IN (SELECT uuid FROM legalities WHERE status = 'restricted'); 
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Restricted' AND cards.isStarter = 1; 
SELECT T1.status FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'; 
SELECT DISTINCT format FROM legals JOIN cards ON legals.uuid = cards.uuid WHERE cards.name = 'Benalish Knight'
SELECT DISTINCT artist FROM foreign_data WHERE language = 'Phyrexian';
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards 
SELECT COUNT(*) FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE fd.language = 'German' AND c.isReprint = 1; 
SELECT COUNT(*) FROM foreign_data WHERE language = 'Russian' AND borderColor = 'borderless';
SELECT CAST(SUM(CASE WHEN language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data WHERE isStorySpotlight = 1; 
SELECT COUNT(*) FROM cards WHERE toughness = '99'; 
SELECT name FROM cards WHERE artist = 'Aaron Boyd'; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability LIKE '%mtgo%'; 
SELECT id FROM cards WHERE convertedManaCost = 0; 
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%Flying%' 
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'; 
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT id FROM cards WHERE duelDeck = 'a'; 
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'; 
SELECT DISTINCT c.artist FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Chinese Simplified'; 
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white'; 
SELECT fd.uuid, fd.language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'legacy'; 
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Beacon of Immortality'; 
SELECT COUNT(*) AS card_count, status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE frameVersion = 'future' AND status = 'legal'; 
SELECT c.name AS card_name, c.colorIdentity AS card_color_identity FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.code = 'OGW'; 
SELECT DISTINCT c.name, st.language FROM cards c JOIN set_translations st ON c.setCode = st.setCode AND c.multiverseId = st.translation WHERE c.convertedManaCost = 5 AND c.setCode = '10E'; 
SELECT DISTINCT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf'; 
SELECT DISTINCT c.colors, l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20; 
SELECT DISTINCT fd.name AS artifact_name, fd.flavorText AS flavor_text, fd.language AS language FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND fd.language IS NOT NULL; 
SELECT c.name  FROM cards AS c  JOIN rulings AS r ON c.uuid = r.uuid  WHERE c.rarity = 'uncommon'  ORDER BY r.date ASC  LIMIT 3; 
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = -1; 
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND hasContentWarning = 1 AND availability LIKE '%paper%'
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability LIKE '%mtgo,%paper%'; 
SELECT SUM(CONVERTEDMANACOST) FROM CARDS WHERE ARTIST = 'Rob Alexander'
SELECT DISTINCT SUBSTR(types, 1, INSTR(types, ',') - 1) AS subtype FROM cards WHERE availability = 'arena' AND types LIKE '%,%' UNION SELECT DISTINCT SUBSTR(types, INSTR(types, ',') + 1) AS supertype FROM cards WHERE availability = 'arena' AND types LIKE '%,%'
SELECT DISTINCT st.setCode FROM set_translations st JOIN foreign_data fd ON st.language = 'Spanish' WHERE fd.language = 'Spanish'; 
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage, id FROM cards WHERE isStorySpotlight = 1 OR isTextless = 0 GROUP BY id; 
SELECT name, CAST(COUNT(CASE WHEN language = 'Spanish' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) AS percentage FROM foreign_data GROUP BY name; 
SELECT DISTINCT s.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.baseSetSize = 309; 
SELECT COUNT(DISTINCT T1.setCode) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Portuguese (Brasil)' AND T2.block = 'Commander'
SELECT id FROM cards WHERE type LIKE '%Creature%' AND uuid IN ( SELECT uuid FROM legalities WHERE status = 'Legal' )
SELECT DISTINCT subtypes, supertypes FROM foreign_data WHERE language = 'German' AND subtypes IS NOT NULL AND supertypes IS NOT NULL
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'; 
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN rulings ON cards.uuid = rulings.uuid WHERE legalities.format = 'premodern' AND rulings.text = 'This is a triggered mana ability.' AND cards.side IS NULL; 
SELECT id FROM cards WHERE artist = 'Erica Yang' AND availability LIKE '%paper%' AND uuid IN (SELECT uuid FROM legalities WHERE format = 'pauper' AND status = 'Legal'); 
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation.';
SELECT f.name FROM foreign_data f JOIN cards c ON f.uuid = c.uuid WHERE f.language = 'French' AND c.type = 'Creature' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson'; 
SELECT COUNT(DISTINCT r.uuid) FROM rulings r JOIN cards c ON r.uuid = c.uuid WHERE r.date = '2007-02-01' AND c.rarity = 'rare'; 
SELECT s.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ravnica' AND s.baseSetSize = 180; 
SELECT CAST(SUM(CASE WHEN hasContentWarning = 0 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'commander' AND status = 'legal'); 
SELECT CAST(SUM(CASE WHEN language = 'French' AND (power IS NULL OR power = '*') THEN 1 ELSE 0 END) AS FLOAT) * 100 / SUM(CASE WHEN power IS NULL OR power = '*' THEN 1 ELSE 0 END) FROM foreign_data WHERE power IS NULL OR power = '*'
SELECT CAST(SUM(CASE WHEN language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data WHERE language = 'Japanese'; 
SELECT DISTINCT availability FROM cards WHERE artist = 'Daren Bader'; 
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000; 
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3; 
SELECT language FROM foreign_data WHERE multiverseid = 149934;
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards; 
SELECT number FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'; 
SELECT s.name AS setName, s.releaseDate FROM sets s WHERE s.mtgoCode IS NULL OR s.mtgoCode = '' ORDER BY s.name ASC LIMIT 3; 
SELECT DISTINCT st.language FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE s.mcmName = 'Archenemy' AND s.code = 'ARC'; 
SELECT s.name, st.translation FROM sets AS s JOIN set_translations AS st ON s.id = st.set_id WHERE s.id = 5; 
SELECT T1.language, T2.type FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.id = 206;
SELECT DISTINCT s.id, s.name FROM sets s JOIN foreign_data fd ON s.code = fd.setCode WHERE fd.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese'
SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setcode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 JOIN set_translations AS T2 ON T1.setcode = T2.setcode WHERE T2.language = 'Chinese Simplified'; 
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND mtgoCode IS NULL OR mtgoCode = ''
SELECT id FROM cards WHERE borderColor = 'black'; 
SELECT id FROM cards WHERE frameEffects = 'extendedart'; 
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT T1.language FROM set_translations AS T1 JOIN sets AS T2 ON T1.setcode = T2.code WHERE T2.id = 174
SELECT name FROM sets WHERE code = 'ALL'; 
SELECT T1.language FROM foreign_data AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'A Pedra Fellwar'; 
SELECT code FROM sets WHERE releaseDate = '2007-07-13'; 
SELECT baseSetSize, setCode FROM sets WHERE block IN ('Masques', 'Mirage'); 
SELECT setCode FROM sets WHERE type = 'expansion';
SELECT f.name, f.type FROM foreign_data AS f JOIN cards AS c ON f.uuid = c.uuid WHERE c.watermark = 'Boros'; 
SELECT DISTINCT T1.language, T1.flavorText, T2.type FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'colorpie';
SELECT CAST(SUM(CASE WHEN convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Abyssal Horror'); 
SELECT DISTINCT s.setCode FROM sets s JOIN legalities l ON s.code = l.uuid WHERE l.format = 'commander'; 
SELECT T1.name, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Abzan'
SELECT T1.language, T2.type FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Azorius' GROUP BY T1.language, T2.type
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL; 
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '+3'; 
SELECT name FROM cards WHERE isTextless = 0; 
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL); 
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'; 
SELECT JSON_EXTRACT(purchaseUrls, '$.cardKingdom') AS cardKingdomUrl,        JSON_EXTRACT(purchaseUrls, '$.cardmarket') AS cardmarketUrl,        JSON_EXTRACT(purchaseUrls, '$.tcgplayer') AS tcgplayerUrl FROM cards WHERE promoTypes LIKE '%bundle%';
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'; 
SELECT      CASE          WHEN (SELECT convertedManaCost FROM cards WHERE name = 'Serra Angel') > (SELECT convertedManaCost FROM cards WHERE name = 'Shrine Keeper') THEN 'Serra Angel'         ELSE 'Shrine Keeper'     END AS card_with_more_converted_mana_cost; 
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian'; 
SELECT COUNT(*) FROM foreign_data WHERE name = 'Angel of Mercy';
SELECT c.name FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'; 
SELECT EXISTS (     SELECT 1     FROM foreign_data     WHERE name = 'Ancestor''s Chosen'       AND language = 'Korean' ); 
SELECT COUNT(*) FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'; 
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT t2.translation FROM sets AS t1 JOIN set_translations AS t2 ON t1.code = t2.setCode WHERE t1.name = 'Eighth Edition' AND t2.language = 'Chinese Simplified'; 
SELECT EXISTS (     SELECT 1     FROM cards     JOIN sets ON cards.setCode = sets.code     WHERE cards.name = 'Angel of Mercy'       AND sets.mtgoCode IS NOT NULL ); 
SELECT T.releaseDate FROM sets AS T JOIN cards AS C ON T.code = C.setCode WHERE C.name = 'Ancestor''s Chosen'
SELECT t2.type FROM set_translations AS t1 JOIN sets AS t2 ON t1.setCode = t2.code WHERE t1.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(DISTINCT s.id) AS ice_age_sets_with_italian_translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL; 
SELECT isForeignOnly FROM cards WHERE name = 'Adarkar Valkyrie'; 
SELECT COUNT(DISTINCT s.id) FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100; 
SELECT COUNT(*) FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.borderColor = 'black'; 
SELECT c.name FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1; 
SELECT DISTINCT artist FROM cards WHERE artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap'); 
SELECT name FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap') AND number = '4'; 
SELECT COUNT(*)  FROM cards  JOIN sets ON cards.setCode = sets.code  WHERE sets.name = 'Coldsnap' AND cards.convertedManaCost > 5 AND (cards.power = '*' OR cards.power IS NULL); 
SELECT flavorText FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND language = 'Italian'; 
SELECT DISTINCT language FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL; 
SELECT t1.type FROM foreign_data AS t1 JOIN cards AS t2 ON t1.uuid = t2.uuid WHERE t1.name = 'Ancestor''s Chosen' AND t1.language = 'German'; 
SELECT r.text FROM rulings r JOIN cards c ON r.uuid = c.uuid JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Italian' AND st.translation = 'Coldsnap'; 
SELECT c.name FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE st.language = 'Italian' AND st.translation = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1; 
SELECT date FROM rulings WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Reminisce'); 
SELECT CAST(SUM(CASE WHEN convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' )
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Coldsnap' ); 
SELECT code FROM sets WHERE releaseDate = '2017-07-14'; 
SELECT keyruneCode FROM sets WHERE code = 'PKHC'; 
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'; 
SELECT TYPE FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_or_degraded_properties_and_values FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'; 
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'
SELECT COUNT(*) FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara'; 
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'; 
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code IN (SELECT setCode FROM cards WHERE name = 'Tendo Ice Bridge') WHERE st.language = 'French'; 
SELECT COUNT(*) FROM set_translations WHERE name = 'Tenth Edition' AND translation IS NOT NULL
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode JOIN cards c ON s.code = c.setCode WHERE c.name = 'Fellwar Stone' AND st.language = 'Japanese'; 
SELECT name FROM cards WHERE setCode IN (SELECT code FROM sets WHERE name = 'Journey into Nyx Hero''s Path') ORDER BY convertedManaCost DESC LIMIT 1; 
SELECT s.releaseDate FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Ola de frío'; 
SELECT t1.type FROM sets AS t1 JOIN cards AS t2 ON t1.code = t2.setCode WHERE t2.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3; 
SELECT t1.translation FROM set_translations AS t1 JOIN sets AS t2 ON t1.setCode = t2.setCode WHERE t2.name = 'Mirrodin' AND t1.language = 'Chinese Simplified'
SELECT CAST(SUM(CASE WHEN isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data WHERE language = 'Japanese'; 
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE uuid IN ( SELECT uuid FROM set_translations WHERE language = 'Portuguese (Brazil)' )
SELECT DISTINCT availability FROM cards WHERE artist != 'Aleksi Briclot' AND isTextless = 1
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets); 
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'; 
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT name, manaCost FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE format = 'duel' ORDER BY manaCost DESC LIMIT 10; 
SELECT MIN(c.originalReleaseDate), GROUP_CONCAT(DISTINCT l.format ORDER BY l.format SEPARATOR ', ') AS formats FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' GROUP BY c.uuid ORDER BY c.originalReleaseDate ASC LIMIT 1; 
SELECT COUNT(*) FROM foreign_data WHERE artist = 'Volkan Baǵa' AND language = 'French'; 
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types LIKE '%Enchantment%' AND c.name = 'Abundance' AND l.status = 'Legal'; 
SELECT format, GROUP_CONCAT(name SEPARATOR ', ') AS card_names FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE status = 'Banned' GROUP BY format ORDER BY COUNT(status = 'Banned') DESC LIMIT 1
SELECT language FROM set_translations WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Battlebond' )
SELECT artist, format FROM cards JOIN legalities ON cards.uuid = legalities.uuid GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1; 
SELECT status FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE frameVersion = '1997' AND artist = 'D. Alexander Gregory' AND hasContentWarning = 1 AND format = 'legacy'
SELECT c.name, l.format FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'
SELECT AVG(id), language  FROM sets  WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31'  GROUP BY language  ORDER BY COUNT(language) DESC  LIMIT 1; 
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena%'
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted'); 
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'; 
SELECT r.text FROM rulings AS r JOIN cards AS c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC; 
SELECT DISTINCT c.name, l.format FROM cards c JOIN set_translations st ON c.setCode = st.setCode JOIN sets s ON st.setId = s.id JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'; 
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language LIKE '%Korean%' AND NOT EXISTS (     SELECT 1     FROM set_translations st2     WHERE s.code = st2.setCode       AND st2.language LIKE '%Japanese%' ); 
SELECT DISTINCT t1.frameVersion, t2.name FROM sets AS t1 JOIN cards AS t2 ON t1.code = t2.setCode WHERE t2.artist = 'Allen Williams' AND EXISTS ( SELECT 1 FROM legalities AS t3 WHERE t3.uuid = t2.uuid AND t3.status = 'Banned' )
SELECT DisplayName, MAX(Reputation) AS HighestReputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') GROUP BY DisplayName; 
SELECT DisplayName FROM users WHERE YEAR(CreationDate) = 2011; 
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1; 
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013; 
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie'; 
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie'; 
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'; 
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1; 
SELECT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts); 
SELECT SUM(posts.CommentCount) AS TotalComments FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'; 
SELECT MAX(posts.AnswerCount) AS MostAnswers FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'; 
SELECT LastEditorDisplayName FROM posts WHERE Title = 'Examples for teaching: Correlation does not mean causation'; 
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'csgillespie' AND ParentId IS NULL; 
SELECT DISTINCT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20; 
SELECT u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'; 
SELECT p.Body FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'; 
SELECT p.Body FROM posts p JOIN tags t ON p.ExcerptPostId = t.Id WHERE t.Count = (SELECT MAX(Count) FROM tags); 
SELECT COUNT(*) AS BadgeCount FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie'; 
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT COUNT(*) FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011; 
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1)
SELECT AVG(posts.Score) AS AverageScore FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'; 
SELECT AVG(COUNT(badge.Name)) FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE u.Views > 200 GROUP BY u.DisplayName
SELECT CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(p.Id) AS Percentage FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 5; 
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate LIKE '2010-07-19%'; 
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'; 
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments); 
SELECT COUNT(c.Id) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910; 
SELECT p.FavoriteCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.UserId = 3025 AND c.CreationDate = '2014-04-23 20:29:39.0'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ParentId = 107829 AND p.CommentCount = 1; 
SELECT CASE WHEN c.CreationDate = '2013-07-12 09:08:18.0' AND p.ClosedDate IS NULL THEN 'Not Well-Finished'            ELSE 'Well-Finished'       END AS PostStatus FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = 23853; 
SELECT Reputation FROM users WHERE Id = ( SELECT OwnerUserId FROM posts WHERE Id = 65041 )
SELECT COUNT(*) AS NumberOfPosts FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'; 
SELECT UserDisplayName FROM users WHERE Id = (SELECT UserId FROM votes WHERE Id = 6347)
SELECT COUNT(*) FROM votes AS v JOIN posts AS p ON v.PostId = p.Id WHERE p.Title LIKE '%data visualization%'; 
SELECT badges.Name FROM users JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms'; 
SELECT CAST(COUNT(posts.Id) AS FLOAT) / COUNT(votes.Id) AS PostToVoteRatio FROM posts JOIN votes ON posts.OwnerUserId = votes.UserId AND posts.Id = votes.PostId WHERE posts.OwnerUserId = 24; 
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'; 
SELECT Text FROM comments WHERE Score = 17; 
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost'; 
SELECT u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%thank you user93%'; 
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion'; 
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'; 
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10; 
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.LastEditorUserId WHERE p.Title = 'Open source tools for visualizing multi-dimensional data?'
SELECT Title FROM posts WHERE LastEditorDisplayName = 'Vebjorn Ljosa'; 
SELECT SUM(posts.Score) AS TotalScore, users.WebsiteUrl FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny'; 
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND c.Score > 60; 
SELECT SUM(T2.BountyAmount) AS TotalBountyAmount FROM posts AS T1 JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'; 
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%' 
SELECT AVG(posts.ViewCount) AS AverageViewCount, posts.Title, comments.Text FROM posts JOIN comments ON posts.Id = comments.PostId WHERE posts.Tags LIKE '%<humor>%' GROUP BY posts.Title, comments.Text; 
SELECT COUNT(*) FROM comments WHERE UserId = 13; 
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1; 
SELECT UserId FROM posts ORDER BY Views ASC LIMIT 1; 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011; 
SELECT COUNT(UserId) FROM badges GROUP BY UserId HAVING COUNT(Name) > 5
SELECT COUNT(DISTINCT u.UserId) AS NumberOfUsers FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York, NY' AND b.Name IN ('Teacher', 'Supporter'); 
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1; 
SELECT uh.UserId FROM postHistory ph JOIN posts p ON ph.PostId = p.Id GROUP BY uh.UserId HAVING COUNT(ph.PostId) = 1 AND SUM(p.Views) >= 1000; 
SELECT u.DisplayName AS UserName, b.Name AS BadgeName FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Id IN (     SELECT c.UserId     FROM comments c     GROUP BY c.UserId     ORDER BY COUNT(c.Id) DESC     LIMIT 1 ); 
SELECT COUNT(DISTINCT u.Id) AS TeacherBadgeUsersFromIndia FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'; 
SELECT      ((SUM(CASE WHEN YEAR(Date) = 2010 THEN 1 ELSE 0 END) / COUNT(Name)) - (SUM(CASE WHEN YEAR(Date) = 2011 THEN 1 ELSE 0 END) / COUNT(Name))) * 100 AS PercentageDifference FROM      badges WHERE      Name = 'Student'; 
SELECT PostHistoryTypeId, COUNT(DISTINCT UserId) AS UniqueUserCount FROM postHistory WHERE PostId = 3720 GROUP BY PostHistoryTypeId
SELECT p.Title, p.ViewCount  FROM posts p  JOIN postLinks pl ON p.Id = pl.RelatedPostId  WHERE pl.PostId = 61217; 
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395; 
SELECT PostId, UserId FROM posts WHERE Score > 60; 
SELECT SUM(FavoriteCount) AS TotalFavoriteCount FROM posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011; 
SELECT AVG(UpVotes) AS AverageUpVotes, AVG(Age) AS AverageAge FROM users WHERE Id IN (     SELECT OwnerUserId     FROM posts     GROUP BY OwnerUserId     HAVING COUNT(PostId) > 10 ); 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'; 
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'; 
SELECT COUNT(*) FROM comments WHERE Score > 60; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'; 
SELECT COUNT(Id) FROM posts WHERE Score = 10; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users); 
SELECT u.Reputation FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'
SELECT DISTINCT b.Date FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'; 
SELECT CAST(SUM(CASE WHEN Name = 'Teacher' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(UserId) AS Percentage FROM badges; 
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(u.UserId) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer'; 
SELECT c.Score FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.CreationDate = '2010-07-19 19:19:56.0'; 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'; 
SELECT u.Age FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria'; 
SELECT COUNT(*) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND T1.Age BETWEEN 19 AND 65
SELECT SUM(u.Views) AS TotalViews FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'; 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users); 
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie'; 
SELECT COUNT(b.UserId) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65; 
SELECT DisplayName FROM users WHERE Id = 30; 
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY';
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010; 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio FROM votes; 
SELECT t.TagName FROM tags t JOIN posts p ON t.ExcerptPostId = p.Id JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'John Salvatier'; 
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Daniel Vassallo'; 
SELECT COUNT(*) FROM users AS u JOIN votes AS v ON u.Id = v.UserId WHERE u.DisplayName = 'Harlan'
SELECT PostId FROM posts WHERE OwnerDisplayName = 'slashnick' ORDER BY AnswerCount DESC LIMIT 1; 
SELECT p.Title, p.ViewCount FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ORDER BY p.ViewCount DESC LIMIT 1; 
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Matt Parker' AND Id IN (SELECT PostId FROM votes WHERE VoteTypeId > 4); 
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score < 60 AND posts.OwnerDisplayName = 'Neil McGuigan'; 
SELECT DISTINCT t2.Tags FROM users AS t1 INNER JOIN posts AS t2 ON t1.Id = t2.OwnerUserId WHERE t1.DisplayName = 'Mark Meckes' AND t2.CommentCount = 0
SELECT DisplayName FROM users WHERE Id IN ( SELECT UserId FROM badges WHERE Name = 'Organizer' )
SELECT CAST(SUM(CASE WHEN T1.Tags LIKE '%r%' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(T1.PostId) FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Tags LIKE '%' + T2.TagName + '%' WHERE T1.OwnerDisplayName = 'Community'
SELECT      (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -       SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id; 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014; 
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'; 
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users); 
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'; 
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60; 
SELECT p.Title, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score > 60; 
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE YEAR(T2.Date) = 2011 AND T1.Location LIKE '%North Pole%'
SELECT u.DisplayName, u.WebsiteUrl FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150; 
SELECT ph.PostHistoryTypeId, COUNT(ph.Id) AS HistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY ph.PostHistoryTypeId; 
SELECT LastAccessDate, Location FROM users WHERE Id IN (     SELECT UserId     FROM badges     WHERE Name = 'Outliers' ); 
SELECT p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.RelatedPostId WHERE pl.PostId = (     SELECT Id     FROM posts     WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' ); 
SELECT p.PostId, b.Name FROM posts p JOIN badges b ON p.OwnerUserId = b.UserId WHERE p.OwnerDisplayName = 'Samuel' AND YEAR(b.Date) = 2013; 
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1
SELECT u.DisplayName, u.Location FROM users u JOIN tags t ON u.Id = t.ExcerptPostId WHERE t.TagName = 'hypothesis-testing'; 
SELECT p.Title, pl.LinkTypeId FROM postLinks pl JOIN posts p ON pl.RelatedPostId = p.Id WHERE p.Title = 'What are principal component scores?'
SELECT p.OwnerDisplayName FROM posts p JOIN (     SELECT PostId, MAX(Score) AS MaxScore     FROM posts     WHERE ParentId IS NOT NULL     GROUP BY PostId ) sub ON p.ParentId = sub.PostId AND p.Score = sub.MaxScore; 
SELECT T1.DisplayName, T1.WebsiteUrl FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.VoteTypeId = 8 ORDER BY T2.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1; 
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50; 
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users); 
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%' 
SELECT COUNT(CASE WHEN YEAR(CreationDate) = 2010 AND AnswerCount <= 2 THEN 1 ELSE NULL END) / 12 AS AvgMonthlyLinks FROM postLinks; 
SELECT p.PostId FROM posts p JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1; 
SELECT p.Title FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId ORDER BY p.CreationDate ASC LIMIT 1
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM badges GROUP BY UserId ORDER BY COUNT(Name) DESC LIMIT 1)
SELECT MIN(v.CreationDate) AS FirstVoteDate FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl'; 
SELECT MIN(CreationDate) AS FirstPostDate FROM posts JOIN users ON posts.OwnerUserId = users.Id ORDER BY users.Age ASC LIMIT 1; 
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM badges WHERE Name = 'Autobiographer' ORDER BY Date ASC LIMIT 1)
SELECT COUNT(DISTINCT u.Id) AS UserCount FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' GROUP BY u.Id HAVING SUM(p.FavoriteCount) >= 4; 
SELECT AVG(PostId) FROM votes JOIN users ON votes.UserId = users.Id WHERE users.Age = (SELECT MAX(Age) FROM users); 
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1; 
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65; 
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND YEAR(CreationDate) = 2010; 
SELECT Id, Title FROM posts WHERE OwnerDisplayName = 'Harvey Motulsky' ORDER BY ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1; 
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'Stephen Turner'
SELECT DISTINCT u.DisplayName FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND YEAR(p.CreationDate) = 2011; 
SELECT Id, OwnerDisplayName FROM posts WHERE YEAR(CreationDate) = 2010 ORDER BY FavoriteCount DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN YEAR(p.CreationDate) = 2011 AND u.Reputation > 1000 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM posts p JOIN users u ON p.OwnerUserId = u.Id
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(Id) AS Percentage FROM users; 
SELECT p.ViewCount, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Text LIKE '%Computer Game Datasets%' ORDER BY p.LasActivityDate DESC LIMIT 1; 
SELECT COUNT(*) FROM posts WHERE ViewCount > ( SELECT AVG(ViewCount) FROM posts )
SELECT COUNT(*) AS NumberOfComments FROM comments WHERE PostId = (     SELECT Id     FROM posts     ORDER BY Score DESC     LIMIT 1 ); 
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0; 
SELECT LastEditorDisplayName, Location FROM posts WHERE Id = 183 ORDER BY LastEditDate DESC LIMIT 1
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1; 
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000; 
SELECT DATEDIFF(b.Date, u.CreationDate) AS TimeToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon'; 
SELECT COUNT(DISTINCT p.Id) AS NumberOfPosts,        COUNT(DISTINCT c.Id) AS NumberOfComments FROM users u JOIN posts p ON u.Id = p.OwnerUserId LEFT JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users); 
SELECT c.Text, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10; 
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol'; 
SELECT COUNT(*) FROM tags WHERE TagName = 'careers'; 
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'; 
SELECT COUNT(comments.Id) AS CommentCount, SUM(CASE WHEN posts.PostTypeId = 2 THEN 1 ELSE 0 END) AS AnswerCount FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.Title = 'Clustering 1D data'; 
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30; 
SELECT CAST(SUM(CASE WHEN Score > 50 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1); 
SELECT COUNT(*) FROM posts WHERE Score < 20; 
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20; 
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'; 
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)';
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'; 
SELECT TOP 1 c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC; 
SELECT u.CreationDate, u.Age FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text LIKE '%http://%'; 
SELECT COUNT(DISTINCT p.PostId) AS PostCount FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5; 
SELECT COUNT(*) FROM posts WHERE CommentCount = 1 AND Id IN (SELECT PostId FROM comments WHERE Score = 0); 
SELECT COUNT(DISTINCT c.UserId) FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40
SELECT p.Id, c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'
SELECT u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'R is also lazy evaluated.' 
SELECT c.Text FROM comments c JOIN users u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky'; 
SELECT u.DisplayName FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND u.DownVotes = 0; 
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON hp.hero_id = sh.id WHERE sh.superhero_name = '3-D Man'; 
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength'; 
SELECT COUNT(*)  FROM superhero  JOIN hero_power ON superhero.id = hero_power.hero_id  JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200; 
SELECT T2.full_name FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T2.full_name HAVING COUNT(T2.full_name) > 15; 
SELECT COUNT(*) FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue'); 
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse'; 
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility'; 
SELECT s.superhero_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' AND s.hair_colour_id = c.id AND c.colour = 'Blond'; 
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'; 
SELECT s.superhero_name, s.height_cm FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC; 
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT c.colour, COUNT(s.superhero_id) AS count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY count DESC;
SELECT AVG(height_cm) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id JOIN publisher pu ON s.publisher_id = pu.id WHERE pu.publisher_name = 'Marvel Comics' AND p.power_name = 'Super Strength'; 
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics'; 
SELECT p.publisher_name FROM publisher p JOIN superhero s ON p.id = s.publisher_id JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1; 
SELECT COUNT(*) FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id JOIN publisher AS p ON s.publisher_id = p.id WHERE c.colour = 'Gold' AND p.publisher_name = 'Marvel Comics'; 
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II'; 
SELECT COUNT(*) FROM superhero WHERE hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond'); 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1; 
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'Copycat'; 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50; 
SELECT T2.superhero_name FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN superpower AS T3 ON T1.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE s.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND a.attribute_name = 'Strength' AND ha.attribute_value = 100; 
SELECT T2.superhero_name FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T2.superhero_name ORDER BY COUNT(T2.superhero_name) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire'); 
SELECT ROUND((SUM(CASE WHEN T2.alignment = 'Bad' THEN 1 ELSE 0 END) / COUNT(T1.id)) * 100, 2) AS percentage_bad_alignment ,  SUM(CASE WHEN T2.alignment = 'Bad' AND T3.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS count_marvel_bad_alignment FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id
SELECT      (SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -       SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS difference FROM      superhero AS T1 JOIN      publisher AS T2 ON T1.publisher_id = T2.id; 
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'; 
SELECT AVG(attribute_value) FROM hero_attribute;
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL; 
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Female'); 
SELECT sp.power_name FROM superpower sp JOIN hero_power hp ON sp.id = hp.power_id JOIN superhero s ON hp.hero_id = s.id JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Male' LIMIT 5; 
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien')
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IN (SELECT id FROM colour WHERE colour = 'No Colour')
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id WHERE hp.hero_id = 56; 
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad'); 
SELECT r.race FROM race AS r JOIN superhero AS s ON r.id = s.race_id WHERE s.weight_kg = 169; 
SELECT c.colour AS hair_colour FROM superhero s JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE s.height_cm = 185 AND r.race = 'Human'; 
SELECT c.colour FROM colour AS c JOIN superhero AS s ON c.id = s.eye_colour_id ORDER BY s.weight_kg DESC LIMIT 1; 
SELECT ROUND((SUM(CASE WHEN T2.publisher_id = 13 THEN 1 ELSE 0 END) / COUNT(T1.id)) * 100, 2) AS percentage FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180; 
SELECT superhero_name FROM superhero WHERE gender_id = 1 AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero); 
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id GROUP BY sp.power_name ORDER BY COUNT(sp.power_name) DESC LIMIT 1; 
SELECT ha.attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination'; 
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id WHERE hp.hero_id = 1; 
SELECT COUNT(*) FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth'; 
SELECT T1.full_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT AVG(CASE WHEN T1.skin_colour_id IS NULL THEN 1 ELSE 0 END) AS avg_no_skin_colour FROM superhero AS T1 LEFT JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'No Colour'
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics'; 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1; 
SELECT c.colour FROM colour AS c JOIN superhero AS s ON c.id = s.eye_colour_id WHERE s.full_name = 'Abraham Sapien'; 
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Flight'; 
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T2.gender_id = 2 AND T3.publisher_name = 'Dark Horse Comics'
SELECT s.superhero_name, p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.hair_colour_id = s.skin_colour_id AND s.hair_colour_id = s.eye_colour_id; 
SELECT T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'A-Bomb'
SELECT      ROUND(         (COUNT(CASE WHEN T1.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') THEN 1 END) /           COUNT(*)) * 100,      2) AS percentage_blue_female_superheroes FROM      superhero AS T1 JOIN      colour AS T2 ON T1.skin_colour_id = T2.id WHERE      T1.gender_id = (SELECT id FROM gender WHERE gender = 'Female'); 
SELECT superhero_name, race FROM superhero WHERE full_name = 'Charles Chandler'; 
SELECT T.gender FROM ( SELECT T1.gender, CASE WHEN T1.superhero_name = 'Agent 13' THEN T1.gender ELSE NULL END AS gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id ) T WHERE T.gender IS NOT NULL; 
SELECT T2.superhero_name FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN superpower AS T3 ON T1.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(*) AS number_of_powers FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id WHERE superhero_name = 'Amazo'; 
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS s ON hp.hero_id = s.id WHERE s.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Black' AND s.hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Black' ); 
SELECT T1.eye_colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire'); 
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT COUNT(*) AS NumberOfHeroesWithHighestStrength FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength')); 
SELECT T2.race, T3.alignment FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'; 
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'
SELECT AVG(weight_kg) AS average_weight FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Alien'); 
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference
SELECT AVG(height_cm) FROM superhero
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination'; 
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1; 
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3; 
SELECT T2.attribute_name, T1.attribute_value FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'
SELECT superhero_name FROM superhero WHERE eye_colour_id IN ( SELECT id FROM colour WHERE colour = 'Blue' ) AND hair_colour_id IN ( SELECT id FROM colour WHERE colour = 'Brown' )
SELECT T.publisher_name FROM (     SELECT p.publisher_name     FROM superhero s     JOIN publisher p ON s.publisher_id = p.id     WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') ) AS T; 
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1; 
SELECT CAST(SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS FLOAT) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero; 
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1; 
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294; 
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL; 
SELECT T1.eye_colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.full_name = 'Karen Beecher-Duncan'
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr'; 
SELECT T.race FROM ( SELECT R.race, H.weight_kg, H.height_cm FROM race AS R JOIN superhero AS H ON R.id = H.race_id WHERE H.weight_kg = 108 AND H.height_cm = 188 ) t; 
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38; 
SELECT r.race FROM race r JOIN superhero s ON r.id = s.race_id JOIN (     SELECT hero_id, MAX(attribute_value) AS max_attr_value     FROM hero_attribute     GROUP BY hero_id ) ha ON s.id = ha.hero_id; 
SELECT a.alignment, sp.power_name FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV'; 
SELECT superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5; 
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE s.alignment_id = 3; 
SELECT T3.colour FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T1.attribute_value = 100
SELECT COUNT(*) FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id JOIN alignment AS a ON s.alignment_id = a.id WHERE g.gender = 'Female' AND a.id = 1; 
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80; 
SELECT r.race FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE c.colour = 'blue' AND g.gender = 'Male'; 
SELECT CAST(SUM(CASE WHEN T1.gender_id = 2 THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Bad'; 
SELECT SUM(CASE WHEN T2.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.eye_colour_id = 1 THEN 1 ELSE 0 END) AS diff FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL
SELECT T1.attribute_value FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Strength' AND T3.superhero_name = 'Hulk'
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS s ON hp.hero_id = s.id WHERE s.superhero_name = 'Ajax'; 
SELECT COUNT(*) FROM superhero  JOIN colour ON superhero.skin_colour_id = colour.id  JOIN alignment ON superhero.alignment_id = alignment.id  WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad'; 
SELECT COUNT(*) FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id JOIN gender AS g ON s.gender_id = g.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'; 
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower p ON hp.power_id = p.id WHERE p.power_name = 'Wind Control' ORDER BY s.superhero_name; 
SELECT g.gender FROM gender g JOIN superhero s ON g.id = s.gender_id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force'; 
SELECT s.superhero_name, s.weight_kg FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1; 
SELECT AVG(height_cm) AS avg_height FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE race != 'Human' AND publisher_name = 'Dark Horse Comics'; 
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100; 
SELECT (SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id; 
SELECT T1.attribute_name FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT CAST(SUM(CASE WHEN T1.gender = 'Female' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas'
SELECT CAST(SUM(CASE WHEN T2.alignment = 'Good' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'; 
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Brown')
SELECT ha.attribute_value FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy'; 
SELECT T1.weight_kg, T3.race FROM superhero AS T1 JOIN race AS T3 ON T1.race_id = T3.id WHERE T1.id = 40
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT h.id FROM superhero h JOIN hero_power hp ON h.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence'; 
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf'; 
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS s ON hp.hero_id = s.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero WHERE height_cm IS NOT NULL AND height_cm != 0); 
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q1 IS NOT NULL ORDER BY T2.q1 DESC LIMIT 5
SELECT T2.surname FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.q2 IS NOT NULL ORDER BY T1.q2 ASC LIMIT 1
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE c.location = 'Shanghai'; 
SELECT url FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya'
SELECT r.name FROM races AS r JOIN circuits AS c ON r.circuitid = c.circuitid WHERE c.country = 'Germany'; 
SELECT DISTINCT T1.position FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.name = 'Renault'
SELECT COUNT(*) FROM races WHERE YEAR = 2010 AND name LIKE '%Grand Prix%' AND country NOT IN ('Asia', 'Europe'); 
SELECT r.name FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE c.country = 'Spain'; 
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Australian Grand Prix'
SELECT url FROM circuits WHERE name = 'Sepang International Circuit'
SELECT T2.date, T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'; 
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix'; 
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.raceid = 24 AND T2.round = 24
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna') AND raceId = 354; 
SELECT d.nationality FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.q2 = '0:01:40' AND q.qualifyId = 355; 
SELECT T1.number FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.q3 LIKE '1:54%' AND T2.raceid = 903
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND YEAR = 2007) AND TIME IS NULL; 
SELECT T1.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceid = 901; 
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND TIME IS NOT NULL; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1
SELECT D.url FROM drivers AS D JOIN laptimes AS L ON D.driverid = L.driverid WHERE L.laptime LIKE '0:01:27%' AND L.raceid = 161
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlapspeed = ( SELECT MAX(fastestlapspeed) FROM results ) AND T2.raceid = 933; 
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 ORDER BY T2.points DESC LIMIT 1; 
SELECT q1 FROM qualifying WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lucas' AND surname = 'Di Grassi') AND raceId = 345; 
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q2 = '0:01:15' AND T2.raceId = 347; 
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q3 LIKE '1:33%' AND T2.raceId = 45; 
SELECT T1.time, T1.milliseconds FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 743 AND T2.forename = 'Bruce' AND T2.surname = 'McLaren'; 
SELECT T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 2 AND T2.raceid IN (SELECT raceid FROM races WHERE name = 'San Marino Grand Prix' AND YEAR = 2006)
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901; 
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND TIME IS NULL
SELECT MIN(dob) AS youngest_driver_dob FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE raceId = 872 AND time IS NOT NULL; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 348 ORDER BY TIME ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT ((SELECT fastestLapSpeed FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) - (SELECT fastestLapSpeed FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 854)) * 100 / (SELECT fastestLapSpeed FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) AS percentage_faster; 
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverid) AS percentage FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.date = '1983-07-16'; 
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*) AS total_races, name FROM races WHERE YEAR = 2005 ORDER BY date DESC; 
SELECT name FROM races WHERE YEAR(date) = YEAR(MIN(date)) AND MONTH(date) = MONTH(MIN(date)); 
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1; 
SELECT YEAR FROM races GROUP BY YEAR ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT DISTINCT name FROM races WHERE YEAR != 2000 AND YEAR = 2017; 
SELECT c.country, c.name, c.location FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = (     SELECT MIN(year)     FROM races     WHERE country IN ('Germany', 'France', 'Italy', 'Spain') ) AND r.country IN ('Germany', 'France', 'Italy', 'Spain'); 
SELECT MAX(year) AS last_season FROM races JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Brands Hatch' AND races.name = 'British Grand Prix'; 
SELECT COUNT(*) FROM circuits AS c JOIN races AS r ON c.circuitid = r.circuitid WHERE c.name = 'Silverstone' AND r.name LIKE '%British%'
SELECT D.forename, D.surname FROM drivers AS D JOIN results AS R ON D.driverId = R.driverId JOIN races AS Ra ON R.raceId = Ra.raceId WHERE Ra.name = 'Singapore Grand Prix' AND Ra.year = 2010 ORDER BY R.position; 
SELECT T1.forename, T1.surname, MAX(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid GROUP BY T1.driverid;
SELECT d.forename, d.surname, rs.points FROM drivers AS d JOIN results AS rs ON d.driverid = rs.driverid JOIN races AS r ON rs.raceid = r.raceid WHERE r.name = 'Chinese Grand Prix' AND r.year = 2017 ORDER BY rs.points DESC LIMIT 3
SELECT D.forename, D.surname, R.name FROM drivers AS D JOIN results AS R ON D.driverId = R.driverId ORDER BY R.fastestLapTime ASC LIMIT 1
SELECT AVG(T2.milliseconds) FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Malaysian Grand Prix' AND T3.year = 2009
SELECT CAST(SUM(CASE WHEN T1.surname = 'Hamilton' AND T2.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.surname) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.surname = 'Hamilton' AND T2.year >= 2010; 
SELECT d.forename, d.surname, d.nationality, MAX(rs.points) AS max_points FROM drivers d JOIN driverstandings rs ON d.driverid = rs.driverid WHERE rs.wins > 0 GROUP BY d.driverid ORDER BY max_points DESC LIMIT 1; 
SELECT MIN(YEAR(CURRENT_DATE) - YEAR(dob)) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese'; 
SELECT DISTINCT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE YEAR(T1.date) BETWEEN 1990 AND 2000 GROUP BY T2.name HAVING COUNT(*) >= 4
SELECT DISTINCT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006
SELECT r.name AS RaceName, c.name AS CircuitName, c.location AS Location FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005; 
SELECT r.name FROM races AS r JOIN results AS res ON r.raceId = res.raceId JOIN drivers AS d ON res.driverId = d.driverId WHERE d.forename = 'Alex' AND d.surname = 'Yoong' AND res.position < 20
SELECT COUNT(*) FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId JOIN circuits ci ON ra.circuitId = ci.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND ci.name = 'Sepang International Circuit' AND r.position = 1; 
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T2.fastestlapspeed DESC LIMIT 1
SELECT AVG(T1.points) AS avg_points FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.surname = 'Irvine' AND T1.year = 2000; 
SELECT MIN(races.year), SUM(results.points) FROM drivers JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT r.name, c.country  FROM races r  JOIN circuits c ON r.circuitid = c.circuitid  WHERE r.year = 2017  ORDER BY r.date; 
SELECT r.name AS race_name, r.year, c.location AS circuit_location, MAX(r.laps) AS max_laps FROM races r JOIN circuits c ON r.circuitid = c.circuitid GROUP BY r.name, r.year, c.location ORDER BY max_laps DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid JOIN results AS T3 ON T2.raceid = T3.raceid JOIN drivers AS T4 ON T3.driverid = T4.driverid ORDER BY T4.dob ASC LIMIT 1; 
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'; 
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'; 
SELECT circuits.name FROM circuits JOIN races ON circuits.circuitid = races.circuitid WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix'; 
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Silverstone'
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone'
SELECT T1.date, T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2010 AND T2.name = 'Abu Dhabi Grand Prix'
SELECT COUNT(*) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = 'Italy')
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya'; 
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009
SELECT MIN(T1.fastestLapTime) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId ORDER BY r.fastestLapSpeed DESC LIMIT 1; 
SELECT T2.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2007 AND T1.name = 'Canadian Grand Prix' AND T2.position = 1
SELECT r.name FROM races r JOIN results res ON r.raceId = res.raceId JOIN drivers d ON res.driverId = d.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'; 
SELECT r.name AS race_name FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1; 
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT DISTINCT YEAR FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'; 
SELECT r.positionOrder FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.name = 'Chinese Grand Prix' ORDER BY r.position DESC LIMIT 1; 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 1989 AND ra.name = 'Australian Grand Prix' AND r.grid = 4; 
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND TIME IS NOT NULL; 
SELECT T1.fastestLapTime FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = (SELECT raceid FROM races WHERE YEAR = 2008 AND name = 'Australian Grand Prix') AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.fastestLapTime ASC LIMIT 1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Austrian Grand Prix' AND T1.rank = 2; 
SELECT d.forename, d.surname, d.url  FROM drivers d  JOIN results r ON d.driverid = r.driverid  JOIN races ra ON r.raceid = ra.raceid  WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 AND r.position = 1; 
SELECT COUNT(*) FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId JOIN races AS ra ON r.raceId = ra.raceId WHERE d.nationality = 'British' AND ra.name = 'Australian Grand Prix' AND ra.year = 2008; 
SELECT COUNT(DISTINCT d.driverId) AS numberOfDrivers FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Chinese Grand Prix' AND r.time IS NOT NULL; 
SELECT SUM(points) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT AVG(UNIX_TIMESTAMP(SUBSTRING_INDEX(fastestLapTime, '.', 1)) + UNIX_TIMESTAMP(SUBSTRING_INDEX(fastestLapTime, '.', -1))/1000) AS avg_fastest_lap_time_seconds FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS completion_rate FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'; 
SELECT ((TIMESTAMPDIFF(MILLISECOND, MIN(CASE WHEN r.position = 1 THEN r.time END), MAX(r.time)) / MAX(r.time)) * 100) AS percentage_faster FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2008 AND ra.name = 'Australian Grand Prix'; 
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Melbourne'; 
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) > 1980;
SELECT MAX(points) FROM constructors WHERE nationality = 'British'
SELECT T1.name FROM constructors AS T1 JOIN constructorstandings AS T2 ON T1.constructorid = T2.constructorid ORDER BY T2.points DESC LIMIT 1
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.points = 0 AND T2.raceId = 291;
SELECT COUNT(*)  FROM constructors  JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId  WHERE constructors.nationality = 'Japanese' AND constructorStandings.points = 0; 
SELECT c.name AS constructor_name FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE cs.position = 1; 
SELECT COUNT(*) FROM constructors AS c JOIN constructorStandings AS cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'French' AND cs.position <= 50; 
SELECT      CAST(SUM(CASE WHEN T2.time IS NOT NULL AND T1.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.DriverID) AS Percentage FROM      races AS T1 JOIN      results AS T2 ON T1.raceId = T2.raceId JOIN      drivers AS T3 ON T2.driverId = T3.driverId WHERE      T3.nationality = 'Japanese'; 
SELECT YEAR, AVG(REPLACE(SUBSTRING_INDEX(time, '.', -1), ':', '')) AS avg_time_seconds FROM results JOIN races ON results.raceId = races.raceId WHERE time IS NOT NULL AND YEAR < 1975 GROUP BY YEAR; 
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverid = r.driverid WHERE YEAR(d.dob) > 1975 AND r.rank = 2; 
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Italian' AND T2.time IS NULL;
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId ORDER BY r.fastestLapTime ASC LIMIT 1; 
SELECT fastestLap FROM results WHERE YEAR = 2009 AND position = 1; 
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Spanish Grand Prix' AND T1.year = 2009; 
SELECT r.name, s.year FROM results r JOIN races s ON r.raceId = s.raceId WHERE r.milliseconds IS NOT NULL ORDER BY r.milliseconds ASC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN YEAR(drivers.dob) < 1985 AND lapTimes.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(lapTimes.driverId) AS percentage FROM drivers JOIN lapTimes ON drivers.driverId = lapTimes.driverId WHERE YEAR(lapTimes.date) BETWEEN 2000 AND 2005; 
SELECT COUNT(*) FROM drivers d JOIN laptimes lt ON d.driverid = lt.driverid WHERE d.nationality = 'French' AND lt.time < '02:00.00'; 
SELECT code FROM drivers WHERE nationality = 'American'; 
SELECT raceId FROM races WHERE YEAR = 2009
SELECT COUNT(driverId) FROM results WHERE raceId = 18
SELECT MIN(YEAR(dob)) FROM drivers WHERE nationality = 'Dutch' LIMIT 3
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';
SELECT COUNT(*) FROM drivers WHERE YEAR(dob) = 1980 AND nationality = 'British'; 
SELECT d.forename, d.surname, MIN(l.time) AS earliest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE YEAR(d.dob) BETWEEN 1980 AND 1990 AND d.nationality = 'German' GROUP BY d.driverid ORDER BY earliest_lap_time ASC LIMIT 3; 
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT D.driverId, D.code FROM drivers D JOIN results R ON D.driverId = R.driverId WHERE YEAR(D.dob) = 1971 AND R.fastestLap IS NOT NULL; 
SELECT d.forename, d.surname, MAX(l.time) AS latest_lap_time FROM drivers d JOIN laptimes l ON d.driverid = l.driverid WHERE d.nationality = 'Spanish' AND YEAR(d.dob) < 1982 GROUP BY d.driverid ORDER BY latest_lap_time DESC LIMIT 10; 
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime ASC LIMIT 1; 
SELECT YEAR FROM races WHERE raceId = (SELECT raceId FROM results ORDER BY TIME DESC LIMIT 1)
SELECT driverId FROM results WHERE fastestLap = 1 ORDER BY fastestLapTime ASC LIMIT 5; 
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND TIME IS NOT NULL; 
SELECT COUNT(*) AS circuit_count, LOCATION, lat, lng FROM circuits WHERE country = 'Austria'; 
SELECT raceId FROM results WHERE TIME IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q2 IS NOT NULL AND T2.raceId = 23
SELECT r.year, r.name, r.date, r.time FROM races r JOIN (     SELECT MIN(q.date) AS min_date     FROM qualifying q     JOIN drivers d ON q.driverId = d.driverId     ORDER BY d.dob DESC     LIMIT 1 ) sub ON r.date = sub.min_date; 
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture'; 
SELECT c.name, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Italian' ORDER BY cs.points DESC LIMIT 1; 
SELECT T2.url FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId GROUP BY T2.constructorId ORDER BY SUM(T1.wins) DESC LIMIT 1
SELECT d.forename, d.surname, r.time FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'French Grand Prix' AND r.lap = 3 ORDER BY r.time DESC LIMIT 1; 
SELECT T1.name, MIN(T2.milliseconds) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T2.fastestLap DESC LIMIT 1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'United States Grand Prix' AND T1.rank < 11 AND T2.year = 2006
SELECT d.forename, d.surname FROM drivers d JOIN pitstops p ON d.driverid = p.driverid WHERE YEAR(d.dob) BETWEEN 1980 AND 1985 GROUP BY d.driverid ORDER BY AVG(p.duration) ASC LIMIT 3
SELECT T1.forename, T1.surname, T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.name = 'Canadian Grand Prix' AND T3.year = 2008 ORDER BY T2.position ASC LIMIT 1
SELECT c.constructorRef, c.url FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN constructorResults cr ON c.constructorId = cr.constructorId AND cs.raceId = cr.raceId JOIN races r ON cr.raceId = r.raceId WHERE r.name = 'Singapore Grand Prix' AND r.year = 2009 AND cr.position = 1; 
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991; 
SELECT forename || ' ' || surname AS fullName, url, dob FROM drivers WHERE nationality = 'German' AND YEAR(dob) BETWEEN 1971 AND 1985 ORDER BY dob DESC; 
SELECT LOCATION, COUNTRY, LAT, LNG FROM circuits WHERE NAME = 'Hungaroring'; 
SELECT c.points, c.name, c.nationality FROM constructors c JOIN constructorStandings cs ON c.constructorId = cs.constructorId JOIN races r ON cs.raceId = r.raceId WHERE r.name = 'Monaco Grand Prix' AND r.date BETWEEN '1980-01-01' AND '2010-12-31' ORDER BY c.points DESC LIMIT 1; 
SELECT AVG(T1.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' AND T1.raceId IN (SELECT raceId FROM races WHERE name = 'Turkish Grand Prix'); 
SELECT AVG(COUNT(*)) AS average_races_per_year FROM races WHERE YEAR BETWEEN 2000 AND 2010 GROUP BY YEAR; 
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT COUNT(wins) AS victory_count FROM driverStandings WHERE points = 91; 
SELECT r.name AS RaceName FROM races r JOIN results res ON r.raceId = res.raceId WHERE res.fastestLapSpeed = (     SELECT MAX(fastestLapSpeed)     FROM results ); 
SELECT name AS racetrack, location || ', ' || country AS full_location FROM circuits WHERE circuitid = (SELECT circuitid FROM races ORDER BY date DESC LIMIT 1); 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid JOIN circuits AS T3 ON T2.circuitid = T3.circuitid WHERE T3.name = 'Marina Bay Street Circuit' AND T2.position = 1 AND YEAR(T2.date) = 2008 ORDER BY T2.q3 ASC LIMIT 1
SELECT d.forename, d.surname, d.nationality, r.name AS first_race_name FROM drivers d JOIN results res ON d.driverid = res.driverid JOIN races r ON res.raceid = r.raceid WHERE d.dob = (SELECT MIN(dob) FROM drivers); 
SELECT COUNT(*) AS accident_count FROM (     SELECT driverId     FROM results     JOIN status ON results.statusId = status.statusId     WHERE status.status = 'Accident'       AND raceId IN (           SELECT raceId           FROM races           WHERE name = 'Canadian Grand Prix'       )     GROUP BY driverId     ORDER BY COUNT(*) DESC     LIMIT 1 ) AS most_accidents_driver; 
SELECT COUNT(T1.wins), T2.forename, T2.surname FROM driverstandings AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid ORDER BY T2.dob ASC LIMIT 1
SELECT MAX(duration) AS longest_pit_stop_duration FROM pitStops; 
SELECT MIN(time) FROM lapTimes;
