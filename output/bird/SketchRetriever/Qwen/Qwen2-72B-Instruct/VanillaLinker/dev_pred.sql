SELECT MAX(`Percent (%) Eligible Free (K-12)`) FROM `frpm` WHERE `County Name` = 'Alameda'
SELECT `Percent (%) Eligible Free (Ages 5-17)` FROM `frpm` WHERE `School Type` = 'Continuation' ORDER BY `Percent (%) Eligible Free (Ages 5-17)` ASC LIMIT 3
SELECT s.Zip  FROM frpm f  JOIN schools s ON f.CDSCode = s.CDSCode  WHERE f.CountyName = 'Fresno' AND f.`Charter School (Y/N)` = 1
SELECT T3.MailStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode INNER JOIN schools AS T3 ON T2.CDSCode = T3.CDSCode WHERE T1.FRPMCount_K_12 IS NOT NULL ORDER BY T1.FRPMCount_K_12 DESC LIMIT 1
SELECT T2.Phone FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM `satscores` JOIN `schools` ON satscores.cds = schools.CDSCode WHERE satscores.AvgScrMath > 400 AND schools.Virtual = 'F'
SELECT s.School  FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.NumTstTakr > 500 AND s.Magnet = 1;
SELECT T2.Phone FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 > 0 ORDER BY T1.NumTstTakr DESC LIMIT 1
SELECT T2.NumTstTakr FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.FRPMCount_K_12  =  (SELECT MAX(FRPMCount_K_12) FROM frpm)
SELECT COUNT(*) FROM satscores WHERE `AvgScrMath` > 560 AND `CDSCode` IN (SELECT CDSCode FROM schools WHERE `Charter` = 1 AND `FundingType` = 'Directly-funded charter')
SELECT T3.FRPMCountages_5_17 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode INNER JOIN frpm AS T3 ON T2.CDSCode = T3.CDSCode WHERE T1.avgscrread = ( SELECT MAX(avgscrread) FROM satscores )
SELECT frpm.CDSCode  FROM frpm  WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500;
SELECT MAX(T1.`Percent (%) Eligible Free (Ages 5-17)`) FROM `frpm` AS T1 JOIN `satscores` AS T2 ON T1.CDSCode = T2.cds WHERE CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr > 0.3
SELECT T3.Phone FROM satscores AS T2 JOIN schools AS T3 ON T2.cds = T3.CDSCode WHERE T2.rtype = 'Excl' ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr DESC LIMIT 3
SELECT NCESSchool FROM frpm ORDER BY `Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT d.District Name, AVG(s.AvgScrRead) AS Average_Reading_Score FROM frpm f JOIN schools d ON SUBSTR(f.CDSCode,1,6)=d.CDSCode JOIN satscores s ON s.cds=d.CDSCode WHERE d.StatusType='Active' GROUP BY d.District Name ORDER BY Average_Reading_Score DESC LIMIT 1;
SELECT COUNT(T2.School) FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.County = 'Alameda' AND T1.NumTstTakr < 100;
SELECT T2.School, T1.AvgScrWrite, T2.CharterNum FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite > 499 AND T2.CharterNum IS NOT NULL ORDER BY T1.AvgScrWrite DESC;
SELECT COUNT(*)  FROM frpm  JOIN satscores ON frpm.CDSCode = satscores.cds  WHERE frpm.County_Name = 'FRESNO' AND frpm.District_Type = 'Directly Funded - District of Choice' AND satscores.NumTstTakr <= 250;
SELECT T1.Phone FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
SELECT COUNT(*) FROM frpm WHERE County_Name = 'AMADOR' AND Low_Grade = '9' AND High_Grade = '12'
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `FRPM Count (K-12)` < 700;
SELECT sname FROM satscores WHERE cds IN (SELECT CDSCode FROM schools WHERE County = 'Contra Costa') ORDER BY NumTstTakr DESC LIMIT 1
SELECT T1.School, T1.Street FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE (T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)`) > 30;
SELECT T3.School FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`Percent (%) Eligible Free (K-12)` > 0.1 AND T2.NumGE1500 >= 1500 JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode
SELECT T1.School, T1.FundingType FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Riverside' GROUP BY T2.cds HAVING AVG(T2.AvgScrMath) > 400;
SELECT T3.School ,  T3.Street ,  T3.City ,  T3.State ,  T3.Zip FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode JOIN ( SELECT School ,  Street ,  City ,  State ,  Zip FROM schools WHERE County = 'Monterey' AND `School Type` = 'High School' ) AS T3 ON T1.CDSCode = T3.CDSCode WHERE `FRPM Count (Ages 5-17)` > 800
SELECT T3.School, T2.AvgScrWrite, T3.Phone FROM schools AS T3 JOIN satscores AS T2 ON T3.CDSCode = T2.cds WHERE (T3.OpenDate > '1991-01-01' OR T3.ClosedDate < '2000-01-01') AND T2.AvgScrWrite IS NOT NULL ORDER BY T2.AvgScrWrite;
SELECT T1.School, T1.DOCType FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.Enrollment  -  ( SELECT AVG(Enrollment) FROM ( SELECT Enrollment (K-12) - Enrollment (Ages 5-17) AS Enrollment FROM frpm WHERE `Charter School (Y/N)` = 0 AND FundingType  =  'Local' ) ) > 0 AND T2.`Charter School (Y/N)` = 0 AND T2.FundingType  =  'Local' GROUP BY T1.CDSCode, T1.School, T1.DOCType
SELECT T1.OpenDate FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`School Type` = 'First-through-twelfth-grade' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT T2.City FROM frpm AS T1 JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Enrollment_K_12 > 0 GROUP BY T2.City ORDER BY SUM(T1.Enrollment_K_12) ASC LIMIT 5
SELECT School_Name, (Free_Meal_Count__K_12_ / Enrollment__K_12_) AS Eligible_Free_Rate_K_12 FROM  (   SELECT CDSCode, County_Name, District_Name, School_Name, Enrollment__K_12_, Free_Meal_Count__K_12_,          RANK () OVER (ORDER BY Enrollment__K_12_ DESC) as rank   FROM frpm   ) WHERE rank BETWEEN 10 AND 11
SELECT CDSCode, School_Name, FRPM_Count__K_12, Enrollment__K_12, (FRPM_Count__K_12 / Enrollment__K_12) AS Eligible_Free_or_Reduced_Meal_Rate  FROM frpm  WHERE IRC = 66  ORDER BY (FRPM_Count__K_12 / Enrollment__K_12) DESC  LIMIT 5
SELECT T1.Website, T1.School FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT T2.School_Name ,  CAST(T2.`Free Meal Count (Ages 5-17)` AS REAL) / T2.`Enrollment (Ages 5-17)` FROM `schools` AS T1 JOIN `frpm` AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson'
SELECT T3.AdmEmail1, T3.AdmEmail2, T3.AdmEmail3 FROM frpm AS T1 JOIN schools AS T3 ON T1.CDSCode = T3.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY `Enrollment (K-12)` ASC LIMIT 1;
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM satscores AS T1 JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 >= 1500 ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT T1.Street, T1.City, T1.Zip, T1.State FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr != 0 ORDER BY CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr ASC LIMIT 1;
SELECT T1.Website FROM schools AS T1 JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FreeMealCount BETWEEN 2000 AND 3000 AND T1.County = 'Los Angeles'
SELECT AVG(T2.NumTstTakr) FROM schools AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE County = 'Fresno' AND OpenDate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT T1.Phone FROM `schools` AS T1 JOIN `satscores` AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Fresno Unified' AND T2.rtype = 'District Summary' ORDER BY T2.AvgScrRead ASC LIMIT 1
SELECT s.School  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  JOIN satscores ss ON ss.cds = s.CDSCode  WHERE s.Virtual = 'F'  GROUP BY s.County, s.School  HAVING ss.AvgScrRead IN (     SELECT AvgScrRead      FROM satscores      WHERE rtype = 'V'      GROUP BY cname      ORDER BY AVG(AvgScrRead) DESC      LIMIT 5 )
SELECT T1.Educational_Option_Type FROM frpm AS T1 JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores)
