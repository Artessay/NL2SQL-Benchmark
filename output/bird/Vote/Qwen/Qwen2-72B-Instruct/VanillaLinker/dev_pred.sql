SELECT MAX(`Percent (%) Eligible Free (K-12)`) FROM frpm WHERE `County Name` = 'Alameda County'
SELECT T1.SchoolName ,  CAST(T1.`Free Meal Count (Ages 5-17)` AS REAL) / T1.`Enrollment (Ages 5-17)` AS eligible_free_rate_5_17 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.StatusType = 'Continuation' ORDER BY eligible_free_rate_5_17 ASC LIMIT 3
SELECT T1.Zip FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 AND T1.County = 'FRESNO COUNTY OFFICE OF EDUCATION'
SELECT T1.MailStreet FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`FRPM Count (K-12)` = ( SELECT MAX(`FRPM Count (K-12)`) FROM frpm )
SELECT T3.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1 CharterSchool (Y / N) = 1 AND T2.OpenDate > '2000-01-01' AND T1.CharterFundingType = 'Direct funded'
SELECT COUNT(*) FROM satscores WHERE `AvgScrMath` > 400 AND EXISTS (SELECT 1 FROM schools WHERE schools.CDSCode = satscores.cds AND schools.Virtual = 'F')
SELECT T2.School FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 500 AND T2.Magnet = 1;
SELECT T1.Phone FROM schools AS T1 JOIN `satscores` AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 > 0 ORDER BY T2.NumTstTakr DESC LIMIT 1
SELECT t2.NumTstTakr FROM frpm AS t1 JOIN satscores AS t2 ON t1.CDSCode = t2.cds WHERE t1."Percent (%) Eligible FRPM (K-12)" = (SELECT MAX(`Percent (%) Eligible FRPM (K-12)`) FROM `frpm`)
SELECT COUNT(*) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds  =  T2.CDSCode WHERE T1.AvgScrMath  >  560 AND T2.FundingType  =  'Direct Charter'
SELECT T3.FRPM_Count_ Ages_5_17 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode INNER JOIN frpm AS T3 ON T2.CDSCode = T3.CDSCode WHERE T1.Avg_Scr_Read = (SELECT MAX(Avg_Scr_Read) FROM satscores)
SELECT CDSCode FROM frpm WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500;
SELECT MAX(T2."Free Meal Count (Ages 5-17)" / T2."Enrollment (Ages 5-17)") FROM satscores AS T1 JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr > 0.3
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds  =  T2.CDSCode WHERE (T1.NumGE1500 * 100 / NULLIF(T1.NumTstTakr, 0)) IS NOT NULL ORDER BY (T1.NumGE1500 * 100 / NULLIF(T1.NumTstTakr, 0)) DESC LIMIT 3
SELECT NCESSchool FROM schools WHERE CDSCode IN (SELECT CDSCode FROM frpm ORDER BY `Enrollment (Ages 5-17)` DESC LIMIT 5)
SELECT T1.District FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.StatusType = 'Active' GROUP BY T1.District ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 1
SELECT COUNT(s.CDSCode) FROM satscores AS ss JOIN schools AS s ON ss.cds = s.CDSCode WHERE s.County = 'Alameda' AND ss.NumTstTakr < 100;
SELECT T2.School, T2.CharterNum  FROM satscores AS T1  JOIN schools AS T2 ON T1.cds = T2.CDSCode  WHERE T1.AvgScrWrite > 499  ORDER BY T1.AvgScrWrite DESC  WHERE T2.CharterNum IS NOT NULL;
SELECT COUNT(*) FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.County = 'Fresno' AND s.FundingType = 'Directly Funded' AND ss.NumTstTakr <= 250;
SELECT T1.Phone FROM `schools` AS T1 JOIN `satscores` AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM `satscores`)
SELECT COUNT(*) FROM frpm WHERE `Low Grade` = '9' AND `High Grade` = '12' AND `County Name` = 'Amador'
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'LOS ANGELES' AND `Free Meal Count (K-12)` > 500 AND `FRPM Count (K-12)` < 700;
SELECT s.School FROM schools AS s JOIN satscores AS ss ON s.CDSCode = ss.cds WHERE s.County = ' Contra Costa ' ORDER BY ss.NumTstTakr DESC LIMIT 1
SELECT T1.School, T1.Street, T1.City, T1.Zip FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)` > 30
SELECT s.School  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE (f.Free_Meal_Count_K_12 / f.Enrollment_K_12) > 0.1 AND ss.NumGE1500 >= 1500
SELECT T3.FundingType FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' AND T2.County = 'Riverside' GROUP BY T2.CDSCode HAVING AVG(T1.AvgScrMath) > 400
SELECT s.School, s.Street, s.City, s.State, s.Zip  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE f.County_name = 'Monterey' AND f.FreeMealCount Ages5-17 > 800 AND s.GSoffered LIKE '%12%'
SELECT T2.School ,  T1.AvgScrWrite ,  T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T2.CDSCode = T1.cds WHERE (T2.OpenDate > '1991-01-01' OR T2.ClosedDate < '2000-01-01') AND T1.AvgScrWrite IS NOT NULL;
SELECT T1.School, T1.DOCType FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Enrollment_K_12 - T2.Enrollment_Ages_5_17 > ( SELECT AVG(Enrollment_K_12 - Enrollment_Ages_5_17) FROM frpm WHERE FundingType = 'Local' ) AND T2.FundingType = 'Local'
SELECT T.School, T.OpenDate FROM schools AS T WHERE T.GSoffered = 'K-12' ORDER BY T.enroll12 DESC LIMIT 1;
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT `Percent (%) Eligible Free (K-12)` FROM `frpm` ORDER BY `Enrollment (K-12)` DESC LIMIT 10 OFFSET 9
SELECT frpm.`School Name`, frpm.`Percent (%) Eligible FRPM (K-12)`  FROM frpm  WHERE frpm.IRC = 66  ORDER BY frpm.`Free Meal Count (K-12)` DESC, frpm.`FRPM Count (K-12)` DESC  LIMIT 5;
SELECT T3.Website, T3.School FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT T2.`Free Meal Count (Ages 5-17)`, T2.`Enrollment (Ages 5-17)` FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson'
SELECT T1.AdmEmail1 FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Charter School (Y/N)` = 1 ORDER BY T2.`Enrollment (K-12)` ASC LIMIT 1
SELECT T3.AdmFName1 ,  T3.AdmLName1 ,  T3.AdmFName2 ,  T3.AdmLName2 ,  T3.AdmFName3 ,  T3.AdmLName3 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode INNER JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T1.NumGE1500 >= 1500 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr != 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr LIMIT 1;
SELECT T1.Website FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr BETWEEN 2000 AND 3000 AND T1.County = "Los Angeles"
SELECT AVG(T2.NumTstTakr) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND strftime('%Y', T1.OpenDate) = '1980'
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Fresno Unified' ORDER BY T2.AvgScrRead ASC LIMIT 1;
SELECT T1.School FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F' GROUP BY T1.County, T1.School ORDER BY AVG(T2.AvgScrRead) DESC LIMIT 5;
SELECT T1.Educational_Option_Type FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores) GROUP BY T1.Educational_Option_Type ORDER BY AVG(T2.AvgScrMath) DESC LIMIT 1;
SELECT s.AvgScrMath, sc.County  FROM satscores AS s  JOIN schools AS sc ON s.cds = sc.CDSCode  WHERE (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) =  (SELECT MIN(AvgTotalScore) FROM  (SELECT (s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite) AS AvgTotalScore FROM satscores AS s  JOIN schools AS sc ON s.cds = sc.CDSCode) AS subquery) LIMIT 1
SELECT T2.CITY, AVG(T1.AvgScrWrite) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores WHERE NumTstTakr = (SELECT MAX(NumTstTakr) FROM satscores WHERE NumGE1500 >= 1500))
SELECT T2.School ,  AVG(T1.AvgScrWrite) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.AdmFName1 = 'Ricci' AND T2.AdmLName1 = 'Ulrich' GROUP BY T2.School
SELECT T1.School, T2.`Enrollment (K-12)` FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.DOC = '31' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT COUNT(CDSCode) / 12 AS monthly_average FROM schools WHERE County = 'Alameda' AND DOC = '52' AND strftime('%Y', OpenDate) = '1980'
SELECT CAST(COUNT(CASE WHEN T1.DOC = 54 THEN T1.CDSCode ELSE NULL END) AS REAL) / COUNT(CASE WHEN T1.DOC = 52 THEN T1.CDSCode ELSE NULL END) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Orange' AND T1.Statustype = 'merged';
SELECT T2.County ,  T1.School ,  T1.ClosedDate FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.StatusType = 'Closed' GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1
SELECT schools.Street FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrMath IN (SELECT AvgScrMath FROM satscores ORDER BY AvgScrMath DESC LIMIT 6,1) ORDER BY satscores.AvgScrMath DESC LIMIT 1;
SELECT T1.Street, MIN(T2.AvgScrRead) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailStreet IS NOT NULL AND T2.AvgScrRead IS NOT NULL GROUP BY T1.Street ORDER BY AVG(T2.AvgScrRead) ASC LIMIT 1;
SELECT COUNT(T1.CDSCode) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Lakeport' AND T2.AvgScrRead + T2.AvgScrMath + T2.AvgScrWrite >= 1500
SELECT SUM(T2.NumTstTakr) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'FRESNO'
SELECT T1.School, T1.MailZip FROM schools AS T1 WHERE T1.AdmFName1 = 'Avetik' AND T1.AdmLName1 = 'Atoian' OR T1.AdmFName2 = 'Avetik' AND T1.AdmLName2 = 'Atoian' OR T1.AdmFName3 = 'Avetik' AND T1.AdmLName3 = 'Atoian'
SELECT CAST(COUNT(CASE WHEN County = 'Colusa' THEN CDSCode ELSE NULL END) AS REAL) / COUNT(CASE WHEN County = 'Humboldt' THEN CDSCode ELSE NULL END) FROM schools WHERE MailState = 'CA'
SELECT COUNT(*) FROM schools WHERE City = 'San Joaquin' AND MailState = 'CA' AND StatusType = 'Active'
SELECT T1.Phone, T1.Ext FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds ORDER BY T2.AvgScrWrite DESC LIMIT 1 OFFSET 332
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT T1.Website FROM `schools` AS T1 JOIN `satscores` AS T2 ON T1.CDSCode = T2.cds WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson' UNION SELECT website FROM schools WHERE AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez'
SELECT T1.Website FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'San Joaquin' AND T1.Virtual = 'P' AND T1.Charter = 1
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = '52' AND Charter = 1
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'LOS ANGELES' AND `Charter School (Y/N)` = 0 AND `Percent (%) Eligible Free (K-12)` < 0.18;
SELECT T2.AdmFName1, T2.AdmLName1, T2.School, T2.City FROM `frpm` AS T1 JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 AND T2.CharterNum = "00D2" UNION SELECT T2.AdmFName2, T2.AdmLName2, T2.School, T2.City FROM `frpm` AS T1 JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 AND T2.CharterNum = "00D2" UNION SELECT T2.AdmFName3, T2.AdmLName3, T2.School, T2.City FROM `frpm` AS T1 JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Charter = 1 AND T2.CharterNum = "00D2"
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'
SELECT CAST(SUM(CASE WHEN T2.FundingType = 'Local' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'SANTA CLARA' AND T1.`Charter School (Y/N)` = 1
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND StatusType = 'Open' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT SUM(AdmFName1) FROM schools WHERE County = 'San Francisco' AND ClosedDate BETWEEN '1989-01-01' AND '1989-12-31' AND DOCTYPE = 'Community College District'
SELECT County, COUNT(*) AS Num_Closures FROM schools WHERE StatusType = 'Closed' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' AND SOC = '11' GROUP BY County ORDER BY Num_Closures DESC LIMIT 1;
SELECT T1.NCESDist FROM schools AS T1 WHERE T1.SOC = '31' AND T1.SOCType = 'State Special Schools';
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND School LIKE '%District Community Day%' AND (StatusType = 'Active' OR StatusType = 'Closed')
SELECT District Code FROM schools WHERE Magnet = 0 AND City = 'Fresno'
SELECT Enrollment_Ages_5_17 FROM frpm WHERE School_Name = 'State Special School' AND County_Name = 'Fremont' AND `Academic Year` = '2014-2015' AND Educational_Option_Type = 'SSS'
SELECT T1.FRPM_Count_ages_5_17 FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.School = 'Youth Authority School' AND T2.MailStrAbr = 'PO Box 1040'
SELECT T1.LowGrade FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode  =  T2.CDSCode WHERE T2.EdOpsCode  =  "SPECON" AND T2.NCESSchool  =  "0613360" ORDER BY T1.LowGrade LIMIT 1
SELECT T1.SchoolName FROM frpm AS T1 WHERE T1.County_Code = '37' AND T1.NSLP_Provision_Status = 'Provision 2'
SELECT T1.City FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.'NSLP Provision Status' = 'Provision 2' AND T1.County = 'Merced' AND T2.'Low Grade' = 9 AND T2.'High Grade' = 12 AND T1.EILCode = 'HS'
SELECT T2.School ,  (T1.FRPMCount (Ages 5-17) / T1.Enrollment (Ages 5-17)) * 100 AS PercentFRPM FROM `frpm` AS T1 INNER JOIN `schools` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.HighGrade = '9' AND T2.County = 'Los Angeles' AND T1.LowGrade = 'Kindergarten'
SELECT GSserved ,  COUNT(*) FROM schools WHERE City = "Adelanto" GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT County, COUNT(*) AS Total_Schools  FROM schools  WHERE (County = "San Diego" OR County = "Santa Barbara") AND Virtual = "F"  GROUP BY County  ORDER BY Total_Schools DESC  LIMIT 1;
SELECT T1.School ,  T1.Latitude FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode  =  T2.CDSCode ORDER BY T1.Latitude DESC LIMIT 1
SELECT T2.City, T3.`Low Grade`, T2.School FROM schools AS T2 JOIN frpm AS T3 ON T2.CDSCode = T3.CDSCode WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1;
SELECT GSoffered FROM schools WHERE Longitude = (SELECT MAX(Abs(Longitude)) FROM schools)
SELECT T1.City ,  COUNT(*) ,  T2."NSLP Provision Status" FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Magnet = 1 AND T1.GSserved = 'K-8' AND T2."NSLP Provision Status" = 'Multiple Provision Types' GROUP BY T1.City
SELECT AdmFName1, COUNT(AdmFName1) AS cnt1, District FROM schools GROUP BY AdmFName1 UNION SELECT AdmFName2, COUNT(AdmFName2) AS cnt2, District FROM schools GROUP BY AdmFName2 UNION SELECT AdmFName3, COUNT(AdmFName3) AS cnt3, District FROM schools GROUP BY AdmFName3 ORDER BY COUNT(*) DESC LIMIT 2
SELECT T2.`Percent (%) Eligible Free (K-12)`, T1.District FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Alusine' OR T1.AdmFName2 = 'Alusine' OR T1.AdmFName3 = 'Alusine';
SELECT T2.AdmLName1, T2.District, T2.County, T2.School  FROM schools AS T2  WHERE T2.CDSCode IN (     SELECT T1.CDSCode      FROM frpm AS T1      WHERE T1.CharterSchoolNumber = '40' );
SELECT T2.AdmEmail1 ,  T2.AdmEmail2 ,  T2.AdmEmail3 FROM schools AS T1 JOIN (SELECT * FROM schools WHERE AdmEmail1 IS NOT NULL OR  AdmEmail2 IS NOT NULL OR  AdmEmail3 IS NOT NULL) AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'San Bernardino' AND T2.City = 'San Bernardino City Unified' AND T2.OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (T2.SOC = 62 OR  T2.DOC = 54) AND T2.StatusType = 'Active'
SELECT T3.AdmEmail1, T2.School FROM `satscores` AS T1 JOIN `schools` AS T2 ON T1.cds = T2.CDSCode JOIN (SELECT AdmEmail1, School, MAX(NumGE1500) as max_num FROM `satscores` JOIN `schools` ON `satscores`.`cds` = `schools`.`CDSCode`) AS T3 WHERE T1.NumGE1500 = T3.max_num
SELECT COUNT(*) FROM `account` AS T1 JOIN `client` AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.A3 = 'East Bohemia'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A3 = 'PRAHA')
SELECT    CASE      WHEN AVG(T1.A12) > AVG(T1.A13) THEN '1995'     ELSE '1996'   END AS higher_unemployment_year FROM district T1;
SELECT COUNT(DISTINCT T2.district_id) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T2.A11 BETWEEN 6000 AND 10000;
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'North Bohemia') AND district_id IN (SELECT district_id FROM district WHERE A11 > 8000)
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.districtid = T2.districtid WHERE T1.gender = 'F' AND T1.AVGincome = (SELECT MIN(AVGincome) FROM client WHERE gender = 'F') ORDER BY T1.age DESC LIMIT 1;   (SELECT MAX(T1.AVGincome) - MIN(T1.AVGincome) FROM client AS T1 JOIN account AS T2 ON T1.districtid = T2.districtid WHERE T1.gender = 'F');
SELECT T2.account_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.birth_date = (SELECT birth_date FROM client WHERE district_id IN(SELECT district_id FROM district ORDER BY A11 DESC LIMIT 1) ORDER BY birth_date DESC LIMIT 1);
SELECT COUNT(*) FROM disp INNER JOIN account ON disp.account_id = account.account_id WHERE disp.type = 'OWNER' AND account.frequency = 'POPLATEK TYDNE'
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'DISPONENT' AND T2.account_id IN (SELECT T3.account_id FROM account AS T3 WHERE T3.frequency = 'POPLATEK PO OBRATU')
SELECT T2.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK TYDNE' AND strftime('%Y', T1.date) = '1997' ORDER BY T1.amount ASC LIMIT 1;
SELECT T2.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 12 AND T2.date LIKE '1993%' ORDER BY T1.amount DESC LIMIT 1;
SELECT COUNT(*) FROM `client` WHERE `gender` = 'F' AND `birth_date` < '1950-01-01' AND `district_id` IN (SELECT `district_id` FROM `district` WHERE `A2` = 'Sokolov')
SELECT account_id FROM trans WHERE date LIKE '1995%' ORDER BY date ASC LIMIT 1;
SELECT T2.account_id FROM `order` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id WHERE T2.date < '1997-01-01' AND T1.amount > 3000 GROUP BY T2.account_id
SELECT T2.client_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.issued = '1994-03-03'
SELECT T2.date FROM trans AS T1 JOIN account AS T2 ON T1.account_id  =  T2.account_id WHERE T1.amount  =  840 AND T1.date  =  '1998-10-14'
SELECT T3.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.date = '1994-08-25'
SELECT MAX(T3.amount) FROM `card` AS T1 JOIN `disp` AS T2 ON T1.disp_id = T2.disp_id JOIN `trans` AS T3 ON T3.account_id = T2.account_id WHERE T1.issued = '1996-10-21'
SELECT T1.gender FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T3.account_id = T2.account_id JOIN district AS T4 ON T4.district_id = T3.district_id WHERE T4.A11 = (SELECT MAX(A11) FROM district) ORDER BY T1.birth_date LIMIT 1;
SELECT T2.amount FROM `account` AS T1 JOIN `trans` AS T2 ON T1.account_id = T2.account_id WHERE T1.account_id = (SELECT T4.account_id FROM `loan` AS T3 JOIN `account` AS T4 ON T3.account_id = T4.account_id WHERE amount = (SELECT MAX(amount) FROM `loan`)) ORDER BY T2.date ASC LIMIT 1
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik');
SELECT T3.disp_id FROM `trans` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `disp` AS T3 ON T2.account_id = T3.account_id WHERE T1.amount = 5100 AND strftime('%Y-%m-%d', T1.date) = '1998-09-02'
SELECT COUNT(*) FROM account WHERE date BETWEEN '1996-01-01' AND '1996-12-31' AND district_id = (SELECT district_id FROM district WHERE A2 = 'Litomerice')
SELECT T2.A2 FROM `client` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 98832 AND STRFTIME('%Y-%m-%d', T3.date) = '1996-01-03'
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.district_id WHERE T1.district_id IN(SELECT district_id FROM district WHERE A3 = 'Prague') ORDER BY T2.date ASC LIMIT 1;
SELECT CAST(SUM(IIF(T2.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T2.gender) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'South Bohemia' AND T1.A4 = (SELECT MAX(A4) FROM district WHERE A3 = 'South Bohemia')
SELECT ((SELECT T2.balance FROM `order` AS T3 JOIN trans AS T2 ON T3.account_id  =  T2.account_id WHERE T2.`date`  =  '1998-12-27' AND T2.account_id IN ( SELECT T1.account_id FROM loan AS T1 WHERE T1.date  =  '1993-07-05') )  -  (SELECT T1.balance FROM `order` AS T3 JOIN trans AS T1 ON T3.account_id  =  T1.account_id WHERE T1.`date`  =  '1993-03-22' AND T1.account_id IN ( SELECT account_id FROM loan WHERE date  =  '1993-07-05'))) * 1.0 / (SELECT balance FROM `order` AS T3 JOIN trans AS T1 ON T3.account_id  =  T1.account_id WHERE T1.date  =  '1993-03-22' AND T1.account_id IN ( SELECT account_id FROM loan WHERE date  =  '1993-07-05')) * 100) AS rate;
SELECT SUM(IIF(status = 'A', amount, 0)) * 100 / SUM(amount) FROM loan;
SELECT SUM(IIF(T2.status = 'C', 1, 0)) * 100 / COUNT(T2.loan_id) FROM `account` AS T1 JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T2.amount < 100000 AND T2.status = 'C'
SELECT T1.account_id, T4.A2, T4.A3 FROM account AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T1.account_id = T3.account_id JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T1.date BETWEEN '1993-01-01' AND '1993-12-31' AND T3.type = 'POPLATEK PO OBRATU';
SELECT T1.account_id, T1.frequency FROM `account` AS T1 JOIN `client` AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'east Bohemia' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT T.account_id ,  T.date FROM account AS T JOIN district AS D ON T.district_id = D.district_id WHERE D.A2 = 'Prachatice'
SELECT T3.A2, T3.A3 FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990;
SELECT T1.account_id, T3.A2, T3.A3 FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000;
SELECT T1.loan_id, T3.A3, AVG(T3.A11) FROM `loan` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `district` AS T3 ON T2.district_id = T3.district_id WHERE T1.duration = 60
SELECT T1.A4 , T1.A3 FROM `account` AS T1 INNER JOIN `loan` AS T2 ON T1.account_id = T2.account_id WHERE T1.A16 = 1 AND (T2.status = 'D' OR T1.A13 - T1.A12) / T1.A12 * 100 > 0
SELECT CAST(SUM(IIF(T2.A2 = 'Decin', 1, 0)) AS REAL) * 100 / COUNT(*) FROM `account` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE STRFTIME('%Y', T1.date) = '1993'
SELECT T1.account_id FROM `account` AS T1 WHERE T1.frequency = 'POPLATEK MESICNE'
SELECT T3.A2 FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T3.district_id = T1.district_id WHERE T1.gender = 'F' GROUP BY T3.A2 ORDER BY COUNT(*) DESC LIMIT 9
SELECT T3.A2 ,  SUM(T1.amount) FROM `trans` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `district` AS T3 ON T2.account_id = T3.district_id WHERE T1.date LIKE '1996-01%' AND T1.type = 'VYDAJ' GROUP BY T3.A2 ORDER BY SUM(T1.amount) DESC LIMIT 10;
SELECT COUNT(*) FROM `account` a JOIN `district` d ON a.district_id = d.district_id LEFT JOIN `disp` dp ON a.account_id = dp.account_id LEFT JOIN `card` c ON dp.disp_id = c.disp_id  WHERE d.A3 = 'South Bohemia' AND c.disp_id IS NULL;
SELECT T1.A3 FROM `district` AS T1 JOIN `account` AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id IN (SELECT account_id FROM `loan` WHERE status = 'C' OR status = 'D') GROUP BY T1.district_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT AVG(T1.amount) FROM loan AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T3.gender = 'M'
SELECT A2, A13 FROM district WHERE A13 = (SELECT MAX(A13) FROM district)
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY `A16` DESC LIMIT 1) AND `date` LIKE '1996%'
SELECT COUNT(*) FROM account  JOIN trans ON account.account_id = trans.account_id  WHERE account.frequency = 'POPLATEK MESICNE' AND trans.operation = 'VYBER KARTOU' AND trans.balance < 0;
SELECT COUNT(*)  FROM `loan` l  JOIN `account` a ON l.account_id = a.account_id  WHERE l.date BETWEEN '1995-01-01' AND '1997-12-31'  AND l.amount >= 250000  AND a.frequency = 'POPLATEK MESICNE'
SELECT COUNT(*) FROM `account` a JOIN `loan` l ON a.account_id = l.account_id WHERE l.status IN ('C', 'D') AND a.district_id = 1;
SELECT COUNT(*) FROM `client` WHERE `gender` = 'M' AND `district_id` = (SELECT `district_id` FROM `district` WHERE `A15` = (SELECT MAX(`A15`) FROM `district` WHERE `A15` < (SELECT MAX(`A15`) FROM `district`)))
SELECT COUNT(*) FROM card WHERE `type` = 'gold' AND `disp_id` IN (SELECT `disp_id` FROM `disp` WHERE `type` = 'OWNER')
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')
SELECT T4.A2 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T3.client_id = T2.district_id JOIN district AS T4 ON T4.district_id = T3.district_id WHERE T1.date LIKE '1997%' AND T1.amount > 10000 GROUP BY T4.A2
SELECT T1.account_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T1.district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')
SELECT T2.account_id FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold'
SELECT AVG(t.amount) FROM `trans` t JOIN `account` a ON t.account_id = a.account_id WHERE t.type = 'VYBER KARTOU' AND strftime('%Y', t.date) = '2021'
SELECT T2.account_id FROM `trans` AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.date LIKE '1998%' AND T1.operation = 'VYBER KARTOU' AND T1.amount < ( SELECT AVG(amount) FROM `trans` ) GROUP BY T2.account_id;
SELECT T3.account_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' AND exists(SELECT * FROM card AS T4 WHERE T2.disp_id = T4.disp_id) AND exists(SELECT * FROM loan AS T5 WHERE T5.account_id = T3.account_id)
SELECT COUNT(*) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' AND T3.district_id IN (SELECT district_id FROM district WHERE A3 LIKE '%South Bohemia%')
SELECT T1.account_id FROM `account` AS T1 JOIN `disp` AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id IN(SELECT T3.district_id FROM `district` AS T3 WHERE T3.A2 = 'Tabor') AND T2.type = 'OWNER'
SELECT T1.type FROM disp AS T1 JOIN district AS T2 ON T2.district_id = T1.client_id WHERE T2.A11 > 8000 AND T2.A11 <= 9000 AND T1.type != 'OWNER' GROUP BY T1.type
SELECT COUNT(*) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T3.A3 = 'North Bohemia' AND T2.bank = 'AB'
SELECT T3.A2 FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2
SELECT T2.A15 FROM account AS T1 JOIN district AS T2 ON T1.District_id = T2.District_id WHERE T1.date >= '1997-01-01' AND T2.A15 > 4000 GROUP BY T1.District_id;
SELECT COUNT(*) FROM `card` c JOIN `disp` d ON c.disp_id = d.disp_id WHERE c.type = 'classic' AND d.type = 'OWNER'
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'Hl.m. Praha')
SELECT CAST(SUM(IIF(T1.type = 'gold' AND strftime('%Y', T1.issued) < '1998', 1, 0)) AS REAL) * 100 / COUNT(T1.card_id) FROM card AS T1;
SELECT T2.client_id FROM loan AS T1 JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'OWNER' ORDER BY T1.amount DESC LIMIT 1;
SELECT T2.A15 FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.account_id = 532
SELECT T1.district_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T2.order_id = 33333;
SELECT T2.trans_id FROM disp AS T1 JOIN trans AS T2 ON T1.account_id  =  T2.account_id WHERE T1.client_id  =  3356 AND T2.operation  =  'VYBER'
SELECT COUNT(*) FROM `account` WHERE `frequency` = 'POPLATEK TYDNE' AND `account_id` IN (SELECT `account_id` FROM `loan` WHERE `amount` < 200000)
SELECT T2.type FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T2.disp_id = T3.disp_id WHERE T1.client_id = 13539;
SELECT T2.A3 FROM `client` AS T1 JOIN `district` AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT T1.A2 FROM district AS T1 JOIN `account` AS T2 ON T1.district_id = T2.district_id JOIN `loan` AS T3 ON T2.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.A2 ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.client_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T3.account_id = T2.account_id JOIN `order` AS T4 ON T4.account_id = T3.account_id WHERE T4.order_id = 32423
SELECT * FROM `trans` WHERE `account_id` IN (SELECT `account_id` FROM `account` WHERE `district_id` = 5)
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Jesenik')
SELECT T2.client_id FROM `card` AS T1 JOIN `disp` AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'junior' AND T1.issued >= '1997-01-01'
SELECT CAST(SUM(IIF(T1.gender = 'F', 1, 0)) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN account AS T3 ON T3.district_id = T2.district_id WHERE T2.A11 > 10000 AND T3.date < (SELECT MIN(date) FROM account);
SELECT (((SUM(CASE WHEN T3.date LIKE '1997%' THEN T3.amount END) - SUM(CASE WHEN T3.date LIKE '1996%' THEN T3.amount END))/SUM(CASE WHEN T3.date LIKE '1996%' THEN T3.amount END)) * 100) AS Growth_Rate FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.disp_id JOIN loan AS T3 ON T2.disp_id = T3.account_id WHERE T1.gender = 'M'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01';
SELECT (SELECT A16 FROM district WHERE A3 = 'North Bohemia') - (SELECT A16 FROM district WHERE A3 = 'East Bohemia')
SELECT TYPE ,  COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY TYPE
SELECT T1.k_symbol , T2.frequency FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 3539 AND T2.account_id = 3;
SELECT T1.birth_date FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.account_id = 130 AND T2.type = 'OWNER'
SELECT COUNT(*) FROM disp WHERE type = 'OWNER' AND `client_id` IN ( SELECT `client_id` FROM client ) AND `account_id` IN ( SELECT `account_id` FROM account WHERE frequency = 'POPLATEK PO OBRATU' );
SELECT SUM(t1.amount), t1.status FROM loan AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id JOIN disp AS t3 ON t2.account_id = t3.account_id JOIN client AS t4 ON t4.client_id = t3.client_id WHERE t4.client_id = 992
SELECT T3.balance, T4.gender FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN (SELECT account_id, SUM(amount) as balance FROM trans WHERE trans_id <= 851 GROUP BY account_id) AS T3 ON T2.account_id = T3.account_id JOIN disp AS T4A ON T2.account_id = T4A.account_id JOIN client AS T4 ON T4.client_id = T4A.client_id WHERE T4A.type = 'OWNER' AND T1.account_id IN(SELECT account_id FROM disp WHERE type = 'OWNER' AND client_id = 4)
SELECT T1.type FROM card AS T1 JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T2.client_id = 9;
SELECT SUM(t.amount) FROM `trans` t JOIN `account` a ON t.account_id = a.account_id JOIN `disp` d ON a.account_id = d.account_id WHERE d.client_id = 617 AND strftime('%Y', t.date) = '1998'
SELECT T1.client_id FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T2.A16 = 1422252603022;
SELECT T1.client_id FROM `client` AS T1 JOIN `disp` AS T2 ON T1.client_id = T2.client_id JOIN `account` AS T3 ON T2.account_id = T3.account_id JOIN `loan` AS T4 ON T3.account_id = T4.account_id WHERE T1.gender = 'F' ORDER BY T4.amount DESC LIMIT 3;
SELECT COUNT(*) FROM `client` c JOIN `disp` d ON c.client_id = d.client_id JOIN `account` a ON d.account_id = a.account_id WHERE c.gender = 'M' AND c.date_of_birth BETWEEN '1974-01-01' AND '1976-12-31' AND EXISTS (SELECT * FROM `order` o WHERE o.account_id = a.account_id AND o.k_symbol = 'SIPO' AND o.amount > 4000)
SELECT COUNT(*) FROM account WHERE date > '1996-01-01' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'Beroun')
SELECT COUNT(*) FROM client c JOIN disp d ON c.client_id = d.client_id JOIN card cr ON d.disp_id = cr.disp_id WHERE c.gender = 'F' AND cr.type = 'junior'
SELECT CAST(SUM(IIF(T2.gender  =  'F' , 1 , 0)) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.district_id  =  T2.district_id WHERE T1.district_id IN(SELECT district_id FROM district WHERE A3 LIKE '%Prague%')
SELECT CAST(SUM(IIF(T2.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK TYDNE'
SELECT COUNT(*) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT T2.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 24 AND T2.date < '1997-01-01' ORDER BY T1.amount ASC LIMIT 1;
SELECT T3.account_id FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN account AS T3 ON T2.disp_id = T3.account_id WHERE T1.gender = 'F' AND T1.district_id IN (SELECT district_id FROM district ORDER BY A11 ASC LIMIT 1) ORDER BY T1.birth_date LIMIT 1;
SELECT COUNT(*) FROM client WHERE birth_date LIKE '1920%' AND district_id IN (SELECT district_id FROM district WHERE A3 = 'East Bohemia')
SELECT COUNT(*) FROM `loan` WHERE `duration` = 24 AND `account_id` IN (SELECT `account_id` FROM `account` WHERE `frequency` = 'POPLATEK TYDNE')
SELECT AVG(T1.amount) FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status IN('C', 'D') AND T2.frequency = 'POPLATEK PO OBRATU'
SELECT T1.client_id, T3.District_id FROM disp AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T1.type = 'OWNER'
SELECT T1.client_id ,  DATE_PART('year', AGE(T1.birth_date)) FROM client AS T1 JOIN disp AS T2 ON T1.client_id = T2.client_id JOIN card AS T3 ON T3.trans_id = T2.trans_id WHERE T3.type = 'gold' AND T2.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl'
SELECT AVG(atom_num) FROM ( SELECT COUNT(*) AS atom_num  FROM atom  WHERE element = 'O' AND molecule_id IN( SELECT T1.molecule_id  FROM bond AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON T2.atom_id = T3.atom_id  WHERE T1.bond_type = '-')  GROUP BY molecule_id)
SELECT AVG(L2.cnt) FROM (SELECT T3.label, SUM(CASE WHEN T1.bond_type = '-' THEN 1 ELSE 0 END) AS cnt FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T3.molecule_id = T1.molecule_id WHERE T3.label = '+' GROUP BY T3.molecule_id, T3.label) AS L2
SELECT COUNT(DISTINCT T1.molecule_id) FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'na' AND T2.label = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '#'
SELECT CAST(COUNT(CASE WHEN T1.element  =  'c' THEN T1.atom_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id INNER JOIN bond AS T3 ON T3.bond_id  =  T2.bond_id WHERE T3.bond_type  =  '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` BETWEEN 'TR000' AND 'TR099' AND `label` = '+'
SELECT DISTINCT T1.molecule_id FROM atom AS T1 WHERE T1.element = 'c'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9' GROUP BY T1.element
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '='
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl' GROUP BY T3.bond_type
SELECT T1.atom_id, T2.atom_id2 FROM `bond` AS T3 JOIN `connected` AS T1 ON T1.bond_id  =  T3.bond_id JOIN `connected` AS T2 ON T2.bond_id  =  T3.bond_id WHERE T3.bond_type  =  '-';
SELECT T4.atom_id, T5.atom_id2 FROM molecule AS T1 JOIN atom AS T4 ON T1.molecule_id = T4.molecule_id JOIN connected AS T5 ON T4.atom_id = T5.atom_id JOIN bond AS T6 ON T5.bond_id = T6.bond_id WHERE T1.label = '-'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T2.label  =  '-' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1
SELECT T1.bond_type FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8')
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label NOT IN (SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'sn')) GROUP BY T1.label
SELECT COUNT(DISTINCT a.atom_id)  FROM atom AS a  JOIN connected AS c ON a.atom_id = c.atom_id  JOIN bond AS b ON c.bond_id = b.bond_id  WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#')
SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR181' UNION SELECT a.atom_id FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 WHERE c.bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')) AND a.molecule_id != 'TR181'
SELECT CAST((SUM(CASE WHEN T2.element != 'f' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT T1.molecule_id) AS REAL) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE label = '+'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR000' ORDER BY T1.element ASC LIMIT 3;
SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_6' AND T1.molecule_id = 'TR001' UNION SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_2_6' AND T1.molecule_id = 'TR001'
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' ORDER BY T1.molecule_id LIMIT 5;
SELECT CAST(SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) / COUNT(bond.bond_id) * 100 AS percent  FROM bond  WHERE bond.molecule_id = 'TR008';
SELECT CAST(COUNT(CASE WHEN T1.label = '+' THEN T1.molecule_id END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1;
SELECT round(sum(case when element = 'h' then 1 else 0 end) / count(atom_id) * 100, 4) as percentage FROM `atom` WHERE molecule_id = 'TR206'
SELECT T2.bond_type FROM `bond` AS T2 WHERE T2.molecule_id = 'TR000'
SELECT T1.element, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'
SELECT T2.bond_type ,  T3.label FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN molecule AS T3 ON T3.molecule_id = T2.molecule_id WHERE T3.molecule_id = 'TR010' GROUP BY T2.bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT m.molecule_id  FROM molecule m  JOIN bond b ON m.molecule_id = b.molecule_id  WHERE b.bond_type = '-' AND m.label = '-'  GROUP BY m.molecule_id  ORDER BY m.molecule_id  LIMIT 3;
SELECT T1.bond_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR006' ORDER BY T1.bond_id ASC LIMIT 2;
SELECT COUNT(*) FROM `connected` WHERE (`atom_id` = 'TR009_12' OR `atom_id2` = 'TR009_12')
SELECT COUNT(DISTINCT m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+' AND a.element = 'br'
SELECT T2.bond_type ,  T1.atom_id ,  T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'
SELECT T1.molecule_id, T2.label FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#'
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19';
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT DISTINCT a.molecule_id FROM atom a WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND a.molecule_id IN (SELECT m.molecule_id FROM molecule m WHERE m.label = '+')
SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element IN('p', 'n') AND ( SELECT element FROM atom WHERE atom_id = T2.atom_id2 ) IN('p', 'n')
SELECT T1.label FROM `molecule` AS T1  JOIN (   SELECT molecule_id, COUNT(*) AS count    FROM `bond`    WHERE bond_type = '='    GROUP BY molecule_id    ORDER BY count DESC LIMIT 1 ) AS T2 ON T1.molecule_id = T2.molecule_id
SELECT AVG(T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'i' GROUP BY T1.atom_id
SELECT T1.bond_id, T1.bond_type FROM `bond` AS T1 INNER JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T2.atom_id2, 7, 2) AS INTEGER) = 45
SELECT T1.element FROM `atom` AS T1 WHERE T1.atom_id NOT IN (SELECT T2.atom_id FROM `connected` AS T2)
SELECT T1.atom_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN `bond` AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#' AND T1.molecule_id = 'TR041'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'
SELECT T2.molecule_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' AND T2.label = '+' GROUP BY T2.molecule_id ORDER BY COUNT(T1.bond_id) DESC LIMIT 1
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(T2.molecule_id) ASC LIMIT 1;
SELECT T2.atom_id FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element <> 'pb' AND T1.atom_id IN (SELECT atom_id FROM atom WHERE element = 'pb')
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#'
SELECT 100.0 * ( SELECT COUNT(T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element IN ( SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) DESC LIMIT 1 ) AND T1.element = ( SELECT element FROM atom GROUP BY element ORDER BY COUNT(*) DESC LIMIT 1 ) ) / ( SELECT COUNT(T4.bond_id) FROM connected AS T5 JOIN bond AS T4 ON T4.bond_id = T5.bond_id )
SELECT ROUND(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) * 100 / COUNT(b.bond_id), 5) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE `element` IN('c', 'h')
SELECT T1.atom_id2 FROM `connected` AS T1 JOIN `atom` AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE t1.element = 'sn'
SELECT COUNT(DISTINCT T3.element) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '-'
SELECT COUNT(*) FROM `atom` WHERE `element` IN ('p', 'br') AND `molecule_id` IN (SELECT `molecule_id` FROM `bond` WHERE `bond_type` = '#')
SELECT T1.bond_id FROM `bond` AS T1 INNER JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.molecule_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-';
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT T.molecule_id FROM molecule AS T WHERE T.label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label='+' ;
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id  =  T2.atom_id WHERE T1.bond_id  =  'TR001_10_11' UNION SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2  =  T2.atom_id WHERE T1.bond_id  =  'TR001_10_11'
SELECT COUNT(*) FROM bond WHERE bond_id IN (SELECT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id  =  T2.atom_id JOIN connected AS T3 ON T3.atom_id2  =  T1.atom_id WHERE T1.element  =  'i')
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca' GROUP BY T1.label ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) > 0 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_id = 'TR001_1_8' AND T1.element IN ('cl', 'c') GROUP BY T1.element HAVING COUNT(*) > 1
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.bond_type = '#' AND T2.element = 'c' AND T1.label = '-' LIMIT 2
SELECT CAST(COUNT(CASE WHEN T1.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR001'
SELECT T1.molecule_id FROM `bond` AS T1 WHERE T1.bond_type = '='
SELECT T1.atom_id AS atom_id1 ,  T2.atom_id2 FROM connected AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.bond_id IN(SELECT bond_id FROM bond WHERE bond_type  =  '#')
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_1_2' UNION SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-'
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT T2.bond_id ,  T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND SUBSTR(T1.atom_id, 7, 1) = '4'
SELECT T2.label ,  CAST(SUM(T1.element = 'h') AS REAL) / COUNT(T1.element) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' GROUP BY T2.label
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'ca'
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c'
SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_10_11' UNION SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11'
SELECT CAST(SUM(IIF(T2.bond_type = '#', 1, 0)) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id;
SELECT CAST(SUM(CASE WHEN b.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(b.bond_id) as percent FROM bond b WHERE b.molecule_id = 'TR047'
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_1'
SELECT carcinogenic FROM (  (SELECT label AS carcinogenic FROM molecule WHERE molecule_id = 'TR151')  )
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR151' AND T1.element IN ('cl', 'br', 'pb', 'te');
SELECT COUNT(*) FROM molecule WHERE `label` = '+'
SELECT atom_id FROM atom WHERE element = 'c' AND molecule_id BETWEEN 'TR010' AND 'TR050'
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'
SELECT T1.bond_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '='
SELECT COUNT(*)  FROM atom  INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE atom.element = 'h' AND molecule.label = '+'
SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T2.bond_id = 'TR000_1_2'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'h'
SELECT COUNT(*) > 0 FROM molecule WHERE molecule_id = 'TR124' AND label = '+'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT `bond_type` FROM `bond` WHERE `bond_id` = 'TR007_4_19'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_2_4' GROUP BY T1.element;
SELECT COUNT(*), m.label FROM(SELECT b.bond_id FROM bond AS b WHERE b.bond_type='=' AND b.molecule_id='TR006') bb JOIN molecule AS m ON m.molecule_id='TR006' WHERE m.label='+' GROUP BY m.label;
SELECT T1.molecule_id, T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id;
SELECT T2.bond_id, T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-'
SELECT m.molecule_id, GROUP_CONCAT(a.element) as elements  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#'  GROUP BY m.molecule_id;
SELECT T4.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T1.atom_id2  =  T3.atom_id JOIN atom AS T4 ON T1.atom_id  =  T4.atom_id WHERE T2.bond_id  =  'TR000_2_3'
SELECT COUNT(*) FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl') OR atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'cl')
SELECT T1.atom_id , COUNT(DISTINCT T3.bond_type) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id
SELECT COUNT(*) ,  SUM(IIF(T1.label = '+', 1, 0)) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '='
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` NOT IN (SELECT `molecule_id` FROM `atom` WHERE `element` = 's') AND `molecule_id` NOT IN (SELECT `molecule_id` FROM `bond` WHERE `bond_type` = '=')
SELECT T3.label FROM bond AS T1 JOIN molecule AS T3 ON T1.molecule_id  =  T3.molecule_id WHERE T1.bond_id  =  'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.element  =  'cl' AND T2.label  =  '+' GROUP BY T2.molecule_id
SELECT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' AND T2.label = '+'
SELECT T2.molecule_id FROM `bond` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_3_4'
SELECT T1.bond_type FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id  =  T2.bond_id WHERE T2.atom_id  =  'TR000_1' AND T2.atom_id2  =  'TR000_2'
SELECT T1.molecule_id FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id2 IN ('TR000_4', 'TR000_2') AND T1.atom_id IN ('TR000_4', 'TR000_2');
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT SUM(CASE WHEN T1.bond_type = '-' THEN 1 ELSE 0 END) * 100 / COUNT(T1.bond_id) AS percentage FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id
SELECT COUNT(*) FROM `molecule` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `atom` WHERE `element` = 'n') AND `label` = '+'
SELECT T1.molecule_id FROM `molecule` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id JOIN `connected` AS T3 ON T2.atom_id = T3.atom_id JOIN `bond` AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 's' AND T4.bond_type = '=';
SELECT T.molecule_id FROM ( SELECT molecule_id, COUNT(*) AS atom_count  FROM atom  GROUP BY molecule_id HAVING atom_count > 5) AS T JOIN molecule ON T.molecule_id = molecule.molecule_id WHERE label = '-'
SELECT T1.element FROM `atom` AS T1 JOIN `connected` AS T2 ON T1.atom_id = T2.atom_id JOIN `bond` AS T3 ON T3.bond_id = T2.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'
SELECT T1.label, T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T4.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T4.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T1.element = 'h' AND T3.bond_type = '#'
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '='
SELECT COUNT(*) FROM `bond` JOIN `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `molecule`.`label` = '-' AND `bond`.`bond_type` = '#' GROUP BY `bond`.`molecule_id`
SELECT T1.element ,  T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.molecule_id = 'TR002'
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '=' AND T3.element = 'c' AND T3.molecule_id = 'TR012'
SELECT T1.atom_id FROM `atom` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT name FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards);
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = '2015'
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator';
SELECT t1.status FROM `legalities` AS t1 JOIN `cards` AS t2 ON t1.uuid  =  t2.uuid WHERE t2.types  =  'Artifact' AND t2.side IS NULL AND t1.format  =  'vintage'
SELECT T1.id, T1.artist FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.power = '*' OR T1.power IS NULL AND T2.format = 'commander' AND T2.status = 'Legal'
SELECT C.id, R.text, C.hasContentWarning FROM cards AS C JOIN rulings AS R ON C.uuid = R.uuid WHERE C.artist = 'Stephen Daniele' ORDER BY hasContentWarning;
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT C.name, C.artist, C.isPromo FROM cards AS C JOIN rulings AS R ON C.uuid = R.uuid GROUP BY R.uuid ORDER BY COUNT(*) DESC LIMIT 1;
SELECT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE name = 'Annul' AND number = '29')
SELECT T2.name FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'
SELECT CAST(SUM(IIF(T2.language = 'Chinese Simplified', 1, 0)) AS REAL) * 100 / COUNT(T2.id) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid
SELECT T1.name, T1.totalSetSize FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian'
SELECT COUNT(DISTINCT T1.types) FROM `cards` AS T1 WHERE T1.artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM `cards` WHERE `power` = '*'
SELECT t1.promoTypes FROM cards AS t1 WHERE t1.name = 'Duress'
SELECT T1.borderColor FROM cards AS T1 WHERE T1.name = 'Ancestor''s Chosen'
SELECT T1.originalType FROM `cards` AS T1 WHERE T1.name = 'Ancestor's Chosen';
SELECT T3.language FROM cards AS T1 JOIN set_translations AS T3 ON T1.setCode = T3.setCode WHERE T1.name = 'Angel of Mercy' GROUP BY T3.language;
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Restricted' AND T1.isTextless = 0;
SELECT T1.text FROM `rulings` AS T1 JOIN `cards` AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Condemn'
SELECT COUNT(*) FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Restricted' AND T2.isStarter = 1;
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle' LIMIT 1;
SELECT T1.type FROM cards AS T1 WHERE T1.name = 'Benalish Knight';
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian' GROUP BY T1.artist
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 FROM cards;
SELECT COUNT(*) FROM `cards` JOIN `foreign_data` ON `foreign_data`.`uuid` = `cards`.`uuid` WHERE `cards`.`isReprint` = 1 AND `foreign_data`.`language` = 'German'
SELECT COUNT(*) FROM foreign_data WHERE language = 'Russian' AND uuid IN(SELECT uuid FROM cards WHERE borderColor = 'borderless')
SELECT CAST(SUM(IIF(T2.language = 'French', 1, 0)) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1;
SELECT COUNT(*) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'black' AND `availability` = 'mtgo';
SELECT id FROM cards WHERE convertedManaCost = 0;
SELECT T1.layout FROM `cards` AS T1 INNER JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.keywords LIKE '%flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND NOT (subtypes = 'Angel') OR subtypes NOT LIKE '%Angel%'
SELECT uuid FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015' AND edhrecRank IS NOT NULL;
SELECT T1.artist FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Chinese Simplified' GROUP BY T1.artist;
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese' GROUP BY T1.name HAVING COUNT(*) = 1
SELECT COUNT(*) FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Banned' AND T2.borderColor = 'white'
SELECT l.uuid, f.language FROM legalities AS l JOIN foreign_data AS f ON l.uuid = f.uuid WHERE l.format = 'legacy'
SELECT rulings.text FROM cards JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Beacon of Immortality'
SELECT COUNT(T1.uuid), T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'Legal' GROUP BY T2.status;
SELECT T2.name ,  T2.colors FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.code = 'OGW'
SELECT C.name, ST.language  FROM cards AS C  JOIN set_translations AS ST ON C.setCode = ST.setCode  WHERE C.convertedManaCost = 5 AND C.setCode = '10E'
SELECT T1.name, T2.date FROM `cards` AS T1 JOIN `rulings` AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT T1.colors, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20
SELECT T1.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.colors = 'B' AND T1.originalType LIKE '%Artifact%'
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND hasFoil = 1 AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE `artist` = 'UDON' AND `availability` = 'mtgo' AND `hand` = '-1' ;
SELECT COUNT(*) FROM `cards` WHERE `frameVersion` = '1993' AND `availability` = 'paper' AND `hasContentWarning` = 1;
SELECT name FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper';
SELECT SUM(strftime('%m', ManaCost)) FROM CARDS WHERE ARTIST = 'Rob Alexander'
SELECT DISTINCT T1.subtypes, T1.supertypes FROM cards AS T1 WHERE T1.availability = 'arena'
SELECT T2.setCode FROM `foreign_data` AS T1 JOIN `cards` AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Spanish' GROUP BY T2.setCode
SELECT CAST(SUM(IIF(isOnlineOnly = 1, 1, 0)) AS REAL) * 100 / COUNT(id) FROM `cards` WHERE frameEffects = 'legendary';
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*), id FROM cards WHERE isStorySpotlight = 1 AND isTextless = 0 GROUP BY id
