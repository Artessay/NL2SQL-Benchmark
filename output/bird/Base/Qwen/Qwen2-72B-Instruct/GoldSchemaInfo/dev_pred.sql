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
SELECT T2.flavorText FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T1.flavorText IS NOT NULL GROUP BY T2.language
SELECT T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'
SELECT T3.text FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Italian' AND T1.setCode IN (SELECT code FROM sets WHERE name = 'Coldsnap')
SELECT T3.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T2.name = 'Coldsnap' AND T3.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T1.date FROM rulings AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Reminisce'
SELECT CAST(COUNT(*) FILTER (WHERE T2.convertedManacost = 7) AS REAL) * 100 / COUNT(T2.id) FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap'
SELECT CAST(COUNT(CASE WHEN T2.cardKingdomFoilId IS NOT NULL AND T2.cardKingdomId IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.id) FROM sets AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name = 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT T2.text AS RulingText, T1.hasContentWarning  FROM cards AS T1  JOIN rulings AS T2  ON T1.uuid = T2.uuid  WHERE T1.artist = 'Jim Pavelec'
SELECT T1.releaseDate FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Evacuation'
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Rinascita di Alara'
SELECT T1.type FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'
SELECT T2.translation FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'French' AND T1.name = 'Tendo Ice Bridge'
SELECT COUNT(*) FROM sets WHERE name = 'Tenth Edition' AND translation IS NOT NULL
SELECT T2.translation FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode  =  T2.setCode WHERE T2.language  =  'Japanese' AND T1.name  =  'Fellwar Stone'
SELECT T2.name FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Journey into Nyx Hero''s Path' ORDER BY T2.convertedManaCost DESC LIMIT 1
SELECT T1.releaseDate FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'
SELECT T1.type FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T2.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards c JOIN sets s ON c.setCode = s.code WHERE s.name = 'World Championship Decks 2004' AND c.convertedManaCost = 3.0;
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code  =  T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language  =  'Chinese Simplified'
SELECT CAST(SUM(CASE WHEN T2.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese'
SELECT CAST(COUNT(CASE WHEN s.isOnlineOnly = 1 THEN st.id END) AS REAL) * 100 / COUNT(st.id) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Portuguese (Brazil)'
SELECT T1.availability FROM cards AS T1 WHERE T1.artist = 'Aleksi Briclot' AND T1.isTextless = 1
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT T1.frameEffects FROM cards AS T1 WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL GROUP BY T1.frameEffects ORDER BY COUNT(T1.frameEffects) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IN (NULL, '*') AND hasFoil = 0 AND duelDeck = 'a'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;
SELECT c.name, c.manaCost FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY    CASE c.manaCost      WHEN '{W}' THEN 1     WHEN '{U}' THEN 2     WHEN '{B}' THEN 3     WHEN '{R}' THEN 4     WHEN '{G}' THEN 5     ELSE CAST(SUBSTRING(c.manaCost, 2, LENGTH(c.manaCost) - 3) AS INTEGER)   END DESC LIMIT 10;
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French'
SELECT COUNT(*) FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal' GROUP BY c.id HAVING COUNT(*) > 0;
SELECT T2.format, T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' GROUP BY T2.format ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.id = T2.id WHERE T1.name = 'Battlebond'
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = (SELECT artist FROM cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1)
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '1997' AND T1.artist = 'D. Alexander Gregory' AND T1.hasContentWarning = 1 AND T2.format = 'legacy'
SELECT C.name, L.format FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.edhrecRank = 1 AND L.status = 'Banned'
SELECT AVG(T1.id), T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.id = T2.id WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT artist FROM cards WHERE availability = 'arena' AND borderColor = 'black'
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('Restricted', 'Banned')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC
SELECT C.name, L.format  FROM cards AS C  JOIN sets AS S ON C.setCode = S.code  JOIN legalities AS L ON C.uuid = L.uuid  WHERE S.name = 'Hour of Devastation' AND L.status = 'Legal'
SELECT s.name FROM sets s WHERE EXISTS (SELECT * FROM set_translations st WHERE st.setCode = s.code AND st.language = 'Korean') AND NOT EXISTS (SELECT * FROM set_translations st WHERE st.setCode = s.code AND st.language LIKE '%Japanese%')
SELECT L.status, C.frameVersion, C.name FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.artist = 'Allen Williams' AND L.status = 'Banned'
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;
SELECT DisplayName FROM Users WHERE YEAR(CreationDate) = 2011;
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1;
SELECT COUNT(*) FROM users WHERE Views > 10 AND YEAR(CreationDate) > 2013;
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT T1.Title FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT T1.Title FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY T1.ViewCount DESC LIMIT 1
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT SUM(T1.CommentCount) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT MAX(T1.AnswerCount) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT U.DisplayName  FROM users U  JOIN posts P ON U.Id = P.LastEditorUserId  WHERE P.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie' AND posts.ParentId IS NULL
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20;
SELECT T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT p.Body FROM posts AS p JOIN tags AS t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'bayesian'
SELECT T2.Body FROM tags AS T1 JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.Count = (SELECT MAX(Count) FROM tags)
SELECT COUNT(*) FROM users JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'csgillespie'
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie' AND YEAR(badges.Date) = 2011;
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT AVG(T1.Score) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT AVG(T1.Id) AS AverageBadges FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Views > 200 GROUP BY T2.DisplayName
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival';
SELECT T2.Title FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score = (SELECT MAX(Score) FROM comments)
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE ViewCount = 1910)
SELECT T2.FavoriteCount FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate = '2014-04-23 20:29:39.0' AND T1.UserId = '3025'
SELECT T1.Text FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ParentId = 107829 AND T2.CommentCount = 1 
SELECT CASE WHEN T2.ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS Result FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 23853 AND T1.CreationDate = '2013-07-12 09:08:18.0'
SELECT T2.Reputation FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 65041;
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini')
SELECT T2.DisplayName FROM votes AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(T2.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.OwnerUserId = T2.UserId WHERE T1.OwnerUserId = 24 AND T2.UserId = 24;
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17;
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'SilentGhost'
SELECT U.DisplayName FROM users AS U JOIN comments AS C ON U.Id = C.UserId WHERE C.Text = 'thank you user93!'
SELECT T1.Text FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'A Lion'
SELECT T2.DisplayName, T2.Reputation FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Understanding what Dassault iSight is doing?'
SELECT T1.Text FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'
SELECT p.Title  FROM posts AS p  JOIN users AS u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'Vebjorn Ljosa' AND p.LastEditorUserId = u.Id;
SELECT SUM(p.Score), u.WebsiteUrl FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.LastEditorUserId IN (SELECT Id FROM users WHERE DisplayName = 'Yevgeny') GROUP BY u.WebsiteUrl;
SELECT ph.Comment FROM postHistory AS ph JOIN posts AS p ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' 
SELECT SUM(v.BountyAmount)  FROM votes AS v  JOIN posts AS p ON v.PostId = p.Id  WHERE p.Title LIKE '%data%'
SELECT T3.DisplayName FROM votes AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.BountyAmount = 50 AND T2.Title LIKE '%variance%'
SELECT T1.Title, T2.Text, AVG(T1.ViewCount) AS AverageViewCount FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Tags LIKE '%<humor>%' GROUP BY T1.Title, T2.Text
SELECT COUNT(*) FROM comments WHERE UserId = 13;
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT Id FROM users WHERE Views = (SELECT MIN(Views) FROM users)
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND YEAR(Date) = 2011
SELECT COUNT(*)  FROM (     SELECT UserId     FROM badges     GROUP BY UserId     HAVING COUNT(Name) > 5 ) AS users_with_more_than_5_badges;
SELECT COUNT(*) FROM users u JOIN badges b1 ON u.Id = b1.UserId JOIN badges b2 ON u.Id = b2.UserId WHERE u.Location = 'New York' AND b1.Name = 'Teacher' AND b2.Name = 'Supporter'
SELECT T2.UserId, T3.Reputation FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id JOIN users AS T3 ON T1.UserId = T3.Id WHERE T2.Id = 1;
SELECT U.Id AS UserID FROM users U JOIN postHistory PH ON U.Id = PH.UserId JOIN posts P ON PH.PostId = P.Id WHERE P.ViewCount >= 1000 GROUP BY U.Id HAVING COUNT(DISTINCT PH.PostId) = (SELECT COUNT(*) FROM postHistory WHERE UserId = U.Id)
SELECT U.UserId, B.Name  FROM (     SELECT UserId, COUNT(Id) AS CommentCount      FROM comments      GROUP BY UserId ) AS U JOIN badges AS B ON U.UserId = B.UserId WHERE U.CommentCount = (     SELECT MAX(CommentCount)      FROM (         SELECT UserId, COUNT(Id) AS CommentCount          FROM comments          GROUP BY UserId     ) ) 
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Teacher' AND users.Location LIKE '%India%'
SELECT ((SELECT COUNT(*) FROM badges WHERE Name = 'Student' AND YEAR(Date) = 2010) / (SELECT COUNT(*) FROM badges WHERE Name = 'Student') * 100 -  (SELECT COUNT(*) FROM badges WHERE Name = 'Student' AND YEAR(Date) = 2011) / (SELECT COUNT(*) FROM badges WHERE Name = 'Student') * 100) AS PercentageDifference;
SELECT PH.PostHistoryTypeId, COUNT(DISTINCT C.UserId) AS UniqueCommenters FROM postHistory AS PH LEFT JOIN comments AS C ON PH.PostId = C.PostId WHERE PH.PostId = 3720 GROUP BY PH.PostHistoryTypeId;
SELECT T1.Id, T1.ViewCount FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T2.RelatedPostId = 61217
SELECT T2.Score, T1.LinkTypeId FROM postLinks AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.PostId = 395;
SELECT p.Id AS PostID, ph.UserId AS UserID FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Score > 60;
SELECT SUM(T2.FavoriteCount) FROM postHistory AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 686 AND YEAR(T1.CreationDate) = 2011
SELECT AVG(T2.UpVotes), AVG(CASE WHEN T3.Age IS NOT NULL THEN T3.Age ELSE 0 END) FROM (     SELECT OwnerUserId, COUNT(OwnerUserId) as PostCount      FROM posts      GROUP BY OwnerUserId     ) AS T1  JOIN users AS T2 ON T1.OwnerUserId = T2.Id  LEFT JOIN (     SELECT Id, Age      FROM users      WHERE Age IS NOT NULL     ) AS T3 ON T1.OwnerUserId = T3.Id  WHERE T1.PostCount > 10
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE score > 60 
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10;
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.Reputation = (SELECT MAX(Reputation) FROM Users) GROUP BY B.Name
SELECT T2.Reputation FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'
SELECT T2.Date FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'
SELECT CAST(COUNT(CASE WHEN b.Name = 'Teacher' THEN b.UserId END) AS REAL) / COUNT(b.UserId) * 100 FROM badges AS b JOIN users AS u ON b.UserId = u.Id
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Id) FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'
SELECT T1.Score FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate = '2010-07-19 19:19:56.0'
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate = '2010-07-19 19:37:33.0' 
SELECT T2.Age FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'Vienna, Austria'
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;
SELECT T2.Views FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = (SELECT MIN(Reputation) FROM users)
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Sharpie'
SELECT COUNT(*) FROM badges b JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York, NY' ;
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) FROM votes;
SELECT T2.TagName FROM Posts AS T1 JOIN PostTags AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerDisplayName = 'John Salvatier' GROUP BY T2.TagName
SELECT COUNT(*)  FROM postHistory  JOIN users ON postHistory.UserId = users.Id  WHERE users.DisplayName = 'Daniel Vassallo';
SELECT COUNT(*) FROM votes WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'Harlan')
SELECT T2.PostId FROM users AS T1 JOIN postHistory AS T2 ON T1.Id = T2.UserId JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T1.DisplayName = 'slashnick' ORDER BY T3.AnswerCount DESC LIMIT 1
SELECT T1.DisplayName, MAX(T2.ViewCount) AS MaxViewCount FROM users AS T1 JOIN postHistory AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY T1.DisplayName ORDER BY MaxViewCount DESC LIMIT 1;
SELECT COUNT(*) FROM posts AS T1 JOIN votes AS T2 ON T1.Id = T2.PostId JOIN users AS T3 ON T3.Id = T1.UserId WHERE T3.DisplayName = 'Matt Parker' GROUP BY T1.Id HAVING COUNT(T2.Id) > 4;
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Neil McGuigan' AND comments.Score < 60;
SELECT T2.Tags FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Mark Meckes' AND T2.CommentCount = 0 
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T1.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.PostId) FROM tags AS T1 INNER JOIN postHistory AS T2 ON T1.ExcerptPostId = T2.PostId INNER JOIN users AS T3 ON T2.UserId = T3.Id WHERE T3.DisplayName = 'Community';
SELECT (SUM(CASE WHEN T1.DisplayName = 'Mornington' THEN T2.ViewCount ELSE 0 END) - SUM(CASE WHEN T1.DisplayName = 'Amos' THEN T2.ViewCount ELSE 0 END)) AS ViewDifference FROM Users AS T1 INNER JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId;
SELECT COUNT(*) FROM badges WHERE Name = 'Commentator' AND YEAR(Date) = 2014;
SELECT COUNT(*) FROM postHistory WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT DisplayName , Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;
SELECT T2.Title, T1.UserDisplayName FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score > 60;
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE YEAR(b.Date) = 2011 AND u.Location = 'North Pole'
SELECT U.DisplayName, U.WebsiteUrl  FROM users AS U  JOIN posts AS P ON U.Id = P.OwnerUserId  WHERE P.FavoriteCount > 150;
SELECT COUNT(ph.Id) AS PostHistoryCount, p.LastEditDate FROM posts p JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY p.LastEditDate
SELECT T2.LastAccessDate, T2.Location FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Outliers'
SELECT T2.Title FROM postLinks AS T1 JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title = 'How to tell if something happened in a data set which monitors a value over time'
SELECT postHistory.PostId, badges.Name  FROM postHistory  JOIN users ON postHistory.UserId = users.Id  JOIN badges ON users.Id = badges.UserId  WHERE users.UserDisplayName = 'Samuel'  AND YEAR(postHistory.CreationDate) = 2013  AND YEAR(badges.Date) = 2013;
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount = (SELECT MAX(ViewCount) FROM posts)
SELECT T3.DisplayName, T3.Location FROM tags AS T1 JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T1.TagName = 'hypothesis-testing'
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title = 'What are principal component scores?'
SELECT T3.DisplayName FROM posts AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.ParentId INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T1.ParentId IS NOT NULL ORDER BY T1.Score DESC LIMIT 1;
SELECT U.DisplayName, U.WebsiteUrl FROM votes AS V JOIN users AS U ON V.UserId = U.Id WHERE V.VoteTypeId = 8 ORDER BY V.BountyAmount DESC LIMIT 1;
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2011 AND BountyAmount = 50;
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users WHERE Age IS NOT NULL AND Age >= 13)
SELECT SUM(Reputation) FROM Users WHERE LastAccessDate LIKE '2010-07-19%'
SELECT AVG(T1.CreationDate) AS AverageMonthlyLinks FROM postLinks AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE YEAR(T1.CreationDate) = 2010 AND T2.AnswerCount <= 2 GROUP BY MONTH(T1.CreationDate)
SELECT T2.Id FROM votes AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 1465 ORDER BY T2.FavoriteCount DESC LIMIT 1;
SELECT T1.Title FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T1.CreationDate = (SELECT MIN(CreationDate) FROM posts WHERE Id IN (SELECT PostId FROM postLinks))
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(*) DESC LIMIT 1
SELECT MIN(Votes.CreationDate) FROM Votes JOIN Users ON Votes.UserId = Users.Id WHERE Users.DisplayName = 'chl'
SELECT T1.CreationDate FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM users) ORDER BY T1.CreationDate ASC LIMIT 1
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date ASC LIMIT 1;
SELECT COUNT(*) FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE users.Location = 'United Kingdom' AND posts.FavoriteCount >= 4;
SELECT AVG(T1.PostId)  FROM votes AS T1  JOIN (   SELECT UserId    FROM votes    JOIN users ON votes.UserId = users.Id    WHERE users.Age = (     SELECT MAX(Age)      FROM users   ) ) AS T2 ON T1.UserId = T2.UserId
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND YEAR(CreationDate) = 2010;
SELECT T1.Id, T1.Title FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky' ORDER BY T1.ViewCount DESC LIMIT 1;
SELECT T1.Id, T1.Title FROM posts AS T1 WHERE T1.Score = (SELECT MAX(T2.Score) FROM posts AS T2)
SELECT AVG(T1.Score) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount > 20000 AND YEAR(T1.CreationDate) = 2011;
SELECT p.Id, u.DisplayName  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE YEAR(u.CreationDate) = 2010  ORDER BY p.FavoriteCount DESC  LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE YEAR(T1.CreationDate) = 2011;
SELECT (COUNT(Id) FILTER (WHERE Age BETWEEN 13 AND 18))/COUNT(Id)*100 AS Percentage FROM users;
SELECT SUM(T2.ViewCount), T3.DisplayName FROM postHistory AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id JOIN users AS T3 ON T2.LastEditorUserId = T3.Id WHERE T1.Text = 'Computer Game Datasets' GROUP BY T3.DisplayName ORDER BY SUM(T2.ViewCount) DESC LIMIT 1;
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1)
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT T2.DisplayName, T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 183 ORDER BY T1.LastEditDate DESC LIMIT 1
SELECT b.Name  FROM badges b  JOIN users u ON b.UserId = u.Id  WHERE u.DisplayName = 'Emmett'  ORDER BY b.Date DESC  LIMIT 1;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT TIMESTAMPDIFF(DAY, u.CreationDate, b.Date) AS Days FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Zolomon' LIMIT 1;
SELECT COUNT(p.Id) AS NumPosts, COUNT(c.Id) AS NumComments  FROM posts p  LEFT JOIN comments c ON p.Id = c.PostId  WHERE p.OwnerUserId = (     SELECT u.Id      FROM users u      WHERE u.CreationDate = (         SELECT MAX(CreationDate)          FROM users     ) )
SELECT C.Text, U.DisplayName FROM Comments AS C JOIN Users AS U ON C.UserId = U.Id WHERE C.PostId IN (SELECT Id FROM Posts WHERE Title = 'Analysing wind data with R') ORDER BY C.CreationDate DESC LIMIT 10;
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(*) FROM tags WHERE TagName = 'careers';
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT AnswerCount, CommentCount FROM posts WHERE Title = 'Clustering 1D data'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat' ;
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Reputation = (SELECT MAX(Reputation) FROM users);
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT T2.Reputation, T2.UpVotes FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'fine, you win :)'
SELECT T1.Text FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%linear regression%'
SELECT T2.Text FROM posts AS T1 JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount BETWEEN 100 AND 150 ORDER BY T2.Score DESC LIMIT 1;
SELECT T1.CreationDate ,  T2.Age FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Comment LIKE '%http://%'
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score = 0 AND posts.ViewCount < 5;
SELECT COUNT(*) FROM comments  JOIN posts ON comments.PostId = posts.Id  WHERE comments.Score = 0 AND posts.CommentCount = 1;
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE comments.Score = 0 AND users.Age = 40;
SELECT T1.Id AS PostId, T2.Text AS CommentText FROM posts AS T1 JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item'
SELECT T2.UpVotes FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'R is also lazy evaluated.'
SELECT c.Text FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky'
SELECT T2.DisplayName FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.UserId) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength')
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON sp.id = hp.power_id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;
SELECT T2.full_name FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T2.full_name HAVING COUNT(*) > 15
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE s.eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') AND sp.power_name = 'Agility'
SELECT T2.superhero_name FROM `colour` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.eye_colour_id OR T1.id = T2.hair_colour_id WHERE T1.colour = 'Blue' AND T1.id = T2.eye_colour_id AND T1.colour = 'Blond' AND T1.id = T2.hair_colour_id
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT c.colour_name, COUNT(s.id) AS superhero_count FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour_name ORDER BY superhero_count DESC;
SELECT AVG(T2.height_cm) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics' AND T2.height_cm > 0;
SELECT superhero.superhero_name FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power ON power.id = superhero_power.power_id WHERE power.power_name = 'Super Strength' AND superhero.publisher_id IN (SELECT publisher.id FROM publisher WHERE publisher.publisher_name = 'Marvel Comics')
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics'
SELECT T3.publisher_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T4 ON T1.hero_id = T4.id JOIN publisher AS T3 ON T4.publisher_id = T3.id WHERE T2.attribute_name = 'Speed' ORDER BY T1.attribute_value ASC LIMIT 1
SELECT COUNT(*) FROM superhero  JOIN colour ON superhero.eye_colour_id = colour.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';
SELECT T3.superhero_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Intelligence' ORDER BY T1.attribute_value ASC LIMIT 1
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.superhero_id WHERE T2.power_name = 'Durability' AND T2.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE s.gender_id IN (SELECT id FROM gender WHERE gender = 'Female') AND a.attribute_name = 'Strength' AND ha.attribute_value = 100;
SELECT T2.superhero_name FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T2.superhero_name ORDER BY COUNT(T1.hero_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire'
SELECT COUNT(T1.id) AS num_superheroes, (COUNT(T1.id) * 100 / (SELECT COUNT(*) FROM superhero)) AS percentage  FROM superhero AS T1  JOIN alignment AS T2 ON T1.alignment_id = T2.id  JOIN publisher AS T3 ON T1.publisher_id = T3.id  WHERE T2.alignment = 'Bad' AND T3.publisher_name = 'Marvel Comics';
SELECT    (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) -    (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference;
SELECT id FROM publisher WHERE publisher_name = 'Star Trek' ;
SELECT AVG(attribute_value) FROM hero_attribute
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(T2.weight_kg) FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id WHERE T1.gender = 'Female' AND T2.weight_kg != 0;
SELECT T3.power_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN hero_power AS T4 ON T1.id = T4.hero_id JOIN superpower AS T3 ON T4.power_id = T3.id WHERE T2.gender = 'Male' LIMIT 5
SELECT T2.superhero_name FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Alien'
SELECT T2.superhero_name FROM `colour` AS T1 JOIN `superhero` AS T2 ON T2.eye_colour_id = T1.id WHERE T1.colour = 'No Colour' AND T2.height_cm BETWEEN 170 AND 190
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT T2.full_name FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Demi-God' LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment = 'Bad')
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169;
SELECT T3.colour FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.race = 'human' AND T1.height_cm = 185
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = (SELECT MAX(weight_kg) FROM superhero)
SELECT CAST(COUNT(CASE WHEN p.publisher_name = 'Marvel Comics' THEN sh.id END) AS REAL) * 100 / COUNT(sh.id) FROM superhero sh JOIN publisher p ON sh.publisher_id = p.id WHERE sh.height_cm BETWEEN 150 AND 180
SELECT T1.superhero_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1
SELECT COUNT(*) FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Stealth')
SELECT T3.full_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Strength' ORDER BY T1.attribute_value DESC LIMIT 1;
SELECT AVG(T2.skin_colour_id) FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.skin_colour_id WHERE T1.colour = 'No Colour'
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics'
SELECT T3.superhero_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id JOIN publisher AS T4 ON T3.publisher_id = T4.id WHERE T2.attribute_name = 'Durability' AND T4.publisher_name = 'Dark Horse Comics' ORDER BY T1.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id  FROM superhero AS T1  JOIN gender AS T2 ON T1.gender_id = T2.id  JOIN publisher AS T3 ON T1.publisher_id = T3.id  WHERE T2.gender = 'Female' AND T3.publisher_name = 'Dark Horse Comics';
SELECT T2.superhero_name, T1.publisher_name FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T2.eye_colour_id = T2.hair_colour_id AND T2.hair_colour_id = T2.skin_colour_id;
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN T3.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.gender_id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.gender = 'Female'
SELECT T2.superhero_name, T1.race FROM race AS T1 JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T2.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(*)  FROM hero_power hp  JOIN superhero s ON hp.hero_id = s.id  WHERE s.superhero_name = 'Amazo';
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id AND T1.hair_colour_id = T2.id WHERE T2.colour = 'Black'
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.skin_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold')
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'
SELECT T1.superhero_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*)  FROM hero_attribute ha1  WHERE ha1.attribute_value = (     SELECT MAX(ha2.attribute_value)     FROM hero_attribute ha2     JOIN attribute a2 ON ha2.attribute_id = a2.id     WHERE a2.attribute_name = 'Strength' ) AND ha1.attribute_id IN (     SELECT id      FROM attribute      WHERE attribute_name = 'Strength' );
SELECT T2.race, T3.alignment FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics';
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien' AND T1.weight_kg != 0;
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;
SELECT AVG(height_cm) FROM superhero WHERE height_cm != 0;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;
SELECT T3.superhero_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Speed' ORDER BY T1.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT T3.attribute_name, T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T1.superhero_name = '3-D Man'
SELECT s.superhero_name FROM superhero s JOIN colour c1 ON s.eye_colour_id = c1.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Brown'
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') GROUP BY T2.publisher_name HAVING COUNT(*) = 3
SELECT COUNT(*) FROM superhero WHERE publisher_id NOT IN (SELECT id FROM publisher) OR publisher_id = 1;
SELECT CAST(COUNT(CASE WHEN T2.colour = 'Blue' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.id = 7;
SELECT CAST(COUNT(CASE WHEN T2.gender = 'Male' THEN T1.id ELSE NULL END) AS REAL) / COUNT(CASE WHEN T2.gender = 'Female' THEN T1.id ELSE NULL END) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero WHERE height_cm > 0);
SELECT id FROM superpower WHERE power_name = 'cryokinesis' ;
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188;
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38;
SELECT T2.race FROM hero_attribute AS T1 JOIN superhero AS T3 ON T1.hero_id = T3.id JOIN race AS T2 ON T3.race_id = T2.id WHERE T1.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Atom IV'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5;
SELECT AVG(T2.attribute_value) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3;
SELECT T3.colour FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN colour AS T3 ON T2.skin_colour_id = T3.id WHERE T1.attribute_value = 100
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;
SELECT T2.superhero_name FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_value BETWEEN 75 AND 80
SELECT T3.race FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN race AS T3 ON T1.race_id = T3.id JOIN colour AS T4 ON T1.hair_colour_id = T4.id WHERE T2.gender = 'Male' AND T4.colour = 'Blue'
SELECT CAST(SUM(CASE WHEN T2.gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.alignment_id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.alignment_id = 2;
SELECT (SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.id = 7 AND (T1.weight_kg = 0 OR T1.weight_kg IS NULL)) - (SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.id = 1 AND (T1.weight_kg = 0 OR T1.weight_kg IS NULL))
SELECT T3.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';
SELECT COUNT(*) FROM superhero  JOIN gender ON superhero.gender_id = gender.id  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Marvel Comics';
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC;
SELECT T3.gender FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id JOIN superhero AS T4 ON T1.hero_id = T4.id JOIN gender AS T3 ON T4.gender_id = T3.id WHERE T2.power_name = 'Phoenix Force'
SELECT T1.superhero_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' AND T1.weight_kg != 0 ORDER BY T1.weight_kg DESC LIMIT 1;
SELECT AVG(T1.height_cm) FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id JOIN `publisher` AS T3 ON T1.publisher_id = T3.id WHERE T2.race != 'Human' AND T3.publisher_name = 'Dark Horse Comics'
SELECT COUNT(*)  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_id = a.id  WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;
SELECT T2.attribute_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T1.attribute_value ASC LIMIT 1
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero WHERE height_cm > 0);
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler' ;
SELECT CAST(COUNT(CASE WHEN T3.gender = 'Female' THEN T2.id ELSE NULL END) AS REAL) * 100 / COUNT(T2.id) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN gender AS T3 ON T3.id = T2.gender_id WHERE T1.publisher_name = 'George Lucas'
SELECT CAST(COUNT(CASE WHEN T3.alignment = 'Good' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.publisher_name = 'Marvel Comics';
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT T2.full_name FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T1.colour = 'Brown' AND T2.weight_kg < 100;
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy'
SELECT T1.weight_kg, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral' AND T1.height_cm != 0;
SELECT T1.hero_id FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT T2.driverref FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 20 ORDER BY T2.q1 DESC LIMIT 5
SELECT T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 19 ORDER BY T2.q2 LIMIT 1
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai'
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Germany'
SELECT T2.position FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = 'Renault'
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T2.country NOT IN ('Asia', 'Europe')
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Spain'
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Australian Grand Prix'
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Abu Dhabi Grand Prix'
SELECT T1.nationality FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 24 AND T2.points = 1.0
SELECT T2.q1 FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 354 AND T1.forename = 'Bruno' AND T1.surname = 'Senna'
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 355 AND T2.q2 = '0:01:40'
SELECT T2.number FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 LIKE '0:54%'
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007) AND time IS NULL;
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901;
SELECT COUNT(*)  FROM results  WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29')  AND time NOT LIKE '+%' ;
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1
SELECT T2.url FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 161 AND T1.time LIKE '0:27%'
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 ORDER BY T1.fastestLapSpeed DESC LIMIT 1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 9 ORDER BY T2.points DESC LIMIT 1;
SELECT T2.q1 FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lucas' AND T1.surname = 'di Grassi' AND T2.raceId = 345;
SELECT T2.nationality FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 347 AND T1.q2 = '0:01:15'
SELECT T1.code FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 45 AND T2.q3 LIKE '0:01:33%'
SELECT T2.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Bruce' AND T1.surname = 'McLaren' AND T2.raceId = 743;
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'San Marino Grand Prix' AND T1.year = 2006 AND T2.position = 2;
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901;
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872 AND T2.time IS NOT NULL ORDER BY T1.dob DESC LIMIT 1;
SELECT T2.forename, T2.surname FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 348 ORDER BY T1.time LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT ((SELECT results.fastestLapSpeed FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta' AND results.raceId = 853) - (SELECT results.fastestLapSpeed FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta' AND results.raceId = 854)) / (SELECT results.fastestLapSpeed FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta' AND results.raceId = 853) * 100
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '1983-07-16'
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*) FROM races WHERE year = 2005; SELECT name FROM races WHERE year = 2005 ORDER BY name DESC;
SELECT name FROM races WHERE date = (SELECT MIN(date) FROM races)
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT MAX(round) FROM races WHERE year = 1999)
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM races WHERE year = 2017 EXCEPT SELECT name FROM races WHERE year = 2000;
SELECT T2.country, T2.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'European Grand Prix' ORDER BY T1.year ASC LIMIT 1;
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Brands Hatch' AND T1.name = 'British Grand Prix' ORDER BY T1.year DESC LIMIT 1
SELECT COUNT(*)  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE races.name = 'British Grand Prix' AND circuits.name = 'Silverstone Circuit';
SELECT D.forename, D.surname FROM drivers AS D JOIN driverStandings AS DS ON D.driverId = DS.driverId JOIN races AS R ON DS.raceId = R.raceId WHERE R.year = 2010 AND R.name = 'Singapore Grand Prix' ORDER BY DS.position;
SELECT T1.forename, T1.surname, MAX(T2.points)  FROM drivers AS T1  JOIN driverStandings AS T2 ON T1.driverId = T2.driverId  GROUP BY T1.driverId  ORDER BY T2.points DESC  LIMIT 1;
SELECT d.forename, d.surname, ds.points FROM drivers AS d JOIN driverStandings AS ds ON d.driverId = ds.driverId JOIN races AS r ON ds.raceId = r.raceId WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix' ORDER BY ds.points DESC LIMIT 3;
SELECT T2.forename, T2.surname, T3.name FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T1.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT AVG(laps.time)  FROM results  JOIN laps ON results.raceId = laps.raceId AND results.driverId = laps.driverId  JOIN drivers ON drivers.driverId = results.driverId  JOIN races ON races.raceId = results.raceId  WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009
SELECT CAST(SUM(IIF(T2.surname = 'Hamilton' AND T1.position > 1, 1, 0)) AS REAL) * 100 / COUNT(T1.driverStandingsId) FROM driverStandings AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.year >= 2010;
SELECT T1.nationality ,  T2.forename ,  T2.surname ,  MAX(T3.points) FROM constructors AS T1 JOIN constructorStandings AS T3 ON T1.constructorid = T3.constructorid JOIN drivers AS T2 WHERE T2.driverid = ( SELECT driverid FROM results WHERE position = 1 ) GROUP BY T2.driverid ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.forename, T1.surname, (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.dob)) AS age FROM drivers AS T1 WHERE T1.nationality = 'Japanese' ORDER BY T1.dob DESC LIMIT 1;
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE YEAR(T1.date) BETWEEN 1990 AND 2000 GROUP BY T2.name HAVING COUNT(*) = 4
SELECT T2.name, T2.location, T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'USA' AND T1.year = 2006
SELECT T1.name, T2.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE MONTH(T1.date) = 9 AND YEAR(T1.date) = 2005
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20
SELECT COUNT(*)  FROM driverStandings ds  JOIN drivers d ON ds.driverId = d.driverId  JOIN races r ON ds.raceId = r.raceId  JOIN circuits c ON r.circuitId = c.circuitId  WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit' AND ds.wins = 1;
SELECT T3.name, T3.year FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Michael' AND T2.surname = 'Schumacher' ORDER BY T1.milliseconds ASC LIMIT 1;
SELECT AVG(T2.points) FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T3.year = 2000
SELECT T3.name, T2.points FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T3.year ASC LIMIT 1
SELECT T1.name, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2017 ORDER BY T1.date ASC;
SELECT R.name, R.year, C.location FROM races AS R JOIN circuits AS C ON R.circuitId = C.circuitId JOIN (   SELECT raceId, MAX(lap) as max_laps   FROM lapTimes   GROUP BY raceId ) AS L ON R.raceId = L.raceId WHERE L.max_laps = (   SELECT MAX(max_laps)   FROM (     SELECT raceId, MAX(lap) as max_laps     FROM lapTimes     GROUP BY raceId   ) AS subquery )
SELECT COUNT(*) * 100 / (SELECT COUNT(*) FROM races WHERE name = 'European Grand Prix') AS percentage  FROM races  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Germany' AND races.name = 'European Grand Prix';
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)
SELECT COUNT(*) FROM drivers WHERE code IS NULL;
SELECT nationality FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers)
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'
SELECT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit'
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year BETWEEN 2010 AND 2019 AND T2.name = 'Abu Dhabi Circuit'
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy'
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009
SELECT T2.fastestLapTime FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.fastestLapTime LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId ORDER BY T2.fastestLapSpeed DESC LIMIT 1;
SELECT T2.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2007 ORDER BY T2.position ASC LIMIT 1
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T3.name FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.rank ASC LIMIT 1
SELECT MAX(T1.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT T3.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT results.positionOrder FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix' AND races.year = 2008
SELECT T3.forename ,  T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 1989 AND T2.grid = 4
SELECT COUNT(*)  FROM results  JOIN races ON results.raceId = races.raceId  WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.time IS NOT NULL;
SELECT T3.fastestLap FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.year = 2008 AND T3.name = 'Australian Grand Prix'
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.position = 2
SELECT T3.forename ,  T3.surname ,  T3.url FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.time LIKE '%:%'
SELECT COUNT(*)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE results.raceId = (SELECT races.raceId FROM races WHERE races.name = 'Australian Grand Prix' AND YEAR(races.date) = 2008)  AND drivers.nationality = 'British';
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix' AND T2.year = 2008 AND T1.time IS NOT NULL
SELECT SUM(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(strftime('%M', fastestLapTime) * 60 + strftime('%S', fastestLapTime) + strftime('%f', fastestLapTime)/1000000) FROM results WHERE driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT CAST(SUM(IIF(T2.time IS NOT NULL, 1, 0)) AS REAL) / COUNT(T2.raceId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'
SELECT (CAST((T2.time - T1.time) AS REAL) / T2.time) * 100 FROM results AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.positionOrder = 1 AND T2.positionOrder = (SELECT MAX(positionOrder) FROM results WHERE raceId = T1.raceId) AND T1.raceId IN (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) > 1980;
SELECT MAX(T1.points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "British"
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.points = (SELECT MAX(points) FROM constructorStandings)
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0;
SELECT COUNT(*)  FROM (     SELECT constructorId      FROM constructorStandings      WHERE points = 0      GROUP BY constructorId      HAVING COUNT(raceId) = 2 ) AS c  JOIN constructors  ON c.constructorId = constructors.constructorId  WHERE nationality = 'Japanese'
SELECT T1.name FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.rank = 1
SELECT COUNT(*) FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'French' AND T2.laps > 50;
SELECT CAST(COUNT(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.nationality = 'Japanese' AND T3.year BETWEEN 2007 AND 2009;
SELECT AVG(T2.time) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year < 1975 AND T2.position = 1 AND T2.time NOT NULL GROUP BY T1.year
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE YEAR(T1.dob) > 1975 AND T2.rank = 2;
SELECT COUNT(*) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.nationality = 'Italian' AND results.time IS NULL;
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)
SELECT T1.fastestLap FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T1.time LIKE '%:%' LIMIT 1;
SELECT AVG(T1.fastestLapSpeed) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT T2.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN D.year(dob) < 1985 AND R.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(D.driverId) FROM drivers AS D JOIN results AS R ON D.driverId = R.driverId JOIN races AS Ra ON R.raceId = Ra.raceId WHERE Ra.year BETWEEN 2000 AND 2005;
SELECT COUNT(*) FROM lapTimes JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE drivers.nationality = 'French' AND TIME_TO_SEC(lapTimes.time) < 120;
SELECT code FROM drivers WHERE nationality = 'America' AND code IS NOT NULL AND code != ''
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(*) FROM driverStandings WHERE raceId = 18;
SELECT COUNT(*) AS Dutch_Drivers FROM (     SELECT nationality      FROM drivers      ORDER BY dob DESC      LIMIT 3)  WHERE nationality = 'Dutch'
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = "British" AND YEAR(dob) = 1980;
SELECT T2.driverId FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND YEAR(T1.dob) BETWEEN 1980 AND 1990 ORDER BY T2.time LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1;
SELECT d.driverId, d.code  FROM drivers d  JOIN results r ON d.driverId = r.driverId  WHERE YEAR(d.dob) = 1971  AND r.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)
SELECT T1.driverId FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Spanish' AND YEAR(T1.dob) < 1982 ORDER BY T2.time DESC LIMIT 10
SELECT T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY T1.fastestLapTime LIMIT 1
SELECT T2.year FROM lapTimes AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time = (SELECT MAX(time) FROM lapTimes)
SELECT T1.driverId FROM lapTimes AS T1 WHERE T1.lap = 1 GROUP BY T1.driverId ORDER BY MIN(T1.time) LIMIT 5;
SELECT COUNT(*) FROM results WHERE statusId = 2 AND raceId BETWEEN 50 AND 100 AND time IS NOT NULL;
SELECT location ,  lat ,  lng FROM circuits WHERE country = 'Austria'
SELECT T1.raceId FROM results AS T1 WHERE T1.time IS NOT NULL GROUP BY T1.raceId ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.driverRef, T1.nationality, T1.dob  FROM drivers AS T1  JOIN qualifying AS T2  ON T1.driverId = T2.driverId  WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL;
SELECT T3.year, T3.name, T3.date, T3.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MIN(dob) FROM drivers) AND T3.date = (SELECT MIN(date) FROM races)
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = "American" AND T1.status = "Puncture"
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId GROUP BY T1.constructorId ORDER BY SUM(T2.wins) DESC LIMIT 1;
SELECT T2.driverId FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'French Grand Prix' AND T2.lap = 3 ORDER BY T2.time DESC LIMIT 1;
SELECT T2.raceId, T1.milliseconds FROM lapTimes AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.lap = 1 ORDER BY T1.time LIMIT 1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2006 AND T2.name = 'United States Grand Prix' AND T1.rank < 11
SELECT T3.forename, T3.surname FROM (SELECT T2.driverId, AVG(T1.duration) as avg_duration FROM pitStops AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId AND T1.driverId = T2.driverId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.nationality = 'German' AND strftime('%Y', T3.dob) BETWEEN '1980' AND '1985' GROUP BY T2.driverId) AS T4 ORDER BY avg_duration ASC LIMIT 3
SELECT T1.time, T2.name FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Canadian Grand Prix' AND T1.time LIKE '%:%:%' LIMIT 1
SELECT T3.constructorRef, T3.url FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T3.constructorId = T2.constructorId WHERE T1.year = 2009 AND T1.name = 'Singapore Grand Prix' ORDER BY T2.time LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND YEAR(dob) BETWEEN 1981 AND 1991;
SELECT forename, surname, url, dob  FROM drivers  WHERE nationality = 'German' AND YEAR(dob) BETWEEN 1971 AND 1985  ORDER BY dob DESC;
SELECT name, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT MAX(T3.points), T1.name, T1.nationality FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.name = 'Monaco Grand Prix' AND T3.year BETWEEN 1980 AND 2010 GROUP BY T1.constructorId, T1.name, T1.nationality ORDER BY SUM(T3.points) DESC LIMIT 1;
SELECT AVG(T2.points) FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Turkish Grand Prix'
SELECT AVG(race_count) AS average_races FROM (   SELECT COUNT(*) AS race_count   FROM races   WHERE date BETWEEN '2000-01-01' AND '2010-12-31'   GROUP BY year ) as yearly_races;
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(driverId) DESC LIMIT 1
SELECT wins FROM driverStandings WHERE points = (SELECT points FROM driverStandings ORDER BY points DESC LIMIT 1 OFFSET 90) LIMIT 1
SELECT T2.name FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY T1.fastestLapTime LIMIT 1
SELECT T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date = (SELECT MAX(date) FROM races)
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T3.raceId = T2.raceId JOIN circuits AS T4 ON T4.circuitId = T3.circuitId WHERE T3.year = 2008 AND T4.name = 'Marina Bay Street Circuit' ORDER BY T2.q3 LIMIT 1
SELECT d.forename, d.surname, d.nationality, r.name  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  JOIN races r ON r.raceId = ds.raceId  WHERE d.dob = (SELECT MAX(dob) FROM drivers)  LIMIT 1;
SELECT COUNT(*)  FROM results  WHERE statusId = 3 AND raceId = (     SELECT raceId      FROM races      WHERE name = 'Canadian Grand Prix' )  AND driverId = (     SELECT r1.driverId      FROM results AS r1      WHERE r1.statusId = 3 AND r1.raceId = (         SELECT raceId          FROM races          WHERE name = 'Canadian Grand Prix'     )      GROUP BY r1.driverId      ORDER BY COUNT(*) DESC      LIMIT 1 )
SELECT T1.forename, T1.surname, SUM(T2.wins)  FROM drivers AS T1  JOIN driverStandings AS T2 ON T1.driverId = T2.driverId  WHERE T1.dob = (SELECT MIN(dob) FROM drivers) GROUP BY T1.driverId;
SELECT MAX(duration) FROM pitStops
SELECT MIN(CAST(REPLACE(time, ':', '.') AS REAL)) FROM lapTimes
SELECT MAX(T1.duration) FROM pitStops AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T3.lap FROM races AS T1 JOIN pitStops AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T2 ON T3.driverId = T2.driverId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix' AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T1.duration FROM pitStops AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2011 AND T2.name = 'Australian Grand Prix'
SELECT T2.time FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.time LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.rank = 1 ORDER BY T2.time LIMIT 1;
SELECT T1.position FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.time ASC LIMIT 1
SELECT T1.fastestLapTime FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Austrian Grand Prix' ORDER BY T1.fastestLapTime LIMIT 1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T3.circuitId = T2.circuitId WHERE T3.country = 'Italy' ORDER BY T1.time LIMIT 1
SELECT T2.name FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.name = 'Red Bull Ring' AND T2.name = 'Austrian Grand Prix' ORDER BY T1.time ASC LIMIT 1;
SELECT T1.duration FROM pitStops AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Austrian Grand Prix' AND T1.driverId IN (SELECT driverId FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Austrian Grand Prix') ORDER BY time ASC LIMIT 1)
SELECT T3.lat, T3.lng FROM lapTimes AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.time = '1:29.488'
SELECT AVG(T2.milliseconds) FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(lapTimes.milliseconds)  FROM lapTimes  JOIN races ON lapTimes.raceId = races.raceId  JOIN circuits ON races.circuitId = circuits.circuitId  WHERE circuits.country = 'Italy'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) LIMIT 1;
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.country_id = T2.country_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1
SELECT home_team  FROM match_results  WHERE season = '2015/2016' AND (home_team_goals - away_team_goals) < 0  GROUP BY home_team  ORDER BY COUNT(*)  LIMIT 1;
SELECT player_name  FROM players  ORDER BY penalties DESC  LIMIT 10;
SELECT Team.team_long_name  FROM Match  JOIN Team ON Match.away_team_api_id = Team.team_api_id  WHERE Match.league_id IN (SELECT League.id FROM League WHERE League.name = 'Scotland Premier League')  AND Match.season = '2009/2010'  AND Match.away_team_goal > Match.home_team_goal  GROUP BY Match.away_team_api_id  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT T1.buildUpPlaySpeed FROM Teams AS T1 JOIN Matches AS T2 ON T1.teamID = T2.teamID WHERE T1.buildUpPlaySpeed IN (SELECT TOP 4 buildUpPlaySpeed FROM Teams ORDER BY buildUpPlaySpeed DESC)
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(CASE WHEN T2.home_team_goal = T2.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT (strftime('%Y', 'now') - strftime('%Y', birthday)) as age FROM Player WHERE sprint_speed >= 97 AND date BETWEEN '2013-01-01' AND '2015-12-31';
SELECT T2.name , COUNT(T1.match_id) FROM Matches AS T1 JOIN Leagues AS T2 ON T1.league_id = T2.league_id GROUP BY T1.league_id ORDER BY COUNT(T1.match_id) DESC LIMIT 1;
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'
SELECT player_api_id FROM Player_Attributes WHERE SUBSTR(date,1,4) = '2010' GROUP BY player_api_id ORDER BY AVG(overall_rating) - (SELECT AVG(overall_rating) FROM Player_Attributes WHERE SUBSTR(date,1,4) = '2010') DESC LIMIT 1
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;
SELECT T1.team_long_name FROM Teams AS T1 JOIN Matches AS T2 ON T1.team_id = T2.team_id WHERE strftime('%Y', T2.date) = '2012' AND T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Matches WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL)
SELECT SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100 / COUNT(player_fifa_api_id)  FROM Player  WHERE YEAR(birthday) BETWEEN 1987 AND 1992;
SELECT league FROM (     SELECT league, SUM(home_team_goal + away_team_goal) as total_goals      FROM match     GROUP BY league ) AS subquery ORDER BY total_goals ASC LIMIT 5;
SELECT AVG(T1.long_shots) FROM ( SELECT SUM(CASE WHEN T2.player_name = 'Ahmed Samir Farag' THEN T2.long_shots ELSE 0 END) AS long_shots  FROM Player_Attributes AS T1  JOIN Players AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id  GROUP BY T2.player_fifa_api_id ) AS T1 JOIN ( SELECT COUNT(DISTINCT player_fifa_api_id) AS count_players  FROM Players  WHERE player_name = 'Ahmed Samir Farag' ) AS T2 )
SELECT T1.player_name  FROM Player AS T1  JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id  WHERE T1.height > 180  GROUP BY T1.player_name  ORDER BY SUM(T2.heading_accuracy) / COUNT(T2.player_fifa_api_id) DESC  LIMIT 10;
SELECT team_long_name  FROM Team_Attributes  WHERE buildUpPlayDribblingClass = 'Normal'    AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00'    AND chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE buildUpPlayDribblingClass = 'Normal' AND date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00')  ORDER BY chanceCreationPassing DESC;
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.country_id = T2.country_id WHERE T2.season = '2009/2010' GROUP BY T1.id HAVING AVG(T2.home_team_goal) > AVG(T2.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10';
SELECT AttackingWorkRate FROM FootballPlayers WHERE Name = 'Franco Zennaro'
SELECT T1.buildUpPlayPositioningClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date = (SELECT MAX(date) FROM Team_Attributes WHERE team_fifa_api_id = T1.team_api_id);
SELECT heading_accuracy  FROM football_players  WHERE name = 'Francois Affolter'  AND date = '2014-09-18 00:00:00';
SELECT overall_rating  FROM player_ratings  WHERE player_name = 'Gabriel Tamas' AND strftime('%Y', date) = '2011';
SELECT COUNT(*) FROM matches WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League')
SELECT preferred_foot FROM football_player WHERE age = (SELECT MIN(age) FROM football_player);
SELECT * FROM Player_Attributes WHERE potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT COUNT(*) FROM players WHERE weight < 130 AND preferred_foot = 'left'
SELECT team_short_name FROM table WHERE chanceCreationPassingClass = 'Risky'
SELECT Defensive_work_rate FROM Players WHERE Name = 'David Wilson'
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT League.name FROM League WHERE Country = 'Netherlands'
SELECT AVG(T1.home_team_goal) FROM match AS T1 JOIN country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Poland' AND T1.season = '2010/2011'
SELECT AVG(T1.finishing) AS avg_finishing, T2.player_api_id FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height = (SELECT MAX(height) FROM Player UNION SELECT MIN(height) FROM Player) GROUP BY T2.player_api_id ORDER BY AVG(T1.finishing) DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;
SELECT player_name  FROM players  WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010';
SELECT Potential FROM Players WHERE Name = 'Aaron Doran' ;
SELECT * FROM Players WHERE preferred_foot = 'left'
SELECT team_long_name FROM table_name WHERE buildUpPlaySpeedClass = 'Fast';
SELECT buildUpPlayPassingClass FROM Team WHERE team_short_name = 'CLB'
SELECT team_short_name FROM table WHERE buildUpPlayPassing > 70;
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T1.height > 170 AND strftime('%Y', T2.date) BETWEEN '2010' AND '2015'
SELECT name FROM FootballPlayer WHERE height = (SELECT MIN(height) FROM FootballPlayer);
SELECT T2.country FROM League AS T2 WHERE T2.name = 'Italy Serie A'
SELECT team_short_name FROM table WHERE buildUpPlaySpeed = 31 AND buildUpPlayDribbling = 53 AND buildUpPlayPassing = 32;
SELECT AVG(overall_rating) FROM Players WHERE name = 'Aaron Doran' AND sport = 'football';
SELECT COUNT(*) FROM Matches WHERE League_ID = (SELECT id FROM Leagues WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10';
SELECT T1.team_short_name FROM Teams AS T1 JOIN Matches AS T2 ON T1.team_id = T2.home_team_id WHERE T2.home_team_goal = 10
SELECT name FROM Player WHERE balance = (SELECT MAX(balance) FROM Player) AND potential = 61;
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) AS diff_avg_ball_control FROM player AS T1 JOIN performance AS T2 ON T1.id = T2.player_id;
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE (player_name = 'Aaron Lennon' AND birthday < (SELECT birthday FROM Player WHERE player_name = 'Abdelaziz Barrada')) OR (player_name = 'Abdelaziz Barrada' AND birthday > (SELECT birthday FROM Player WHERE player_name = 'Aaron Lennon'));
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low';
SELECT country FROM League WHERE name = 'Belgium Jupiler League'
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany'
SELECT player_name FROM Player WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player)
SELECT COUNT(DISTINCT player_id)  FROM Players  WHERE strftime('%Y', birthday)<'1986'  AND defensive_work_rate='high'
SELECT player_name  FROM players  WHERE crossing = (SELECT MAX(crossing)                    FROM players                    WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone'))
SELECT Heading_Accuracy FROM Players WHERE Player_Name = 'Ariel Borysiuk'
SELECT COUNT(*) FROM players WHERE height > 180 AND volleys > 70;
SELECT name FROM Players WHERE volleys > 70 AND dribbling > 70;
SELECT COUNT(*)  FROM match  JOIN country ON match.country_id = country.id  WHERE country.name = 'Belgium' AND match.season = '2008/2009'
SELECT long_passing FROM player_stats WHERE age = (SELECT MAX(age) FROM player_stats)
SELECT COUNT(*) FROM Matches WHERE League_ID = (SELECT id FROM Leagues WHERE name = 'Belgium Jupiler League') AND date LIKE '2009-04%'
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(overall_rating) FROM players WHERE strftime('%Y', birthday) < '1986'
SELECT (AVG(T1.overall_rating) - AVG(T2.overall_rating)) / AVG(T2.overall_rating) * 100 AS percentage_higher FROM player_attributes AS T1 JOIN player_attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ariel Borysiuk' AND T2.player_name = 'Paulin Puel';
SELECT AVG(buildUpPlaySpeed)  FROM table_name  WHERE team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM Player_Stats AS T1 JOIN Players AS T2 ON T1.player_id = T2.player_id WHERE T2.player_name = 'Aaron Lennox'
SELECT MAX(chanceCreationPassing) AS highest_chance_creation_passing, chanceCreationPassingClass  FROM table_name  WHERE team_long_name = 'Ajax'
SELECT preferred_foot FROM players WHERE player_name = 'Abdou Diallo'
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(T2.away_team_goal) FROM Country AS T1 JOIN Match AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Italy' AND T2.team_long_name = 'Parma' AND T2.is_home = 0
SELECT name FROM players WHERE overall_rating = 77 AND date LIKE '2016-06-23%' ORDER BY birthday ASC LIMIT 1;
SELECT overall_rating FROM table_name WHERE player_name = 'Aaron Mooy' AND date LIKE '2016-02-04%'
SELECT potential FROM table_name WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'
SELECT attacking_work_rate FROM players WHERE player_name = 'Francesco Migliore' AND date LIKE '2015-05-01%'
SELECT defensive_work_rate FROM player_stats WHERE player_name = 'Kevin Berigaud' AND date = '2013-02-22 00:00:00'
SELECT T1.date FROM Player_Attributes AS T1 JOIN (SELECT MAX(crossing) AS max_crossing FROM Player_Attributes WHERE player_name = 'Kevin Constant') AS T2 WHERE T1.player_name = 'Kevin Constant' AND T1.crossing = T2.max_crossing ORDER BY T1.date ASC LIMIT 1
SELECT build_up_play_speed FROM games WHERE team_long_name = 'Willem II' AND date = '2011-02-22'
SELECT build_up_play_dribbling_class FROM table_name WHERE team_short_name = 'LEI' AND date = '2015-09-10 00:00:00'
SELECT build_up_play_passing_class FROM events WHERE team_long_name = 'FC Lorient' AND date LIKE '2010-02-22%'
SELECT chance_creation_passing FROM matches WHERE team_long_name = 'PEC Zwolle' AND date = '2013-09-20 00:00:00'
SELECT chance_creation_crossing FROM matches WHERE team_long_name = 'Hull City' AND date = '2010-02-22 00:00:00'
SELECT defence_aggression FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Hannover 96') AND date LIKE '2015-09-10%'
SELECT AVG(overall_rating)  FROM table_name  WHERE player_name = 'Marko Arnautovic'  AND SUBSTR(date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21';
SELECT (avg(case when T2.player_name = 'Landon Donovan' then T1.overall_rating else 0 end) - avg(case when T2.player_name = 'Jordan Bowery' then T1.overall_rating else 0 end)) / avg(case when T2.player_name = 'Landon Donovan' then T1.overall_rating else 0 end) * 100 FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE date = '2013-07-12'
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE datetime('now') - datetime(birthday) > '34 years'
SELECT SUM(home_team_goal) FROM table_name WHERE player_name = 'Aaron Lennon'
SELECT SUM(T2.away_team_goal)  FROM match AS T1  JOIN team AS T2 ON T1.away_team_id = T2.team_id  WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(T2.home_team_goal) FROM Player AS T1 JOIN Match AS T2 ON T1.player_id = T2.player_id WHERE (datetime('now') - datetime(T1.birthday)) / 365 < 31
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT name FROM Player WHERE potential = (SELECT MAX(potential) FROM Player);
SELECT player_name  FROM Players  WHERE attacking_work_rate = 'high'
SELECT name FROM players WHERE finishing = 1 ORDER BY datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday) DESC LIMIT 1;
SELECT player_name FROM Players WHERE country = 'Belgium' ;
SELECT T1.name, T2.country  FROM Player AS T1  JOIN Country AS T2 ON T1.country_id = T2.id  WHERE T1.vision > 89;
SELECT T1.country AS Country FROM Players AS T2 JOIN Countries AS T1 ON T1.code = T2.country_code GROUP BY T1.country ORDER BY AVG(T2.weight) DESC LIMIT 1;
SELECT team_long_name FROM Teams WHERE buildUpPlaySpeedClass = 'Slow'
SELECT T1.team_short_name  FROM Teams AS T1  JOIN Events AS T2 ON T1.team_id = T2.team_id  WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T3.height) FROM Country AS T1 JOIN Match AS T2 ON T1.id = T2.country_id JOIN Player AS T3 ON T3.id = T2.id WHERE T1.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-12-31'
SELECT (SELECT jumping FROM Players WHERE id = 6) - (SELECT jumping FROM Players WHERE id = 23) AS Difference_In_Jumping_Scores;
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'right' ORDER BY T2.potential ASC LIMIT 5;
SELECT COUNT(*) FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Player_Attributes) FROM Player_Attributes WHERE stamina > 80 AND strength > 80;
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'
SELECT T1.home_team_goal ,  T1.away_team_goal FROM match AS T1 JOIN league AS T2 ON T1.league_id  =  T2.league_id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'
SELECT T2.sprint_speed ,  T2.agility ,  T2.acceleration FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin'
SELECT buildUpPlaySpeedClass FROM table_name WHERE team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*)  FROM games  WHERE season = '2015/2016' AND league = 'Italian Serie A'
SELECT MAX(T1.home_team_goal)  FROM match AS T1  JOIN league AS T2 ON T1.league_id = T2.league_id  WHERE T2.country = 'Netherlands' AND T2.name = 'Eredivisie'
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.weight = (SELECT MAX(weight) FROM Player) LIMIT 1;
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T3.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T3.id) DESC LIMIT 4
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)
SELECT * FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 1;
SELECT (COUNT(*) FROM(SELECT * FROM Player WHERE height < 180 AND overall_rating > 70) AS subquery) * 100 / COUNT(*) FROM Player
SELECT      (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN 1 END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN 1 END)) /      NULLIF(COUNT(CASE WHEN SEX = 'M' THEN 1 END),0) * 100 AS deviation_percentage FROM Patient
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND YEAR(T1.Birthday) > 1930 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T1.SEX = 'F' THEN 1 ELSE NULL END) FROM Patient AS T1
SELECT COUNT(CASE WHEN Admission = '+' THEN 1 ELSE NULL END) * 100.0 / COUNT(*) AS percentage_inpatient  FROM Patient  WHERE YEAR(Birthday) BETWEEN 1930 AND 1940;
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)  FROM Patient  WHERE Diagnosis = 'SLE'
SELECT T1.Diagnosis ,  T2.Date FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609
SELECT T1.SEX ,  T1.Birthday ,  T2.Examination_Date ,  T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500;
SELECT T1.ID ,  (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'
SELECT T1.ID, T1.Sex, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) = '1937' AND T2.T_CHO >= '250'
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5;
SELECT CAST(SUM(CASE WHEN T2.TP < 6.0 OR T2.TP > 8.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'
SELECT AVG(T2.aCL_IgG) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admisson = '+' AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM T1.Birthday) >= 50
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND YEAR(Description) = '1997' AND Admission = '-'
SELECT MIN(TIMESTAMPDIFF(YEAR, Birthday, `First Date`)) FROM Patient WHERE `First Date` IS NOT NULL
SELECT COUNT(*)  FROM Patient p  JOIN Examination e ON p.ID = e.ID  WHERE p.SEX = 'F'  AND e.Thrombosis = 1  AND YEAR(e.`Examination Date`) = 1997;
SELECT MAX(T2.Birthday) - MIN(T2.Birthday) AS AgeGap FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200;
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MAX(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Symptoms IS NOT NULL))
SELECT COUNT(T1.ID) / 12 AS average_male_patients_tested_per_month FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T2.Date, (YEAR(T1.First_Date) - YEAR(T1.Birthday)) as Age  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.Diagnosis = 'SJS'  ORDER BY T1.Birthday DESC  LIMIT 1;
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UA IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE DATE_SUB(T2.Examination_Date, INTERVAL 1 YEAR) <= T1.First_Date OR T2.Examination_Date IS NULL
SELECT COUNT(*) FROM Patient p JOIN Examination e ON p.ID = e.ID WHERE YEAR(p.Birthday) + 18 > YEAR(e.`Examination Date`) AND YEAR(e.`Examination Date`) BETWEEN 1990 AND 1993;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.T_BIL >= 2.0;
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY T1.Diagnosis ORDER BY COUNT(T1.Diagnosis) DESC LIMIT 1
SELECT AVG(CAST(1999 - EXTRACT(YEAR FROM T2.Birthday) AS REAL)) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Examination_Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT T1.Birthday ,  T2.HGB ,  T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HGB = ( SELECT MAX(HGB) FROM Laboratory )
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT T_CHO FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04' AND T_CHO < 250;
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` ASC LIMIT 1
SELECT T2.aCL_IgM FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T1.Description = '1994-02-19' AND T2.Examination_Date = '1993-11-12'
SELECT T1.SEX FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT = 9 AND T2.Date = '1992-06-12'
SELECT T2.Date - T1.Birthday AS age_at_test FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UA = 8.4 AND T2.Date = '1991-10-21'
SELECT COUNT(T2.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.First_Date = '1991-06-13' AND T1.Diagnosis = 'SJS' AND YEAR(T2.Date) = 1995
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Examination_Date = '1997-01-27' AND T2.Diagnosis LIKE '%SLE%' ORDER BY T1.First_Date LIMIT 1
SELECT T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.Examination_Date = '1993-09-27'
SELECT (SELECT T_cho FROM Laboratory L JOIN Patient P ON L.ID  =  P.ID WHERE P.Birthday  =  '1959-02-18' AND L.Date LIKE '1981-11-%') - (SELECT T_cho FROM Laboratory L JOIN Patient P ON L.ID  =  P.ID WHERE P.Birthday  =  '1959-02-18' AND L.Date LIKE '1981-12-%') AS decrease_rate
SELECT ID FROM Examination WHERE Diagnosis = "Behcet's" AND Examination_Date BETWEEN '1997-01-01' AND '1997-12-31';
SELECT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 GROUP BY ID ORDER BY ID;
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Admission = '+' AND YEAR(Birthday) = 1964; SELECT ID FROM Patient WHERE SEX = 'F' AND Admission = '+' AND YEAR(Birthday) = 1964 ORDER BY ID;
SELECT COUNT(*) FROM Examination WHERE `Thrombosis` = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN U_PRO > 0 AND U_PRO < 30 THEN 1 ELSE 0 END) FROM Laboratory WHERE U_PRO > 0 AND U_PRO < 30;
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'M' AND strftime('%Y', `First Date`) = '1981'
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Admission = '-' AND L.Date LIKE '1991-10%' AND L.T_BIL < 2.0;
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE ANA_Pattern != 'P') AND SEX = 'F' AND Birthday BETWEEN '1980-01-01' AND '1989-12-31'
SELECT T1.SEX FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRP > 2 AND T2.CRE = 1 AND T2.LDH = 123 INTERSECT SELECT T1.SEX FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'PSS'
SELECT AVG(T2.ALB) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T1.Diagnosis = 'SLE' AND T2.PLT > 400
SELECT T1.Symptoms  FROM Examination AS T1  WHERE T1.Diagnosis = 'SLE'  GROUP BY T1.Symptoms  ORDER BY COUNT(T1.Symptoms) DESC  LIMIT 1;
SELECT `First Date`, `Diagnosis` FROM Patient WHERE ID = 48473
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'
SELECT COUNT(*) FROM Laboratory WHERE YEAR(Date) = '1997' AND (ALB < '3.5' OR ALB > '5.5')
SELECT (SUM(CASE WHEN Diagnosis LIKE '%SLE%' AND Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END)) / SUM(CASE WHEN Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) * 100 AS Proportion FROM Examination
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE Diagnosis = 'RA' AND YEAR(Birthday) = '1980'
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Examination WHERE `Examination Date` BETWEEN '1995-01-01' AND '1997-12-31') AND Diagnosis = 'Behcet' AND Admission = '-'
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;
SELECT DATEDIFF((SELECT Examination.Examination_Date FROM Examination WHERE Examination.ID = 821298),(SELECT Patient.First_Date FROM Patient WHERE Patient.ID = 821298))
SELECT (CASE WHEN T2.UA > 8 AND T1.SEX = 'M' THEN 'true' WHEN T2.UA > 6.5 AND T1.SEX = 'F' THEN 'true' ELSE 'false' END) AS `normal_range` FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 57266;
SELECT Date FROM Laboratory WHERE ID = '48473' AND GOT >= 60;
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60 AND YEAR(T2.Date) = 1994
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60 GROUP BY T1.ID HAVING COUNT(*) > 1
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500;
SELECT T1.ID, (YEAR(CURDATE()) - YEAR(T1.Birthday)) AS Age  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T2.LDH BETWEEN 600 AND 800;
SELECT T1.Admisson FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP < 300;
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0;
SELECT T2.TP - 8.5 AS Deviation  FROM Patient AS T1  JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.SEX = 'F' AND T2.TP > 8.5;
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND (T2.ALB <= 3.5 OR T2.ALB >= 5.5) ORDER BY T1.Birthday DESC
SELECT T2.ALB, T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday LIKE '1982%' AND T2.ALB BETWEEN 3.5 AND 5.5;
SELECT CAST(SUM(CASE WHEN T2.UA > 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'
SELECT AVG(T2.UA) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T2.UA < 8.0 AND T1.SEX = 'M') OR (T2.UA < 6.5 AND T1.SEX = 'F') GROUP BY T1.ID ORDER BY T2.Date DESC
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UN = 29;
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UN < 30 AND T1.Diagnosis = 'RA'
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.CRE >= 1.5;
SELECT IF(SUM(IIF(T2.SEX = 'M', 1, 0)) > SUM(IIF(T2.SEX = 'F', 1, 0)), TRUE, FALSE) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE >= 1.5
SELECT T1.ID, T1.SEX, T1.Birthday, MAX(T2.T_BIL) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID GROUP BY T1.ID, T1.SEX, T1.Birthday ORDER BY T2.T_BIL DESC LIMIT 1;
SELECT P.SEX, GROUP_CONCAT(DISTINCT P.ID)  FROM Patient P  JOIN Laboratory L ON P.ID = L.ID  WHERE L.T_BIL >= 2.0  GROUP BY P.SEX;
SELECT p.ID, lab.T_CHO  FROM Patient p  JOIN Laboratory lab ON p.ID = lab.ID  WHERE (p.Birthday, lab.T_CHO) IN  (SELECT MIN(birthday), MAX(T_CHO)   FROM Patient p   JOIN Laboratory lab ON p.ID = lab.ID)
SELECT AVG(DATE_PART('year', AGE(CURRENT_DATE, T1.Birthday))) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.T_CHO >= 250;
SELECT P.ID, P.Diagnosis  FROM Patient AS P  JOIN Laboratory AS L ON P.ID = L.ID  WHERE L.TG > 300;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200 AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) > 50;
SELECT DISTINCT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T1.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND T2.CPK >= 250;
SELECT T1.ID, T1.SEX, (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.`T-CHO` < 250
SELECT T2.ID, T2.GLU FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 180 AND YEAR(T1.`First Date`) = 1991;
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 GROUP BY T1.SEX ORDER BY (DATE('now') - T1.Birthday) ASC;
SELECT T1.ID, T1.Diagnosis, (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5
SELECT P.Admission  FROM Patient AS P  JOIN Laboratory AS L ON P.ID = L.ID  WHERE P.SEX = 'F'  AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) >= 50  AND (L.RBC <= 3.5 OR L.RBC >= 6.0)
SELECT T2.ID, T2.SEX FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.HGB < 10 AND T2.Admission = '-'
SELECT T1.ID, T1.SEX FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.HGB BETWEEN 10 AND 17 ORDER BY T1.Birthday ASC LIMIT 1
SELECT T1.ID ,   (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) AS age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T2.ID) > 2;
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;
SELECT      (SELECT COUNT(*) FROM Laboratory WHERE PLT < 100) -      (SELECT COUNT(*) FROM Laboratory WHERE PLT > 400) AS difference,     (SELECT COUNT(*) FROM Laboratory WHERE PLT < 100) AS lower_than_normal,     (SELECT COUNT(*) FROM Laboratory WHERE PLT > 400) AS higher_than_normal ;
SELECT P.ID FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE YEAR(L.Date) = '1984' AND TIMESTAMPDIFF(YEAR, P.Birthday, CURRENT_TIMESTAMP) < 50 AND L.PLT BETWEEN 100 AND 400;
SELECT CAST(COUNT(*) FILTER (WHERE T2.PT >= 14 AND T1.SEX = 'F') AS REAL) * 100 / COUNT(*) FILTER (WHERE T2.PT >= 14) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE DATE_PART('year', AGE(current_timestamp, T1.Birthday)) > 55;
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE strftime('%Y',T1.`First Date`) > '1992' AND T2.PT < 14;
SELECT COUNT(*) FROM Laboratory WHERE Date > '1997-01-01' AND APTT < 45;
SELECT COUNT(DISTINCT ID)  FROM Examination  WHERE RVVT = '-' AND LAC = '-' AND KCT = '-' AND Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450)
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE CAST(REPLACE(T2.U_PRO, ',', '') AS REAL) >= 30;
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.`U-PRO` BETWEEN 0 AND 30;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.IgG >= 2000
SELECT COUNT(*) FROM Laboratory JOIN Examination ON Laboratory.ID = Examination.ID WHERE Laboratory.IGG BETWEEN 900 AND 2000 AND Examination.Symptoms IS NOT NULL;
SELECT T1.diagnosis FROM patient AS T1 JOIN lab ON T1.patient = lab.patient WHERE IGA BETWEEN 80 AND 500 ORDER BY IGA DESC LIMIT 1;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.IGA BETWEEN 80 AND 500 AND YEAR(p.`First Date`) >= 1990;
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGM <= 40 OR T1.IGM >= 400 GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1
SELECT COUNT(*) FROM Patient WHERE CRP = '+' AND Description IS NULL
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE aCL_IgG > 1.5 OR aCL_IgM > 1.5 OR ANA > 256 OR aCL_IgA > 0) AND YEAR(CURDATE()) - YEAR(Birthday) < 70
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.RA IN ('-', '+-') AND T3.KCT = '+'
SELECT T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday >= '1985-01-01' AND T2.RA IN ('-', '+-')
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF < '20' AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) > 60;
SELECT COUNT(*) FROM Laboratory JOIN Examination ON Laboratory.ID = Examination.ID WHERE Laboratory.RF < '20' AND Examination.Thrombosis = '0';
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.C3 > 35 AND T2.ANA_Pattern = 'P'
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID JOIN Examination AS T3 ON T1.ID = T3.ID WHERE NOT(29 < T2.HCT AND T2.HCT < 52) ORDER BY T3.`aCL IgA` DESC LIMIT 1;
SELECT COUNT(DISTINCT T2.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'APS' AND T2.C4 > 10;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admisson = '+' AND (T2.RNP = '-' OR T2.RNP = '+-')
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1;
SELECT COUNT(*) FROM Examination WHERE SM IN ('-', '+-') AND Thrombosis = 0;
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') ORDER BY T1.Birthday DESC LIMIT 3;
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date > '1997-01-01' AND T2.SC170 IN('negative','0')
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'F' AND T2.DNA_II < 8 AND T2.Symptoms IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN('-','+-') AND YEAR(T2.Examination_Date) < 2000
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T1.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND (T2.SSB = 'negative' OR T2.SSB = '0')
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SSB IN ('negative', '0') AND T2.Symptoms IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CENTROMEA IN ('-', '+-') AND T2.SSB IN ('-', '+-')
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T1.Description IS NULL;
SELECT COUNT(*) FROM Patient WHERE IGG > 900 AND IGG < 2000 AND Admission = '+'
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT >= 60 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.GOT < 60;
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60 ORDER BY T1.Birthday DESC LIMIT 1;
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3;
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60;
SELECT T1.First_Date FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.LDH DESC LIMIT 1
SELECT T1.First_Date FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.First_Date DESC LIMIT 1;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.ALP >= 300;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALP < 300;
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SJS' AND l.TP > 6.0 AND l.TP < 8.5;
SELECT Date FROM Laboratory WHERE ALB >= 3.5 AND ALB <= 5.5 ORDER BY ALB DESC LIMIT 1;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.SEX = 'M' AND l.ALB > 3.5 AND l.ALB < 5.5 AND l.TP >= 6.0 AND l.TP <= 8.5;
SELECT T1.aCL_IgG, T1.aCL_IgM, T1.aCL_IgA FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID JOIN Patient AS T3 ON T1.ID = T3.ID WHERE T3.SEX = 'F' AND T2.UA > 6.5 ORDER BY T2.UA DESC LIMIT 1
SELECT MAX(T2.ANA) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5;
SELECT T1.ID FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T2.aCL_IgA DESC LIMIT 1;
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.T_BIL >= 2.0 AND ('P' IN (SELECT REPLACE(ANA_Pattern, ',', ' ') FROM Examination WHERE ID = T3.ID))
SELECT T1.ANA FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` < 2.0 ORDER BY T2.`T-BIL` DESC LIMIT 1
SELECT COUNT(*) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.T_CHO >= 250 AND T3.KCT = '-'
SELECT COUNT(*) FROM Laboratory L JOIN Examination E ON L.ID = E.ID WHERE L.T_CHO < 250 AND E.ANA_Pattern = 'P'
SELECT COUNT(*) FROM Laboratory JOIN Examination ON Laboratory.ID = Examination.ID WHERE Laboratory.TG < 200 AND Examination.Symptoms IS NOT NULL;
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1;
SELECT T1.ID FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 0 AND T1.CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.CPK < 250 AND (T3.KCT = '+' OR T3.RVVT = '+' OR T3.LAC = '+')
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180 ORDER BY T1.Birthday ASC LIMIT 1;
SELECT COUNT(*) FROM Laboratory JOIN Examination ON Laboratory.ID = Examination.ID WHERE Laboratory.GLU < 180 AND Examination.Thrombosis = 0;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Admission = '+' AND l.WBC BETWEEN 3.5 AND 9.0;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admisson = '-' AND (T2.RBC <= 3.5 OR T2.RBC >= 6.0)
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE PLT > 100 AND PLT < 400) AND Diagnosis IS NOT NULL;
SELECT T2.PLT FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT > 100 AND T2.PLT < 400;
SELECT AVG(T2.PT) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID JOIN Examination e ON p.ID = e.ID WHERE e.Thrombosis IN (1,2) AND l.PT < 14;
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(*) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design Department'
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women\'s Soccer';
SELECT T3.phone FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Women\'s Soccer'
SELECT COUNT(*)  FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium';
SELECT T2.event_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name LIKE '%Student_Club%' GROUP BY T1.link_to_event ORDER BY COUNT(T1.link_to_event) DESC LIMIT 1
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT T3.event_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T2.first_name = 'Maya' AND T2.last_name = 'Mclean'
SELECT COUNT(*) FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  JOIN event ON attendance.link_to_event = event.event_id  WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND YEAR(event.event_date) = 2019;
SELECT COUNT(*) FROM (SELECT event.event_id FROM attendance JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY event.event_id HAVING COUNT(*) > 10) AS attended_meetings;
SELECT T1.event_name FROM events AS T1 JOIN student_events AS T2 ON T1.event_id = T2.event_id WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 20
SELECT AVG(attendance_count) FROM (     SELECT COUNT(*) as attendance_count     FROM attendance     WHERE link_to_event IN (         SELECT event_id         FROM event         WHERE type = 'Meeting' AND YEAR(event_date) = 2020     )     GROUP BY link_to_event ) as subquery;
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense)
SELECT COUNT(*) FROM student_club AS T1 JOIN member_of_club AS T2 ON T1.clubid = T2.clubid JOIN student AS T3 ON T3.stuid = T2.stuid WHERE T3.major = 'Environmental Engineering'
SELECT T3.first_name, T3.last_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Laugh Out Loud'
SELECT T2.lastname FROM student AS T1 JOIN people AS T2 ON T1.student_id = T2.record_id WHERE T1.major = 'Law and Constitutional Studies'
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'
SELECT T1.amount FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT SUM(budget.spent)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE budget.category = 'Food' AND event.event_name = 'September Meeting';
SELECT T2.city, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois'
SELECT SUM(budget.spent)  FROM budget  JOIN event  ON budget.link_to_event = event.event_id  WHERE budget.category = 'Advertisement'  AND event.event_name = 'September Meeting';
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.last_name IN ('Pierce', 'Guidi') GROUP BY T2.department HAVING COUNT(*) = 2
SELECT SUM(budget.amount)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'October Speaker'
SELECT T3.approved FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN expense AS T3 ON T3.link_to_budget = T1.budget_id WHERE T2.event_name = 'October Meeting' AND T2.event_date = '2019-10-08T00:00:00'
SELECT AVG(T1.cost) FROM `expense` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND (SUBSTR(T1.expense_date, 6, 2) = '09' OR SUBSTR(T1.expense_date, 6, 2) = '10')
SELECT SUM(CASE WHEN SUBSTR(T2.event_date, 1, 4) = '2019' THEN T1.spent ELSE 0 END) - SUM(CASE WHEN SUBSTR(T2.event_date, 1, 4) = '2020' THEN T1.spent ELSE 0 END) AS diff_spent FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id;
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'
SELECT remaining FROM budget WHERE amount=(SELECT MAX(amount) FROM budget WHERE category='Food') AND category='Food'
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O'Gallagher'
SELECT COUNT(*)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'November Meeting' AND budget.remaining < 0;
SELECT SUM(budget.amount)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE event.event_name = 'September Speaker';
SELECT T1.event_status FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-08-20'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'
SELECT COUNT(*) FROM club_member WHERE major = 'Business' AND t_shirt_size = 'Medium'
SELECT T2.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.source = 'Dues' ORDER BY STR_TO_DATE(T2.date_received, '%Y-%m-%d') ASC LIMIT 1
SELECT COUNT(*) FROM (SELECT * FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff') AND category = 'Advertisement') AS YearlyKickoffBudget JOIN (SELECT * FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'October Meeting') AND category = 'Advertisement') AS OctoberMeetingBudget WHERE (SELECT SUM(amount) FROM YearlyKickoffBudget) > (SELECT SUM(amount) FROM OctoberMeetingBudget)
SELECT (SUM(budget.amount) WHERE budget.category = 'Parking' AND event.event_name = 'November Speaker') / SUM(budget.amount WHERE event.event_name = 'November Speaker') * 100 FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'November Speaker'
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T2.city, T2.county, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T2.expense_description FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T1.remaining = (SELECT MIN(remaining) FROM budget)
SELECT T2.link_to_member FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Meeting'
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id GROUP BY T2.college ORDER BY COUNT(T2.college) DESC LIMIT 1
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.amount = (SELECT MAX(amount) FROM budget)
SELECT e.expense_description  FROM expense AS e  JOIN member AS m ON e.link_to_member = m.member_id  WHERE m.position = 'Vice President';
SELECT COUNT(*)  FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer';
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'
SELECT COUNT(*) FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.state = 'Maryland'
SELECT COUNT(*) FROM attendance WHERE link_to_member IN (SELECT member_id FROM member WHERE phone = '954-555-6240')
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President'
SELECT MAX(spent) FROM budget;
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'
SELECT SUM(spent) FROM budget WHERE category = 'Food'
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T1.link_to_member HAVING COUNT(T1.link_to_event) > 7
SELECT T3.first_name, T3.last_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id JOIN major AS T4 ON T3.link_to_major = T4.major_id WHERE T2.event_name = 'Community Theater' AND T4.major_name = 'Interior Design'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'
SELECT COUNT(T1.amount) FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Grant' AND T2.last_name = 'Gilmour'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40;
SELECT SUM(T3.cost) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN expense AS T3 ON T1.budget_id = T3.link_to_budget WHERE T2.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member JOIN budget AS T3 ON T2.link_to_budget = T3.budget_id JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T4.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name, T2.source  FROM member AS T1  JOIN income AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.amount = (SELECT MAX(amount) FROM income)
SELECT T3.event_name FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN event AS T3 ON T2.link_to_event = T3.event_id GROUP BY T3.event_name ORDER BY SUM(T1.cost) ASC LIMIT 1
SELECT (SUM(e.cost WHERE e.link_to_budget IN (SELECT b.budget_id WHERE b.link_to_event IN (SELECT ev.event_id WHERE ev.event_name = 'Yearly Kickoff'))) / SUM(e.cost)) * 100 FROM expense AS e JOIN budget AS b ON e.link_to_budget = b.budget_id JOIN event AS ev ON b.link_to_event = ev.event_id
SELECT SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM major;
SELECT source  FROM income  WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30'  GROUP BY source  ORDER BY SUM(CASE WHEN date_received BETWEEN '2019-09-01' AND '2019-09-30' THEN 1 ELSE 0 END) DESC  LIMIT 1;   -- Note: The provided schema does not include an amount column, thus the SQL query assumes that each record represents a fund received and orders by the count of records per source. If there is an 'amount' column, replace the SUM clause with `SUM(amount)`.
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'
SELECT COUNT(*) FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.major_name = 'Physics Teaching';
SELECT COUNT(*) FROM attendance  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Community Theater' AND YEAR(event.event_date) = 2019;
SELECT COUNT(*), T3.major_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi' GROUP BY T3.major_name;
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' ORDER BY T1.spent DESC LIMIT 1
SELECT COUNT(*) FROM attendance  JOIN member ON attendance.link_to_member = member.member_id  JOIN event ON attendance.link_to_event = event.event_id  WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer';
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) / COUNT(event_id)) * 100  FROM event  WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';
SELECT T3.cost FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN expense AS T3 ON T3.link_to_budget = T1.budget_id WHERE T2.event_name = 'September Speaker' AND T3.expense_description = 'Posters'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.event_status = 'Closed' AND T1.remaining < 0 ORDER BY T1.remaining ASC LIMIT 1
SELECT E.type, SUM(Ex.cost)  FROM expense AS Ex  JOIN budget AS Bu ON Ex.link_to_budget = Bu.budget_id  JOIN event AS E ON Bu.link_to_event = E.event_id  WHERE E.event_name = 'October Meeting'  GROUP BY E.type;
SELECT T2.category, SUM(T2.amount) FROM events AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'April Speaker' GROUP BY T2.category ORDER BY SUM(T2.amount) ASC
SELECT budget_id FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')
SELECT budget_id, amount  FROM budget  WHERE category = 'Advertisement'  ORDER BY amount DESC  LIMIT 3;
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY T1.member_id;
SELECT T1.expense_description FROM `expense` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'
SELECT T2.zip FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost < 50 GROUP BY T2.zip
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'
SELECT T1.position FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Business') AND t_shirt_size = 'Medium'
SELECT T2.type FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.remaining > 30
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event  =  T2.event_id WHERE T2.event_date  =  '2020-03-24T12:00:00'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT (SUM(CASE WHEN T2.major_name = 'Business' THEN 1 ELSE 0 END) / COUNT(T1.member_id)) * 100 FROM member AS T1 JOIN major AS T2 ON T1.major = T2.student_major WHERE T1.position = 'Member'
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50;
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'
SELECT T1.last_name, T3.department, T3.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN major AS T3 ON T3.major_name = 'Environmental Engineering' WHERE T2.major_name = 'Environmental Engineering'
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0;
SELECT T3.city, T3.state FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T2.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'
SELECT T1.event_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.type = 'Social' AND T3.position = 'Vice President' AND T1.location = '900 E. Washington St.'
SELECT T2.last_name, T2.position FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'
SELECT T3.last_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Women''s Soccer' AND T3.position = 'Member'
SELECT CAST(SUM(IIF(T1.amount = 50, 1, 0)) AS REAL) * 100 / COUNT(T1.income_id) FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'Medium' AND T2.position = 'Member'
SELECT county FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15T00:00:00' AND '2020-03-20T23:59:59'
SELECT T2.link_to_event FROM expense AS T1 JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member WHERE T1.cost > 50
SELECT T3.member_id, T2.link_to_event FROM expense AS T1 JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major = 'rec1N0upiVLy5esTO'
SELECT T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T2.college = 'College of Agriculture and Applied Sciences'
SELECT T2.email FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost > 20 AND T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19'
SELECT COUNT(*) FROM member  JOIN major ON member.link_to_major = major.major_id  WHERE major.college = 'College of Education & Human Services' AND member.position = 'Member';
SELECT (COUNT(*) FILTER (WHERE remaining < 0) * 100.0 / COUNT(budget_id)) AS percentage_over_budget FROM budget;
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code)) * 100 AS percentage FROM zip_code;
SELECT T2.event_name, T2.location FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.remaining > 0
SELECT T3.event_name, T3.event_date FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.expense_description = 'Pizza' AND T1.cost > 50 AND T1.cost < 100
SELECT T2.first_name, T2.last_name, T3.major_name FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T1.cost > 100
SELECT T3.city, T3.county  FROM income AS T1  JOIN member AS T2 ON T1.link_to_member = T2.member_id  JOIN zip_code AS T3 ON T2.zip = T3.zip_code  GROUP BY T1.link_to_member  HAVING COUNT(T1.amount) > 40;
SELECT T2.member_id FROM (     SELECT link_to_member, COUNT(DISTINCT link_to_event) AS event_count      FROM expense      GROUP BY link_to_member     HAVING COUNT(DISTINCT link_to_event) > 1 ) AS T1  JOIN (     SELECT link_to_member, SUM(cost) AS total_cost      FROM expense      GROUP BY link_to_member ) AS T2  ON T1.link_to_member = T2.link_to_member  ORDER BY T2.total_cost DESC  LIMIT 1
SELECT AVG(e.cost) FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.position != 'Member'
SELECT T3.event_name FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T1.category = 'Parking' AND T2.cost < (SELECT AVG(T2.cost) FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T1.category = 'Parking')
SELECT SUM(CASE WHEN T1.type = 'Meeting' THEN T1.cost ELSE 0 END) / SUM(T1.cost) * 100 FROM event AS T1 JOIN club_event AS T2 ON T1.event_id = T2.event_id WHERE T1.type = 'Meeting'
SELECT T1.budget_id FROM `budget` AS T1 JOIN `expense` AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Water, chips, cookies' ORDER BY T2.cost DESC LIMIT 1
SELECT T3.first_name, T3.last_name FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN member AS T3 ON T1.link_to_member = T3.member_id GROUP BY T3.member_id ORDER BY SUM(T1.cost) DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone  FROM member AS T1  JOIN expense AS T2 ON T1.member_id = T2.link_to_member  WHERE T2.cost > (SELECT AVG(cost) FROM expense) GROUP BY T1.member_id;
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(CASE WHEN T1.position = 'Member' THEN 1 END)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(CASE WHEN T1.position = 'Member' THEN 1 END)) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code
SELECT T2.major_name, T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T2.cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'
SELECT T1.last_name, T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'
SELECT b.category, b.amount  FROM budget AS b  JOIN event AS e ON b.link_to_event = e.event_id  WHERE e.event_name = 'January Speaker';
SELECT T2.event_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'
SELECT M.first_name, M.last_name, I.amount  FROM income AS I  JOIN member AS M ON I.link_to_member = M.member_id  WHERE I.date_received = '2019-09-09'
SELECT T1.category FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Posters'
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'
SELECT T2.event_name, SUM(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts' GROUP BY T2.event_name;
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T1.zip = 28092
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN 1 ELSE NULL END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 ELSE NULL END) AS Ratio FROM customers;
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND SUBSTR(T2.Date, 1, 4) BETWEEN '201201' AND '201212' ORDER BY T2.Consumption ASC LIMIT 1
SELECT AVG(T2.Consumption) / 12 AS AverageMonthlyConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND SUBSTR(T2.Date, 1, 4) = '2013'
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND T2.Date BETWEEN '201101' AND '201112' ORDER BY T2.Consumption DESC LIMIT 1
SELECT COUNT(*)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Segment = 'KAM'  AND ym.Consumption < 30000  AND ym.Date BETWEEN '201201' AND '201212';
SELECT      (SELECT SUM(T2.Consumption) FROM `customers` AS T1 JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND SUBSTR(T2.Date, 1, 4) = '2012') -     (SELECT SUM(T2.Consumption) FROM `customers` AS T1 JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND SUBSTR(T2.Date, 1, 4) = '2012') FROM `yearmonth` WHERE 0
SELECT Date FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR') GROUP BY SUBSTR(Date, 1, 4) ORDER BY SUM(Consumption) DESC LIMIT 1;
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' GROUP BY SUBSTR(T2.Date, 1, 4) ORDER BY SUM(T2.Consumption) DESC LIMIT 1
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312' ORDER BY T2.Consumption DESC LIMIT 1
SELECT      (SELECT SUM(T2.Consumption) / COUNT(*) AS diff_SME_LAM FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND SUBSTR(T2.Date, 1, 4) = '2013') -      (SELECT SUM(T2.Consumption) / COUNT(*) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND SUBSTR(T2.Date, 1, 4) = '2013') AS diff_SME_LAM,     (SELECT SUM(T2.Consumption) / COUNT(*) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND SUBSTR(T2.Date, 1, 4) = '2013') -      (SELECT SUM(T2.Consumption) / COUNT(*) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND SUBSTR(T2.Date, 1, 4) = '2013') AS diff_LAM_KAM,     (SELECT SUM(T2.Consumption) / COUNT(*) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND SUBSTR(T2.Date, 1, 4) = '2013') -      (SELECT SUM(T2.Consumption) / COUNT(*) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND SUBSTR(T2.Date, 1, 4) = '2013') AS diff_KAM_SME WHERE      (T1.Currency = 'CZK')
SELECT T1.Segment ,  MAX((SUM(CASE WHEN SUBSTR(T2.Date, 1, 4) = '2013' THEN T2.Consumption END) - SUM(CASE WHEN SUBSTR(T2.Date, 1, 4) = '2012' THEN T2.Consumption END)) / SUM(CASE WHEN SUBSTR(T2.Date, 1, 4) = '2013' THEN T2.Consumption END) * 100) AS Max_Increase ,  MIN((SUM(CASE WHEN SUBSTR(T2.Date, 1, 4) = '2013' THEN T2.Consumption END) - SUM(CASE WHEN SUBSTR(T2.Date, 1, 4) = '2012' THEN T2.Consumption END)) / SUM(CASE WHEN SUBSTR(T2.Date, 1, 4) = '2013' THEN T2.Consumption END) * 100) AS Min_Increase FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS Difference_In_Discount_Stations;
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference;
SELECT COUNT(*) AS difference  FROM (   SELECT *    FROM customers    WHERE Segment = 'SME' AND Currency = 'CZK' ) AS czk_smes FULL OUTER JOIN (   SELECT *    FROM customers    WHERE Segment = 'SME' AND Currency = 'EUR' ) AS eur_smes ON NULL = NULL WHERE czk_smes.Segment IS NOT NULL AND eur_smes.Segment IS NULL OR (czk_smes.Segment IS NULL AND eur_smes.Segment IS NOT NULL) GROUP BY czk_smes.Segment, eur_smes.Segment HAVING COUNT(czk_smes.Segment) > COALESCE(COUNT(eur_smes.Segment), 0);
SELECT T2.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1
SELECT T2.CustomerID, MAX(T2.Consumption) AS MaxConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T2.CustomerID ORDER BY MaxConsumption DESC LIMIT 1
SELECT SUM(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T2.Date = '201305'
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'
SELECT Country, COUNT(*) AS NumberOfValueForMoneyStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY NumberOfValueForMoneyStations DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM customers  WHERE Segment = 'KAM';
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth WHERE Date LIKE '201202%'
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(GasStationID) FROM gasstations WHERE Country = 'SVK'
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date = '201206' ORDER BY T2.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'
SELECT MAX(T2.Consumption/12) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR'
SELECT T2.Description FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE DATE_FORMAT(T1.Date, '%Y%m') = '201309'
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date BETWEEN '2013-06-01' AND '2013-06-30' GROUP BY T2.Country
SELECT g.ChainID  FROM gasstations g JOIN transactions_1k t ON g.GasStationID = t.GasStationID WHERE t.CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')
SELECT T3.Description FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T2.ProductID = T3.ProductID WHERE T1.Currency = 'EUR'
SELECT AVG(Amount) FROM transactions_1k WHERE Date LIKE '2012-01%'
SELECT COUNT(*)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'
SELECT DISTINCT T1.Time FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(*)  FROM transactions_1k t1  JOIN gasstations g1 ON t1.GasStationID = g1.GasStationID  WHERE g1.Country = 'CZE' AND t1.Date > '2012-01-01';
SELECT AVG(t1.Price)  FROM transactions_1k AS t1  JOIN gasstations AS t2 ON t1.GasStationID = t2.GasStationID  WHERE t2.Country = 'CZE'
SELECT AVG(t1.Price)  FROM transactions_1k AS t1  JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID  WHERE t2.Currency = 'EUR'
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' ORDER BY Price DESC LIMIT 1;
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time ASC LIMIT 1
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.TransactionDateTime = '2012-08-23 21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.CustomerID = (SELECT MIN(CustomerID) FROM transactions_1k)
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID  =  T2.GasStationID WHERE T1.Date  =  '2012-08-24' AND T1.Time  =  '12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'
SELECT T2.Consumption ,  T2.Date FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Price = 124.05 AND T1.Date = '2012-08-24' AND T2.Date LIKE '201201%'
SELECT COUNT(*)  FROM transactions_1k t1  JOIN gasstations g ON t1.GasStationID = g.GasStationID  WHERE t1.Date = '2012-08-26'  AND t1.Time BETWEEN '08:00:00' AND '09:00:00'  AND g.Country = 'CZE';
SELECT T1.Currency FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Price = 548.4
SELECT COUNT(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE NULL END) * 100 / COUNT(T1.CustomerID) AS Percentage FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25';
SELECT (t3.Consumption - t4.Consumption) / t3.Consumption AS ConsumptionDecreaseRate FROM transactions_1k AS t1 JOIN gasstations AS t2 ON t1.GasStationID = t2.GasStationID JOIN yearmonth AS t3 ON t1.CustomerID = t3.CustomerID AND strftime('%Y', t1.Date) = '2012' JOIN yearmonth AS t4 ON t1.CustomerID = t4.CustomerID AND strftime('%Y', t1.Date) = '2013' WHERE t1.Price = 634.8 AND t1.Date = '2012-08-25';
SELECT GasStationID, SUM(Price) AS Revenue FROM transactions_1k GROUP BY GasStationID ORDER BY Revenue DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK';
SELECT SUM(T1.Price) AS Amount_Spent FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.CustomerID = 38508 AND T2.Date = '201201'
SELECT T2.Description FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T1.ProductID ORDER BY SUM(T1.Amount) DESC LIMIT 5
SELECT T1.CustomerID ,  T2.Currency ,  SUM(T2.Price) / SUM(T2.Amount) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.CustomerID ORDER BY SUM(T1.Price) DESC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1
SELECT T2.Consumption FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29.00 AND strftime('%Y%m', T1.Date) = '201208'
