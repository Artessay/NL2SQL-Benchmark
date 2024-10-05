SELECT MAX("Percent (%) Eligible Free (K-12)") AS MaxEligibleFreeRate FROM frpm WHERE "County Name" = 'Alameda'
SELECT frpm.School, frpm.[Percent (%) Eligible Free (Ages 5-17)] AS EligibleFreeRate FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.GSoffered = 'Continuation High Schools' ORDER BY EligibleFreeRate ASC LIMIT 3
SELECT DISTINCT T2.Zip FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`County Name` = 'Fresno'
SELECT MailStreet FROM frpm ORDER BY `FRPM Count (K-12)` DESC LIMIT 1
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 400 AND T2.Virtual = 'F'
SELECT DISTINCT s.CDS FROM satscores s JOIN schools sch ON s.cds = sch.CDS WHERE s.NumTstTakr > 500 AND sch.Magnet = 1; 
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT T1.NumTstTakr FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T2.LowGrade = 'K' AND T2.HighGrade = '12' ORDER BY T2.[FRPM Count (K-12)] DESC LIMIT 1 
SELECT COUNT(s.CDSCode) FROM (     SELECT DISTINCT s.CDSCode     FROM satscores s     WHERE s.AvgScrMath > 560 ) AS chartered_schools JOIN frpm f ON chartered_schools.CDSCode = f.CDSCode WHERE f.Charter Funding Type = 'Directly funded'; 
SELECT T2."FRPM Count (Ages 5-17)" FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.sname = (SELECT sname FROM satscores ORDER BY AvgScrRead DESC LIMIT 1)
SELECT CDSCode FROM frpm WHERE Enrollment (K-12) + Enrollment (Ages 5-17) > 500
SELECT MAX(T1.Percent_(_Eligible_Free_Ages_5_17)) AS MaxEligibleFreeRate FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr > 0.3
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3
SELECT T2.NCESSchool FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.[FRPM Count (Ages 5-17)] DESC LIMIT 5
SELECT      s.dname AS DistrictName,      AVG(ss.AvgScrRead) AS AvgReadingScore FROM      satscores ss JOIN      schools s ON ss.cds = s.CDSCode WHERE      s.StatusType = 'Active' GROUP BY      s.dname ORDER BY      AvgReadingScore DESC LIMIT 1; 
SELECT COUNT(*) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode AND T1.County = T2.County AND T1.School = T2.School WHERE T1.StatusType = 'Merged' AND T1.County = 'Alameda' AND T2.NumTstTakr < 100
SELECT sname, CharterNum FROM satscores WHERE AvgScrWrite > 499 ORDER BY AvgScrWrite DESC
SELECT COUNT(DISTINCT s.School) FROM schools AS s JOIN frpm AS f ON s.CDS = f.CDSCode WHERE s.City = 'Fresno' AND f.FundingType = 'Directly funded' AND satscores.NumTstTakr <= 250
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12';
SELECT COUNT(*) FROM frpm AS f JOIN enrollment AS e ON f.CDSCode = e.CDSCode WHERE e.TotalEnrollment * f.[Percent (%) Eligible Free (K-12)] > 500 AND e.TotalEnrollment * f.[Percent (%) Eligible FRPM (K-12)] < 700
SELECT sname FROM satscores WHERE dname = 'Contra Costa Unified' ORDER BY NumTstTakr DESC LIMIT 1
SELECT School_Name, Street FROM frpm WHERE ABS(Enrollment_K_12 - Enrollment_Ages_5_17) > 30
SELECT f.School_Name FROM frpm f JOIN satscores s ON f.CDSCode = s.cds WHERE f.[Percent (%) Eligible Free (K-12)] > 0.
SELECT s.FundingType FROM satscores ss JOIN schools s ON ss.cds = s.CDS WHERE s.City = 'Riverside' AND ss.AvgScrMath > 400
SELECT s.School, s.Street, s.City, s.State, s.Zip FROM frpm AS f JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE f.County = 'Monterey' AND f.FRPM_Count_Ages_5_17 > 800 AND s.GSserved = '9-12'
SELECT s.sname, s.Phone, AVG(ss.AvgScrWrite) AS AvgWritingScore FROM satscores ss JOIN schools s ON ss.cds = s.CDSCode WHERE (s.OpenDate > '1991-12-31' OR s.ClosedDate < '2000-01-01') GROUP BY s.sname, s.Phone
SELECT s.School, s.DOCType FROM schools AS s JOIN frpm AS f ON s.CDSCode = f.CDSCode WHERE f.[Percent (%) Eligible FRPM (Ages 5-17)] > (SELECT AVG(f.[Percent (%) Eligible FRPM (Ages 5-17)]) FROM frpm AS f JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE f.[Charter Funding Type] = 'Locally funded')
SELECT OpenDate FROM schools WHERE GSoffered = 'K-12' ORDER BY enroll12 DESC LIMIT 1; 
SELECT T2.City FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.enroll12 ASC LIMIT 5
SELECT "School Name", CAST("Free Meal Count (K-12)" AS REAL) / "Enrollment (K-12)" AS "Eligible Free Rate" FROM frpm ORDER BY "Enrollment (K-12)" DESC LIMIT 11
SELECT School, (FRPM_Count_K_12 / Enrollment_K_12) AS Eligible_FRPM_Rate FROM frpm WHERE SOC = '66' ORDER BY FRPM_Count_K_12 DESC LIMIT 5
SELECT DISTINCT T2.Website, T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.[Free Meal Count (Ages 5-17)] BETWEEN 1900 AND 2000
SELECT (T1.Free_Meal_Count_Ages_5_17 / T1.Enrollment_Ages_5_17) AS Free_Rate FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE (T2.AdmFName1 = 'Kacey' AND T2.AdmLName1 = 'Gibson') OR (T2.AdmFName2 = 'Kacey' AND T2.AdmLName2 = 'Gibson')
SELECT T2.AdmEmail1 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode AND T1.CountyName = T2.County AND T1.DistrictName = T2.District WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1
SELECT DISTINCT T3.AdmFName1, T3.AdmLName1 FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode INNER JOIN schools AS T3 ON T2.CDSCode = T3.CDSCode WHERE T1.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores )
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr ASC LIMIT 1
SELECT T2.Website FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.NumTstTakr BETWEEN 2000 AND 3000
SELECT AVG(f.NumTstTakr) AS AverageTestTakers FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.City = 'Fresno' AND STRFTIME('%Y', s.OpenDate) = '1980'
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.district = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1 
SELECT s.School, s.County, s.AvgScrRead FROM (     SELECT s.CDS, s.School, s.County, s.AvgScrRead,            ROW_NUMBER() OVER (PARTITION BY s.County ORDER BY s.AvgScrRead DESC) AS rank     FROM satscores s     JOIN schools sc ON s.cds = sc.CDSCode     WHERE sc.Virtual = 'F' ) subquery WHERE rank <= 5; 
SELECT DISTINCT T2.EdOpsName FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = ( SELECT MAX(AvgScrMath) FROM satscores WHERE AvgScrMath IS NOT 'None' )
SELECT AVG(s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgScoreAllSubjects, sc.County FROM satscores s JOIN schools sc ON s.cds = sc.CDSCode ORDER BY AvgScoreAllSubjects ASC LIMIT 1
SELECT T2.AvgScrWrite, T2.City FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDS ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT s.sname, AVG(ss.AvgScrWrite) AS avg_writing_score FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.sname
SELECT * FROM schools WHERE DOC = 31 AND GSoffered = 'K-12' ORDER BY (Free_Meal_Count_K_12 + FRPM_Count_K_12) DESC LIMIT 1; 
SELECT COUNT(*) / 12 AS monthly_avg FROM schools WHERE SUBSTR(OpenDate, 1, 4) = '1980' AND County = 'Alameda' AND DOC = '52'
SELECT SUM(CASE WHEN DOC = '54' THEN 1 ELSE 0 END) * 1.0 / SUM(CASE WHEN DOC = '52' THEN 1 ELSE 0 END) AS ratio FROM schools WHERE County = 'Orange' AND StatusType = 'Merged';
SELECT County, School, ClosedDate FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1
{             "step": 1,             "description": "Identify the table that contains the required information. In this case, it's the `satscores` table, which has columns for school names (`sname`) and average Math scores (`AvgScrMath`)."         }
SELECT T2.MailStreet, T2.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 >= 1500 AND T2.MailCity = 'Lakeport'
SELECT SUM(f.NumTstTakr) AS TotalTestTakers FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.MailCity = 'Fresno'
SELECT DISTINCT School, MailZip, CDSCode FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'; 
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS Ratio FROM schools WHERE MailState = 'CA' AND State = 'CA';
SELECT COUNT(*) FROM schools WHERE MailState = 'CA' AND MailCity = 'San Joaquin' AND StatusType = 'Active';
SELECT T2.Phone, T2.Ext FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 332, 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND City = 'Hickman' AND DOC = 52
SELECT COUNT(*) FROM frpm WHERE Charter = 0 AND County = 'Los Angeles' AND `Percent (%) Eligible Free (K-12)` < 0.18
SELECT DISTINCT T1.AdmFName1, T1.AdmLName1, T1.School, T1.City FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.CharterNumber = '00D2' AND T1.Charter = 1
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'
SELECT (SUM(CASE WHEN T2.FundingType = 'Locally funded' THEN 1 ELSE 0 END) / COUNT(T1.CDSCode)) * 100 AS LocallyFundedPercentage FROM frpm AS T1 JOIN schools AS T2 ON T1.School Code = T2.NCESSchool WHERE T1.County Name = 'Santa Clara' AND T2.School Type LIKE '%Charter%'
SELECT COUNT(s.CDSCode) FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode AND f.County = s.County WHERE f.County = 'Stanislaus' AND s.OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND s.FundingType = 'Directly Funded'
SELECT SUM(NumTstTakr) FROM schools WHERE StatusType = 'Closed' AND STRFTIME('%Y', ClosedDate) = '1989' AND City = 'San Francisco'
SELECT County FROM schools WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1
SELECT NCESSDist FROM schools WHERE SOC = '31'
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND StatusType IN ('Active', 'Closed') AND SOCType = 'District Community Day Schools';
SELECT DISTINCT NCESDist FROM schools WHERE City = 'Fresno' AND Magnet = 0
SELECT SUM(`Enrollment (Ages 5-17)`) AS Total_Enrollment FROM frpm WHERE `EdOpsCode` = 'SSS' AND `School Name` = 'State Special School' AND `Academic Year` = '2014-2015'
SELECT frpm.FRPM_Count_Ages_5_to_17 FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.School = 'Youth Authority School' AND schools.MailStreet = 'PO Box 1040'
SELECT MIN(GSoffered) AS LowestGrade FROM schools WHERE EdOpsCode = 'SPECON' AND NCESDist = '0613360'
SELECT T2.EILName, T2.School FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County_Code = 37 AND T1.NSLP_Provision_Status = 'Breakfast Provision 2'
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Merced' AND T2.EILCode = 'HS' AND T1.LowestGrade = 9 AND T1.HighestGrade = 12
SELECT      f.School_Name AS School,     (f.FRPM_Count_Ages_5_17 / f.Enrollment_Ages_5_17) * 100 AS Percent_Eligible_FRPM FROM      frpm f JOIN      schools s ON f.School_Name = s.School WHERE      s.GSserved = 'K-9'     AND s.County = 'Los Angeles'; 
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT County, COUNT(*) AS NumberOfSchools FROM schools WHERE Virtual = 'F' GROUP BY County ORDER BY NumberOfSchools DESC LIMIT 1
SELECT School, `School Type`, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1
SELECT School, GSoffered FROM schools WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1
SELECT COUNT(s.CDSCode), s.City FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.Magnet = 1 AND f.GSoffered = 'K-8' GROUP BY s.City
SELECT AdmFName1, NCESDist, COUNT(*) AS admin_count FROM schools GROUP BY AdmFName1, NCESDist ORDER BY admin_count DESC LIMIT 2
SELECT frpm.[Percent (%) Eligible Free (K-12)], schools.NCESDist FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Alusine'
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = '40'
SELECT DISTINCT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = '62' OR DOC = '54')
SELECT T2.AdmEmail1, T2.School FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT COUNT(account.account_id) AS account_count FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'east bohemia' AND account.frequency = 'POPLATEK PO OBRATU'; 
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague'
SELECT AVG(A12) AS avg_unemp_1995, AVG(A13) AS avg_unemp_1996 FROM district WHERE A12 IS NOT NULL AND A13 IS NOT NULL;
SELECT COUNT(DISTINCT T1.district_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' AND T1.A11 BETWEEN 6000 AND 10000;
SELECT COUNT(c.client_id) FROM client c JOIN account a ON c.district_id = a.district_id JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'north Bohemia' AND a.A11 > 8000
SELECT MAX(A11) - MIN(A11) AS salary_gap FROM ( SELECT AVG(A11) AS A11 FROM client GROUP BY district_id )
SELECT account_id FROM client ORDER BY birth_date DESC, A11 DESC LIMIT 1
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER' AND T1.frequency = 'POPLATEK TYDNE'
SELECT DISTINCT T3.client_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T1.k_symbol = 'POPLATEK PO OBRATU' AND T3.type = 'DISPONENT'
SELECT T2.account_id  FROM loan AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  WHERE strftime('%Y', T1.date) = '1997' AND T2.frequency = 'POPLATEK TYDNE'  ORDER BY T1.amount ASC  LIMIT 1 
SELECT * FROM loan WHERE duration > 12; 
SELECT COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.A2 = 'Sokolov'
SELECT DISTINCT account_id FROM trans WHERE strftime('%Y', date) = '1995' ORDER BY date ASC LIMIT 1;
SELECT DISTINCT a.account_id FROM account a JOIN trans t ON a.account_id = t.account_id WHERE strftime('%Y', a.date) < '1997' AND t.amount > 3000 ORDER BY a.account_id DESC LIMIT 1
SELECT T2.client_id FROM card AS T1 JOIN client AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued = '940303'
SELECT T2.date FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.date = '1998-10-14'
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'
SELECT MAX(t.amount) FROM trans t JOIN disp d ON t.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.issued = '1996-10-21' AND t.type = 'PRIJEM'
SELECT T1.gender FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A11 = (SELECT MAX(A11) FROM district) ORDER BY T1.birth_date ASC LIMIT 1 
SELECT t.amount FROM trans t JOIN account a ON t.account_id = a.account_id WHERE a.account_id IN (SELECT d.account_id FROM disp d JOIN loan l ON d.client_id = l.account_id ORDER BY l.amount DESC LIMIT 1) AND t.date > (SELECT MIN(date) FROM account WHERE account_id IN (SELECT d.account_id FROM disp d JOIN loan l ON d.client_id = l.account_id ORDER BY l.amount DESC LIMIT 1)) ORDER BY t.date ASC LIMIT 1
SELECT COUNT(T1.client_id) AS num_women_in_jesenik_branch FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A2 = 'Jesenik' AND T1.gender = 'F' 
SELECT T1.disp_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1998-09-02' AND T1.amount = 5100
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Litomerice' AND strftime('%Y', T1.date) = '1996'
SELECT T3.A2 AS district_name FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T4.birth_date FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T2.account_id = T3.account_id JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T1.amount = 98832 AND T1.date LIKE '1996-01-%'
SELECT DISTINCT T2.account_id FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN account AS T3 ON T2.client_id = T3.client_id WHERE T1.A3 = 'Prague' ORDER BY T3.date ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'south Bohemia' ORDER BY T1.A4 DESC LIMIT 1
-- Step 1: Find the client ID associated with the loan approval date WITH client_info AS (     SELECT a.client_id     FROM loan l     JOIN account a ON l.account_id = a.account_id     WHERE l.date = '1993-07-05' ),  -- Step 2: Find the transactions related to the client's account within the specified date range transactions AS (     SELECT t.amount, t.balance     FROM trans t     JOIN account a ON t.account_id = a.account_id     WHERE a.client_id IN (SELECT client_id FROM client_info)       AND t.date BETWEEN '1993-03-22' AND '1998-12-27' )  -- Step 3: Calculate the increase rate of the account balance SELECT      ((SUM(CASE WHEN t.date = '1993-03-22' THEN t.balance ELSE 0 END) - SUM(CASE WHEN t.date = '1998-12-27' THEN t.balance ELSE 0 END)) /      SUM(CASE WHEN t.date = '1998-12-27' THEN t.balance ELSE 0 END)) * 100 AS increase_rate FROM transactions t; 
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) AS percentage_paid FROM loan; 
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM loan WHERE amount < 100000
SELECT T1.account_id, T2.A2 AS district_name, T2.A3 AS district_region FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1993' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT DISTINCT c.client_id, a.account_id, a.frequency FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district dis ON a.district_id = dis.district_id WHERE dis.A3 = 'east Bohemia' AND a.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT T1.account_id, T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T2.A2 AS district, T2.A3 AS region FROM loan AS T1 JOIN district AS T2 ON T1.account_id = (SELECT T3.account_id FROM disp AS T3 WHERE T3.client_id IN (SELECT T4.client_id FROM loan AS T4 WHERE T4.loan_id = '4990')) LIMIT 1
SELECT T2.account_id, T3.A2 AS district, T3.A3 AS region FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000;
SELECT T1.loan_id, T3.A3, AVG(T3.A11) AS avg_salary FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.duration = 60 GROUP BY T1.loan_id, T3.A3
SELECT d.A2 AS district_name, d.A3 AS region, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_rate_increase FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D'
SELECT (CAST(SUM(CASE WHEN T2.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T2.district_id, COUNT(T1.client_id) AS female_count FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' GROUP BY T2.district_id ORDER BY female_count DESC LIMIT 9
SELECT T2.A2 AS district_name, SUM(T1.amount) AS total_withdrawals FROM trans AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%' GROUP BY T2.A2 ORDER BY total_withdrawals DESC LIMIT 10;
SELECT COUNT(DISTINCT t1.account_id) FROM account AS t1 JOIN client AS t2 ON t1.client_id = t2.client_id JOIN district AS t3 ON t2.district_id = t3.district_id LEFT JOIN card AS t4 ON t1.account_id = t4.account_id WHERE t3.A3 = 'south Bohemia' AND t4.card_id IS NULL;
SELECT T2.A3 AS district_name, COUNT(*) AS loan_count FROM loan AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.status IN ('C', 'D') GROUP BY T2.A3 ORDER BY loan_count DESC LIMIT 1
SELECT AVG(loan.amount) FROM client JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'M'
SELECT A2 AS district_name, A3 AS branch_location FROM district ORDER BY A13 DESC LIMIT 5;
SELECT COUNT(*) FROM account WHERE district_id = ( SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1 )
SELECT COUNT(DISTINCT T2.account_id) FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.operation = 'VYBER KARTOU' AND T1.balance < 0 AND T2.frequency = 'POPLATEK MESICNE'; 
SELECT COUNT(DISTINCT l.loan_id) FROM loan l JOIN account a ON l.account_id = a.account_id JOIN disp d ON a.account_id = d.account_id WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31' AND l.amount >= 250000 AND d.type = 'OWNER' AND a.frequency = 'POPLATEK MESICNE'
SELECT COUNT(DISTINCT T2.account_id) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status IN ('C', 'D') AND T2.district_id = 1;
SELECT COUNT(client_id) FROM client WHERE client_id IN ( SELECT DISTINCT T1.client_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = ( SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1 ) AND T1.type = 'OWNER' ) AND gender = 'M'
SELECT COUNT(*) FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold' AND T2.type = 'OWNER';
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek'
SELECT DISTINCT T3.A2 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.date LIKE '1997%' AND (T1.type = 'PRIJEM' OR T1.type = 'VYDAJ') AND ABS(T1.amount) > 10000;
SELECT DISTINCT T3.A2 AS district_name FROM order AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.k_symbol = 'SIPO' 
SELECT DISTINCT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'
SELECT AVG(trans.amount) FROM trans JOIN card ON trans.account_id = card.account_id WHERE trans.operation = 'VYBER KARTOU' AND strftime('%Y', trans.date) = '2021'
SELECT DISTINCT T1.account_id FROM trans AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T1.date LIKE '1998%' AND T1.type = 'VYBER KARTOU' AND T1.amount < ( SELECT AVG(amount) FROM trans WHERE date LIKE '1998%' AND type = 'VYBER KARTOU' )
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id JOIN account AS T4 ON T2.account_id = T4.account_id WHERE T1.gender = 'F' INTERSECT SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T4 ON T2.account_id = T4.account_id JOIN loan AS T5 ON T4.account_id = T5.account_id WHERE T1.gender = 'F'
SELECT COUNT(t1.client_id) FROM client AS t1 JOIN district AS t2 ON t1.district_id = t2.district_id WHERE t1.gender = 'F' AND t2.A3 = 'south Bohemia'
SELECT DISTINCT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id JOIN disp dp ON a.account_id = dp.account_id WHERE d.A2 = 'Tabor' AND dp.type = 'OWNER'
SELECT DISTINCT d.type FROM account a JOIN district dis ON a.district_id = dis.district_id JOIN disp d ON a.account_id = d.account_id WHERE d.type != 'OWNER' AND dis.A11 BETWEEN 8000 AND 9000
SELECT COUNT(DISTINCT T2.account_id) FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.A3 = 'north Bohemia' AND T3.bank = 'AB'
SELECT DISTINCT T3.A2 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ'
SELECT AVG(A15) FROM district WHERE CAST(SUBSTR(A4, -4) AS INT) > 4000 AND MIN(district_id) IN (SELECT MIN(district_id) FROM account WHERE strftime('%Y', date) >= '1997')
SELECT COUNT(*) FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.type = 'OWNER' AND T1.type = 'classic'
SELECT COUNT(client.client_id) FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.A2 = 'Hl.m. Praha'
SELECT (CAST(SUM(CASE WHEN type = 'gold' AND strftime('%Y', issued) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100) / COUNT(*) FROM card WHERE type = 'gold'
SELECT T3.client_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id JOIN loan AS T4 ON T1.account_id = T4.account_id ORDER BY T4.amount DESC LIMIT 1
SELECT T1.A15 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532 
SELECT T1.district_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333
SELECT T1.trans_id, T1.date, T1.amount FROM trans AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356 AND T1.type = 'VYDAJ' AND T1.operation = 'VYBER'
SELECT COUNT(DISTINCT t1.account_id) FROM account AS t1 JOIN loan AS t2 ON t1.account_id = t2.account_id WHERE t1.frequency = 'POPLATEK TYDNE' AND t2.amount < 200000;
SELECT T2.type FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.disp_id WHERE T1.client_id = 13539
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT T2.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'A' GROUP BY T2.district_id ORDER BY COUNT(T2.account_id) DESC LIMIT 1
SELECT c.name FROM client AS c JOIN order AS o ON c.client_id = o.client_id WHERE o.order_id = 32423;
SELECT * FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 5;
SELECT COUNT(a.account_id) FROM account AS a INNER JOIN district AS d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik'; 
SELECT DISTINCT T2.client_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'junior' AND T1.issued >= '1997-01-01'
   SELECT c.client_id, c.gender, d.A11    FROM client c    JOIN account a ON c.client_id = a.client_id    JOIN district d ON a.district_id = d.district_id    
SELECT ((SUM(CASE WHEN T2.date LIKE '%1997%' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN T2.date LIKE '%1996%' THEN T2.amount ELSE 0 END)) / SUM(CASE WHEN T2.date LIKE '%1996%' THEN T2.amount ELSE 0 END)) * 100 AS growth_rate FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) > '1995'
SELECT (SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END)) AS crime_difference FROM district
SELECT COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 AND type IN ('OWNER', 'DISPONENT')
SELECT COUNT(*) AS frequency, SUM(amount) AS total_amount FROM trans WHERE account_id = 3 AND k_symbol IN ('SIPO', 'UVER')
SELECT T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id = 130 AND T2.type = 'OWNER'
SELECT COUNT(DISTINCT T1.account_id) AS num_accounts FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T2.type = 'OWNER' AND T1.frequency = 'POPLATEK PO OBRATU'; 
SELECT SUM(l.amount) AS total_debt FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN loan l ON a.account_id = l.account_id WHERE c
SELECT SUM(amount), T2.gender FROM trans AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T1.account_id = 851 AND T1.trans_id > 851
SELECT T2.type FROM client AS T1 JOIN card AS T2 ON T1.client_id = T2.disp_id WHERE T1.client_id = 9;
SELECT SUM(amount) FROM trans WHERE strftime('%Y', date) = '1998' AND account_id IN (SELECT account_id FROM disp WHERE client_id = 617)
SELECT c.client_id FROM client AS c JOIN account AS a ON c.account_id = a.account_id JOIN district AS d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'east Bohemia'
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'F' ORDER BY T4.amount DESC LIMIT 3
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN order o ON c.account_id = o.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND o.k_symbol = 'SIPO' AND o.amount > 4000;
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Beroun' AND T1.date > '1996-01-01'
SELECT COUNT(*) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.gender = 'F' AND T3.type = 'junior'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.district_id IN (SELECT district_id FROM district WHERE A3 = 'Prague')
SELECT (CAST(COUNT(CASE WHEN T1.gender = 'M' THEN 1 ELSE NULL END) AS REAL) * 100) / COUNT(T1.client_id) AS percentage FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T2.frequency = 'POPLATEK TYDNE'
SELECT COUNT(DISTINCT T1.client_id) FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK TYDNE'
SELECT T2.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 24 AND T2.date < '1997-01-01' ORDER BY T1.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T2.gender = 'F' ORDER BY T2.A11 DESC LIMIT 1
SELECT COUNT(client_id) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.birth_date) = '1920' AND T2.A3 = 'east Bohemia'
SELECT COUNT(*) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration = 24 AND T2.frequency = 'POPLATEK TYDNE'
SELECT AVG(T3.amount) FROM trans AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id JOIN loan AS T3 ON T2.account_to = T3.account_id WHERE T3.status = 'C' AND T1.k_symbol = 'POPLATEK PO OBRATU'
SELECT T1.client_id, T2.district_id FROM client AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.account_id IN (SELECT account_id FROM disp WHERE type = 'OWNER')
SELECT client.client_id, strftime('%Y', 'now') - strftime('%Y', client.birth_date) AS age FROM client JOIN disp ON client.client_id = disp.client_id JOIN card ON disp.disp_id = card.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'
SELECT SUM(CASE WHEN T3.element = 'o' THEN 1 ELSE 0 END) / COUNT(T2.atom_id) AS avg_oxygen_atoms FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT COUNT(a.atom_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'na' AND m.label = '-'; 
SELECT DISTINCT m.molecule_id FROM connected AS c INNER JOIN bond AS b ON c.bond_id = b.bond_id INNER JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '+'
SELECT CAST(COUNT(CASE WHEN T3.element = 'c' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.atom_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T2.bond_type = '='
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '#'
SELECT COUNT(atom_id) FROM atom WHERE element != 'br'
SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT DISTINCT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c'
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR004_8_9'
SELECT DISTINCT T4.element FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id OR T2.atom_id2 = T3.atom_id INNER JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T1.bond_type = '='
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl'
SELECT DISTINCT T1.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-'
SELECT DISTINCT T1.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT molecule_id FROM molecule WHERE label = '-'; 
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')
SELECT label FROM molecule WHERE molecule_id NOT IN (SELECT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'sn')
SELECT COUNT(DISTINCT T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-' AND T1.element IN ('i', 's')
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT atom_id FROM atom WHERE molecule_id = 'TR181'; 
SELECT CAST(SUM(CASE WHEN T1.element != 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '#' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '#'
SELECT DISTINCT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_2_6' AND molecule_id = 'TR001';
SELECT (COUNT(CASE WHEN label = '+' THEN 1 ELSE NULL END) - COUNT(CASE WHEN label = '-' THEN 1 ELSE NULL END)) AS difference FROM molecule
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT DISTINCT T2.molecule_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = ' ORDER BY T2.molecule_id ASC LIMIT 5
SELECT CAST(COUNT(CASE WHEN T1.bond_type = '=' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) AS "percent" FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR008'
SELECT printf('%.3f', CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id)) AS percentage FROM molecule
SELECT CAST(COUNT(CASE WHEN element = 'h' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR000'
SELECT T1.element, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR060'
SELECT T1.bond_type, COUNT(T1.bond_type) AS bond_count FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR010' GROUP BY T1.bond_type ORDER BY bond_count DESC LIMIT 1; SELECT label FROM molecule WHERE molecule_id = 'TR010';
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' ORDER BY T1.molecule_id LIMIT 3
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2
SELECT COUNT(T1.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR009_12' OR T1.atom_id2 = 'TR009_12') AND T2.molecule_id = 'TR009';
SELECT COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'br' AND T1.label = '+'
SELECT T1.bond_type, T2.atom_id, T2.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'
SELECT m.molecule_id, m.label FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_10'
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19'
SELECT T3.element FROM molecule AS T1 INNER JOIN connected AS T2 ON T1.molecule_id = T2.atom_id INNER JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.molecule_id = 'TR004'
SELECT COUNT(molecule_id) FROM molecule WHERE label = '-'
SELECT DISTINCT T3.molecule_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T3.label = '+'
SELECT T3.bond_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN atom AS T4 ON T1.atom_id2 = T4.atom_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE (T2.element = 'p' AND T4.element = 'n') OR (T2.element = 'n' AND T4.element = 'p')
  SELECT * FROM bond WHERE bond_type = ' = '   
SELECT CAST(COUNT(T2.bond_id) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i' 
SELECT T3.bond_type, T1.bond_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T1.bond_id = T3.bond_id WHERE CAST(SUBSTR(T2.atom_id, 7, 2) AS INTEGER) = 45
SELECT T2.element FROM ( SELECT atom_id FROM connected ) AS T1 RIGHT JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element IS NOT NULL
SELECT atom_id FROM bond WHERE bond_type = '#' AND molecule_id = 'TR041'
SELECT T2.element FROM bond AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR144_8_19'
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_type) DESC LIMIT 1
WITH carcinogenic_molecules AS (     SELECT molecule_id     FROM molecule     WHERE label = '+' ), elements_in_carcinogenic_molecules AS (     SELECT a.element     FROM atom a     JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2     WHERE c.molecule_id IN (SELECT molecule_id FROM carcinogenic_molecules) ) SELECT element FROM elements_in_carcinogenic_molecules GROUP BY element ORDER BY COUNT(element) ASC LIMIT 1; 
SELECT DISTINCT T1.atom_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'pb' AND T1.atom_id2 NOT IN (SELECT atom_id FROM atom WHERE element = 'pb')
SELECT T1.element FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_type = '#' 
SELECT CAST(SUM(CASE WHEN T1.element = T3.element THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id GROUP BY T1.element, T3.element ORDER BY COUNT(T1.element) DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T2.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) AS percentage FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')
SELECT DISTINCT T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'
SELECT b.bond_type FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn'
SELECT COUNT(DISTINCT T2.element, T3.element) FROM bond AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id WHERE T1.bond_type = '-'
SELECT COUNT(DISTINCT T3.atom_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '#' AND (T3.element = 'p' OR T3.element = 'br')
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T2.bond_type = '-' AND T1.label = '-'; 
SELECT CAST(SUM(CASE WHEN T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(DISTINCT molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'
SELECT T1.bond_type FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_10_11'
SELECT COUNT(DISTINCT T2.bond_id) AS num_bonds_with_iodine FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'; 
SELECT SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_count, SUM(CASE WHEN T3.label = '-' THEN 1 ELSE 0 END) AS non_carcinogenic_count FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'ca'
SELECT CASE WHEN EXISTS (SELECT 1 FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8') AND element = 'cl') AND EXISTS (SELECT 1 FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8') AND element = 'c') THEN 'Yes' ELSE 'No' END AS result
SELECT DISTINCT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' AND T3.bond_type = '#' AND T3.label = '-'
SELECT CAST(COUNT(CASE WHEN T3.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.label = '+'
SELECT DISTINCT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR001'
SELECT molecule_id FROM bond WHERE bond_type = ' = '
SELECT T2.atom_id, T2.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '#'; 
SELECT a1.element AS element1, a2.element AS element2 FROM bond b JOIN atom a1 ON b.molecule_id = a1.molecule_id AND b.bond_id LIKE '%' || a1.atom_id JOIN atom a2 ON b.molecule_id = a2.molecule_id AND b.bond_id LIKE '%' || a2.atom_id WHERE b.bond_id = 'TR000_1_2'; 
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T2.bond_type = '-' AND T1.label = '-'
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT DISTINCT T1.bond_id, T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#'
SELECT T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T1.label = '+' AND SUBSTR(T2.atom_id, 7, 1) = '4'
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id), label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule_id = 'TR006'
SELECT atom_id FROM atom WHERE element = 'ca'; 
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id IN (SELECT atom_id FROM atom WHERE element = 'c') AND T1.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'c')
SELECT DISTINCT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id IN (T2.atom_id, T2.atom_id2) WHERE T1.bond_id = 'TR001_10_11'
SELECT CAST(SUM(CASE WHEN T1.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T3.molecule_id = 'TR047'
   SELECT m.label    FROM atom a    JOIN molecule m ON a.molecule_id = m.molecule_id    WHERE a.atom_id = 'TR001_1';    
SELECT label FROM molecule WHERE molecule_id = 'TR151';
SELECT T.element FROM ( SELECT DISTINCT T1.element AS element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.molecule_id = 'TR151' ) T
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT DISTINCT T2.atom_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND SUBSTR(T1.molecule_id, 3, 3) BETWEEN '10' AND '50' AND T2.element = 'c'
SELECT COUNT(DISTINCT T2.atom_id) AS total_atoms FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT DISTINCT T1.bond_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' AND T2.label = '+'
SELECT COUNT(*) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' AND T2.label = '+'
SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'
SELECT DISTINCT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(COUNT(CASE WHEN T2.element = 'h' THEN 1 ELSE NULL END) AS REAL) * 100.0 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT label FROM molecule WHERE molecule_id = 'TR124';
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'; 
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_2_4' OR T1.atom_id2 = 'TR001_2_4'
SELECT COUNT(T3.bond_id) AS double_bonds, T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T1.bond_id = T3.bond_id WHERE T1.bond_type = ' = ' AND T3.atom_id = 'TR006'
SELECT DISTINCT m.molecule_id, a.element FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'; 
SELECT T2.atom_id, T2.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-'; 
SELECT m.molecule_id, GROUP_CONCAT(a.element) AS elements FROM bond b JOIN atom a ON b.bond_id IN (a.atom_id, a.atom_id2) JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' GROUP BY m.molecule_id
SELECT DISTINCT T2.element  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id = T2.atom_id  WHERE T1.bond_id = 'TR000_2_3'; 
-- Step 1: Join atom and connected tables on atom_id SELECT * FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id  -- Step 2: Join the result with bond table on bond_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id  -- Step 3: Filter the results where the element is 'cl' WHERE T1.element = 'cl'  -- Step 4: Count the number of distinct bonds SELECT COUNT(DISTINCT T3.bond_id) AS number_of_bonds 
SELECT COUNT(DISTINCT T2.bond_type) AS num_bond_types FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR346' 
SELECT COUNT(T2.molecule_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' = ' AND T2.label = '+'
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element != 's' AND T4.bond_type != '='
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_id = 'TR001_2_4';
SELECT COUNT(atom_id) FROM atom WHERE molecule_id = 'TR001';
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-'
SELECT DISTINCT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+'
SELECT DISTINCT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'; 
SELECT CAST(COUNT(CASE WHEN T4.label = '+' AND T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T4.molecule_id) AS percentage FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T4.label = '+'
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';
   SELECT * FROM bond WHERE bond_id = 'TR001_3_4';    
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2') OR (c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1'); 
SELECT T.molecule_id FROM (     SELECT T1.molecule_id     FROM atom AS T1     JOIN connected AS T2 ON T1.atom_id = T2.atom_id AND T1.molecule_id = T2.molecule_id     WHERE T1.atom_id = 'TR000_2' ) AS T INTERSECT SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id AND T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR000_4'; 
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000';
SELECT CAST(SUM(CASE WHEN T1.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+'
SELECT DISTINCT m.molecule_id FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE a.element = 's' AND b.bond_type = '='
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5
SELECT DISTINCT a.element FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN atom a ON b.bond_id = a.bond_id WHERE m.molecule_id = 'TR024' AND b.bond_type = '='
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#'
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'
SELECT COUNT(DISTINCT bond_id) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR008' AND T2.element = 'c'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'o' AND T2.bond_type = ' = '
SELECT COUNT(DISTINCT T2.molecule_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '-'
SELECT T4.element, T7.bond_type FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id JOIN atom AS T5 ON T3.atom_id2 = T5.atom_id JOIN bond AS T6 ON T3.bond_id = T6.bond_id JOIN atom AS T4 ON T6.bond_id LIKE '%' || T4.atom_id || '_' OR T6.bond_id LIKE '%' || T4.atom_id2 || '_' JOIN atom AS T7 ON T6.bond_id LIKE '%' || T7.atom_id || '_' OR T6.bond_id LIKE '%' || T7.atom_id2 || '_' WHERE T1.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 JOIN bond AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR012' AND T1.element = 'c' AND T2.bond_type = '='
SELECT DISTINCT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'o' AND T2.label = '+'; 
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT * FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT name  FROM cards  WHERE faceConvertedManaCost IS NOT NULL  ORDER BY faceConvertedManaCost DESC  LIMIT 1; 
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;
SELECT DISTINCT c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned'
SELECT l.status FROM legalities l JOIN formats f ON l.format_id = f.id JOIN cards c ON l.card_id = c.id WHERE c.types = 'Artifact' AND c.side IS NULL AND f.name = 'Vintage'
SELECT C.id, C.artist FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE (C.power = '*' OR C.power IS NULL) AND L.format = 'commander' AND L.status = 'Legal'
SELECT T1.id, T1.text, T1.hasContentWarning FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Stephen Daniel' AND T1.hasContentWarning = 1;
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'
SELECT T.name, T.artist, T.isPromo FROM ( SELECT C.name, C.artist, C.isPromo, COUNT(R.uuid) AS ruling_count FROM cards AS C JOIN rulings AS R ON C.uuid = R.uuid GROUP BY C.uuid ) AS T ORDER BY T.ruling_count DESC LIMIT 1
SELECT DISTINCT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.multiverseid = T2.multiverseid WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT fd.name FROM foreign_data AS fd JOIN sets AS s ON fd.setCode = s.code WHERE s.language = 'Japanese'
SELECT CAST(COUNT(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM foreign_data
SELECT SUM(totalSetSize) AS TotalCards, s.name AS SetName FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Italian'
SELECT COUNT(DISTINCT type) FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor\''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen' 
SELECT st.language, st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy')
SELECT COUNT(*) FROM legals AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'restricted' AND T2.isTextless = 0;
SELECT r.text FROM rulings AS r JOIN cards AS c ON r.uuid = c.uuid WHERE c.name = 'Condemn'
SELECT COUNT(T2.uuid) FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T2.setCode = T3.code WHERE T1.status = 'restricted' AND T2.isStarter = 1 
SELECT l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'
SELECT l.format FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Benalish Knight'
SELECT DISTINCT artist FROM foreign_data WHERE language = 'Phyrexian'; 
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards;
SELECT COUNT(*) FROM foreign_data AS T1 JOIN cards AS T2 ON T1.multiverseid = T2.multiverseid WHERE T1.language = 'German' AND T2.isReprint = 1;
SELECT COUNT(*) FROM foreign_data AS T1 JOIN set_translations AS T2 ON T1.multiverseid = T2.setCode WHERE T2.language = 'Russian' AND T1.borderColor = 'borderless'
SELECT CAST(SUM(CASE WHEN language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data WHERE isStorySpotlight = 1 
SELECT COUNT(*) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT layout FROM cards WHERE keywords LIKE '%Flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'
SELECT T1.artist FROM foreign_data AS T1 JOIN set_translations AS T2 ON T1.language = T2.language JOIN sets AS T3 ON T2.setCode = T3.code WHERE T2.language = 'Chinese Simplified'
SELECT DISTINCT c.name  FROM foreign_data fd  JOIN cards c ON fd.multiverseid = c.multiverseid  JOIN legalities l ON c.uuid = l.uuid  WHERE fd.language = 'Japanese'  AND c.availability LIKE '%paper%'  AND l.status = 'Legal' 
{     "chain_of_thought_reasoning": "We start by selecting the uuid column from the cards table (aliased as T1) and the status column from the legalities table (aliased as T2). We then join the cards table with the legalities table on the uuid column. Next, we filter the joined table to include only rows where the status column is 'Banned'. We further filter the rows to include only those where the borderColor column is 'white'. Finally, we count the number of rows that satisfy the conditions.",     "SQL": "SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T
SELECT T1.uuid, T1.language FROM foreign_data AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'legacy'
SELECT r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality'; 
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'legal'
SELECT name, colors FROM cards WHERE setCode = 'OGW'
SELECT T2.name, T3.translation, T3.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.multiverseid = T2.multiverseid JOIN set_translations AS T3 ON T1.setcode = T3.setCode WHERE T1.convertedManaCost = 5 AND T1.setcode = '10E'
SELECT c.name, r.date FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf'
SELECT c.colors, l.format FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.id BETWEEN 1 AND 20
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.multiverseId = T2.multiverseid WHERE T1.originalType = 'Artifact' AND T1.colors = 'B'
SELECT name FROM cards WHERE rarity = 'uncommon' ORDER BY date ASC LIMIT 3
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability LIKE '%mtgo%' AND hand = '-1'
SELECT COUNT(uuid) FROM cards WHERE frameVersion = '1993' AND availability LIKE '%paper%' AND hasContentWarning = 1;
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability LIKE '%mtgo,%paper%'
SELECT SUM(manaCost) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';
SELECT DISTINCT subtypes FROM cards WHERE availability = 'arena' UNION SELECT DISTINCT supertypes FROM cards WHERE availability = 'arena'
SELECT DISTINCT st.setCode FROM foreign_data fd JOIN set_translations st ON fd.multiverseid = st.multiverseid WHERE st.language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage, id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0;
   SELECT * FROM foreign_data WHERE language = 'Spanish';    
{     "chain_of_thought_reasoning": "To solve this problem, we need to identify the set with a baseSetSize of 309 and then find the translations for that set. Here's a step-by-step approach to derive the SQL query:",          "Step 1": "Identify the table that contains information about the sets and their sizes. In this case, it's the 'sets' table.",          "Step 2": "Find the column that holds the baseSetSize information. It's the 'baseSetSize' column in the 'sets' table.",          "Step 3": "Filter the sets where the baseSetSize is equal to 309. This will give us the specific set(s) we're interested in.",          "Step 4": "Once we have the set(s), we need to find the translations for these sets. The 'set_translations' table contains the translations for different sets.",          "Step 5": "Join the 'sets' table with the 'set_translations' table using the 'setCode' column, which is common to both tables. This will allow us to link each set with its translations.",          "Step 6": "Select the distinct 'language' column from the 'set_translations' table to get the unique languages in which the set is translated.",          "Final Query": "By combining these steps, we can construct the following SQL query to get the names of all the languages into which the set with a baseSetSize of 309 is translated."          "SQL": "SELECT DISTINCT st.language FROM sets s JOIN set_translations st ON s.setCode = st.setCode WHERE s.baseSetSize = 309" }
SELECT COUNT(DISTINCT s.setCode) FROM sets AS s JOIN set_translations AS st ON s.setCode = st.setCode JOIN blocks AS b ON s.block = b.name WHERE st.language = 'Portuguese (Brazil)' AND b.name = 'Commander'
SELECT DISTINCT uuid FROM cards WHERE type LIKE '%Creature%' AND status = 'Legal'
SELECT DISTINCT subtypes, supertypes FROM foreign_data WHERE language = 'German' AND subtypes IS NOT NULL AND supertypes IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM legalities AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid JOIN cards AS T3 ON T3.scryfallId = T2.scryfallId WHERE T1.format = 'premodern' AND T2.text = 'This is a triggered mana ability.' AND T3.side IS NULL
SELECT DISTINCT C.id FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.artist = 'Erica Yang' AND C.availability LIKE '%paper%' AND L.format = 'pauper' AND L.status = 'Legal'
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT name FROM foreign_data WHERE language = 'French' AND type LIKE '%Creature%' AND layout = 'normal' AND borderColor = 'black' AND artist = 'Matthew D. Wilson'
SELECT COUNT(*) FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T2.date = '2007-02-01'
SELECT DISTINCT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica'
SELECT CAST(SUM(CASE WHEN cards.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(cards.id) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'commander' AND legalities.status = 'legal'
SELECT CAST(SUM(CASE WHEN power IS NULL OR power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data WHERE language = 'French'
{     "chain_of_thought_reasoning": "We join the sets and set_translations tables on the setCode. We filter the results to include only Japanese-translated sets. We count the total number of Japanese-translated sets and the number of Japanese-translated expansion sets. Finally, we calculate the percentage of Japanese
SELECT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT SUM(CASE WHEN isOversized = 1 THEN 1 ELSE 0 END) + SUM(CASE WHEN isReprint = 1 THEN 1 ELSE 0 END) + SUM(CASE WHEN isPromo = 1 THEN 1 ELSE 0 END) AS count FROM cards
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes LIKE '%arenaleague%' ORDER BY name ASC LIMIT 3
SELECT language FROM foreign_data WHERE multiverseid = 149934
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;
SELECT CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM cards
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.mcmName = 'Archenemy' AND s.code = 'ARC'
SELECT s.name, st.translation FROM sets s JOIN set_translations st ON s.setCode = st.setCode WHERE s.id = 5
SELECT language, type FROM sets WHERE id = 206;
SELECT DISTINCT s.name, s.id FROM sets AS s JOIN foreign_data AS fd ON s.setCode = fd.setCode WHERE fd.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;
SELECT id FROM sets WHERE isForeignOnly = 0 AND isFoilOnly = 1 AND language = 'Japanese'
SELECT s.name FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 JOIN set_translations AS T2 ON T1.multiverseid = T2.setCode WHERE T2.language = 'Chinese Simplified'
SELECT COUNT(CASE WHEN T1.mtgoCode IS NULL OR T1.mtgoCode = '' THEN 1 ELSE NULL END) AS count FROM sets AS T1 INNER JOIN foreign_data AS T2 ON lower(T1.code) = lower(T2.set_code) WHERE T2.language = 'Japanese'
SELECT COUNT(id), id FROM cards WHERE borderColor = 'black'
SELECT COUNT(id), id FROM cards WHERE frameEffects = 'extendedart'
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.code = '174'; 
SELECT name FROM sets WHERE code = 'ALL'
SELECT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar'
SELECT setCode FROM sets WHERE SUBSTR(releaseDate, 1, 10) = '2007-07-13'
SELECT baseSetSize, setCode FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT setCode FROM sets WHERE type = 'expansion' 
SELECT T1.name AS foreign_name, T2.type FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'Boros'
SELECT DISTINCT language, flavorText, type FROM foreign_data WHERE watermark = 'Colorpie'
{     "chain_of_thought_reasoning": "We need to calculate the percentage of cards with a converted Mana Cost of 10 in the set named 'Abyssal Horror'. We use a CASE statement within the COUNT function to count the number of cards with convertedManaCost = 10, cast this count to a real number to ensure decimal division, multiply by 100, and divide by the total number of cards in the set to get the percentage. We filter the results by the set name 'Abyssal Horror'.",     "SQL": "SELECT CAST(COUNT(CASE WHEN convertedManaCost = 10 THEN
SELECT setCode FROM sets WHERE type = 'Expansion Commander'
SELECT f.name, c.type FROM foreign_data AS f INNER JOIN cards AS c ON f.uuid = c.uuid WHERE f.watermark = 'Abzan'
SELECT DISTINCT fd.language, c.type FROM foreign_data AS fd JOIN cards AS c ON fd.multiverseid = c.multiverseId WHERE c.watermark = 'Azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'
SELECT name FROM cards WHERE isTextless = 0; 
SELECT convertedManaCost FROM cards WHERE name LIKE 'Ancestor%s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL 
SELECT supertypes, subtypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT json_extract(purchaseUrls, '$.cardKingdom'), json_extract(purchaseUrls, '$.cardmarket'), json_extract(purchaseUrls, '$.tcgplayer') AS urls FROM cards WHERE promoTypes LIKE '%bundle%'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo,%'
SELECT name, convertedManaCost FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper')
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;
SELECT T3.translation FROM cards AS T1 JOIN foreign_data AS T2 ON T1.multiverseid = T2.multiverseid JOIN sets AS T3 ON T1.setcode = T3.code JOIN set_translations AS T4 ON T3.code = T4.setCode WHERE T2.flavorText LIKE '%Ancestor%s Chosen%' AND T4.language = 'Italian'
SELECT COUNT(T2.translation) AS num_translations FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode JOIN sets AS T3 ON T3.code = T2.setCode WHERE T1.name = 'Angel of Mercy'; 
SELECT fd.name FROM foreign_data AS fd JOIN set_translations AS st ON fd.multiverseid = st.id WHERE st.translation = 'Hauptset Zehnte Edition'
SELECT ft.id FROM foreign_data AS ft JOIN cards AS c ON ft.uuid = c.uuid JOIN set_translations AS st ON c.setCode = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND ft.language = 'Korean'
SELECT COUNT(*) FROM foreign_data AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN cards AS T3 ON T3.multiverseid = T1.multiverseid WHERE T3.artist = 'Adam Rex' AND T2.name = 'Hauptset Zehnte Edition'
SELECT s.baseSetSize FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT s.mtgoCode FROM sets AS s JOIN cards AS c ON s.code = c.setCode WHERE s.name = 'Angel of Mercy'
SELECT DISTINCT s.releaseDate FROM sets AS s JOIN cards AS c ON s.code = c.setCode WHERE c.name = 'Ancestor\'s Chosen'
SELECT s.type FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(DISTINCT T2.setCode) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ice Age' AND T2.language = 'Italian' AND T2.translation IS NOT NULL;
SELECT s.isForeignOnly  FROM cards AS c  JOIN sets AS s ON c.setCode = s.code  WHERE c.name LIKE '%Adarkar Valkyrie%' 
SELECT COUNT(*) FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100; 
SELECT COUNT(*) FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.borderColor = 'black'
SELECT DISTINCT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC 
SELECT DISTINCT artist FROM cards AS T1 JOIN sets AS T2 ON T1.multiverseId = T2.code WHERE T2.name = 'Coldsnap' AND T1.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT T2.name FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.number = 4
SELECT COUNT(*) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.convertedManaCost > 5 AND (T2.power IS NULL OR T2.power = '*')
SELECT fd.flavorText FROM foreign_data fd JOIN set_translations st ON fd.language = st.language AND fd.name = st.translation WHERE fd.name = 'Ancestor''s Chosen' AND st.language = 'Italian'
SELECT DISTINCT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.multiverseid = T2.multiverseid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL; 
SELECT T1.type  FROM foreign_data AS T1  JOIN sets AS T2 ON T1.multiverseid = T2.multiverseId  WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'German' 
SELECT T3.text FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.set_code JOIN rulings AS T3 ON T2.uuid = T3.uuid WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian'
SELECT T2.name FROM sets AS T1 JOIN foreign_data AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T2.convertedManaCost DESC LIMIT 1
SELECT r.date FROM rulings AS r JOIN cards AS c ON r.uuid = c.uuid WHERE c.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.multiverseId = T2.multiverseId WHERE T2.name = 'Coldsnap' 
SELECT CAST(SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name = 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS has_missing_or_degraded_properties FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec'
SELECT T1.releaseDate FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'
SELECT SUM(T2.baseSetSize) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN cards AS T3 ON T2.code = T3.setCode WHERE T1.translation = 'Rinascita di Alara'
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'French' AND T2.translation = 'Huitième édition'
SELECT t3.translation FROM cards AS t1 JOIN foreign_data AS t2 ON t1.multiverseid = t2.multiverseid JOIN sets AS t3 ON t2.id = t3.id AND t2.multiverseid = t3.id WHERE t1.name = 'Tendo Ice Bridge' AND t2.language = 'French'; 
SELECT COUNT(t2.translation) AS num_translations FROM sets t1 INNER JOIN set_translations t2 ON t1.code = t2.setCode WHERE t1.name = 'Tenth Edition'; 
SELECT T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode JOIN cards AS T3 ON T1.id = T3.setId WHERE T3.name = 'Fellwar Stone' AND T2.language = 'Japanese'
SELECT name FROM cards WHERE setCode IN ( SELECT code FROM sets WHERE name = 'Journey into Nyx Hero''s Path' ) ORDER BY convertedManaCost DESC LIMIT 1
SELECT s.releaseDate FROM sets AS s JOIN set_translations AS st ON s.id = st.setCode WHERE st.translation = 'Ola de frío'
SELECT T2.type FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN legalities AS T3 ON T2.uuid = T3.uuid WHERE T1.name = 'Samite Pilgrim' 
SELECT COUNT(*) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'World Championship Decks 2004' AND T2.convertedManaCost = 3;
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Chinese Simplified' AND T1.name = 'Mirrodin'
SELECT CAST(SUM(T1.isNonFoilOnly) AS REAL) * 100 / COUNT(*) FROM foreign_data AS T1 JOIN sets AS T2 ON T1.multiverseid = T2.multiverseId WHERE T1.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM sets AS T1  JOIN foreign_data AS T2 ON T1.code = T2.set_code  WHERE T2.language = 'Português (Brasil)' 
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 0 
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT c.name, c.manaCost FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10
SELECT      c.originalReleaseDate,     l.format FROM      cards c JOIN      legalities l ON c.uuid = l.uuid WHERE      c.rarity = 'mythic' ORDER BY      c.originalReleaseDate ASC LIMIT 1 
SELECT COUNT(*)  FROM foreign_data AS T1  JOIN cards AS T2 ON T1.multiverseid = T2.multiverseid  WHERE T1.language = 'French' AND T2.artist = 'Volkan Baǵa'; 
SELECT COUNT(T1.id) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN sets AS T3 ON T1.setCode = T3.code WHERE T1.rarity = 'rare' AND T1.types = 'Enchantment' AND T1.name = 'Abundance' AND T2.status = 'Legal'
SELECT T1.format, T2.name FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.scryfallOracleId WHERE T1.status = 'Banned' GROUP BY T1.format ORDER BY COUNT(T1.status) DESC LIMIT 1
SELECT language FROM sets WHERE name = 'Battlebond' 
SELECT      artist,     GROUP_CONCAT(DISTINCT format) AS formats FROM      cards JOIN      legalities ON cards.uuid = legalities.uuid GROUP BY      artist ORDER BY      COUNT(*) ASC LIMIT 1; 
SELECT DISTINCT L.status FROM cards C JOIN legalities L ON C.uuid = L.uuid WHERE C.artist = 'D. Alexander Gregory' AND C.frameVersion = '1997' AND C.hasContentWarning = 1 AND L.format = 'legacy'
SELECT T1.name, T2.format  FROM cards AS T1  INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid  INNER JOIN sets AS T3 ON T2.uuid = T3.uuid  WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'; 
   SELECT *    FROM sets    WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31';    
SELECT DISTINCT artist FROM cards WHERE BorderColor = 'black' AND availability LIKE '%arena%'
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted')
SELECT COUNT(id) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT r.text FROM rulings AS r JOIN cards AS c ON r.uuid = c.scryfallId WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;
SELECT DISTINCT c.name AS card_name, l.format AS legal_format FROM cards c JOIN sets s ON c.setCode = s.code JOIN legalities l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'
SELECT DISTINCT T1.name AS setName FROM sets AS T1 LEFT JOIN set_translations AS T2 ON T1.code = T2.setCode AND T2.language LIKE '%Korean%' LEFT JOIN set_translations AS T3 ON T1.code = T3.setCode AND T3.language LIKE '%Japanese%' WHERE (T2.id IS NOT NULL AND T3.id IS NULL); 
SELECT DISTINCT T1.frameVersion FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.artist = 'Allen Williams' AND T1.status = 'Banned'
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(DISTINCT Id) FROM users WHERE Upvotes > 100 AND Downvotes > 1
SELECT COUNT(Id) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT Title FROM posts WHERE OwnerDisplayName = 'csgillespie' ORDER BY ViewCount DESC LIMIT 1 
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT SUM(CommentCount) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT MAX(AnswerCount) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT u.DisplayName FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'csgillespie' AND p.ParentId IS NULL
SELECT DISTINCT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ClosedDate IS NOT NULL 
SELECT COUNT(T2.Id) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Age > 65 AND T2.Score >= 20
SELECT u.Location FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts'
SELECT p.Body FROM posts AS p JOIN tags AS t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'
SELECT Id FROM tags ORDER BY Count DESC LIMIT 1; 
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'csgillespie'
SELECT COUNT(b.Id) FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'csgillespie' AND STRFTIME('%Y', b.Date) = '2011'
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Id) DESC LIMIT 1
SELECT AVG(Score) FROM posts WHERE OwnerDisplayName = 'csgillespie'
SELECT AVG(COUNT(b.Id)) AS AverageBadges FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200
SELECT      CAST(SUM(CASE WHEN u.Age > 65 THEN 1 ELSE 0 END) AS REAL) / COUNT(p.Id) * 100 AS ElderUserPercentage FROM      posts p JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.Score > 5; 
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId ORDER BY c.Score DESC LIMIT 1
SELECT COUNT(c.Id) AS CommentCount FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910
SELECT FavoriteCount FROM posts WHERE Id = (SELECT PostId FROM comments WHERE UserId = '3025' AND CreationDate = '2014-04-23 20:29:39')
SELECT Text FROM comments WHERE ParentId = 107829; 
SELECT CASE WHEN p.ClosedDate IS NULL THEN 'well-finished' ELSE 'not well-finished' END AS post_status FROM comments c JOIN posts p ON c.PostId = p.Id WHERE c.UserId = '23853' AND c.CreationDate = '2013-07-12 09:08:18.0'
SELECT T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 65041
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Tiago Pasqualini'
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347; 
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')
SELECT b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(DISTINCT p.PostId) AS REAL) / COUNT(DISTINCT v.VoteId) AS Ratio FROM posts p JOIN votes v ON p.OwnerUserId = v.UserId WHERE p.OwnerUserId = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'SilentGhost'
SELECT UserDisplayName FROM comments WHERE Text LIKE '%thank you user93!'
SELECT Text FROM comments WHERE UserDisplayName = 'A Lion'
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT c.Text FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT T1.DisplayName FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Necromancer' LIMIT 10
SELECT u.DisplayName FROM posts p JOIN postHistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data' AND ph.PostHistoryTypeId = 6 ORDER BY ph.CreationDate DESC LIMIT 1
SELECT DISTINCT p.Title FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE ph.LastEditorDisplayName = 'Vebjorn Ljosa'
SELECT SUM(posts.Score) AS TotalScore, users.WebsiteUrl FROM posts JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny'
  SELECT Id FROM posts WHERE Title = 'Why square the difference instead of taking the absolute value in standard deviation?'   
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE INSTR(T1.Title, 'data') > 0
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId JOIN votes AS v ON p.Id = v.PostId WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT AVG(posts.ViewCount) AS AverageViewCount, posts.Title, comments.Text FROM posts JOIN tags ON posts.Tags LIKE '%' || tags.TagName || '% ' JOIN comments ON posts.Id = comments.PostId WHERE tags.TagName = '<humor>' GROUP BY posts.Id
SELECT COUNT(Id) FROM comments WHERE UserId = 13
SELECT UserId FROM users ORDER BY Reputation DESC LIMIT 1
SELECT Id FROM users ORDER BY Views ASC LIMIT 1
SELECT COUNT(DISTINCT UserId) AS NumberOfUsers FROM badges WHERE Name = 'Supporter'   AND STRFTIME('%Y', Date) = '2011'; 
SELECT COUNT(UserId) FROM ( SELECT UserId, COUNT(DISTINCT Name) AS BadgeCount FROM badges GROUP BY UserId HAVING BadgeCount > 5 )
SELECT UserId FROM badges WHERE Name = 'Teacher' AND Location = 'New York' INTERSECT SELECT UserId FROM badges WHERE Name = 'Supporter' AND Location = 'New York'
SELECT T2.DisplayName, T2.Reputation FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 1
SELECT T1.UserId FROM posts AS T1 JOIN posthistory AS T2 ON T1.OwnerUserId = T2.UserId GROUP BY T1.UserId HAVING COUNT(T2.Id) = 1 AND SUM(T1.Views) >= 1000
SELECT DISTINCT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Id = (SELECT c.UserId FROM comments c GROUP BY c.UserId ORDER BY COUNT(c.Id) DESC LIMIT 1)
SELECT COUNT(DISTINCT u.Id) FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'
SELECT ((SUM(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 ELSE 0 END) / COUNT(*)) - (SUM(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 ELSE 0 END) / COUNT(*))) * 100 AS PercentageDifference FROM badges WHERE Name = 'Student'
SELECT DISTINCT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId) AS UniqueUserCount FROM postHistory AS ph JOIN comments AS c ON ph.PostId = c.PostId WHERE ph.PostId = 3720
SELECT p.Title, p.ViewCount FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217
SELECT Score, LinkTypeId FROM postLinks WHERE PostId = 395;
SELECT DISTINCT OwnerUserId FROM posts WHERE Score > 60
SELECT SUM(FavouriteCount) FROM posts WHERE OwnerUserId = 686 AND strftime('%Y', CreationDate) = '2011'
SELECT AVG(u.UpVotes) AS AverageUpVotes, AVG(u.Age) AS AverageAge FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.PostId) > 10
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer';
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE Score > 60
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT u.Reputation FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Pierre'
SELECT DISTINCT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'
SELECT CAST(COUNT(CASE WHEN Name = 'Teacher' THEN UserId ELSE NULL END) AS REAL) * 100 / COUNT(UserId) AS TeacherPercentage FROM badges
SELECT CAST(SUM(CASE WHEN T1.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT T1.Score FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.CreationDate = '2010-07-19 19:19:56.0'
SELECT Text FROM comments WHERE strftime('%Y-%m-%d %H:%M:%S', CreationDate) = '2010-07-19 19:37:33'
SELECT T2.Age FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Vienna, Austria'
SELECT COUNT(b.UserId) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65; 
SELECT SUM(u.Views) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId ORDER BY T1.Reputation ASC LIMIT 1
SELECT b.Name FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Sharpie'
SELECT COUNT(b.UserId) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(Id) FROM users WHERE Location = 'New York, NY';
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) AS Ratio FROM votes
SELECT Id FROM users WHERE DisplayName = 'John Salvatier'; 
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Daniel Vassallo';
SELECT COUNT(v.Id) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'Harlan'
SELECT p.Id FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1
SELECT SUM(CASE WHEN u.DisplayName = 'Harvey Motulsky' THEN p.ViewCount ELSE 0 END) AS TotalViewsMotulsky, SUM(CASE WHEN u.DisplayName = 'Noah Snyder' THEN p.ViewCount ELSE 0 END) AS TotalViewsSnyder FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder')
SELECT COUNT(*) FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE p.OwnerDisplayName = 'Matt Parker' AND v.Score > 4
SELECT COUNT(*) FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score < 60 AND T2.OwnerDisplayName = 'Neil McGuigan'
SELECT T3.TagName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId LEFT JOIN tags AS T3 ON T2.Tags LIKE '%' || T3.TagName || '%'
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Organizer'
{     "chain_of_thought_reasoning": "To calculate the percentage of posts that use the R language based on posts posted by Community, we need to follow these steps:\n1. Identify the posts made by Community.\n2. Determine which of these posts include the tag 'R'.\n3. Calculate the percentage of posts with the tag 'R' among all posts made by Community.",     "SQL": "SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.PostId) AS percentage FROM posts AS T1 JOIN posthistory AS T2 ON T1.Id = T2.PostId JOIN tags AS T3 ON T1.Tags LIKE '%' || T3.TagName || '%'" +           "JOIN users AS T4 ON T1.OwnerUserId = T4.Id WHERE T4.DisplayName = 'Community'" }
SELECT (SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) - SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS ViewCountDifference FROM posts p JOIN users u ON p.OwnerUserId = u.Id
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'
SELECT COUNT(Id) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images';
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60; 
SELECT p.Title, u.UserDisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score > 60; 
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE STRFTIME('%Y', T1.Date) = '2011' AND T2.Location = 'North Pole'
SELECT u.DisplayName, u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.FavoriteCount > 150
SELECT COUNT(ph.Id) AS HistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM posts p JOIN posthistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?'
SELECT T2.LastAccessDate, T2.Location FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Outliers'
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.RelatedPostId WHERE T2.Title = 'How to tell if something happened in a data set which monitors a value over time' 
SELECT DISTINCT T1.PostId, T2.Name FROM postHistory AS T1 JOIN badges AS T2 ON T1.UserId = T2.UserId WHERE T1.UserDisplayName = 'Samuel' AND STRFTIME('%Y', T1.CreationDate) = '2013' AND STRFTIME('%Y', T2.Date) = '2013'
SELECT OwnerDisplayName FROM posts ORDER BY ViewCount DESC LIMIT 1
SELECT T3.DisplayName, T3.Location  FROM tags AS T1  INNER JOIN posts AS T2 ON T1.Id = T2.Tags  INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id  WHERE T1.TagName = 'hypothesis-testing' 
SELECT p.Title AS RelatedPostTitle, pl.LinkTypeId FROM postLinks pl INNER JOIN posts p ON pl.RelatedPostId = p.Id INNER JOIN posts originalPost ON pl.PostId = originalPost.Id WHERE originalPost.Title = 'What are principal component scores?'
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ParentId IS NOT NULL ORDER BY p.Score DESC LIMIT 1
SELECT T2.DisplayName, T2.WebsiteURL FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.VoteTypeId = 8 ORDER BY T1.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(Id) FROM tags WHERE Count BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2011' AND BountyAmount = 50
SELECT Id FROM users ORDER BY Age ASC LIMIT 1
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'
SELECT CAST(COUNT(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2 THEN Id ELSE NULL END) AS REAL) / 12 FROM postLinks
SELECT p.Id FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT p.Title FROM posts p INNER JOIN postLinks pl ON p.Id = pl.PostId ORDER BY pl.CreationDate ASC LIMIT 1; 
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Name) DESC LIMIT 1
SELECT v.CreationDate FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.DisplayName = 'chl' ORDER BY v.CreationDate ASC LIMIT 1
SELECT MIN(T2.CreationDate) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Age = (SELECT MIN(Age) FROM users)
SELECT UserDisplayName FROM badges WHERE Name = 'Autobiographer' ORDER BY Date ASC LIMIT 1
SELECT COUNT(T1.Id) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'United Kingdom' AND T2.FavoriteCount >= 4 GROUP BY T1.Id HAVING COUNT(T2.FavoriteCount) >= 4; 
SELECT AVG(COUNT(DISTINCT T1.PostId)) AS AveragePostsVotedByOldestUsers FROM votes AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Age = (SELECT MAX(Age) FROM users)
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65
SELECT COUNT(*) FROM posts WHERE OwnerDisplayName = 'Jay Stevens' AND STRFTIME('%Y', CreationDate) = '2010'
SELECT p.Id, p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts ORDER BY Score DESC LIMIT 1
SELECT AVG(T1.Score) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'; 
SELECT DISTINCT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000 AND strftime('%Y', p.CreationDate) = '2011'
SELECT Id, OwnerDisplayName FROM posts WHERE STRFTIME('%Y', CreationDate) = '2010' ORDER BY FavoriteCount DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) AS Percentage FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE STRFTIME('%Y', T1.CreaionDate) = '2011'
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) AS percentage FROM users
SELECT ViewCount, LastEditorDisplayName FROM posts WHERE Id = (SELECT Id FROM posts WHERE Title = 'Computer Game Datasets')
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT u.DisplayName, u.Location FROM users u JOIN postHistory ph ON u.Id = ph.UserId WHERE ph.PostId = 183 AND ph.LastEditDate = (SELECT MAX(LastEditDate) FROM postHistory WHERE PostId = 183)
SELECT Name FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Emmett') ORDER BY Date DESC LIMIT 1
SELECT COUNT(DISTINCT Id) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000
SELECT T2.Date - T1.CreationDate FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Zolomon'
SELECT COUNT(p.Id) AS NumberOfPosts, COUNT(c.Id) AS NumberOfComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN comments c ON u.Id = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users)
SELECT c.Text, u.DisplayName FROM posts p JOIN comments c ON p.Id = c.PostId JOIN users u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol';
SELECT COUNT(*) FROM tags WHERE TagName = 'careers'
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT COUNT(c.Id) AS CommentCount, COUNT(ph.Id) AS AnswerCount FROM posts p JOIN comments c ON p.Id = c.PostId JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'Clustering 1D data'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(Id) FROM votes WHERE BountyAmount >= 30
SELECT CAST(SUM(CASE WHEN T1.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.PostId) FROM posts AS T1 JOIN (SELECT MAX(Reputation) AS max_reputation FROM users) AS T2 ON T1.OwnerUserId = T2.max_reputation
SELECT COUNT(Id) FROM posts WHERE Score < 20
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20;
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT u.Reputation, u.UpVotes FROM users u JOIN comments c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :)' 
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%linear regression%'
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1; 
SELECT T2.CreationDate, T2.Age FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text LIKE '%http://%'
SELECT COUNT(*) FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5
SELECT COUNT(T2.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CommentCount = 1 AND T2.Score = 0
SELECT COUNT(T2.Age) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score = 0 AND T2.Age = 40
SELECT p.Id AS PostId, c.Text AS CommentText FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'; 
SELECT T2.UpVotes FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Text LIKE '%R is also lazy evaluated.%'
SELECT Text FROM comments WHERE UserDisplayName = 'Harvey Motulsky' 
SELECT DISTINCT T2.UserDisplayName FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.UserId) FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10
SELECT sp.power_name FROM superhero AS sh JOIN hero_power AS hp ON sh.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sh.superhero_name = '3-D Man'
SELECT COUNT(DISTINCT hp.hero_id) FROM hero_power AS hp JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength'
SELECT COUNT(DISTINCT T3.id) FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.power_name = 'Super Strength' AND T3.height_cm > 200
SELECT T1.full_name  FROM superhero AS T1  JOIN hero_power AS T2 ON T1.id = T2.hero_id  GROUP BY T1.id  HAVING COUNT(T2.hero_id) > 15; 
SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T2.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN hero_power AS T3 ON T1.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.colour = 'Blue' AND T4.power_name = 'Agility'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Blond'; 
SELECT COUNT(T2.id) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT T2.colour, COUNT(T1.id) AS color_count FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics' GROUP BY T2.colour ORDER BY color_count DESC;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT DISTINCT s.superhero_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE p.publisher_name = 'Marvel Comics' AND sp.power_name = 'Super Strength'
SELECT COUNT(T2.id) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'DC Comics'
SELECT p.publisher_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value ASC LIMIT 1
SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM heroine AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value ASC LIMIT 1
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN hero_attribute AS T3 ON T1.id = T3.hero_id JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T2.gender = 'Female' AND T4.attribute_name = 'Strength' AND T3.attribute_value = 100
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.race = 'Vampire'
SELECT CAST(SUM(CASE WHEN T2.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id), COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'
SELECT      (SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) -      (SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END)) AS difference FROM      publisher AS T1 JOIN      superhero AS T2 ON T1.id = T2.publisher_id; 
SELECT id FROM publisher WHERE publisher_name = 'Star Trek' 
SELECT AVG(attribute_value) FROM hero_attribute
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT T4.power_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN hero_power AS T3 ON T1.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.gender = 'Male' LIMIT 5
SELECT s.superhero_name FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.race = 'Alien'
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN colour c ON ha.attribute_value = c.id WHERE s.height_cm BETWEEN 170 AND 190 AND c.colour = 'No Colour'
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5
SELECT COUNT(*)  FROM superhero AS T1  JOIN alignment AS T2 ON T1.alignment_id = T2.id  WHERE T2.alignment = 'Bad'; 
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169; 
SELECT T3.colour FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T2.race = 'Human'
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180
SELECT superhero_name FROM superhero WHERE gender_id = (SELECT id FROM gender WHERE gender = 'Male') AND weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)
SELECT T2.power_name, COUNT(*) AS count FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY count DESC LIMIT 1; 
   SELECT id FROM superhero WHERE superhero_name = 'Abomination'    
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.id = 1
SELECT COUNT(DISTINCT T1.superhero_name) FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Stealth'
SELECT T3.full_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Strength' ORDER BY T1.attribute_value DESC LIMIT 1; 
SELECT CAST(SUM(CASE WHEN T1.skin_colour_id = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.id) AS average_no_skin_colour FROM superhero AS T1
SELECT COUNT(DISTINCT superhero.id) AS superhero_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics';
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight'
SELECT T3.colour AS eye_colour, T4.colour AS hair_colour, T5.colour AS skin_colour FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id INNER JOIN colour AS T4 ON T1.hair_colour_id = T4.id INNER JOIN colour AS T5 ON T1.skin_colour_id = T5.id INNER JOIN publisher AS T6 ON T1.publisher_id = T6.id WHERE T2.gender = 'Female' AND T6.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name, T5.publisher_name FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id JOIN colour AS T3 ON T1.eye_colour_id = T3.id JOIN colour AS T4 ON T1.skin_colour_id = T4.id JOIN publisher AS T5 ON T1.publisher_id = T5.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'; 
SELECT      (COUNT(CASE WHEN T1.gender = 'Female' AND T2.colour = 'Blue' THEN 1 ELSE NULL END) * 100.0 /       COUNT(CASE WHEN T1.gender = 'Female' THEN 1 ELSE NULL END)) AS percentage_blue_females FROM      superhero AS T1 JOIN      colour AS T2 ON T1.skin_colour_id = T2.id; 
SELECT T1.superhero_name, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(*) FROM hero_power AS hp JOIN superhero AS s ON hp.hero_id = s.id WHERE s.superhero_name = 'Amazo'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT DISTINCT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id JOIN colour AS T4 ON T2.hair_colour_id = T4.id JOIN colour AS T5 ON T2.eye_colour_id = T5.id WHERE T4.colour = 'Black' AND T5.colour = 'Black'
SELECT T2.colour  FROM superhero AS T1  JOIN colour AS T2 ON T1.skin_colour_id = T2.id  WHERE T2.colour = 'Gold'; 
SELECT T2.full_name FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Vampire'
SELECT T1.superhero_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'; 
SELECT COUNT(*) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Strength' AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute_name = 'Strength')
SELECT T2.race, T3.alignment FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(COUNT(CASE WHEN T2.gender = 'Female' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT SUM(CASE WHEN full_name = 'Emil Blonsky' THEN weight_kg ELSE 0 END) - SUM(CASE WHEN full_name = 'Charles Chandler' THEN weight_kg ELSE 0 END) AS weight_difference FROM superhero
SELECT AVG(height_cm) AS average_height FROM superhero
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.race_id = 21 AND T2.gender = 'Male'
SELECT s.superhero_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT T3.attribute_name, T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = '3-D Man'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' AND T1.hair_colour_id = (SELECT id FROM colour WHERE colour = 'Brown')
SELECT T1.publisher_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(*) FROM superhero AS s LEFT JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name IS NULL OR NOT EXISTS (SELECT 1 FROM publisher WHERE id = s.publisher_id)
SELECT CAST(COUNT(*) AS REAL) * 100 / ( SELECT COUNT(*) FROM superhero ) AS percentage_blue_eyes FROM superhero WHERE eye_colour_id = 7
SELECT      CAST(SUM(CASE WHEN T2.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS ratio FROM      superhero AS T1 JOIN      gender AS T2 ON T1.gender_id = T2.id; 
SELECT T2.superhero_name FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id ORDER BY T2.height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'Cryokinesis';
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT sp.power_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38; 
SELECT T3.race  FROM hero_attribute AS T1  INNER JOIN superhero AS T2 ON T1.hero_id = T2.id  INNER JOIN race AS T3 ON T2.race_id = T3.id 
SELECT T2.alignment, T4.power_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN hero_power AS T3 ON T1.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T1.superhero_name = 'Atom IV'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5
SELECT AVG(hero_attribute.attribute_value) FROM hero_attribute JOIN superhero ON hero_attribute.hero_id = superhero.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT DISTINCT c.colour FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id JOIN superhero s ON ha.hero_id = s.id JOIN colour c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100
SELECT COUNT(*) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.alignment = 'Good' AND T3.gender = 'Female'
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80
{     "chain_of_thought_reasoning": "We start by selecting the race from the race table. We then join the superhero table with the gender table to filter by gender, the colour table to filter by hair color, and finally the race table to get the required information. We apply the filter conditions to ensure we only get the blue-haired male superhero.",     "SQL": "SELECT T4.race FROM superhero AS T1 INNER JOIN gender AS T2 ON
SELECT CAST(COUNT(CASE WHEN T3.gender = 'Female' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.alignment = 'Bad'
SELECT SUM(CASE WHEN T3.colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T3.colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superhero AS T1 INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.weight_kg IS NULL OR T1.weight_kg = 0
SELECT ha.attribute_value FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE s.superhero_name = 'Hulk' AND a.attribute_name = 'Strength'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*)  FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN alignment a ON s.alignment_id = a.id WHERE c.colour = 'Green' AND a.alignment = 'Bad'; 
SELECT COUNT(*) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name
SELECT g.gender FROM gender AS g JOIN superhero AS s ON g.id = s.gender_id JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1
SELECT AVG(T1.height_cm) AS average_height FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics'
SELECT COUNT(DISTINCT h.id) FROM superhero h JOIN hero_attribute ha ON h.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100
SELECT (SUM(CASE WHEN T2.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END)) AS difference FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id
SELECT T3.attribute_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T1.colour FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T2.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT      CAST(         SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL     ) * 100 / COUNT(*) AS percentage_female_superheroes FROM      superhero AS T1 JOIN      gender AS T2 ON T1.gender_id = T2.id JOIN      publisher AS T3 ON T1.publisher_id = T3.id WHERE      T3.publisher_name = 'George Lucas'; 
SELECT CAST(COUNT(CASE WHEN T2.alignment = 'Good' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id WHERE T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
  SELECT T1.full_name   FROM superhero AS T1   
SELECT ha.attribute_value FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy'
SELECT T1.weight_kg, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40
SELECT AVG(height_cm) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Neutral')
SELECT DISTINCT h.hero_id FROM hero_power AS hp JOIN superpower AS sp ON hp.power_id = sp.id JOIN superhero AS s ON hp.hero_id = s.id WHERE sp.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS s ON hp.hero_id = s.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT T1.driverRef FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 20 AND T2.q1 IS NOT NULL ORDER BY T2.q1 DESC LIMIT 5
SELECT T2.surname FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.q2 IS NOT NULL ORDER BY T1.q2 ASC LIMIT 1
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.location = 'Shanghai' 
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Germany'
SELECT T1.position FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T2.name = 'Renault'; 
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2010 AND T1.name LIKE '%Grand Prix%' AND T2.country NOT IN ('Asia', 'Europe')
SELECT DISTINCT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Australian Grand Prix'
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'
SELECT T2.time FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit' 
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Abu Dhabi Grand Prix'
SELECT DISTINCT T2.nationality FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid JOIN results AS T3 ON T1.constructorid = T3.constructorid WHERE T3.raceid = 24 AND T1.points = 1
SELECT DISTINCT q1 FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 354 AND T2.forename = 'Bruno' AND T2.surname = 'Senna'
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 355 AND T1.q2 = '0:01:40'
SELECT T2.number FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 = '0:01:54'
SELECT COUNT(*) - SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS unfinished_drivers FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2007 AND T1.name = 'Bahrain Grand Prix'
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901
SELECT COUNT(*) FROM results WHERE date = '2015-11-29' AND TIME IS NOT NULL;
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 592 AND T1.time IS NOT NULL ORDER BY T2.dob ASC LIMIT 1
SELECT T1.url FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.laptime LIKE '1:27%' AND T2.raceid = 161
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 ORDER BY T1.fastestLapSpeed DESC LIMIT 1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Malaysian Grand Prix'
SELECT T2.url FROM constructorResults AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 9 ORDER BY T1.points DESC LIMIT 1
SELECT T2.q1 FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lucas' AND T1.surname = 'di Grassi' AND T3.raceId = 345
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 347 AND T2.q2 = '0:01:15'
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q3 = '0:01:33' AND T2.raceId = 45
SELECT T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.driverRef = 'brucemclaren' AND T3.raceId = 743
SELECT T3.driverRef FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T2.year = 2006 AND T2.name = 'San Marino Grand Prix' AND T1.position = 2
SELECT url FROM races WHERE raceId = 901
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '2015-11-29' AND T1.time IS NULL;
SELECT T1.driverId, T1.forename, T1.surname, T1.dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872 AND T2.time IS NOT NULL ORDER BY T1.dob DESC LIMIT 1; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN laps AS T3 ON T2.resultId = T3.resultId WHERE T2.raceId = 348 ORDER BY T3.time ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1
SELECT ((SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 853) - (SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 854)) / (SELECT fastestLapSpeed FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta') AND raceId = 854) * 100 AS percentage_increase
SELECT      (SUM(CASE WHEN results.time IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(results.driverid)) AS completion_rate FROM      races JOIN      results ON races.raceid = results.raceid WHERE      races.date = '1983-07-16'; 
SELECT MIN(year) AS first_year FROM races WHERE name = 'Singapore Grand Prix'; 
SELECT COUNT(raceId), name FROM races WHERE YEAR = 2005 ORDER BY name DESC
SELECT name FROM races WHERE date = (SELECT MIN(date) FROM races)
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1
SELECT year, COUNT(*) AS race_count FROM races GROUP BY year ORDER BY race_count DESC LIMIT 1; 
SELECT name FROM races WHERE YEAR = 2017 EXCEPT SELECT name FROM races WHERE YEAR = 2000
SELECT c.name AS circuit_name, c.location AS circuit_location FROM races r JOIN circuits c ON r.circuitid = c.circuitid WHERE r.year = (SELECT MIN(year) FROM races WHERE location LIKE '%Europe%')
SELECT s.year FROM races r JOIN circuits c ON r.circuitid = c.circuitid JOIN seasons s ON r.year = s.year WHERE c.name = 'Brands Hatch' AND r.name = 'British Grand Prix' ORDER BY s.year DESC LIMIT 1; 
SELECT COUNT(DISTINCT T3.year) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid JOIN seasons AS T3 ON T1.year = T3.year WHERE T2.name = 'Silverstone' AND T1.name = 'United Kingdom Grand Prix'
SELECT d.driverRef FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2010 AND ra.name = 'Singapore Grand Prix' ORDER BY r.position
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.points DESC LIMIT 1
SELECT d.forename, d.surname, r.points FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.year = 2017 AND ra.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3
SELECT T2.forename, T2.surname, T3.name FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T1.raceid = T3.raceid ORDER BY T1.milliseconds LIMIT 1
SELECT AVG(T3.milliseconds) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN lapTimes AS T3 ON T2.resultId = T3.resultId JOIN races AS T4 ON T3.raceId = T4.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T4.name = 'Malaysian Grand Prix' AND T4.year = 2009
SELECT CAST(SUM(CASE WHEN T1.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.surname = 'Hamilton' AND T1.year >= 2010
SELECT T1.forename, T1.surname, T1.nationality, SUM(T2.points) AS total_points FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY COUNT(T2.wins) DESC LIMIT 1
SELECT STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', dob) AS age, forename, surname FROM drivers WHERE nationality = 'Japanese' ORDER BY age ASC LIMIT 1
SELECT T2.circuitName FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE YEAR(T1.date) BETWEEN 1990 AND 2000 GROUP BY T2.circuitName HAVING COUNT(DISTINCT T1.raceid) = 4
SELECT c.name AS circuit_name, c.location AS circuit_location, r.name AS race_name FROM races r JOIN circuits c ON r.circuitid = c.circuitid JOIN seasons s ON r.raceid = s.raceid WHERE c.country = 'USA' AND s.year = 2006
SELECT T1.name, T2.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE STRFTIME('%Y-%m', T1.date) = '2005-09'
SELECT DISTINCT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Alex' AND T1.surname = 'Yoong' AND T2.position < 20
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T1.surname = 'Schumacher' AND T4.name = 'Sepang International Circuit' AND T2.position = 1
SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher'; 
SELECT AVG(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.surname = 'Irvine' AND T1.forename = 'Eddie' AND T3.year = 2000
SELECT r.name AS race_name, res.points FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.date ASC LIMIT 1
SELECT T1.name AS RaceName, T2.country AS HostingCountry FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2017 ORDER BY T1.date
SELECT r.name AS RaceName, r.year AS Year, c.location AS Location FROM races r JOIN circuits c ON r.circuitid = c.circuitid ORDER BY r.laps DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE name = 'Silverstone Circuit' OR name = 'Hockenheimring' OR name = 'Hungaroring' ORDER BY lat DESC LIMIT 1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1
SELECT COUNT(*) FROM drivers WHERE code IS NULL OR code = ''
SELECT T2.country FROM drivers AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid ORDER BY T1.dob ASC LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT DISTINCT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT c.name AS circuit_name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2009 AND r.round = 5 AND r.name = 'Spanish Grand Prix'
SELECT DISTINCT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone' 
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Silverstone'
SELECT T1.date, T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2010 AND T2.name = 'Abu Dhabi Circuit'
SELECT COUNT(*) FROM circuits WHERE country = 'Italy';
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'
SELECT MIN(T3.fastestLapTime) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN laps AS T3 ON T2.resultId = T3.resultId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.fastestLapSpeed DESC LIMIT 1
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2007 AND T1.name = 'Canadian Grand Prix' AND T2.position = 1
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' 
SELECT T2.raceId FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.rank ASC LIMIT 1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT DISTINCT r.year FROM drivers d JOIN results res ON d.driverId = res.driverId JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'; 
SELECT T2.positionOrder FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix' AND T3.year = 2008
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 1989 AND T1.name = 'Australian Grand Prix' AND T2.grid = 4; 
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.time IS NOT NULL
SELECT T3.fastestLapTime FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN laps AS T3 ON T2.resultId = T3.resultId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.raceid IN (SELECT raceid FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008)
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix' AND T1.rank = 2
SELECT d.driverRef, d.url FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND YEAR = 2008) AND r.position = 1
SELECT COUNT(T1.driverId) FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.nationality = 'British' AND T3.year = 2008 AND T3.name = 'Australian Grand Prix'
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.year = 2008 AND T3.name = 'Chinese Grand Prix' AND T2.time IS NOT NULL
SELECT SUM(points) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT AVG(STRFTIME('%s', SUBSTR(T1.fastestLapTime, 4))) AS average_fastest_lap_time FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.driverId) AS completion_rate FROM races AS T1 INNER JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'
SELECT ((strftime('%J', 'now') - strftime('%J', TIME)) * 86400 * 1000 + CAST(REPLACE(SUBSTR(TIME, INSTR(TIME, ':') + 1), '.', '') AS INTEGER)) - milliseconds AS time_difference FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') ORDER BY position DESC LIMIT 1
SELECT COUNT(*) FROM circuits WHERE location = 'Melbourne' AND country = 'Australia';
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980'
SELECT MAX(T2.points) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British'
SELECT c.name FROM constructorStandings cs JOIN constructors c ON cs.constructorId = c.constructorId ORDER BY cs.points DESC LIMIT 1
SELECT T2.name FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE T1.raceid = 291 AND T1.points = 0 
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Japanese' GROUP BY T1.constructorId HAVING COUNT(T2.raceId) = 2 AND SUM(T2.points) = 0
SELECT c.name FROM constructors AS c JOIN constructorStandings AS cs ON c.constructorId = cs.constructorId WHERE cs.position = 1
{     "chain_of_thought_reasoning": "We need to join the constructors, drivers, and results tables to find French constructors with lap numbers over 50. We use COUNT(DISTINCT) to count the number of unique French constructors.",     "SQL": "SELECT COUNT(DISTINCT T1.constructorId) FROM constructors AS T1 JOIN drivers AS T2 ON T1.constructorId = T2.constructorId JOIN results AS T3 ON T2.driverId = T3.driverId
   SELECT *    FROM drivers d    JOIN results r ON d.driverId = r.driverId    JOIN races ra ON r.raceId = ra.raceId    
SELECT AVG(CAST(SUBSTR(time, 4) AS REAL)) AS avg_time_seconds, YEAR FROM results WHERE SUBSTR(time, 1, 2) != '+' AND YEAR < 1975 GROUP BY YEAR
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE YEAR(T1.dob) > 1975 AND T2.rank = 2; 
SELECT COUNT(*) FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Italian' AND r.time IS NULL
SELECT T2.forename, T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.fastestLapTime ASC LIMIT 1
SELECT T1.fastestLap FROM results AS T1 JOIN ( SELECT driverId, MAX(points) AS maxPoints FROM results WHERE YEAR = 2009 GROUP BY driverId ) AS T2 ON T1.driverId = T2.driverId AND T1.points = T2.maxPoints
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT T2.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.dob < '1985-01-01' AND T3.year BETWEEN 2000 AND 2005
SELECT COUNT(*)  FROM drivers d INNER JOIN laptimes lt ON d.driverid = lt.driverid WHERE d.nationality = 'French' AND        CAST(SUBSTR(lt.time, 4, 2) AS INTEGER) * 60 +        CAST(SUBSTR(lt.time, 7, 2) AS INTEGER) < 120; 
SELECT code FROM drivers WHERE nationality = 'American'
SELECT raceId FROM races WHERE YEAR(date) = 2009
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18
SELECT MIN(dob) AS youngest_dob FROM drivers ORDER BY dob DESC LIMIT 3; SELECT COUNT(*) AS netherlandic_drivers FROM drivers WHERE nationality = 'Netherlands' AND dob IN (SELECT MIN(dob) AS youngest_dob FROM drivers ORDER BY dob DESC LIMIT 3)
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica';
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) = '1980'
SELECT d.forename, d.surname, l.time FROM drivers AS d JOIN results AS r ON d.driverid = r.driverid JOIN laps AS l ON r.resultid = l.resultid WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' ORDER BY l.time ASC LIMIT 3; 
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE STRFTIME('%Y', T1.dob) = '1971' AND T2.fastestLapTime IS NOT NULL
SELECT d.driverId, d.forename, d.surname, l.time FROM drivers d JOIN lapTimes l ON d.driverId = l.driverId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' ORDER BY l.time DESC LIMIT 10
SELECT T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY T1.fastestLapTime ASC LIMIT 1
SELECT T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid ORDER BY TIME ASC LIMIT 1
SELECT driverId FROM results WHERE laps = 1 ORDER BY time ASC LIMIT 5
SELECT COUNT(DISTINCT r.driverId) FROM results AS r JOIN status AS s ON r.statusId = s.statusId WHERE r.raceId BETWEEN 50 AND 100 AND s.statusId = 2
SELECT COUNT(*) AS count, location, lat, lng FROM circuits WHERE country = 'Austria';
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T2.driverRef, T2.nationality, T2.dob FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 23 AND T1.q2 IS NOT NULL
SELECT      d.driverId,     d.forename,     d.surname,     r.year,     r.name AS race_name,     r.date,     r.time FROM      drivers d JOIN      qualifying q ON d.driverId = q.driverId JOIN      races r ON q.raceId = r.raceId WHERE      q.position IS NOT NULL ORDER BY      d.dob DESC LIMIT 1; 
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN status AS T3 ON T2.statusid = T3.statusid WHERE T1.nationality = 'American' AND T3.status = 'Puncture';
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T2.raceId = T3.raceId GROUP BY T1.constructorId ORDER BY COUNT(T2.wins) DESC LIMIT 1
SELECT d.driverid, d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverid = r.driverid JOIN races AS rc ON r.raceid = rc.raceid WHERE rc.name = 'French Grand Prix' AND r.lap = 3 ORDER BY r.time DESC LIMIT 1
SELECT T2.name, T1.milliseconds FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.lap = 1 AND T1.time = (   SELECT MIN(time)   FROM results   WHERE lap = 1 ); 
SELECT AVG(T2.fastestLapTime) AS avg_fastest_lap_time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'United States Grand Prix' AND T1.year = 2006 AND T2.rank <= 10
SELECT T1.forename, T1.surname, AVG(T2.duration) AS avg_duration FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND strftime('%Y', T1.dob) BETWEEN '1980' AND '1985' GROUP BY T1.forename, T1.surname ORDER BY avg_duration ASC LIMIT 3
SELECT d.forename, d.surname, r.time FROM drivers d JOIN results r ON d.driverid = r.driverid JOIN races ra ON r.raceid = ra.raceid WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2008 ORDER BY r.position ASC LIMIT 1; 
SELECT T1.constructorRef, T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Singapore Grand Prix' AND T3.year = 2009 ORDER BY T2.points DESC LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'
SELECT forename || ' ' || surname AS FullName, url, dob FROM drivers WHERE nationality = 'German' AND STRFTIME('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';
SELECT c.points, c.constructorRef, c.nationality FROM constructorStandings AS c JOIN races AS r ON c.raceId = r.raceId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 ORDER BY c.points DESC LIMIT 1
SELECT AVG(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.surname = 'Hamilton' AND T3.country = 'Turkey'
SELECT COUNT(raceId) / 10 AS average_races_per_year FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31'
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT COUNT(T2.wins) FROM results AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T2.position = 91
SELECT T2.name FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid ORDER BY T1.fastestlapspeed DESC LIMIT 1
SELECT T2.location, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid ORDER BY T1.date DESC LIMIT 1; 
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.year = 2008 AND T2.circuitid = 61 AND T2.position = 1
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId ORDER BY T1.dob DESC LIMIT 1; 
SELECT COUNT(*), d.driverRef FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId JOIN drivers d ON r.driverId = d.driverId WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident' GROUP BY d.driverRef ORDER BY COUNT(*) DESC LIMIT 1; 
SELECT T1.forename, T1.surname, SUM(T2.wins) AS total_wins FROM drivers AS T1 JOIN driverstandings AS T2 ON T1.driverid = T2.driverid ORDER BY T1.dob ASC LIMIT 1
SELECT MAX(duration) FROM pitStops
SELECT MIN(time) AS fastest_lap_time FROM lapTimes; 
SELECT MAX(T2.duration) AS longest_pit_stop FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT p.lap FROM pitStops p JOIN results r ON p.driverId = r.driverId AND p.raceId = r.raceId JOIN drivers d ON r.driverId = d.driverId JOIN races ra ON r.raceId = ra.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND ra.year = 2011 AND ra.name = 'Australian Grand Prix'
SELECT p.driverId, p.stop, p.duration FROM pitStops p JOIN races r ON p.raceId = r.raceId WHERE r.year = 2011 AND r.name = 'Australian Grand Prix' 
SELECT MIN(T2.time) AS fastest_lap_time FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'; 
SELECT T2.forename, T2.surname FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.time ASC LIMIT 20
SELECT r.name AS circuit_name FROM drivers d JOIN results res ON d.driverid = res.driverid JOIN races r ON res.raceid = r.raceid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.fastestlaptime ASC LIMIT 1
SELECT MIN(lt.time) AS lap_record FROM lapTimes lt JOIN races r ON lt.raceId = r.raceId JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Austrian Grand Prix'
SELECT r.driverid, r.position, r.fastestlapspeed, r.fastestlaptimet FROM results r JOIN races ra ON r.raceid = ra.raceid JOIN circuits c ON ra.circuitid = c.circuitid WHERE c.country = 'Italy' ORDER BY r.fastestlaptimet
SELECT r.name AS race_name FROM races r JOIN circuits c ON r.circuitid = c.circuitid JOIN laptimes lt ON r.raceid = lt.raceid WHERE c.name = 'Austrian Grand Prix Circuit' ORDER BY lt.time ASC LIMIT 1
SELECT T3.duration FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid JOIN pitstops AS T3 ON T2.driverid = T3.driverid AND T2.raceid = T3.raceid WHERE T1.name = 'Austrian Grand Prix' ORDER BY T2.q1 ASC LIMIT 1
SELECT T2.lat, T2.lng FROM results AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.fastestlaptIME = '1:29.488'
  SELECT milliseconds   
SELECT AVG(lapTimes.milliseconds) FROM lapTimes JOIN races ON lapTimes.raceId = races.raceId WHERE races.country = 'Italy'
