SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS highest_eligible_free_rate_k_12 FROM `frpm` WHERE `County Name` = 'Alameda'
SELECT T1.School_Name,  T2.`Free Meal Count (Ages 5-17)` / T2.`Enrollment (Ages 5-17)` AS eligible_free_rate FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode  =  T2.CDSCode WHERE T1.SOCType  =  'Continuation' ORDER BY eligible_free_rate ASC LIMIT 3
SELECT T1.Zip FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County Name = 'Fresno' AND T2.`Charter School (Y/N)` = 1 AND T1.District = 'Fresno County Office of Education'
SELECT T1.MailStreet FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FRPMCount_K_12 = (SELECT MAX(FRPMCount_K_12) FROM frpm)
SELECT T1.Phone FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter Funding Type = 'Directly funded' AND T1.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM satscores WHERE `AvgScrMath` > 400 AND `cds` IN (SELECT `CDSCode` FROM `schools` WHERE `Virtual` = 'F')
SELECT T1.School FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr > 500 AND T1.Magnet = 1
SELECT T3.Phone FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T2.NumGE1500 > 0 ORDER BY T2.NumTstTakr DESC LIMIT 1
SELECT T2.NumTstTakr FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.FRPMCount_K_12 = (SELECT MAX(FRPMCount_K_12) FROM frpm)
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode JOIN frpm AS T3 ON T2.CDSCode = T3.CDSCode WHERE T1.AvgScrMath > 560 AND T3.FundingType = 'Directly funded' AND T2.Charter = 1
SELECT T2.FRPM_Count__Ages_5_17_ FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores)
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500
SELECT MAX(T2.`Percent (%) Eligible Free (Ages 5-17)`) FROM `satscores` AS T1 JOIN `frpm` AS T2 ON T1.cds = T2.CDSCode WHERE CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr > 0.3
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 / T2.NumTstTakr IN (SELECT T2.NumGE1500 / T2.NumTstTakr FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.NumGE1500 / T2.NumTstTakr DESC LIMIT 3)
SELECT T2.NCESSchool FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T2.District FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' AND T1.rtype = 'D' GROUP BY T2.District ORDER BY AVG(T1.AvgScrRead) DESC LIMIT 1
SELECT COUNT(*) FROM satscores WHERE NumTstTakr < 100 AND cds IN (SELECT CDSCode FROM schools WHERE County = 'Alameda')
SELECT T2.School, T2.CharterNum FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite > 499 ORDER BY T1.AvgScrWrite DESC WHERE T2.CharterNum IS NOT NULL
SELECT COUNT(*) FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.CountyName = 'Fresno' AND frpm.Charter Funding Type = 'Directly funded' AND satscores.NumTstTakr <= 250;
SELECT T3.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode JOIN (SELECT cds, MAX(AvgScrMath) AS max_math FROM satscores) AS T4 ON T1.cds = T4.cds WHERE T1.AvgScrMath = T4.max_math
SELECT COUNT(*) FROM frpm WHERE County_Name = 'Amador' AND Low_Grade = '9' AND High_Grade = '12'
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `FRPM Count (K-12)` < 700
SELECT s.School, s.District, s.County, MAX(sa.NumTstTakr) AS Max_Test_Takers FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds WHERE s.County = 'Contra Costa' GROUP BY s.School ORDER BY Max_Test_Takers DESC LIMIT 1;
SELECT T2.School, T2.Street, T2.City, T2.Zip FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` > 30
SELECT T1.School FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode = T3.cds WHERE T2.`Percent (%) Eligible Free (K-12)` > 0.1 AND T3.NumGE1500 >= 1500
SELECT T3.FundingType FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T3.County = 'Riverside' AND T2.AvgScrMath > 400 GROUP BY T3.FundingType HAVING AVG(T2.AvgScrMath) > 400
SELECT T1.School, T1.Street, T1.City, T1.State, T1.Zip FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Percent (%) Eligible FRPM (Ages 5-17)` > 800 AND T1.County = 'Monterey' AND T2.`High Grade` >= '15' AND T2.`Low Grade` <= '17' AND T1.SOCType = 'High Schools (Public)'
SELECT T2.School, T1.AvgScrWrite, T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.OpenDate > '1991-01-01' OR T2.ClosedDate < '2000-01-01'
SELECT T1.School, T1.DOCType FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FundingType = 'Locally funded' AND T2.Enrollment_K_12 - T2.Enrollment__Ages_5_17 > (SELECT AVG(Enrollment_K_12 - Enrollment__Ages_5_17) FROM frpm WHERE FundingType = 'Locally funded')
SELECT T1.OpenDate FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Low Grade` = 'K' AND T2.`High Grade` = '12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.Enrollment_K_12 ASC LIMIT 5
SELECT `Percent (%) Eligible Free (K-12)` FROM `frpm` ORDER BY `Enrollment (K-12)` DESC LIMIT 10,2
SELECT T1.School, T2.`Percent (%) Eligible FRPM (K-12)` FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOCType = '66' AND T2.`High Grade` = '12' ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 5
SELECT T1.Website, T1.School FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT T1.School, T1.`Percent (%) Eligible Free (Ages 5-17)` FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson'
SELECT T1.AdmEmail1 FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 ORDER BY T2.`Enrollment (K-12)` ASC LIMIT 1
SELECT T3.AdmFName1, T3.AdmLName1 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T1.NumGE1500 >= 1500 ORDER BY T1.NumGE1500 DESC LIMIT 1;
SELECT T3.Street, T3.City, T3.Zip, T3.State FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T1.NumGE1500 / T1.NumTstTakr = (SELECT MIN(NumGE1500 / NumTstTakr) FROM satscores)
SELECT T1.Website FROM `schools` AS T1 JOIN `satscores` AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Los Angeles' AND T2.NumTstTakr BETWEEN 2000 AND 3000
SELECT AVG(T2.NumTstTakr) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND strftime('%Y', T1.OpenDate) = '1980'
SELECT T3.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode JOIN frpm AS T3 ON T2.CDSCode = T3.CDSCode WHERE T2.District = 'Fresno Unified' ORDER BY T1.AvgScrRead LIMIT 1
SELECT T2.School  FROM satscores AS T1  JOIN schools AS T2  ON T1.cds = T2.CDSCode  WHERE T2.Virtual = 'F'  GROUP BY T2.County, T2.School  ORDER BY AVG(T1.AvgScrRead) DESC  LIMIT 5;
SELECT T3.SchoolType FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode JOIN frpm AS T3 ON T1.cds = T3.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT T2.AvgScrMath, T1.County FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite = (SELECT MIN(T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds)
SELECT T2.City, T1.AvgScrWrite FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT T2.School,  AVG(T1.AvgScrWrite) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds  =  T2.CDSCode WHERE T2.AdmFName1  =  'Ricci' AND T2.AdmLName1  =  'Ulrich' GROUP BY T2.School
SELECT s.School, s.City, s.County, s.State, fr.Enrollment_K_12  FROM schools s  JOIN frpm fr ON s.CDSCode = fr.CDSCode  WHERE s.DOC = '31' AND fr.LowGrade = 'K' AND fr.HighGrade = '12'  ORDER BY fr.Enrollment_K_12 DESC  LIMIT 1;
SELECT COUNT(T1.School) / 12 AS Monthly_Average FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Alameda' AND T1.OpenDate LIKE '1980%' AND T1.DOC = '52'
SELECT CAST(SUM(CASE WHEN T1.DOC = '54' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.DOC = '52' THEN 1 ELSE 0 END) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Orange'
SELECT T2.County,  T1.School,  T1.ClosedDate FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Street FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 6,1;
SELECT T2.MailStreet, T1.Sname FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead IS NOT NULL ORDER BY T1.AvgScrRead ASC LIMIT 1;
SELECT COUNT(T1.cds) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite >= 1500 AND T2.MailCity = 'Lakeport'
SELECT SUM(t2.NumTstTakr) FROM schools AS t1 JOIN satscores AS t2 ON t1.CDSCode = t2.cds WHERE t1.MailCity = "Fresno"
SELECT T1.MailZip FROM schools AS T1 INNER JOIN (SELECT AdmEmail1 FROM schools WHERE AdmEmail1 = 'avetik@atoian.com') AS T2 ON T1.AdmEmail1 = T2.AdmEmail1
SELECT CAST(COUNT(CASE WHEN T1.County = 'Colusa' THEN T1.CDSCode ELSE NULL END) AS REAL) / COUNT(CASE WHEN T1.County = 'Humboldt' THEN T1.CDSCode ELSE NULL END) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.MailState = 'CA'
SELECT COUNT(*) FROM schools WHERE `StatusType` = 'Active' AND `MailState` = 'CA' AND `MailCity` = 'San Joaquin'
SELECT T2.Phone, T2.Ext FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite IN (SELECT AvgScrWrite FROM satscores ORDER BY AvgScrWrite DESC LIMIT 333 OFFSET 1)
SELECT T1.Phone, T1.Ext, T1.School FROM schools AS T1 WHERE T1.Zip = '95203-3704'
SELECT T1.Website FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Mike' AND T1.AdmLName1 = 'Larson' AND T1.AdmFName2 = 'Dante' AND T1.AdmLName2 = 'Alvarez'
SELECT T1.Website FROM `schools` AS T1 INNER JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Virtual = 'P' AND T1.County = 'San Joaquin' AND T1.Charter = 1
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = '52' AND Charter = 1
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Charter School (Y/N)` = 0 AND `Percent (%) Eligible Free (K-12)` < 0.18
SELECT T1.AdmFName1, T1.AdmLName1, T1.School, T1.City FROM `schools` AS T1 INNER JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Charter = 1 AND T2.CharterSchoolNumber = '00D2'
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'
SELECT CAST(SUM(CASE WHEN T1.FundingType = 'Locally funded' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Santa Clara' AND T1.Charter = 1 AND T2.Charter Funding Type!= 'Not a charter school'
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT SUM(Enrollment) AS Total_Closure FROM schools WHERE City = 'San Francisco' AND strftime('%Y', ClosedDate) = '1989'; 
SELECT T1.County FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = '11' AND T1.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY T1.County ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.NCESDist FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = '31'
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND DOCType = 'District Community Day School' AND StatusType IN ('Active', 'Closed')
SELECT District FROM schools WHERE Magnet = 0 AND City = 'Fresno'
SELECT T1.`Enrollment (Ages 5-17)` FROM `frpm` AS T1 JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Academic Year` = '2014-2015' AND T2.City = 'Fremont' AND T2.EdOpsCode = 'SSS'
SELECT T1.FRPM_Count_Ages_5_17 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority School' AND T2.MailStreet = 'PO Box 1040'
SELECT T1.LowGrade FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.NCESDist = '0613360' AND T2.EdOpsCode = 'SPECON'
SELECT T1.School,  T3.Educational_Option_Type FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode  =  T2.CDSCode JOIN satscores AS T3 ON T1.CDSCode  =  T3.cds WHERE T2.County_Code  =  '37' AND T2.NSLP_Provision_Status  =  'Breakfast Provision 2'
SELECT T1.City FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Merced' AND T2.Low Grade = '9' AND T2.High Grade = '12' AND T2.NSLP Provision Status = 'Breakfast Provision 2' AND T1.EILCode = 'HS'
SELECT T1.School, (T1.`FRPM Count (Ages 5-17)` / T1.`Enrollment (Ages 5-17)` * 100) AS 'Percent (%) Eligible FRPM (Ages 5-17)' FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.`Low Grade` = 'K' AND T1.`High Grade` = '9'
SELECT GSserved, COUNT(*) AS count FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY count DESC LIMIT 1
SELECT County,  COUNT(*) AS num_schools FROM schools WHERE Virtual = 'F' AND (County = 'San Diego' OR County = 'Santa Barbara') GROUP BY County ORDER BY num_schools DESC LIMIT 1
SELECT T1.School, T1.Latitude FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Latitude = (SELECT MAX(Latitude) FROM schools)
SELECT T1.City, T1.School, T1.GSserved FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' ORDER BY T1.Latitude LIMIT 1
SELECT T1.GSoffered FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T1.Longitude) = (SELECT MAX(ABS(Longitude)) FROM schools)
SELECT COUNT(*),  T1.City FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode  =  T2.CDSCode WHERE T1.Magnet  =  1 AND T2.`Low Grade` = 'K' AND T2.`High Grade` = '8' AND T2.`NSLP Provision Status` = 'Multiple Provision Types' GROUP BY T1.City
SELECT AdmFName1, District, COUNT(*) AS frequency  FROM schools  GROUP BY AdmFName1, District  ORDER BY frequency DESC  LIMIT 2;
SELECT T1.District_Code, T1.`Percent (%) Eligible Free (K-12)` FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.AdmFName1 = 'Alusine' OR T2.AdmFName2 = 'Alusine' OR T2.AdmFName3 = 'Alusine'
SELECT T1.AdmLName1, T1.District, T1.County, T1.School  FROM schools AS T1  JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode  WHERE T2.Charter School Number = '0040'
SELECT T1.AdmEmail1, T1.AdmEmail2, T1.AdmEmail3 FROM schools AS T1 WHERE T1.County = 'San Bernardino' AND T1.City = 'San Bernardino City Unified' AND T1.OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (T1.SOC = '62' OR T1.DOC = '54') AND T1.StatusType = 'Active' AND T1.SchoolType IN ('Intermediate/Middle Schools (Public)', 'Unified Schools (Public)')
SELECT T3.AdmEmail1 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) AND T1.rtype = 'D' AND T2.StatusType = 'Active' AND T3.StatusType = 'Active'
SELECT COUNT(*) FROM `account` JOIN `district` ON `account.district_id` = `district.district_id` WHERE `account.frequency` = 'POPLATEK PO OBRATU' AND `district.A3` = 'East Bohemia'
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Praha'
SELECT      CASE          WHEN AVG(T1.A13) > AVG(T1.A12) THEN '1996'         ELSE '1995'     END AS year_with_higher_unemployment FROM district AS T1;
SELECT COUNT(*) FROM district WHERE district_id IN (SELECT district_id FROM client WHERE gender = 'F') AND A11 BETWEEN 6000 AND 10000;
SELECT COUNT(*) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000;
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' ORDER BY T2.birth_date ASC, T1.district_id LIMIT 1, (SELECT MAX(T1.A11) - MIN(T1.A11) FROM district AS T1)
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date = (SELECT MIN(T2.birth_date) FROM client AS T2 JOIN account AS T1 ON T2.district_id = T1.district_id) AND T2.district_id IN (SELECT district_id FROM district ORDER BY A11 DESC LIMIT 1)
SELECT COUNT(*) FROM `disp` WHERE `type` = 'OWNER' AND `account_id` IN (SELECT `account_id` FROM `account` WHERE `frequency` = 'POPLATEK TYDNE')
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK PO OBRATU' AND T2.type = 'DISPONENT'
SELECT T1.account_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1997%' AND T1.frequency = 'POPLATEK TYDNE' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 12 AND T1.date LIKE '1993%' ORDER BY T2.amount DESC LIMIT 1;
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Sokolov')
SELECT account_id FROM trans WHERE date BETWEEN '1995-01-01' AND '1995-12-31' ORDER BY date ASC LIMIT 1;
SELECT T1.account_id FROM `account` AS T1 JOIN `trans` AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T2.balance > 3000 GROUP BY T1.account_id
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T3.disp_id = T2.disp_id WHERE T3.issued = '1994-03-03'
SELECT T1.date FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'
SELECT T1.district_id FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date = '1994-08-25'
SELECT MAX(T3.amount) FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.issued = '1996-10-21'
SELECT T.gender FROM ( SELECT T1.gender, T1.district_id FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A11 = ( SELECT MAX(A11) FROM district ) ORDER BY T1.birth_date ASC LIMIT 1 ) AS T JOIN disp AS T3 ON T.client_id = T3.client_id JOIN account AS T4 ON T3.account_id = T4.account_id JOIN district AS T5 ON T4.district_id = T5.district_id WHERE T5.A11 = ( SELECT MAX(A11) FROM district )
SELECT T1.amount FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.account_id = (SELECT T3.account_id FROM loan AS T3 WHERE T3.amount = (SELECT MAX(T4.amount) FROM loan AS T4)) ORDER BY T1.date LIMIT 1
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik') AND client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')))
SELECT T1.disp_id FROM disp AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 5100 AND T2.date = '1998-09-02'
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND strftime('%Y', account.date) = '1996'
SELECT T3.A2 FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T3.birth_date FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03'
SELECT T1.account_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1
SELECT CAST(SUM(IIF(T1.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 ='south Bohemia' AND T2.A4 = (SELECT MAX(A4) FROM district WHERE A3 ='south Bohemia')
SELECT ((SELECT T2.balance - T3.balance FROM (SELECT MAX(loan_id) AS max_loan_id FROM loan WHERE date = '1993-07-05') AS T1 JOIN (SELECT * FROM trans WHERE date = '1998-12-27') AS T2 ON T1.max_loan_id = T2.account_id JOIN (SELECT * FROM trans WHERE date = '1993-03-22') AS T3 ON T1.max_loan_id = T3.account_id) / (SELECT balance FROM trans WHERE date = '1993-03-22')) * 100
SELECT CAST(SUM(CASE WHEN T2.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1 JOIN `order` AS T2 ON T1.loan_id = T2.order_id
SELECT CAST(SUM(CASE WHEN T2.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T2.amount < 100000 AND T2.status = 'C'
SELECT T1.account_id, T3.A2, T3.A3 FROM account AS T1 JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.date LIKE '1993%' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T1.account_id, T1.frequency FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A3 = 'east Bohemia' AND strftime('%Y', T1.date) BETWEEN '1995' AND '2000'
SELECT T1.account_id,  T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id  =  T2.district_id WHERE T2.A2  =  'Prachatice'
SELECT T3.A2, T3.A3 FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990;
SELECT T1.account_id, T4.A2, T4.A3 FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T4 ON T2.district_id = T4.district_id WHERE T1.amount > 300000;
SELECT T5.loan_id,  T4.A3,  T4.A11 FROM loan AS T1 JOIN account AS T2 ON T1.account_id  =  T2.account_id JOIN disp AS T3 ON T2.account_id  =  T3.account_id JOIN district AS T4 ON T4.district_id  =  T3.client_id WHERE T1.duration  =  60
SELECT T3.A3, ((T3.A13 - T3.A12) / T3.A12) * 100 AS unemployment_increment_rate FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.status = 'D' AND T1.duration + T1.date >= DATE('1995-01-01') AND T1.duration + T1.date <= DATE('1996-12-31')
SELECT CAST(SUM(IIF(T2.A2 = 'Decin', 1, 0)) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T2.A2, COUNT(*) AS FemaleAccountHolders FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.A2 ORDER BY FemaleAccountHolders DESC LIMIT 9;
SELECT T5.A2, SUM(T4.amount) AS total_withdrawals FROM trans AS T4 JOIN account AS T3 ON T4.account_id = T3.account_id JOIN disp AS T2 ON T3.account_id = T2.account_id JOIN client AS T1 ON T2.client_id = T1.client_id JOIN district AS T5 ON T1.district_id = T5.district_id WHERE T4.type = 'VYDAJ' AND T4.date LIKE '1996-01%' GROUP BY T5.A2 ORDER BY total_withdrawals DESC LIMIT 10;
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'South Bohemia') AND client_id NOT IN (SELECT client_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card))
SELECT T3.A3 FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.status IN('C', 'D') GROUP BY T3.A3 ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T3.amount) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T3.account_id = T2.account_id WHERE T1.gender = 'M'
SELECT A2, A13 FROM district ORDER BY A13 DESC LIMIT 1;
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1) AND strftime('%Y', date) = '1996'
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK MESICNE' AND account_id IN (SELECT account_id FROM trans WHERE operation = 'VYBER KARTOU' AND balance < 0)
SELECT COUNT(*) FROM loan JOIN account ON loan.account_id = account.account_id WHERE loan.amount >= 250000 AND account.frequency = 'POPLATEK MESICNE' AND loan.date BETWEEN '1995-01-01' AND '1997-12-31' AND loan.status = 'A'
SELECT COUNT(*) FROM account WHERE district_id = 1 AND frequency = 'POPLATEK MESICNE' AND date IN (SELECT date FROM trans WHERE type = 'PRIJEM' AND operation = 'VKLAD') AND account_id IN (SELECT account_id FROM loan WHERE status IN ('C', 'D'))
SELECT COUNT(T1.client_id) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A15 = (SELECT A15 FROM district ORDER BY A15 DESC LIMIT 1, 1)
SELECT COUNT(*) FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER'
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Pisek'
SELECT T3.A2 FROM `trans` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `district` AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 10000 AND T1.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY T3.A2
SELECT T1.account_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T1.district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek')
SELECT T1.account_id FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'gold'
SELECT AVG(t1.amount) FROM trans t1 WHERE t1.type = 'VYBER KARTOU' AND strftime('%Y', t1.date) = '2021' GROUP BY strftime('%m', t1.date)
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN trans AS T4 ON T3.account_id = T4.account_id WHERE T4.date LIKE '1998%' AND T4.type = 'VYBER KARTOU' AND T4.amount < (SELECT AVG(amount) FROM trans WHERE date LIKE '1998%' AND type = 'VYBER KARTOU')
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'F'
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE A3 ='south Bohemia') AND client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM account))
SELECT T1.account_id FROM `disp` AS T1 JOIN `client` AS T2 ON T1.client_id = T2.client_id JOIN `district` AS T3 ON T2.district_id = T3.district_id WHERE T3.A2 = 'Tabor' AND T1.type = 'OWNER'
SELECT T1.type FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A11 > 8000 AND T3.A11 <= 9000 AND T1.type!= 'OWNER'
SELECT COUNT(T1.account_id) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 = 'North Bohemia' AND T2.bank = 'AB'
SELECT T3.A2 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(T1.A15) FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND STRFTIME('%Y', T2.date) >= '1997'
SELECT COUNT(*) FROM card WHERE card_id IN (SELECT T1.card_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'classic' AND T2.type = 'OWNER')
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha')
SELECT CAST(SUM(CASE WHEN T1.type = 'gold' AND strftime('%Y', T1.issued) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.type) FROM card AS T1
SELECT T1.client_id FROM disp AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.type = 'OWNER' ORDER BY T2.amount DESC LIMIT 1
SELECT T2.A15 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532;
SELECT T2.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333;
SELECT T1.trans_id, T1.date, T1.amount, T1.balance FROM `trans` AS T1 JOIN `disp` AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 3356 AND T1.type = 'VYBER'
SELECT COUNT(*) FROM `account` WHERE `account_id` IN (SELECT `account_id` FROM `loan` WHERE `amount` < 200000) AND `frequency` = 'POPLATEK TYDNE'
SELECT T3.type FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T3.disp_id = T2.disp_id WHERE T1.client_id = 13539
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT T3.A3 FROM `loan` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `district` AS T3 ON T2.district_id = T3.district_id WHERE T1.status = 'A' GROUP BY T3.A3 ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN `order` AS T4 ON T3.account_id = T4.account_id WHERE T4.order_id = 32423;
SELECT T3.* FROM district AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN trans AS T3 ON T3.account_id = T2.account_id WHERE T1.district_id = 5
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Jesenik')
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T3.type = 'junior' AND T3.issued >= '1997-01-01'
SELECT CAST(SUM(IIF(T1.gender = 'F', 1, 0)) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A11 > 10000
SELECT 100 * (SUM(CASE WHEN strftime('%Y', T2.date) = '1997' THEN T2.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 0 END)) / SUM(CASE WHEN strftime('%Y', T2.date) = '1996' THEN T2.amount ELSE 1 END) AS growth_rate FROM disp AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T3.gender = 'M'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'
SELECT (SELECT `A16` FROM `district` WHERE `A3` = 'north Bohemia') - (SELECT `A16` FROM `district` WHERE `A3` = 'East Bohemia')
SELECT COUNT(*), T1.type FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.account_id BETWEEN 1 AND 10 AND T1.type IN ('OWNER', 'DISPONENT') GROUP BY T1.type
SELECT COUNT(*), k_symbol FROM trans WHERE account_id = 3 AND k_symbol = 'VYTVORENI VYUCA' UNION SELECT COUNT(*), k_symbol FROM trans WHERE amount = 3539 AND operation = 'SR'
SELECT T3.birth_date FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T1.disp_id = 130;
SELECT COUNT(*) FROM `account` WHERE `frequency` = 'POPLATEK PO OBRATU' AND `account_id` IN (SELECT `account_id` FROM `disp` WHERE `type` = 'OWNER')
SELECT SUM(T3.amount), T3.status FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 992
SELECT T4.balance,  T3.gender FROM trans AS T1 JOIN disp AS T2 ON T1.account_id  =  T2.account_id JOIN client AS T3 ON T3.client_id  =  T2.client_id WHERE T3.client_id  =  4 AND T1.trans_id  =  851;
SELECT T1.type FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 9
SELECT SUM(T2.amount) FROM `trans` AS T2 JOIN `account` AS T1 ON T1.account_id = T2.account_id JOIN `disp` AS T3 ON T3.account_id = T1.account_id JOIN `client` AS T4 ON T4.client_id = T3.client_id WHERE T4.client_id = 617 AND strftime('%Y', T2.date) = '1998'
SELECT T1.client_id FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T2.A3 = 'East Bohemia'
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN loan AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'F' ORDER BY T4.amount DESC LIMIT 3
SELECT COUNT(*) FROM `client` c JOIN `account` a ON c.district_id = a.district_id JOIN `order` o ON a.account_id = o.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND o.k_symbol = 'SIPO' AND o.amount > 4000;
SELECT COUNT(*) FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Beroun' AND T1.date > '1996-01-01'
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE c.gender = 'F' AND cr.type = 'junior'
SELECT CAST(SUM(IIF(T1.gender = 'F', 1, 0)) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'Prague'
SELECT CAST(SUM(IIF(T1.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.frequency = 'POPLATEK TYDNE'
SELECT COUNT(*) FROM `disp` WHERE `type` = 'OWNER' AND `account_id` IN (SELECT `account_id` FROM `account` WHERE `frequency` = 'POPLATEK TYDNE')
SELECT T1.account_id FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 24 AND T1.date < '1997-01-01' ORDER BY T2.amount ASC LIMIT 1;
SELECT T3.account_id FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN disp AS T3 ON T2.client_id = T3.client_id WHERE T2.gender = 'F' ORDER BY T2.birth_date,  T1.A11 LIMIT 1
SELECT COUNT(*) FROM client WHERE birth_date LIKE '1920%' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'east Bohemia')
SELECT COUNT(*) FROM loan WHERE duration = 24 AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK TYDNE')
SELECT AVG(T1.amount) FROM loan AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.status IN('C', 'D') AND T2.type = 'POPLATEK PO OBRATU'
SELECT T1.client_id,  T3.A2 FROM `disp` AS T1 JOIN `client` AS T2 ON T1.client_id  =  T2.client_id JOIN `district` AS T3 ON T2.district_id  =  T3.district_id WHERE T1.type  =  'OWNER'
SELECT T1.client_id,  (YEAR(CURDATE()) - YEAR(T1.birth_date)) AS age FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T3.disp_id = T2.disp_id WHERE T3.type = 'gold' AND T2.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl'
SELECT AVG(T1.element = 'o') FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-'
SELECT AVG(T3.COUNT) FROM (SELECT T1.molecule_id, COUNT(*) AS COUNT FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-' GROUP BY T1.molecule_id) AS T3 JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T4.label = '+'
SELECT COUNT(*) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'na'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' AND T1.label = '+' GROUP BY T1.molecule_id HAVING COUNT(*) >= 3
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element!= 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' GROUP BY T1.molecule_id
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR004_8_9' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9'
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.bond_type = '='
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl'
SELECT T1.atom_id, T3.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id2 JOIN bond AS T4 ON T4.bond_id = T2.bond_id WHERE T4.bond_type = '-'
SELECT T3.atom_id, T4.atom_id2 FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id JOIN atom AS T4 ON T3.atom_id2 = T4.atom_id WHERE T1.label = '-'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20') OR (T1.atom_id = 'TR004_20' AND T1.atom_id2 = 'TR004_8')
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element!='sn' GROUP BY T1.label HAVING COUNT(*) = (SELECT COUNT(*) FROM molecule) - (SELECT COUNT(*) FROM molecule WHERE label = '+' OR label = '-')
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE (a.element = 'i' OR a.element ='s') AND b.bond_type = '-'
SELECT T1.atom_id, T3.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T4.bond_type = '#'
SELECT T3.atom_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id2 WHERE T1.molecule_id = 'TR181' AND T3.atom_id!= T3.atom_id2
SELECT CAST(SUM(IIF(T1.element!= 'f', 1, 0)) AS REAL) * 100 / COUNT(DISTINCT T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR000' ORDER BY T1.element ASC LIMIT 3
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_2_6' AND T1.atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR001') AND T2.atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR001')
SELECT ABS((SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-')) AS difference;
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' ORDER BY T1.molecule_id LIMIT 5
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS percent FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule;
SELECT ROUND(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) * 100.0 / COUNT(atom_id), 4) as percent FROM atom WHERE molecule_id = 'TR206'
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000'
SELECT T1.element, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'
SELECT T2.bond_type,  T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR010' GROUP BY T2.bond_type ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' ORDER BY T1.molecule_id LIMIT 3
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' ORDER BY T2.bond_id LIMIT 2
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009')
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'br') AND label = '+'
SELECT T2.bond_type,  T1.atom_id,  T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'
SELECT T1.molecule_id, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19'
SELECT T1.element FROM `atom` AS T1 INNER JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT DISTINCT T2.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T3.label = '+'
SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T4 ON T2.atom_id2 = T4.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN atom AS T5 ON T4.atom_id = T5.atom_id WHERE T1.element = 'p' AND T5.element = 'n' UNION SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T4 ON T2.atom_id2 = T4.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN atom AS T5 ON T4.atom_id = T5.atom_id WHERE T1.element = 'n' AND T5.element = 'p'
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT AVG(T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'i'
SELECT T2.bond_type, T2.bond_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T1.atom_id, 7, 2) AS INTEGER) + 0 = 45
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected) AND atom_id NOT IN (SELECT atom_id2 FROM connected)
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' AND T2.molecule_id = 'TR041'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR144_8_19'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(T1.atom_id) ASC LIMIT 1
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T1.element = 'pb'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '#'
SELECT CAST(COUNT(T3.bond_id) AS REAL) * 100 / SUM(COUNT(T1.atom_id)) OVER () FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE (T1.element, T4.element) IN (SELECT element, element2 FROM (SELECT T1.element AS element, T4.element AS element2, COUNT(*) AS cnt FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id GROUP BY T1.element, T4.element ORDER BY cnt DESC LIMIT 1)) GROUP BY T3.bond_id
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' GROUP BY b.bond_type HAVING b.bond_type = '-' LIMIT 1;
SELECT COUNT(*) FROM atom WHERE `element` IN('c', 'h')
SELECT T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element ='s'
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element ='sn'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT COUNT(*) FROM atom JOIN connected ON atom.atom_id = connected.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#' AND (atom.element = 'p' OR atom.element = 'br')
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.molecule_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11'
SELECT COUNT(*) FROM bond WHERE bond_id IN (SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.atom_id2 = T3.atom_id2 WHERE T1.element = 'i')
SELECT MAX(T2.label) AS carcinogenicity FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca'
SELECT COUNT(*) > 0 FROM `connected`  JOIN `atom` ON `connected`.`atom_id` = `atom`.`atom_id`  JOIN `atom` AS atom2 ON `connected`.`atom_id2` = atom2.`atom_id`  WHERE `connected`.`bond_id` = 'TR001_1_8'  AND (`atom`.`element` = 'cl' AND atom2.`element` = 'c'  OR `atom`.`element` = 'c' AND atom2.`element` = 'cl')
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.label = '-' AND T2.bond_type = '#' AND T3.element = 'c' LIMIT 2
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR001'
SELECT T1.molecule_id FROM bond AS T1 WHERE T1.bond_type = '='
SELECT T1.atom_id AS atom_id1, T2.atom_id AS atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN bond AS T3 ON T3.bond_id = T1.bond_id WHERE T3.bond_type = '#'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-'
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT b.bond_id, m.label  FROM bond AS b  JOIN molecule AS m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND m.label IN ('+', '-')
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND SUBSTR(T1.atom_id, 7, 1) = '4'
SELECT T2.label,  SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) * 1.0 / COUNT(T1.element) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' GROUP BY T2.label
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca'
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c'
SELECT T1.element AS atom1_element, T3.element AS atom2_element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T2.atom_id2 = T3.atom_id WHERE T2.bond_id = 'TR001_10_11'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id;
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR047'
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.atom_id = 'TR001_1'
SELECT (CASE WHEN (SELECT label FROM molecule WHERE molecule_id = 'TR151') = '+' THEN 'Yes' ELSE 'No' END)
SELECT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'br', 'pb', 'te', 'na','sn', 'ca')
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c'
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '='
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' AND molecule.label = '+'
SELECT T2.molecule_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND molecule.label = '-'
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT COUNT(*) > 0 FROM molecule WHERE molecule_id = 'TR124' AND label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR186'
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR007_4_19'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_2_4'
SELECT COUNT(*),  T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' AND T2.molecule_id = 'TR006' AND T2.label = '+'
SELECT T1.molecule_id, T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T3.bond_id, T1.atom_id, T2.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT m.molecule_id, GROUP_CONCAT(a.element) as elements  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id  WHERE b.bond_type = '#'  GROUP BY m.molecule_id;
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*)  FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE a.element = 'cl'
SELECT T1.atom_id,  COUNT(DISTINCT T3.bond_type) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id
SELECT COUNT(DISTINCT T2.molecule_id),  SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '='
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element!='s' AND T3.bond_type!= '='
SELECT T3.label FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+'
SELECT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl'
SELECT T2.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_3_4'
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2'
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE (T2.atom_id = 'TR000_2' AND T2.atom_id2 = 'TR000_4') OR (T2.atom_id = 'TR000_4' AND T2.atom_id2 = 'TR000_2')
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `atom` WHERE `element` = 'n') AND `label` = '+'
SELECT T1.molecule_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element ='s' AND T3.bond_type = '='
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T2.atom_id) > 5
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'
SELECT T1.label, T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id JOIN bond AS T4 ON T2.bond_id = T4.bond_id WHERE T1.element = 'h' AND T4.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (SELECT T2.molecule_id FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'o' AND T2.bond_type = '=')
SELECT COUNT(*) FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '#') AND label = '-'
SELECT T1.element, T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'c' AND T3.bond_type = '=' AND T1.molecule_id = 'TR012'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT name FROM cards WHERE borderColor IS NULL AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;
SELECT c.name FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity ='mythic' AND l.status = 'Banned' AND l.format = 'gladiator'
SELECT T1.name, T2.status FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Artifact' AND T1.side IS NULL AND T2.format = 'vintage'
SELECT T1.id, T1.artist FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.power = '*' OR T1.power IS NULL AND T2.format = 'commander' AND T2.status = 'Legal'
SELECT c.id, r.text, c.hasContentWarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;
SELECT T2.text FROM `cards` AS T1 JOIN `rulings` AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T2.uuid ORDER BY COUNT(T2.uuid) DESC LIMIT 1;
SELECT T2.language FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT T1.name FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM set_translations AS T2 WHERE T2.setCode IN (SELECT T1.setCode FROM cards AS T1)
SELECT T2.translation, T1.totalSetSize FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian'
SELECT COUNT(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM `cards` WHERE `power` = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT `borderColor` FROM `cards` WHERE `name` = 'Ancestor''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor\'s Chosen'
SELECT T3.language FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Angel of Mercy' GROUP BY T3.language
SELECT COUNT(*) FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Restricted' AND T2.isTextless = 0;
SELECT T2.text FROM `cards` AS T1 JOIN `rulings` AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'
SELECT COUNT(*) FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status ='restricted' AND T2.isStarter = 1
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT `type` FROM `cards` WHERE `name` = 'Benalish Knight'
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T2.artist FROM `foreign_data` AS T1 JOIN `cards` AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Phyrexian' GROUP BY T2.artist
SELECT CAST(SUM(IIF(borderColor = 'borderless', 1, 0)) AS REAL) * 100 / COUNT(id) FROM cards
SELECT COUNT(*) FROM cards WHERE `language` = 'German' AND `isReprint` = 1;
SELECT COUNT(*) FROM cards c JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian'
SELECT CAST(SUM(IIF(T2.language = 'French', 1, 0)) AS REAL) * 100 / COUNT(T1.id) FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1
SELECT COUNT(*) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'black' AND `availability` ='mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT T1.layout FROM `cards` AS T1 INNER JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.keywords LIKE '%Flying%'
SELECT COUNT(*) FROM `cards` WHERE `originalType` = 'Summon - Angel' AND `subtypes`!= 'Angel'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015' AND edhrecRank IS NOT NULL
SELECT T1.artist FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Chinese Simplified'
SELECT T1.name FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese' AND T1.availability = 'paper' GROUP BY T1.name HAVING COUNT(*) = 1
SELECT COUNT(*) FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Banned' AND T2.borderColor = 'white'
SELECT T1.uuid, T2.language FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid JOIN `legalities` AS T3 ON T1.uuid = T3.uuid WHERE T3.format = 'legacy'
SELECT T1.text FROM rulings AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Beacon of Immortality'
SELECT COUNT(*),  T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'Legal' GROUP BY T2.status
SELECT T1.name, T1.colors FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T2.code = 'OGW'
SELECT T1.name, T3.language, T3.translation FROM `cards` AS T1 JOIN `set_translations` AS T3 ON T1.setCode = T3.setCode WHERE T1.convertedManaCost = 5 AND T1.setCode = '10E'
SELECT T1.name, T2.date FROM `cards` AS T1 JOIN `rulings` AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT T1.colors,  T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20 GROUP BY T1.colors,  T2.format
SELECT c.name FROM cards AS c JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.colors = 'B' AND c.originalType LIKE '%Artifact%' AND fd.language IS NOT NULL
SELECT T1.name FROM `cards` AS T1 JOIN `rulings` AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'John Avon' AND (`cardKingdomId` IS NULL OR `cardKingdomFoilId` IS NULL)
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'UDON' AND `availability` ='mtgo' AND `hand` = '-1'
SELECT COUNT(*) FROM cards WHERE hasContentWarning = 1 AND availability = 'paper' AND frameVersion = '1993';
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability ='mtgo,paper'
SELECT SUM(CAST(REPLACE(REPLACE(manaCost, '{', ''), '}', '') AS INTEGER)) AS unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena'
SELECT T2.setCode FROM `set_translations` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.setCode WHERE T1.language = 'Spanish'
SELECT CAST(SUM(IIF(isOnlineOnly = 1, 1, 0)) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage,  id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0 GROUP BY id
SELECT T2.name,  ( SELECT CAST(COUNT(*) AS REAL) * 100 / ( SELECT COUNT(*) FROM cards ) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Spanish' ) AS percentage FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Spanish' GROUP BY T2.name
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309
SELECT COUNT(*) FROM set_translations WHERE language = 'Portuguese (Brasil)' AND setCode IN (SELECT code FROM sets WHERE block = 'Commander')
SELECT T1.id FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Legal' AND T1.types = 'Creature'
SELECT T1.supertypes, T1.subtypes FROM `cards` AS T1 INNER JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.supertypes IS NOT NULL AND T1.subtypes IS NOT NULL
SELECT COUNT(*) FROM `cards` WHERE `power` IN (NULL, '*') AND `text` LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards WHERE side IS NULL AND EXISTS(SELECT * FROM rulings WHERE rulings.uuid = cards.uuid AND rulings.text = 'This is a triggered mana ability.') AND EXISTS(SELECT * FROM legalities WHERE legalities.uuid = cards.uuid AND legalities.format = 'premodern' AND legalities.status = 'Legal')
SELECT T1.id FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'pauper' AND T1.availability = 'paper' AND T1.artist = 'Erica Yang'
SELECT T1.artist FROM `cards` AS T1 INNER JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.text = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT T2.name FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T1.layout = 'normal' AND T1.borderColor = 'black' AND T1.artist = 'Matthew D. Wilson' AND T2.language = 'French' AND T1.types = 'Creature'
SELECT COUNT(*) FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01'
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'
SELECT CAST(SUM(CASE WHEN T1.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'Legal'
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'
SELECT CAST(SUM(IIF(T2.language = 'Japanese' AND T1.type = 'expansion', 1, 0)) AS REAL) * 100 / COUNT(T2.language) FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode
SELECT `availability` FROM `cards` WHERE `artist` = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arenaleague' ORDER BY name LIMIT 3;
SELECT T2.language FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.multiverseid = 149934
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE layout = 'normal'
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%'
SELECT T2.name FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.mtgoCode IS NULL OR T1.mtgoCode = '' ORDER BY T2.translation ASC LIMIT 3;
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.code = 'ARC'
SELECT T1.name, T2.translation FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.id = 5
SELECT T1.language, T2.type FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.id = 206
SELECT T1.id, T1.code FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' ORDER BY T1.name LIMIT 2;
SELECT T1.id FROM `sets` AS T1 JOIN `cards` AS T2 ON T1.code = T2.setCode JOIN `foreign_data` AS T3 ON T2.uuid = T3.uuid WHERE T1.isForeignOnly = 1 AND T1.isFoilOnly = 1 AND T3.language = 'Japanese' GROUP BY T1.id HAVING COUNT(*) > 0
SELECT T2.translation FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.isOnlineOnly) FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Chinese Simplified'
SELECT COUNT(*) FROM sets WHERE code IN (SELECT setCode FROM set_translations WHERE language = 'Japanese') AND mtgoCode IS NULL OR mtgoCode = ''
SELECT id FROM cards WHERE borderColor = 'black'
SELECT id FROM cards WHERE frameEffects = 'extendedart'
SELECT T1.name FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T2.isNonFoilOnly = 1 AND T1.isFullArt = 1 AND T1.borderColor = 'black'
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174
SELECT T2.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.code = 'ALL'
SELECT T2.language FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block = 'Masques' OR block = 'Mirage'
SELECT setCode FROM sets WHERE type = 'expansion'
SELECT T2.translation, T1.type FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T1.watermark = 'boros'
SELECT T2.language, T2.flavorText, T1.type  FROM cards AS T1  JOIN foreign_data AS T2  ON T1.uuid = T2.uuid  WHERE T1.watermark = 'colorpie'
SELECT CAST(SUM(IIF(T1.convertedManaCost = 16, 1, 0)) AS REAL) * 100 / COUNT(T1.convertedManaCost) FROM `cards` AS T1 WHERE T1.name = 'Abyssal Horror'
SELECT setCode FROM sets WHERE type = 'expansion' AND name = 'commander'
SELECT T2.name, T1.type  FROM cards AS T1  JOIN foreign_data AS T2  ON T1.uuid = T2.uuid  WHERE T1.watermark = 'abzan'
SELECT T1.language, T1.type FROM `foreign_data` AS T1 JOIN `cards` AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM `cards` WHERE `availability` LIKE '%paper%' AND `hand` = '3'
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'white' AND (`power` = '*' OR `power` IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;
SELECT subtypes,  supertypes FROM cards WHERE name  =  'Molimo, Maro-Sorcerer'
SELECT T1.purchaseUrls FROM `cards` AS T1 INNER JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;
SELECT T1.artist FROM `cards` AS T1 WHERE T1.flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;
SELECT T3.translation FROM cards AS T1 JOIN set_translations AS T3 ON T1.setCode = T3.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T3.language = 'Italian'
SELECT COUNT(T2.translation) FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy'
SELECT T1.name FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.setCode  =  T2.setCode WHERE T2.translation  =  'Hauptset Zehnte Edition'
SELECT T2.name FROM `foreign_data` AS T1 JOIN `cards` AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.language = 'Korean'
SELECT COUNT(*) FROM cards WHERE artist = 'Adam Rex' AND setCode IN (SELECT setCode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition')
SELECT T1.baseSetSize FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT T1.setCode FROM sets AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T2.name = 'Angel of Mercy' AND T1.mtgoCode IS NOT NULL
SELECT T2.releaseDate FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'
SELECT T1.type FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ice Age' AND T2.language = 'Italian' AND T2.translation IS NOT NULL
SELECT T1.isForeignOnly FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'
SELECT COUNT(*) FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.baseSetSize < 100 AND T2.translation IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND setName = 'Coldsnap'
SELECT T1.name FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE setCode = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT * FROM cards WHERE setCode = 'Coldsnap' AND number = '4'
SELECT COUNT(*) FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
SELECT T2.flavorText FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Italian' AND T1.name = 'Ancestor''s Chosen'
SELECT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL
SELECT T2.type FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.name = 'Ancestor''s Chosen'
SELECT T2.text FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Italian' AND T1.setName = 'Coldsnap'
SELECT T2.name FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid JOIN `sets` AS T3 ON T1.setCode = T3.code WHERE T3.name = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T2.date FROM `cards` AS T1 JOIN `rulings` AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T2.name = 'Coldsnap' THEN 1 END) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT T1.mcmName FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate = '2017-06-09'
SELECT T1.type FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT T1.name, T2.text, CASE WHEN T1.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec'
SELECT T2.releaseDate FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'
SELECT T1.baseSetSize FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code  =  T2.setCode WHERE T2.translation  =  'Rinascita di Alara'
SELECT T1.type FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Huitième édition'
SELECT T3.translation FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode JOIN `sets` AS T3 ON T2.setCode = T3.code WHERE T1.name = 'Tendo Ice Bridge' AND T2.language = 'French'
SELECT COUNT(*) FROM set_translations WHERE translation IS NOT NULL AND setCode = '10E'
SELECT T3.translation FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code JOIN `set_translations` AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Fellwar Stone' AND T3.language = 'Japanese'
SELECT T1.name FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T1.releaseDate FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Ola de frío'
SELECT T2.type FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards WHERE convertedManaCost = 3 AND setCode IN (SELECT code FROM sets WHERE name = 'World Championship Decks 2004')
SELECT T2.translation FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.language = 'Portuguese (Brazil)' THEN 1 ELSE 0 END) FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Portuguese (Brazil)'
SELECT T1.printings FROM `cards` AS T1 INNER JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Aleksi Briclot' AND T1.isTextless = 1 GROUP BY T1.printings
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT artist FROM cards WHERE side IS NULL AND convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE side IS NULL)
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `hasFoil` = 0 AND `duelDeck` = 'a'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;
SELECT T1.name FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'duel' ORDER BY T1.convertedManaCost DESC LIMIT 10
SELECT T1.originalReleaseDate, T2.format FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity ='mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1
SELECT COUNT(*) FROM `cards` c JOIN `foreign_data` fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French'
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T1.types = 'Enchantment' AND T1.name = 'Abundance' AND T2.status = 'Legal' GROUP BY T1.name HAVING COUNT(*) = (SELECT COUNT(*) FROM legalities)
SELECT L.format, C.name FROM `legalities` L JOIN `cards` C ON L.uuid = C.uuid WHERE L.status = 'Banned' GROUP BY L.format ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = (SELECT artist FROM cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1)
SELECT T2.status FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '1997' AND T1.artist = 'D. Alexander Gregory' AND (T1.hasContentWarning = 1 OR T1.artist = 'Wizards of the Coast') AND T2.format = 'legacy'
SELECT T1.name, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'
SELECT AVG(T1.id), T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT T1.artist FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code WHERE T1.borderColor = 'black' AND T2.availability = 'arena'
SELECT T1.uuid FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'oldschool' AND T2.status IN ('banned','restricted')
SELECT COUNT(*) FROM `cards` WHERE `artist` = 'Matthew D. Wilson' AND `availability` = 'paper'
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC
SELECT T1.name, T3.format FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN legalities AS T3 ON T1.uuid = T3.uuid WHERE T2.name = 'Hour of Devastation' AND T3.status = 'Legal'
SELECT T1.name FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code  =  T2.setCode WHERE T2.language  =  'Korean' EXCEPT SELECT T1.name FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code  =  T2.setCode WHERE T2.language  =  'Japanese'
SELECT T1.frameVersion, T1.name, T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned'
SELECT T1.DisplayName FROM users AS T1 WHERE T1.DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY T1.Reputation DESC LIMIT 1
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT T1.DisplayName FROM `users` AS T1 JOIN `posts` AS T2 ON T1.Id = T2.OwnerUserId GROUP BY T1.Id ORDER BY SUM(T2.ViewCount) DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;
SELECT COUNT(*) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT T1.Title FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT T1.Title FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY T1.ViewCount DESC LIMIT 1
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts)
SELECT SUM(T2.CommentCount) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT T1.AnswerCount FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY T1.AnswerCount DESC LIMIT 1
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL
SELECT T1.DisplayName FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age > 65 AND T1.Score >= 20
SELECT T2.Location FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT T2.Body FROM `tags` AS T1 JOIN `posts` AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'bayesian'
SELECT T1.Body FROM `posts` AS T1 INNER JOIN `tags` AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.Count = (SELECT MAX(T3.Count) FROM `tags` AS T3)
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND strftime('%Y', Date) = '2011'
SELECT T2.DisplayName FROM (SELECT UserId, COUNT(Id) AS NumBadges FROM Badges GROUP BY UserId ORDER BY NumBadges DESC LIMIT 1) AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT CAST(COUNT(T2.Id) AS REAL) / COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Views > 200
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT T1.CreationDate FROM `votes` AS T1 JOIN (SELECT COUNT(Id) AS CNT FROM `votes` GROUP BY CreationDate ORDER BY CNT DESC LIMIT 1) AS T2 ON T1.CreationDate = T2.CreationDate
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'
SELECT T1.Title FROM `posts` AS T1 JOIN `comments` AS T2 ON T1.Id = T2.PostId WHERE T2.Score = (SELECT MAX(Score) FROM `comments`)
SELECT T2.CommentCount FROM posts AS T1 JOIN posts AS T2 ON T1.Id = T2.ParentId WHERE T1.ViewCount = 1910;
SELECT T1.FavoriteCount FROM `posts` AS T1 JOIN `comments` AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = '3025' AND T2.CreationDate = '2014-04-23 20:29:39.0'
SELECT T1.Text FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ParentId = 107829 AND T1.CommentCount = 1;
SELECT p.Id, p.Title, p.ClosedDate  FROM posts p  JOIN comments c ON p.Id = c.PostId  WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0';
SELECT T2.Reputation FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 65041
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini')
SELECT T2.DisplayName FROM votes AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347
SELECT COUNT(*) FROM votes WHERE PostId IN (SELECT Id FROM posts WHERE Title LIKE '%data visualization%')
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(T2.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17;
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'SilentGhost'
SELECT T2.DisplayName FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'thank you user93!'
SELECT Text FROM comments WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'A Lion')
SELECT T2.DisplayName, T2.Reputation FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Understanding what Dassault iSight is doing?'
SELECT T2.Text FROM `posts` AS T1 JOIN `comments` AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10;
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'
SELECT T1.Title FROM `posts` AS T1 JOIN `users` AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Vebjorn Ljosa'
SELECT SUM(T1.Score), T2.WebsiteUrl FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Yevgeny' GROUP BY T2.WebsiteUrl
SELECT T3.Text FROM `posts` AS T1 JOIN `postHistory` AS T2 ON T1.Id = T2.PostId JOIN `comments` AS T3 ON T1.Id = T3.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND T2.PostHistoryTypeId = 4
SELECT SUM(T2.BountyAmount) FROM posts AS T1 JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'
SELECT T3.DisplayName FROM `posts` AS T1 JOIN `votes` AS T2 ON T1.Id = T2.PostId JOIN `users` AS T3 ON T2.UserId = T3.Id WHERE T2.BountyAmount = 50 AND T1.Title LIKE '%variance%'
SELECT p.Title, c.Text, AVG(p.ViewCount) as AverageViewCount FROM posts p JOIN postTags pt ON p.Id = pt.PostId JOIN tags t ON t.Id = pt.TagId LEFT JOIN comments c ON p.Id = c.PostId WHERE t.TagName = 'humor' GROUP BY p.Id, p.Title, c.Text;
SELECT COUNT(*) FROM comments WHERE UserId = 13;
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT UserId FROM users WHERE Views = (SELECT MIN(Views) FROM users)
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011'
SELECT COUNT(*) FROM (SELECT UserId, COUNT(*) AS badge_count FROM badges GROUP BY UserId HAVING badge_count > 5) AS users_with_more_than_5_badges;
SELECT COUNT(*) FROM users u JOIN badges b1 ON u.Id = b1.UserId JOIN badges b2 ON u.Id = b2.UserId WHERE u.Location LIKE '%New York%' AND b1.Name = 'Teacher' AND b2.Name = 'Supporter'
SELECT u.DisplayName, u.Reputation FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.Id = 1;
SELECT UserId FROM postHistory WHERE PostId IN (SELECT PostId FROM postHistory GROUP BY PostId HAVING COUNT(*) = 1) AND PostId IN (SELECT Id FROM posts WHERE ViewCount >= 1000) GROUP BY UserId HAVING COUNT(*) >= 1;
SELECT u.DisplayName, COUNT(c.Id) AS CommentCount, GROUP_CONCAT(DISTINCT b.Name) AS Badges FROM users u JOIN comments c ON u.Id = c.UserId LEFT JOIN badges b ON u.Id = b.UserId GROUP BY u.Id ORDER BY CommentCount DESC LIMIT 1;
SELECT COUNT(*) FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Teacher' AND u.Location LIKE '%India%';
SELECT (CAST(COUNT(CASE WHEN strftime('%Y', T1.Date) = '2010' THEN 1 END) AS REAL) / COUNT(T1.Name) * 100) - (CAST(COUNT(CASE WHEN strftime('%Y', T1.Date) = '2011' THEN 1 END) AS REAL) / COUNT(T1.Name) * 100) AS perc_diff FROM `badges` AS T1 WHERE T1.Name = 'Student'
SELECT COUNT(DISTINCT T2.UserId) AS UniqueUsersCommented, T1.PostHistoryTypeId FROM postHistory AS T1 JOIN comments AS T2 ON T1.PostId = T2.PostId WHERE T1.PostId = 3720 GROUP BY T1.PostHistoryTypeId
SELECT p.Id, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217;
SELECT T1.Score, T2.LinkTypeId FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T2.PostId = 395
SELECT T1.Id, T1.OwnerUserId FROM `posts` AS T1 WHERE T1.Score > 60
SELECT SUM(T1.FavoriteCount) FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Id = 686 AND YEAR(T1.CreationDate) = 2011
SELECT CAST(SUM(T2.UpVotes) AS REAL) / COUNT(T1.Id) AS AvgUpVotes,  CAST(SUM(T2.Age) AS REAL) / COUNT(T1.Id) AS AvgAge FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id GROUP BY T2.Id HAVING COUNT(T1.Id) > 10
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE Score > 60;
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10;
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT T2.Reputation FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT B.Name FROM badges AS B JOIN users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Pierre'
SELECT T2.Date FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'
SELECT CAST(COUNT(CASE WHEN T1.Name = 'Teacher' THEN T1.UserId END) AS REAL) * 100 / COUNT(T1.UserId) FROM badges AS T1
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM Badges AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer';
SELECT T2.Score FROM `posts` AS T1 JOIN `comments` AS T2 ON T1.Id = T2.PostId WHERE T2.CreationDate = '2010-07-19 19:19:56.0'
SELECT T1.Text FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.CreationDate = '2010-07-19 19:37:33.0'
SELECT T1.Age FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Vienna, Austria'
SELECT COUNT(*) FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Age BETWEEN 19 AND 65 AND T1.Name = 'Supporter'
SELECT T2.Views FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = (SELECT MIN(Reputation) FROM users)
SELECT B.Name FROM badges AS B JOIN users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Sharpie'
SELECT COUNT(*) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%'
SELECT COUNT(*) FROM votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT DisplayName FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT CAST(COUNT(CASE WHEN YEAR(CreationDate) = 2010 THEN Id ELSE NULL END) AS REAL) / COUNT(CASE WHEN YEAR(CreationDate) = 2011 THEN Id ELSE NULL END) FROM votes;
SELECT T.TagName FROM `tags` AS T JOIN `posts` AS P ON P.Tags LIKE '%' || T.TagName || '%' JOIN `users` AS U ON U.Id = P.OwnerUserId WHERE U.DisplayName = 'John Salvatier' GROUP BY T.TagName
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan')
SELECT T1.Id FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName ='slashnick' AND T1.PostTypeId = 1 ORDER BY T1.AnswerCount DESC LIMIT 1
SELECT OwnerUserId, MAX(SUM(ViewCount)) AS TotalViews FROM posts WHERE OwnerUserId IN (     SELECT Id     FROM users     WHERE DisplayName IN ('Harvey Motulsky', 'Noah Snyder') ) GROUP BY OwnerUserId ORDER BY TotalViews DESC LIMIT 1;
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Matt Parker') AND Id IN (SELECT PostId FROM votes GROUP BY PostId HAVING COUNT(*) > 4)
SELECT COUNT(*) FROM comments WHERE Score < 60 AND UserId IN (SELECT Id FROM users WHERE DisplayName = 'Neil McGuigan')
SELECT T3.TagName FROM `posts` AS T1 JOIN `posts` AS T2 ON T1.ParentId = T2.Id JOIN `tags` AS T3 ON T3.ExcerptPostId = T2.Id WHERE T1.CommentCount = 0 AND T2.OwnerUserId = (SELECT Id FROM `users` WHERE DisplayName = 'Mark Meckes')
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.Id) FROM posts AS P JOIN tags AS T ON P.Id = T.ExcerptPostId WHERE P.OwnerUserId = (SELECT U.Id FROM users AS U WHERE U.DisplayName = 'Community')
SELECT (SELECT SUM(T1.ViewCount) FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Mornington') - (SELECT SUM(T1.ViewCount) FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Amos') AS difference;
SELECT COUNT(*) FROM badges WHERE Name = 'Commentator' AND strftime('%Y', Date) = '2014';
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT T1.DisplayName, T1.Age FROM users AS T1 JOIN (SELECT OwnerUserId, MAX(Views) AS maxviews FROM posts GROUP BY OwnerUserId) AS T2 ON T1.Id = T2.OwnerUserId
SELECT T1.LastEditDate, T1.LastEditorUserId FROM posts AS T1 WHERE T1.Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;
SELECT T3.Title, T1.UserDisplayName FROM comments AS T1 JOIN posts AS T2 ON T1.PostId = T2.Id JOIN posts AS T3 ON T2.ParentId = T3.Id WHERE T1.Score > 60;
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND strftime('%Y', b.Date) = '2011'
SELECT T2.DisplayName, T2.WebsiteUrl FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount > 150;
SELECT COUNT(ph.Id) AS PostHistoryCount, ph.LastEditDate FROM postHistory ph JOIN posts p ON ph.PostId = p.Id WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY ph.LastEditDate
SELECT T2.LastAccessDate, T2.Location FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Outliers'
SELECT T2.Title FROM postLinks AS T1 JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId = (SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time')
SELECT T1.Id AS PostID, T2.Name AS BadgeName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id JOIN badges AS T3 ON T2.Id = T3.UserId WHERE T2.UserDisplayName = 'Samuel' AND YEAR(T1.CreationDate) = 2013 AND YEAR(T3.Date) = 2013;
SELECT T2.OwnerDisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount = (SELECT MAX(ViewCount) FROM posts)
SELECT T3.DisplayName, T3.Location FROM tags AS T1 JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T1.TagName = 'hypothesis-testing'
SELECT T1.Title, T2.LinkTypeId FROM `posts` AS T1 JOIN `postLinks` AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What are principal component scores?'
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ParentId IS NOT NULL ORDER BY T1.Score DESC LIMIT 1;
SELECT T1.DisplayName, T1.WebsiteUrl FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.VoteTypeId = 8 ORDER BY T2.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT T1.OwnerUserId FROM posts AS T1 JOIN (SELECT MAX(FavoriteCount) AS MaxFavoriteCount FROM posts) AS T2 ON T1.FavoriteCount = T2.MaxFavoriteCount
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM `votes` WHERE `BountyAmount` = 50 AND YEAR(`CreationDate`) = 2011;
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users)
SELECT SUM(T1.Score) FROM posts AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.PostId WHERE T1.LasActivityDate LIKE '2010-07-19%' AND T2.CreationDate LIKE '2010-07-19%'
SELECT CAST(COUNT(T3.Id) AS REAL) / 12 FROM (SELECT T1.Id, T1.AnswerCount, T1.CreationDate FROM `posts` AS T1 WHERE T1.PostTypeId = 1 AND T1.AnswerCount <= 2 AND STRFTIME('%Y', T1.CreationDate) = '2010') AS T2 JOIN `postLinks` AS T3 ON T2.Id = T3.PostId WHERE STRFTIME('%Y', T3.CreationDate) = '2010'
SELECT T1.Id FROM `posts` AS T1 INNER JOIN `votes` AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 1465 ORDER BY T1.FavoriteCount DESC LIMIT 1
SELECT T1.Title FROM `posts` AS T1 JOIN `postLinks` AS T2 ON T1.Id = T2.PostId WHERE T2.CreationDate = (SELECT MIN(CreationDate) FROM `postLinks`)
SELECT T2.DisplayName FROM (SELECT UserId, COUNT(*) AS BadgeCount FROM badges GROUP BY UserId) AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.BadgeCount = (SELECT MAX(BadgeCount) FROM (SELECT COUNT(*) AS BadgeCount FROM badges GROUP BY UserId))
SELECT MIN(v.CreationDate) FROM votes AS v JOIN users AS u ON v.UserId = u.Id WHERE u.DisplayName = 'chl'
SELECT MIN(p.CreationDate) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users)
SELECT T2.DisplayName FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date ASC LIMIT 1
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount >= 4 AND u.Location = 'United Kingdom'
SELECT AVG(T2.PostId) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = (SELECT MAX(Age) FROM users)
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND YEAR(CreationDate) = 2010;
SELECT T1.Id, T1.Title FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky' ORDER BY T1.ViewCount DESC LIMIT 1
SELECT T1.Id, T1.Title FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score = (SELECT MAX(Score) FROM posts)
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'
SELECT T2.DisplayName FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount > 20000 AND YEAR(T1.CreationDate) = 2011 GROUP BY T2.DisplayName
SELECT T1.Id, T3.DisplayName FROM `posts` AS T1 JOIN `users` AS T3 ON T1.OwnerUserId = T3.Id WHERE STRFTIME('%Y', T1.CreationDate) = '2010' ORDER BY T1.FavoriteCount DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE STRFTIME('%Y', T1.CreationDate) = '2011'
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) AS percentage FROM users;
SELECT T1.ViewCount, T3.DisplayName FROM `posts` AS T1 JOIN `postHistory` AS T2 ON T1.Id = T2.PostId JOIN `users` AS T3 ON T3.Id = T2.UserId WHERE T2.Text = 'Computer Game Datasets' AND T2.PostHistoryTypeId = 5 ORDER BY T2.CreationDate DESC LIMIT 1;
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts))
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT T2.DisplayName, T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Id = 183 ORDER BY T1.LastEditDate DESC LIMIT 1
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT julianday(b.Date) - julianday(u.CreationDate) AS DaysToBadge FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'Zolomon';
SELECT COUNT(T1.Id) AS PostCount, COUNT(T3.Id) AS CommentCount FROM posts AS T1 LEFT JOIN comments AS T3 ON T3.UserId = T1.OwnerUserId WHERE T1.OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1) GROUP BY T1.OwnerUserId;
SELECT T1.Text, T2.DisplayName FROM `comments` AS T1 JOIN `users` AS T2 ON T1.UserId = T2.Id JOIN `posts` AS T3 ON T1.PostId = T3.Id WHERE T3.Title = 'Analysing wind data with R' ORDER BY T1.CreationDate DESC LIMIT 10;
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(*) FROM `posts` JOIN `tags` ON `posts`.`Tags` = `tags`.`Id` WHERE `tags`.`TagName` = 'careers'
SELECT T2.Reputation, T1.ViewCount FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Jarrod Dixon'
SELECT COUNT(c.Id) AS CommentCount, COUNT(a.Id) AS AnswerCount  FROM posts p  LEFT JOIN comments c ON p.Id = c.PostId  LEFT JOIN posts a ON p.Id = a.ParentId  WHERE p.Title = 'Clustering 1D data';
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;
SELECT ExcerptPostId,  WikiPostId FROM tags WHERE TagName  = 'sample'
SELECT U.Reputation, U.UpVotes FROM users U JOIN comments C ON U.Id = C.UserId WHERE C.Text = 'fine, you win :)'
SELECT T1.Text FROM `comments` AS T1 JOIN `posts` AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%linear regression%'
SELECT T2.Text FROM `posts` AS T1 INNER JOIN `comments` AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount BETWEEN 100 AND 150 ORDER BY T2.Score DESC LIMIT 1
SELECT T1.CreationDate, T2.Age FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.WebsiteUrl LIKE 'http%';
SELECT COUNT(*) FROM `comments` JOIN `posts` ON `comments.PostId` = `posts.Id` WHERE `comments.Score` = 0 AND `posts.ViewCount` < 5;
SELECT COUNT(*) FROM comments WHERE Score = 0 AND PostId IN (SELECT PostId FROM comments GROUP BY PostId HAVING COUNT(*) = 1)
SELECT COUNT(*)  FROM comments  JOIN users ON comments.UserId = users.Id  WHERE comments.Score = 0 AND users.Age = 40;
SELECT T2.Id, T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'Group differences on a five point Likert item'
SELECT COUNT(*) FROM votes WHERE votes.PostId IN (SELECT comments.PostId FROM comments WHERE comments.Text = 'R is also lazy evaluated.') AND votes.VoteTypeId = 2
SELECT T1.Text FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Harvey Motulsky'
SELECT DISTINCT T2.DisplayName FROM comments AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0;
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Id) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM `hero_power` JOIN `superpower` ON `hero_power.power_id` = `superpower.id` WHERE `superpower.power_name` = 'Super Strength'
SELECT COUNT(*) FROM `superhero` s JOIN `hero_power` hp ON s.id = hp.hero_id JOIN `superpower` sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200;
SELECT T1.full_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T2.power_id) > 15
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue')
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id JOIN `hero_power` hp ON s.id = hp.hero_id JOIN `superpower` sp ON hp.power_id = sp.id WHERE c.colour = 'Blue' AND sp.power_name = 'Agility'
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id JOIN `colour` AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Blond'
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT c.colour, COUNT(sh.id) AS superhero_count FROM superhero sh JOIN colour c ON sh.eye_colour_id = c.id JOIN publisher p ON sh.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY c.colour ORDER BY superhero_count DESC;
SELECT AVG(T1.height_cm) FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id JOIN `superpower` AS T3 ON T2.power_id = T3.id JOIN `publisher` AS T4 ON T1.publisher_id = T4.id WHERE T3.power_name = 'Super Strength' AND T4.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')
SELECT T3.publisher_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN publisher AS T3 ON T3.id = (SELECT publisher_id FROM superhero WHERE id = T1.hero_id) WHERE T2.attribute_name = 'Speed' ORDER BY T1.attribute_value ASC LIMIT 1
SELECT COUNT(*) FROM `superhero`  JOIN `colour` ON `superhero`.`eye_colour_id` = `colour`.`id`  JOIN `publisher` ON `superhero`.`publisher_id` = `publisher`.`id`  WHERE `colour`.`colour` = 'Gold' AND `publisher`.`publisher_name` = 'Marvel Comics'
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM `superhero` WHERE `hair_colour_id` = (SELECT `id` FROM `colour` WHERE `colour` = 'Blond')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T2.attribute_value ASC LIMIT 1
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(*) FROM `superhero` s JOIN `hero_attribute` ha ON s.id = ha.hero_id JOIN `attribute` a ON ha.attribute_id = a.id JOIN `gender` g ON s.gender_id = g.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = 100 AND g.gender = 'Female'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')
SELECT CAST(COUNT(CASE WHEN T1.alignment = 'Bad' THEN T2.id ELSE NULL END) AS REAL) * 100 / COUNT(T2.id), COUNT(CASE WHEN T1.alignment = 'Bad' AND T2.publisher_id = 1 THEN T2.id ELSE NULL END) FROM alignment AS T1 JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T2.publisher_id = 1;
SELECT ABS((SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics'))) AS difference;
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';
SELECT AVG(T2.attribute_value) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.gender_id = (SELECT id FROM gender WHERE gender = 'Male') LIMIT 5;
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'No Colour' AND T1.height_cm BETWEEN 170 AND 190
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT T1.full_name FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T3 ON T1.hair_colour_id = T3.id JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.height_cm = 185 AND T2.race = 'human'
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = (SELECT MAX(weight_kg) FROM superhero)
SELECT CAST(SUM(CASE WHEN T2.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.publisher_id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180;
SELECT T1.superhero_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1
SELECT COUNT(*) FROM `hero_power` WHERE `power_id` = (SELECT `id` FROM `superpower` WHERE `power_name` = 'Stealth')
SELECT T1.full_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT AVG(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.id = 1
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id JOIN `publisher` AS T4 ON T1.publisher_id = T4.id WHERE T3.attribute_name = 'Durability' AND T4.publisher_name = 'Dark Horse Comics' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Flight'
SELECT c1.colour,  c2.colour,  c3.colour FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS c1 ON T1.eye_colour_id = c1.id JOIN colour AS c2 ON T1.hair_colour_id = c2.id JOIN colour AS c3 ON T1.skin_colour_id = c3.id JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T2.gender = 'Female' AND T4.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name, T3.publisher_name FROM superhero AS T1 JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T1.eye_colour_id = T1.hair_colour_id AND T1.hair_colour_id = T1.skin_colour_id;
SELECT T2.race FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN T3.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.gender = 'Female'
SELECT T1.superhero_name, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id JOIN `superpower` AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(*) FROM `hero_power` WHERE `hero_id` = (SELECT `id` FROM `superhero` WHERE `superhero_name` = 'Amazo')
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id AND T1.hair_colour_id = T2.id WHERE T2.colour = 'Black'
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')
SELECT T1.superhero_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*) FROM (SELECT hero_id FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') GROUP BY hero_id ORDER BY MAX(attribute_value) DESC LIMIT 1) AS t1 JOIN hero_attribute AS t2 ON t1.hero_id = t2.hero_id WHERE t2.attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength') AND t2.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'));
SELECT T2.race, T3.alignment FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;
SELECT AVG(height_cm) FROM superhero;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM `superhero` WHERE `race_id` = 21 AND `gender_id` = 1;
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T3.id = T2.attribute_id WHERE T3.attribute_name = 'Speed' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT T3.attribute_name, T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T1.superhero_name = '3-D Man'
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Brown')
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') GROUP BY T2.publisher_name HAVING COUNT(*) = 3
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT CAST(SUM(CASE WHEN T2.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.id = 7;
SELECT CAST(SUM(CASE WHEN T2.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT id FROM superpower WHERE power_name = 'cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'
SELECT T2.race FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38
SELECT T3.race FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN race AS T3 ON T2.race_id = T3.id WHERE T1.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)
SELECT T3.alignment, T5.power_name FROM superhero AS T1 JOIN alignment AS T3 ON T1.alignment_id = T3.id JOIN hero_power AS T4 ON T1.id = T4.hero_id JOIN superpower AS T5 ON T4.power_id = T5.id WHERE T1.superhero_name = 'Atom IV'
SELECT T1.full_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5;
SELECT AVG(T2.attribute_value) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.alignment_id = 3
SELECT T3.colour FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.attribute_value = 100
SELECT COUNT(*) FROM `superhero` WHERE `alignment_id` = 1 AND `gender_id` = 2;
SELECT T2.superhero_name FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_value BETWEEN 75 AND 80
SELECT T1.race FROM `race` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.race_id JOIN `colour` AS T3 ON T2.hair_colour_id = T3.id JOIN `gender` AS T4 ON T2.gender_id = T4.id WHERE T3.colour = 'Blue' AND T4.gender = 'Male'
SELECT CAST(SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.alignment = 'Bad'
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS diff FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE (T1.weight_kg = 0 OR T1.weight_kg IS NULL)
SELECT T2.attribute_value FROM attribute AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T1.attribute_name = 'Strength' AND T3.superhero_name = 'Hulk'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM `superhero` WHERE `skin_colour_id` = (SELECT `id` FROM `colour` WHERE `colour` = 'Green') AND `alignment_id` = (SELECT `id` FROM `alignment` WHERE `alignment` = 'Bad');
SELECT COUNT(*) FROM `superhero` WHERE `gender_id` = (SELECT `id` FROM `gender` WHERE `gender` = 'Female') AND `publisher_id` = (SELECT `id` FROM `publisher` WHERE `publisher_name` = 'Marvel Comics')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id JOIN `superpower` AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC;
SELECT T1.gender FROM gender AS T1 JOIN superhero AS T2 ON T1.id = T2.gender_id JOIN hero_power AS T3 ON T2.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T4.power_name = 'Phoenix Force'
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN race AS T3 ON T1.race_id = T3.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T3.race <> 'Human'
SELECT COUNT(*) FROM `hero_attribute` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` WHERE `attribute.attribute_name` = 'Speed' AND `hero_attribute.attribute_value` = 100
SELECT ABS((SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics'))) AS difference;
SELECT T2.attribute_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Black Panther' ORDER BY T1.attribute_value LIMIT 1
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas'
SELECT CAST(SUM(CASE WHEN T1.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM alignment AS T1 JOIN superhero AS T2 ON T1.id = T2.alignment_id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT T1.full_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Brown' AND T1.weight_kg < 100
SELECT T2.attribute_value FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T1.superhero_name = 'Aquababy'
SELECT T1.weight_kg, T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT T1.id FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id JOIN attribute AS T4 ON T3.power_name = T4.attribute_name WHERE T4.attribute_name = 'Intelligence'
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT T2.driverRef FROM `qualifying` AS T1 JOIN `drivers` AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 20 ORDER BY T1.q1 DESC LIMIT 5;
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 19 AND T2.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)
SELECT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.location = 'Shanghai'
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Germany"
SELECT T3.position FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.name = 'Renault'
SELECT COUNT(*) FROM races WHERE year = 2010 AND circuitId NOT IN (SELECT circuitId FROM circuits WHERE country IN ('Malaysia', 'Bahrain', 'Turkey', 'Spain', 'Monaco'))
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = "Spain"
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Australian Grand Prix'
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Sepang International Circuit'
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "Sepang International Circuit"
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Abu Dhabi Grand Prix'
SELECT T3.nationality FROM constructorResults AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T1.constructorId = T3.constructorId WHERE T2.raceId = 24 AND T1.points = 1
SELECT T2.q1 FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.qualifyId = 354 AND T1.forename = 'Bruno' AND T1.surname = 'Senna'
SELECT T3.nationality FROM qualifying AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T1.q2 = '01:40' AND T2.raceId = 355
SELECT T1.number FROM qualifying AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 903 AND T1.q3 LIKE '1:54%'
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Bahrain Grand Prix' AND year = 2007) AND time IS NULL;
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901;
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId = (SELECT statusId FROM status WHERE status = 'Finished')
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL ORDER BY T1.dob ASC LIMIT 1
SELECT T2.url FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.time LIKE '01:27%' AND T1.raceId = 161;
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 933 ORDER BY T2.fastestLapSpeed DESC LIMIT 1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T3.raceId = 9 ORDER BY T2.points DESC LIMIT 1
SELECT T2.q1 FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = "Lucas" AND T1.surname = "di Grassi" AND T2.raceId = 345
SELECT T3.nationality FROM `qualifying` AS T1 JOIN `races` AS T2 ON T1.raceId = T2.raceId JOIN `drivers` AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 347 AND T1.q2 = '01:15'
SELECT T3.code FROM races AS T1 JOIN qualifying AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.raceId = 45 AND T2.q3 LIKE '01:33%'
SELECT T1.time FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceId = 743
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2006 AND T1.name = 'San Marino Grand Prix' AND T2.position = 2
SELECT T2.url FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901;
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time NOT LIKE '0:00:00'
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872 AND T2.time IS NOT NULL ORDER BY T1.dob DESC LIMIT 1
SELECT T3.forename, T3.surname FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.raceId = 348 ORDER BY T2.time ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT (T1.fastestLapSpeed - T2.fastestLapSpeed) * 100 / T1.fastestLapSpeed AS percentage FROM (SELECT fastestLapSpeed FROM results WHERE raceId = 853 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS T1, (SELECT fastestLapSpeed FROM results WHERE raceId = 854 AND driverId = (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS T2
SELECT CAST(SUM(IIF(T2.time IS NOT NULL, 1, 0)) AS REAL) * 100 / COUNT(T2.driverId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.date = '1983-07-16'
SELECT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Singapore Street Circuit' ORDER BY T1.year LIMIT 1
SELECT COUNT(*),  name FROM races WHERE year = 2005 GROUP BY name ORDER BY name DESC
SELECT T2.name FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T1.year = (SELECT MIN(date) FROM races) AND MONTH(T1.year) = MONTH((SELECT MIN(date) FROM races))
SELECT T1.name,  T1.date FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T2.year = 1999 ORDER BY T1.round DESC LIMIT 1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.name FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T1.year = 2017 EXCEPT SELECT T2.name FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T1.year = 2000
SELECT T1.country, T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'European Grand Prix' ORDER BY T2.year LIMIT 1
SELECT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Brands Hatch' AND T2.name = 'British Grand Prix' ORDER BY T2.year DESC LIMIT 1
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone' AND T1.name = 'British Grand Prix'
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2010 AND T1.name = 'Singapore Grand Prix' ORDER BY T2.positionstandings ASC
SELECT T1.forename, T1.surname, MAX(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId GROUP BY T1.driverId ORDER BY T2.points DESC LIMIT 1
SELECT T3.forename, T3.surname, T2.points FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2017 AND T1.name = 'Chinese Grand Prix' ORDER BY T2.position LIMIT 3
SELECT T1.forename, T1.surname, T3.name FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT AVG(T3.milliseconds) FROM races AS T1 JOIN lapTimes AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T2 ON T3.driverId = T2.driverId WHERE T1.name = 'Malaysian Grand Prix' AND T1.year = 2009 AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT CAST(SUM(IIF(T2.surname = 'Hamilton' AND T1.position > 1, 1, 0)) AS REAL) * 100 / COUNT(T1.resultId) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.year >= 2010
SELECT d.forename, d.surname, d.nationality, MAX(ds.points)  FROM drivers d  JOIN driverStandings ds ON d.driverId = ds.driverId  WHERE ds.wins = (SELECT MAX(wins) FROM driverStandings)  GROUP BY d.driverId  ORDER BY COUNT(ds.wins) DESC LIMIT 1;
SELECT T1.forename, T1.surname, (strftime('%Y', 'now') - strftime('%Y', T1.dob)) as age FROM drivers AS T1 WHERE T1.nationality = 'Japanese' ORDER BY T1.dob DESC LIMIT 1
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year BETWEEN 1990 AND 2000 GROUP BY T1.circuitid HAVING COUNT(*) = 4
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'USA' AND T2.year = 2006
SELECT T2.name, T1.name, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE strftime('%Y', T2.date) = '2005' AND strftime('%m', T2.date) = '09'
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Alex' AND T1.surname = 'Yoong' AND T2.position < 20
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid JOIN circuits AS T4 ON T2.circuitid = T4.circuitid WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' AND T4.name = 'Sepang International Circuit' AND T1.positionorder = 1
SELECT T3.name, T3.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Michael' AND T1.surname = 'Schumacher' ORDER BY T2.milliseconds ASC LIMIT 1
SELECT AVG(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T3.year = 2000
SELECT T1.name, T3.points FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.year ASC LIMIT 1
SELECT T2.name,  T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year = 2017 ORDER BY T2.date
SELECT T2.name, T2.year, T3.location FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T2.circuitid = T3.circuitid WHERE T1.laps = (SELECT MAX(laps) FROM results)
SELECT CAST(SUM(IIF(T2.country = "Germany", 1, 0)) AS REAL) * 100 / COUNT(T1.raceId) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "European Grand Prix"
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits WHERE alt = (SELECT MAX(alt) FROM circuits)
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT nationality FROM drivers WHERE dob = (SELECT MIN(dob) FROM drivers)
SELECT T1.surname FROM drivers AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = 'Italian'
SELECT url FROM drivers WHERE forename = "Anthony" AND surname = "Davidson"
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'
SELECT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "Silverstone"
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Silverstone"
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Abu Dhabi" AND T2.year BETWEEN 2010 AND 2019
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Italy'
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Circuit de Barcelona-Catalunya"
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.name = "Spanish Grand Prix" AND T2.year = 2009
SELECT T2.fastestLapTime FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.fastestLapTime LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2007 ORDER BY T2.position LIMIT 1
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT r.name FROM results AS rs JOIN races AS r ON rs.raceid = r.raceid JOIN drivers AS d ON rs.driverid = d.driverid WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY rs.rank ASC LIMIT 1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT DISTINCT T2.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton"
SELECT T3.positionOrder FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Chinese Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton' AND T1.year = 2008
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 1989 AND T1.name = 'Australian Grand Prix' AND T2.grid = 4
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL
SELECT T2.fastestLapTime FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Australian Grand Prix' AND T2.year = 2008 AND T1.positionOrder = 2
SELECT T3.url FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.positionorder = 1;
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND driverId IN (SELECT driverId FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008))
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix' AND T2.year = 2008 AND T1.time IS NOT NULL
SELECT SUM(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(CAST(SUBSTR(T2.fastestLapTime, 3, 2) AS REAL) * 60 + CAST(SUBSTR(T2.fastestLapTime, 6, 3) AS REAL)) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT CAST(SUM(IIF(T2.time IS NOT NULL, 1, 0)) AS REAL) * 100 / COUNT(T2.raceId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'
SELECT (CAST((T1.time - T2.time) AS REAL) / T3.time) * 100 FROM (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND position = 1) AS T1, (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND position = (SELECT MAX(position) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix'))) AS T2, (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND position = 1) AS T3
SELECT COUNT(*) FROM circuits WHERE country = 'Australia' AND location = 'Adelaide'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) > '1980';
SELECT MAX(T2.points) FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British'
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId ORDER BY T2.points DESC LIMIT 1
SELECT T1.name FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T2.raceId = 291 AND T2.points = 0
SELECT COUNT(*) FROM (SELECT T1.constructorId FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(T2.raceId) = 2)
SELECT T1.name FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1
SELECT COUNT(*) FROM (SELECT T1.constructorId FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId JOIN lapTimes AS T3 ON T2.raceId = T3.raceId AND T2.driverId = T3.driverId WHERE T1.nationality = "French" AND T3.lap > 50 GROUP BY T1.constructorId)
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.nationality = 'Japanese' AND T3.year BETWEEN 2007 AND 2009
SELECT AVG(T2.time),  T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year < 1975 AND T2.positionOrder = 1 AND T2.time NOT NULL GROUP BY T1.year;
SELECT T1.forename,  T1.surname FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.dob > 1975-01-01 AND T2.position = 2
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.nationality = "Italian" AND T1.time IS NULL;
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.rank = 1 ORDER BY T2.fastestLapTime LIMIT 1
SELECT T3.fastestLap FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN results AS T3 ON T1.raceId = T3.raceId WHERE T1.year = 2009 AND T2.positionOrder = 1 AND T2.driverId = T3.driverId ORDER BY T3.fastestLapTime LIMIT 1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT T2.name, T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1
SELECT CAST(COUNT(CASE WHEN T1.dob < '1985-01-01' AND T2.laps > 50 THEN T1.driverId ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN strftime('%Y', T2.date) BETWEEN '2000' AND '2005' THEN T1.driverId ELSE NULL END) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE strftime('%Y', T3.date) BETWEEN '2000' AND '2005'
SELECT COUNT(*) FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "French" AND T2.time < "02:00.00"
SELECT T1.code FROM drivers AS T1 WHERE T1.nationality = 'American'
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;
SELECT T1.code, T1.driverId FROM drivers AS T1 JOIN (SELECT driverId, dob FROM drivers ORDER BY dob DESC LIMIT 3) AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Dutch'
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980'
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'German' AND strftime('%Y', T1.dob) BETWEEN '1980' AND '1990' ORDER BY T2.time LIMIT 3;
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT T1.driverId, T1.code FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE strftime('%Y', T1.dob) = '1971' AND T2.fastestLapTime IS NOT NULL GROUP BY T1.driverId, T1.code ORDER BY T2.fastestLapTime LIMIT 1;
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = 'Spanish' AND strftime('%Y', T1.dob) < '1982' ORDER BY T2.time DESC LIMIT 10;
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId ORDER BY T2.fastestLapTime LIMIT 1
SELECT T2.year FROM lapTimes AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time = (SELECT MAX(T1.time) FROM lapTimes AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId)
SELECT T1.driverId FROM (SELECT driverId, MIN(time) AS min_time FROM lapTimes WHERE lap = 1 GROUP BY driverId) AS T1 JOIN (SELECT driverId, time FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5) AS T2 ON T1.driverId = T2.driverId AND T1.min_time = T2.time ORDER BY T1.min_time ASC
SELECT COUNT(*) FROM results WHERE statusId = 2 AND raceId BETWEEN 50 AND 100 AND time IS NOT NULL;
SELECT location, lat, lng FROM circuits WHERE country = 'Austria'
SELECT T1.raceId, COUNT(*) AS num_finishers FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.time IS NOT NULL GROUP BY T1.raceId ORDER BY num_finishers DESC LIMIT 1;
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL
SELECT T3.year, T3.name, T3.time FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MAX(dob) FROM drivers WHERE driverid IN (SELECT driverid FROM qualifying)) AND T3.date = (SELECT MIN(date) FROM races WHERE raceid IN (SELECT raceid FROM qualifying WHERE driverid = (SELECT driverid FROM drivers WHERE dob = (SELECT MAX(dob) FROM drivers WHERE driverid IN (SELECT driverid FROM qualifying)))));
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN status AS T3 ON T1.statusId = T3.statusId WHERE T2.nationality = 'American' AND T3.status = 'Puncture'
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId GROUP BY T1.constructorId ORDER BY SUM(T2.wins) DESC LIMIT 1
SELECT T2.driverId FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'French Grand Prix' AND T2.lap = 3 ORDER BY T2.time DESC LIMIT 1
SELECT T1.name, T2.milliseconds FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T2.lap = 1 ORDER BY T2.milliseconds ASC LIMIT 1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'United States Grand Prix' AND T2.year = 2006 AND T1.rank < 11
SELECT T1.forename, T1.surname, AVG(T2.duration) as avg_duration FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND strftime('%Y', T1.dob) BETWEEN '1980' AND '1985' GROUP BY T1.driverId ORDER BY avg_duration ASC LIMIT 3;
SELECT T2.driverId, T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2008 AND T2.position = 1;
SELECT T3.constructorRef, T3.url FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.year = 2009 AND T1.name = 'Singapore Grand Prix' ORDER BY T2.positionOrder LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND strftime('%Y', dob) BETWEEN '1981' AND '1991'
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND strftime('%Y', dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT T1.points, T2.name, T2.nationality FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name = 'Monaco Grand Prix' AND T3.year BETWEEN 1980 AND 2010 ORDER BY T1.points DESC LIMIT 1
SELECT AVG(T3.points) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId JOIN results AS T3 ON T2.raceId = T3.raceId JOIN drivers AS T4 ON T3.driverId = T4.driverId WHERE T1.name = 'Istanbul Park' AND T4.forename = 'Lewis' AND T4.surname = 'Hamilton'
SELECT AVG(COUNT(*)) FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY strftime('%Y', date)
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM driverStandings WHERE position = 91 AND wins = 1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime = (SELECT MIN(fastestLapTime) FROM results)
SELECT T2.location, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.date = (SELECT MAX(date) FROM races)
SELECT T3.forename, T3.surname FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2008 AND T1.name = 'Singapore Grand Prix' AND T1.circuitid = (SELECT circuitid FROM circuits WHERE name = 'Marina Bay Street Circuit') ORDER BY T2.q3 LIMIT 1
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MAX(dob) FROM drivers)
SELECT COUNT(*) FROM results WHERE statusId = 3 AND raceId = (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') AND driverId = (SELECT driverId FROM results WHERE statusId = 3 AND raceId = (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') GROUP BY driverId ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.forename, T1.surname, COUNT(T2.raceId) AS wins FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.position = 1 GROUP BY T1.driverId ORDER BY T1.dob ASC LIMIT 1
SELECT MAX(duration) FROM pitStops
SELECT MIN(T.time) FROM lapTimes AS T
SELECT MAX(T2.duration) FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T2.lap FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT T1.driverId, T1.duration FROM pitStops AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Australian Grand Prix' AND T2.year = 2011
SELECT T1.time FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton' ORDER BY T1.time LIMIT 1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.time = (SELECT MIN(time) FROM lapTimes) LIMIT 1;
SELECT T3.position FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN lapTimes AS T3 ON T2.raceId = T3.raceId AND T2.driverId = T3.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' GROUP BY T3.position ORDER BY MIN(T3.time) LIMIT 1
SELECT MIN(T2.time) FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitId = T2.raceId WHERE T1.name = 'Austrian Grand Prix'
SELECT T1.name, MIN(T2.time) FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitId = T2.raceId WHERE T1.country = "Italy" GROUP BY T1.circuitId
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T3.name = 'Austrian Grand Prix' AND T2.positionorder = 1 ORDER BY T2.fastestlaptime LIMIT 1
SELECT T2.duration FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.duration = (SELECT MIN(T2.duration) FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix')
SELECT T1.lat, T1.lng FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitId = T2.raceId WHERE T2.time = '1:29.488'
SELECT AVG(T2.milliseconds) FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(T2.milliseconds) FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitId = T2.raceId WHERE T1.country = 'Italy'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating  =  (SELECT max(overall_rating) FROM Player_Attributes)
SELECT player_name,  height FROM Player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT player_api_id FROM Player_Attributes WHERE crossing IS NOT NULL ORDER BY crossing DESC LIMIT 5
SELECT T2.name FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T1.league_id ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND T2.home_team_goal < T2.away_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T2.player_name ORDER BY AVG(T1.penalties) DESC LIMIT 10;
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id JOIN League AS T3 ON T2.league_id = T3.id WHERE T2.season = '2009/2010' AND T3.name = 'Scotland Premier League' AND T2.away_team_goal > T2.home_team_goal GROUP BY T2.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.buildUpPlaySpeed FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id ORDER BY T1.buildUpPlaySpeed DESC LIMIT 4
SELECT T2.name FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' AND T1.home_team_goal = T1.away_team_goal GROUP BY T2.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.player_name, (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) as age  FROM Player AS T1  JOIN Player_Attributes AS T2  ON T1.player_api_id = T2.player_api_id  WHERE T2.sprint_speed >= 97 AND strftime('%Y', T2.date) BETWEEN '2013' AND '2015'
SELECT T2.name,  COUNT(*) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T1.league_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T1.height) FROM Player AS T1 WHERE T1.birthday >= '1990-01-01 00:00:00' AND T1.birthday < '1996-01-01 00:00:00'
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%'))
SELECT T1.team_fifa_api_id FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed > 50 AND T2.buildUpPlaySpeed < 60
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE buildUpPlayPassing IS NOT NULL AND strftime('%Y', date) = '2012') AND strftime('%Y', T2.date) = '2012'
SELECT CAST(SUM(CASE WHEN T1.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100 AS REAL) / COUNT(T1.player_fifa_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T2.birthday) BETWEEN '1987' AND '1992'
SELECT L.name FROM (SELECT T1.league_id, SUM(T1.home_team_goal + T1.away_team_goal) AS total_goals FROM `Match` AS T1 JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T1.league_id) AS L1 JOIN League AS L ON L1.league_id = L.id ORDER BY L1.total_goals ASC LIMIT 5;
SELECT AVG(T2.long_shots) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.height > 180 GROUP BY T2.player_name ORDER BY AVG(T1.heading_accuracy) DESC LIMIT 10
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' AND T1.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00') ORDER BY T1.chanceCreationPassing DESC
SELECT T2.name FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.id WHERE T1.season = '2009/2010' GROUP BY T1.league_id HAVING AVG(T1.home_team_goal) > AVG(T1.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Franco Zennaro'
SELECT T1.buildUpPlayPositioningClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'ADO Den Haag'
SELECT T2.heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00'
SELECT overall_rating FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Gabriel Tamas') AND strftime('%Y', date) = '2011'
SELECT COUNT(*) FROM `Match` JOIN `League` ON `Match`.league_id = `League`.id WHERE `League`.name = 'Scotland Premier League' AND `Match`.season = '2015/2016'
SELECT T2.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.birthday = (SELECT MAX(birthday) FROM Player)
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT COUNT(*) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight < 130 AND T2.preferred_foot = 'left'
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.chanceCreationPassingClass = 'Risky'
SELECT defensive_work_rate FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'David Wilson')
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = "Netherlands"
SELECT AVG(T2.home_team_goal) FROM Country AS T1 JOIN Match AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Poland' AND T2.season = '2010/2011'
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE finishing IN (SELECT MAX(finishing) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE height = (SELECT MAX(height) FROM Player) OR height = (SELECT MIN(height) FROM Player)) GROUP BY player_api_id ORDER BY AVG(finishing) DESC LIMIT 1))
SELECT player_name FROM Player WHERE height > 180
SELECT COUNT(*) FROM Player WHERE STRFTIME('%Y', birthday) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010' GROUP BY T2.player_name
SELECT T2.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'left')
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB'
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > 70
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 170 AND STRFTIME('%Y', T2.date) BETWEEN '2010' AND '2015'
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A'
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeed = 31 AND T1.buildUpPlayDribbling = 53 AND T1.buildUpPlayPassing = 32
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT COUNT(*) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10'
SELECT T2.team_short_name FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.potential = 61 AND T1.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61)
SELECT SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.id ELSE NULL END) - SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.id ELSE NULL END) AS diff_avg_ball_control FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday LIMIT 1
SELECT player_name FROM Player WHERE height  =  (SELECT max(height) FROM Player)
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Belgium Jupiler League'
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Germany'
SELECT player_name FROM Player WHERE player_api_id = (SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes))
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'high'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY T2.crossing DESC LIMIT 1
SELECT T2.heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'
SELECT COUNT(*) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.volleys > 70 AND T1.dribbling > 70
SELECT COUNT(*) FROM Match WHERE country_id IN (SELECT id FROM Country WHERE name = 'Belgium') AND season = '2008/2009'
SELECT MAX(T2.birthday), T1.long_passing FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.long_passing ORDER BY T2.birthday DESC LIMIT 1
SELECT COUNT(*) FROM `Match` WHERE `league_id` = (SELECT `id` FROM `League` WHERE `name` = 'Belgium Jupiler League') AND SUBSTR(`date`, 1, 7) = '2009-04'
SELECT T2.name FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.id WHERE T1.season = '2008/2009' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'
SELECT (T1.overall_rating - T2.overall_rating) * 100 / T2.overall_rating AS percentage_difference FROM (SELECT overall_rating FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Ariel Borysiuk') AS T1, (SELECT overall_rating FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'Paulin Puel') AS T2
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM `Player_Attributes` AS T1 JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM `Player_Attributes` AS T1 JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'
SELECT MAX(T2.chanceCreationPassing), T2.chanceCreationPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax'
SELECT T2.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo'
SELECT MAX(T1.overall_rating) FROM `Player_Attributes` AS T1 JOIN `Player` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(T1.away_team_goal) FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.away_team_api_id = T2.team_api_id JOIN `Country` AS T3 ON T1.country_id = T3.id WHERE T2.team_long_name = 'Parma' AND T3.name = 'Italy'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating = 77 AND T1.date LIKE '2016-06-23%' ORDER BY T2.birthday ASC LIMIT 1
SELECT T2.overall_rating FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Mooy' AND T2.date LIKE '2016-02-04%'
SELECT T2.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Parravicini' AND T2.date = '2010-08-30 00:00:00'
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date LIKE '2015-05-01%'
SELECT T2.defensive_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'
SELECT T2.date FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Constant' AND T2.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = 'Kevin Constant'))
SELECT buildUpPlaySpeedClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'Willem II') AND date = '2011-02-22 00:00:00'
SELECT T1.buildUpPlayDribblingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_short_name = 'LEI' AND T1.date = '2015-09-10 00:00:00'
SELECT T1.buildUpPlayPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'FC Lorient' AND T1.date LIKE '2010-02-22%'
SELECT T1.chanceCreationPassingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'PEC Zwolle' AND T1.date = '2013-09-20 00:00:00'
SELECT T1.chanceCreationCrossingClass FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hull City' AND T1.date = '2010-02-22 00:00:00'
SELECT T2.defenceAggressionClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date LIKE '2015-09-10%'
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(T2.date,1,10) BETWEEN '2007-02-22' AND '2016-04-21'
SELECT CAST((SUM(CASE WHEN T1.player_name = 'Landon Donovan' THEN T2.overall_rating END) - SUM(CASE WHEN T1.player_name = 'Jordan Bowery' THEN T2.overall_rating END)) AS REAL) * 100 / SUM(CASE WHEN T1.player_name = 'Landon Donovan' THEN T2.overall_rating END) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.date = '2013-07-12 00:00:00'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE datetime('now') - datetime(birthday) > '34 years'
SELECT COUNT(T1.home_team_goal) FROM `Match` AS T1 JOIN `Player` AS T2 ON T1.home_player_1 = T2.player_api_id OR T1.home_player_2 = T2.player_api_id OR T1.home_player_3 = T2.player_api_id OR T1.home_player_4 = T2.player_api_id OR T1.home_player_5 = T2.player_api_id OR T1.home_player_6 = T2.player_api_id OR T1.home_player_7 = T2.player_api_id OR T1.home_player_8 = T2.player_api_id OR T1.home_player_9 = T2.player_api_id OR T1.home_player_10 = T2.player_api_id OR T1.home_player_11 = T2.player_api_id WHERE T2.player_name = 'Aaron Lennon'
SELECT SUM(T3.away_team_goal) FROM Player AS T1 JOIN Match AS T3 ON T1.player_api_id = T3.away_player_1 OR T1.player_api_id = T3.away_player_2 OR T1.player_api_id = T3.away_player_3 OR T1.player_api_id = T3.away_player_4 OR T1.player_api_id = T3.away_player_5 OR T1.player_api_id = T3.away_player_6 OR T1.player_api_id = T3.away_player_7 OR T1.player_api_id = T3.away_player_8 OR T1.player_api_id = T3.away_player_9 OR T1.player_api_id = T3.away_player_10 OR T1.player_api_id = T3.away_player_11 WHERE T1.player_name = 'Daan Smith' OR T1.player_name = 'Filipe Ferreira'
SELECT SUM(T3.home_team_goal) FROM Player AS T1 JOIN Match AS T3 ON T1.player_api_id = T3.home_player_1 OR T1.player_api_id = T3.home_player_2 OR T1.player_api_id = T3.home_player_3 OR T1.player_api_id = T3.home_player_4 OR T1.player_api_id = T3.home_player_5 OR T1.player_api_id = T3.home_player_6 OR T1.player_api_id = T3.home_player_7 OR T1.player_api_id = T3.home_player_8 OR T1.player_api_id = T3.home_player_9 OR T1.player_api_id = T3.home_player_10 OR T1.player_api_id = T3.home_player_11 WHERE (julianday('now') - julianday(T1.birthday)) / 365 < 31 UNION SELECT SUM(T3.home_team_goal) FROM Player AS T1 JOIN Match AS T3 ON T1.player_api_id = T3.home_player_1 OR T1.player_api_id = T3.home_player_2 OR T1.player_api_id = T3.home_player_3 OR T1.player_api_id = T3.home_player_4 OR T1.player_api_id = T3.home_player_5 OR T1.player_api_id = T3.home_player_6 OR T1.player_api_id = T3.home_player_7 OR T1.player_api_id = T3.home_player_8 OR T1.player_api_id = T3.home_player_9 OR T1.player_api_id = T3.home_player_10 OR T1.player_api_id = T3.home_player_11 WHERE (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) < 31 UNION SELECT SUM(T3.home_team_goal) FROM Player AS T1 JOIN Match AS T3 ON T1.player_api_id = T3.home_player_1 OR T1.player_api_id = T3.home_player_2 OR T1.player_api_id = T3.home_player_3 OR T1.player_api_id = T3.home_player_4 OR T1.player_api_id = T3.home_player_5 OR T1.player_api_id = T3.home_player_6 OR T1.player_api_id = T3.home_player_7 OR T1.player_api_id = T3.home_player_8 OR T1.player_api_id = T3.home_player_9 OR T1.player_api_id = T3.home_player_10 OR T1.player_api_id = T3.home_player_11 WHERE (julianday('now') - julianday(T1.birthday)) / 365.25 < 31 UNION SELECT SUM(T3.home_team_goal) FROM Player AS T1 JOIN Match AS T3 ON T1.player_api_id = T3.home_player_1 OR T1.player_api_id = T3.home_player_2 OR T1.player_api_id = T3.home_player_3 OR T1.player_api_id = T3.home_player_4 OR T1.player_api_id = T3.home_player_5 OR T1.player_api_id = T3.home_player_6 OR T1.player_api_id = T3.home_player_7 OR T1.player_api_id = T3.home_player_8 OR T1.player_api_id = T3.home_player_9 OR T1.player_api_id = T3.home_player_10 OR T1.player_api_id = T3.home_player_11 WHERE (strftime('%Y-%m-%d', 'now') - strftime('%Y-%m-%d', T1.birthday)) / 365 < 31 UNION SELECT SUM(T3.home_team_goal) FROM Player AS T1 JOIN Match AS T3 ON T1.player_api_id = T3.home_player_1 OR T1.player_api_id = T3.home_player_2 OR T1.player_api_id = T3.home_player_3 OR T1.player_api_id = T3.home_player_4 OR T1.player_api_id = T3.home_player_5 OR T1.player_api_id = T3.home_player_6 OR T1.player_api_id = T3.home_player_7 OR T1.player_api_id = T3.home_player_8 OR T1.player_api_id = T3.home_player_9 OR T1.player_api_id = T3.home_player_10 OR T1.player_api_id = T3.home_player_11 WHERE (julianday('now') - julianday(T1.birthday)) / 365 < 31 AND (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) < 31 UNION SELECT SUM(T3.home_team_goal) FROM Player AS T1 JOIN Match AS T3 ON T1.player_api_id = T3.home_player_1 OR T1.player
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.attacking_work_rate = 'high'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY datetime('now') - datetime(T1.birthday) DESC LIMIT 1
SELECT T1.player_name FROM Player AS T1 JOIN Country AS T2 ON T1.player_api_id = T2.id WHERE T2.name = 'Belgium'
SELECT T1.player_name, T3.name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id JOIN Country AS T3 ON T1.player_api_id = T3.id WHERE T2.vision > 89
SELECT T2.name FROM Player AS T1 JOIN Country AS T2 ON T1.player_api_id = T2.id GROUP BY T2.name ORDER BY AVG(T1.weight) DESC LIMIT 1
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow'
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T2.height) FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.player_api_id WHERE T1.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3;
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01'
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23) AS diff
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot  =  'right' ORDER BY potential LIMIT 5
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes)
SELECT CAST(SUM(CASE WHEN T2.stamina > 80 AND T2.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT T1.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Poland Ekstraklasa'
SELECT T1.home_team_goal, T1.away_team_goal FROM `Match` AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Belgium Jupiler League' AND T1.date LIKE '2008-09-24%'
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Alexis Blin'
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id = (SELECT id FROM League WHERE name = 'Italy Serie A')
SELECT MAX(T1.home_team_goal) FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Netherlands Eredivisie'
SELECT T2.finishing, T2.curve FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight = (SELECT MAX(weight) FROM Player)
SELECT T2.name FROM `Match` AS T1 JOIN `League` AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 4
SELECT T2.team_long_name FROM `Match` AS T1 JOIN `Team` AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.away_team_goal = (SELECT MAX(away_team_goal) FROM `Match`)
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.overall_rating DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.height < 180 THEN 1 ELSE 0 END) * 100 / COUNT(T1.height)) AS PERCENTAGE FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating > 70
SELECT      (CASE          WHEN (SELECT COUNT(T1.ID) FROM `Patient` AS T1 WHERE T1.SEX = 'M' AND T1.Admisson = '+') >             (SELECT COUNT(T1.ID) FROM `Patient` AS T1 WHERE T1.SEX = 'M' AND T1.Admisson = '-')          THEN 'More In-patient'          ELSE 'More Outpatient'      END) AS More_Type,     ABS((SELECT COUNT(T1.ID) FROM `Patient` AS T1 WHERE T1.SEX = 'M' AND T1.Admisson = '+') -          (SELECT COUNT(T1.ID) FROM `Patient` AS T1 WHERE T1.SEX = 'M' AND T1.Admisson = '-')) /         (SELECT COUNT(T1.ID) FROM `Patient` AS T1 WHERE T1.SEX = 'M') AS Deviation_Percentage FROM      `Patient` AS T1 WHERE      T1.SEX = 'M'
SELECT CAST(SUM(CASE WHEN strftime('%Y', T2.Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.SEX) FROM Patient AS T2 WHERE T2.SEX = 'F'
SELECT CAST(SUM(CASE WHEN T1.Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM `Patient` AS T1 WHERE STRFTIME('%Y', T1.Birthday) BETWEEN '1930' AND '1940'
SELECT CAST(SUM(CASE WHEN T2.Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.Admission = '-' THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE'
SELECT T1.Diagnosis,  T2.Date FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609
SELECT T1.SEX,  T1.Birthday,  T2.Examination_Date,  T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID  =  T2.ID WHERE T1.ID  =  163109
SELECT T1.ID,  T1.SEX,  T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500
SELECT T1.ID,  strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'
SELECT T1.ID,  T1.SEX,  T1.Diagnosis FROM `Patient` AS T1 INNER JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Birthday) = '1937' AND T2.`T-CHO` >= 250;
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT AVG(T2.aCL_IgG) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND strftime('%Y', datetime('now')) - strftime('%Y', T1.Birthday) >= 50
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND strftime('%Y', T1.Description) = '1997' AND T1.Admisson = '-'
SELECT MIN(T2.First_Date - T2.Birthday) AS Age FROM Patient AS T2
SELECT COUNT(*) FROM `Examination` WHERE `Thrombosis` = 1 AND `Examination Date` LIKE '1997%' AND `ID` IN (SELECT `ID` FROM `Patient` WHERE `SEX` = 'F')
SELECT T2.MAX_AGE - T2.MIN_AGE AS Age_Gap FROM (SELECT MIN(YEAR(Birthday)) AS MIN_AGE FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200)) T1, (SELECT MAX(YEAR(Birthday)) AS MAX_AGE FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG >= 200)) T2
SELECT T1.Symptoms, T2.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Symptoms IS NOT NULL))
SELECT COUNT(T1.ID) / 12 AS average_male_patients_tested_per_month FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T3.Date FROM (SELECT T1.Birthday,  T1.First_Date FROM Patient AS T1 WHERE T1.Diagnosis = 'SJS') AS T2 JOIN Laboratory AS T3 ON T2.ID = T3.ID WHERE (T2.First_Date - T2.Birthday) = (SELECT MIN((T1.First_Date - T1.Birthday)) FROM Patient AS T1 WHERE T1.Diagnosis = 'SJS')
SELECT CAST(SUM(CASE WHEN T2.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE DATEDIFF(T2.`Examination Date`, T1.`First Date`) >= 365
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.Birthday) > strftime('%Y', datetime('now')) - 18 AND strftime('%Y', T2.`Examination Date`) BETWEEN '1990' AND '1993'
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M' AND `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `T-BIL` >= 2.0)
SELECT T2.Diagnosis FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1
SELECT AVG(T2.Birthday) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1991-10-01' AND '1991-10-30' AND T2.Birthday < '1999-01-01' AND T2.Birthday > '1900-01-01'
SELECT T2.HGB, T1.Birthday, T1.Diagnosis FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.HGB = (SELECT MAX(HGB) FROM `Examination`) ORDER BY (strftime('%Y', T2.`Examination Date`) - strftime('%Y', T1.Birthday)) DESC LIMIT 1
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT T1.T-CHO FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.Date = '1995-09-04' AND T2.ID = 2927464 AND T1.T-CHO < 250
SELECT T2.SEX FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'AORTITIS' ORDER BY T1.`Examination Date` LIMIT 1
SELECT T1.aCL_IgM FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.Description = '1994-02-19' AND T1.`Examination Date` = '1993-11-12'
SELECT T2.SEX FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GPT = 9 AND T1.Date = '1992-06-12'
SELECT T2.Birthday,  T1.Date FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID  =  T2.ID WHERE T1.UA  =  8.4 AND T1.Date  =  '1991-10-21'
SELECT COUNT(T2.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.First_Date = '1991-06-13' AND T1.Diagnosis = 'SJS' AND strftime('%Y', T2.Date) = '1995'
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1997-01-27' AND T2.Diagnosis = 'SLE' AND T1.`First Date` IS NOT NULL ORDER BY T1.`First Date` LIMIT 1
SELECT T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.`Examination Date` = '1993-09-27'
SELECT (SELECT SUM(T1.T_CHO) FROM `Laboratory` AS T1 INNER JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-02-18' AND strftime('%Y-%m', T1.Date) = '1981-11') - (SELECT SUM(T1.T_CHO) FROM `Laboratory` AS T1 INNER JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-02-18' AND strftime('%Y-%m', T1.Date) = '1981-12') AS decrease_rate
SELECT T1.ID FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'Behcet' AND T2.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'
SELECT T1.ID FROM `Examination` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T2.GPT > 30 AND T2.ALB < 4 ORDER BY T1.ID
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+'
SELECT COUNT(*) FROM `Examination` WHERE `Thrombosis` = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM `Examination`)
SELECT CAST(SUM(CASE WHEN T2.UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.`U-PRO` > 0 AND T2.`U-PRO` < 30 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` > 0 AND T2.`U-PRO` < 30
SELECT CAST(SUM(CASE WHEN T2.Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM `Patient` AS T1 INNER JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND strftime('%Y', T1.`First Date`) = '1981'
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.Date LIKE '1991-10%' AND T2.T_BIL < 2.0
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'F' AND `Birthday` BETWEEN '1980-01-01' AND '1989-12-31' AND `ID` IN (SELECT `ID` FROM `Examination` WHERE `ANA Pattern`!= 'P')
SELECT T1.SEX FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID JOIN `Laboratory` AS T3 ON T1.ID = T3.ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP = '2+' AND T3.CRE = 1 AND T3.LDH = 123
SELECT AVG(T1.ALB) FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.PLT > 400 AND T2.Diagnosis = 'SLE'
SELECT T2.Symptoms FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' GROUP BY T2.Symptoms ORDER BY COUNT(T2.Symptoms) DESC LIMIT 1
SELECT T1.Description, T2.Diagnosis FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.ID = 48473
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Diagnosis = 'APS'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE YEAR(T2.Date) = '1997' AND NOT (T2.TP > 6 AND T2.TP < 8.5)
SELECT CAST(SUM(CASE WHEN T1.Diagnosis LIKE '%SLE%' AND T2.PLT < 150000 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 1
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.SEX) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday LIKE '1980%' AND T2.Diagnosis = 'RA'
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Examination_Date BETWEEN '1995-01-01' AND '1997-12-31' AND T1.Diagnosis = 'Behcet' AND T1.Admission = '-'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5
SELECT DATEDIFF(`Examination Date`, `First Date`) FROM `Examination` WHERE `ID` = 821298 LIMIT 1
SELECT UA FROM Laboratory WHERE ID = 57266 AND (UA > 8.0 AND SEX = 'M' OR UA > 6.5 AND SEX = 'F')
SELECT T1.Date FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473 AND T1.GOT >= 60
SELECT T1.SEX,  T1.Birthday,  T1.ID FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID  =  T2.ID WHERE T2.GOT  <  60 AND strftime('%Y',T2.Date) = '1994'
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60 GROUP BY T1.ID HAVING COUNT(*) > 1
SELECT T3.Diagnosis FROM (SELECT T1.ID, T1.GPT, T2.Birthday FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT > 60) AS T3 JOIN Examination AS T4 ON T3.ID = T4.ID ORDER BY T3.Birthday DESC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT T1.ID,  strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH BETWEEN 600 AND 800
SELECT T1.Admisson FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP < 300
SELECT T1.ID,  T1.SEX,  T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID  =  T2.ID WHERE T2.TP  <  6.0
SELECT T1.ID,  T1.TP - 8.5 AS deviation FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.TP > 8.5
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE (T2.ALB <= 3.5 OR T2.ALB >= 5.5) AND T1.SEX = 'M' ORDER BY T1.Birthday DESC
SELECT T1.ID, T1.SEX, T1.Birthday, T2.ALB  FROM `Patient` AS T1  JOIN `Laboratory` AS T2 ON T1.ID = T2.ID  WHERE strftime('%Y', T1.Birthday) = '1982' AND T2.ALB BETWEEN 3.5 AND 5.5
SELECT CAST(SUM(CASE WHEN T2.UA > 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'
SELECT AVG(T2.UA) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T2.UA < 8.0 AND T1.SEX = 'M') OR (T2.UA < 6.5 AND T1.SEX = 'F')
SELECT T1.ID,  T1.SEX,  T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID  =  T2.ID WHERE T2.UN  =  29
SELECT T1.ID, T1.SEX, T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'RA' AND T2.UN < 30
SELECT COUNT(*) FROM Patient WHERE SEX = 'M' AND ID IN (SELECT ID FROM Laboratory WHERE CRE >= 1.5)
SELECT SUM(CASE WHEN T1.SEX = 'M' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) > SUM(CASE WHEN T1.SEX = 'F' AND T2.CRE >= 1.5 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT T1.ID, T1.SEX, T1.Birthday FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.T_BIL = (SELECT MAX(T_BIL) FROM `Laboratory`)
SELECT T1.SEX,  GROUP_CONCAT(DISTINCT T1.ID) FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID  =  T2.ID WHERE T2.`T-BIL` >= 2.0 GROUP BY T1.SEX
SELECT T1.ID, MAX(T2.T-CHO) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MIN(Birthday) FROM `Patient`)
SELECT AVG(T2.TP) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.T_CHO >= 250
SELECT T2.Diagnosis, T1.ID FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG > 300;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) > 50 AND T2.TG >= 200
SELECT DISTINCT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T1.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND T2.CPK >= 250;
SELECT T1.ID,  T1.SEX,  (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) AS age FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.`T-CHO` < 250
SELECT T1.ID, T2.GLU FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 180 AND strftime('%Y', T1.Description) = '1991'
SELECT T1.ID,  T1.SEX,  T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID  =  T2.ID WHERE T2.WBC  <=  3.5 OR T2.WBC  >=  9.0 ORDER BY T1.Birthday ASC
SELECT T1.ID, strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5 GROUP BY T1.ID, Age ORDER BY T1.ID;
SELECT T1.Admission FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) >= 50 AND (T2.RBC <= 3.5 OR T2.RBC >= 6.0)
SELECT T1.ID,  T1.SEX FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID  =  T2.ID WHERE T1.Admission  =  '-' AND T2.HGB  <  10
SELECT T1.ID, T1.SEX FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.HGB BETWEEN 10 AND 17 ORDER BY T1.Birthday ASC LIMIT 1
SELECT T1.ID,  strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T1.ID) >= 2
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;
SELECT SUM(CASE WHEN T2.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.PLT > 400 THEN 1 ELSE 0 END) AS difference FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T2.PLT < 100 OR T2.PLT > 400)
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.PLT BETWEEN 100 AND 400 AND strftime('%Y', 'now') - strftime('%Y', T1.Birthday) < 50 AND strftime('%Y', T2.Date) = '1984'
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', 'now') - strftime('%Y', T1.Birthday) > 55 AND T2.PT >= 14;
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PT < 14 AND strftime('%Y', T1.First_Date) > '1992'
SELECT COUNT(*) FROM `Examination` WHERE `Examination Date` > '1997-01-01' AND APTT < 45;
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.APTT > 45
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450)
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.`U-PRO` BETWEEN 0 AND 30
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.IGG >= 2000;
SELECT COUNT(*) FROM Examination WHERE aCL_IgG * 1000 BETWEEN 900 AND 2000 AND Symptoms IS NOT NULL;
SELECT T2.Diagnosis FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.IGA BETWEEN 80 AND 500 ORDER BY T1.IGA DESC LIMIT 1
SELECT COUNT(T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.IGA > 80 AND T2.IGA < 500 AND strftime('%Y', T1.`First Date`) >= '1990'
SELECT T2.Diagnosis FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.IGM <= 40 OR T1.IGM >= 400 GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1
SELECT COUNT(*) FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `CRP` = '+') AND `Description` IS NULL;
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) < 70;
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.KCT = '+' AND T2.RF IN ('-', '+-')
SELECT T2.Diagnosis FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.Birthday >= '1985-01-01' AND T1.RF IN ('-', '+-')
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) > 60;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.RF < 20 AND T2.Thrombosis = 0;
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ANA_Pattern = 'P' AND T2.C3 > 35
SELECT T1.ID FROM `Examination` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.HCT < 29 OR T2.HCT > 52 ORDER BY T1.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 1 AND T2.C4 > 10;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.RNP IN ('-', '0')
SELECT T2.Birthday FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.RNP NOT IN ('-', '+-') ORDER BY T2.Birthday DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE `SM` IN ('-', '+-') AND `Thrombosis` = 0;
SELECT T1.ID FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.SM NOT IN ('negative', '0') ORDER BY T1.Birthday DESC LIMIT 3
SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T2.SC170 IN('negative','0')
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Symptoms IS NULL AND T2.SC170 IN('negative', '0')
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN ('-','+-') AND strftime('%Y', T1.`First Date`) < '2000'
SELECT T1.ID FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.SSA NOT IN ('negative', '0') ORDER BY T2.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SSB IN ('-', '0') AND T1.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT e.ID) FROM Examination e WHERE e.SSB IN ('negative', '0') AND e.Symptoms IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CENTROMEA IN ('-', '+-') AND T2.SSB IN ('-', '+-')
SELECT T1.Diagnosis FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.`DNA-II` >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T1.Description IS NULL
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.IGG BETWEEN 900 AND 2000
SELECT CAST(SUM(IIF(T2.GOT >= 60 AND T1.Diagnosis = 'SLE', 1, 0)) AS REAL) * 100 / SUM(IIF(T2.GOT >= 60, 1, 0)) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60;
SELECT T2.Birthday FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GOT >= 60 ORDER BY T2.Birthday DESC LIMIT 1
SELECT T2.Birthday FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GPT < 60 ORDER BY T1.GPT DESC LIMIT 3;
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60 AND T1.SEX = 'M'
SELECT T1.FirstDate FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 GROUP BY T1.ID ORDER BY MAX(T2.LDH) DESC LIMIT 1
SELECT T2.Date FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300 AND T1.Admission = '+'
SELECT COUNT(*) FROM `Examination` E JOIN `Patient` P ON E.ID = P.ID JOIN `Laboratory` L ON E.ID = L.ID WHERE P.Admission = '-' AND L.ALP < 300;
SELECT T3.Diagnosis FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID JOIN `Examination` AS T3 ON T1.ID = T3.ID WHERE T1.TP < 6.0 GROUP BY T3.Diagnosis
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Diagnosis LIKE '%SJS%' AND l.TP > 6.0 AND l.TP < 8.5;
SELECT T2.Examination_Date FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ALB BETWEEN 3.5 AND 5.5 ORDER BY T1.ALB DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB BETWEEN 3.5 AND 5.5 AND T2.TP BETWEEN 6.0 AND 8.5
SELECT T2.aCL_IgG, T2.aCL_IgM, T2.aCL_IgA FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.UA > 6.50 AND T2.SEX = 'F' ORDER BY T1.UA DESC LIMIT 1
SELECT MAX(T1.ANA) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5
SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5 ORDER BY T1.aCL_IgA DESC LIMIT 1
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.ANA_Pattern LIKE '%P%' AND l.T_BIL >= 2.0;
SELECT T2.ANA FROM `Laboratory` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` < 2.0 ORDER BY T1.`T-BIL` DESC LIMIT 1
SELECT COUNT(*) FROM `Examination` WHERE `KCT` = '-' AND `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `T-CHO` >= 250)
SELECT COUNT(*) FROM Examination WHERE `ANA Pattern` = 'P' AND `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `T-CHO` < 250)
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms IS NOT NULL;
SELECT T3.Diagnosis FROM (SELECT T1.ID, T1.TG FROM Laboratory AS T1 WHERE T1.TG < 200) AS T2 JOIN Patient AS T3 ON T2.ID = T3.ID WHERE T2.TG = (SELECT MAX(TG) FROM (SELECT TG FROM Laboratory WHERE TG < 200))
SELECT T1.ID FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.CPK < 250;
SELECT COUNT(*) FROM `Examination` WHERE `CPK` < 250 AND (`KCT` = '+' OR `RVVT` = '+' OR `LAC` = '+')
SELECT T2.Birthday FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.GLU > 180 ORDER BY T2.Birthday ASC LIMIT 1
SELECT COUNT(*) FROM `Examination` WHERE `Thrombosis` = 0 AND `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `GLU` < 180)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(*) FROM `Examination` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SLE%' AND T2.WBC BETWEEN 3.5 AND 9.0;
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE (T2.RBC <= 3.5 OR T2.RBC >= 6.0) AND T1.Admission = '+'
SELECT COUNT(*) FROM `Examination` WHERE `PLT` > 100 AND `PLT` < 400 AND `Diagnosis` IS NOT NULL;
SELECT T2.PLT FROM `Examination` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT BETWEEN 100 AND 400
SELECT AVG(T2.PT) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14
SELECT COUNT(*) FROM `Examination` WHERE `Thrombosis` IN (1, 2) AND `PT` < 14;
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `college` = 'College of Engineering')
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design Department'
SELECT COUNT(T1.link_to_member) FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Women''s Soccer'
SELECT T3.phone FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event JOIN `member` AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer'
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Women''s Soccer' AND T1.t_shirt_size = 'Medium'
SELECT T1.event_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1
SELECT T3.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.position = 'Vice President'
SELECT T1.event_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event JOIN `member` AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Maya' AND T3.last_name = 'Mclean'
SELECT COUNT(*) FROM attendance WHERE link_to_event IN (SELECT event_id FROM event WHERE YEAR(event_date) = 2019) AND link_to_member IN (SELECT member_id FROM member WHERE first_name = 'Sacha' AND last_name = 'Harrison')
SELECT COUNT(*) AS meeting_count FROM (     SELECT e.event_id     FROM event e     JOIN attendance a ON e.event_id = a.link_to_event     WHERE e.type = 'Meeting'     GROUP BY e.event_id     HAVING COUNT(a.link_to_member) > 10 ) AS meeting_events;
SELECT T1.event_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type!= 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T2.link_to_event) > 20
SELECT AVG(attendance_count) FROM (SELECT COUNT(T2.link_to_member) AS attendance_count FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE YEAR(T1.event_date) = 2020 AND T1.type = 'Meeting' GROUP BY T1.event_name)
SELECT expense_description FROM expense WHERE cost = (SELECT MAX(cost) FROM expense)
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Environmental Engineering')
SELECT T3.first_name, T3.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Laugh Out Loud'
SELECT T1.last_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'
SELECT T2.county FROM `member` AS T1 JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT T2.college FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'
SELECT SUM(T1.amount) FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT SUM(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.event_name = 'September Meeting'
SELECT T3.city, T3.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President' AND T1.first_name = 'Connor' AND T1.last_name = 'Hilton'
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois'
SELECT SUM(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' AND T2.event_name = 'September Meeting'
SELECT T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Pierce' OR T1.first_name = 'Guidi' GROUP BY T2.department HAVING COUNT(*) = 2
SELECT SUM(T2.amount) FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'
SELECT T3.approved FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.link_to_member = T3.link_to_member WHERE T1.event_name = 'October Meeting' AND T1.event_date = '2019-10-08T12:00:00'
SELECT AVG(T1.cost) FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND (SUBSTR(T1.expense_date, 6, 2) = '09' OR SUBSTR(T1.expense_date, 6, 2) = '10')
SELECT SUM(CASE WHEN SUBSTR(T1.event_date, 1, 4) = '2019' THEN T2.spent ELSE 0 END) - SUM(CASE WHEN SUBSTR(T1.event_date, 1, 4) = '2020' THEN T2.spent ELSE 0 END) FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.event_status = 'Closed'
SELECT T1.location FROM `event` AS T1 WHERE T1.event_name = 'Spring Budget Review'
SELECT T1.cost FROM `expense` AS T1 JOIN `budget` AS T2 ON T1.link_to_budget = T2.budget_id JOIN `event` AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_date = '2019-09-04' AND T1.expense_description = 'Posters'
SELECT T1.remaining FROM `budget` AS T1 WHERE T1.category = 'Food' AND T1.amount = (SELECT MAX(amount) FROM `budget` WHERE category = 'Food')
SELECT T1.notes FROM `income` AS T1 WHERE T1.source = 'Fundraising' AND T1.date_received = '2019-09-14'
SELECT COUNT(*) FROM `major` WHERE `college` = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT T2.county FROM `member` AS T1 JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O'Gallagher'
SELECT COUNT(*) FROM budget WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'November Meeting') AND remaining < 0
SELECT SUM(T2.amount) FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Speaker'
SELECT T3.event_status FROM `expense` AS T1 JOIN `budget` AS T2 ON T1.link_to_budget = T2.budget_id JOIN `event` AS T3 ON T2.link_to_event = T3.event_id WHERE T1.expense_description = 'Post Cards, Posters' AND T1.expense_date = '2019-08-20'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'
SELECT COUNT(*) FROM `member` WHERE `t_shirt_size` = 'Medium' AND `link_to_major` = (SELECT `major_id` FROM `major` WHERE `major_name` = 'Business')
SELECT T2.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T3.department FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'President' GROUP BY T3.department LIMIT 1
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.source = 'Dues' ORDER BY T2.date_received ASC LIMIT 1
SELECT COUNT(*) FROM ( SELECT SUM(T1.amount) AS YearlyKickoff, SUM(T2.amount) AS OctoberMeeting FROM ( SELECT amount FROM budget WHERE category = 'Advertisement' AND link_to_event IN ( SELECT event_id FROM event WHERE event_name = 'Yearly Kickoff' ) ) T1, ( SELECT amount FROM budget WHERE category = 'Advertisement' AND link_to_event IN ( SELECT event_id FROM event WHERE event_name = 'October Meeting' ) ) T2 WHERE T1.amount > T2.amount ) AS T3 WHERE T3.YearlyKickoff > T3.OctoberMeeting;
SELECT (SUM(T2.amount WHERE T2.category = 'Parking' AND T1.event_name = 'November Speaker') / SUM(T2.amount WHERE T1.event_name = 'November Speaker')) * 100 FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' AND T1.event_name = 'November Speaker'
SELECT SUM(T1.cost) FROM `expense` AS T1 INNER JOIN `budget` AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Pizza'
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT DISTINCT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T3.city, T3.county, T3.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T2.expense_description FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T1.remaining = (SELECT MIN(remaining) FROM budget)
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `attendance` AS T2 ON T1.member_id = T2.link_to_member JOIN `event` AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting'
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id GROUP BY T2.college ORDER BY COUNT(T1.member_id) DESC LIMIT 1
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.amount = (SELECT MAX(amount) FROM `budget`)
SELECT T1.expense_description FROM `expense` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT COUNT(*) FROM attendance WHERE link_to_event = (SELECT event_id FROM event WHERE event_name = 'Women''s Soccer')
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'
SELECT COUNT(*) FROM `member` WHERE `zip` IN (SELECT `zip_code` FROM `zip_code` WHERE `state` = 'Maryland')
SELECT COUNT(*) FROM attendance WHERE link_to_member = (SELECT member_id FROM member WHERE phone = '954-555-6240')
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President'
SELECT MAX(spent) FROM budget
SELECT COUNT(*) FROM `event` WHERE `type` = 'Meeting' AND YEAR(`event_date`) = 2020
SELECT SUM(T1.spent) FROM budget AS T1 WHERE T1.category = 'Food'
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `attendance` AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id HAVING COUNT(T2.link_to_event) > 7
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Interior Design') AND T3.event_name = 'Community Theater'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'
SELECT SUM(T2.amount) FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Grant' AND T1.last_name = 'Gilmour'
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `income` AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount > 40
SELECT SUM(T1.cost) FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Yearly Kickoff'
SELECT T3.first_name, T3.last_name FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name, T2.source FROM `member` AS T1 JOIN `income` AS T2 ON T1.member_id = T2.link_to_member WHERE T2.amount = (SELECT MAX(amount) FROM `income`)
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.spent IS NOT NULL ORDER BY T2.spent ASC LIMIT 1
SELECT (SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN T3.cost ELSE 0 END) / SUM(T3.cost)) * 100 AS percentage FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense` AS T3 ON T2.budget_id = T3.link_to_budget
SELECT COUNT(*) FILTER (WHERE T1.major_name = 'Finance') / COUNT(*) FILTER (WHERE T1.major_name = 'Physics') FROM `major` AS T1 JOIN `member` AS T2 ON T1.major_id = T2.link_to_major)
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1
SELECT T1.first_name, T1.last_name, T1.email FROM member AS T1 WHERE T1.position = 'Secretary'
SELECT COUNT(*) FROM `member` WHERE `link_to_major` = (SELECT `major_id` FROM `major` WHERE `major_name` = 'Physics Teaching')
SELECT COUNT(T2.link_to_member) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND YEAR(T1.event_date) = 2019
SELECT COUNT(T3.link_to_event), T5.major_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id JOIN major AS T5 ON T1.link_to_major = T5.major_id WHERE T1.first_name = 'Luisa' AND T1.last_name = 'Guidi' GROUP BY T5.major_name;
SELECT AVG(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.status = 'Closed'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1
SELECT COUNT(*) > 0 FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer'
SELECT (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100 / COUNT(event_id)) AS percentage FROM `event` WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31'
SELECT T1.cost FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.expense_description = 'Posters' AND T3.event_name = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1
SELECT SUM(T3.cost), T3.expense_description FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'October Meeting' AND T3.approved = 'true'
SELECT SUM(T1.amount), T1.category FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'April Speaker' GROUP BY T1.category ORDER BY SUM(T1.amount) ASC
SELECT link_to_event FROM budget WHERE category = 'Food' AND amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food')
SELECT link_to_event FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.member_id ='rec4BLdZHS2Blfp4v' GROUP BY T1.first_name, T1.last_name;
SELECT T1.expense_description FROM `expense` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Sacha' AND T2.last_name = 'Harrison'
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'X-Large'
SELECT T3.zip FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T1.cost < 50
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'
SELECT T1.position FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT COUNT(*) FROM `member` WHERE `link_to_major` = (SELECT `major_id` FROM `major` WHERE `major_name` = 'Business') AND `t_shirt_size` = 'Medium'
SELECT DISTINCT T1.type FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30
SELECT type FROM event WHERE location = 'MU 215'
SELECT type FROM event WHERE event_date = '2020-03-24T12:00:00'
SELECT T3.major_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Vice President'
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Member'
SELECT DISTINCT T1.type FROM `event` AS T1 WHERE T1.location = 'MU 215'
SELECT count(*) FROM income WHERE amount = 50
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'
SELECT COUNT(*) FROM `major` WHERE `department` = 'School of Applied Sciences, Technology and Education' AND `college` = 'College of Agriculture and Applied Sciences'
SELECT T1.last_name, T3.department, T3.college FROM `member` AS T1 JOIN `major` AS T3 ON T1.link_to_major = T3.major_id WHERE T3.major_name = 'Environmental Engineering'
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0
SELECT T3.city, T3.state FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T2.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'
SELECT T1.event_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event JOIN `member` AS T3 ON T2.link_to_member = T3.member_id WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social'
SELECT T1.last_name, T1.position FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Pizza' AND T2.expense_date = '2019-09-10'
SELECT T3.last_name FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Women''s Soccer' AND T3.position = 'Member'
SELECT CAST(SUM(CASE WHEN T3.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM `member` AS T1 JOIN `income` AS T3 ON T1.member_id = T3.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'
SELECT T1.state FROM zip_code AS T1 WHERE T1.type = 'PO Box'
SELECT zip_code FROM zip_code WHERE state = 'PR' AND county = 'San Juan Municipio' AND type = 'PO Box'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'
SELECT T1.link_to_event FROM `attendance` AS T1 JOIN `income` AS T2 ON T1.link_to_member = T2.link_to_member WHERE T2.amount > 50
SELECT T1.first_name, T1.last_name, T2.link_to_event FROM `member` AS T1 JOIN `expense` AS T2 ON T1.member_id = T2.link_to_member WHERE T2.approved = 'true' AND T2.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T2.college FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major ='rec1N0upiVLy5esTO'
SELECT T1.phone FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T2.college = 'College of Agriculture and Applied Sciences'
SELECT T1.email FROM `member` AS T1 JOIN `expense` AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > 20 AND T2.expense_date BETWEEN '2019-09-10' AND '2019-11-19'
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `major_name` = 'education' AND `college` = 'College of Education & Human Services') AND `position` = 'Member'
SELECT CAST(SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.budget_id) FROM budget b
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code
SELECT T1.event_name, T1.location FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense` AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost > 50 AND T3.cost < 100
SELECT T3.first_name, T3.last_name, T4.major_name FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id JOIN member AS T3 ON T1.link_to_member = T3.member_id JOIN major AS T4 ON T3.link_to_major = T4.major_id WHERE T1.cost > 100
SELECT T1.city, T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip JOIN attendance AS T3 ON T3.link_to_member = T2.member_id JOIN event AS T4 ON T3.link_to_event = T4.event_id WHERE T4.status = 'Open' GROUP BY T3.link_to_event HAVING COUNT(T3.link_to_member) > 40
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `expense` AS T2 ON T1.member_id = T2.link_to_member WHERE T2.link_to_event IN (SELECT link_to_event FROM `expense` GROUP BY link_to_event HAVING COUNT(link_to_event) > 1) GROUP BY T2.link_to_member ORDER BY SUM(T2.cost) DESC LIMIT 1
SELECT AVG(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position!= 'Member'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense` AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Parking' AND T3.cost < (SELECT AVG(cost) FROM `expense` WHERE expense_description = 'Parking')
SELECT SUM(T2.cost) / COUNT(T1.event_id) * 100 FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting'
SELECT T2.budget_id FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Water, chips, cookies' ORDER BY T1.cost DESC LIMIT 1
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `expense` AS T2 ON T1.member_id = T2.link_to_member ORDER BY T2.cost DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > (SELECT AVG(cost) FROM expense)
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.position)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.position)) FROM `member` AS T1 JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member'
SELECT T1.major_name, T1.department FROM `major` AS T1 JOIN `member` AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T2.cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'
SELECT T1.last_name, T1.phone FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'
SELECT T1.category, T1.amount FROM `budget` AS T1 INNER JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'
SELECT T1.first_name, T1.last_name, T2.amount FROM `member` AS T1 JOIN `income` AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '2019-09-09'
SELECT T2.category FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'
SELECT T1.first_name, T1.last_name, T2.college FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'
SELECT T2.event_name, SUM(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts' GROUP BY T2.event_name
SELECT T2.city FROM `member` AS T1 JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T2.zip_code = 28092
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) AS Ratio FROM customers
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212' AND T1.Segment = 'LAM' ORDER BY T2.Consumption ASC LIMIT 1
SELECT AVG(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312'
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201101' AND '201112' AND T1.Currency = 'CZK' GROUP BY T1.CustomerID ORDER BY SUM(T2.Consumption) DESC LIMIT 1
SELECT COUNT(*) FROM customers WHERE CustomerID IN (SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND Consumption < 30000) AND Segment = 'KAM'
SELECT      (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')) -     (SELECT SUM(Consumption) FROM yearmonth WHERE Date BETWEEN '201201' AND '201212' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'EUR')) AS Difference_in_Consumption ;
SELECT strftime('%Y', Date) AS Year, SUM(Amount) AS TotalGasUse FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR' GROUP BY Year ORDER BY TotalGasUse DESC LIMIT 1;
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1
SELECT strftime('%Y', Date) AS Year, SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312' ORDER BY T2.Consumption DESC LIMIT 1;
SELECT      (SELECT SUM(T1.Consumption) / COUNT(T1.CustomerID) FROM yearmonth AS T1       JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID       WHERE T2.Segment = 'SME' AND T1.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(T1.Consumption) / COUNT(T1.CustomerID) FROM yearmonth AS T1       JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID       WHERE T2.Segment = 'LAM' AND T1.Date BETWEEN '201301' AND '201312') AS Diff_SME_LAM,     (SELECT SUM(T1.Consumption) / COUNT(T1.CustomerID) FROM yearmonth AS T1       JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID       WHERE T2.Segment = 'LAM' AND T1.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(T1.Consumption) / COUNT(T1.CustomerID) FROM yearmonth AS T1       JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID       WHERE T2.Segment = 'KAM' AND T1.Date BETWEEN '201301' AND '201312') AS Diff_LAM_KAM,     (SELECT SUM(T1.Consumption) / COUNT(T1.CustomerID) FROM yearmonth AS T1       JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID       WHERE T2.Segment = 'KAM' AND T1.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(T1.Consumption) / COUNT(T1.CustomerID) FROM yearmonth AS T1       JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID       WHERE T2.Segment = 'SME' AND T1.Date BETWEEN '201301' AND '201312') AS Diff_KAM_SME ;
SELECT T1.Segment,  (SUM(CASE WHEN SUBSTR(T2.Date,1,4) = '2013' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN SUBSTR(T2.Date,1,4) = '2012' THEN T2.Consumption ELSE 0 END)) / SUM(CASE WHEN SUBSTR(T2.Date,1,4) = '2013' THEN T2.Consumption ELSE 0 END) * 100 AS PercentageIncrease FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T1.Segment IN ('SME','LAM','KAM') GROUP BY T1.Segment ORDER BY PercentageIncrease DESC,  PercentageIncrease ASC LIMIT 1
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT COUNT(*) FROM (SELECT * FROM gasstations WHERE Country = 'CZE' AND Segment = 'Value for money') AS CZE_discount_stations EXCEPT SELECT COUNT(*) FROM (SELECT * FROM gasstations WHERE Country = 'SVK' AND Segment = 'Value for money') AS SVK_discount_stations
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference;
SELECT COUNT(*) AS SMEs_in_CZK,  COUNT(*) AS SMEs_in_EUR FROM customers WHERE Segment = 'SME' AND Currency = 'CZK' UNION SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR'
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1
SELECT T1.CustomerID, MAX(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'
SELECT SUM(Consumption) FROM yearmonth WHERE Date = '201305' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM')
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'
SELECT Country, COUNT(*) AS NumberOfValueForMoneyStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY NumberOfValueForMoneyStations DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T1.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 WHERE T1.Segment = 'KAM'
SELECT CAST(SUM(CASE WHEN T1.Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM yearmonth AS T1 WHERE SUBSTR(T1.Date, 1, 6) = '201202'
SELECT CAST(SUM(IIF(T2.Segment = 'Premium', 1, 0)) AS REAL) * 100 / COUNT(T2.GasStationID) FROM `gasstations` AS T2 WHERE T2.Country = 'SVK'
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date = '201206' ORDER BY T2.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'
SELECT MAX(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' GROUP BY T2.Date ORDER BY T2.Date LIMIT 1
SELECT T3.Description FROM yearmonth AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T2.ProductID = T3.ProductID WHERE T1.Date LIKE '201309%'
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date LIKE '2013-06%' GROUP BY T2.Country
SELECT T3.ChainID FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.Currency = 'EUR' GROUP BY T3.ChainID
SELECT T3.Description FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Currency = 'EUR'
SELECT AVG(Amount * Price) FROM transactions_1k WHERE Date LIKE '2012-01%'
SELECT COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Consumption > 1000
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'
SELECT T1.Time FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11 GROUP BY T1.Time
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Date > '2012-01-01'
SELECT AVG(T1.Price * T1.Amount) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'
SELECT AVG(T1.Price * T1.Amount)  FROM transactions_1k AS T1  JOIN customers AS T2  ON T1.CustomerID = T2.CustomerID  WHERE T2.Currency = 'EUR'
SELECT `CustomerID`  FROM `transactions_1k`  WHERE `Date` = '2012-08-25'  GROUP BY `CustomerID`  ORDER BY SUM(`Amount` * `Price`) DESC  LIMIT 1;
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time ASC LIMIT 1
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')
SELECT Segment FROM customers WHERE CustomerID = (SELECT MIN(CustomerID) FROM customers)
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT T1.ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'
SELECT T1.Date, T1.Consumption FROM yearmonth AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Price = 124.05 AND strftime('%Y-%m', T1.Date) = '2012-01'
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'
SELECT T1.Currency FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17
SELECT T3.Country FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.CardID = 667467
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Amount * T2.Price = 548.4
SELECT CAST(COUNT(CASE WHEN T2.Currency = 'EUR' THEN T1.CustomerID ELSE NULL END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25'
SELECT (SELECT SUM(T1.Amount) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.CustomerID IN (SELECT T3.CustomerID FROM transactions_1k AS T3 WHERE T3.Date = '2012-08-24' AND T3.Price * T3.Amount = 634.8)) - (SELECT SUM(T4.Consumption) FROM yearmonth AS T4 WHERE T4.Date LIKE '2013%' AND T4.CustomerID IN (SELECT T5.CustomerID FROM transactions_1k AS T5 WHERE T5.Date = '2012-08-24' AND T5.Price * T5.Amount = 634.8)) AS ConsumptionDecrease, (SELECT SUM(T1.Amount) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.CustomerID IN (SELECT T3.CustomerID FROM transactions_1k AS T3 WHERE T3.Date = '2012-08-24' AND T3.Price * T3.Amount = 634.8)) AS Consumption2012 FROM yearmonth WHERE Date LIKE '2012%' AND CustomerID IN (SELECT T6.CustomerID FROM transactions_1k AS T6 WHERE T6.Date = '2012-08-24' AND T6.Price * T6.Amount = 634.8)
SELECT T1.GasStationID, SUM(T2.Amount * T2.Price) AS Revenue FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T1.GasStationID ORDER BY Revenue DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T2 WHERE T2.Country = 'SVK'
SELECT SUM(T1.Amount) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.CustomerID = 38508 AND strftime('%Y%m', T1.Date) = '201201'
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID GROUP BY T1.ProductID ORDER BY SUM(T2.Amount) DESC LIMIT 5
SELECT T1.CustomerID, T3.Currency, SUM(T2.Price) / SUM(T2.Amount) AS AvgPricePerItem FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN (SELECT CustomerID, SUM(Amount * Price) AS TotalSpent FROM transactions_1k GROUP BY CustomerID ORDER BY TotalSpent DESC LIMIT 1) AS T4 ON T1.CustomerID = T4.CustomerID JOIN (SELECT CustomerID, Currency FROM customers GROUP BY CustomerID) AS T3 ON T1.CustomerID = T3.CustomerID GROUP BY T1.CustomerID
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 AND T1.Amount = 1 ORDER BY T1.Price DESC LIMIT 1
SELECT T3.Consumption FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T1.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29.00 AND T3.Date = '201208'
