SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`)  FROM frpm  WHERE `County Name` = 'Alameda'
SELECT "Educational Option Type", ("Free Meal Count (Ages 5-17)" / "Enrollment (Ages 5-17)") AS eligible_free_rate  FROM frpm  WHERE "Educational Option Type" = 'Continuation School'  ORDER BY eligible_free_rate ASC  LIMIT 3;
SELECT T2.Zip FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.District_Name = 'Fresno County Office of Education' AND T1.`Charter School (Y/N)` = 1
SELECT T2.MailStreet FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1."FRPM Count (K-12)" = (SELECT MAX("FRPM Count (K-12)") FROM frpm)
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`Charter Funding Type` = 'Directly funded' AND T2.OpenDate > '2000-01-01'
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE AvgScrMath > 400 AND Virtual = 'F'
SELECT T2.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 500 AND T2.Magnet = 1;
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)
SELECT T1.NumTstTakr FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 1
SELECT COUNT(*) FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.`Charter Funding Type` = 'Directly funded'
SELECT T2.`FRPM Count (Ages 5-17)` FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MAX(`AvgScrRead`) FROM `satscores`)
SELECT T1.CDSCode FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Enrollment (K-12)` + T2.`Enrollment (Ages 5-17)` > 500
SELECT MAX(T2.Free_Meal_Count__Ages_5_17 / T2.Enrollment__Ages_5_17) FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 / T1.NumTstTakr > 0.3
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr != 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3
SELECT T2.NCESSchool FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT s.District, MAX(ss.AvgScrRead) AS Max_Average_Reading_Score FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY Max_Average_Reading_Score DESC LIMIT 1;
SELECT COUNT(*) FROM satscores JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.StatusType = 'Merged' AND schools.County = 'Alameda' AND satscores.NumTstTakr < 100;
SELECT CharterNumber, AVG(WritingScore) AS AverageWritingScore  FROM Schools  WHERE WritingScore > 499 AND CharterNumber IS NOT NULL  GROUP BY CharterNumber  ORDER BY AverageWritingScore DESC;
SELECT COUNT(*) FROM Schools WHERE Location = 'Fresno' AND Funding_Type = 'Directly Funded' AND Test_Takers <= 250;
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT COUNT(*) FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.County = 'Amador' AND frpm.Low_Grade = '9' AND frpm.High_Grade = '12'
SELECT COUNT(*) FROM frpm WHERE County_Name = 'Los_Angeles' AND Free_Meal_Count_K_12 > 500 AND Free_Meal_Count_K_12 < 700
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1;
SELECT T2.School, T2.StreetAbr FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T1."Enrollment (K-12)" - T1."Enrollment (Ages 5-17)") > 30;
SELECT T2.School_Name FROM satscores AS T1 JOIN frpm AS T2 ON T1.CDS = T2.CDSCode WHERE CAST(T2.Free_Meal_Count__K_12 AS REAL) / T2.Enrollment__K_12 > 0.1 AND T1.NumGE1500 > 0
SELECT T2.DistrictName, T2.CharterFundingType FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T2.DistrictName = 'Riverside' AND T1.AvgScrMath > 400 GROUP BY T2.DistrictName, T2.CharterFundingType
SELECT T2.School_Name ,  T2.Street ,  T2.City ,  T2.State ,  T2.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Monterey' AND T2.School_Type = 'High Schools (Public)' AND T2.Free_Meal_Count_Ages_5_17 > 800
SELECT T2.School, T1.AvgScrWrite, T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE (T2.OpenDate > '1991-01-01' OR T2.ClosedDate < '2000-01-01') AND T2.Phone IS NOT NULL
SELECT T2.School, T2.DOC FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17 > (SELECT AVG(T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17) FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FundingType = 'Locally funded') AND T2.FundingType = 'Locally funded'
SELECT T2.OpenDate FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm)
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT (Free_Meal_Count__K_12_ / Enrollment__K_12_) AS eligible_free_rate FROM frpm ORDER BY Enrollment__K_12_ DESC LIMIT 2 OFFSET 9
SELECT frpm.CDSCode, (frpm.`FRPM Count (K-12)` / frpm.`Enrollment (K-12)`) AS eligible_FRPM_rate  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.SOC = '66'  ORDER BY frpm.`FRPM Count (K-12)` DESC  LIMIT 5;
SELECT T2.Website, T1."School Name" FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1."Free Meal Count (Ages 5-17)" BETWEEN 1900 AND 2000
SELECT T2.`Free Meal Count (Ages 5-17)` / T2.Enrollment AS free_rate  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson'
SELECT T2.AdmEmail1 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM School_SAT_Results AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM School_SAT_Results)
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr != 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr LIMIT 1
SELECT T1.Website FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Los Angeles' AND T2.NumTstTakr BETWEEN 2000 AND 3000
SELECT AVG(T1.NumTstTakr) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Fresno' AND T2.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT AdmFName1, AdmLName1  FROM table_name  WHERE Virtual = 'F'  GROUP BY County, AdmFName1, AdmLName1  HAVING AVG(ReadingScore) OVER (PARTITION BY County)  IN (SELECT TOP 5 AVG(ReadingScore)      FROM table_name      WHERE Virtual = 'F'      GROUP BY County      ORDER BY AVG(ReadingScore) DESC)
SELECT T2.EdOpsName FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT T1.AvgScrMath, T2.County FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE (T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite) = (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM satscores)
SELECT T2.AvgScrWrite, T1.City FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)
SELECT T2.School, AVG(T1.AvgScrWrite)  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T2.AdmFName1 = 'Ricci' AND T2.AdmLName1 = 'Ulrich'  GROUP BY T2.School;
SELECT schools.School, frpm."Enrollment (K-12)"  FROM schools  JOIN frpm ON schools.CDSCode = frpm.CDSCode  WHERE schools.DOC = '31'  ORDER BY frpm."Enrollment (K-12)" DESC  LIMIT 1;
SELECT COUNT(School) / 12 AS monthly_avg  FROM schools  WHERE County = 'Alameda' AND DOC = '52' AND YEAR(OpenDate) = 1980;
SELECT CAST(COUNT(CASE WHEN DOC = '54' AND StatusType = 'Merged') AS REAL) / COUNT(CASE WHEN DOC = '52' AND StatusType = 'Merged') FROM schools WHERE County = 'Orange'
SELECT County, School, ClosedDate  FROM schools  WHERE StatusType = 'Closed'  GROUP BY County, School, ClosedDate  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT T1.SchMailingStreet, T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchKey = T2.SchKey WHERE T2.TestType = 'Math' ORDER BY T2.AverageScore DESC LIMIT 6,1;
SELECT T2.MailStreet, T2.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead IS NOT NULL ORDER BY T1.AvgScrRead ASC LIMIT 1;
SELECT COUNT(*)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.MailCity = 'Lakeport'  AND (satscores.AvgScrRead + satscores.AvgScrMath + satscores.AvgScrWrite) >= 1500;
SELECT SUM(satscores.NumTstTakr)  FROM satscores  JOIN schools ON satscores.cds = schools.CDSCode  WHERE schools.MailCity = 'Fresno';
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE MailState = 'CA'
SELECT COUNT(*) FROM schools WHERE MailingState = 'CA' AND City = 'San Joaquin' AND Status = 'Active'
SELECT T2.Phone, T2.Ext FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrWrite DESC LIMIT 1 OFFSET 332
SELECT School, Phone, Ext FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' UNION SELECT Website FROM schools WHERE AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez'
SELECT Website  FROM schools  WHERE County = 'San Joaquin'  AND Virtual = 'P'  AND Charter = 1;
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = '52';
SELECT COUNT(*) FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.County = 'Los Angeles' AND schools.Charter = 0 AND (frpm.`Free Meal Count (K-12)` * 100 / frpm.`Enrollment (K-12)`) < 0.18;
SELECT AdmFName1, AdmLName1, School, City  FROM schools  WHERE Charter = 1 AND CharterNum = '00D2'
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'
SELECT      CAST(SUM(CASE WHEN FundingType = 'Locally funded' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Ratio_Percentage FROM schools WHERE County = 'Santa Clara' AND Charter = 1;
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT COUNT(*) FROM schools WHERE City = 'San Francisco' AND ClosedDate LIKE '1989%' AND DOCType = 'Community College District';
SELECT County  FROM schools  WHERE StatusType = 'Closed' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND SOC = '11'  GROUP BY County  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT NCESDist FROM schools WHERE SOC = '31'
SELECT COUNT(*) FROM schools WHERE StatusType IN ('Active', 'Closed') AND County = 'Alpine' AND School LIKE '%District Community Day%';
SELECT frpm.DistrictCode FROM frpm JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.Magnet = 0 AND schools.City = 'Fresno'
SELECT SUM(T1.`Enrollment (Ages 5-17)`)  FROM frpm AS T1  JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T2.City = 'Fremont' AND T2.EdOpsCode = 'SSS' AND T1.`Academic Year` = '2014-2015'
SELECT T1."FRPM Count (Ages 5-17)" FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailStreet = 'PO Box 1040' AND T2.SOCType = 'Youth Authority'
SELECT MIN(Grade) FROM Schools WHERE EdOpsCode = 'SPECON' AND NCESDistID = 0613360;
SELECT T1.EILName, T1.School FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County_Code = 37 AND T2.NSLP_Provision_Status = 'Breakfast Provision 2'
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.NSLP_Provision_Status = 'Lunch Provision 2' AND T1.Low_Grade = '9' AND T1.High_Grade = '12' AND T2.County = 'Merced' AND T2.EILCode = 'HS'
SELECT T2.School ,  (T1.`FRPM Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)` * 100) AS Percent_Eligible_FRPM FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T2.GSserved = 'K-9'
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1;
SELECT County, COUNT(*) AS School_Count  FROM schools  WHERE Virtual = 'F' AND (County = 'San Diego' OR County = 'Santa Barbara')  GROUP BY County  ORDER BY School_Count DESC  LIMIT 1;
SELECT T1.School_Name ,  T2.Latitude FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Latitude = (SELECT MAX(Latitude) FROM schools)
SELECT T1.City, T2.LowGrade, T2.`School Name` FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' ORDER BY T1.Latitude ASC LIMIT 1
SELECT GSoffered FROM schools WHERE longitude = (SELECT MAX(ABS(longitude)) FROM schools)
SELECT COUNT(s.CDSCode), s.City  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.GSoffered = 'K-8' AND s.Magnet = 1 AND f.NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY s.City;
SELECT AdmFName1, District FROM schools WHERE AdmFName1 IS NOT NULL AND District IN (SELECT District FROM schools GROUP BY District HAVING COUNT(*) > 1) ORDER BY AdmFName1 ASC LIMIT 2;  However, to accurately answer the question "What are the two most common first names among the school administrators? Indicate the district to which they administer.", we need a query that groups by administrator's first name and counts occurrences, then orders them in descending order of frequency. Here is the correct SQL query:  SELECT AdmFName1, COUNT(*) as count, District  FROM schools  WHERE AdmFName1 IS NOT NULL GROUP BY AdmFName1, District  ORDER BY count DESC  LIMIT 2;  But this will give us potentially multiple districts for each name. To get the most common first names across all districts and their associated districts:  SELECT AdmFName1, COUNT(*) as total_count, GROUP_CONCAT(District) as districts FROM schools  WHERE AdmFName1 IS NOT NULL GROUP BY AdmFName1 ORDER BY total_count DESC LIMIT 2;
SELECT T1.DistrictCode ,  (T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)` * 100) AS Percent_Eligible_Free FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine'
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = '0040'
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail2 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)
SELECT T2.AdmEmail1, T2.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'East Bohemia' AND account.frequency = 'POPLATEK PO OBRATU';
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A3 = 'Prague';
SELECT      AVG(A12) AS avg_unemployment_1995,     AVG(A13) AS avg_unemployment_1996 FROM district;   -- To determine which year had a higher average unemployment rate, compare the two averages returned by the query.
SELECT COUNT(*)  FROM ( (SELECT district_id   FROM district   WHERE A11 > 6000 AND A11 < 10000)   INTERSECT   (SELECT district_id   FROM client   WHERE gender = 'F')) AS result;
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'north Bohemia' AND d.A11 > 8000;
SELECT T2.account_id ,  MAX(T1.A11) - MIN(T1.A11) AS gap FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T3.gender = 'F' GROUP BY T2.account_id ORDER BY T3.birth_date ASC LIMIT 1
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date = (SELECT MAX(birth_date) FROM client) AND T2.district_id IN (SELECT district_id FROM district ORDER BY A11 DESC LIMIT 1)
SELECT COUNT(*)  FROM disp  JOIN account ON disp.account_id = account.account_id  WHERE disp.type = 'OWNER' AND account.frequency = 'POPLATEK TYDNE'
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU'
SELECT T1.account_id FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND YEAR(T2.date) = 1997 ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 12 AND T2.opening_date LIKE '1993%' ORDER BY T1.amount DESC LIMIT 1;
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM district WHERE name = 'Sokolov')
SELECT account_id FROM trans WHERE date = (SELECT MIN(date) FROM trans WHERE YEAR(date) = 1995) AND YEAR(date) = 1995 GROUP BY account_id;
SELECT T2.account_id FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount > 3000 AND T2.date < '1997-01-01' GROUP BY T2.account_id
SELECT T2.client_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued = '1994-03-03'
SELECT T2.date FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.date = '1998-10-14'
SELECT T2.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25'
SELECT MAX(t1.amount) FROM trans AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id WHERE t2.date = '1996-10-21'
SELECT T2.gender FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A11 = (SELECT MAX(A11) FROM district) ORDER BY T2.birth_date ASC LIMIT 1
SELECT T1.amount FROM trans AS T1 JOIN ( SELECT account_id ,  MAX(loan_amount) AS max_loan FROM loan GROUP BY account_id ) AS T2 ON T1.account_id = T2.account_id WHERE T1.date = ( SELECT MIN(date) FROM trans WHERE account_id = T2.account_id AND date > ( SELECT date FROM loan WHERE account_id = T2.account_id AND amount = T2.max_loan ) )
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A2 = 'Jesenik' AND c.gender = 'F'
SELECT D.disp_id FROM disp AS D JOIN trans AS T ON D.account_id = T.account_id WHERE T.amount = 5100 AND T.date = '1998-09-02'
SELECT COUNT(*)  FROM account  JOIN district ON account.district_id = district.district_id  WHERE district.A2 = 'Litomerice' AND YEAR(account.date) = 1996;
SELECT T2.A2 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T3.birth_date FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03'
SELECT T1.account_id FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1
SELECT CAST(SUM(IIF(T2.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'south Bohemia' AND CAST(T1.A4 AS INTEGER) = (SELECT MAX(CAST(A4 AS INTEGER)) FROM district WHERE A3 = 'south Bohemia')
SELECT ((SELECT SUM(t2.amount) FROM loan AS t1 JOIN transaction AS t2 ON t1.account_id = t2.account_id WHERE t1.client_id = (SELECT client_id FROM loan WHERE approval_date = '1993-07-05' LIMIT 1) AND t2.date > '1998-12-27') - (SELECT SUM(t2.amount) FROM loan AS t1 JOIN transaction AS t2 ON t1.account_id = t2.account_id WHERE t1.client_id = (SELECT client_id FROM loan WHERE approval_date = '1993-07-05' LIMIT 1) AND t2.date < '1993-03-22')) / (SELECT SUM(t2.amount) FROM loan AS t1 JOIN transaction AS t2 ON t1.account_id = t2.account_id WHERE t1.client_id = (SELECT client_id FROM loan WHERE approval_date = '1993-07-05' LIMIT 1) AND t2.date < '1993-03-22')) * 100
SELECT SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) * 100.0 / SUM(amount) AS percentage FROM loan
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM loan  WHERE amount < 100000 AND status = 'C';   -- Note: The provided SQL query does not accurately answer the question. A correct version would involve calculating the percentage of accounts with a running contract and no issues (status='C') out of all accounts with an amount less than $100,000. Here's a corrected version:  SELECT      CAST(COUNT(*) FILTER (WHERE status = 'C') AS REAL) * 100 /      (SELECT COUNT(*) FROM loan WHERE amount < 100000) FROM loan WHERE amount < 100000 AND status = 'C';
SELECT T1.account_id, T2.A2, T2.A3 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date LIKE '1993%' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T1.account_id, T1.frequency FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'east Bohemia' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT T1.account_id ,  T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T1.A2, T1.A3  FROM district AS T1  JOIN account AS T2 ON T1.district_id = T2.district_id  JOIN loan AS T3 ON T2.account_id = T3.account_id  WHERE T3.loan_id = 4990;
SELECT T1.account_id, T3.A2, T3.A3 FROM loan AS T2 JOIN account AS T1 ON T2.account_id = T1.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.amount > 300000
SELECT T2.loan_id, T1.A2, T1.A11 FROM district AS T1 JOIN account AS T3 ON T1.district_id = T3.district_id JOIN loan AS T2 ON T3.account_id = T2.account_id WHERE T2.duration = 60
SELECT T3.district_id, (T3.A13 - T3.A12) / T3.A12 * 100 AS unemployment_increment_rate FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.status = 'D'
SELECT CAST(SUM(IIF(T2.A2 = 'Decin', 1, 0)) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1993'
SELECT account_id FROM account WHERE POPLATEK MESICNE = 'true';
SELECT T3.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' GROUP BY T2.district_id ORDER BY COUNT(T2.account_id) DESC LIMIT 9
SELECT T3.A2, SUM(T1.account) AS total_withdrawal  FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.district_id  WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%'  GROUP BY T3.A2  ORDER BY total_withdrawal DESC  LIMIT 10;
SELECT COUNT(*) FROM client  JOIN district ON client.district_id = district.district_id  JOIN disp ON client.client_id = disp.client_id  WHERE district.A3 = 'south Bohemia' AND NOT EXISTS (  SELECT * FROM account WHERE account.account_id = disp.account_id AND account.type = 'credit card' )
SELECT T3.A3 FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.status IN ('C', 'D') GROUP BY T3.A3 ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T3.amount) FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'M'
SELECT district_id, A2 FROM district ORDER BY A13 DESC LIMIT 1
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1)
SELECT COUNT(*) FROM trans JOIN account ON trans.account_id = account.account_id WHERE trans.operation = 'VYBER KARTOU' AND account.frequency = 'POPLATEK MESICNE' AND trans.balance < 0;
