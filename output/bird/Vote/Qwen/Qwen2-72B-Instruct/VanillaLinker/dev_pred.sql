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
SELECT T2.name ,  ( SELECT CAST(COUNT(*) AS REAL) / (SELECT COUNT(*) FROM cards) * 100 WHERE T1.language = 'Spanish' ) AS Percentage FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Spanish' GROUP BY T2.name
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309 GROUP BY T2.language
SELECT COUNT(*) FROM set_translations WHERE set_translations.language = 'Portuguese (Brazil]' AND set_translations.setcode IN(SELECT sets.code FROM sets WHERE sets.block = 'Commander')
SELECT T1.id FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Creature' AND T2.status = 'Legal'
SELECT T1.subtypes, T1.supertypes FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German' AND T1.subtypes IS NOT NULL AND T1.supertypes IS NOT NULL;
SELECT COUNT(*) FROM `cards` WHERE `power` IS NULL OR `power` = '*' AND `text` LIKE '%triggered%ability%'
SELECT COUNT(*) FROM `cards` c JOIN `legalities` l ON c.uuid = l.uuid WHERE l.format = 'premodern' AND c.side IS NULL AND EXISTS(SELECT * FROM `rulings` r WHERE c.uuid = r.uuid AND r.text = 'This is a triggered mana ability.')
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'
SELECT T1.artist FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.text = "Das perfekte Gegenmittel zu einer dichten Formation"
SELECT T2.name FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid  =  T2.uuid WHERE T1.layout  =  'normal' AND T1.bordercolor  =  'black' AND T2.language  =  'French' AND T1.artist  =  'Matthew D. Wilson';
SELECT COUNT(*) FROM `cards` AS T1 JOIN `rulings` AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T2.date = '2007-02-01'
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'
SELECT COUNT(*) * 100 / (SELECT COUNT(l.id) FROM legalities l WHERE l.format = 'commander' AND l.status = 'Legal') AS percentage FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.hasContentWarning = 0 AND l.format = 'commander' AND l.status = 'Legal';
SELECT CAST(SUM(IIF(T2.language = 'French', 1, 0)) AS REAL) * 100 / COUNT(T2.uuid) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.power IS NULL OR T1.power = '*'
SELECT CAST(SUM(IIF(T2.language = 'Japanese' AND T1.type = 'expansion', 1, 0)) AS REAL) * 100 / COUNT(*) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'
SELECT t1.availability FROM cards AS t1 WHERE t1.artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;
SELECT T1.name FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid  =  T2.uuid WHERE T1.promoTypes = 'arenaleague' AND (T1.power IS NULL OR T1.power = '*') ORDER BY T1.name ASC LIMIT 3
SELECT T.language FROM foreign_data AS T WHERE T.multiverseid = 149934;
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `cards` WHERE layout = 'normal';
SELECT number FROM cards WHERE side IS NULL AND subtypes = 'Angel,Wizard'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3;
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T2.setCode = 'ARC';
SELECT T1.name, T2.translation FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.id = 5
SELECT T1.language, T2.type FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.id = 206
SELECT T1.id, T1.name FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' ORDER BY T1.name ASC LIMIT 2
SELECT s.id FROM sets AS s JOIN foreign_data AS fd ON s.code = fd.multiverseid WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND fd.language = 'Japanese' LIMIT 1;
SELECT t1.name FROM `sets` AS t1 JOIN `set_translations` AS t2 ON t1.code  =  t2.setCode WHERE t2.language  =  'Russian' ORDER BY t1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(T2.isOnlineOnly) AS REAL) * 100 / COUNT(T2.id) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Chinese Simplified';
SELECT COUNT(*) FROM sets WHERE NOT EXISTS (SELECT * FROM set_translations WHERE set_translations.setCode = sets.code AND set_translations.language != 'Japanese') AND (mtgoCode IS NULL OR mtgoCode = '')
SELECT id FROM cards WHERE borderColor = 'black'
SELECT COUNT(*), id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id;
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1
SELECT T2.language FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 174
SELECT T1.name FROM sets AS T1 WHERE T1.code = 'ALL'
SELECT T2.language FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13';
SELECT T1.baseSetSize ,  T1.code FROM sets AS T1 WHERE T1.block IN('Masques','Mirage')
SELECT code FROM sets WHERE type = 'expansion';
SELECT T2.name, T2.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'boros'
SELECT DISTINCT T2.flavorText, T3.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie' AND T1.layout = 'timeshifted';
SELECT CAST(SUM(IIF(T1.convertedManaCost = 10, 1, 0)) AS REAL) * 100 / COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Abyssal Horror'
SELECT T1.setCode FROM `sets` AS T1 JOIN `cards` AS T2 ON T1.setCode = T2.setCode WHERE T1.type = 'expansion' AND T2.isPromo = 0 AND T2.layout IN ('command', ' planeswalker') GROUP BY T1.id HAVING COUNT(T2.uuid) > 1
SELECT T2.name, T1.type FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'abzan'
SELECT T1.types FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'azorius' GROUP BY T1.types;
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'
SELECT name FROM cards WHERE isTextless = 0
SELECT manaCost FROM cards WHERE name  =  'Ancestor\'s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)
SELECT T.name FROM cards AS T WHERE T.side IS NOT NULL AND T.isPromo = 1;
SELECT CAST(subtypes AS TEXT), supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT T1.purchaseUrls FROM `cards` AS T1 WHERE T1.promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'Black' AND availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper'))
SELECT T1.artist FROM cards AS T1 WHERE T1.flavorName = 'Battra, Dark Destroyer'
SELECT T1.name FROM `cards` AS T1 WHERE T1.frameVersion = '2003' ORDER BY T1.convertedManaCost DESC LIMIT 3;
SELECT T2.translation FROM `cards` AS T1 JOIN `set_translations` AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT count(*) FROM set_translations WHERE setCode IN (SELECT setCode FROM cards WHERE name = 'Angel of Mercy')
SELECT C.name FROM cards C JOIN set_translations ST ON C.setCode = ST.setCode WHERE ST.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) > 0 FROM `cards` AS T1 JOIN `foreign_data` AS T2 ON T1.`uuid` = T2.`uuid` WHERE T1.`name` = 'Ancestor''s Chosen' AND T2.`language` = 'Korean'
SELECT COUNT(*) FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex'
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code  =  T2.setCode WHERE T2.translation  =  'Hauptset Zehnte Edition'
SELECT T1.translation FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Chinese Simplified' AND T2.name = 'Eighth Edition'
SELECT T2.mtgoCode FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Angel of Mercy' AND T2.mtgoCode IS NOT NULL;
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'
SELECT T1.type FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code  =  T2.setCode WHERE T2.translation  =  'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM `sets` s JOIN `set_translations` st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;
SELECT COUNT(*) > 0 FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie' AND s.isForeignOnly = 1;
SELECT COUNT(*) FROM `sets` s JOIN `set_translations` st ON s.code = st.setCode WHERE s.baseSetSize < 100 AND st.language = 'Italian'
SELECT COUNT(*) FROM cards WHERE `setCode` = 'CNS' AND `borderColor` = 'black'
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.convertedManaCost DESC LIMIT 1;
SELECT T1.artist FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.number = '4'
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL) AND T2.name = 'Coldsnap'
SELECT T2.flavorText FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Italian' AND T1.name = 'Ancestor''s Chosen';
SELECT T1.language FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Ancestor''s Chosen' AND T1.flavorText IS NOT NULL GROUP BY T1.language;
SELECT T1.type FROM foreign_data AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'German' AND T2.name = 'Ancestor''s Chosen'
SELECT T3.text FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T1.name = 'Coldsnap' AND T3.language = 'Italian'
SELECT T3.translation FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN set_translations AS T3 ON T3.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T3.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1;
SELECT T2.date FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Reminisce'
SELECT SUM(CASE WHEN T1.convertedManacost = 7 THEN 1 ELSE 0 END) * 100 / COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT T.mcmName FROM sets AS T WHERE T.releaseDate = '2017-06-09'
SELECT T1.type FROM sets AS T1 WHERE T1.name = 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT T2.text AS Ruling_Text, CASE WHEN T1.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS Has_Warning FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec';
SELECT T2.releaseDate FROM cards AS T1 JOIN sets AS T2 ON T1.setCode  =  T2.code WHERE T1.name  =  'Evacuation'
SELECT T1.baseSetSize FROM sets AS T1 JOIN set_translations AS T2 ON T1.code  =  T2.setCode WHERE T2.translation  =  'Rinascita di Alara'
SELECT T1.type FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code  =  T2.setCode WHERE T2.translation  =  'Huitième édition'
SELECT T3.translation FROM cards AS T1 JOIN set_translations AS T3 ON T1.setCode  =  T3.setCode WHERE T1.name = 'Tendo Ice Bridge' AND T3.language  =  'French'
SELECT COUNT(*) FROM `set_translations` WHERE `setCode` = (SELECT `code` FROM `sets` WHERE `name` = 'Tenth Edition') AND `translation` IS NOT NULL;
SELECT T4.translation FROM cards AS T1 JOIN set_translations AS T4 ON T1.setCode  =  T4.setCode WHERE T1.name  =  'Fellwar Stone' AND T4.language  =  'Japanese'
SELECT T1.name FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Journey into Nyx Hero''s Path' ORDER BY T1.convertedManaCost DESC LIMIT 1;
SELECT T1.releaseDate FROM sets AS T1 JOIN set_translations AS T2 ON T1.code  =  T2.setCode WHERE T2.translation  =  'Ola de frío'
SELECT T2.type FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'World Championship Decks 2004') AND convertedManaCost = 3;
SELECT T2.translation FROM sets AS T1 JOIN set_translations AS T2 ON T1.code  =  T2.setCode WHERE T1.name  =  'Mirrodin' AND T2.language  =  'Chinese Simplified'
SELECT CAST(SUM(CASE WHEN T1.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'Japanese'
SELECT CAST(SUM(IIF(T2.isOnlineOnly = 1, 1, 0)) AS REAL) * 100 / COUNT(*) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Portuguese (Brazil)'
SELECT DISTINCT T1.availability FROM `cards` AS T1 WHERE T1.artist = 'Aleksi Briclot' AND T1.isTextless = 1
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT `artist` FROM `cards` WHERE `side` IS NULL AND `convertedManaCost` = (SELECT MAX(`convertedManaCost`) FROM `cards` WHERE `side` IS NULL)
SELECT t1.frameEffects FROM `cards` AS t1 WHERE t1.cardKingdomFoilId IS NOT NULL AND t1.cardKingdomId IS NOT NULL GROUP BY t1.frameEffects ORDER BY COUNT(t1.frameEffects) DESC LIMIT 1;
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'duel' AND l.status = 'Legal' ORDER BY c.convertedManaCost DESC LIMIT 10
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1;
SELECT COUNT(*) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baca' AND T2.language = 'French'
SELECT COUNT(*) FROM `cards` AS C JOIN `legalities` AS L ON C.uuid = L.uuid WHERE C.rarity = 'rare' AND C.types LIKE '%Enchantment%' AND C.name = 'Abundance' AND L.status = 'Legal' GROUP BY C.id HAVING COUNT(C.id) > 0;
SELECT L.format ,  C.name FROM legalities AS L JOIN cards AS C ON L.uuid  =  C.uuid WHERE L.status  =  'Banned' GROUP BY L.format ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.language FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Battlebond'
SELECT T2.format FROM (SELECT T1.artist, COUNT(*) AS num FROM `cards` AS T1 GROUP BY T1.artist) AS T1 JOIN (SELECT T1.artist, T3.format FROM `cards` AS T1 JOIN `legalities` AS T3 ON T1.uuid = T3.uuid) AS T2 ON T1.artist = T2.artist WHERE T1.num = (SELECT MIN(num艺术家) FROM (SELECT artist, COUNT(*) AS num艺术家 FROM `cards` GROUP BY artist))
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '1997' AND T1.artist = 'D. Alexander Gregory' AND (T1.hasContentWarning = 1 OR T1.watermark = 'wizards') AND T2.format = 'legacy'
SELECT T1.name, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'
SELECT AVG(T1.id) ,  T2.language FROM `sets` AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1;
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena' GROUP BY artist;
SELECT T1.uuid FROM legalities AS T1 JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'oldschool' AND T1.status IN ('banned', 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC;
SELECT DISTINCT T1.name, T3.format FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode  =  T2.code JOIN `legalities` AS T3 ON T3.uuid  =  T1.uuid WHERE T2.name  =  'Hour of Devastation' AND T3.status = 'Legal'
SELECT T1.name FROM `sets` AS T1 LEFT JOIN `set_translations` AS T2 ON T1.code  =  T2.setCode WHERE T2.language != 'Japanese' OR T2.translation IS NULL INTERSECT SELECT T1.name FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code  =  T2.setCode WHERE T2.language  =  'Korean'
SELECT C.name, C.frameVersion FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.artist = 'Allen Williams' AND L.status = 'Banned'
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;
SELECT COUNT(*) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT p.Title  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'
SELECT DisplayName FROM users WHERE Id = (SELECT OwnerUserId FROM posts WHERE Title = 'Eliciting priors from experts')
SELECT p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;
SELECT T1.DisplayName FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.FavoriteCount = ( SELECT MAX(FavoriteCount) FROM posts ) LIMIT 1;
SELECT SUM(T3.CommentCount) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId JOIN posts AS T3 ON T3.ParentId = T2.Id WHERE T1.DisplayName = 'csgillespie'
SELECT MAX(T2.AnswerCount) FROM users AS T1 JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' AND T2.PostTypeId = 1
SELECT U.DisplayName  FROM users AS U  JOIN posts AS P ON U.Id = P.LastEditorUserId  WHERE P.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL;
SELECT U.DisplayName FROM posts P JOIN users U ON P.OwnerUserId = U.Id WHERE P.ClosedDate IS NOT NULL;
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20
SELECT T2.Location FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts' LIMIT 1;
SELECT P.Body  FROM posts AS P  JOIN tags AS T ON P.Id = T.ExcerptPostId  WHERE T.TagName = 'bayesian';
SELECT T1.Body FROM `posts` AS T1 INNER JOIN `tags` AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.Count = ( SELECT MAX(T3.Count) FROM `tags` AS T3 ) LIMIT 1;
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
SELECT T2.Name FROM `users` AS T1 JOIN `badges` AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'
SELECT COUNT(*) FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND STRFTIME('%Y', Date) = '2011'
SELECT T2.DisplayName FROM (SELECT UserId, COUNT(*) AS BadgeCount FROM Badges GROUP BY UserId) AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id ORDER BY T1.BadgeCount DESC LIMIT 1;
SELECT AVG(T2.Score) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT AVG(badge_count) AS average_badges FROM ( 	SELECT UserId, COUNT(*) AS badge_count 	FROM badges 	GROUP BY UserId ) b JOIN ( 	SELECT Id, Views 	FROM users 	WHERE Views > 200 ) u ON b.UserId = u.Id
SELECT CAST(SUM(CASE WHEN U.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.Id) FROM posts P JOIN users U ON P.OwnerUserId = U.Id WHERE P.Score > 5;
SELECT COUNT(*) FROM votes WHERE UserId = 58 AND DATE(CreationDate) = '2010-07-19'
SELECT T2.CreationDate FROM (SELECT COUNT(Id) AS TotalVotes, CreationDate FROM votes GROUP BY CreationDate) AS T2 WHERE T2.TotalVotes = (SELECT MAX(T1.TotalVotes) FROM (SELECT COUNT(Id) AS TotalVotes FROM votes GROUP BY CreationDate) AS T1)
SELECT COUNT(*) FROM `badges` WHERE `Name` = 'Revival'
SELECT p.Title FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts WHERE ViewCount = 1910)
SELECT T1.FavoriteCount FROM posts AS T1 JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = '3025' AND T2.CreationDate = '2014-04-23 20:29:39.0'
SELECT T2.Text FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.ParentId = 107829 AND T1.CommentCount = 1;
SELECT p.ClosedDate  FROM posts AS p  JOIN comments AS c ON c.PostId = p.Id  WHERE c.UserId = 23853 AND c.CreationDate = '2013-07-12 09:08:18.0'
SELECT T2.Reputation FROM `posts` AS T1 INNER JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 65041;
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Tiago Pasqualini')
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347;
SELECT COUNT(*) FROM posts INNER JOIN votes ON posts.Id = votes.PostId WHERE posts.Title LIKE '%data visualization%'
SELECT T2.Name FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT COUNT(T1.Id) / COUNT(T3.Id) FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id JOIN votes AS T3 ON T1.Id = T3.PostId WHERE T2.Id = 24
SELECT T1.ViewCount FROM posts AS T1 WHERE T1.Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT t.Text FROM `comments` AS t WHERE t.Score = 17;
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT B.Name FROM badges AS B JOIN users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'SilentGhost'
SELECT u.DisplayName  FROM users u  JOIN comments c ON u.Id = c.UserId  WHERE c.Text = 'thank you user93!'
SELECT T2.Text FROM users AS T1 JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion'
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?'
SELECT T3.Text FROM posts AS T1 JOIN comments AS T3 ON T1.Id = T3.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10
SELECT LASTEDITORDISPLAYNAME FROM POSTS WHERE TITLE = 'Open source tools for visualizing multi-dimensional data?'
SELECT p.Title FROM posts AS p JOIN users AS u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa'
SELECT SUM(p.Score), u.WebsiteUrl FROM posts AS p JOIN users AS u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl
SELECT c.Text FROM comments AS c JOIN posts AS p ON p.Id = c.PostId WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND EXISTS (SELECT * FROM postHistory AS ph WHERE ph.PostId = p.Id AND ph.PostHistoryTypeId IN (4,5,6))
SELECT SUM(T2.BountyAmount) AS TotalBounty FROM posts AS T1 JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%' AND T2.VoteTypeId = 9 GROUP BY T1.Id
SELECT u.DisplayName FROM users u JOIN votes v ON u.Id = v.UserId JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT p.Title, c.Text, AVG(p.ViewCount) AS AverageViewCount FROM posts p JOIN tags t ON p.Id = ANY(SELECT pt.PostId FROM PostsTags pt JOIN Tags tg ON pt.TagId = tg.Id WHERE tgTagName = 'humor') LEFT JOIN comments c ON p.Id = c.PostId GROUP BY p.Id, p.Title, c.Text;
SELECT COUNT(*) FROM comments WHERE UserId = 13;
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users) LIMIT 1;
SELECT Id FROM users ORDER BY Views LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011'
SELECT COUNT(*) FROM (SELECT UserId, COUNT(UserId) AS badge_count FROM `badges` GROUP BY UserId HAVING badge_count > 5) AS users_with_more_than_5_badges;
SELECT COUNT(*) FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'Teacher') AND Id IN (SELECT UserId FROM badges WHERE Name = 'Supporter') AND Location LIKE '%New York%'
SELECT u.DisplayName, u.Reputation FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Id = 1;
SELECT U.Id, U.DisplayName FROM users U WHERE U.Id IN ( SELECT PH.UserId FROM postHistory PH  JOIN posts P ON PH.PostId = P.Id WHERE P.ViewCount >= 1000 GROUP BY PH.UserId HAVING COUNT(DISTINCT PH.PostId) = ( SELECT COUNT(*) FROM postHistory PH2  WHERE PH2.UserId = PH.UserId GROUP BY PH2.PostId LIMIT 1 ) );
SELECT T3.DisplayName, T1.Name  FROM badges AS T1  JOIN users AS T3 ON T1.UserId = T3.Id  WHERE T3.Id IN(SELECT userId FROM comments GROUP BY userId ORDER BY COUNT(id) DESC LIMIT 1)
SELECT COUNT(*) FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Teacher' AND u.Location LIKE '%India%'
SELECT ((SUM(CASE WHEN strftime('%Y', b.Date) = '2010' THEN 1 ELSE 0 END) / COUNT(b.Id)) * 100 - (SUM(CASE WHEN strftime('%Y', b.Date) = '2011' THEN 1 ELSE 0 END) / COUNT(b.Id)) * 100) AS percentage_difference FROM badges AS b WHERE b.Name = 'Student';
SELECT COUNT(DISTINCT T1.UserId) AS CommentUsers, T2.PostHistoryTypeId FROM `comments` AS T1 INNER JOIN `postHistory` AS T2 ON T1.PostId = T2.PostId WHERE T1.PostId = 3720 GROUP BY T2.PostHistoryTypeId
SELECT p.Id, p.ViewCount AS Popularity FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.RelatedPostId = 61217
SELECT T1.Score, T2.LinkTypeId FROM posts AS T1 JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T1.Id = 395;
SELECT p.Id AS PostID, p.OwnerUserId AS UserID FROM posts p WHERE p.Score > 60;
SELECT SUM(p.FavoriteCount)  FROM posts p  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.Id = 686 AND YEAR(p.CreationDate) = 2011;
SELECT AVG(U.UpVotes) AS Avg_Up_Votes, AVG(U.Age) AS Avg_Age FROM users U JOIN (SELECT UserId, COUNT(*) AS PostCount FROM posts GROUP BY UserId HAVING COUNT(*) > 10) P ON U.Id = P.UserId WHERE U.Age IS NOT NULL AND U.UpVotes IS NOT NULL
SELECT COUNT(*) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE Score > 60;
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0'
SELECT COUNT(*) FROM `posts` WHERE `Score` = 10
SELECT T2.Name FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = (SELECT MAX(Reputation) FROM Users)
SELECT T1.Reputation FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Date = '2010-07-19 19:39:08.0'
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre'
SELECT T2.Date FROM users AS T1 JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'
SELECT COUNT(b.UserId) AS numOfTeachers,        (SELECT COUNT(*) FROM users) AS totalUsers,        (COUNT(b.UserId) * 100.0 / (SELECT COUNT(*) FROM users)) AS TeacherPercentage FROM badges b WHERE b.Name = 'Teacher';
SELECT CAST(COUNT(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN T1.UserId END) AS REAL) / COUNT(T1.UserId) * 100 FROM Badges AS T1 INNER JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'
SELECT T2.Score FROM posts AS T1 JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CreationDate = '2010-07-19 19:19:56.0'
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'
SELECT U.Id, U.Age  FROM users U  JOIN badges B ON U.Id = B.UserId  WHERE U.Location LIKE '%Vienna, Austria%'
SELECT COUNT(*) FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Supporter' AND u.Age BETWEEN 19 AND 65;
SELECT SUM(U.Views) FROM users AS U JOIN badges AS B ON B.UserId = U.Id WHERE B.Date = '2010-07-19 19:39:08.0'
SELECT DISTINCT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)
SELECT T1.Name FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Sharpie'
SELECT COUNT(*) FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND u.Age > 65;
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location LIKE '%New York%'
SELECT COUNT(*) FROM votes WHERE strftime('%Y', CreationDate) = '2010'
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN strftime('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN strftime('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) FROM votes;
SELECT T.TagName FROM `tags` AS T JOIN `posts` AS P ON T.ExcerptPostId = P.Id WHERE P.OwnerUserId = (SELECT U.Id FROM `users` AS U WHERE U.DisplayName = 'John Salvatier')
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Daniel Vassallo')
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan')
SELECT p.Id AS PostID FROM `posts` p JOIN `users` u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' GROUP BY p.Id ORDER BY AnswerCount DESC LIMIT 1;
SELECT      OwnerUserId,     SUM(ViewCount) AS TotalViewCount FROM      posts WHERE      OwnerUserId IN (         SELECT              Id         FROM              users         WHERE              DisplayName IN ('Harvey Motulsky', 'Noah Snyder')     ) GROUP BY      OwnerUserId ORDER BY      TotalViewCount DESC LIMIT 1;
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Matt Parker') AND Score > 4
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score < 0 AND posts.OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Neil McGuigan')
SELECT T.TagName FROM (SELECT P.Id, P.Tags FROM posts AS P JOIN users AS U ON P.OwnerUserId = U.Id WHERE U.DisplayName = 'Mark Meckes') AS MPJOIN (SELECT Id, TagName FROM tags) AS TON Tags.Id IN (SELECT EXcerptPostId, WikiPostId FROM Tags) WHERE NOT EXISTS (SELECT * FROM Comments WHERE PostId = MP.Id) AND MP.Tags LIKE '%' + T.TagName + '%' AND CommentCount = 0
SELECT T2.DisplayName FROM `badges` AS T1 JOIN `users` AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(P.Id) FROM posts AS P JOIN users AS U ON P.OwnerUserId = U.Id LEFT JOIN (SELECT PostId, TagName FROM `posts` JOIN `tags` ON STRPOS(`posts`.Tags, `<`) > 0 WHERE `tags`.`TagName` = 'r') AS T ON T.PostId = P.Id WHERE U.DisplayName LIKE '%Community%'
SELECT (SELECT SUM(ViewCount) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Mornington')) - (SELECT SUM(ViewCount) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Amos'));
SELECT COUNT(*) FROM badges WHERE Name='Commentator' AND strftime('%Y', Date)='2014';
SELECT COUNT(*) FROM `posts` WHERE `CreaionDate` BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';
SELECT DisplayName, Age FROM users WHERE Views = (SELECT MAX(Views) FROM users)
SELECT T1.LastEditDate, T1.LastEditorUserId FROM `posts` AS T1 WHERE T1.Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;
SELECT p.Title, c.UserId, u.DisplayName  FROM comments c  JOIN posts p ON c.PostId = p.Id  JOIN users u ON c.UserId = u.Id  WHERE c.Score > 60;
SELECT T1.Name FROM badges AS T1 JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'North Pole' AND STRFTIME('%Y', T1.Date) = '2011'
SELECT U.DisplayName, U.WebsiteUrl FROM users AS U JOIN posts AS P ON U.Id = P.OwnerUserId WHERE P.FavoriteCount > 150;
SELECT COUNT(ph.Id) AS PostHistoryCount, p.LastEditDate FROM posts p JOIN posthistory ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY ph.PostId, p.LastEditDate;
SELECT u.LastAccessDate, u.Location FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Outliers'
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T1.PostId IN ( SELECT Id FROM posts WHERE Title = "How to tell if something happened in a data set which monitors a value over time" ) AND T1.LinkTypeId = 1;
SELECT T1.PostId, T3.Name FROM `comments` AS T1 JOIN `users` AS T2 ON T1.UserId = T2.Id JOIN `badges` AS T3 ON T2.Id = T3.UserId WHERE T2.UserDisplayName = 'Samuel' AND strftime('%Y', T1.CreationDate) = '2013' INTERSECT SELECT T4.PostId, T3.Name FROM `posts` AS T4 JOIN `users` AS T2 ON T4.OwnerUserId = T2.Id JOIN `badges` AS T3 ON T2.Id = T3.UserId WHERE T2.UserDisplayName = 'Samuel' AND strftime('%Y', T4.CreaionDate) = '2013'
SELECT T2.DisplayName FROM posts AS T1 JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount = (SELECT MAX(T3.ViewCount) FROM posts AS T3)
SELECT T3.DisplayName, T3.Location FROM tags AS T1 JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T1.TagName = 'hypothesis-testing'
SELECT T2.Title, T1.LinkTypeId FROM postLinks AS T1 JOIN posts AS T2 ON T1.RelatedPostId = T2.Id WHERE T2.Title = 'What are principal component scores?'
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ParentId IS NOT NULL AND p.Score = (SELECT MAX(sub_p.Score) FROM posts AS sub_p WHERE sub_p.ParentId IS NOT NULL) LIMIT 1;
SELECT T1.DisplayName, T1.WebsiteUrl FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.VoteTypeId = 8 ORDER BY T2.BountyAmount DESC LIMIT 1;
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts) LIMIT 1;
SELECT Age FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) FROM votes AS v JOIN posts AS p ON p.Id = v.PostId WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50;
SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users);
SELECT SUM(Score) FROM posts WHERE LastActivityDate LIKE '2010-07-19%'
SELECT AVGMonthly AS ( 	SELECT COUNT(l.Id) / 12.0 AS Avg Monthly Links 	FROM postLinks l 	INNER JOIN posts p ON p.Id = l.PostId 	WHERE YEAR(l.CreationDate) = 2010 AND p.AnswerCount <= 2 ) SELECT * FROM AvgMonthly;
SELECT p.Id FROM `posts` AS p JOIN `votes` AS v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;
SELECT T1.Title FROM `posts` AS T1 JOIN `postLinks` AS T2 ON T1.Id = T2.PostId WHERE T2.CreationDate = (SELECT MIN(`CreationDate`) FROM `postLinks`)
SELECT T2.DisplayName FROM (SELECT UserId, COUNT(*) AS BadgeCount FROM Badges GROUP BY UserId) AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id ORDER BY T1.BadgeCount DESC LIMIT 1
SELECT MIN(v.CreationDate) FROM votes AS v JOIN users AS u ON u.Id = v.UserId WHERE u.DisplayName = 'chl'
SELECT T2.CreationDate FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Age = ( SELECT MIN(Age) FROM users ) GROUP BY T2.CreationDate ORDER BY T2.CreationDate LIMIT 1;
SELECT DisplayName FROM users WHERE Id = (SELECT UserId FROM badges WHERE Name = 'Autobiographer' ORDER BY Date ASC LIMIT 1)
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount >= 4 AND u.Location = 'United Kingdom'
SELECT AVG(T2.PostId) FROM users AS T1 JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = (SELECT MAX(Age) FROM users)
SELECT DisplayName FROM users ORDER BY Reputation DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000;
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'Jay Stevens') AND YEAR(CreationDate) = 2010;
SELECT Id, Title FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1;
SELECT T1.Id AS PostId, T1.Title AS PostTitle FROM Posts AS T1 WHERE T1.Score = (SELECT MAX(Score) FROM Posts) LIMIT 1;
SELECT AVG(T1.Score) FROM `posts` AS T1 JOIN `users` AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'Stephen Turner'
SELECT DISTINCT T3.DisplayName FROM posts AS T1 JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T1.ViewCount > 20000 AND strftime('%Y', T1.CreationDate) = '2011'
SELECT T1.Id, T3.DisplayName FROM `posts` AS T1 JOIN `users` AS T3 ON T1.OwnerUserId = T3.Id WHERE STRFTIME('%Y',T1.LasActivityDate)='2010' ORDER BY FavoriteCount DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE YEAR(posts.CreationDate) = 2011;
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users;
SELECT p.ViewCount, u.DisplayName FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' ORDER BY p.LastActivityDate DESC LIMIT 1;
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts WHERE Score = (SELECT MAX(Score) FROM posts))
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT u.DisplayName, u.Location  FROM users u  JOIN posts p ON u.Id = p.LastEditorUserId  WHERE p.Id = 183  ORDER BY p.LastEditDate DESC LIMIT 1;
SELECT b.Name FROM badges b WHERE b.UserId = (  SELECT u.Id FROM users u WHERE u.DisplayName = 'Emmett' ) ORDER BY b.Date DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT julianday((SELECT Date FROM badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Zolomon'))) - julianday((SELECT CreationDate FROM users WHERE DisplayName = 'Zolomon'))
SELECT COUNT(p.Id) AS NumberOfPosts, COUNT(c.Id) AS NumberOfComments  FROM posts p  LEFT JOIN comments c ON p.OwnerUserId = c.UserId  JOIN users u ON p.OwnerUserId = u.Id  WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM users)  GROUP BY p.OwnerUserId, c.UserId;
SELECT c.Text, u.DisplayName FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.PostId IN (SELECT Id FROM posts WHERE Title = 'Analysing wind data with R') ORDER BY c.CreationDate DESC LIMIT 10;
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(*) FROM posts INNER JOIN tags ON posts.Id = tags.ExcerptPostId OR posts.Id = tags.WikiPostId WHERE tags.TagName = 'careers'
SELECT U.Reputation, U.Views FROM users AS U WHERE U.DisplayName = 'Jarrod Dixon'
SELECT COUNT(comments.Id) AS NumComments, SUM(posts.AnswerCount) AS NumAnswers  FROM posts  LEFT JOIN comments ON posts.Id = comments.PostId  WHERE posts.Title = 'Clustering 1D data' GROUP BY posts.Id;
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*) FROM votes WHERE VoteTypeId = 8 AND BountyAmount >= 30;
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM (SELECT u.Reputation, p.* FROM posts AS p CROSS JOIN users AS u WHERE p.OwnerUserId = u.Id ORDER BY u.Reputation DESC LIMIT 1) AS p
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT COUNT(*) FROM tags WHERE Id < 15 AND Count <= 20;
SELECT ExcerptPostId , WikiPostId FROM tags WHERE TagName  =  'sample' ;
SELECT U.Reputation, U.UpVotes FROM users AS U JOIN comments AS C ON U.Id = C.UserId WHERE C.Text = 'fine, you win :)' LIMIT 1;
SELECT T1.Text FROM `comments` AS T1 INNER JOIN `posts` AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%linear regression%'
SELECT T2.Text FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount BETWEEN 100 AND 150 ORDER BY T2.Score DESC LIMIT 1;
SELECT T2.CreationDate ,  T1.Age FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.WebsiteUrl LIKE '%http%'
SELECT COUNT(*) FROM `comments` c JOIN `posts` p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5;
SELECT COUNT(*) FROM comments WHERE Score = 0 AND PostId IN (SELECT PostId FROM comments GROUP BY PostId HAVING COUNT(*) = 1)
SELECT COUNT(DISTINCT uc.UserId)  FROM (     SELECT c.UserId      FROM comments c     JOIN users u ON c.UserId = u.Id     WHERE c.Score = 0 AND u.Age = 40 ) uc;
SELECT T1.Id AS PostId, T2.Text FROM posts AS T1 JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item'
SELECT T2.UpVotes FROM (SELECT * FROM comments WHERE TEXT = 'R is also lazy evaluated.') AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id;
SELECT T2.Text FROM users AS T1 JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Harvey Motulsky'
SELECT DISTINCT c.UserId, u.DisplayName  FROM comments AS c  JOIN users AS u ON (c.UserId = u.Id)  WHERE c.Score BETWEEN 1 AND 5  AND u.DownVotes = 0;
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.Id) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;
SELECT T2.full_name FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id GROUP BY T2.full_name HAVING COUNT(T2.full_name) > 15
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue')
SELECT T3.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.skin_colour_id = T2.id JOIN `colour` AS T3 ON T1.skin_colour_id = T3.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM `superhero`  JOIN `colour` ON `superhero`.`eye_colour_id` = `colour`.`id` JOIN `hero_power` ON `superhero`.`id` = `hero_power`.`hero_id` JOIN `superpower` ON `hero_power`.`power_id` = `superpower`.`id` WHERE `colour`.`colour` = 'Blue' AND `superpower`.`power_name` = 'Agility';
SELECT superhero_name FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue') AND hair_colour_id IN (SELECT id FROM colour WHERE colour = 'Blond')
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT superhero_name FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;
SELECT T2.publisher_name FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT c.colour AS eye_colour, COUNT(sh.id) AS superhero_count FROM superhero sh JOIN colour c ON sh.eye_colour_id = c.id JOIN publisher p ON sh.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY sh.eye_colour_id ORDER BY superhero_count DESC;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id  =  T2.id WHERE T2.publisher_name  =  'Marvel Comics'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id  =  T2.hero_id WHERE T1.publisher_id IN (SELECT id FROM publisher WHERE publisher_name  =  'Marvel Comics') AND T2.power_id IN (SELECT id FROM superpower WHERE power_name  =  'Super Strength')
SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` IN (SELECT id FROM `publisher` WHERE `publisher_name` = 'DC Comics')
SELECT T4.publisher_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id JOIN publisher AS T4 ON T3.publisher_id = T4.id WHERE T2.attribute_name = 'Speed' ORDER BY T1.attribute_value ASC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Gold') AND publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT T2.publisher_name FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM `superhero` JOIN `colour` ON `superhero`.`hair_colour_id` = `colour`.`id` WHERE `colour`.`colour` = 'Blond'
SELECT t1.superhero_name FROM superhero AS t1 JOIN hero_attribute AS t2 ON t1.id = t2.hero_id JOIN attribute AS t3 ON t2.attribute_id = t3.id WHERE t3.attribute_name = 'Intelligence' ORDER BY t2.attribute_value LIMIT 1
SELECT T1.race FROM `race` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.race_id WHERE T2.superhero_name = 'Copycat'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T3.attribute_name = 'Durability' AND T2.attribute_value < 50
SELECT T3.superhero_name FROM superpower AS T1 JOIN hero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T1.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON attribute.id = hero_attribute.attribute_id JOIN gender ON gender.id = superhero.gender_id WHERE attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100 AND gender.gender = 'Female'
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1;
SELECT COUNT(*) FROM `superhero` WHERE `race_id` = (SELECT id FROM `race` WHERE `race` = 'Vampire')
SELECT CAST(COUNT(CASE WHEN t1.alignment_id = 2 THEN t1.id ELSE NULL END) AS REAL) * 100 / COUNT(t1.id), SUM(CASE WHEN t1.publisher_id = 2 AND t1.alignment_id = 2 THEN 1 ELSE 0 END) FROM superhero AS t1 JOIN publisher AS t2 ON t1.publisher_id = t2.id JOIN alignment AS t3 ON t1.alignment_id = t3.id WHERE t3.alignment = 'Bad'
SELECT  	(SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) -  	(SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AS difference
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT AVG(T1.attribute_value) FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.gender_id = (SELECT id FROM gender WHERE gender = 'Male') LIMIT 5;
SELECT superhero_name FROM `superhero` WHERE `race_id` = (SELECT id FROM `race` WHERE race = 'Alien')
SELECT `superhero_name` FROM `superhero` WHERE `height_cm` BETWEEN 170 AND 190 AND `eye_colour_id` = (SELECT id FROM `colour` WHERE `colour` = 'No Colour')
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT T1.full_name FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 2;
SELECT T2.race FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T3.colour FROM `superhero` AS T1 JOIN `colour` AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T1.race_id = (SELECT id FROM `race` WHERE race = 'human')
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = (SELECT MAX(weight_kg) FROM `superhero`)
SELECT CAST(COUNT(CASE WHEN T2.publisher_id = 13 THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T2.height_cm) FROM superhero AS T2 JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T2.height_cm BETWEEN 150 AND 180
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `gender` AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM `superhero`)
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id  =  T2.id GROUP BY T2.power_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT HA.attribute_value  FROM hero_attribute HA  JOIN superhero SH ON HA.hero_id = SH.id  WHERE SH.superhero_name = 'Abomination'
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1
SELECT COUNT(*) FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Stealth')
SELECT T1.full_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T3.id = T2.attribute_id WHERE T3.attribute_name = 'Strength' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT AVG(T1.id) FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'No Colour'
SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_attribute` AS T2 ON T1.id = T2.hero_id JOIN `attribute` AS T3 ON T2.attribute_id = T3.id JOIN `publisher` AS T4 ON T1.publisher_id = T4.id WHERE T4.publisher_name = 'Dark Horse Comics' AND T3.attribute_name = 'Durability' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T3.superhero_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id  =  T2.id JOIN superhero AS T3 ON T1.hero_id  =  T3.id WHERE T2.power_name  =  'Flight'
SELECT T1.colour, T2.colour, T3.colour FROM superhero AS t4 JOIN colour AS T1 ON t4.eye_colour_id = T1.id JOIN colour AS T2 ON t4.hair_colour_id = T2.id JOIN colour AS T3 ON t4.skin_colour_id = T3.id WHERE t4.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND t4.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')
SELECT T1.superhero_name, T3.publisher_name FROM superhero AS T1 JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T1.hair_colour_id = T1.skin_colour_id AND T1.hair_colour_id = T1.eye_colour_id;
SELECT T2.race FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'
SELECT CAST(SUM(IIF(T2.colour = 'Blue', 1, 0)) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.gender_id = (SELECT id FROM gender WHERE gender = 'Female') AND T2.colour = 'Blue';
SELECT T1.superhero_name, T3.race FROM `superhero` AS T1 JOIN `race` AS T3 ON T1.race_id = T3.id WHERE T1.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT T1.superhero_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T2.power_id = (SELECT id FROM superpower WHERE power_name = 'Adaptation')
SELECT COUNT(*) FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Amazo'))
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT superhero_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Black') AND hair_colour_id = (SELECT id FROM colour WHERE colour = 'Black')
SELECT T1.eye_colour_id FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.skin_colour_id  =  T2.id WHERE T2.colour  =  'Gold'
SELECT full_name FROM superhero WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')
SELECT T1.superhero_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*) FROM hero_attribute JOIN `attribute` ON hero_attribute.attribute_id = `attribute`.`id` WHERE `attribute`.`attribute_name` = 'Strength' AND hero_attribute.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute JOIN `attribute` ON hero_attribute.attribute_id = `attribute`.`id` WHERE `attribute`.`attribute_name` = 'Strength');
SELECT T1.race, T2.alignment FROM race AS T1 JOIN superhero AS T3 ON T1.id = T3.race_id JOIN alignment AS T2 ON T2.id = T3.alignment_id WHERE T3.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.publisher_name = 'Marvel Comics';
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS weight_difference;
SELECT AVG(height_cm) AS average_height FROM superhero;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM `superhero` WHERE `race_id` = 21 AND `gender_id` = 1;
SELECT T3.superhero_name FROM hero_attribute AS T1 JOIN attribute AS T2 ON T1.attribute_id = T2.id JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T2.attribute_name = 'Speed' ORDER BY T1.attribute_value DESC LIMIT 1;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT a.attribute_name, ha.attribute_value  FROM hero_attribute ha  JOIN attribute a ON ha.attribute_id = a.id  WHERE ha.hero_id IN (SELECT id FROM superhero WHERE superhero_name = '3-D Man')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id JOIN `colour` AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Brown'
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') GROUP BY T2.publisher_name HAVING COUNT(*) = 3
SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = 1;
SELECT CAST(COUNT(CASE WHEN T2.colour = 'Blue' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue';
SELECT CAST(SUM(IIF(T2.gender = 'Male', 1, 0)) AS REAL) / SUM(IIF(T2.gender = 'Female', 1, 0)) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id;
SELECT `superhero_name` FROM `superhero` ORDER BY `height_cm` DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT T1.full_name FROM `superhero` AS T1 WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T4.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T4 ON T2.power_id = T4.id WHERE T1.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.height_cm = 188 AND T1.weight_kg = 108;
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38;
SELECT T1.race FROM `race` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.race_id JOIN `hero_attribute` AS T3 ON T2.id = T3.hero_id WHERE T3.attribute_value = ( SELECT MAX(attr_val) FROM ( SELECT hero_attribute.attribute_value AS attr_val FROM `hero_attribute`) )
SELECT T3.alignment, T4.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN alignment AS T3 ON T1.alignment_id = T3.id JOIN superpower AS T4 ON T2.power_id = T4.id WHERE T1.superhero_name = 'Atom IV'
SELECT s.superhero_name FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;
SELECT AVG(T2.attribute_value) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3;
SELECT T4.colour FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id  =  T2.id JOIN attribute AS T3 ON T1.attribute_id  =  T3.id JOIN colour AS T4 ON T2.skin_colour_id  =  T4.id WHERE T1.attribute_value  =  100
SELECT COUNT(*) FROM `superhero` WHERE `alignment_id` = 1 AND `gender_id` = 2;
SELECT T2.superhero_name FROM hero_attribute AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id WHERE T1.attribute_value BETWEEN 75 AND 80;
SELECT T1.race FROM `race` AS T1 JOIN `superhero` AS T2 ON T1.id = T2.race_id JOIN `colour` AS T3 ON T3.id = T2.hair_colour_id JOIN `gender` AS T4 ON T4.id = T2.gender_id WHERE T3.colour = 'Blue' AND T4.gender = 'Male';
SELECT CAST(COUNT(CASE WHEN T.gender_id = 2 THEN 1 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T JOIN alignment AS A ON T.alignment_id = A.id WHERE A.id = 2;
SELECT ( SELECT COUNT(*) FROM superhero AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' AND (T1.weight_kg = 0 OR T1.weight_kg IS NULL ) ) - ( SELECT COUNT(*) FROM superhero AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'No Colour' AND (T1.weight_kg = 0 OR T1.weight_kg IS NULL ) );
SELECT T1.strength FROM ( SELECT hero_attribute.attribute_value AS strength FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND hero_attribute.hero_id IN(SELECT superhero.id FROM superhero WHERE superhero.superhero_name = 'Hulk') ) AS T1
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `hero_power` AS T2 ON T1.id = T2.hero_id JOIN `superpower` AS T3 ON T3.id = T2.power_id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC;
SELECT T1.gender FROM gender AS T1 JOIN superhero AS T2 ON T1.id  =  T2.gender_id JOIN hero_power AS T3 ON T2.id  =  T3.hero_id JOIN superpower AS T4 ON T3.power_id  =  T4.id WHERE T4.power_name  =  'Phoenix Force'
SELECT t1.superhero_name FROM `superhero` AS t1 JOIN `publisher` AS t2 ON t1.publisher_id = t2.id WHERE t2.publisher_name = 'DC Comics' ORDER BY t1.weight_kg DESC LIMIT 1;
SELECT AVG(T1.height_cm) FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id  =  T2.id WHERE T2.publisher_name  =  'Dark Horse Comics' AND T1.race_id != 1
SELECT COUNT(*) FROM `hero_attribute`  JOIN `attribute` ON `hero_attribute`.`attribute_id` = `attribute`.`id`  WHERE `attribute_value` = 100 AND `attribute_name` = 'Speed'
SELECT ( SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = ( SELECT id FROM `publisher` WHERE publisher_name = "DC Comics" ) ) - ( SELECT COUNT(*) FROM `superhero` WHERE `publisher_id` = ( SELECT id FROM `publisher` WHERE publisher_name = "Marvel Comics" ) );
SELECT a.attribute_name FROM attribute AS a JOIN hero_attribute AS ha ON a.id = ha.attribute_id WHERE ha.hero_id = (SELECT id FROM superhero WHERE superhero_name = 'Black Panther') ORDER BY ha.attribute_value ASC LIMIT 1;
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN colour AS T3 ON T2.id = T3.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT CAST(COUNT(CASE WHEN T3.gender = 'Female' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.publisher_name = 'George Lucas';
SELECT CAST(COUNT(CASE WHEN T3.alignment = 'Good' THEN 1 END) AS REAL) * 100 / COUNT(T2.id) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN alignment AS T3 ON T3.id = T2.alignment_id WHERE T1.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT T2.full_name FROM colour AS T1 JOIN superhero AS T2 ON T1.id = T2.eye_colour_id WHERE T1.colour = 'Amber' AND T2.weight_kg < 100;
SELECT hero_attribute.attribute_value FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON attribute.id = hero_attribute.attribute_id WHERE superhero.superhero_name = 'Aquababy'
SELECT weight_kg, race_id FROM superhero WHERE id = 40;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Intelligence')
SELECT T3.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id JOIN `colour` AS T3 ON T2.id = T3.id WHERE T1.superhero_name = 'Blackwulf'
SELECT T4.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T4 ON T2.power_id = T4.id WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT T2.driverref FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.raceid = 20 ORDER BY T1.q1 DESC LIMIT 5
SELECT T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 19 AND T2.q2 IS NOT NULL ORDER BY T2.q2 ASC LIMIT 1;
SELECT T1.year FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.location = "Shanghai"
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = "Circuit de Barcelona-Catalunya"
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = "Germany"
SELECT T2.position FROM constructors AS T1 JOIN qualifying AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = "Renault"
SELECT COUNT(*) FROM (SELECT * FROM races WHERE YEAR = 2010 AND name NOT LIKE 'GP' EXCEPT SELECT * FROM races WHERE YEAR = 2010 AND (country = 'China' OR country = 'Japan' OR country = 'Turkey' OR country = 'Bahrain') )
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = "Spain"
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "Australian Grand Prix"
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "Sepang International Circuit"
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "Sepang International Circuit"
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "Abu Dhabi Grand Prix"
SELECT T3.nationality FROM constructorResults AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T1.constructorId = T3.constructorId WHERE T1.points = 1 AND T2.raceId = 24
SELECT q1 FROM qualifying WHERE raceid = 354 AND driverid = (SELECT driverid FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna')
SELECT T3.nationality FROM qualifying AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 355 AND T1.q2 = '01:40.967'
SELECT T1.number FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 903 AND T2.q3 LIKE '%:54%'
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND results.time IS NULL AND races.year = 2007;
SELECT T2.year FROM races AS T1 JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901;
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL
SELECT forename, surname FROM results JOIN drivers ON results.driverid = drivers.driverid WHERE raceid = 592 AND time IS NOT NULL ORDER BY drivers.dob ASC LIMIT 1
SELECT T2.url FROM races AS T1 JOIN results AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T2 ON T3.driverId = T2.driverId WHERE T1.raceId = 161 AND T3.positionText = '1' AND T3.time LIKE '0:01:%'
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 933 ORDER BY fastestlapspeed DESC LIMIT 1;
SELECT circuits.lat, circuits.lng FROM circuits JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 JOIN constructorresults AS T2 ON T1.constructorid = T2.constructorid WHERE raceid = 9 GROUP BY T1.constructorid ORDER BY SUM(T2.points) DESC LIMIT 1
SELECT T2.q1 FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 345 AND T1.forename = "Lucas" AND T1.surname = "di Grassi";
SELECT d.nationality FROM drivers AS d JOIN qualifying AS q ON d.driverId = q.driverId WHERE q.raceId = 347 AND q.q2 = '01:15';
SELECT drivers.code FROM drivers JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.q3 LIKE '1:33%' AND raceid = 45;
SELECT T1.time FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceId = 743;
SELECT Drivers.forename, Drivers.surname FROM Results JOIN Drivers ON Results.driverId = Drivers.driverId WHERE Results.position = 2 AND Results.raceId IN ( SELECT Races.raceId FROM Races WHERE Races.year = 2006 AND Races.name LIKE "%San Marino%" ) ;
SELECT T2.url FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year WHERE T2.raceid = 901
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE date = '2015-11-29') AND statusId != 1;
SELECT T1.driverId FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 872 AND T2.time != "" ORDER BY T1.dob DESC LIMIT 1
SELECT D.forename, D.surname FROM drivers AS D JOIN lapTimes AS LT ON D.driverId = LT.driverId WHERE LT.raceId = 348 ORDER BY LT.time LIMIT 1;
SELECT T2.nationality FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapSpeed = ( SELECT MAX(`fastestLapSpeed`) FROM `results` ) LIMIT 1;
SELECT ((SELECT fastestLapSpeed FROM results WHERE resultId IN(SELECT MIN(resultId) FROM results WHERE raceId = 853 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' and surname = 'di Resta')) )- (SELECT fastestLapSpeed FROM results WHERE resultId IN(SELECT MIN(resultId) FROM results WHERE raceId = 854 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' and surname='di Resta'))))/((SELECT fastestLapSpeed FROM results WHERE resultId IN (SELECT MIN(resultId) FROM results WHERE raceId = 853 AND driverId IN(SELECT driverId FROM drivers WHERE forename ='Paul' AND surname = 'di Resta'))) ) *100;
SELECT CAST(SUM(IIF(T2.time IS NOT NULL, 1, 0)) AS REAL) * 100 / COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.date = '1983-07-16'
SELECT MIN(year) FROM races WHERE name = "Singapore Grand Prix"
SELECT COUNT(*) ,  name FROM races WHERE YEAR = 2005 GROUP BY name ORDER BY name DESC
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE strftime('%Y', T1.date) = (SELECT MIN(strftime('%Y', date)) FROM races) AND strftime('%m', T1.date) = (SELECT MIN(strftime('%m', date)) FROM races WHERE strftime('%Y', date) = (SELECT MIN(strftime('%Y', date)) FROM races))
SELECT T2.name ,  T2.date FROM races AS T2 JOIN results AS T1 ON T1.raceId = T2.raceId WHERE year = 1999 ORDER BY T2.round DESC LIMIT 1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT name FROM races WHERE year = 2017 EXCEPT SELECT name FROM races WHERE year = 2000;
SELECT T2.country, T1.name, T1.locality FROM circuits AS T1 JOIN countries AS T2 ON T1.cid = T2.cid JOIN races AS T3 ON T1.cid = T3.cid WHERE T3.name = 'European Grand Prix' ORDER BY T3.year ASC LIMIT 1;
SELECT T2.year FROM races AS T1 JOIN seasons AS T2 ON T2.year = T1.year WHERE T1.name = "British Grand Prix" AND T1.circuitId = (SELECT circuitId FROM circuits WHERE name = "Brands Hatch") ORDER BY T2.year DESC LIMIT 1;
SELECT COUNT(DISTINCT T2.year) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone' AND T2.name = 'British Grand Prix';
SELECT T3.forename, T3.surname FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T3.driverid = T2.driverid WHERE T1.year = 2010 AND T1.name = 'Singapore Grand Prix' ORDER BY T2.position ASC
SELECT d.forename, d.surname, ds.points  FROM driverStandings AS ds  JOIN drivers AS d ON ds.driverId = d.driverId  WHERE ds.points = (SELECT MAX(points) FROM driverStandings);
SELECT ds.driverId, d.forename, d.surname, ds.points  FROM driverStandings AS ds  JOIN drivers AS d ON ds.driverId = d.driverId  WHERE ds.raceId = (SELECT r.raceId FROM races AS r WHERE r.year = 2017 AND r.name = 'Chinese Grand Prix')  ORDER BY ds.position ASC LIMIT 3;
SELECT T3.forename, T3.surname, T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM results)
SELECT AVG(T3.milliseconds) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN qualifying AS T3 ON T2.driverid = T3.driverid JOIN drivers AS T4 ON T2.driverid = T4.driverid WHERE T1.year = 2009 AND T1.name = 'Malaysian Grand Prix' AND T4.forename = 'Lewis' AND T4.surname = 'Hamilton'
SELECT CAST(SUM(IIF(T2.position > 1 AND T1.year >= 2010, 1, 0)) AS REAL) * 100 / COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.driverid IN (SELECT driverid FROM drivers WHERE surname = "Hamilton");
SELECT d.forename, d.surname, d.nationality, MAX(r.points) as max_points FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE r.positionOrder = 1 GROUP BY d.driverId ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.forename, T1.surname, (strftime('%Y', 'now') - strftime('%Y', T1.dob)) as age FROM drivers AS T1 WHERE T1.nationality = 'Japanese' ORDER BY T1.dob DESC LIMIT 1;
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T2.year BETWEEN 1990 AND 2000 GROUP BY T1.circuitId HAVING count(*)  >=  4
SELECT c.name, c.location, r.name FROM circuits c JOIN races r ON c.circuitId = r.circuitId WHERE r.year = 2006 AND c.country = 'USA'
SELECT T1.name , T3.name , T3.location FROM races AS T1 JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE strftime('%Y', T1.date) = '2005' AND strftime('%m',T1.date) = '09'
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20;
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid JOIN drivers AS T4 ON T2.driverid = T4.driverid WHERE T3.name = "Sepang International Circuit" AND T4.forename = "Michael" AND T4.surname = "Schumacher" AND T2.position = 1
SELECT DISTINCT races.name, races.year FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' ORDER BY results.fastestLapTime LIMIT 1;
SELECT AVG(T2.points) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2000 AND T3.surname = "Irvine" AND T3.forename = "Eddie"
SELECT RACES.raceName ,  RESULTS.points FROM RACES INNER JOIN RESULTS ON RACES.raceId = RESULTS.raceId INNER JOIN DRIVERS ON DRIVERS.driverId = RESULTS.driverId WHERE DRIVERS.surname = 'Hamilton' AND DRIVERS.forename = 'Lewis' ORDER BY RACES.year LIMIT 1;
SELECT T1.name, T3.country FROM races AS T1 JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T1.year = 2017 ORDER BY date ASC;
SELECT T2.name, T2.year, T3.circuitId FROM races AS T2 JOIN results AS T1 ON T2.raceId = T1.raceId JOIN circuits AS T3 ON T3.circuitId = T2.circuitId WHERE T1.laps = ( SELECT MAX(laps) FROM results )
SELECT CAST(SUM(IIF(T2.country = "Germany", 1, 0)) AS REAL) * 100 / COUNT(T1.raceId) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = "European Grand Prix"
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1;
SELECT circuitref FROM circuits WHERE name = "Marina Bay Street Circuit"
SELECT T2.country FROM circuits AS T1 JOIN countries AS T2 ON T1.circuitId = T2.circuitId WHERE T1.altitude = (SELECT MAX(altitude) FROM circuits)
SELECT count(*) FROM Drivers WHERE code IS NULL
SELECT nationality FROM drivers WHERE dob = ( SELECT MIN(dob) FROM drivers ) LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT URL FROM drivers WHERE forename = "Anthony" AND surname = "Davidson";
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE year = 2009 AND T2.name = "Spanish Grand Prix";
SELECT year FROM races WHERE circuitId IN ( SELECT circuitId FROM circuits WHERE name = "Silverstone" ) GROUP BY year ORDER BY year DESC
SELECT url FROM circuits WHERE circuitId IN (SELECT circuitId FROM races WHERE name = 'British Grand Prix') AND name = 'Silverstone'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.year >= 2010 AND name = 'Abu Dhabi Grand Prix' AND T2.name = 'Abu Dhabi';
SELECT COUNT(*) FROM races WHERE circuitId IN (SELECT circuitId FROM circuits WHERE country = "Italy")
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "Circuit de Barcelona-Catalunya"
SELECT T1.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009;
SELECT T2.fastestLapTime FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton" ORDER BY T2.fastestLapTime LIMIT 1;
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE fastestLapSpeed IS NOT NULL ORDER BY fastestLapSpeed DESC LIMIT 1;
SELECT T3.driverref FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2007 AND T1.name = 'Canadian Grand Prix' ORDER BY position LIMIT 1
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.position ASC LIMIT 1
SELECT MAX(T2.fastestLapSpeed) FROM `races` AS T1 JOIN `results` AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'
SELECT T3.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton";
SELECT driverStandings.position  FROM driverStandings  JOIN races ON driverStandings.raceId = races.raceId  JOIN drivers ON driverStandings.driverId = drivers.driverId  WHERE races.name = 'Chinese Grand Prix' AND drivers.surname = 'Hamilton' AND drivers.forename = 'Lewis' AND races.year = 2008;
SELECT T2.forename, T2.surname FROM races AS T1 JOIN results AS T3 ON T1.raceid = T3.raceid JOIN drivers AS T2 ON T2.driverid = T3.driverid WHERE T1.year = 1989 AND T1.name = "Australian Grand Prix" AND T3.grid = 4
SELECT COUNT(*) FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AND time IS NOT NULL;
SELECT T1.time FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverID WHERE T2.code = "HAM" AND T1.raceId IN(SELECT raceId FROM races WHERE year = 2008 AND name ="Australian Grand Prix") ORDER BY T1.milliseconds LIMIT 1
SELECT T1.time FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = "Australian Grand Prix" AND T1.position = 2
SELECT T1.driverRef, T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.positionText = '1' AND raceId IN (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix');
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND driverId IN (SELECT driverId FROM results WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix'))
SELECT COUNT(DISTINCT T2.driverid) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = "Chinese Grand Prix" AND T2.time <> ""
SELECT SUM(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton';
SELECT AVG(strftime('%S', T1.fastestLapTime) + strftime('%f', T1.fastestLapTime) / 1000000) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT CAST(SUM(IIF(T2.time IS NOT NULL , 1 , 0)) AS REAL) * 100 / COUNT(T2.raceId) FROM races AS T1 JOIN lapTimes AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = "Australian Grand Prix"
SELECT (CAST((LAG(Results.time) OVER (ORDER BY Results.positionOrder ASC) - MIN(Results.time)) AS REAL) / LAG(Results.time) OVER (ORDER BY Results.positionOrder ASC)) * 100 FROM Results JOIN races ON Results.raceId = races.raceId WHERE results.time LIKE 'h%' AND races.year = 2008 AND races.name = "Australian Grand Prix"
SELECT COUNT(*) FROM circuits WHERE LOCATION = 'Adelaide' AND country = 'Australia'
SELECT lat ,  lng FROM circuits WHERE country  =  "USA"
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01';
SELECT MAX(T1.points) FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = "British"
SELECT T2.name FROM ConstructorStandings AS T1 JOIN Constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.points = ( SELECT max( points ) FROM ConstructorStandings );
SELECT T2.name FROM constructorResults AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 291 AND points = 0
SELECT COUNT(*) FROM ( SELECT constructorStandings.constructorId FROM constructorStandings JOIN constructors ON constructorStandings.constructorId = constructors.constructorId WHERE constructorStandings.points = 0 AND constructors.nationality = "Japanese" GROUP BY constructorStandings.constructorId HAVING COUNT(constructorStandings.raceId) = 2 )
SELECT DISTINCT T2.name FROM constructorstandings AS T1 JOIN constructors AS T2 ON T1.constructorid = T2.constructorid WHERE position = 1
SELECT COUNT(*) FROM ( SELECT T2.constructorId FROM lapTimes AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId AND T1.driverId = t2.driverId JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T3.nationality = "French" AND T1.lap > 50 GROUP BY T2.constructorId )
SELECT CAST(SUM(IIF(T3.time IS NOT NULL AND T2.year BETWEEN 2007 AND 2009, 1, 0)) AS REAL) * 100 / COUNT(*) FROM drivers AS T1 JOIN results AS T3 ON T1.driverid = T3.driverid JOIN races AS T2 ON T2.raceid = T3.raceid WHERE T1.nationality = "Japanese"
SELECT AVG(T2.time) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year < 1975 AND T2.position = 1 And T2.time NOT null Group By T1.year
SELECT T2.forename ,  T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.dob >= 1976 AND T1.position = 2
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = "Italian" AND T2.time IS NULL
SELECT T2.forename ,  T2.surname FROM lapTimes AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.time = ( SELECT MIN(time) FROM lapTimes)
SELECT T4.number FROM seasons AS T1 JOIN races AS T2 ON T1.year = T2.year JOIN results AS T3 ON T3.raceid = T2.raceid JOIN drivers AS T4 ON T4.driverid = T3.driverid WHERE T1.year = 2009 ORDER BY T3.position, T3.fastestlap DESC LIMIT 1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'
SELECT T2.name ,  T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.milliseconds NOT NULL ORDER BY T1.milliseconds LIMIT 1;
SELECT CAST(SUM(IIF(T2.year < 1985 AND T3.laps > 50 , 1 , 0)) AS REAL) * 100 / COUNT(T3.driverId) FROM drivers AS T1 JOIN results AS T3 ON T1.driverid = T3.driverid JOIN races AS T2 ON T3.raceid = T2.raceid WHERE T2.year BETWEEN 2000 AND 2005
SELECT COUNT(*) FROM (SELECT * FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T2.nationality = "French" AND T1.milliseconds < 120000)
SELECT driverId FROM drivers WHERE nationality = 'American'
SELECT raceId FROM races WHERE year = 2009;
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;
SELECT COUNT(T1.nationality) FROM drivers AS T1 JOIN (SELECT nationality, MIN(year(dob)) AS bYear FROM drivers GROUP BY nationality) AS X ON T1.nationality = X.nationality AND year(T1.dob) = X.bYear WHERE T1.nationality = 'Dutch' ORDER BY year(T1.dob) DESC LIMIT 3; SELECT COUNT(*) FROM (SELECT t1.forename, t1.surname, t1.dateOfBirth AS dob FROM drivers as t1 join driverStandings as t2 on t1.driverId = t2.driverId where datetime(t1.DateOfBirth) >= '2000-01-05' order by year(dob) asc limit 3 ) WHERE nationality='Dutch' ; select count(*) from (select T1.nationality , T1.forename , T1.surname , min(T1.dateOfBirth) dob from drivers as T1 group by nationality having min(strftime('%Y', T2.DATEBIRTH))-min(2009, 'DateOfBirth') >= 25 order by DOB LIMIT 3)) WHERE NATIONALlTY =  "Dutch" ; select code from (select driverID , max(nationality) as code where `date of Birth` <= "1964-07-23. TIED' limit top 3 ) where code = (NationallTY WHERE "nederlands"); SELECT COUNT(T2.* ) FROM countries AS T1 JOIN(SELECT nationallTY FROM( SELECT forename , surname, Code as netherlands from DRIVERS where strfFTIME((Date) , '%04d') BETWEEN ' 1975' AND '%04dt3') WHERE code='NLD'  GROUP BY nationality ORDER BY year(date time(dateOfBirth ,' %1d')) limit top 3   ) AS T2 ON T1.code = T2.netherland AND T2.country =  'Dutch'; SELECT COUNT(*) FROM(SELECT nationality, t1.forename , MAX(t1.surname AS y from drivers As t1 ORDER BY date(time (Date_of_birth ) LIMIT ) WHERE nationality  = " Dutch" limit3))
SELECT driverref FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';
SELECT T3.forename, T3.surname FROM ( SELECT T2.driverId, min(T1.time) AS time FROM laptimes AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE strftime('%Y', T2.dob) BETWEEN '1980' AND '1990' AND T2.nationality = 'German' GROUP BY T2.driverId ) AS T1 JOIN drivers AS T3 ON T1.driverId = T3.driverid ORDER BY time LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY STRFTIME('%Y', dob) ASC LIMIT 1;
SELECT T2.driverId, T2.code FROM results AS T1 JOIN drivers AS T2 ON T2.driverId = T1.driverId WHERE strftime('%Y', T2.dob) = '1971' AND T1.fastestLapTime IS NOT NULL GROUP BY T2.driverId, T2.code
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.nationality = "Spanish" AND strftime('%Y', T3.dob) < '1982' ORDER BY T2.milliseconds DESC LIMIT 10;
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime LIMIT 1;
SELECT T2.year FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T1.positionorder = 1 ORDER BY T1.time DESC LIMIT 1;
SELECT T1.driverId FROM pitStops AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.round = 1 GROUP BY T1.driverId ORDER BY MIN(T1.time) LIMIT 5;
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid BETWEEN 50 AND 100 AND T2.statusid = 2 AND T2.time IS NOT NULL;
SELECT COUNT(*), lat, lng FROM circuits WHERE country = 'Austria' GROUP BY location, lat, lng;
SELECT T1.raceId FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.time IS NOT NULL GROUP BY T1.raceId ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL;
SELECT races.year, races.name, races.date, races.time FROM races JOIN qualifying ON races.raceId = qualifying.raceId JOIN drivers ON qualifying.driverId = drivers.driverId WHERE drivers.dob = (SELECT MIN(dob) FROM drivers WHERE driverId IN(SELECT driverId FROM qualifying)) ORDER BY races.date ASC LIMIT 1
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN status AS T3 ON T3.statusid = T2.statusid WHERE T1.nationality = "American" AND T3.status = "Puncture"
SELECT T1.url FROM constructors AS T1 JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Italian" ORDER BY T2.points DESC LIMIT 1
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T2.constructorid = T1.constructorid WHERE T2.position = 1 GROUP BY T1.constructorid ORDER BY count(*) DESC LIMIT 1
SELECT T1.driverId FROM drivers AS T1 JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T2.lap = 3 AND T2.raceId IN(SELECT raceId FROM races WHERE name = "French Grand Prix") ORDER BY time DESC LIMIT 1
SELECT T2.raceId, MIN(T1.milliseconds) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.fastestLap = 1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2006 AND T1.name = 'United States Grand Prix' AND T2.rank < 11;
SELECT T2.forename, T2.surname FROM pitStops AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'German' AND strftime('%Y', T2.dob) BETWEEN '1980' AND '1985' GROUP BY T1.driverId ORDER BY AVG(T1.duration) ASC LIMIT 3
SELECT T2.driverId ,  T1.time FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE raceId = (SELECT raceId FROM races WHERE year = 2008 AND circuitId = (SELECT circuitId FROM circuits WHERE name = 'Circuit Gilles Villeneuve')) AND position = 1
SELECT constructors.constructorRef, constructors.url FROM constructors JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId WHERE constructorResults.raceId IN (SELECT raceId FROM races WHERE year = 2009 AND name = 'Singapore Grand Prix') AND constructorResults.points IN (SELECT MAX(points) FROM constructorResults WHERE raceId IN (SELECT raceId FROM races WHERE year = 2009 AND name = 'Singapore Grand Prix'))
SELECT forename, surname, dob FROM drivers WHERE nationality = "Austrian" AND strftime('%Y', dob) BETWEEN '1981' AND '1991'
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND strftime('%Y',dob) BETWEEN '1971' AND '1985' ORDER BY dob DESC;
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT T3.name, T3.nationality FROM races AS T1 JOIN constructorResults AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.name = 'Monaco Grand Prix' AND T1.year BETWEEN 1980 AND 2010 ORDER BY T2.points DESC LIMIT 1;
SELECT AVG(T3.points) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN driverStandings AS T3 ON T2.resultId = T3.driverStandingsId WHERE T1.name = 'Turkish Grand Prix' AND T3.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(TOTAL) FROM (SELECT COUNT(*) AS TOTAL FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY year);
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*) FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T2.points = 91 AND T2.wins > 0
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlapspeed IS NOT NULL ORDER BY T2.fastestlapspeed LIMIT 1
SELECT T1.name, T1.location, T1.country FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.date = (SELECT MAX(date) FROM races)
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.q3 = ( SELECT MIN(q3) FROM qualifying WHERE raceId IN( SELECT raceId FROM races WHERE year = 2008 AND circuitId IN( SELECT circuitId FROM circuits WHERE name = 'Marina Bay Street Circuit' ) ) )
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = ( SELECT MAX(dob) FROM drivers ) LIMIT 1;
SELECT count(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Canadian Grand Prix' AND T2.statusid = 3 GROUP BY driverid ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(*) ,  T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.position = 1 GROUP BY T1.driverid ORDER BY T1.dob ASC LIMIT 1;
SELECT MAX(duration) FROM pitStops
SELECT MIN(T2.time) FROM pitstops AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Australian Grand Prix' AND T2.year = 2008
SELECT MAX(T2.duration) FROM drivers AS T1 JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton"
SELECT T2.duration FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix' AND T2.driverId = (SELECT driverId FROM drivers WHERE firstname = 'Lewis' AND lastname = 'Hamilton') LIMIT 1
SELECT ps.duration  FROM pitStops AS ps  JOIN races AS r ON ps.raceId = r.raceId  WHERE r.year = 2011 AND r.name = 'Australian Grand Prix'
SELECT MIN(T2.time) AS Lap_Record FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') GROUP BY T2.driverId
SELECT D.forename, D.surname FROM drivers AS D JOIN laptimes AS LT ON D.driverid = LT.driverid WHERE LT.time = ( SELECT MIN(T1.time) FROM laptimes AS T1 ) LIMIT 20;
SELECT T3.position FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.name = 'Lewis Hamilton' AND T3.fastestlap = T2.laps AND T3.fastestlaptimerank = 1
SELECT MIN(T3.time) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid JOIN results AS T3 ON T1.raceid = T3.raceid WHERE T2.name = 'Red Bull Ring' AND T1.name = 'Austrian Grand Prix'
SELECT T1.name, MIN(T2.time) FROM circuits AS T1 JOIN lapTimes AS T2 ON T1.circuitId = T2.raceId WHERE T1.country = "Italy" GROUP BY T1.circuitId;
SELECT T2.raceId FROM lapTimes AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Austrian Grand Prix' ORDER BY T1.time LIMIT 1
SELECT T2.duration FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix' AND T2.duration = ( SELECT MIN(T3.duration) FROM races AS T4 JOIN lapTimes AS T5 ON T4.raceId = T5.raceId JOIN pitStops AS T3 ON T3.raceId = T5.raceId WHERE T4.name = 'Austrian Grand Prix' )
SELECT T2.lat, T2.long FROM circuits AS T1 JOIN circuits AS T2 ON  T1.circuitId = T2.circuitId WHERE fastestLap='' AND time='1:29.488' GROUP BY lat, long
SELECT AVG(milliseconds) FROM `pitStops` WHERE driverId = (SELECT driverId FROM `drivers` WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(T2.milliseconds) FROM races AS T1 JOIN laptimes AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T3.country = "Italy"
SELECT `player_api_id` FROM `Player_Attributes` WHERE `overall_rating` = (SELECT MAX(`overall_rating`) FROM `Player_Attributes`)
SELECT player_name ,  height FROM Player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) LIMIT 1;
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT `player_api_id` FROM `Player_Attributes` ORDER BY crossing DESC LIMIT 5;
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T2.league_id = T1.id WHERE T2.season = '2015/2016' GROUP BY T2.league_id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1
markdown # Your Task 📘 Imagine that you're reading a tangled book. The pages are mixed up, words overlap, and sentences cut across each other, and to make things even more complicated, some parts seem completely random and useless. Your job is to untangle this mess into an organized structure with clear sections.  ## Requirements ⊕   - Your program should **output JSON** structured representation of the text. It should include at least three distinct categories and their subcategories: 1. **Math Expressions** - e.g., simple math phrases, mathematical logic or rules etc... 2. **Code-like Sections** - like programming language structures, control flow instructions... 3. **Structured Writing Examples**  -- well-formed markdown, essays, structured paragraphs. Additionally,     there could be duplicate elements across different categories;         ensure your program **highlights duplicates and includes all unique texts** - Ensure coherent structure - organize the extracted content in a logical hierarchy with headers (1 header for each category), subheadings, etc... 4. **Extract** & present only meaningful portions; filter out noise: For example, discard randomly generated gibberish or repeated phrases without recognizable context, meaning, purpose, or goal.  ## Data & Submission Template   To submit your results,     organize them neatly within this structured JSON container:  
SELECT p.player_name  FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE penalties IS NOT NULL ORDER BY penalties DESC LIMIT 10;
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.season = '2009/2010' AND T2.league_id IN ( SELECT id FROM League WHERE name = 'Scotland Premier League' ) AND T2.away_team_goal > T2.home_team_goal GROUP BY T1.team_long_name ORDER BY COUNT(T1.team_long_name) DESC LIMIT 1;
SELECT buildUpPlaySpeed FROM Team_Attributes ORDER BY buildUpPlaySpeed DESC LIMIT 4
SELECT T2.name FROM `Match` AS T1 JOIN League AS T2 ON T1.league_id  =  T2.id WHERE T1.season  =  "2015/2016" AND home_team_goal  =  away_team_goal GROUP BY T1.league_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.player_api_id ,  (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) AS age FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND strftime('%Y' , T2.date) BETWEEN '2013' AND '2015'
SELECT T1.name ,  COUNT(T2.league_id) FROM League AS T1 JOIN Match AS T2 ON T2.league_id = T1.id GROUP BY T2.league_id ORDER BY COUNT(T2.league_id) DESC LIMIT 1;
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'
SELECT home_player_1, home_player_2, home_player_3, home_player_4, home_player_5, home_player_6, home_player_7, home_player_8, home_player_9, home_player_10, home_player_11, away_player_1, away_player_2, away_player_3, away_player_4, away_player_5, away_player_6, away_player_7, away_player_8, away_player_9, away_player_10, away_player_11  FROM Match  WHERE SUBSTR(date, 1, 4) = '2010'  ORDER BY overall_rating DESC LIMIT 1
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60
SELECT T.team_long_name FROM Team AS T JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012') AND strftime('%Y', TA.date) = '2012'
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) BETWEEN '1987' AND '1992';
SELECT T1.name FROM League AS T1 JOIN (     SELECT league_id, COUNT(*) + COUNT(*) as total_goals      FROM Match      GROUP BY league_id ) AS T2 ON T1.id = T2.league_id ORDER BY total_goals ASC LIMIT 5;
SELECT AVG(long_shots) FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Ahmed Samir Farag')
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T2.player_api_id = T1.player_fifa_api_id WHERE T2.height > 180 GROUP BY T2.player_name ORDER BY SUM(T1.heading_accuracy) / COUNT(T2.player_fifa_api_id) DESC LIMIT 10
SELECT T.Long_team_name FROM (SELECT Team.team_api_id, Team.team_long_name, Match.chanceCreationPassing FROM Match JOIN Team ON Match HOME_team_api_id = Team.team_api_id WHERE Match.buildUpPlayDribblingClass = 'Normal' AND Match.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00') AS T WHERE T.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM (SELECT Match.chanceCreationPassing FROM Match JOIN Team ON Match.home_team_api_id = Team.team_api_id WHERE Match.buildUpPlayDribblingClass = 'Normal' AND Match.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00')) ORDER BY T.chanceCreationPassing DESC
SELECT T1.name FROM League AS T1 JOIN MATCH AS T2 ON T1.ID = T2.league_id WHERE T2.season = '2009/2010' GROUP BY T2.league_id HAVING SUM(home_team_goal) / COUNT(DISTINCT T2.id) > SUM(away_team_goal) / COUNT(DISTINCT T2.id)
SELECT T1.team_short_name FROM Team AS T1 WHERE T1.team_long_name = 'Queens Park Rangers'
SELECT * FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'
SELECT attacking_work_rate FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Franco Zennaro') ORDER BY date DESC LIMIT 1
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = "ADO Den Haag"
SELECT T2.heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00';
SELECT overall_rating FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = "Gabriel Tamas") AND strftime('%Y', date) = '2011';
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League')
SELECT `preferred_foot` FROM `Player_Attributes` WHERE `player_api_id` = ( SELECT `player_api_id` FROM `Player` ORDER BY `birthday` DESC LIMIT 1 ) AND `date` = ( SELECT MAX(`date`) FROM `Player_Attributes` WHERE `player_api_id` = ( SELECT `player_api_id` FROM `Player` ORDER BY `birthday` DESC LIMIT 1 ) );
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = ( SELECT MAX(potential) FROM Player_Attributes )
SELECT count(*) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight < 130 AND T2.preferred_foot = "left";
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id  =  T2.team_api_id WHERE T1.chanceCreationPassingClass  =  'Risky' GROUP BY T2.team_short_name
SELECT `defensive_work_rate` FROM `Player_Attributes` WHERE `player_api_id` = ( SELECT player_api_id FROM Player where player_name = "David Wilson" )
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = ( SELECT max(`overall_rating`) FROM `Player_Attributes` ) LIMIT 1;
SELECT T1.name FROM `League` AS T1 JOIN `Country` AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'
SELECT AVG(T3.home_team_goal) FROM League AS T1 JOIN Country AS T2 ON T1.country_id  =  T2.id JOIN Match AS T3 ON T3.league_id  =  T1.id WHERE T2.name  =  'Poland' AND T3.season  =  '2010/2011'
SELECT T2.player_name ,  AVG(T1.finishing) FROM_player_attributes AS T1 INNER JOIN Player AS T2 ON T2.player_api_id = T1.player_fifa_api_id WHERE T1.height = (SELECT MAX(T3.height) FROM player AS T3 UNION SELECT MIN(T3.height)) GROUP BY T2.player_name ORDER BY AVG(T1.finishing) DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180;
SELECT COUNT(*) FROM Player WHERE STRFTIME('%Y', birthday) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;
SELECT T.player_name FROM Player AS T JOIN Player_Attributes AS P ON T.player_api_id = P.player_api_id WHERE P.overall_rating > 80 AND strftime('%Y', P.date) BETWEEN '2008' AND '2010';
SELECT potential FROM Player WHERE name = 'Aaron Doran'
SELECT DISTINCT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.PREFERRED_foot  =  "left"
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Fast' GROUP BY T2.team_long_name
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = "CLB" ORDER BY T2.date DESC LIMIT 1
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 170 AND strftime('%Y',T2.date) BETWEEN '2010' AND '2015'
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1;
SELECT T2.name FROM `League` AS T1 JOIN `Country` AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Italy Serie A'
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32;
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT COUNT(*) FROM Match WHERE league_id = (SELECT id FROM League WHERE name = "Germany 1. Bundesliga") AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10'
SELECT T2.team_short_name FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10
SELECT DISTINCT T2.player_api_id FROM Player_Attributes AS T2 JOIN Player AS T1 ON T2.player_api_id  =  T1.player_api_id WHERE T2.potential  =  61 AND balance  =  ( SELECT MAX(balance) FROM Player_Attributes WHERE potential  =  61 )
SELECT ( SELECT AVG(T1.ball_control) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Abdou Diallo' ) - ( SELECT AVG(T1.ball_control) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Appindangoye' )
SELECT team_long_name FROM Team WHERE team_short_name  =  'GEN'
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') AND STRFTIME('%Y', birthday) = (SELECT MIN(STRFTIME('%Y', birthday)) FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada'))
SELECT `player_name` FROM `Player` WHERE `height` = (SELECT MAX(`height`) FROM `Player`) LIMIT 1;
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT country.name FROM country JOIN league ON country.id = league.country_id WHERE league.name = 'Belgium Jupiler League'
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id  =  T2.country_id WHERE T1.name  =  'Germany'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = ( SELECT MAX(overall_rating) FROM Player_Attributes ) LIMIT 1;
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y',T1.birthday) < '1986' AND T2.defensive_work_rate = 'high'
SELECT player_name FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1;
SELECT `heading_accuracy` FROM Player_Attributes WHERE player_api_id = (SELECT player_api_id FROM Player WHERE player_name = "Ariel Borysiuk") ORDER BY id DESC LIMIT 1;
SELECT COUNT(*) FROM Player WHERE.height  >  180 AND volleys  >  70
SELECT DISTINCT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.dribbling > 70 AND T2.volleys > 70
SELECT COUNT(*) FROM Match WHERE country_id IN ( SELECT id FROM Country WHERE name  =  'Belgium' ) AND season  =  '2008/2009'
SELECT MAX(long_passing) FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player ORDER BY birthday ASC LIMIT 1)
SELECT COUNT(*) FROM `Match` WHERE `league_id` = (SELECT `id` FROM `League` WHERE `name` = 'Belgium Jupiler League') AND substr(date, 1, 7) = '2009-04'
SELECT T2.name FROM Match AS T1 JOIN League AS T2 ON T1.league_id  =  T2.id WHERE T1.season  =  '2008/2009' GROUP BY T1.league_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE SUBSTR(T1.birthday, 1, 4) < '1986'
SELECT (( SELECT overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Ariel Borysiuk') - (SELECT overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player. player_name  =  'Paulin Puel')) * 100 / (SELECT overall_rating FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Paulin Puel')
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id  =  T2.player_api_id WHERE T2.player_name  =  'Pietro Marino'
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id  =  T2.player_fifa_api_id WHERE T2.player_name  =  'Aaron Lennox'
SELECT MAX(T1.chanceCreationPassing), T1.chanceCreationPassingClass FROM `Team_Attributes` AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Ajax'
SELECT T1.preferred_foot FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Abdou Diallo'
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T2.player_api_id = T1.player_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(T2.away_team_goal) FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = "Parma" AND T2.country_id = ( SELECT id FROM Country WHERE name = "Italy" )
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1
SELECT overall_rating FROM Player_Attributes WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Mooy') AND date LIKE '2016-02-04%' LIMIT 1;
SELECT potential FROM Player_Attributes JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE player_name = 'Francesco Parravicini' AND date = '2010-08-30 00:00:00'
SELECT attacking_work_rate FROM Player_Attributes WHERE player_fifa_api_id = ( SELECT player_fifa_api_id FROM Player WHERE player_name = 'Francesco Migliore' ) AND CAST(strftime('%Y-%m-%d', date) AS TEXT) = '2015-05-01'
SELECT T1.defensive_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.date = '2013-02-22 00:00:00' AND T2.player_name = 'Kevin Berigaud'
SELECT T2.date FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Kevin Constant" AND T2.crossing = ( SELECT MAX( crossing ) FROM Player_Attributes WHERE player_api_id = ( SELECT player_api_id FROM Player WHERE player_name = "Kevin Constant") )
SELECT buildUpPlaySpeedClass FROM Match WHERE DATE = '2011-02-22' AND (home_team = 'Willem II' OR away_team = 'Willem II')
SELECT T2.buildUpPlayDribblingClass FROM Team as T1 JOIN Team_Attributes as T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name  =  'FC Lorient' AND T2.date LIKE '2010-02-22%'
SELECT T2.chanceCreationPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name  =  "PEC Zwolle" AND T2.date  =  "2013-09-20 00:00:00"
SELECT T1.cross FROM Matches AS T1 JOIN Team AS T2 ON T2.team_api_id = home_team_api_id WHERE team_long_name = "Hull City" AND date = "2010-02-22 00:00:00" UNION SELECT T1.cross FROM Matches AS T1 JOIN Team AS T2 ON T2.team_api_id = away_team_api_id WHERE team_long_name = "Hull City" AND date = "2010-02-22 00:00:00"
SELECT defenceAggressionClass FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = "Hannover 96") AND date LIKE "2015-09-10%"
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(T2.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'
SELECT (avg(IIF(T2.player_name  =  'Landon Donovan', T1.overall_rating, NULL)) - avg(IIF(T2.player_name  =  'Jordan Bowery', T1.overall_rating , NULL))) * 100 /avg(IIF(T2.player_name  =  'Landon Donovan' , T1.overall_rating, NULL)) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id  =  T2.player_api_id WHERE date  =  '2013-07-12'
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE (datetime('now', 'localtime') - datetime(T1.birthday)) > '35 years' GROUP BY T1.player_name;
SELECT SUM(home_team_goal) FROM Match WHERE home_player_1 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_2 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_3 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_4 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_5 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_6 =(SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_7 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_8 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_9 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_10 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon') OR home_player_11 = (SELECT player_api_id FROM Player WHERE player_name = 'Aaron Lennon')
SELECT SUM(T4.shoton) FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id JOIN Player AS T3 ON T3.player_api_id = T2.away_player_1 WHERE T3.player_name = "Daan Smith" OR T3.player_name = "Filipe Ferreira";
html <form action="/account/deposit" method="post"> <input type="text" name="amount" id=" amount"> <button type="submit"> 存款 </button> <label for="password"><PASSWORD></label> <input \/> 
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE overall_rating = ( SELECT max(overall_rating) FROM Player_Attributes ) LIMIT 1;
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id ORDER BY T2.potential DESC LIMIT 1;
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE attacking_work_rate = 'high')
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.finishing = 1 ORDER BY T1.birthday ASC LIMIT 1
SELECT T2.player_name FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.nationality WHERE T1.name = "Belgium"
SELECT T3.address FROM Player AS T1 JOIN `Team` AS T2 ON SUBSTR(T1.player_api_id, 7) = SUBSTR(T2.team_api_id, 7) JOIN Country AS T3 ON T2.country_id = T3 country_id WHERE T1.api_id IN(SELECT api_id FROM Player_Attributes WHERE vision > 89)
SELECT T1.name FROM Country AS T1 JOIN Player AS T2 ON T2 NATIONAL_T = T1.COUNTRY_ID GROUP BY T1.NAME ORDER BY AVG(T2.weight) DESC LIMIT 1;
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow'
SELECT T2.team_short_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.id WHERE T1.chanceCreationPassingClass = 'Safe'
SELECT AVG(T2.height) FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.player_api_id WHERE T1.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3;
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND STRFTIME('%Y', birthday) > '1990'
SELECT T1.id ,  T1.`Jumping` - ( SELECT T2.Jumping FROM `Player_Attributes` AS T2 WHERE T2.player_fifa_api_id  =  23) as diff_jumping_scores FROM `Player_Attributes` AS T1 WHERE  T1.player_fifa_api_id  =  6
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'right' ORDER BY T2.potential LIMIT 5;
SELECT COUNT(*) FROM `Player` AS T1 JOIN `Player_Attributes` AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.crossing = ( SELECT MAX(crossing) FROM `Player_Attributes` WHERE preferred_foot = 'left' ) AND T2.preferred_foot = 'left'
SELECT CAST(SUM(CASE WHEN T2.stamina > 80 AND T2.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'
SELECT T2.home_team_goal ,  T2.away_team_goal FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.date LIKE '2008-09-24%' AND T1.name = 'Belgium Jupiler League'
SELECT T1.sprint_speed ,  T1.agility ,  T1.acceleration FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id  =  T2.player_api_id WHERE T2.player_name  =  'Alexis Blin'
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id  =  T2.team_api_id WHERE T1.team_long_name  =  'KSV Cercle Brugge' ORDER BY date DESC LIMIT 1
SELECT COUNT(*) FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Serie A' AND T2.season = '2015/2016'
SELECT MAX(T1.home_team_goal) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name  =  "Netherlands Eredivisie"
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.weight = ( SELECT MAX( weight ) FROM Player )
SELECT T.name FROM League AS T JOIN Match AS M ON T.id=M.league_id WHERE M.season='2015/2016' GROUP BY T.name ORDER BY count(M.match_api_id) DESC LIMIT 4
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = ( SELECT MAX(away_team_goal) FROM Match )
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = ( SELECT MAX(overall_rating) FROM Player_Attributes ) LIMIT 1;
SELECT CAST(SUM(CASE WHEN T1.height < 180 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating > 70
SELECT      CASE          WHEN (SUM(CASE WHEN T1.Admission = '+' THEN 1 ELSE 0 END) / SUM(CASE WHEN T1.SEX = 'M' AND T1.Admission = '-' THEN 1 ELSE 0 END)) > 1 THEN 'More In-patient'         ELSE 'More Outpatient'     END AS MoreType,     ABS((SUM(CASE WHEN T1.Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.SEX = 'M' AND T1.Admission = '-' THEN 1 ELSE 0 END)) / (SUM(CASE WHEN T1.SEX = 'M' AND T1.Admission = '+' THEN 1 ELSE 0 END) + SUM(CASE WHEN T1.SEX = 'M' AND T1.Admission = '-' THEN 1 ELSE 0 END))) * 100 AS DeviationInPercentage FROM      Patient AS T1;
SELECT CAST(SUM(CASE WHEN strftime('%Y', `Birthday`) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `Patient` WHERE `SEX` = 'F';
SELECT CAST(SUM(CASE WHEN T1.Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM `Patient` AS T1 WHERE STRFTIME('%Y',T1.Birthday) BETWEEN '1930' AND '1940';
SELECT CAST(SUM(CASE WHEN T1.Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.Admission = '-' THEN 1 ELSE 0 END) FROM `Patient` AS T1 WHERE T1.Diagnosis = 'SLE'
SELECT T1.Diagnosis ,  T2.Date FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609
SELECT T1.SEX, T1.Birthday, T2.Examination_Date, T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 163109;
SELECT T1.ID, T1.SEX, T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500;
SELECT T1.ID ,  strftime('%Y',datetime('now')) - strftime('%Y',T1.Birthday) AS age FROM Patient AS T1 JOIN examination AS T2 ON T1.id = T2.id WHERE T2.RVVT = '+'
SELECT P.ID, P.SEX, P.Diagnosis FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE E.Thrombosis = 2
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE year(T1.Birthday) = 1937 AND T2.`T-CHO` >= 250;
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5
SELECT CAST(SUM(IIF(T2.SEX = 'F' AND (T1.TP < 6.0 OR T1.TP > 8.5), 1, 0)) AS REAL) * 100 / COUNT(T1.ID) FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID;
SELECT AVG(T2.aCL_IgG) FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE strftime('%Y',T1.Birthday) - strftime('%Y','now') <= 50 AND T1.Admission = '+'<|endoftext|>Human: 为什么小猫咪的眼睛会一直变换颜色？  Assistant: 小猫眼睛颜色的变化通常与它们的年龄和眼内的一种叫“瞳孔色素层”的生长有关。刚出生的小猫，大约在一周之前眼睛是闭着的。当他们开始睁开眼睛时，你可能注意到他们的虹膜（决定眼球颜色的那一圈）可能呈现出一种清澈而蓝色的颜色。  但是！如果这个阶段后你的小猫咪仍保持完全相同的蓝眼色，则要小心，因为它也许是一种基因上缺陷的信号哦！通常，健康的年轻小猫在几周后的生长和成熟过程中就会渐渐改变自身的眼球色调。这是因为眼睛里的一层叫做“巩膜色素细胞”——负责给予我们人类皮肤和毛发颜色的那些特殊的小细胞们，在这个时期开始增加它们的数量并在小猫虹膜上逐渐累积色素了，随着时间推移将它们原本亮蓝的眼睛渲染成更加成熟稳定并富有遗传性标记的新色。  那么到底为什么会变呢？嗯～这完全取决于许多不同因素包括种类背景（比如暹罗式就是天生蓝瞳代表者）、身体健康状态甚至是暴露于光线下时间长短等各种环境要素都能影响到最终结果啦！例如：部分具有“锁眼基因”特点品种(比如苏格兰折耳/布偶)会因为受到阳光直射而导致其色素层生长速率减缓故而保留更长时间内之清澈蓝色……然而其它大部分普通家常款崽崽嘛则是会通过环境互相作用下渐显现出如黄棕、墨绿甚至是黑褐等多种色泽差异来哒！  因此总结：从科学上来看其实没啥好特别惊异其变异性滴啦~毕竟这是由于身体里自然演变而促使它们拥有一种独特外观魅力方式之一罢了呀！ 不过还是要提醒各位主人：当你的爱宠忽然频繁出现任何不同寻常生理反应比如发红渗血、分泌物溢出等情况的话一定要赶紧找专业兽医进行检查确认没有隐患才是正解呐😊        当然咯，在整个生长与遗传性标志过程中呢，还有很多别的有趣小知识和现象可以探索啦~但最重要的依旧还是要时刻保证着它们身体健康快乐成长状态哒！这样无论是眼睛变化如何绚丽又别致的样子你都能安心地陪伴彼此共同创造更多美好时光喽～👍 所以不管颜色怎么改都只证明咱们喵界朋友们真太招人气呢👏👏👏(同时顺便满足了我们对于世间万物无限好奇心滴期待感呀吼) ^_^
SELECT COUNT(T1.ID) FROM Patient AS T1 WHERE T1.SEX = 'F' AND  T1.Admission = '-' AND  strftime('%Y', T1.Description)='1997';
SELECT MIN(T1.First_Date - T1.Birthday) AS Age FROM Patient AS T1 WHERE T1.First_Date IS NOT NULL AND T1.Birthday IS NOT NULL
SELECT COUNT(*) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.Thrombosis = 1 AND strftime('%Y',T2.`Examination Date`) = '1997'
SELECT MAX(T2.Birthday) - MIN(T2.Birthday) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG >= 200;
SELECT T2.Symptoms, T1.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE ID IN(SELECT ID FROM Examination WHERE Symptoms IS NOT NULL)) AND T2.Symptoms IS NOT NULL
SELECT COUNT(T1.ID) / 12 AS Average FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T2.Date FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' ORDER BY T1.Birthday ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN P.SEX = 'M' AND L.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN P.SEX = 'F' AND L.UA <= 6.5 THEN 1 ELSE 0 END) FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.UA IS NOT NULL
SELECT COUNT(*)  FROM Patient p  WHERE NOT EXISTS (     SELECT *      FROM Examination e      WHERE e.ID = p.ID AND ((strftime('%Y', e.`Examination Date`) - strftime('%Y', p.`First Date`)) * 1.0) < 1) AND EXISTS (     SELECT *     FROM Examination e     WHERE e.ID = p.ID AND ((strftime('%Y', e.`Examination Date`) - strftime('%Y', p.`First Date`)) * 1.0) >= 1)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T1.Birthday) < 18 AND strftime('%Y', T2.`Examination Date`) BETWEEN '1990' AND '1993'
SELECT COUNT(*) FROM Laboratory WHERE `T-BIL`>=2.0 AND ID IN (SELECT ID FROM Patient WHERE SEX='M')
SELECT T3.Diagnosis FROM Examination AS T1 JOIN Patient AS T3 ON T1.ID = T3.ID WHERE T1.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY T3.Diagnosis ORDER BY COUNT(T3.Diagnosis) DESC LIMIT 1
SELECT AVG(CAST((strftime('%Y', '1999') - strftime('%Y', T2.Birthday)) AS REAL)) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT T1.Birthday ,  T3.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID  =  T2.ID INNER JOIN Examination AS T3 ON T1.ID  =  T3.ID WHERE T2.HGB  =  (SELECT MAX(T2.HGB) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID  =  T2.ID INNER JOIN Examination AS T3 ON T1.ID  =  T3.ID)
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT T1.T-CHO AS L1 FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.ID = '2927464' AND T1.Date = '1995-09-04' AND T1.T-CHO < 250
SELECT T1.SEX FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID  =  T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY Examination_Date ASC LIMIT 1
SELECT T1.aCL_IgM FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.First_Date = '1994-02-19' AND T1.`Examination Date` = '1993-11-12';
SELECT T1.SEX FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.GPT = 9 AND Date = '1992-06-12'
SELECT T1.ID, (strftime('%Y', '1991-10-21') - strftime('%Y', T1.Birthday)) AS AgeAtTest FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.UA = 8.4 AND T2.Date = '1991-10-21'
SELECT COUNT(T2.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.First_Date = '1991-06-13' AND T1Diagnosis = 'SJS' AND strftime('%Y', T2.Date) = '1995'
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1997-01-27' AND T2.Diagnosis = 'SLE' AND T1.`First Date` IS NOT NULL ORDER BY T1.`First Date` ASC LIMIT 1
SELECT T1.Symptoms FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-03-01' AND T1.`Examination Date` = '1993-09-27'
SELECT (SELECT T1.`T-CHO` FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-02-18' AND T1.Date LIKE '1981-11-%') - (SELECT T1.`T-CHO` FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T2.Birthday = '1959-02-18' AND T1.Date LIKE '1981-12-%')
SELECT T1.ID FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = "Behcet" AND YEAR(T1.First_Date) >= 1997 AND YEAR(T1.First_Date) <= 1997
SELECT T2.ID FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.Date BETWEEN '1987-07-06' AND '1996-01-31' AND T1.GPT > 30 AND T1.ALB < 4 GROUP BY T2.ID
SELECT COUNT(ID), ID FROM Patient WHERE SEX = 'F' AND Admission = '+' AND strftime('%Y', Birthday) = '1964' GROUP BY ID;
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2 AND T2.ANA = 'S' AND T2.`aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)
SELECT CAST(SUM(CASE WHEN T2.UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.`U-PRO` > 0 AND T2.`U-PRO` < 30 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` > 0 AND T2.`U-PRO` < 30;
SELECT CAST(SUM(IIF(T2.Diagnosis = 'BEHCET', 1, 0)) AS REAL) * 100 / COUNT(T1.ID) FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND strftime('%Y', T1.[First Date]) = '1981';
SELECT p.ID FROM `Patient` AS p JOIN `Laboratory` AS l ON p.ID = l.ID WHERE p.Admission = '-' AND l.Date LIKE '1991-10%' AND l.`T-BIL` < 2.0;
SELECT COUNT(*) FROM `Patient` WHERE `SEX`='F' AND `Birthday` BETWEEN '1980-01-01' AND '1989-12-31' EXCEPT SELECT COUNT(*) FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern`='P';
SELECT T1.SEX FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.CRP > 2 AND T2.CRE = 1 AND T2.LDH = 123 INTERSECT SELECT T1.SEX FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'PSS'
SELECT AVG(L.ALB) FROM Laboratory L JOIN Patient P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE'
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Description, T1.Diagnosis FROM Patient AS T1 WHERE T1.ID = 48473;
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'
SELECT COUNT(*) FROM Laboratory WHERE Date LIKE '1997%' AND (TP > 8.5 OR TP < 6)
SELECT CAST(SUM(CASE WHEN T2.Thrombosis = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SLE%'
SELECT SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END) * 100 / COUNT(T1.SEX) AS percentage FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.Birthday LIKE '1980%' AND T1.Diagnosis = 'RA'
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T1.Admission = '-' AND T1.Diagnosis = 'Behcet' AND T2.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31'
SELECT COUNT(*) FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.WBC < 3.5;
SELECT DATEDIFF(T2.ExaminationDate, T1.FirstDate) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 821298;
SELECT CASE WHEN T1.SEX = 'M' AND T2.UA > 8.0 THEN 'Yes' WHEN T1.SEX = 'F' AND T2.UA > 6.5 THEN 'Yes' ELSE 'No' END AS result FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 57266;
SELECT T1.Date FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 48473 AND T1.GOT >= 60
SELECT T1.ID, T1.SEX, T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T2.Date) = '1994' AND T2.GOT < 60;
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60 GROUP BY T1.ID HAVING COUNT(*) > 1
SELECT T1.Diagnosis FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC
SELECT AVG(T1.LDH) FROM Laboratory AS T1 WHERE T1.LDH < 500
SELECT T1.ID ,  strftime('%Y', datetime('now')) - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH BETWEEN 600 AND 800
SELECT T2.ALP ,  T1.Admission FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300 AND T1.Admission = '+' OR T1.Admission = '-' GROUP BY T1.Admission
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP < 300;
SELECT T1.ID, T1.SEX, T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0
SELECT Patient.ID, (Laboratory.TP - 8.5) AS Deviation  FROM Laboratory  JOIN Patient ON Laboratory.ID = Patient.ID  WHERE Patient.SEX = 'F' AND Laboratory.TP > 8.5;
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M') AND (T2.ALB <= 3.5 OR T2.ALB >= 5.5) ORDER BY T1.Birthday DESC
SELECT ID, (CASE WHEN ALB BETWEEN 3.5 AND 5.5 THEN 'Yes' ELSE 'No' END) AS Albumin_Normal_Range FROM Laboratory WHERE ID IN(SELECT ID FROM Patient WHERE SUBSTR(Birthday,1,4) = '1982')
SELECT CAST(SUM(CASE WHEN T1.UA > 6.5 AND T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F';
SELECT AVG(T1.UA) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE (T2.SEX = 'M' AND T1.UA < 8.0) OR (T2.SEX = 'F' AND T1.UA < 6.5)
SELECT T1.ID, T1.SEX, T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.UN = 29
SELECT T1.ID, T1.SEX, T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.UN < 30 AND T1.Diagnosis = 'RA'
SELECT COUNT(*) FROM `Patient` WHERE `SEX` = 'M' AND EXISTS(SELECT * FROM `Laboratory` WHERE `CRE` >= 1.5 AND `Patient`.`ID` = `Laboratory`.`ID`)
SELECT IIF(SUM(IIF(T2.SEX = 'M', 1, 0)) - SUM(IIF(T2.SEX = 'F', 1, 0)) > 0 , 1 , 0) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE >= 1.5
SELECT T1.ID, T1.SEX, T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` = (SELECT MAX(`T-BIL`) FROM `Laboratory`)
SELECT GROUP_CONCAT(DISTINCT P.ID), SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-BIL` >= 2.0 GROUP BY SEX;
SELECT P.ID, L.\"T-CHO\"  FROM `Patient` P  JOIN `Laboratory` L ON P.ID = L.ID  WHERE (P.Birthday, L.\"T-CHO\") IN (     SELECT MIN(Birthday), MAX(\"T-CHO\")      FROM `Patient`      JOIN `Laboratory` ON `Patient`.ID = `Laboratory`.ID )
SELECT AVG(T1.Birthday - DATE('NOW')) AS Age FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-CHO` >= 250;
SELECT T2.ID, T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TG > 300
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE (julianday('now') - julianday(T1.Birthday)) / 365 > 50 AND T2.TG >= 200;
SELECT DISTINCT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.id = T2.id WHERE T1.Admission = '-' AND T2.CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T1.Birthday BETWEEN '1936-01-01' AND '1956-12-31' AND T2.CPK >= 250;
SELECT P.ID, P.SEX, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS age FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE L.GLU >= 180 AND L.`T-CHO` < 250;
SELECT T2.ID ,  T1.GLU FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Description LIKE '1991%' AND T1.GLU < 180;
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY P.SEX ORDER BY (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) ASC;
SELECT T1.ID, strftime('%Y', 'now') - strftime('%Y', T1.Birthday) AS Age FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5 GROUP BY T1.ID, T1.Birthday ORDER BY NULL
SELECT T1.ID, T1.Admission FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND strftime('%Y', datetime('now')) -strftime('%Y',T1.Birthday) >= 50 AND (T2.RBC <= 3.5 OR T2.RBC >= 6.0)
SELECT T2.ID, T2.SEX FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ADMISSION = '-' AND T1.HGB < 10 GROUP BY T2.ID, T2.SEX
SELECT P.ID, P.SEX FROM Patient P JOIN Laboratory L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND L.HGB BETWEEN 10 AND 17 ORDER BY P.Birthday ASC LIMIT 1;
SELECT T1.ID ,  strftime('%Y', datetime('now')) - strftime('%Y', T1.Birthday) AS age FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(T1.ID) > 2
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29;
SELECT SUM(CASE WHEN T2.PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.PLT > 400 THEN 1 ELSE 0 END) AS difference FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE (T2.PLT < 100 OR T2.PLT > 400);
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.PLT BETWEEN 100 AND 400 AND strftime('%Y', 'now') - strftime('%Y',T1.Birthday) < 50 AND strftime('%Y',T2.Date) = '1984';
SELECT SUM(IIF(T1.SEX = 'F', 1, 0)) * 100 / COUNT(*) AS percentage FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE (julianday('now') - julianday(T1.Birthday)) / 365 > 55 AND T2.PT >= 14;
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` > '1992-01-01' AND T2.PT < 14;
SELECT COUNT(*) FROM Examination WHERE `Examination Date` > '1997-01-01' AND RVVT = 'INACTIVE'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.APTT > 45 AND T2.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG <= 150 OR T2.FG >= 450)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND NOT (T2.FG BETWEEN 150 AND 450)
SELECT T1.Diagnosis FROM `Laboratory` AS T2 INNER JOIN `Patient` AS T1 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30 GROUP BY T1.Diagnosis
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.`U-PRO` BETWEEN 0 AND 30;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGG >= 2000;
SELECT COUNT(*) FROM `Laboratory` JOIN `Examination` ON `Laboratory`.`ID` = `Examination`.`ID` WHERE `IGG` > 900 AND `IGG` < 2000 AND `Examination`.`Symptoms` IS NOT NULL;
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.IGA BETWEEN 80 AND 500 ORDER BY T2.IGA DESC LIMIT 1;
SELECT COUNT(T2.ID) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.`First Date` >= '1990-01-01' AND T1.IGA > 80 AND T1.IGA < 500;
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGM <= 40 OR T1.IGM >= 400 GROUP BY Diagnosis ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*) FROM `Patient` WHERE `Description` IS NULL AND EXISTS(SELECT * FROM `Laboratory` WHERE `Patient`.`ID` = `Laboratory`.`ID` AND `CRP` = '+')
SELECT COUNT(*) FROM `Laboratory` L JOIN `Patient` P ON L.ID = P.ID WHERE L.CRE >= 1.5 AND (YEAR(CURDATE()) - strftime('%Y',P.Birthday)) < 70
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+' AND (T1.RF = '+' OR T1.RF = '+-')
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Birthday >= '1985-01-01' AND T2.RA IN ('-', '+-')
SELECT T1.ID FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE CAST(SUBSTR(T1.Birthday, 1, 4) AS INT) + 60 < CAST(SUBSTR(datetime('now'), 1, 4) AS INT) AND T2.RF < 20
SELECT COUNT(*) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Thrombosis = 0) AND ID IN (SELECT ID FROM Laboratory WHERE RF < 20)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.ANA_pattern = 'P' AND ( SELECT C3 FROM Laboratory WHERE ID = T1.ID ) > 35
SELECT T2.ID FROM `Laboratory` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.HCT < 29 OR T1.HCT > 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.id) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.id = T2.id WHERE T1.Diagnosis = 'APS' AND T2.C4 > 10;
SELECT COUNT(DISTINCT T1.id) FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND (T2.RNP = '-' OR T2.RNP = '0')
SELECT MAX(T2.Birthday) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RNP NOT IN('-','+-')
SELECT COUNT(T2.ID) FROM `Laboratory` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE (T1.SM = '-' OR T1.SM = '+-') AND T2.Thrombosis = 0;
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Examination_Date > '1997-01-01' AND T2.SC170 IN('negative','0')
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.SC170 IN('negative', '0') AND T1.Description IS NULL
SELECT COUNT(DISTINCT ID)  FROM `Patient`  WHERE ID IN (SELECT ID FROM `Laboratory` WHERE SSA IN('-','+-'))  AND strftime('%Y', `First Date`) < '2000';
SELECT T1.id FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID  =  T2.ID WHERE T2.SSA NOT IN('negative' ,  '0') ORDER BY T1.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT E.ID) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE E.SSB IN ('-','0') AND P.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT e.ID)  FROM Examination e  JOIN Patient p ON e.ID = p.ID  JOIN Laboratory l ON l.ID = p.ID  WHERE l.SSB IN ('negative', '0') AND e.Symptoms IS NOT NULL;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CENTROMEA IN ('-', '+-') AND T2.SSB IN ('-', '+-')
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA IS NOT NULL AND CAST(REPLACE(T1.DNA, ',', '') AS REAL) >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Description IS NULL AND T2.DNA < 8
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.IGG BETWEEN 900 AND 2000;
SELECT CAST(SUM(IIF(T2.GOT >= 60 AND T1.Diagnosis = 'SLE', 1, 0)) AS REAL) * 100 / COUNT(T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60;
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.id = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60;
SELECT MIN(T1.Birthday) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60;
SELECT T1.Birthday FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(*) FROM `Patient` WHERE `ID` IN (SELECT `ID` FROM `Laboratory` WHERE `GOT` < 60) AND `SEX` = 'M'
SELECT T2.FirstDate FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH < 500 ORDER BY T1.LDH DESC LIMIT 1
SELECT T1.Date FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.LDH >= 500 ORDER BY T2.`First Date` DESC LIMIT 1;
SELECT COUNT(*) FROM `Patient` WHERE `Admission` = '+' AND ID IN (SELECT ID FROM `Laboratory` WHERE `ALP` >= 300)
SELECT COUNT(*) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300;
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0 GROUP BY T2.Diagnosis;
SELECT COUNT(DISTINCT T1.ID) FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' AND T2.TP > 6.0 AND T2.TP < 8.5;
SELECT T1.ExaminationDate FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB BETWEEN 3.5 AND 5.5 ORDER BY T2.ALB DESC LIMIT 1;
SELECT COUNT(*) FROM `Laboratory` WHERE `ALB` >= 3.5 AND `ALB` <= 5.5 AND `TP` BETWEEN 6.0 AND 8.5 AND ID IN (SELECT `ID` FROM `Patient` WHERE `SEX` = 'M')
SELECT T1.aCL_IgG ,  T1.aCL_IgM ,  T1.aCL_IgA FROM Examination AS T1 JOIN Patient AS T2 ON T2.ID = T1.ID JOIN Laboratory AS T3 ON T3.ID = T2.ID WHERE ua > 6.5 AND T2.SEX = 'F' ORDER BY T3.UA DESC LIMIT 1
SELECT MAX(T2.ANA) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5
SELECT T1.ID FROM Laboratory AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T2.`aCL IgA` DESC LIMIT 1;
SELECT COUNT(*) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Examination AS T3 ON T3.ID = T2.ID WHERE T1.`T-BIL` >= 2.0 AND T3.`ANA Pattern` LIKE '%P%'
SELECT T1.ANA FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T2.ID  =  T1.ID JOIN `Laboratory` AS T3 ON T3.ID  =  T2.ID WHERE T3.`T-BIL` < 2.0 ORDER BY T3.`T-BIL` DESC LIMIT 1
SELECT COUNT(*) FROM Patient P JOIN Examination E ON P.ID = E.ID JOIN Laboratory L ON P.ID = L.ID WHERE L.`T-CHO` >= 250 AND E.KCT = '-'
SELECT COUNT(*) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID JOIN Examination AS T3 ON T3.ID = T2.ID WHERE T1.`T-CHO` < 250 AND T3.`ANA Pattern` = 'P'
SELECT COUNT(*) FROM `Patient` p JOIN `Laboratory` l ON p.ID = l.ID WHERE l.TG < 200 AND EXISTS (SELECT * FROM `Examination` e WHERE e.ID = p.ID AND e.Symptoms IS NOT NULL)
SELECT T1.Diagnosis FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1;
SELECT T1.ID FROM `Patient` AS T1 JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.CPK < 250 AND (SELECT T3.Thrombosis FROM `Examination` AS T3 WHERE T3.ID = T1.ID) = 0
SELECT COUNT(*) FROM `Examination` WHERE (`KCT` = "+" OR `RVVT` = "+" OR `LAC` = "+") AND EXISTS(SELECT * FROM `Laboratory` WHERE `Laboratory`.`ID` = `Examination`.`ID` AND `Laboratory`.`CPK` < 250)
SELECT T2.Birthday FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GLU > 180 ORDER BY T2.Birthday ASC LIMIT 1;
SELECT COUNT(*) FROM `Laboratory` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0;
SELECT COUNT(*) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND T1.WBC BETWEEN 3.5 AND 9.0;
SELECT COUNT(*) FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0;
SELECT T1.ID FROM `Laboratory` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE (T1.RBC <= 3.5 OR T1.RBC >= 6.0) AND T2.Admission = '-'
SELECT COUNT(*) FROM `Laboratory` JOIN `Patient` ON `Laboratory`.`ID` = `Patient`.`ID` WHERE `Laboratory`.`PLT` > 100 AND `Laboratory`.`PLT` < 400 AND `Patient`.`Diagnosis` IS NOT NULL;
SELECT T1.PLT FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'MCTD' AND T1.PLT BETWEEN 100 AND 400;
SELECT AVG(T2.PT) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14
SELECT COUNT(*) FROM Patient WHERE ID IN(SELECT ID FROM Examination WHERE Thrombosis IN(1, 2)) AND ID IN(SELECT ID FROM Laboratory WHERE `PT` < 14)
SELECT T3.major_name FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering')
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design'
SELECT COUNT(T3.member_id) FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = "Women's Soccer"
SELECT T3.phone FROM attendance AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Women''s Soccer'
SELECT COUNT(*) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'Medium' AND T2.link_to_event IN(SELECT event_id FROM event WHERE event_name = 'Women''s Soccer')
SELECT T1.event_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event GROUP BY T2.link_to_event ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President' LIMIT 1;
SELECT E.event_name FROM event AS E JOIN attendance AS A ON E.event_id = A.link_to_event JOIN member AS M ON A.link_to_member = M.member_id WHERE M.first_name = 'Maya' AND M.last_name = 'Mclean'
SELECT count(T3.event_id) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T3.event_id = T2.link_to_event WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison' AND strftime('%Y', T3.event_date) = '2019';
SELECT COUNT(*)  FROM ( 	SELECT link_to_event  	FROM attendance  	GROUP BY link_to_event  	HAVING COUNT(link_to_event) > 10 ) AS t1  JOIN event ON t1.link_to_event = event.event_id  WHERE event.type = 'Meeting'
SELECT T1.event_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id HAVING Count(T1.event_id) > 20 AND T1.type != 'fundraiser'
SELECT AVG(subq1.c1) FROM (SELECT COUNT(T1.event_id) AS c1, T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND strftime('%Y', T1.event_date) = '2020' GROUP BY T1.event_name) AS subq1
SELECT MAX(T1.cost), T1.expense_description FROM `expense` AS T1 INNER JOIN `budget` AS T2 ON T1.link_to_budget = T2.budget_id WHERE T2.event_status = 'support'
SELECT COUNT(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Environmental Engineering')
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'
SELECT T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'
SELECT T3.county FROM member AS T1 JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT T4.college FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id JOIN major AS T4 ON T1.link_to_major = T4.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'
SELECT SUM(T2.amount) FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'
SELECT SUM(budget.spent)  FROM budget  JOIN event ON budget.link_to_event = event.event_id  WHERE budget.category = 'Food' AND event.event_name = 'September Meeting'
SELECT T3.city, T3.state FROM member AS T1 JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.position = 'President'
SELECT T1.first_name ,  T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois'
SELECT SUM(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement' AND T2.event_name = 'September Meeting'
SELECT T4.department FROM `member` AS T1 JOIN `attendance` AS T2 ON T1.member_id = T2.link_to_member JOIN `event` AS T3 ON T2.link_to_event = T3.event_id JOIN `major` AS T4 ON T1.link_to_major = T4.major_id WHERE T1.first_name = 'Pierce' AND T1.last_name = 'Guidi'
SELECT SUM(T1.amount) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event  =  T2.event_id WHERE T2.event_name  =  'October Speaker'
SELECT T1.approved FROM `expense` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'October Meeting' AND T2.event_date = '2019-10-08'
SELECT AVG(T1.cost) FROM `expense` AS T1 JOIN `member` AS T2 ON T1.`link_to_member` = T2.`member_id` WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND (((strftime('%m',T1.expense_date)) = '09')) OR ((strftime('%m',T1.expense_date)) = '10')
SELECT SUM(IIF(SUBSTR(T2.event_date, 1, 4) = '2019', T1.spent, 0)) - SUM(IIF(SUBSTR(T2.event_date, 1, 4) = '2020', T1.spent, 0)) FROM budget AS T1 JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T2.type = 'Student_Club'
SELECT T1.location FROM `event` AS T1 WHERE T1.event_name = 'Spring Budget Review'
SELECT T3.cost FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense_description` AS T3 ON T2.expense_description = T3.description WHERE T1.event_name = 'Posters' AND T1.event_date = '2019-09-04' AND T3.description = 'Poster';   Note: The provided schema does not have an "expense_description" table nor a description field in the "expense" table. Therefore, an accurate SQL query without these elements would be impossible with the given database structure. Instead of using `description` and `expense_description` tables which was mentioned in this wrong SQL statement assumed it would join expenses table on correct fields as per original requirements, a revised possible statement as below :  SELECT T1.cost FROM `expense` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'Posters' AND T2.event_date = '2019-09-04';  Yet, this sql statement above is an assumption interpretation based on the question and a real database table relation is required. Without joining to other non-existent tables, or fields such an 'description', here is more refined and correct query according to given data schema.  We don't get a specific cost as per single name in provided data (eg: Posters) for a given date; It refers to multiple expenses if event_name was "Posters" and event_date equals given date which could potentially have various costs based on each expense_id. Thus following refined query would fetch those expense costs:  SELECT T2.cost FROM `event` AS T1 JOIN `expense` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Posters' AND T1.event_date = '2019-09-04';   (Here an SQL group_by was avoided as single cost of "Posters" from specific date is inquired and data contains multiple costs but no specific value provided or inferred, unless it meant sum total.)
SELECT T1.remaining FROM budget AS T1 WHERE T1.category = 'Food' AND T1.amount = (SELECT MAX(t2.amount) FROM budget AS t2 WHERE t2.category = 'Food')
SELECT T1.notes FROM income AS T1 WHERE T1.date_received = '2019-09-14' AND T1.source = 'Fundraising'
SELECT COUNT(*) FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T1.phone FROM member AS T1 WHERE T1.first_name = 'Carlo' AND T1.last_name = 'Jacobs';
SELECT T2.county FROM `member` AS T1 JOIN `zip_code` AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O'Gallagher'
SELECT COUNT(*) FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = "November Meeting") AND remaining < 0
SELECT SUM(T1.amount) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'September Speaker'
SELECT T3.status FROM `expense` AS T1 JOIN `budget` AS T2 ON T1.link_to_budget = T2.budget_id JOIN `event` AS T3 ON T2.link_to_event = T3.event_id WHERE T1.expense_description = 'Post Cards, Posters' AND T1.expense_date = '2019-8-20'
SELECT T1.major_name FROM major AS T1 JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Brent' AND T2.last_name = 'Thomason' ;
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `major_name`= 'Business') AND t_shirt_size='Medium'
SELECT T2.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President' LIMIT 1;
SELECT T3.state FROM member AS T1 JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T1.department FROM `major` AS T1 JOIN `member` AS T2 ON T1.major_id = T2.link_to_major WHERE T2.position = 'President'
SELECT T1.date_received FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Connor' AND T2.last_name = 'Hilton' AND T1.source = 'Dues';
SELECT T2.first_name, T2.last_name FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.source = 'Dues' ORDER BY T1.date_received ASC LIMIT 1
SELECT COUNT(*) FROM (SELECT * FROM `budget` WHERE `category` = 'Advertisement' AND `link_to_event` IN (SELECT `event_id` FROM `event` WHERE `event_name` = 'Yearly Kickoff')) b1, (SELECT * FROM `budget` WHERE `category` = 'Advertisement' AND `link_to_event` IN (SELECT `event_id` FROM `event` WHERE `event_name` = 'October Meeting')) b2 WHERE b1.`amount` > b2.`amount`;
SELECT (SUM(CASE WHEN T2.category  =  'Parking' THEN T2.amount ELSE 0 END) / SUM(T2.amount)) * 100 FROM event AS T1 JOIN budget AS T2 ON T1.event_id  =  T2.link_to_event WHERE T1.event_name  =  'November Speaker'
SELECT SUM(T1.cost) FROM expense AS T1 WHERE T1.expense_description = 'Pizza'
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences' GROUP BY department
SELECT T3.city, T3.county, T3.state FROM member AS T1 JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T2.expense_description FROM budget AS T1 JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T1.remaining = (SELECT MIN(remaining) FROM budget)
SELECT T3.first_name, T3.last_name FROM `event` AS T1 JOIN `attendance` AS T2 ON T1.event_id = T2.link_to_event JOIN `member` AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'October Meeting'
SELECT T3.college FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id GROUP BY T3.college ORDER BY COUNT(T1.member_id) DESC LIMIT 1
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.amount = (SELECT MAX(amount) FROM `budget`)
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.position = 'Vice President'
SELECT COUNT(*) FROM `attendance` WHERE `link_to_event` IN (SELECT `event_id` FROM `event` WHERE `event_name` = "Women's Soccer")
SELECT T2.date_received FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Casey' AND T1.last_name = 'Mason'
SELECT COUNT(*) FROM `member` WHERE `zip` IN (SELECT `zip_code` FROM `zip_code` WHERE `state` = 'Maryland')
SELECT COUNT(*) FROM attendance WHERE link_to_member IN (SELECT member_id FROM member WHERE phone = '954-555-6240')
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President'
SELECT MAX(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'
SELECT SUM(spent) FROM budget WHERE category = 'Food'
SELECT T2.first_name, T2.last_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id GROUP BY T1.link_to_member HAVING COUNT(T1.link_to_event) > 7
SELECT M1.first_name, M1.last_name FROM member AS M1 JOIN attendance AS A1 ON M1.member_id = A1.link_to_member JOIN event AS E1 ON A1.link_to_event = E1.event_id JOIN major AS Ma1 ON M1.link_to_major = Ma1.major_id WHERE E1.event_name = 'Community Theater' AND Ma1.major_name = 'Interior Design';
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'
SELECT COUNT(T1.amount) FROM income AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.first_name = 'Grant' AND T2.last_name = 'Gilmour'
SELECT t1.first_name ,  t1.last_name FROM member AS t1 JOIN income AS t2 ON t1.member_id = t2.link_to_member WHERE t2.amount > 40
SELECT SUM(T3.cost) FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense` AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'Yearly Kickoff'
SELECT T3.first_name, T3.last_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `member` AS T3 ON T3.member_id = T2.link_to_member WHERE T1.event_name = 'Yearly Kickoff'
SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT MAX(amount) FROM income);
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.spent IS NOT NULL ORDER BY T2.spent ASC LIMIT 1;
SELECT SUM(CASE WHEN T1.event_name = 'Yearly Kickoff' THEN ( SELECT spent FROM budget WHERE link_to_event = T1.event_id ) ELSE 0 END) / SUM(( SELECT spent FROM budget WHERE link_to_event IN (SELECT event_id FROM `event`) )) * 100 AS percentage FROM `event` AS T1
SELECT COUNT(*) FILTER (WHERE T2.major_name = 'Finance') / COUNT(*) FILTER (WHERE T2.major_name = 'Physics') FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name IN ('Finance', 'Physics')
SELECT `source`  FROM `income`  WHERE `date_received` BETWEEN '2019-09-01' AND '2019-09-30'  GROUP BY `source`  ORDER BY SUM(`amount`) DESC  LIMIT 1;
SELECT first_name ,  last_name ,  email FROM member WHERE position = 'Secretary' LIMIT 1;
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `major_name` = 'Physics Teaching')
SELECT COUNT(*) FROM attendance WHERE link_to_event IN (SELECT event_id FROM event WHERE event_name = 'Community Theater' AND strftime('%Y',event_date) = '2019')
SELECT COUNT(*), T4.major_name FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN event AS T3 ON T1.link_to_event = T3.event_id JOIN major AS T4 ON T2.link_to_major = T4.major_id WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi' GROUP BY T4.major_name
SELECT AVG(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food' AND T2.status = 'Closed'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id  =  T2.link_to_event WHERE T2.category  =  'Advertisement' ORDER BY T2.spent DESC LIMIT 1;
SELECT COUNT(*) > 0 FROM attendance AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T2.first_name = 'Maya' AND T2.last_name = 'Mclean' AND T3.event_name = 'Women''s Soccer'
SELECT SUM(IIF(T1.type = 'Community Service', 1, 0)) * 100 / COUNT(T1.event_id) AS percentage  FROM `event` AS T1  WHERE T1.event_date BETWEEN '2019-01-01' AND '2019-12-31';
SELECT T3.cost FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense` AS T3 ON T3.link_to_budget = T2.budget_id WHERE T1.event_name = 'September Speaker' AND T3.expense_description = 'Posters'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1;
SELECT SUM(T3.cost), T3.expense_description FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event JOIN `expense` AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'October Meeting' AND T3.approved = 'yes' GROUP BY T3.expense_description
SELECT SUM(T1.amount), T1.category FROM `budget` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'April Speaker' GROUP BY T1.category ORDER BY SUM(T1.amount) ASC
SELECT link_to_event FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1;
SELECT link_to_event FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY T1.first_name, T1.last_name
SELECT T.expense_description FROM expense AS T JOIN member AS M ON T.link_to_member = M.member_id WHERE M.first_name = 'Sacha' AND M.last_name = 'Harrison'
SELECT T1.expense_description FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.t_shirt_size = 'X-Large'
SELECT T2.zip FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost < 50
SELECT T3.major_name FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'
SELECT T1.position FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business'
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'Medium' AND link_to_major IN(SELECT major_id FROM major WHERE major_name = 'Business')
SELECT T1.type FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T2.event_id = T1.link_to_event WHERE T2.location = 'MU 215'
SELECT type FROM `event` WHERE `event_date` = '2020-03-24T12:00:00' LIMIT 1
SELECT T3.major_name FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = "Vice President"
SELECT CAST(SUM(CASE WHEN T2.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Member';
SELECT T2.category FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215'
SELECT count(*) FROM income WHERE amount = 50
SELECT COUNT(*) FROM `member` WHERE `position` = 'Member' AND `t_shirt_size` = 'X-Large'
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'
SELECT T1.last_name, T2.department, T2.college FROM `member` AS T1 JOIN `major` AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'
SELECT T2.category FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215' AND T1.type = 'Guest Speaker' AND T2.spent = 0;
SELECT T3.city, T3.state FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T1.position = 'Member' AND T2.department = 'Electrical and Computer Engineering Department'
SELECT T3.event_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.position = 'Vice President' AND T3.location = '900 E. Washington St.' AND T3.type = 'Social'
SELECT T2.last_name, T2.position FROM expense AS T1 JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'
SELECT T3.last_name FROM event AS T1 JOIN attendance AS T2 ON T1.event_id = T2.link_to_event JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer' AND T3.position = 'Member';
SELECT CAST(SUM(case when I.amount = 50 then 1 else 0 end) AS REAL) * 100 / COUNT(*) FROM income I JOIN member M ON I.link_to_member = M.member_id WHERE M.t_shirt_size = 'Medium' AND M.position = 'Member'
SELECT T1.state FROM `zip_code` AS T1 WHERE T1.type  =  'PO Box' GROUP BY T1.state
SELECT zip_code FROM zip_code WHERE state = 'Puerto Rico' AND county = 'San Juan Municipio' AND type = 'PO Box'
SELECT T1.event_name FROM `event` AS T1 WHERE T1.type = 'Game' AND T1.status = 'Closed' AND T1.event_date BETWEEN '2019-03-15' AND '2020-03-20';
SELECT T3.link_to_event FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member JOIN budget AS T3 ON T2.link_to_budget = T3.budget_id WHERE T2.cost > 50 GROUP BY T3.link_to_event HAVING COUNT(*) > 0
SELECT T1.link_to_member, T3.first_name, T3.last_name FROM expense AS T1 JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major = 'rec1N0upiVLy5esTO'
SELECT T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Agriculture and Applied Sciences' AND T2.major_name = 'Business'
SELECT T2.email FROM `expense` AS T1 JOIN `member` AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T1.cost > 20
SELECT COUNT(*) FROM `member` WHERE `link_to_major` IN (SELECT `major_id` FROM `major` WHERE `major_name` = 'education' AND `college` = 'College of Education & Human Services') AND `position` = 'Member'
SELECT SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) * 100 / COUNT(T1.event_id) AS percentage FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining < 0
SELECT event_id ,  location ,  status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) / COUNT(zip_code) * 100 FROM zip_code;
SELECT T1.event_name, T1.location FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0
SELECT E.event_name, E.event_date FROM event AS E JOIN budget AS B ON E.event_id = B.link_to_event JOIN expense AS Ex ON B.budget_id = Ex.link_to_budget WHERE Ex.expense_description = 'Pizza' AND Ex.cost > 50 AND Ex.cost < 100
SELECT t3.first_name ,  t3.last_name ,  t4.major_name FROM expense AS t1 JOIN member AS t3 ON t1.link_to_member = t3.member_id JOIN major AS t4 ON t3.link_to_major = t4.major_id WHERE t1.cost > 100
SELECT T1.city, T1.state FROM zip_code AS T1 JOIN member AS T2 ON T1.zip_code = T2.zip JOIN attendance AS T3 ON T3.link_to_member = T2.member_id GROUP BY T3.link_to_event HAVING COUNT(T2.member_id) > 40
SELECT T3.first_name, T3.last_name FROM expense AS T1 JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T1.cost IN (SELECT MAX(cost) FROM expense WHERE link_to_member IN (SELECT link_to_member FROM expense GROUP BY link_to_member HAVING COUNT(DISTINCT(link_to_budget)) > 1))
SELECT AVG(T3.cost) FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.link_to_member JOIN expense AS T3 ON T3.link_to_member = T1.member_id WHERE T1.position != 'Member'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Parking' AND T2.spent < (SELECT AVG(spent) FROM `budget` WHERE category = 'Parking')
SELECT SUM(e.cost) / (SELECT COUNT(*) FROM event WHERE type = 'Meeting') * 100 AS percentage  FROM expense e  JOIN budget b ON e.link_to_budget = b.budget_id  JOIN event ev ON b.link_to_event = ev.event_id  WHERE ev.type = 'Meeting'
SELECT T1.budget_id FROM `budget` AS T1 JOIN `expense` AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.expense_description = 'Water, chips, cookies' ORDER BY T2.cost DESC LIMIT 1
SELECT T1.first_name, T1.last_name FROM `member` AS T1 JOIN `expense` AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.member_id ORDER BY SUM(T2.cost) DESC LIMIT 5;
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.cost > (SELECT AVG(cost) FROM expense)
SELECT (COUNT(CASE WHEN T2.state = 'New Jersey' THEN 1 END) / COUNT(T1.position)) - (COUNT(CASE WHEN T2.state = 'Vermont' THEN 1 END) / COUNT(T1.position)) FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'Member';
SELECT T2.major_name, T2.department FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T2.cost FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T2.expense_description = 'Water, Veggie tray, supplies'
SELECT T1.last_name, T1.phone FROM member AS T1 JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Elementary Education'
SELECT T1.category, T1.amount FROM `budget` AS T1 JOIN `event` AS T2 ON T1.link_to_event = T2.event_id WHERE T2.event_name = 'January Speaker';
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Food'
SELECT T1.first_name, T1.last_name, T2.amount FROM member AS T1 JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '9/9/2019'
SELECT T2.category FROM expense AS T1 JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'
SELECT T1.first_name, T1.last_name, T3.college FROM member AS T1 JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T1.position = 'Secretary'
SELECT T2.event_name ,  SUM(T1.spent) FROM budget AS T1 JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Speaker Gifts' GROUP BY T1.link_to_event;
SELECT T1.city FROM `zip_code` AS T1 JOIN `member` AS T2 ON T1.zip_code = T2.zip WHERE T2.first_name = 'Garrett' AND T2.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T1.position FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T2.zip_code = 28092;
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT COUNT(*) FILTER (WHERE Currency = 'EUR') / COUNT(*) FILTER (WHERE Currency = 'CZK') FROM customers;
SELECT DISTINCT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.Date BETWEEN '201201' AND '201212' ORDER BY T2.Consumption ASC LIMIT 1;
SELECT AVG(T1.Consumption) FROM `yearmonth` AS T1 JOIN `customers` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.Date BETWEEN '201301' AND '201312'
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' AND T2.Date BETWEEN '201101' AND '201112' ORDER BY T2.Consumption DESC LIMIT 1
SELECT COUNT(DISTINCT ym.CustomerID) FROM yearmonth ym JOIN customers c ON ym.CustomerID = c.CustomerID WHERE c.Segment = 'KAM' AND ym.Date BETWEEN '201201' AND '201212' GROUP BY ym.CustomerID HAVING SUM(ym.Consumption) < 30000
SELECT SUM(CASE WHEN T3.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T3.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS DifferenceInConsumption FROM customers AS T3 JOIN yearmonth AS T2 ON T3.CustomerID = T2.CustomerID WHERE SUBSTR(T2.Date,1,4) BETWEEN '201201' AND '201212'
SELECT strftime('%Y', Date) AS Year, SUM(Amount*Price) AS Total_Spent FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR' GROUP BY Year ORDER BY Total_Spent DESC LIMIT 1;
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1
SELECT substr(`Date`, 1, 4) AS Year, SUM(`Consumption`) AS Total_Consumption FROM `yearmonth` JOIN `customers` ON `yearmonth`.`CustomerID` = `customers`.`CustomerID` WHERE `customers`.`Currency` = 'CZK' GROUP BY Year ORDER BY Total_Consumption DESC LIMIT 1;
SELECT T1.Date FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.Date LIKE '2013%' ORDER BY T1.Consumption DESC LIMIT 1;
SELECT      (SELECT SUM(T2.Consumption) / COUNT(DISTINCT CASE WHEN T1.Segment = 'SME' THEN T2.CustomerID END)      FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID      WHERE strftime('%Y', T2.Date) = '2013'        AND T1.Currency = 'CZK') -     (SELECT SUM(T2.Consumption) / COUNT(DISTINCT CASE WHEN T1.Segment = 'LAM' THEN T2.CustomerID END)      FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID      WHERE strftime('%Y', T2.Date) = '2013'        AND T1.Currency = 'CZK') AS SME_LAM,     (SELECT SUM(T2.Consumption) / COUNT(DISTINCT CASE WHEN T1.Segment = 'LAM' THEN T2.CustomerID END)      FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID      WHERE strftime('%Y', T2.Date) = '2013'        AND T1.Currency = 'CZK') -     (SELECT SUM(T2.Consumption) / COUNT(DISTINCT CASE WHEN T1.Segment = 'KAM' THEN T2.CustomerID END)      FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID      WHERE strftime('%Y', T2.Date) = '2013'        AND T1.Currency = 'CZK') AS LAM_KAM,     (SELECT SUM(T2.Consumption) / COUNT(DISTINCT CASE WHEN T1.Segment = 'KAM' THEN T2.CustomerID END)      FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID      WHERE strftime('%Y', T2.Date) = '2013'        AND T1.Currency = 'CZK') -     (SELECT SUM(T2.Consumption) / COUNT(DISTINCT CASE WHEN T1.Segment = 'SME' THEN T2.CustomerID END)      FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID      WHERE strftime('%Y', T2.Date) = '2013'        AND T1.Currency = 'CZK') AS KAM_SME ;
SELECT T1.Segment,         ((T2.Consumption_2013 - T2.Consumption_2012) / T2.Consumption_2013) * 100 AS Percentage_Increase FROM customers AS T1 JOIN (     SELECT CustomerID,            CAST(SUM(CASE WHEN `Date` LIKE '2013%' THEN Consumption END) AS REAL) AS Consumption_2013,            SUM(CASE WHEN `Date` LIKE '2012%' THEN Consumption END) AS Consumption_2012     FROM yearmonth     GROUP BY CustomerID ) AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' GROUP BY T1.Segment
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'CZE' AND `Segment` = 'Value for money') - (SELECT COUNT(*) FROM `gasstations` WHERE `Country` = 'SVK' AND `Segment` = 'Value for money') AS Difference_in_Discount_Gas_Stations
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference;
SELECT (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'CZK') - (SELECT COUNT(*) FROM customers WHERE Segment = 'SME' AND Currency = 'EUR') AS AmountOfMoreSMEs;
SELECT T1.CustomerID FROM customers AS T1 JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1
SELECT T1.CustomerID ,  MAX(T2.Consumption) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM'
SELECT SUM(Consumption) FROM yearmonth WHERE Date='201305' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment='KAM')
SELECT SUM(IIF(T1.Consumption > 46.73, 1, 0)) * 100.0 / COUNT(*) FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'LAM'
SELECT `Country`, COUNT(`GasStationID`) AS NumberOfStations FROM `gasstations` WHERE `Segment` = 'Value for money' GROUP BY `Country` ORDER BY NumberOfStations DESC LIMIT 1;
SELECT CAST(COUNT(CASE WHEN T2.Currency  =  'EUR' THEN 1 END) AS REAL) * 100 / COUNT(T2.CustomerID) FROM customers AS T2 WHERE Segment  =  'KAM'
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth WHERE Date LIKE '201202%'
SELECT CAST(SUM(IIF(T2.Segment = 'Premium', 1, 0)) AS REAL) * 100 / COUNT(T1.GasStationID) FROM gasstations T1 JOIN (     SELECT Segment     FROM gasstations     WHERE Country = 'CZE'     LIMIT 1 ) T2 ON T1.Segment = T2.Segment WHERE T1.Country = 'CZE';
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1
SELECT t1.CustomerID FROM `yearmonth` AS t1 JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Segment = 'SME' AND t1.Date = '201206' ORDER BY t1.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE `Date` LIKE '2012_%'
SELECT MAX(TotalConsumption) FROM ( SELECT CustomerID, SUM(Consumption) as TotalConsumption FROM yearmonth GROUP BY CustomerID ) T1 JOIN customers C ON T1.CustomerID = C.CustomerID WHERE Currency = 'EUR'
SELECT T3.Description FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE SUBSTR(T2.Date, 1, 4) = '2013' AND SUBSTR(T2.Date, 5, 2) = '09'
SELECT DISTINCT T3.Country FROM `yearmonth` AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T1.Date = '201306'
SELECT T1.ChainID FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR' GROUP BY T1.ChainID
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID JOIN customers AS T3 ON T2.CustomerID = T3.CustomerID WHERE T3.Currency = 'EUR'
SELECT AVG(Amount * Price) FROM transactions_1k WHERE `Date` LIKE '2012-01%'
SELECT COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Consumption > 1000;
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'
SELECT T3.Time FROM `gasstations` AS T1 JOIN `transactions_1k` AS T3 ON T3.GasStationID = T1.GasStationID WHERE T1.ChainID = 11 GROUP BY T3.Time
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000;
SELECT COUNT(*) FROM `transactions_1k`  JOIN `gasstations` ON `transactions_1k`.`GasStationID` = `gasstations`.`GasStationID` WHERE `gasstations`.`Country` = 'CZE' AND `transactions_1k`.`Date` > '2012-01-01';
SELECT AVG(T1.Amount * T1.Price) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'
SELECT AVG(t1.Price * t1.Amount) FROM `transactions_1k` AS t1 JOIN `customers` AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = 'EUR'
SELECT T1.CustomerID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-25' AND T1.Time IS NOT NULL ORDER BY T1.Price * T1.Amount DESC LIMIT 1
SELECT T3.Country FROM transactions_1k AS T1 JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time ASC LIMIT 1
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE `Date` = '2012-08-26' AND Time < '13:00:00' AND (SELECT Currency FROM customers WHERE CustomerID = transactions_1k.CustomerID) = 'CZK'
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1;
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT T2.productid FROM transactions_1k AS T1 JOIN products AS T2 ON T1.productid = T2.productid WHERE T1.date = '2012-08-23' AND T1.time = '21:20:00'
SELECT T3.Consumption ,  T2.Date ,  T2.Price * T2.Amount AS Expenses FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Price * T2.Amount = 124.05 AND strftime('%Y',T3.Date) = '2012' AND (strftime('%m',T3.Date)) = '01' ;
SELECT COUNT(*) FROM `transactions_1k`  JOIN `gasstations` ON `transactions_1k`.`GasStationID` = `gasstations`.`GasStationID` WHERE Date = '2012-08-26' AND Time BETWEEN '08:00:00' AND '09:00:00' AND `gasstations`.`Country` = 'CZE';
SELECT T1.Currency FROM customers AS T1 JOIN `yearmonth` AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17
SELECT T1.country FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.CardID = 667467 GROUP BY T1.Country;
SELECT T3.Country FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24' AND Amount * Price = 548.4
SELECT CAST(SUM(IIF(T1.Currency = 'EUR', 1, 0)) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25'
SELECT ((SELECT SUM(t1.Amount * t1.Price) FROM transactions_1k AS t1 JOIN customers AS c ON t1.CustomerID = c.CustomerID WHERE c.CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' AND Price * Amount = 634.8) AND strftime('%Y', t1.Date) = '2012') -  (SELECT SUM(t2.Amount * t2.Price) FROM transactions_1k AS t2 JOIN customers AS c ON t2.CustomerID = c.CustomerID WHERE c.CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' AND Price * Amount = 634.8) AND strftime('%Y', t2.Date) = '2013')) / (SELECT SUM(t3.Amount * t3.Price) FROM transactions_1k AS t3 JOIN customers AS c ON t3.CustomerID = c.CustomerID WHERE c.CustomerID IN (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' AND Price * Amount = 634.8) AND strftime('%Y', t3.Date) = '2012') AS decrease_rate;
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS Revenue FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.GasStationID ORDER BY Revenue DESC LIMIT 1
SELECT CAST(SUM(IIF(T2.Segment = 'Premium', 1, 0)) AS REAL) * 100 / COUNT(*) FROM gasstations T1 JOIN `gasstations` T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'SVK'
SELECT SUM(T1.Amount * T1.Price) AS total_spent FROM `transactions_1k` AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID = '38508' AND T1.Date = '2012-01-%'
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.ProductID ORDER BY SUM(T2.Amount) DESC LIMIT 5;
SELECT T3.CustomerID, T2.Currency, SUM(T1.Price)/SUM(T1.Amount) as AvgPricePerItem FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN (SELECT CustomerID FROM transactions_1k GROUP BY CustomerID ORDER BY SUM(Amount * Price) DESC LIMIT 1) AS T3 WHERE T2.CustomerID = T3.CustomerID;
SELECT T3.Country FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.Description = 'Nafta' AND T1.Price = (SELECT MAX(Price) FROM transactions_1k WHERE ProductID = 2)
SELECT T3.Consumption FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T2.CustomerID = T3.CustomerID WHERE T1.ProductID = 5 AND T1.Price / T1.Amount > 29.00 AND T3.Date = '201208'
