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
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.date BETWEEN '1995-01-01' AND '1997-12-31'  AND loan.amount >= 250000  AND account.frequency = 'POPLATEK MESICNE'
SELECT COUNT(*)  FROM account a  JOIN loan l ON a.account_id = l.account_id  WHERE a.district_id = 1 AND l.status IN ('C', 'D')
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1)
SELECT COUNT(*) FROM card WHERE card_type_code = 'GOLD' AND disposition = 'OWNER'
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Pisek'
SELECT T3.district_id FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 10000 AND YEAR(T1.date) = 1997 GROUP BY T3.district_id
SELECT T1.account_id FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T1.district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id IN (SELECT client_id FROM card WHERE card_type_code = 'GOLD')
SELECT AVG(t1.amount)  FROM trans t1  WHERE t1.operation = 'VYBER KARTOU'  AND YEAR(t1.date) = 2021;
SELECT T2.client_id FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount < (SELECT AVG(amount) FROM transaction) AND T1.date BETWEEN '1998-01-01' AND '1998-12-31' AND T1.k_symbol = 'VYBER KARTOU' GROUP BY T2.client_id
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T3.disp_id = T2.disp_id JOIN loan AS T4 ON T4.account_id = T2.account_id WHERE T1.gender = 'F'
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A3 = 'south Bohemia'
SELECT T1.account_id FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id JOIN `disp` AS T3 ON T1.account_id = T3.account_id WHERE T2.A2 = 'Tabor' AND T3.type = 'OWNER'
SELECT T3.type FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN disp AS T3 ON T2.account_id = T3.account_id WHERE T1.A11 > 8000 AND T1.A11 <= 9000 AND T3.type != 'OWNER'
SELECT COUNT(*) FROM trans JOIN account ON trans.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'north Bohemia' AND trans.bank = 'AB'
SELECT T3.A2 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(T1.A15) FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND STRFTIME('%Y', T2.date) >= '1997'
SELECT COUNT(*)  FROM card c  JOIN disp d ON c.disp_id = d.disp_id  WHERE c.type = 'classic' AND d.type = 'OWNER';
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A2 = 'Hl.m. Praha'
SELECT CAST(SUM(CASE WHEN type = 'gold' AND issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card;
SELECT T1.client_id FROM disp AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' ORDER BY T2.amount DESC LIMIT 1;
SELECT T1.A15 FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532
SELECT T2.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333;
SELECT T1.trans_id FROM trans AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.operation = 'VYBER' AND T2.client_id = 3356
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;
SELECT T2.type FROM disp AS T1 JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 13539;
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT T2.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'A' GROUP BY T2.district_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN `order` AS T3 ON T2.account_id = T3.account_id WHERE T3.order_id = 32423;
SELECT trans.trans_id FROM trans JOIN account ON trans.account_id = account.account_id WHERE account.district_id = 5;
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik'
SELECT T2.client_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'junior' AND T1.issued >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A11 > 10000;
SELECT ((SELECT SUM(l.amount) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE YEAR(l.date) = 1997 AND a.account_id IN (SELECT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M')) - (SELECT SUM(l.amount) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE YEAR(l.date) = 1996 AND a.account_id IN (SELECT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'))) / (SELECT SUM(l.amount) FROM loan l JOIN account a ON l.account_id = a.account_id WHERE YEAR(l.date) = 1996 AND a.account_id IN (SELECT d.account_id FROM disp d JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M')) * 100
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'
SELECT (SELECT A16 FROM district WHERE A3 = 'north Bohemia') - (SELECT A16 FROM district WHERE A3 = 'east Bohemia') AS Difference_in_Crimes;
SELECT type, COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type
SELECT T1.frequency FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id = 3 AND T2.amount = 3539 AND T2.k_symbol IN ('POJISTNE', 'SIPO', 'LEASING', 'UVER')
SELECT birth_date FROM client WHERE client_id = 130;   However, based on the samples provided in the schema, there's no entry for a client_id of 130. The SQL query above assumes such an entry exists. If you want to handle this case and only get the year part from date, here is the modified version:  SELECT EXTRACT(YEAR FROM birth_date)  FROM client  WHERE client_id = 130;
SELECT COUNT(*)  FROM disp  JOIN account ON disp.account_id = account.account_id  WHERE disp.type = 'OWNER' AND account.frequency = 'POPLATEK PO OBRATU'
SELECT T1.amount, T1.status FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 992;
SELECT T3.gender FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.trans_id = 851 AND T3.client_id = 4 GROUP BY T3.gender, T1.balance SUM(T1.balance)
SELECT T2.type FROM disp AS T1 JOIN card AS T2 ON T1.disp_id = T2.disp_id WHERE T1.client_id = 9
SELECT SUM(t.amount) FROM trans t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE c.client_id = 617 AND YEAR(t.date) = 1998
SELECT client.client_id FROM client JOIN account ON client.client_id = account.client_id JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.A3 = 'east Bohemia'
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' ORDER BY T3.amount DESC LIMIT 3
SELECT COUNT(DISTINCT T3.client_id)  FROM trans AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN client AS T3 ON T2.client_id = T3.client_id  WHERE T3.gender = 'M' AND T3.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T1.k_symbol = 'SIPO' AND T1.amount > 4000;
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Beroun' AND STRFTIME('%Y', account.date) > '1996';
SELECT COUNT(*)  FROM client c  JOIN disp d ON c.client_id = d.client_id  JOIN card cr ON d.disp_id = cr.disp_id  WHERE c.gender = 'F' AND cr.type = 'junior';
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'Prague'
SELECT (COUNT(T1.client_id) * 100.0 / (SELECT COUNT(*) FROM client AS T3 JOIN account AS T4 ON T3.district_id = T4.district_id WHERE T4.frequency = 'POPLATEK TYDNE')) AS percentage FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.frequency = 'POPLATEK TYDNE'
SELECT COUNT(*) FROM ( (SELECT client_id FROM account WHERE frequency = 'POPLATEK TYDNE') INTERSECT (SELECT client_id FROM client WHERE gender = 'F') ) AS result
SELECT T2.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 24 AND T2.date < '1997-01-01' ORDER BY T1.amount ASC LIMIT 1;
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.district_id IN (SELECT district_id FROM district ORDER BY A11 ASC LIMIT 1) ORDER BY DATE(T1.birth_date) DESC LIMIT 1;
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1920-01-01' AND '1920-12-31' AND d.A3 = 'east Bohemia';
SELECT COUNT(*)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE'
SELECT AVG(loan.payments)  FROM loan  JOIN account ON loan.account_id = account.account_id  WHERE (loan.status = 'C' OR loan.status = 'D') AND account.frequency = 'POPLATEK PO OBRATU'
SELECT T1.client_id ,  T3.A2 FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'OWNER'
SELECT T3.client_id ,  (YEAR(CURDATE()) - YEAR(T3.birth_date)) AS age FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.type = 'gold' AND T2.type = 'OWNER'
SELECT bond_type, COUNT(*) AS count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl'
SELECT AVG(T2.element) FROM bond AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.element = 'o' GROUP BY T1.molecule_id;
SELECT AVG(T2.bond_type_count) FROM molecule AS T1 JOIN ( SELECT T1.molecule_id, COUNT(*) AS bond_type_count FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' GROUP BY T1.molecule_id ) AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'na' AND molecule.label = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+'
SELECT CAST(COUNT(T1.atom_id) AS REAL) * 100 / COUNT(T2.bond_type) FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR099'  AND label = '+'
SELECT molecule_id FROM atom WHERE element = 'c' GROUP BY molecule_id
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.molecule_id = T1.molecule_id WHERE T3.bond_type = '='
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1;
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'cl' GROUP BY T2.bond_type
SELECT T1.atom_id, T2.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-'
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.label = '-'
SELECT T1.element AS element , COUNT(T1.element) AS num FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY num ASC LIMIT 1;
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8')
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element != 'sn' GROUP BY T2.label HAVING COUNT(*) > 0
SELECT COUNT(DISTINCT a.atom_id)  FROM atom AS a  JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond AS b ON c.bond_id = b.bond_id  WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'
SELECT T1.atom_id, T2.atom_id2  FROM connected AS T1  JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id  JOIN bond AS T3 ON T1.bond_id = T3.bond_id  WHERE T3.bond_type = '#'
SELECT T2.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T1.molecule_id = 'TR181' UNION SELECT T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR181'
SELECT CAST(COUNT(CASE WHEN T2.element != 'f' THEN T1.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_type) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3
SELECT SUBSTRING(bond_id, 4, 2) AS atom1 ,  SUBSTRING(bond_id, 7, 2) AS atom2 FROM bond WHERE molecule_id = 'TR001' AND bond_id = 'TR001_2_6'
SELECT (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)) AS difference FROM molecule;
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR000_2_5' AND T1.atom_id != T2.atom_id2;
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' ORDER BY T1.molecule_id ASC LIMIT 5
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '=' THEN 1 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR008' GROUP BY T2.molecule_id;
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN 1 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 WHERE T1.label = '+' OR T1.label = '-' GROUP BY T1.label LIMIT 1
SELECT CAST(COUNT(CASE WHEN T1.element = 'h' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR206' GROUP BY T2.molecule_id;
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT T1.element, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'
SELECT T2.bond_type, T3.label FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.molecule_id = 'TR010' GROUP BY T2.bond_type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.bond_type = '-' ORDER BY T1.molecule_id ASC LIMIT 3;
SELECT T2.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR006' ORDER BY T2.bond_id LIMIT 2;
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009')
SELECT COUNT(*)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'br'
SELECT T2.bond_type ,  T1.atom_id ,  T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'
SELECT T2.molecule_id, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19'
SELECT element FROM atom WHERE molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T2.label = '+' GROUP BY T1.molecule_id
SELECT T2.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element IN ('p', 'n') GROUP BY T2.bond_id HAVING COUNT(*) = 2
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_type) DESC LIMIT 1
SELECT AVG(T2.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i' GROUP BY T1.atom_id;
SELECT T1.bond_id, T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE SUBSTR(T2.atom_id, 7, 2) + 0 = 45
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected)
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T3.atom_id  =  T2.atom_id2 WHERE T1.bond_type  =  '# ' AND T3.molecule_id  =  'TR041' UNION SELECT T4.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T4 ON T4.atom_id  =  T2.atom_id WHERE T1.bond_type  =  '# ' AND T4.molecule_id  =  'TR041'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_type) DESC LIMIT 1
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.atom_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 'pb' UNION SELECT T2.atom_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T2.element = 'pb' EXCEPT SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 'pb'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT CAST(COUNT(T2.bond_id) AS REAL) / COUNT(DISTINCT T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element IN (SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) DESC LIMIT 1) AND T2.bond_type IN (SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1)
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN('c', 'h')
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'sn'
SELECT COUNT(DISTINCT T2.element) FROM bond AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT COUNT(*)  FROM atom  JOIN bond ON atom.molecule_id = bond.molecule_id  WHERE bond.bond_type = '#' AND (atom.element = 'p' OR atom.element = 'br')
SELECT T1.bond_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.label  =  '+'
SELECT T1.molecule_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-'
SELECT CAST(COUNT(CASE WHEN a.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(a.atom_id) FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*)  FROM molecule  WHERE molecule_id BETWEEN 'TR000' AND 'TR030'  AND label = '+'
SELECT T1.bond_type FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(*)  FROM bond  JOIN atom ON SUBSTRING(bond.bond_id, 4, 1) = atom.element OR SUBSTRING(bond.bond_id, 6, 1) = atom.element  WHERE atom.element = 'i'
SELECT T2.label, COUNT(*) AS count FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca' GROUP BY T2.label ORDER BY count DESC LIMIT 1;
SELECT  FROM connected JOIN atom AS atom1 ON connected.atom_id = atom1.atom_id JOIN atom AS atom2 ON connected.atom_id2 = atom2.atom_id WHERE connected.bond_id = 'TR001_1_8' AND (atom1.element = 'cl' OR atom2.element = 'cl') AND (atom1.element = 'c' OR atom2.element = 'c')
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element = 'c' AND T3.bond_type = '#' AND T1.label = '-' LIMIT 2
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.element) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001'
SELECT molecule_id FROM bond WHERE bond_type = ' = '
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_1_2' GROUP BY T1.element
SELECT COUNT(*) FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT b.bond_id, m.label  FROM bond AS b  JOIN molecule AS m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND (m.label = '+' OR m.label = '-')
SELECT T1.element AS toxicology_element, COUNT(*) AS tally FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND SUBSTR(T1.atom_id, 7, 1) = '4' GROUP BY T1.element;
SELECT T1.label ,  SUM(CASE WHEN T2.element = 'h' THEN 1 ELSE 0 END) * 1.0 / COUNT(T2.atom_id) AS ratio FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'
SELECT molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'ca' AND molecule.label = '+' GROUP BY molecule.label
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id OR T1.atom_id = T3.atom_id2 JOIN bond AS T2 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' GROUP BY T2.bond_type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_10_11' UNION SELECT T4.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T4.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_10_11' AND NOT T4.atom_id IN (SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_10_11')
SELECT CAST(SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM bond;
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) FROM bond WHERE molecule_id = 'TR047'
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_1'
SELECT label FROM molecule WHERE molecule_id = 'TR151'
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR151'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c';
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT T1.bond_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.label  =  '+' AND T1.bond_type  =  ' ='
SELECT COUNT(*) FROM atom WHERE element = 'h' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT T3.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T1.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2'
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND molecule.label = '-'
SELECT CAST(COUNT(CASE WHEN T2.element = 'h' AND T1.label = '+' THEN T1.molecule_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT label FROM molecule WHERE molecule_id = 'TR124'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'
SELECT COUNT(*), m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND b.molecule_id = 'TR006' GROUP BY m.label;
SELECT molecule.molecule_id, atom.element  FROM molecule  JOIN atom ON molecule.molecule_id = atom.molecule_id  WHERE molecule.label = '+'
SELECT T2.bond_id, T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-'
SELECT T1.molecule_id, GROUP_CONCAT(T2.element) as elements  FROM bond AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.bond_type = '#'  GROUP BY T1.molecule_id;
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*)  FROM connected c  JOIN atom a ON c.atom_id = a.atom_id  WHERE a.element = 'cl'
SELECT T1.atom_id ,  COUNT(DISTINCT T2.bond_type) FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id
SELECT COUNT(T1.molecule_id) AS total_molecules_with_double_bond,         (SELECT COUNT(T1.molecule_id)          FROM bond AS T1          JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id          WHERE T1.bond_type = '=' AND T2.label = '+') AS carcinogenic_molecules FROM bond AS T1 WHERE T1.bond_type = '=';
SELECT COUNT(DISTINCT molecule_id)  FROM atom  WHERE element != 's'  AND molecule_id NOT IN (SELECT molecule_id FROM bond WHERE bond_type = '=')
SELECT T3.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'cl' AND T2.label  =  '+'
SELECT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'c' AND T2.label  =  '-'
SELECT CAST(COUNT(CASE WHEN T2.label = '+' AND T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T2.molecule_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_1_7' GROUP BY T2.molecule_id
SELECT COUNT(DISTINCT T1.element)  FROM atom AS T1  JOIN connected AS T2  ON T1.atom_id  =  T2.atom_id  WHERE T2.bond_id  =  'TR001_3_4'
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) * 100 / COUNT(bond_id) AS percentage FROM bond;
SELECT COUNT(*)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'n' ;
SELECT T1.molecule_id FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 's' AND T2.bond_type = '=' GROUP BY T1.molecule_id HAVING COUNT(*) > 0
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5
SELECT T1.element FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' AND T1.molecule_id = 'TR024' GROUP BY T1.element;
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h' AND T2.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(*) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.bond_type = '=' AND T3.element = 'o'
SELECT COUNT(*) FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '-'
SELECT T3.element, T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id OR T2.atom_id2 = T3.atom_id WHERE T3.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.bond_type = '=' AND T1.molecule_id = 'TR012'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT * FROM cards WHERE borderColor = 'borderless' AND cardKingdomId NOT IN (SELECT cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL)
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)
SELECT * FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015'
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator'
SELECT L.status FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE C.types = 'Artifact' AND C.side IS NULL AND L.format = 'vintage'
SELECT c.id, c.artist  FROM cards AS c  JOIN legalities AS l ON c.uuid = l.uuid  WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'
SELECT c.id, r.text AS ruling_text, c.hasContentWarning  FROM rulings r  JOIN cards c ON r.uuid = c.uuid  WHERE c.artist = 'Stephen Daniele';
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT C.name, C.artist, C.isPromo  FROM cards AS C  JOIN rulings AS R ON C.uuid = R.uuid  GROUP BY C.uuid  ORDER BY COUNT(R.uuid) DESC  LIMIT 1;
SELECT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'
SELECT (COUNT(CASE WHEN T2.language = 'Chinese Simplified' THEN T1.id END) * 100.0 / COUNT(T1.id)) AS percentage FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid;
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy' ;
SELECT COUNT(*) FROM cards WHERE power = '∞' OR power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT originalType FROM cards WHERE name = 'Ancestor\'s Chosen'
SELECT T2.language FROM cards AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.id WHERE T1.name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.isTextless = 0 AND l.status = 'Restricted'
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Condemn'
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.isStarter = 1 AND l.status = 'Restricted'
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian'
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards;
SELECT COUNT(*) FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'German' AND cards.isReprint = 1;
SELECT COUNT(*) FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'Russian' AND cards.borderColor = 'borderless'
SELECT (COUNT(CASE WHEN T2.language = 'French' THEN T1.id END) * 100.0 / COUNT(CASE WHEN T1.isStorySpotlight = 1 THEN T1.id END)) AS percentage FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1;
SELECT COUNT(*) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT layout FROM cards WHERE keywords = 'Flying' OR keywords LIKE '%,Flying' OR keywords LIKE 'Flying,%' OR keywords LIKE '%,Flying,';
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel';
SELECT cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a' ;
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Chinese Simplified'
SELECT c.name FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.availability = 'paper' AND fd.language = 'Japanese'
SELECT COUNT(*) FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white'
SELECT T1.uuid, T3.language FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'legacy'
SELECT rulings.text FROM rulings JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Beacon of Immortality'
SELECT COUNT(*) ,  T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'Legal' GROUP BY T2.status
SELECT T1.colors FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode  =  T2.setCode WHERE T2.setCode  =  'OGW'
SELECT T2.language FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.convertedManaCost = 5 AND T1.setCode = '10E'
SELECT T1.originalType, T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT T1.colors, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20
SELECT c.name FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.originalType LIKE '%Artifact%' AND c.colors LIKE '%B%'
SELECT T1.name FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND type = 'mtgo' AND hand = -1;
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'
SELECT SUM(CAST(REPLACE(manaCost, '{', '') AS INT)) FROM cards WHERE artist = 'Rob Alexander' AND manaCost IS NOT NULL
SELECT DISTINCT supertypes, subtypes  FROM cards  WHERE availability = 'arena'
SELECT setCode FROM set_translations WHERE language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(id) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN c.isStoryHighlight = TRUE AND c.isTextless = FALSE THEN 1 ELSE 0 END) AS REAL) / COUNT(c.id) * 100 AS percentage, c.id FROM cards AS c WHERE c.isStoryHighlight = TRUE AND c.isTextless = FALSE GROUP BY c.id
SELECT      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM foreign_data)) AS percentage,     name FROM      foreign_data WHERE      language = 'Spanish' GROUP BY      name;
SELECT T1.language FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode  =  T2.code WHERE T2.baseSetSize  =  309
SELECT COUNT(*) FROM set_translations WHERE language = 'Portuguese (Brasil)' AND setCode IN (SELECT code FROM sets WHERE block = 'Commander')
SELECT T1.id FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Creature' AND T2.status = 'Legal'
SELECT T1.supertypes, T1.subtypes  FROM cards AS T1  JOIN foreign_data AS T2  ON T1.uuid = T2.uuid  WHERE T2.language = 'German'  AND T1.supertypes IS NOT NULL  AND T1.subtypes IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'premodern') AND rulings_text LIKE '%This is a triggered mana ability.%' AND side IS NULL;
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND c.availability = 'paper' AND l.format = 'pauper'
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.flavorText = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT fd.name  FROM foreign_data AS fd  JOIN cards AS c ON fd.uuid = c.uuid  WHERE fd.language = 'French'  AND c.types = 'Creature'  AND c.layout = 'normal'  AND c.borderColor = 'black'  AND c.artist = 'Matthew D. Wilson'
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.card_uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'
SELECT CAST(SUM(CASE WHEN c.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id)  FROM cards c  JOIN legalities l ON c.uuid = l.uuid  WHERE l.format = 'commander' AND l.status = 'Legal';
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'
SELECT CAST(SUM(CASE WHEN T2.language = 'Japanese' AND T1.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'
SELECT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3;
SELECT language FROM foreign_data WHERE multiverseid = 149934;
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3;
SELECT (COUNT(*) FILTER (WHERE isTextless = 1 AND layout = 'normal')) * 100.0 / COUNT(*) AS proportion FROM cards WHERE layout = 'normal';
SELECT id FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;
SELECT T1.language FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode  =  T2.code WHERE T2.mcmName  =  'Archenemy' AND T2.code  =  'ARC'
SELECT s.name, st.translation  FROM sets s  JOIN set_translations st ON s.code = st.setCode  WHERE s.id = 5;
SELECT T1.language, T2.type FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.id = 206
SELECT s.id, s.name FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2
SELECT s.id FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.isForeignOnly = 0 AND s.isFoilOnly = 1 AND st.language = 'Japanese'
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT (COUNT(T2.isOnlineOnly) FILTER (WHERE T2.isOnlineOnly = 1 AND T1.language = 'Chinese Simplified')) * 100 / COUNT(T2.isOnlineOnly) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.isOnlineOnly = 1;
SELECT COUNT(*) FROM set_translations WHERE language = 'Japanese' AND mtgoCode IS NULL OR mtgoCode = ''
SELECT COUNT(*), id FROM cards WHERE borderColor = 'black' GROUP BY id HAVING COUNT(*) > 0;   -- Note: The above query will return the count of all cards with a black border and list out their ids. However, to just get the number of cards with a black border without listing individual IDs, you would use SELECT COUNT(*) FROM cards WHERE borderColor = 'black';
SELECT COUNT(*) ,  id FROM cards WHERE frameEffects = 'extendedart'
SELECT id FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT language FROM set_translations WHERE id = 174;
SELECT name FROM sets WHERE code = 'ALL'
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'
SELECT T1.setCode FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.releaseDate = '2007-07-13'
SELECT T1.baseSetSize, T2.setCode FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block IN ('Masques', 'Mirage')
SELECT T1.setCode FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'expansion'
SELECT T1.name, T1.type FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark LIKE 'boros'
SELECT T2.language, T1.flavorText  FROM cards AS T1  JOIN foreign_data AS T2 ON T1.uuid = T2.uuid  WHERE T1.watermark = 'colorpie'
;
SELECT T1.setCode FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.type = 'commander'
SELECT T1.name, T1.type FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark LIKE 'abzan'
SELECT T2.language, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark LIKE '%azorius%'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'
SELECT name FROM cards WHERE isTextless = 0;
SELECT manaCost FROM cards WHERE name = 'Ancestor\'s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT supertypes, subtypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT purchaseUrls FROM cards WHERE promoTypes LIKE '%bundle%'
SELECT COUNT(*)  FROM cards  WHERE `availability` LIKE '%arena,mtgo%' AND border_color = 'black'
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T2.translation FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Italian' AND T1.name = 'Ancestor''s Chosen'
SELECT COUNT(*) FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy')
SELECT T1.name FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode  =  T2.setCode WHERE T2.translation  =  'Hauptset Zehnte Edition'
SELECT EXISTS (SELECT * FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Ancestor''s Chosen') AND language = 'Korean') AS "korean_version_exists"
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex'
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT T1.name FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Angel of Mercy' AND T1.mtgoCode IS NOT NULL;
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode  =  T2.code WHERE T1.name  =  'Ancestor's Chosen'
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM set_translations WHERE language = 'Italian' AND translation IS NOT NULL AND setCode IN (SELECT code FROM sets WHERE block = 'Ice Age')
SELECT T2.isForeignOnly FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'
SELECT COUNT(*) FROM sets WHERE language = 'Italian' AND baseSetSize < 100 AND translation IS NOT NULL
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black'
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1;
SELECT T1.artist FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.number = '4'
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
