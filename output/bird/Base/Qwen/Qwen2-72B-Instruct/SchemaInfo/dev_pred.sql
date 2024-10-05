SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS eligible_free_rate FROM schools WHERE County = 'Alameda'
SELECT MIN(`Free Meal Count (Ages 5-17)`) / `Enrollment (Ages 5-17)` AS eligible_free_rate  FROM table_name  WHERE School_Type = 'Continuation'  GROUP BY `CDS Code`  ORDER BY eligible_free_rate ASC  LIMIT 3
SELECT T2.ZipCode FROM fprm AS T1 JOIN school AS T2 ON T1.SchID = T2.SchID WHERE T1.CountyOfficeEdName = 'FRESNO COUNTY OFFICE OF EDUCATION' AND T1.`Charter School (Y/N)` = 1
SELECT T1.StreetAddress FROM Schools AS T1 JOIN StudentCounts AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.FRPMCountK_12 = (SELECT MAX(FRPMCountK_12) FROM StudentCounts)
SELECT T2.PhoneNumber FROM FRPM AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.`Charter School (Y/N)` = 1 AND T2.LastUpdate > '2000-01-01'
SELECT COUNT(*) FROM schools WHERE Virtual = 'F' AND AVG_Math_SAT > 400
SELECT T1.SchoolName FROM Schools AS T1 JOIN SAT AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.TestTakers > 500 AND T1.Magnet = 1
SELECT T2.PhoneNumber FROM SchoolTestScores AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.TestTakers > 0 AND T1.SATScore > 1500 ORDER BY T1.TestTakers DESC LIMIT 1
SELECT T1.SAT_Test_Takers FROM School AS T1 JOIN Student AS T2 ON T1.School_ID = T2.School_ID WHERE T2.FRPM_Count = (SELECT MAX(FRPM_Count) FROM Student WHERE Grade_Level BETWEEN 'K' AND '12')
SELECT COUNT(*) FROM Schools WHERE Funding_Type = 'Charter' AND AVG_SAT_Math > 560;
SELECT T2.FRPM_5_17 FROM SAT_Scores AS T1 JOIN School_Districts AS T2 ON T1.School_ID = T2.School_ID WHERE T1.Test_Type = 'Reading' ORDER BY AVG(T1.Score) DESC LIMIT 1
SELECT SchoolCode FROM Schools WHERE (`Enrollment_K_12` + `Enrollment_Ages_5_17`) > 500;
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS highest_eligible_free_rate FROM table_name WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;
SELECT T2.Phone FROM (SELECT SchoolCode, SUM(NumGE1500) AS Sum_NumGE1500, SUM(NumTstTakr) AS Sum_NumTstTakr FROM SATExcellence WHERE NumGE1500 IS NOT NULL AND NumTstTakr IS NOT NULL GROUP BY SchoolCode) AS T1 JOIN Schools AS T2 ON T1.SchoolCode = T2.SchoolCode ORDER BY (T1.Sum_NumGE1500 / T1.Sum_NumTstTakr) DESC LIMIT 3
SELECT T1.NCES_School_ID FROM School AS T1 JOIN Enrollment AS T2 ON T1.School_ID = T2.School_ID WHERE Age_Range = '5-17' GROUP BY T1.NCES_School_ID ORDER BY COUNT(*) DESC LIMIT 5;
SELECT DistrictName FROM SchoolDistricts WHERE IsActive = 1 GROUP BY DistrictName ORDER BY AVG(ReadingScore) DESC LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE County = 'Alameda' AND TestTakers < 100;
SELECT CharterNumber, AVG(WritingScore) AS AverageWritingScore  FROM School  WHERE WritingScore > 499 AND CharterNumber IS NOT NULL  GROUP BY CharterNumber  ORDER BY AverageWritingScore DESC;
SELECT COUNT(*) FROM Schools WHERE Location = 'Fresno' AND Funding_Type = 'Directly Funded' AND Test_Takers <= 250;
SELECT T1.PhoneNumber FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Math' GROUP BY T1.SchoolID ORDER BY AVG(T2.Score) DESC LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE County = 'Amador' AND LowGrade = 9 AND HighGrade = 12;
SELECT COUNT(*) FROM schools WHERE district = 'Los Angeles' AND free_meals > 500 AND free_meals < 700 AND reduced_price_meals + free_meals < 700 AND grade_range LIKE '%K%' AND grade_range LIKE '%12%'
SELECT SchoolName FROM Schools WHERE County = 'Contra Costa' ORDER BY TestTakers DESC LIMIT 1;
SELECT T1.SchoolName ,  T1.StreetAddress FROM Schools AS T1 INNER JOIN SchoolAdmin AS T2 ON T1.CDSCode = T2.CDSCode WHERE ABS(T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17) > 30
SELECT T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE (T1.FreeMealCountK_12 / T1.TotalEnrollmentK_12) > 0.1 AND T2.TestScore >= 1500
SELECT T1.FundingType FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.City = 'Riverside' GROUP BY T1.SchoolName HAVING AVG(T2.AvgMathScore) > 400
SELECT AdmFName1, AdmLName1, AdmEmail1, Street, City, State, Zip FROM Schools WHERE County = 'Monterey' AND SchoolType = 'High School' AND AgeRange = '15-17' AND Free_Reduced_Meals > 800
SELECT S.SchoolName, AVG(AS.WritingScore) AS AvgWritingScore, S.PhoneNumber FROM Schools AS S JOIN AssessmentScores AS AS ON S.SchoolID = AS.SchoolID WHERE (S.OpeningYear > 1991 OR S.ClosingYear < 2000) GROUP BY S.SchoolName, S.PhoneNumber;
SELECT T1.Name ,  T1.DOC_Type FROM Schools AS T1 JOIN School_Districts AS T2 ON T1.Sponsor_District_ID  =  T2.ID WHERE T1.Funding_Type  =  'Local' AND (T1.Enrollment_K_12 - T1.Enrollment_Ages_5_17) > (SELECT AVG(Enrollment_K_12 - Enrollment_Ages_5_17) FROM Schools WHERE Funding_Type  =  'Local')
SELECT T1.Opened FROM Schools AS T1 JOIN SchoolDetails AS T2 ON T1.id = T2.school_id WHERE T2.grade_levels = 'K-12' ORDER BY T1.enrollment DESC LIMIT 1
SELECT T2.City FROM Schools AS T1 JOIN Addresses AS T2 ON T1.AddressID = T2.AddressID WHERE T1.Enrollment IS NOT NULL ORDER BY T1.Enrollment ASC LIMIT 5;
SELECT T1.FreeMealCount_K_12 / T1.Enrollment_K_12 AS Eligible_Free_Rate FROM School AS T1 JOIN School_Details AS T2 ON T1.school_id = T2.school_id ORDER BY T1.Enrollment_K_12 DESC LIMIT 2 OFFSET 9
SELECT `Eligible FRPM Rate (K-12)`, SchoolName FROM ( SELECT `FRPM Count (K-12)`, `Enrollment (K-12)`, `Eligible FRPM Rate (K-12)`, SchoolName, OwnershipCode, RANK() OVER (ORDER BY `FRPM Count (K-12)` DESC) AS rank FROM Schools WHERE OwnershipCode = 66 ) WHERE rank <= 5
SELECT T1.Website, T1.SchoolName FROM School AS T1 JOIN Meals AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.FreeMealCount BETWEEN 1900 AND 2000 AND T1.AgeRange = '5-17'
SELECT (`FreeMealCountAges5_17` / `EnrollmentAges5_17`) AS FreeRate WHERE AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson'
SELECT T2.AdmEmail1 FROM frm AS T1 JOIN sch AS T2 ON T1.SchID = T2.SchID WHERE T1.`Charter School (Y/N)` = 1 AND T1.SchTypeDesc = 'Chartered' ORDER BY `Enrollment (K-12)` ASC LIMIT 1
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM SAT_2015 AS T1 JOIN Schools AS T2 ON T1.SCHOOL_CODE = T2.SCHOOL_CODE WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM SAT_2015)
SELECT T2.Street, T2.City, T2.State, T2.Zip  FROM (     SELECT SchoolID, MIN(ExcellenceRate) AS MinExcellenceRate      FROM (         SELECT SchoolID, NumGE1500 / NumTstTakr AS ExcellenceRate          FROM Schools     ) AS SubQuery1 ) AS SubQuery2 JOIN Schools AS T1 ON T1.SchoolID = SubQuery2.SchoolID JOIN Addresses AS T2 ON T2.AddressID = T1.AddressID
SELECT Webpage FROM Schools WHERE County = 'Los Angeles' AND TestTakers BETWEEN 2000 AND 3000;
SELECT AVG(TestTakers) FROM Schools WHERE City = 'Fresno' AND YEAR(OpenDate) = 1980
SELECT T1.Telephone FROM Schools AS T1 JOIN Scores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.District = 'Fresno Unified' GROUP BY T1.SchoolID ORDER BY AVG(T2.Reading) ASC LIMIT 1
SELECT AdmFName1, AdmLName1  FROM table_name  WHERE Virtual = 'F'  GROUP BY County, AdmFName1, AdmLName1  HAVING AVG(ReadingScore) OVER (PARTITION BY County)  IN (SELECT TOP 5 AVG(ReadingScore)      FROM table_name      WHERE Virtual = 'F'      GROUP BY County      ORDER BY AVG(ReadingScore) DESC)
SELECT T1.Education_Type FROM Schools AS T1 JOIN Scores AS T2 ON T1.School_ID = T2.School_ID WHERE T2.Subject = 'Math' ORDER BY AVG(T2.Score) DESC LIMIT 1;
SELECT T1.AvgScrMath, T2.County  FROM SchoolScores AS T1  JOIN Schools AS T2 ON T1.SchID = T2.SchID  WHERE T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite = (SELECT MIN(AvgScrMath + AvgScrRead + AvgScrWrite) FROM SchoolScores) GROUP BY T2.County ORDER BY AVG(T1.AvgScrMath) ASC LIMIT 1;
SELECT T1.City, AVG(T2.Writing) AS AvgWritingScore FROM Schools AS T1 JOIN SATScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.TotalSAT >= 1500 GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.SchoolName, AVG(T2.WritingScore) FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.AdministratorFirstName = 'Ricci' AND T1.AdministratorLastName = 'Ulrich' GROUP BY T1.SchoolName
SELECT T1.SchoolName FROM School AS T1 JOIN Enrollment AS T2 ON T1.schoolid = T2.schoolid WHERE T1.DOC = 31 AND T1.K_12 = 'Yes' GROUP BY T1.SchoolName ORDER BY SUM(T2.Enrollment) DESC LIMIT 1;
SELECT COUNT(*) / 12 FROM school WHERE County = 'Alameda' AND DOC = 52 AND OpenYr = 1980 GROUP BY MONTH(OpenDate)
SELECT CAST(SUM(CASE WHEN T1.DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.DOC = 52 THEN 1 ELSE 0 END) FROM SchoolDistricts AS T1 JOIN Schools AS T2 ON T1.SchoolDistrictID = T2.SchoolDistrictID WHERE T1.County = 'Orange County' AND T1.Status = 'Merged'
SELECT T1.CountyName, T2.SchoolName, T2.ClosureDate  FROM County AS T1  JOIN School AS T2 ON T1.CountyID = T2.CountyID  WHERE T2.StatusType = 'Closed'  GROUP BY T1.CountyName  ORDER BY COUNT(T2.SchoolID) DESC  LIMIT 1;
SELECT T1.SchMailingStreet, T1.SchName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchID = T2.School WHERE T2.TestType = 'Math' ORDER BY T2.AverageScore DESC LIMIT 6,1
SELECT T1.MailingStreetAddress, T1.SchoolName FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Subject = 'Reading' GROUP BY T1.SchoolID ORDER BY AVG(T2.AverageScore) ASC LIMIT 1
SELECT COUNT(*) FROM schools WHERE MailingCity = 'Lakeport' AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500
SELECT COUNT(*) FROM TestTakers WHERE SchoolCity = 'Fresno'
SELECT SchoolName, MailingZipCode FROM Schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' OR AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian' OR AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian';
SELECT COUNT(CASE WHEN County = 'Colusa' THEN 1 ELSE NULL END) / COUNT(CASE WHEN County = 'Humboldt' THEN 1 ELSE NULL END) AS Ratio  FROM Schools  WHERE MailingStateAddress = 'California'
SELECT COUNT(*) FROM schools WHERE MailingState = 'CA' AND City = 'San Joaquin' AND Status = 'Active'
SELECT T1.PhoneNumber ,  T1.Extension FROM Schools AS T1 JOIN TestScores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.TestType = 'Writing' ORDER BY AVG(T2.Score) DESC LIMIT 333 - 1;
SELECT T1.SchPhoneNum , T1.SchExt FROM Schools AS T1 JOIN SchoolAdmins AS T2 ON T1.SchID = T2.SchID WHERE T1.SchZipCode = '95203-3704'
SELECT T1.Website FROM School AS T1 JOIN Administrator AS T2 ON T1.AdminID = T2.AdminID WHERE T2.FName = 'Mike' AND T2.LName = 'Larson' INTERSECT SELECT T1.Website FROM School AS T1 JOIN Administrator AS T2 ON T1.AdminID = T2.AdminID WHERE T2.FName = 'Dante' AND T2.LName = 'Alvarez'
SELECT T1.WebSite FROM Schools AS T1 JOIN SchoolCalendar AS T2 ON T1.SchoolID = T2.SchoolID WHERE T2.Virtual = 'P' AND T1.County = 'San Joaquin' AND T1.Charter = 1
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND Charter = 1 AND DOC = 52
SELECT COUNT(*) FROM Schools WHERE CountyName = 'Los Angeles' AND Charter = 0 AND ((`Free Meal Count (K-12)` * 100) / `Enrollment (K-12)`) < 0.18;
SELECT T2.AdmFName1, T2.AdmLName1, T1.SchoolName, T1.City FROM schools AS T1 JOIN administrators AS T2 ON T1.AdminID = T2.AdminID WHERE T1.Charter = '00D2' AND T1.SchoolType = 'Charter'
SELECT COUNT(*) FROM Schools WHERE MailingCity = 'Hickman' AND CharterNumber = '00D4'
SELECT CAST(SUM(CASE WHEN FundingSource = 'Local' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100  FROM Schools  WHERE County = 'Santa Clara' AND CharterSchool = 'Yes';
SELECT COUNT(*) FROM Schools WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND LastUpdate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT SUM(CASE WHEN AdmFName1 = 'None' AND YEAR(LastUpdate) = 1989 AND City = 'San Francisco' THEN 1 ELSE 0 END) AS Total_Closure FROM Schools WHERE Type = 'Community College District';   Note: This SQL query assumes that the absence of an administrator (AdmFName1 being None) indicates a closure. However, this might not be accurate as there could be other reasons for an administrator's name to be missing. A more reliable method would involve having a specific column indicating school closures.
SELECT T2.County FROM Schools AS T1 JOIN Districts AS T2 ON T1.DistrictID = T2.DistrictID WHERE T1.SchYrCode BETWEEN 1980 AND 1989 AND T1.SchOwnershipCode = 11 GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1
SELECT NCES_District_ID FROM table_name WHERE SOC = 31;
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND Status = 'Active' OR Status = 'Closed' AND School_Type = 'District Community Day School'
SELECT DistrictCode FROM Schools WHERE City = 'Fresno' AND Magnet = 0;
SELECT COUNT(*) FROM Students WHERE Age BETWEEN 5 AND 17 AND SchoolYear = '2014-2015' AND EdOpsCode = 'SSS' AND City = 'Fremont'
SELECT SUM(Free_Reduced_Meal_Count_5_17) FROM School WHERE School_Name = 'Youth Authority School' AND Mailing_Street_Address = 'PO Box 1040'
SELECT MIN(Grade) FROM Schools WHERE EdOpsCode = 'SPECON' AND NCESDistID = 0613360;
SELECT T1.SchoolName, T1.EducationalLevelName FROM Schools AS T1 JOIN SchoolBreakfastProgram AS T2 ON T1.school_id = T2.school_id WHERE T2.BreakfastProvision = '2' AND T1.CountyCode = '37'
SELECT T1.CityLocation FROM School AS T1 JOIN SchoolLunchProvision AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.EILCode = 'HS' AND T2.LunchProvision = 2 AND T1.LowGrade = 9 AND T1.HighGrade = 12 AND T1.County = 'Merced'
SELECT SchoolName, (FRPMCount_5_17 / Enrollment_5_17) * 100 AS Percent_Eligible_FRPM FROM Schools WHERE County = 'Los Angeles' AND GradeSpan = 'KG-9'
SELECT GradeSpanType, COUNT(*) AS Frequency FROM Schools WHERE City = 'Adelanto' GROUP BY GradeSpanType ORDER BY Frequency DESC LIMIT 1;
SELECT T1.CountyName, COUNT(*) AS SchoolCount FROM County AS T1 JOIN School AS T2 ON T1.CountyID = T2.CountyID WHERE (T1.CountyName = 'San Diego' OR T1.CountyName = 'Santa Barbara') AND T2.Virtual = 'F' GROUP BY T1.CountyName ORDER BY SchoolCount DESC LIMIT 1;
SELECT SchoolName, Latitude FROM Schools ORDER BY Latitude DESC LIMIT 1;
SELECT T1.City, T2.SchoolName, T2.LowGrade FROM Schools AS T1 JOIN SchoolDetails AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.State = 'CA' ORDER BY T1.Latitude ASC LIMIT 1;
SELECT T2.GradesSpan FROM Schools AS T1 JOIN SchoolDetails AS T2 ON T1.SchoolID = T2.SchoolID WHERE ABS(T1.Longitude) = (SELECT MAX(ABS(Longitude)) FROM Schools)
SELECT T2.City, COUNT(*) AS School_Count FROM Schools AS T1 JOIN Addresses AS T2 ON T1.Address_ID = T2.Address_ID WHERE T1.Magnet = 1 AND T1.Grade_Span = 'K-8' AND T1.NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY T2.City;
SELECT AdmFName1, COUNT(AdmFName1) AS NameCount, AdmLName1 FROM table_name GROUP BY AdmFName1, AdmLName1 ORDER BY NameCount DESC LIMIT 2;
SELECT T1.DistrictCode ,  (T1.`Free Meal Count (K-12)` / T1.`Enrollment (K-12)`) * 100 AS Percent_Eligible_Free_K_12 FROM `school_info` AS T1 JOIN `admin_info` AS T2 ON T1.DistrictCode = T2.DistrictCode WHERE T2.AdmFName1 = 'Alusine'
SELECT T1.AdmLName1, T2.District, T2.County, T2.SchoolName FROM SchoolAdmin AS T1 JOIN Schools AS T2 ON T1.SchID = T2.SchID WHERE T2.Charter = 40;
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail2 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54) UNION SELECT AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)
SELECT AdmEmail1 FROM table_name WHERE SchoolID = (SELECT SchoolID FROM SAT_Scores GROUP BY SchoolID ORDER BY SUM(SAT_Score) >= 1500 AND COUNT(*) DESC LIMIT 1);   -- Note: The above SQL is incomplete and assumes the existence of a table named 'table_name' which contains the administrator's email address, and another table named 'SAT_Scores' that has records for each test taker with their SAT scores. The actual SQL would depend on the exact schema of the database being used.
SELECT COUNT(*) FROM `account` WHERE `frequency` = 'POPLATEK PO OBRATU' AND `district_id` IN (SELECT district_id FROM A3 WHERE region = 'East Bohemia')
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM client WHERE district_id IN (SELECT district_id FROM A3 WHERE city = 'Prague')) AND frequency = 'POPLATEK MESICNE'
SELECT      CASE          WHEN AVG(CASE WHEN date BETWEEN '1995-01-01' AND '1995-12-31' THEN frequency ELSE NULL END) >             AVG(CASE WHEN date BETWEEN '1996-01-01' AND '1996-12-31' THEN frequency ELSE NULL END) THEN '1995'         ELSE '1996'     END AS higher_unemployment_year FROM account
SELECT COUNT(*) FROM (SELECT district_id FROM client WHERE gender = 'F' GROUP BY district_id HAVING AVG(salary) BETWEEN 6000 AND 10000) AS T
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM account WHERE district_id IN (SELECT district_id FROM branch WHERE A3 = 'North Bohemia')) AND client_id IN (SELECT client_id FROM salary WHERE average_salary > 8000)
SELECT T3.account_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN transaction AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' GROUP BY T3.account_id ORDER BY AVG(T3.amount) ASC, MIN(T1.birth_date) DESC LIMIT 1; SELECT MAX(AVG(amount)) - MIN(AVG(amount)) FROM transaction GROUP BY account_id;
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.birth_date = (SELECT MIN(`birth_date`) FROM `client`) AND T1.client_id IN (SELECT client_id FROM(SELECT client_id, AVG(salary) as A11 FROM(SELECT T3.client_id, T4.salary FROM(SELECT client_id, account_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id GROUP BY client_id) AS T3 JOIN(SELECT client_id, salary FROM(SELECT client_id, amount AS salary FROM `order` WHERE k_symbol = 'POPLATEK MESICNE') AS T4 GROUP BY client_id) AS T4 ON T3.client_id = T4.client_id) GROUP BY client_id ORDER BY A11 DESC LIMIT 1))
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND account_id IN (SELECT account_id FROM client WHERE gender = 'F')
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.frequency = 'POPLATEK PO OBRATU'
SELECT T2.account_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'UVER' AND strftime('%Y', T2.date) = '1997' AND T2.frequency = 'POPLATEK TYDNE' ORDER BY T1.amount ASC LIMIT 1
SELECT a.account_id FROM account AS a JOIN order AS o ON a.account_id = o.account_id WHERE o.k_symbol = 'UVER' AND DATEDIFF(o.date, STR_TO_DATE('1993MMDD', '%YMMDD')) > 12 * 30 GROUP BY a.account_id ORDER BY SUM(o.amount) DESC LIMIT 1
SELECT COUNT(*) FROM client WHERE gender = 'F' AND birth_date < '1950-01-01' AND district_id IN (SELECT district_id FROM account WHERE district_id = (SELECT district_id FROM account WHERE A2 = 'Sokolov'))
SELECT T2.account_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1995%' ORDER BY T1.order_date ASC LIMIT 1
SELECT T2.account_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y',T2.date) < '1997' AND T1.amount > 3000
SELECT T2.client_id FROM card AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.date = '1994-03-03'
SELECT T2.date FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 840 AND T1.order_date = '1998-10-14'
SELECT T3.district_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.k_symbol = 'UVER' AND T2.date = '1994-08-25'
SELECT MAX(T3.amount) FROM card AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN `order` AS T3 ON T2.account_id = T3.account_id WHERE T1.date = '1996-10-21'
SELECT T3.gender FROM branch AS T1 JOIN account AS T2 ON T1.branch_id = T2.district_id JOIN client AS T3 ON T3.client_id = T2.account_id WHERE T3.birth_date = (SELECT MIN(T4.birth_date) FROM client AS T4 JOIN account AS T5 ON T4.client_id = T5.account_id JOIN branch AS T6 ON T5.district_id = T6.branch_id GROUP BY T6.A11 ORDER BY AVG(T6.A11) DESC LIMIT 1)
SELECT T3.amount FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id JOIN order AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = (SELECT client_id FROM loan WHERE amount = (SELECT MAX(amount) FROM loan)) AND T3.date > T2.date ORDER BY T3.date LIMIT 1
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM branch WHERE name = 'Jesenik')
SELECT T3.client_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T1.amount = 5100 AND STRFTIME('%Y%m%d', T1.date) = '19980902'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE city = 'Litomerice') AND date BETWEEN '1996-01-01' AND '1996-12-31'
SELECT T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T3.birth_date FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03'
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.district_id IN (SELECT district_id FROM district WHERE city = 'Prague') ORDER BY T2.date LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM client AS T2 JOIN branch AS T1 ON T1.district_id = T2.district_id WHERE T1.region_name = 'A3' AND T1.inhabitants = (SELECT MAX(inhabitants) FROM branch WHERE region_name = 'A3')
SELECT ((SELECT SUM(T3.amount) FROM `order` AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id JOIN account AS T3 ON T1.account_id = T3.account_id WHERE T3.date BETWEEN '1993-03-22' AND '1998-12-27') - (SELECT SUM(T3.amount) FROM `order` AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id JOIN account AS T3 ON T1.account_id = T3.account_id WHERE T3.date <= '1993-03-22')) / (SELECT SUM(T3.amount) FROM `order` AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id JOIN account AS T3 ON T1.account_id = T3.account_id WHERE T3.date <= '1993-03-22') * 100.0 FROM `order` JOIN client ON `order`.account_id = client.client_id WHERE `order`.date = '1993-07-05' AND `order`.k_symbol = 'UVER'
SELECT SUM(CASE WHEN T2.status = 'A' THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.order_id) FROM orders AS T1 JOIN loans AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'UVER'
SELECT CAST(SUM(CASE WHEN T2.amount < 100000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'UVER' AND T1.frequency = 'POPLATEK MESICNE' AND T1.date <= DATE('now') - 365 * 5 AND T2.amount < 100000 AND T1.district_id IN(SELECT district_id FROM client WHERE gender = 'F' AND birth_date BETWEEN DATE('1940-01-01') AND DATE('1970-12-31')) GROUP BY T1.frequency HAVING SUM(CASE WHEN T2.amount < 100000 THEN 1 ELSE 0 END) / COUNT(T1.account_id) * 100 > 80
SELECT T1.account_id, T2.district_name, T2.region  FROM account AS T1  JOIN district AS T2 ON T1.district_id = T2.district_id  WHERE T1.date LIKE '1993%' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T2.account_id ,  T2.frequency FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.district_id IN (SELECT district_id FROM district WHERE name = 'east Bohemia') AND strftime('%Y', T2.date) BETWEEN '1995' AND '2000'
SELECT T1.account_id ,  T1.date FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T1.district ,  T2.region FROM district AS T1 JOIN region AS T2 ON T1.region_id = T2.region_id WHERE T1.district_id IN (SELECT T3.district_id FROM account AS T3 JOIN order AS T4 ON T3.account_id = T4.account_id WHERE T4.order_id = '4990')
SELECT T1.account_id ,  T2.district_name ,  T3.region_name FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000 AND T1.k_symbol = 'UVER'
SELECT T2.loan_id ,  T3.district ,  T3.A11 FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.duration = 60
SELECT T4.district_id ,  (T4.A13 - T4.A12) / T4.A12 * 100 FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.k_symbol = 'UVER' AND T1.status = 'D' AND T1.date BETWEEN '1995-01-01' AND '1995-12-31' GROUP BY T4.district_id
SELECT CAST(SUM(IIF(T3.district = 'Decin', 1, 0)) AS REAL) * 100 / COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE strftime('%Y', T1.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T3.district_id FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.gender = 'F' GROUP BY T3.district_id ORDER BY COUNT(T1.account_id) DESC LIMIT 9
SELECT T3.A2, SUM(T1.amount) AS total_amount  FROM transaction AS T1  JOIN account AS T2 ON T1.account_id = T2.account_id  JOIN district AS T3 ON T2.district_id = T3.D1  WHERE T1.type = 'VYDAJ' AND T1.date LIKE '1996-01%'  GROUP BY T3.A2  ORDER BY total_amount DESC  LIMIT 10;
SELECT COUNT(*) FROM account AS T1 JOIN client AS T2 ON T1.client_id  =  T2.client_id WHERE T2.district_id NOT IN (SELECT district_id FROM card) AND T2.district_id IN (SELECT district_id FROM district AS T3 WHERE T3.region  =  'South Bohemia')
SELECT T2.district_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.k_symbol = 'UVER' AND (T1.amount > (SELECT AVG(amount) FROM order WHERE k_symbol = 'UVER') OR T2.frequency = 'POPLATEK MESICNE') GROUP BY T2.district_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T2.amount) FROM client AS T1 JOIN order AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M' AND T2.k_symbol = 'UVER'
SELECT T1.A2, T1.A1 FROM district AS T1 JOIN (     SELECT district_id, MAX(unemployment_rate_1996) as max_unemp     FROM (         SELECT A13 as unemployment_rate_1996, A1 as district_id         FROM district     )      GROUP BY district_id ) AS T2 ON T1.A1 = T2.district_id WHERE T2.max_unemp = T2.unemployment_rate_1996
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM branch WHERE A16 = (SELECT MAX(A16) FROM branch)) AND date BETWEEN '1996-01-01' AND '1996-12-31'
SELECT COUNT(*) FROM ( SELECT T1.account_id FROM `account` AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK MESICNE' AND T2.amount < 0 AND T2.k_symbol = 'VYBER KARTOU' GROUP BY T1.account_id HAVING SUM(T2.amount) < 0 ) AS T3
SELECT COUNT(*) FROM ( (SELECT * FROM `table_name` WHERE date BETWEEN '1995-01-01' AND '1997-12-31') AS T1  JOIN (SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE') AS T2 ON T1.account_id = T2.account_id WHERE amount >= 250000 AND k_symbol = 'UVER' ) AS FinalTable
SELECT COUNT(*) FROM account WHERE district_id = 1 AND frequency IN ('POPLATEK MESICNE', 'POPLATEK TYDNE', 'POPLATEK PO OBRATU')
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM account WHERE date LIKE '1995%' GROUP BY district_id ORDER BY SUM(A15) DESC LIMIT 1 OFFSET 1)
SELECT COUNT(*) FROM card WHERE card_type_code = 'GOLD' AND card_disposition_code = 'OWNER'
SELECT COUNT(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Pisek')
SELECT T3.district_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.amount > 10000 AND strftime('%Y', T1.date) = '1997' GROUP BY T3.district_id
SELECT T1.account_id FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T2.k_symbol = 'SIPO' AND T1.district_id = (SELECT district_id FROM client WHERE city = 'Pisek')
SELECT T1.account_id FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id WHERE T2.card_type_code = 'GOLD'
SELECT AVG(T3.amount) FROM ( (SELECT T1.client_id, COUNT(*) AS cnt FROM client AS T1  JOIN account AS T2 ON T1.client_id = T2.client_id  JOIN operation AS T3 ON T2.account_id = T3.account_id  WHERE T3.operation = 'VYBER KARTOU' AND strftime('%Y', T3.date) = '2021') AS T1 JOIN ( SELECT T2.client_id, COUNT(*) AS cnt FROM client AS T1  JOIN account AS T2 ON T1.client_id = T2.client_id  JOIN operation AS T3 ON T2.account_id = T3.account_id  WHERE strftime('%Y', T3.date) = '2021' GROUP BY T2.client_id) AS T2 ON T1.client_id = T2.client_id WHERE T1.cnt < T2.cnt) AS T3 JOIN operation AS T4 ON T3.client_id = T4.client_id  WHERE T4.operation = 'VYBER KARTOU' AND strftime('%Y', T4.date) = '2021')
SELECT T2.client_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount < (SELECT AVG(amount) FROM `order`) AND T1.k_symbol = 'VYBER KARTOU' AND strftime('%Y', T1.date) = '1998'
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' AND T2.frequency IN ('KREDITKA', 'POJISTNE') GROUP BY T1.client_id HAVING COUNT(*) > 1
SELECT COUNT(*) FROM client WHERE gender = 'F' AND district_id IN (SELECT district_id FROM account WHERE district_id IN (SELECT district_id FROM branch WHERE region = 'South Bohemia'))
SELECT T1.A3 FROM account AS T1 JOIN district AS T2 ON T1.A2 = T2.DistrictID WHERE T2.DistrictName = 'Tabor' AND T1.A4 = 'OWNER'
SELECT T2.account_type FROM client AS T1 JOIN account AS T2 ON T1.district_id  =  T2.district_id WHERE T2.frequency NOT IN('LOAN') AND T1.income BETWEEN 8000 AND 9000 GROUP BY T2.account_type HAVING AVG(T1.income) > 8000 AND AVG(T1.income) <= 9000
SELECT COUNT(*) FROM account AS T1 JOIN order AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id IN (SELECT district_id FROM A3 WHERE region_name = 'North Bohemia') AND T2.bank_to = 'AB'
SELECT T3.A2 FROM `transaction` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2
SELECT AVG(A15) FROM (     SELECT T2.A15      FROM account AS T1      JOIN (         SELECT district_id, AVG(`number_of_crimes_1995`) AS A15          FROM region          GROUP BY district_id     ) AS T2 ON T1.district_id = T2.district_id      WHERE STRFTIME('%Y', T1.date) >= '1997'      AND (         SELECT COUNT(*)          FROM transaction          WHERE transaction.account_id IN (             SELECT account_id              FROM account              WHERE district_id = T2.district_id         )          GROUP BY district_id     ) > 4000 ) AS T3
SELECT COUNT(*) FROM card WHERE card_type  =  'CLASSIC' AND account_id IN (SELECT account_id FROM account WHERE account_type  =  'OWNER')
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM district WHERE city = 'Hl.m. Praha')
SELECT CAST(SUM(CASE WHEN T2.date < '1997-12-31' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN ( SELECT account_id, STRFTIME('%Y', date) AS date FROM order ) AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK MESICNE' AND STRFTIME('%Y', T2.date) < '1998'
SELECT T3.client_id FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T3.district_id = T2.district_id WHERE T1.k_symbol = 'UVER' ORDER BY T1.amount DESC LIMIT 1
SELECT COUNT(*)  FROM order o JOIN account a ON o.account_id = a.account_id WHERE a.district_id IN (     SELECT district_id      FROM client c     WHERE c.district_id = (         SELECT district_id          FROM account          WHERE account_id = 532     ) ) AND strftime('%Y', date(o.date)) = '1995'; 
SELECT T2.district_id FROM `order` AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333;
SELECT T2.amount FROM transaction AS T1 JOIN order AS T2 ON T1.transaction_id  =  T2.order_id WHERE T1.client_id  =  3356 AND T1.operation  =  'VYBER'
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND account_id IN (SELECT account_id FROM order WHERE amount < 200000)
SELECT T2.card_type FROM client AS T1 JOIN credit_card AS T2 ON T1.client_id = T2.client_id WHERE T1.client_id = 13539
SELECT T2.A3 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.client_id = 3541
SELECT T3.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id  =  T2.account_id JOIN district AS T3 ON T2.district_id  =  T3.district_id WHERE T1.status  =  'A' GROUP BY T3.district_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.client_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id JOIN order AS T3 ON T2.account_id = T3.account_id WHERE T3.order_id = 32423
SELECT T2.order_id FROM account AS T1 JOIN `order` AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE city = 'Jesenik')
SELECT T2.client_id FROM card AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.card_type_code = 'JUNIOR' AND T2.date >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN T3.gender  =  'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.client_id) FROM (SELECT district_id ,  AVG(salary) AS avg_salary FROM account GROUP BY district_id HAVING AVG(salary) > 10000) AS T1 JOIN client AS T2 ON T1.district_id  =  T2.district_id JOIN (SELECT account_id ,  T4.client_id FROM order AS T5 JOIN account AS T4 ON T5.account_id  =  T4.account_id GROUP BY T4.client_id) AS T3 ON T2.client_id  =  T3.client_id
SELECT ((SELECT SUM(t1.amount) FROM (SELECT t3.amount FROM (SELECT t2.account_id, t2.amount FROM (SELECT account_id, amount FROM bank WHERE date LIKE '1997%') AS t1 JOIN (SELECT account_id, gender FROM client WHERE district_id = 18 AND gender = 'M') AS t2 ON t1.account_id = t2.account_id) AS t3 GROUP BY t3.account_id) AS t4) - (SELECT SUM(t5.amount) FROM (SELECT t7.amount FROM (SELECT t6.account_id, t6.amount FROM (SELECT account_id, amount FROM bank WHERE date LIKE '1996%') AS t5 JOIN (SELECT account_id, gender FROM client WHERE district_id = 18 AND gender = 'M') AS t6 ON t5.account_id = t6.account_id) AS t7 GROUP BY t7.account_id) AS t8)) / (SELECT SUM(t5.amount) FROM (SELECT t7.amount FROM (SELECT t6.account_id, t6.amount FROM (SELECT account_id, amount FROM bank WHERE date LIKE '1996%') AS t5 JOIN (SELECT account_id, gender FROM client WHERE district_id = 18 AND gender = 'M') AS t6 ON t5.account_id = t6.account_id) AS t7 GROUP BY t7.account_id) AS t8) * 100
SELECT COUNT(*) FROM operation WHERE operation_description  =  'VYBER KARTOU' AND date > '1995-01-01'
SELECT (SELECT SUM(A16) FROM crime WHERE A3 = 'North Bohemia') - (SELECT SUM(A16) FROM crime WHERE A3 = 'East Bohemia') AS difference
SELECT COUNT(*) FROM account WHERE account_id BETWEEN 1 AND 10 AND frequency IN ('POPLATEK MESICNE', 'POPLATEK TYDNE')
SELECT T2.frequency ,  T1.k_symbol FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 3539 AND T2.account_id = 3
SELECT EXTRACT(YEAR FROM birth_date) AS birth_year FROM client WHERE client_id = 130;
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK PO OBRATU'
SELECT SUM(t1.amount) FROM order AS t1 JOIN account AS t2 ON t1.account_id = t2.account_id JOIN client AS t3 ON t2.client_id = t3.client_id WHERE t3.client_id = 992 AND t1.k_symbol IN ('SIPO', 'UVER', 'LEASING')
SELECT SUM(T2.amount), T3.gender FROM order AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.order_id = 851 AND T3.client_id = 4 GROUP BY T3.gender
SELECT T2.card_type_code FROM client AS T1 JOIN credit_card AS T2 ON T1.client_id = T2.client_id WHERE T1.client_id = 9
SELECT SUM(T2.amount) FROM order AS T1 JOIN transaction AS T2 ON T1.order_id = T2.order_id WHERE T1.client_id = 617 AND strftime('%Y', T2.date) = '1998'
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND T1.district_id IN (SELECT district_id FROM branch WHERE city = 'East Bohemia')
SELECT T1.client_id FROM client AS T1 JOIN loan AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' ORDER BY amount DESC LIMIT 3
SELECT COUNT(*) FROM client c JOIN order o ON c.client_id = o.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND o.k_symbol = 'SIPO' AND o.amount > 4000;
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE city = 'Beroun') AND date > '1996-01-01'
SELECT COUNT(*) FROM client WHERE client_id IN (SELECT client_id FROM card WHERE card_type = 'JUNIOR') AND gender = 'F'
SELECT CAST(SUM(CASE WHEN T2.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.client_id) FROM account AS T1 JOIN client AS T2 ON T1.account_id IN (SELECT account_id FROM transaction WHERE district_id = 'A3') AND T2.district_id = 'A3';
SELECT (COUNT(T2.client_id) * 100 / COUNT(T1.account_id)) FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.gender = 'M'
SELECT COUNT(*) FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND c.gender = 'M'
SELECT T2.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.months > 24 AND T2.date < '1997-01-01' ORDER BY T1.amount ASC LIMIT 1
SELECT T3.account_number FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN ( SELECT account_id ,  AVG(salary) AS avg_salary FROM A11 GROUP BY account_id ) AS T4 ON T2.account_id = T4.account_id WHERE T1.gender = 'F' ORDER BY T1.birth_date ,  T4.avg_salary LIMIT 1
SELECT COUNT(*) FROM client WHERE birth_date LIKE '1920%' AND district_id IN (SELECT district_id FROM district WHERE region = 'east bohemia')
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK TYDNE' AND date LIKE '%24' AND district_id IN (SELECT district_id FROM client WHERE gender = 'M') AND account_id IN (SELECT account_id FROM order WHERE k_symbol = 'UVER')
SELECT AVG(T1.amount) FROM transactions AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK PO OBRATU' AND EXISTS(SELECT * FROM contract AS T3 WHERE T1.account_id = T3.account_id AND (T3.status = 'C' OR T3.status = 'D'))
SELECT T1.client_id, T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T2.frequency = 'POPLATEK MESICNE' OR T2.frequency = 'POPLATEK PO OBRATU'
SELECT T1.client_id, (YEAR(CURDATE()) - YEAR(T1.birth_date)) AS age FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id JOIN card AS T3 ON T2.account_id = T3.account_id JOIN disposition AS T4 ON T1.client_id = T4.client_id WHERE T3.type = 'gold' AND T4.type = 'OWNER'
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id GROUP BY T2.bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl'
SELECT AVG(T1.element) AS avg_oxygen FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '-' GROUP BY T3.molecule_id
SELECT AVG(single_bond_count)  FROM (     SELECT COUNT(*) AS single_bond_count      FROM bond      WHERE bond_type = '-' AND molecule_id IN (         SELECT molecule_id          FROM molecule          WHERE label = '+'     )     GROUP BY molecule_id ) as single_bonded_molecules;
SELECT COUNT(*) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'na' AND m.label = '-'
SELECT T2.molecule_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '+' GROUP BY T2.molecule_id HAVING COUNT(*) >= 3
SELECT CAST(COUNT(T3.atom_id) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.element = 'c' AND T2.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' GROUP BY T1.molecule_id
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9' GROUP BY T1.element
SELECT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T1.atom_id OR T3.atom_id = T1.atom_id2 WHERE T2.bond_type = '=' GROUP BY T3.element
SELECT T3.label, COUNT(T3.label) AS num_labels FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h' GROUP BY T3.label ORDER BY num_labels DESC LIMIT 1
SELECT T2.bond_type FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' GROUP BY T2.bond_type
SELECT T1.atom_id, T2.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-'
SELECT T1.atom_id, T3.atom_id2 FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') AND T3.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-')
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' GROUP BY T1.element ORDER BY COUNT(T1.element) ASC LIMIT 1
SELECT T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE (T2.atom_id = 'TR004_8' AND T2.atom_id2 = 'TR004_20') OR (T2.atom_id = 'TR004_20' AND T2.atom_id2 = 'TR004_8')
SELECT T1.label FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element != 'sn' GROUP BY T1.label HAVING COUNT(*) > 0
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2  JOIN bond b ON c.bond_id = b.bond_id  WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-'
SELECT T1.atom_id, T2.atom_id2  FROM connected AS T1  JOIN bond AS T2 ON T1.bond_id = T2.bond_id  WHERE T2.bond_type = '#'
SELECT T3.atom_id FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id2 = T3.atom_id WHERE T3.molecule_id = 'TR181' UNION SELECT T3.atom_id FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T3.molecule_id = 'TR181'
SELECT CAST(SUM(CASE WHEN a.element != 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR000' ORDER BY T1.element ASC LIMIT 3;
SELECT T1.atom_id, T2.atom_id2 FROM connected AS T1 WHERE T1.bond_id = 'TR001_2_6' AND T1.atom_id IN (SELECT atom.atom_id FROM atom WHERE atom.molecule_id = 'TR001') AND T1.atom_id2 IN (SELECT atom.atom_id FROM atom WHERE atom.molecule_id = 'TR001')
SELECT ABS((SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-')) AS difference;
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY T1.molecule_id ASC LIMIT 5;
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '=' THEN 1 ELSE NULL END) AS REAL) / COUNT(T1.bond_id) * 100 AS percent FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR008' GROUP BY T2.molecule_id;
SELECT ROUND(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) * 100 / COUNT(T1.molecule_id), 3) AS percent FROM molecule AS T1
SELECT CAST(COUNT(CASE WHEN T1.element = 'h' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 WHERE T1.molecule_id = 'TR206' GROUP BY T1.molecule_id;
SELECT T2.bond_type FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR000' GROUP BY T2.bond_type
SELECT T1.element, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'
SELECT T2.bond_type, T3.label FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.molecule_id = 'TR010' GROUP BY T2.bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.molecule_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-' ORDER BY T2.molecule_id ASC LIMIT 3
SELECT T2.bond_id FROM `molecule` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' ORDER BY T2.bond_id LIMIT 2
SELECT COUNT(*) FROM connected WHERE (atom_id = 'TR009_12' OR atom_id2 = 'TR009_12') AND bond_id IN (SELECT bond_id FROM bond WHERE molecule_id = 'TR009')
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T3.label = '+' AND T1.element = 'br'
SELECT T2.bond_type, T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'
SELECT T.molecule_id, M.label FROM atom AS T JOIN molecule AS M ON T.molecule_id = M.molecule_id WHERE T.atom_id = 'TR001_10'
SELECT COUNT(DISTINCT T2.molecule_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#'
SELECT COUNT(*) FROM connected WHERE atom_id = 'TR%_19' OR atom_id2 = 'TR%_19'
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT T.molecule_id FROM (     SELECT DISTINCT atom_id, molecule_id      FROM atom      WHERE SUBSTR(atom_id, 7, 2) BETWEEN '21' AND '25' ) AS A JOIN molecule AS M ON A.molecule_id = M.molecule_id WHERE M.label = '+'
SELECT T2.bond_id FROM `atom` AS T1 JOIN `connected` AS T3 ON T1.atom_id = T3.atom_id OR T1.atom_id = T3.atom_id2 JOIN `bond` AS T2 ON T2.bond_id = T3.bond_id WHERE T1.element = 'p' AND (SELECT element FROM `atom` WHERE atom_id = T3.atom_id2) = 'n' UNION SELECT T2.bond_id FROM `atom` AS T1 JOIN `connected` AS T3 ON T1.atom_id = T3.atom_id OR T1.atom_id = T3.atom_id2 JOIN `bond` AS T2 ON T2.bond_id = T3.bond_id WHERE (SELECT element FROM `atom` WHERE atom_id = T3.atom_id) = 'p' AND T1.element = 'n'
SELECT T1.label FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT AVG(T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'i' GROUP BY T1.atom_id
SELECT T1.bond_id, T1.bond_type FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE SUBSTR(T2.atom_id2, 7, 2) + 0 = 45 OR SUBSTR(T2.atom_id, 7, 2) + 0 = 45
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id NOT IN (SELECT T2.atom_id FROM connected AS T2) AND T1.atom_id NOT IN (SELECT T3.atom_id2 FROM connected AS T3)
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T3.atom_id  =  T2.atom_id2 WHERE T1.bond_type  =  '# ' AND T3.molecule_id  =  'TR041' UNION SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T3.atom_id  =  T2.atom_id WHERE T1.bond_type  =  '# ' AND T3.molecule_id  =  'TR041'
SELECT T3.element FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T3.atom_id = T2.atom_id WHERE T1.bond_id = 'TR144_8_19'
SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T2.bond_id) DESC LIMIT 1
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'pb') AND T1.atom_id != (SELECT atom_id FROM atom WHERE element = 'pb') GROUP BY T1.atom_id2 HAVING COUNT(*) > 1
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T2.atom_id  =  T3.atom_id WHERE T1.bond_type  =  '#'  UNION  SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id  =  T2.bond_id JOIN atom AS T3 ON T2.atom_id2  =  T3.atom_id WHERE T1.bond_type  =  '#'
SELECT CAST(SUM(CASE WHEN a1.element = max_el THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)  FROM (     SELECT c.atom_id2, a.element      FROM connected c      JOIN atom a ON c.atom_id = a.atom_id      UNION ALL      SELECT c.atom_id, a.element      FROM connected c      JOIN atom a ON c.atom_id2 = a.atom_id ) subq  JOIN (     SELECT element, COUNT(*) as cnt      FROM (         SELECT c.atom_id2, a.element          FROM connected c          JOIN atom a ON c.atom_id = a.atom_id          UNION ALL          SELECT c.atom_id, a.element          FROM connected c          JOIN atom a ON c.atom_id2 = a.atom_id     ) subq2      GROUP BY element      ORDER BY cnt DESC      LIMIT 1 ) max_el ON subq.element = max_el.element  JOIN bond b ON b.bond_id = subq.atom_id2;
SELECT CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.bond_type = '-' GROUP BY T2.bond_type HAVING T2.bond_type = '-'
SELECT COUNT(*) FROM atom WHERE `element` IN('c', 'h')
SELECT T1.atom_id2 FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T2.element = 's'
SELECT T2.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'sn'
SELECT COUNT(DISTINCT T3.element) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '-'
SELECT COUNT(*)  FROM atom  JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2  JOIN bond ON connected.bond_id = bond.bond_id  WHERE (atom.element = 'p' OR atom.element = 'br') AND bond.bond_type = '#'
SELECT T2.bond_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T2.molecule_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-'
SELECT CAST(COUNT(CASE WHEN a.element = 'cl' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'
SELECT T2.bond_type FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id  =  T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR001_10_11' UNION SELECT T4.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_id = 'TR001_10_11'
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'i'
SELECT T2.label, COUNT(*) AS count FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca' GROUP BY T2.label ORDER BY count DESC LIMIT 1;
SELECT COUNT(*) > 0 FROM (     SELECT a1.element AS element1, a2.element AS element2      FROM connected c      JOIN atom a1 ON c.atom_id = a1.atom_id      JOIN atom a2 ON c.atom_id2 = a2.atom_id      WHERE c.bond_id = 'TR001_1_8'  ) subquery  WHERE (element1 = 'cl' AND element2 = 'c') OR (element1 = 'c' AND element2 = 'cl')
SELECT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c' AND T3.bond_type = '#' AND T3.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') LIMIT 2
SELECT CAST(COUNT(T1.atom_id) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' AND T2.label = '+'
SELECT T1.element FROM atom AS T1 WHERE T1.molecule_id = 'TR001'
SELECT T1.molecule_id FROM `bond` AS T1 WHERE T1.bond_type = '='
SELECT T1.atom_id, T2.atom_id2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '#'
SELECT T3.element FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR000_1_2' UNION SELECT T4.element FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id JOIN `atom` AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM `bond` JOIN `molecule` ON `bond.molecule_id` = `molecule.molecule_id` WHERE `bond.bond_type` = '-' AND `molecule.label` = '-'
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT B.bond_id, M.label  FROM bond AS B  JOIN molecule AS M ON B.molecule_id = M.molecule_id  WHERE B.bond_type = '#';
SELECT T3.element, COUNT(*)  FROM molecule AS T1  JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.label = '+' AND SUBSTR(T2.atom_id, 7, 1) = '4'  GROUP BY T3.element;
SELECT T1.molecule_id ,  T1.label ,  SUM(CASE WHEN T2.element = 'h' THEN 1 ELSE 0 END) * 1.0 / COUNT(T2.atom_id) AS ratio FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006' GROUP BY T1.molecule_id ,  T1.label
SELECT T3.label FROM atom AS T1 JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'ca' AND T3.label = '+' GROUP BY T3.label
SELECT T2.bond_type FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' GROUP BY T2.bond_type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T3.element AS ElementOfAtom1, T4.element AS ElementOfAtom2  FROM bond AS T1  JOIN connected AS T2 ON T1.bond_id = T2.bond_id  JOIN atom AS T3 ON SUBSTR(T2.atom_id, 7, 2) = SUBSTR(T3.atom_id, 7, 2)  JOIN atom AS T4 ON SUBSTR(T2.atom_id2, 7, 2) = SUBSTR(T4.atom_id, 7, 2)  WHERE T1.bond_id = 'TR001_10_11';
SELECT COUNT(*) AS total_compounds,         SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) * 100 / COUNT(*) AS percentage_triple_bonds FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id;
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '=' THEN T1.bond_id ELSE NULL END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR047'
SELECT T3.label FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.atom_id = 'TR001_1'
SELECT T.label FROM molecule AS T WHERE T.molecule_id = 'TR151'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR151' GROUP BY T1.element;
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id LIKE 'TR%' AND SUBSTR(molecule_id, 3, 3) BETWEEN 10 AND 50 AND element = 'c'
SELECT COUNT(*)  FROM atom  WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT T1.bond_id FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '='
SELECT COUNT(*)  FROM atom  JOIN molecule ON atom.molecule_id = molecule.molecule_id  WHERE atom.element = 'h' AND molecule.label = '+'
SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T2.label = '+' AND T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.molecule_id) FROM atom AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN bond AS T3 ON T1.atom_id = SUBSTRING(T3.bond_id, 4, INSTR(SUBSTRING(T3.bond_id, 4), '_') - 1)
SELECT label FROM molecule WHERE molecule_id = 'TR124'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT T1.bond_type FROM `bond` AS T1 JOIN `connected` AS T2 ON T1.bond_id = T2.bond_id WHERE T2.atom_id = 'TR007_4' AND T2.atom_id2 = 'TR007_19'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_2_4'
SELECT COUNT(*), m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.molecule_id = 'TR006' GROUP BY m.label;
SELECT T1.molecule_id, T3.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id, T3.element
SELECT T2.bond_id, T1.atom_id, T1.atom_id2  FROM connected AS T1  JOIN bond AS T2 ON T1.bond_id = T2.bond_id  WHERE T2.bond_type = '-'
SELECT T3.molecule_id, GROUP_CONCAT(T1.element) as elements  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2  JOIN bond AS T4 ON T2.bond_id = T4.bond_id  WHERE T4.bond_type = '#'  GROUP BY T3.molecule_id;
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(*)  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  JOIN atom a1 ON c.atom_id = a1.atom_id  JOIN atom a2 ON c.atom_id2 = a2.atom_id  WHERE a1.element = 'cl' OR a2.element = 'cl';
SELECT T1.atom_id ,  COUNT(DISTINCT T3.bond_type) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id
SELECT COUNT(DISTINCT T2.molecule_id) AS total_molecules_with_double_bond,         (SELECT COUNT(DISTINCT T3.molecule_id)          FROM bond AS T1          JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id          WHERE T1.bond_type = '=' AND T3.label = '+') AS carcinogenic_molecules FROM bond AS T1  JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T1.bond_type = '=';
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element != 's' AND T3.bond_type != '=' GROUP BY T3.molecule_id HAVING COUNT(*) < 2
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001'
SELECT COUNT(*) FROM bond WHERE bond_type = '-'
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl' AND T1.label = '+' GROUP BY T1.molecule_id
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c' AND T1.label = '-' GROUP BY T1.molecule_id
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'cl'
SELECT T2.molecule_id FROM `bond` AS T1 JOIN `atom` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT T1.element) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_3_4'
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')
SELECT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id2 = 'TR000_4' AND T1.atom_id = 'TR000_2'
SELECT T1.element FROM atom AS T1 WHERE T1.atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '-' THEN 1 ELSE NULL END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id;
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+'
SELECT T1.molecule_id FROM `atom` AS T1 JOIN `bond` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 's' AND T2.bond_type = '=' GROUP BY T1.molecule_id HAVING COUNT(*) > 0
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T1.molecule_id) > 5
SELECT T1.element FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' AND T1.molecule_id = 'TR024' GROUP BY T1.element;
SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T4.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T4.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id JOIN molecule AS T4 ON T1.molecule_id = T4.molecule_id WHERE T1.element = 'h' AND T3.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '='
SELECT COUNT(*) FROM molecule  JOIN bond ON molecule.molecule_id = bond.molecule_id  WHERE bond.bond_type = '#' AND molecule.label = '-'
SELECT T3.element, T2.bond_type FROM molecule AS T1 JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id JOIN bond AS T2 ON T2.atom_id IN (T3.atom_id) WHERE T1.molecule_id = 'TR002'
SELECT T3.atom_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id2 WHERE T1.bond_type = '=' AND T3.element = 'c' AND T3.molecule_id = 'TR012'
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o'
SELECT uuid FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT * FROM cards WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL)
SELECT name FROM cards GROUP BY name ORDER BY MAX(faceConvertedManaCost) DESC;
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.frameVersion = '2015' AND l.format = 'commander' AND l.status = 'Legal' AND c.edhrecRank < 100;
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'Mythic' AND l.status = 'Banned' AND l.format = 'Gladiator'
SELECT L.status FROM legalities AS L JOIN ( SELECT uuid FROM cards WHERE types = 'Artifact' AND side IS NULL ) AS C ON L.uuid = C.uuid WHERE L.format = 'vintage'
SELECT c.uuid, c.artist FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal'
SELECT c.name, r.text, c.hasContentWarning FROM cards AS c JOIN rulings AS r ON c.uuid = r.cardId WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;
SELECT T2.text FROM set_cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT c.name, c.artist, c.isPromo FROM cards AS c JOIN rulings AS r ON c.uuid = r.cardId GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;
SELECT T1.language FROM card AS T1 JOIN names AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Annul' AND T1.number = '29'
SELECT cardname FROM sets_cards WHERE languages = 'Japanese'
SELECT (SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) / COUNT(id)) * 100 AS percentage FROM cards WHERE language = 'Chinese Simplified'
SELECT s.name, s.totalSetSize FROM sets AS s JOIN cards AS c ON s.code = c.set WHERE c.language = 'Italian' GROUP BY s.name, s.totalSetSize;
SELECT COUNT(DISTINCT T1.types) FROM cards AS T1 JOIN artists AS T2 ON T1.artist = T2.uuid WHERE T2.name = 'Aaron Boyd'
SELECT T1.keywords FROM cards AS T1 JOIN cardnames AS T2 ON T1.uuid = T2.uuid WHERE T2.name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE power = '*'
SELECT T1.promoTypes FROM cards AS T1 WHERE T1.name = 'Duress'
SELECT T1.border_color FROM cards AS T1 WHERE T1.name = 'Ancestor''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT T3.name FROM cards AS T1 JOIN sets_cards AS T2 ON T1.uuid = T2.card_uuid JOIN sets AS T3 ON T2.set_code = T3.code JOIN languages AS T4 ON T3.id = T4.set_id WHERE T1.name = 'Angel of Mercy' GROUP BY T4.language
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Restricted' AND T1.is_textless = 0;
SELECT rulings_text FROM cards WHERE name = 'Condemn' AND (rulings_text IS NOT NULL OR rulings_text != '')
SELECT COUNT(*) FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Restricted' AND T1.isStarter = 1
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT types FROM cards WHERE name = 'Benalish Knight'
SELECT T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T1.artist FROM cards AS T1 JOIN card_art_variations AS T2 ON T1.uuid = T2.card_uuid WHERE T1.language = 'Phyrexian' GROUP BY T1.artist
SELECT (COUNT(CASE WHEN borderColor = 'borderless' THEN id END) / COUNT(id)) * 100 AS percentage FROM cards WHERE borderColor = 'borderless'
SELECT COUNT(*) FROM cards WHERE lang = 'German' AND isReprint = 1;
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND languages LIKE '%Russian%'
SELECT COUNT(CASE WHEN T1.language = 'French' THEN 1 ELSE NULL END) * 100 / COUNT(T1.id) FROM cards AS T1 WHERE T1.isStorySpotlight = 1 AND T1.set = (SELECT DISTINCT set FROM legalities WHERE format = 'commander')
SELECT COUNT(*) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM cards WHERE "borderColor" = 'black' AND "availability" = 'mtgo'
SELECT uuid FROM cards WHERE convertedManaCost = 0;
SELECT T1.layout FROM cards AS T1 JOIN keywords AS T2 ON T1.uuid = T2.uuid WHERE T2.keyword = 'Flying'
SELECT COUNT(*) FROM cards WHERE types LIKE '%Summon - Angel%' AND NOT subtypes LIKE '%Angel%'
SELECT cardKingdomFoilId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id FROM sets WHERE duelDeck = 'a'
SELECT edhrec_rank FROM cards WHERE frame = '2015'
SELECT T1.artist FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Chinese Simplified' GROUP BY T1.artist
SELECT name FROM cards WHERE availability = 'paper' AND language = 'Japanese' GROUP BY name HAVING COUNT(*) = 1;
SELECT COUNT(*) FROM (SELECT * FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.borderColor = 'white') AS banned_white_border_cards
SELECT T1.uuid, T2.language FROM cards AS T1 JOIN cardForeignData AS T2 ON T1.uuid = T2.uuid WHERE T1.legalities @> '[{"format": "legacy", "status": "Legal"}]'::jsonb;
SELECT T2.rulings FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'
SELECT COUNT(T1.name), T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'Legal' GROUP BY T2.status;
SELECT c.name, c.color_identity FROM `cards` AS c WHERE c.set_code = 'OGW'
SELECT T1.name, T2.language FROM `cards` AS T1 JOIN `translations` AS T2 ON T1.uuid = T2.cardUUID WHERE T1.setCode = '10E' AND T1.convertedManaCost = 5
SELECT c.name, r.rulings FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.originalTypes LIKE '%Creature - Elf%'
SELECT T1.colors, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.id BETWEEN 1 AND 20 GROUP BY T1.colors, T2.format
SELECT cards.name FROM cards JOIN card_faces ON cards.uuid = card_faces.card_uuid WHERE card_faces.originalType LIKE '%Artifact%' AND cards.colors LIKE '%B%' AND EXISTS (SELECT 1 FROM foreign_data WHERE foreign_data.cardId = cards.id)
SELECT T1.name FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'Uncommon' ORDER BY T2.date ASC LIMIT 3;
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardkingdomid IS NOT NULL AND cardkingdomfoiledid IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND kingdomFoilId IS NOT NULL AND kingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1;
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper'
SELECT SUM(CAST(REPLACE(manaCost, '{', '') AS INT)) FROM cards WHERE artist = 'Rob Alexander' AND manaCost IS NOT NULL GROUP BY artist
SELECT DISTINCT types FROM cards WHERE availability = 'arena' UNION SELECT DISTINCT supertypes FROM cards WHERE availability = 'arena';
SELECT T1.setCode FROM sets AS T1 JOIN cards AS T2 ON T1.setCode = T2.set WHERE T2.language = 'Spanish' GROUP BY T1.setCode
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(id) * 100 FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN T1.isStorySpotlight = 1 AND T1.isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id), T1.id FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1 AND T1.isTextless = 0 GROUP BY T1.id
SELECT T1.name, (SUM(CASE WHEN T2.language = 'Spanish' THEN 1 ELSE 0 END) * 100 / COUNT(T2.id)) AS percentage FROM cards AS T1 JOIN card_details AS T2 ON T1.uuid = T2.card_uuid GROUP BY T1.name ORDER BY percentage DESC
SELECT T2.name FROM sets AS T1 JOIN languages AS T2 ON T1.set = T2.setCode WHERE T1.baseSetSize = 309 GROUP BY T2.name
SELECT COUNT(*) FROM sets WHERE block = 'Commander' AND code IN (SELECT code FROM languages WHERE language = 'Portuguese (Brasil)')
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'Legal'
SELECT T1.name, T1.types FROM cards AS T1 WHERE T1.lang = 'German' AND T1.types IS NOT NULL AND T1.supertypes IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards WHERE uuid IN (SELECT card_uuid FROM card_faces WHERE ruling_text = 'This is a triggered mana ability.') AND side IS NULL AND EXISTS (SELECT * FROM legalities WHERE legalities.uuid = cards.uuid AND format = 'premodern')
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper'
SELECT T1.artist FROM cards AS T1 JOIN card_text AS T2 ON T1.uuid = T2.uuid WHERE T2.text = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT foreignNames WHERE language = 'French' AND types = 'Creature' AND layout = 'normal' AND borderColor = 'black' AND artist = 'Matthew D. Wilson'
SELECT COUNT(*) FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.card_uuid WHERE T1.rarity = 'rare' AND T2.date = '2007-02-01'
SELECT T2.language FROM sets AS T1 JOIN translations AS T2 ON T1.uuid = T2.set_uuid WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'
SELECT COUNT(*) * 100 / (SELECT COUNT(*) FROM legalities WHERE format = 'commander' AND status = 'Legal') AS percentage FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'commander' AND status = 'Legal') AND hasContentWarning = 0;
SELECT CAST(SUM(CASE WHEN T1.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards AS T1 JOIN card_details AS T2 ON T1.uuid = T2.uuid WHERE T2.power IS NULL OR T2.power = '*'
SELECT CAST(SUM(CASE WHEN type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets WHERE language = 'Japanese'
SELECT T1.printing FROM card AS T1 JOIN set AS T2 ON T1.set_id = T2.set_id WHERE T1.artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000;
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.power IS NULL OR c.power = '*' AND c.promoTypes LIKE '%arenaleague%' GROUP BY c.name ORDER BY c.name LIMIT 3;
SELECT language FROM cards WHERE multiverseid = '149934'
SELECT L1.id AS id1, L2.id AS id2 FROM cards AS C1 JOIN legalities AS L1 ON C1.uuid = L1.uuid JOIN cards AS C2 JOIN legalities AS L2 ON C2.uuid = L2.uuid WHERE C1.cardKingdomFoilId IS NOT NULL AND C1.cardKingdomId IS NOT NULL AND C2.cardKingdomFoilId IS NOT NULL AND C2.cardKingdomId IS NOT NULL ORDER BY C1.cardKingdomFoilId, C2.cardKingdomFoilId LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE layout = 'normal'
SELECT cardNumber FROM cards WHERE face IS NULL AND SUBSTRING(types, 'Creature') LIKE '%Angel%' AND SUBSTRING(types, 'Creature') LIKE '%Wizard%'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name LIMIT 3;
SELECT DISTINCT language FROM cards WHERE mcmName = 'Archenemy' AND setCode = 'ARC'
SELECT T1.name, T1.foreignNames.translation FROM sets AS T1 JOIN foreignSets AS T2 ON T1.id = T2.setId WHERE T1.id = 5
SELECT language, expansion_type FROM sets WHERE id = '206'
SELECT T1.set_id, T1.name FROM sets AS T1 JOIN set_translations AS T2 ON T1.set_id = T2.set_id WHERE T2.language = 'Italian' AND T1.block = 'Shadowmoor' ORDER BY T1.name ASC LIMIT 2;
SELECT s.setId FROM sets AS s WHERE s.isForeignOnly = TRUE AND s.isFoilOnly = TRUE AND s.language = 'Japanese'
SELECT setCode FROM sets WHERE language = 'Russian' AND baseSetSize = (SELECT MAX(baseSetSize) FROM sets WHERE language = 'Russian') LIMIT 1;
SELECT CAST(SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c WHERE c.language = 'Chinese Simplified' AND c.isOnlineOnly = 1;
SELECT COUNT(*) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')
SELECT uuid FROM cards WHERE borderColor = 'black'
SELECT COUNT(*), id FROM cards WHERE frameEffects = 'extendedart' GROUP BY id;
SELECT cards.name FROM cards WHERE cards.isFullArt = 1 AND cards.borderColor = 'black'
SELECT language FROM sets WHERE id = '174'
SELECT set_name FROM sets WHERE set_code = 'ALL'
SELECT T2.language FROM cards AS T1 JOIN foreign_names AS T2 ON T1.uuid = T2.card_uuid WHERE T1.name = 'A Pedra Fellwar' GROUP BY T2.language
SELECT set_code FROM sets WHERE release_date = '2007-07-13' LIMIT 1;
SELECT T1.baseSetSize, T1.setCode FROM sets AS T1 JOIN blocks AS T2 ON T1.blockCode = T2.code WHERE T2.name IN ('Masques', 'Mirage')
SELECT setCode FROM sets WHERE setType = 'expansion'
SELECT T1.foreignNames, T1.types FROM cards AS T1 WHERE T1.watermark = 'boros'
SELECT T1.language, T1.flavor_text, T1.types FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'
SELECT CAST(SUM(CASE WHEN convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE name = 'Abyssal Horror'
SELECT T1.setCode FROM sets AS T1 JOIN cards AS T2 ON T1.setName = T2.set WHERE T2.type = 'Commander' AND T1.type = 'expansion' GROUP BY T1.setCode
SELECT T1.foreignNames, T1.types FROM cards AS T1 WHERE T1.watermark = 'abzan'
SELECT T1.language ,  T1.types FROM cards AS T1 INNER JOIN watermarks AS T2 ON T1.uuid = T2.uuid WHERE T2.watermark = 'Azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand_size > 0
SELECT name FROM cards WHERE isTextless = 0;
SELECT uncmc FROM cards WHERE name = 'Ancestor''s Chosen' LIMIT 1;
SELECT COUNT(*) FROM cards WHERE border_color = 'white' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT types FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT T1.purchaseUrls FROM card_prices AS T1 JOIN cards AS T2 ON T1.cardId = T2.uuid WHERE T2.promoTypes = 'bundle'
SELECT COUNT(DISTINCT c.artist)  FROM cards AS c  JOIN card_printings AS cp ON c.uuid = cp.card_uuid  WHERE c.border_color = 'black'  AND cp.printing_type IN ('arena', 'mtgo')  GROUP BY c.uuid  HAVING COUNT(DISTINCT cp.printing_type) >= 2;
SELECT name FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper') ORDER BY convertedManaCost DESC LIMIT 1;
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer' LIMIT 1;
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;
SELECT T1.name FROM sets AS T1 JOIN cards AS T2 ON T1.set_code = T2.set WHERE T2.name = 'Ancestor''s Chosen' AND T2.language = 'Italian' GROUP BY T1.name
SELECT COUNT(*) FROM translations WHERE name = 'Angel of Mercy'
SELECT name FROM cards WHERE set_name = 'Hauptset Zehnte Edition' AND language = 'German'
SELECT COUNT(*) FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'Korean'
SELECT COUNT(*) FROM cards WHERE `set` = 'Hauptset Zehnte Edition' AND artist = 'Adam Rex'
SELECT T1.baseSetSize FROM sets AS T1 WHERE T1.translation = 'Hauptset Zehnte Edition'
SELECT s.name FROM sets AS s JOIN translations AS t ON s.uuid = t.set_uuid WHERE s.name = 'Eighth Edition' AND t.language = 'Chinese Simplified'
SELECT COUNT(*) > 0 FROM `sets` WHERE `name` = 'Angel of Mercy' AND `mtgoCode` IS NOT NULL
SELECT T2.releaseDate FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.set = T2.code WHERE T1.name = 'Ancestor''s Chosen'
SELECT type FROM sets WHERE name = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM sets WHERE block = 'Ice Age' AND language = 'Italian' AND translation IS NOT NULL;
SELECT isForeignOnly FROM cards WHERE name = 'Adarkar Valkyrie'
SELECT COUNT(*) FROM sets WHERE language = 'Italian' AND baseSetSize < 100 AND translation IS NOT NULL
SELECT COUNT(*) FROM cards WHERE set = 'Coldsnap' AND border_color = 'black'
SELECT T1.name FROM cards AS T1 JOIN card_sets AS T2 ON T1.set = T2.code WHERE T2.name = 'Coldsnap' ORDER BY T1.converted_mana_cost DESC LIMIT 1;
SELECT T2.artist FROM sets AS T1 JOIN cards AS T2 ON T1.set_id = T2.set WHERE T1.name = 'Coldsnap' AND T2.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') GROUP BY T2.artist
SELECT cards.name FROM cards WHERE cards.set_name = 'Coldsnap' AND cards.number = 4;
SELECT COUNT(*) FROM ( (SELECT * FROM cards WHERE name = 'Coldsnap' AND convertedManaCost > 5) AS T1 LEFT JOIN card_details AS T2 ON T1.uuid = T2.uuid) WHERE power = '*' OR T1.power IS NULL
SELECT t1.flavortext FROM cards AS t1 WHERE t1.name = 'Ancestor''s Chosen' AND t1.language = 'Italian'
SELECT DISTINCT t2.language FROM cards AS t1 JOIN translations AS t2 ON t1.uuid = t2.cardId WHERE t1.name = 'Ancestor''s Chosen' AND t2.flavorText IS NOT NULL
SELECT t1.name FROM cards AS t1 JOIN translations AS t2 ON t1.uuid = t2.card_uuid WHERE t2.language = 'German' AND t1.name = 'Ancestor''s Chosen' GROUP BY t1.name
SELECT t1.rulings FROM cards AS t1 JOIN rulings AS t2 ON t1.uuid = t2.card_uuid WHERE t1.set = 'Coldsnap' AND t2.language = 'Italian' GROUP BY t1.name
SELECT c.name_italian FROM cards AS c WHERE c.set_name = 'Coldsnap' AND c.language = 'Italian' ORDER BY c.converted_mana_cost DESC LIMIT 1;
SELECT rulings.date FROM rulings JOIN cards ON rulings.cardId = cards.uuid WHERE cards.name = 'Reminisce' LIMIT 1;
SELECT CAST(COUNT(CASE WHEN c.convertedManaCost = 7 THEN 1 END) AS REAL) * 100 / COUNT(*) FROM cards AS c JOIN sets AS s ON c.sets = s.code WHERE s.name = 'Coldsnap' AND c.convertedManaCost IS NOT NULL;
SELECT CAST(COUNT(*) FILTER (WHERE t1.cardKingdomFoilId IS NOT NULL AND t1.cardKingdomId IS NOT NULL) AS REAL) * 100 / COUNT(*) FILTER (WHERE t2.name = 'Coldsnap') FROM cards AS t1 JOIN sets AS t2 ON t1.sets_id = t2.id WHERE t2.name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14' LIMIT 1;
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2' LIMIT 1;
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT T1.type FROM `sets` AS T1 JOIN `cards` AS T2 ON T1.set_code = T2.set WHERE T2.name = 'From the Vault: Lore' GROUP BY T1.type LIMIT 1;
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';
SELECT s.releaseDate FROM sets AS s JOIN cards AS c ON s.code = c.set WHERE c.name = 'Evacuation'
SELECT baseSetSize FROM sets WHERE translation = 'Rinascita di Alara'
SELECT T1.type FROM sets AS T1 JOIN translations AS T2 ON T1.set_id = T2.set_id WHERE T2.translation = 'Huitième édition'
SELECT s.name FROM sets AS s JOIN cards AS c ON s.set_code = c.set WHERE c.name = 'Tendo Ice Bridge' AND c.language = 'French' LIMIT 1
SELECT COUNT(*) FROM sets WHERE name = 'Tenth Edition' AND translation IS NOT NULL
SELECT T2.name FROM sets AS T1 JOIN cards AS T2 ON T1.set_code = T2.set WHERE T2.name = 'Fellwar Stone' AND T1.language = 'Japanese' GROUP BY T2.name
SELECT card.name FROM card WHERE card.set_name = 'Journey into Nyx Hero''s Path' AND card.converted_mana_cost = (SELECT MAX(converted_mana_cost) FROM card WHERE set_name = 'Journey into Nyx Hero''s Path')
SELECT release_date FROM sets WHERE translation = 'Ola de frío'
SELECT T2.type FROM cards AS T1 JOIN sets AS T2 ON T1.set_id = T2.id WHERE T1.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards WHERE name = 'World Championship Decks 2004' AND convertedManaCost = 3;
SELECT t1.name FROM sets AS t1 JOIN translations AS t2 ON t1.uuid = t2.set_uuid WHERE t1.name = 'Mirrodin' AND t2.language = 'Chinese Simplified'
SELECT (SUM(CASE WHEN isNonFoilOnly = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*)) AS percentage FROM cards WHERE language = 'Japanese'
SELECT SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*) AS percentage_online_only FROM cards AS c WHERE c.language = 'Portuguese (Brazil)'
SELECT T1.availability FROM cards AS T1 WHERE T1.isTextless = 1 AND T1.artist = 'Aleksi Briclot'
SELECT T2.id FROM `sets` AS T1 JOIN `cards` AS T2 ON T1.set = T2.set WHERE T1.baseSetSize = (SELECT MAX(baseSetSize) FROM `sets`) LIMIT 1;
SELECT T1.artist FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.side IS NULL ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T1.frame_effects FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.cardKingdomFoilId IS NOT NULL AND T1.cardKingdomId IS NOT NULL GROUP BY T1.frame_effects ORDER BY COUNT(T1.frame_effects) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a'
SELECT s.id FROM sets AS s WHERE s.type = 'commander' AND s.totalSetSize = (SELECT MAX(totalSetSize) FROM sets WHERE type = 'commander')
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10;
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1
SELECT COUNT(*) FROM cards WHERE artist = 'Volkan Baga' AND language = 'French'
SELECT COUNT(*) FROM ( SELECT * FROM `cards` WHERE `rarity` = 'Rare' AND JSON_EXTRACT(`types`, '$[0]') = 'Enchantment' AND `name` = 'Abundance' ) AS c JOIN `legalities` AS l ON c.uuid = l.uuid WHERE l.status = 'Legal' GROUP BY c.uuid HAVING COUNT(*) = ( SELECT COUNT(DISTINCT format) FROM `legalities` )
SELECT L.format, C.name FROM legalities AS L JOIN cards AS C ON L.uuid = C.uuid WHERE L.status = 'Banned' GROUP BY L.format, C.name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT language FROM sets WHERE name = 'Battlebond' LIMIT 1;
SELECT T2.format FROM set_cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist IN (SELECT artist FROM set_cards GROUP BY artist ORDER BY COUNT(*) ASC LIMIT 1)
SELECT T2.status FROM cards AS T1 JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '1997' AND T1.artist = 'D. Alexander Gregory' AND (T1.hasContentWarning = 1 OR T1.printerName = 'Wizards of the Coast') AND T2.format = 'legacy'
SELECT c.name, l.format FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned'
SELECT AVG(T1.id) AS avg_sets, T2.language FROM sets AS T1 JOIN cards AS T2 ON T1.set = T2.set WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT T1.artist FROM cards AS T1 JOIN cardborder AS T2 ON T1.uuid = T2.card_uuid WHERE T2.border_color = 'black' AND T1.availability = 'arena' GROUP BY T1.artist
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'restricted' OR status = 'banned')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT T2.text FROM cards AS T1 JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC
SELECT C.name, L.format FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid WHERE C.set = 'Hour of Devastation' AND L.status = 'Legal' GROUP BY C.name, L.format
SELECT name FROM sets WHERE language = 'Korean' AND NOT EXISTS (SELECT * FROM sets WHERE language LIKE '%Japanese%' AND name = name)
SELECT T1.frameVersion, T1.name FROM `cards` AS T1 JOIN `legalities` AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND T2.status = 'Banned' UNION SELECT DISTINCT T1.frameVersion, T1.name FROM `cards` AS T1 WHERE T1.artist = 'Allen Williams'
SELECT DisplayName FROM Users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1;
SELECT DisplayName FROM Users WHERE YEAR(CreationDate) = 2011;
SELECT COUNT(*) FROM Users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM Users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM Users WHERE UpVotes > 100 AND DownVotes > 1;
SELECT COUNT(*) FROM Users WHERE Views > 10 AND YEAR(CreationDate) > 2013;
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT AccountId FROM Users WHERE DisplayName = 'csgillespie')
SELECT T1.Title FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Posts WHERE Title = 'Eliciting priors from experts')
SELECT T1.Title FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' ORDER BY T1.ViewCount DESC LIMIT 1
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts)
SELECT SUM(T2.CommentCount) FROM Posts AS T1 INNER JOIN Posts AS T2 ON T1.OwnerUserId = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' AND T1.PostTypeId = 2
SELECT T2.AnswerCount FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') ORDER BY T2.AnswerCount DESC LIMIT 1
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND ParentId IS NULL
SELECT T1.DisplayName FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.ClosedDate IS NOT NULL
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE Age > 65) AND Score >= 20
SELECT L.Location FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id JOIN UserLocations AS L ON U.Id = L.UserId WHERE P.Title = 'Eliciting priors from experts'
SELECT Posts.Body FROM Tags INNER JOIN PostTags ON PostTags.TagId = Tags.Id INNER JOIN Posts ON Posts.Id = PostTags.PostId WHERE Tags.TagName = 'bayesian' AND Posts.PostTypeId = 1 LIMIT 1
SELECT T1.Body FROM Posts AS T1 JOIN Tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.Count = ( SELECT MAX(T3.Count) FROM Tags AS T3 )
SELECT COUNT(*) FROM Badges WHERE UserId = (SELECT AccountId FROM Users WHERE DisplayName = 'csgillespie')
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'csgillespie' GROUP BY B.Name ORDER BY COUNT(*) DESC LIMIT 100
SELECT COUNT(*) FROM Badges WHERE UserId = (SELECT Id FROM Users WHERE DisplayName = 'csgillespie') AND YEAR(Date) = 2011
SELECT T2.DisplayName FROM (SELECT UserId, COUNT(*) AS BadgeCount FROM Badges GROUP BY UserId ORDER BY BadgeCount DESC LIMIT 1) AS T1 INNER JOIN Users AS T2 ON T1.UserId = T2.Id
SELECT AVG(T1.Score) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'
SELECT AVG(BadgeCount) AS AverageBadges FROM (SELECT COUNT(DISTINCT u.Id) AS BadgeCount FROM Users u JOIN Badges b ON u.Id = b.UserId WHERE u.Views > 200 GROUP BY u.Id) AS temp
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM ( SELECT CreationDate, COUNT(Id) AS num_votes FROM Users GROUP BY CreationDate ) AS vote_counts WHERE num_votes = ( SELECT MAX(num_votes) FROM ( SELECT COUNT(Id) AS num_votes FROM Users GROUP BY CreationDate ) AS max_votes );
SELECT COUNT(Id) FROM Badges WHERE Name = 'Revival'
SELECT T1.Title FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = (SELECT MAX(Score) FROM Comments)
SELECT T2.CommentCount FROM Posts AS T1 JOIN PostInTags AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount = 1910
SELECT T1.FavoriteCount FROM Posts AS T1 INNER JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = '3025' AND T2.CreationDate = '2014-04-23 20:29:39.0'
SELECT Text FROM Comments WHERE PostId = 107829 AND CommentCount = 1;
SELECT CASE WHEN ClosedDate IS NULL THEN 'Not Well-Finished' ELSE 'Well-Finished' END AS PostStatus FROM Posts WHERE Id IN (SELECT PostId FROM Comments WHERE UserId = '23853' AND CreationDate = '2013-07-12 09:08:18.0')
SELECT Reputation FROM Users WHERE Id = 65041;
SELECT COUNT(*) FROM Posts WHERE OwnerUserId = (SELECT Id FROM Users WHERE DisplayName = 'Tiago Pasqualini')
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Votes WHERE Id = 6347)
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE DisplayName = 'Data Visualization'
SELECT T2.Name FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT COUNT(T1.Id) / COUNT(T2.Id) FROM Posts AS T1 JOIN Votes AS T2 ON T1.OwnerUserId = '24' AND T2.UserId = '24' WHERE T1.PostTypeId = 1 AND T2.VoteTypeId IN (2, 3)
SELECT ViewCount FROM Posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM Comments WHERE Score = 17
SELECT DisplayName FROM Users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT B.Name FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE U.DisplayName = 'SilentGhost'
SELECT T1.DisplayName FROM Users AS T1 JOIN Comments AS T2 ON T1.Id = T2.UserId WHERE T2.Text = 'thank you user93!'
SELECT T2.Text FROM Users AS T1 JOIN Comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion'
SELECT T2.DisplayName, T1.Reputation FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Understanding what Dassault iSight is doing?'
SELECT T2.Text FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT DisplayName FROM Users WHERE EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Necromancer') LIMIT 10
SELECT T2.DisplayName FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data?' AND T2.PostHistoryTypeId = 4
SELECT T1.Title FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId WHERE T2.HistoryTypeId = 5 AND T2.UserId IN (SELECT UserId FROM Users WHERE DisplayName = 'Vebjorn Ljosa')
SELECT SUM(Posts.Score) AS TotalScore, Users.WebsiteUrl FROM Posts INNER JOIN Users ON Posts.LastEditorUserId = Users.Id WHERE Users.DisplayName = 'Yevgeny' GROUP BY Users.WebsiteUrl
SELECT T3.Text FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.PostId = T2.PostId JOIN Comments AS T3 ON T2.UserId = T3.UserId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND T2.PostHistoryTypeId = 4
SELECT SUM(T2.BountyAmount) FROM Posts AS T1 JOIN PostHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title LIKE '%variance%' AND T1.BountyAmount = 50
SELECT T1.Title, T2.Text, AVG(T1.ViewCount) AS AverageViewCount FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T1.Tags LIKE '%<humor>%' GROUP BY T1.Title, T2.Text
SELECT COUNT(*) FROM Comments WHERE OwnerUserId = 13;
SELECT AccountId FROM Users ORDER BY Reputation DESC LIMIT 1
SELECT AccountId FROM Users WHERE Views = (SELECT MIN(Views) FROM Users)
SELECT COUNT(*) FROM Badges WHERE YEAR(BadgeDate) = 2011 AND Name = 'Supporter'
SELECT COUNT(*) FROM (SELECT UserId, COUNT(Name) AS NumBadges FROM Badges GROUP BY UserId HAVING COUNT(Name) > 5) AS UsersWithMoreThanFiveBadges
SELECT COUNT(*) FROM Users AS u JOIN Badges AS b1 ON u.Id = b1.UserId JOIN Badges AS b2 ON u.Id = b2.UserId WHERE u.Location LIKE '%New York%' AND b1.Name = 'Supporter' AND b2.Name = 'Teacher' GROUP BY u.Id HAVING COUNT(DISTINCT b1.Name) >= 1 AND COUNT(DISTINCT b2.Name) >= 1;
SELECT T2.DisplayName, T2.Reputation FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 1
SELECT UserId FROM PostHistory WHERE NOT EXISTS (SELECT * FROM PostHistory AS ph2 WHERE ph2.UserId = PostHistory.UserId AND ph2.PostId != PostHistory.PostId) AND Views >= 1000 GROUP BY UserId HAVING COUNT(*) = 1
SELECT T1.Id, T1.Badges FROM (SELECT UserId, COUNT(Id) AS CommentCount FROM Comments GROUP BY UserId) AS T2 JOIN Users AS T1 ON T1.Id = T2.UserId WHERE T2.CommentCount = (SELECT MAX(CommentCount) FROM (SELECT COUNT(Id) AS CommentCount FROM Comments GROUP BY UserId) AS T3)
SELECT COUNT(*) FROM Users WHERE Location LIKE '%India%' AND EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Teacher')
SELECT (CAST(SUM(CASE WHEN YEAR(B.Date) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN B.Name = 'Student' THEN 1 ELSE 0 END) * 100 - CAST(SUM(CASE WHEN YEAR(B.Date) = 2011 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN B.Name = 'Student' THEN 1 ELSE 0 END) * 100) FROM Badges AS B
SELECT COUNT(DISTINCT ph.PostID) AS UniqueUsersCommented, ph.PostHistoryTypeID FROM Posts p JOIN PostHistory ph ON ph.PostID = p.PostId WHERE p.PostTypeId = 1 AND p.Id = 3720 AND ph.PostHistoryTypeID IN (4,5) GROUP BY ph.PostHistoryTypeID
SELECT T1.Id, T1.ViewCount FROM Posts AS T1 JOIN PostLinks AS T2 ON T1.Id = T2.PostId WHERE T2.RelatedPostId = 61217
SELECT Score, LinkTypeId FROM Posts WHERE Id = 395;
SELECT Posts.Id AS PostID, Posts.OwnerUserId AS UserID FROM Posts WHERE Posts.Score > 60;
SELECT SUM(FavoriteCount) FROM Posts WHERE OwnerUserId = 686 AND YEAR(CreationDate) = 2011
SELECT AVG(T2.UpVotes), AVG(T2.Age) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.PostTypeId = 1 GROUP BY T2.Id HAVING COUNT(T1.Id) > 10
SELECT COUNT(*) FROM Badges WHERE Name = 'Announcer'
SELECT T2.Name FROM Badges AS T1 JOIN BadgeNames AS T2 ON T1.Id = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM Comments WHERE Score > 60;
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:25:47.0'
SELECT COUNT(Id) FROM Posts WHERE Score = 10;
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.Reputation = (SELECT MAX(Reputation) FROM Users) GROUP BY B.Name
SELECT Reputation FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Date = '2010-07-19 19:39:08.0')
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Pierre'
SELECT T2.Date FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location LIKE '%Rochester, NY%'
SELECT COUNT(CASE WHEN b.Name = 'Teacher' THEN u.UserId ELSE NULL END) * 100 / COUNT(u.UserId) AS Percentage FROM Users u JOIN Badges b ON u.UserId = b.UserId WHERE b.Name = 'Teacher' GROUP BY b.Name;
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM (SELECT UserId FROM Badges WHERE Name = 'Organizer') AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id
SELECT CommentRatingScore FROM Posts WHERE CreationDate = '2010-07-19 19:19:56.0'
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:37:33.0'
SELECT T1.Age FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location LIKE '%Vienna, Austria%'
SELECT COUNT(*) FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND T1.Age BETWEEN 19 AND 65
SELECT T2.Views FROM Badges AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT B.Name FROM Badges AS B JOIN Users AS U ON B.UserId = U.Id WHERE U.Reputation = (SELECT MIN(Reputation) FROM Users) GROUP BY B.Name
SELECT B.Name FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE U.DisplayName = 'Sharpie'
SELECT COUNT(*) FROM Users WHERE Age > 65 AND EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Supporter')
SELECT DisplayName FROM Users WHERE AccountId = 30;
SELECT COUNT(*) FROM Users WHERE LOWER(Location) LIKE '%new york%'
SELECT COUNT(*) FROM Votes WHERE YEAR(CreationDate) = 2010;
SELECT COUNT(*) FROM Users WHERE Age >= 19 AND Age <= 65;
SELECT DisplayName FROM Users ORDER BY Views DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN YEAR(CreationDate) = 2010 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN YEAR(CreationDate) = 2011 THEN 1 ELSE 0 END) FROM Votes;
SELECT T2.TagName FROM Posts AS T1 JOIN PostTags AS T3 ON T1.Id = T3.PostId JOIN Tags AS T2 ON T2.Id = T3.TagId WHERE T1.OwnerDisplayName = 'John Salvatier'
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Daniel Vassallo')
SELECT SUM(UpVotes) + SUM(DownVotes) FROM Users WHERE DisplayName = 'Harlan'
SELECT PostId FROM Posts WHERE DisplayName = 'slashnick' AND AnswerCount = (SELECT MAX(AnswerCount) FROM Posts WHERE DisplayName = 'slashnick')
SELECT SUM(T2.ViewCount) AS ViewCount ,  T1.DisplayName FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY T1.DisplayName ORDER BY ViewCount DESC LIMIT 1
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Matt Parker') AND Score > 4
SELECT COUNT(*) FROM Comments WHERE Score < 60 AND OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Neil McGuigan')
SELECT T2.TagName FROM Posts AS T1 JOIN PostTags AS T3 ON T1.Id = T3.PostId JOIN Tags AS T2 ON T2.Id = T3.TagId WHERE T1.CommentCount = 0 AND T1.OwnerDisplayName = 'Mark Meckes'
SELECT T1.DisplayName FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T1.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.PostId) FROM Tags AS T1 INNER JOIN PostTags AS T2 ON T1.Id = T2.TagId INNER JOIN Posts AS T3 ON T2.PostId = T3.Id WHERE T3.OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Community')
SELECT (SUM(CASE WHEN T1.DisplayName = 'Mornington' THEN T2.ViewCount ELSE 0 END) - SUM(CASE WHEN T1.DisplayName = 'Amos' THEN T2.ViewCount ELSE 0 END)) AS ViewDifference FROM Users AS T1 INNER JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId;
SELECT COUNT(*) FROM Users WHERE EXISTS(SELECT * FROM Badges WHERE UserId = Users.Id AND Name = 'Commentator' AND YEAR(Date) = 2014)
SELECT COUNT(*) FROM Posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT DisplayName, Age FROM Users WHERE Views = (SELECT MAX(Views) FROM Users)
SELECT LastEditDate, LastEditorUserId FROM Posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM Comments WHERE UserId = 13 AND Score < 60;
SELECT T1.Title, T3.DisplayName FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId JOIN Users AS T3 ON T2.UserId = T3.Id WHERE T2.Score > 60;
SELECT b.Name FROM Badges AS b JOIN Users AS u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND YEAR(b.Date) = 2011
SELECT DisplayName, WebsiteUrl FROM Users WHERE EXISTS (SELECT * FROM Posts WHERE Posts.OwnerUserId = Users.Id AND FavoriteCount > 150)
SELECT COUNT(*), MAX(ph.LastEditDate) FROM Posts AS p JOIN PostHistory AS ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' AND ph.PostHistoryTypeId = 4
SELECT LastAccessDate, Location FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Name = 'Outliers')
SELECT T2.Title FROM Posts AS T1 JOIN Posts AS T2 ON T1.ParentId = T2.Id WHERE T1.Body LIKE '%How to tell if something happened in a data set which monitors a value over time%'
SELECT T1.PostId, T2.TagName FROM Posts AS T1 JOIN PostTags AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId IN (SELECT Id FROM Users WHERE UserDisplayName = 'Samuel') AND YEAR(T1.CreationDate) = 2013 UNION SELECT T3.PostId, T4.Name FROM Badges AS T3 JOIN Posts AS T4 ON T3.UserId = T4.OwnerUserId WHERE T3.Name = 'Samuel' AND YEAR(T3.Date) = 2013
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE PostTypeId = 1 ORDER BY ViewCount DESC LIMIT 1
SELECT T1.DisplayName, T1.Location FROM SuggestedEditVotes AS T1 JOIN Posts AS T2 ON T1.UserId = T2.OwnerUserId JOIN PostTags AS T3 ON T2.Id = T3.PostId JOIN Tags AS T4 ON T3.TagId = T4.Id WHERE T4.TagName = 'hypothesis-testing'
SELECT T2.Title, T1.LinkTypeId FROM Posts AS T1 JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'What are principal component scores?'
SELECT T2.DisplayName FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ParentId IS NOT NULL ORDER BY T1.Score DESC LIMIT 1;
SELECT T1.DisplayName, T1.WebsiteUrl FROM Users AS T1 JOIN Votes AS T2 ON T1.Id = T2.UserId WHERE T2.VoteTypeId = 8 ORDER BY T1.BountyAmount DESC LIMIT 1;
SELECT Title FROM Posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(*) FROM Tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM Posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts) LIMIT 1;
SELECT Age FROM Users WHERE Reputation = (SELECT MAX(Reputation) FROM Users)
SELECT COUNT(*) FROM Posts AS p JOIN Votes AS v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND p.BountyAmount = 50 AND v.VoteTypeId IN (2,3)
SELECT AccountId FROM Users WHERE Age = (SELECT MIN(Age) FROM Users)
SELECT SUM(Reputation) FROM Users WHERE LastAccessDate LIKE '2010-07-19%'
SELECT COUNT(T1.Id) / 12 AS AverageMonthlyLinksCreatedIn2010ForPostsNoMoreThan2Answers FROM Posts AS T1 WHERE YEAR(T1.CreationDate) = 2010 AND T1.AnswerCount <= 2;
SELECT PostId FROM Votes WHERE UserId = 1465 AND VoteTypeId = 5 ORDER BY Value DESC LIMIT 1
SELECT Title FROM Posts ORDER BY CreationDate LIMIT 1
SELECT DisplayName FROM Users WHERE AccountId = (SELECT AccountId FROM Badges GROUP BY AccountId ORDER BY COUNT(*) DESC LIMIT 1)
SELECT MIN(Votes.CreationDate) FROM Votes JOIN Users ON Votes.UserId = Users.Id WHERE Users.DisplayName = 'chl'
SELECT T1.CreationDate FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age = (SELECT MIN(Age) FROM Users) ORDER BY T1.CreationDate ASC LIMIT 1
SELECT T1.DisplayName FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Autobiographer' ORDER BY T2.Date LIMIT 1
SELECT COUNT(*) FROM Users WHERE Location LIKE '%United Kingdom%' AND (SELECT SUM(FavoriteCount) FROM Posts WHERE Posts.OwnerUserId = Users.Id) >= 4
SELECT AVG(T2.PostId) FROM Users AS T1 JOIN Votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = (SELECT MAX(Age) FROM Users)
SELECT DisplayName FROM Users WHERE Reputation = (SELECT MAX(Reputation) FROM Users)
SELECT COUNT(*) FROM Users WHERE Reputation > 2000 AND Views > 1000;
SELECT DisplayName FROM Users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM Posts WHERE YEAR(CreationDate) = 2010 AND DisplayName = 'Jay Stevens'
SELECT Id, Title FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Harvey Motulsky') ORDER BY ViewCount DESC LIMIT 1;
SELECT Id, Title FROM Posts WHERE Score = (SELECT MAX(Score) FROM Posts)
SELECT AVG(T2.Score) FROM Users AS T1 JOIN Posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Stephen Turner'
SELECT DisplayName FROM Users WHERE AccountId IN (SELECT AccountId FROM Posts WHERE YEAR(CreationDate) = 2011 AND ViewCount > 20000)
SELECT Id, OwnerUserId, DisplayName FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2010 ORDER BY p.FavoriteCount DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE YEAR(T1.CreationDate) = 2011;
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM Users WHERE Age IS NOT NULL;
SELECT SUM(ViewCount) AS TotalViews, MAX(u.DisplayName) AS LastPosterName FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE p.Text = 'Computer Game Datasets' GROUP BY p.Text;
SELECT COUNT(*) FROM Posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM Posts)
SELECT COUNT(*) FROM Comments WHERE PostId = (SELECT PostId FROM Posts ORDER BY Score DESC LIMIT 1)
SELECT COUNT(*) FROM Posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT DisplayName, Location FROM Users WHERE Id = (SELECT OwnerUserId FROM Posts WHERE PostTypeId = 2 AND ParentId = 183 ORDER BY LastEditDate DESC LIMIT 1)
SELECT B.Name FROM Badges AS B INNER JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'Emmett' ORDER BY B.Date DESC LIMIT 1;
SELECT COUNT(*) FROM Users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT DATEDIFF(stats_badges.Date, Users.CreationDate) AS TimeToBadge FROM stats_badges JOIN Users ON stats_badges.UserId = Users.Id WHERE Users.DisplayName = 'Zolomon'
SELECT COUNT(*) AS PostCount, COUNT(c.Id) AS CommentCount FROM Posts p LEFT JOIN Comments c ON p.OwnerUserId = c.UserId WHERE p.OwnerUserId = (SELECT u.Id FROM Users u ORDER BY u.CreationDate DESC LIMIT 1) GROUP BY p.OwnerUserId;
SELECT C.Text, U.DisplayName FROM Comments AS C JOIN Users AS U ON C.UserId = U.Id WHERE C.PostId IN (SELECT Id FROM Posts WHERE Title = 'Analysing wind data with R') ORDER BY C.CreationDate DESC LIMIT 10;
SELECT COUNT(*) FROM Users WHERE Id IN (SELECT UserId FROM Badges WHERE Name = 'Citizen Patrol')
SELECT COUNT(*) FROM Posts JOIN PostTags ON Posts.Id = PostTags.PostId JOIN Tags ON PostTags.TagId = Tags.Id WHERE Tags.TagName = 'careers'
SELECT Reputation, Views FROM Users WHERE DisplayName = 'Jarrod Dixon'
SELECT COUNT(CASE WHEN T2.PostTypeId = 1 THEN 1 END) AS answer_count, COUNT(T1.CommentId) AS comment_count FROM Comments AS T1 JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'Clustering 1D data'
SELECT CreationDate FROM Users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*) FROM Posts WHERE BountyAmount >= 30
SELECT CAST(SUM(CASE WHEN Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM Posts stats_posts INNER JOIN Users u ON stats_posts.OwnerUserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM Users)
SELECT COUNT(*) FROM Posts WHERE Score < 20;
SELECT COUNT(*) FROM Tags WHERE Id < 15 AND Count <= 20;
SELECT ExcerptPostID ,  WikiPostID FROM Tags WHERE TagName  =  'sample'
SELECT Reputation, UpVotes FROM Users WHERE Id IN (SELECT UserId FROM Comments WHERE Text LIKE '%fine, you win%')
SELECT "Text" FROM "Comments" WHERE "PostId" IN (SELECT "Id" FROM "Posts" WHERE "Title" LIKE '%linear regression%')
SELECT C.Text FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId WHERE P.ViewCount BETWEEN 100 AND 150 ORDER BY C.Score DESC LIMIT 1
SELECT CreationDate, Age FROM Users WHERE WebsiteUrl LIKE '%http%';
SELECT COUNT(*) FROM Comments WHERE Score = 0 AND ViewCount < 5;
SELECT COUNT(*) FROM Posts WHERE CommentCount = 1 AND Score = 0;
SELECT COUNT(*) FROM (SELECT Age FROM table_name WHERE Score = 0 AND Age = 40) AS tmp
SELECT T2.Id AS PostID ,  T1.Text AS Comment FROM Comments AS T1 JOIN Posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title = 'Group differences on a five point Likert item'
SELECT UpVotes FROM Users WHERE AccountId IN (SELECT UserId FROM Comments WHERE Text LIKE '%R is also lazy evaluated.%')
SELECT Text FROM Comments WHERE UserId IN (SELECT Id FROM Users WHERE DisplayName = 'Harvey Motulsky')
SELECT T2.DisplayName FROM Comments AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Comments AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10;
SELECT T2.power_name FROM superhero AS T1 JOIN superhero_power AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T3.power_id = T2.id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superhero JOIN superpower ON superhero.id = superpower.id WHERE superpower.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero JOIN superpower ON superhero.id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;
SELECT T2.full_name FROM superpower AS T1 JOIN superhero AS T2 ON T1.id = T2.id GROUP BY T2.full_name HAVING COUNT(T1.power_name) > 15
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM superhero JOIN superpower ON superhero.id = superpower.id WHERE superhero.eye_colour_id IN (SELECT id FROM colours WHERE name = 'Blue') AND superpower.power_name = 'Agility'
SELECT superhero.superhero_name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id WHERE colour.colour IN ('Blue', 'Blond') GROUP BY superhero.superhero_name HAVING COUNT(DISTINCT colour.colour) = 2
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') ORDER BY height_cm DESC;
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT T3.eye_colour, COUNT(T2.id) AS num_superheroes FROM superhero AS T1 JOIN eye_colour AS T3 ON T1.eye_colour_id = T3.id WHERE T1.publisher_id IN (SELECT id FROM publisher WHERE name = 'Marvel Comics') GROUP BY T1.eye_colour_id ORDER BY num_superheroes DESC;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'
SELECT superhero.superhero_name FROM superhero JOIN superpower ON superhero.id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.publisher_id IN (SELECT id FROM publisher WHERE name = 'Marvel Comics')
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')
SELECT T3.publisher_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.attribute_name = 'Speed' ORDER BY T2.attribute_value ASC LIMIT 1;
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Gold' AND superhero.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond'
SELECT T1.superhero_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T2.attribute_name = 'Intelligence' ORDER BY T2.attribute_value LIMIT 1;
SELECT T2.race FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T2.power_name = 'Durability' AND T2.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T2.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE name = 'Female') AND id IN (SELECT superhero_id FROM has_attribute WHERE attribute_id IN (SELECT id FROM attribute WHERE attribute_name = 'Strength' AND attribute_value = 100))
SELECT T1.superhero_name FROM superhero AS T1 JOIN superhero_power AS T2 ON T1.id = T2.superhero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race_name = 'Vampire')
SELECT SUM(CASE WHEN T3.alignment = 'Bad' THEN 1 ELSE 0 END) * 100 / COUNT(T2.id) AS percentage , SUM(CASE WHEN T3.alignment = 'Bad' AND T4.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS marvel_count FROM superpower AS T1 JOIN superhero_power AS T2 ON T1.id = T2.power_id JOIN superhero AS T3 ON T2.hero_id = T3.id JOIN publisher AS T4 ON T3.publisher_id = T4.id WHERE T3.alignment != 'None'
SELECT COUNT(*) AS num_superheroes, superhero.publisher_id  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name IN ('DC Comics', 'Marvel Comics')  GROUP BY superhero.publisher_id  HAVING publisher.publisher_name = 'Marvel Comics'  LIMIT 1   UNION   SELECT COUNT(*) AS num_superheroes, superhero.publisher_id  FROM superhero  JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name IN ('DC Comics', 'Marvel Comics')  GROUP BY superhero.publisher_id  HAVING publisher.publisher_name = 'DC Comics'  LIMIT 1   ORDER BY num_superheroes DESC  LIMIT 1;  SELECT (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics') - (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics') AS difference;
SELECT T1.id FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Star Trek' LIMIT 1;
SELECT AVG(T1.height_cm) ,  AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN eye_colour AS T3 ON T1.eye_colour_id = T3.id JOIN hair_colour AS T4 ON T1.hair_colour_id = T4.id JOIN skin_colour AS T5 ON T1.skin_colour_id = T5.id WHERE T1.height_cm != 0 AND T1.weight_kg != 0
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75;
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'
SELECT T3.power_name FROM superhero AS T1 JOIN superhero_gender AS T2 ON T1.gender_id = T2.id JOIN superhero_power AS T4 ON T1.id = T4.superhero_id JOIN superpower AS T3 ON T4.power_id = T3.id WHERE T2.gender = 'Male' LIMIT 5;
SELECT T1.superhero_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 170 AND 190 AND eye_colour_id IN (SELECT id FROM superpower WHERE power_name = 'No Colour')
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.id = 56
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Demi-God' LIMIT 5;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT T2.race FROM superhero AS T1 JOIN superhero_race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T3.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.hair_colour_id = T2.id JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T1.race_id IN (SELECT id FROM race WHERE race_name = 'human')
SELECT c.colour_name FROM (SELECT MAX(s.weight_kg) AS max_weight FROM superhero s) AS maxweight JOIN superhero s ON s.weight_kg = maxweight.max_weight JOIN eye_colour e ON s.eye_colour_id = e.id JOIN colour c ON e.colour_id = c.id
SELECT CAST(COUNT(CASE WHEN T2.publisher_id = 13 THEN T1.id ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180
SELECT T1.superhero_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT T1.full_name, T1.gender_id, T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id, T1.race_id, T1.publisher_id, T1.alignment_id, T1.height_cm, T1.weight_kg FROM superhero AS T1 WHERE T1.superhero_name = 'Abomination'
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.id = 1
SELECT COUNT(*) FROM superhero JOIN superpower ON superhero.id = superpower.id WHERE superpower.power_name = 'Stealth'
SELECT T1.full_name FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T2.attribute_name = 'strength' ORDER BY T2.attribute_value DESC LIMIT 1;
SELECT AVG(T1.id) FROM superhero AS T1 JOIN color AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'No Colour'
SELECT COUNT(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics')
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `superpower` AS T2 ON T1.id = T3.superhero_id WHERE T2.power_name = 'Durability' AND T1.publisher_id IN(SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics') GROUP BY T1.superhero_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T2.power_name = 'Flight'
SELECT T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name, T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.eye_colour_id = T1.hair_colour_id AND T1.hair_colour_id = T1.skin_colour_id;
SELECT T2.race FROM superhero AS T1 JOIN superhero_race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN T3.colour_name = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.gender_name = 'Female';
SELECT T1.superhero_name, T2.race  FROM superhero AS T1  JOIN superhuman_races AS T2 ON T1.race_id = T2.id  WHERE T1.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T2.power_name = 'Adaptation'
SELECT COUNT(*) FROM superpower JOIN superhero ON superpower.id = superhero.power_id WHERE superhero.superhero_name = 'Amazo'
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id OR T1.hair_colour_id = T2.id WHERE T2.colour = 'Black' GROUP BY T1.superhero_name HAVING COUNT(*) = 2
SELECT superhero.eye_colour_id FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Gold';
SELECT T1.full_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Vampire'
SELECT T1.superhero_name FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral'
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power_attribute ON superhero_power.power_id = power_attribute.power_id WHERE power_attribute.attribute_name = 'Strength' AND power_attribute.attribute_value = (SELECT MAX(attribute_value) FROM power_attribute WHERE attribute_name = 'Strength');
SELECT T2.race, T3.alignment FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'Marvel Comics'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien'
SELECT ABS((SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler'))
SELECT AVG(height_cm) AS average_height FROM superhero WHERE height_cm > 0;
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T2.power_name = 'Speed' ORDER BY T2.power_name DESC LIMIT 1;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;
SELECT T1.full_name, T1.gender_id, T1.eye_colour_id, T1.hair_colour_id, T1.skin_colour_id, T1.race_id, T1.publisher_id, T1.alignment_id, T1.height_cm, T1.weight_kg FROM superhero AS T1 WHERE T1.superhero_name = '3-D Man'
SELECT T1.superhero_name FROM superhero AS T1 JOIN color AS T2 ON T1.eye_colour_id = T2.id WHERE T2.color = 'Blue' INTERSECT SELECT T1.superhero_name FROM superhero AS T1 JOIN color AS T2 ON T1.hair_colour_id = T2.id WHERE T2.color = 'Brown'
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy') GROUP BY T2.publisher_name HAVING COUNT(*) = 3
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT CAST(COUNT(CASE WHEN T2.color = 'Blue' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN color AS T2 ON T2.id = T1.eye_colour_id WHERE T2.id = 7;
SELECT CAST(SUM(CASE WHEN T2.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T2.power_name FROM superhero AS T1 JOIN superhero_power AS T3 ON T1.id = T3.superhero_id JOIN superpower AS T2 ON T2.id = T3.power_id WHERE T1.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 JOIN superhero ON T1.id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188;
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38
SELECT T2.race FROM (     SELECT id, MAX(height_cm) AS max_attribute_value FROM superhero UNION ALL      SELECT id, MAX(weight_kg) AS max_attribute_value FROM superhero ) AS T1 JOIN superhero AS T2 ON T1.id = T2.id WHERE T1.max_attribute_value = T2.height_cm OR T1.max_attribute_value = T2.weight_kg;
SELECT T3.power_name, T2.alignment_id FROM superhero AS T1 JOIN superhero_power AS T2 ON T1.id = T2.superhero_id JOIN superpower AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = 'Atom IV'
SELECT T1.full_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5;
SELECT AVG(height_cm), AVG(weight_kg) FROM superhero WHERE alignment_id = 3;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.attribute_value = 100;
SELECT COUNT(*) FROM superhero WHERE alignment_id = 1 AND gender_id = 2;
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 75 AND 80 OR weight_kg BETWEEN 75 AND 80;
SELECT race.race FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id JOIN gender ON superhero.gender_id = gender.id JOIN race ON superhero.race_id = race.id WHERE colour.colour = 'Blue' AND gender.gender = 'Male'
SELECT SUM(CASE WHEN T3.id = 2 THEN 1 ELSE 0 END) * 100 / COUNT(T2.id) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.id = 2 AND T3.id = 2;
SELECT (SELECT COUNT(*) FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL AND eye_colour_id = 7) - (SELECT COUNT(*) FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL AND eye_colour_id = 1) AS difference;
SELECT T2.attribute_value FROM superhero AS T1 JOIN superhero_attribute AS T2 ON T1.id = T2.superhero_id WHERE T1.superhero_name = 'Hulk' AND T2.attribute_name = 'Strength'
SELECT T3.power_name FROM superhero AS T1 JOIN superhero_power AS T2 ON T1.id = T2.superhero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Green' AND superhero.alignment_id = (SELECT id FROM alignment WHERE description = 'Bad');
SELECT COUNT(*) FROM superhero WHERE gender_id IN (SELECT id FROM gender WHERE name = 'Female') AND publisher_id IN (SELECT id FROM publisher WHERE name = 'Marvel Comics')
SELECT T1.superhero_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T2.power_name = 'Wind Control' ORDER BY T1.superhero_name ASC;
SELECT T1.gender_id FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T2.power_name = 'Phoenix Force'
SELECT superhero_name FROM superhero WHERE weight_kg = (SELECT MAX(weight_kg) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) AND publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')
SELECT AVG(T1.height_cm) FROM `superhero` AS T1 JOIN `publisher` AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race_id != (SELECT id FROM race WHERE race_name = 'Human')
SELECT COUNT(*) FROM superhero JOIN superhero_attribute ON superhero.id = superhero_attribute.superhero_id JOIN attribute ON attribute.id = superhero_attribute.attribute_id WHERE attribute.attribute_name = 'Speed' AND attribute.attribute_value = 100;
SELECT COUNT(*) AS dc_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' UNION SELECT COUNT(*) AS marvel_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'  SELECT (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics') - (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics') AS difference
SELECT T2.attribute_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.power_name LIMIT 1;
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(T2.id) FROM publisher AS T1 JOIN superhero AS T2 ON T1.id = T2.publisher_id JOIN gender AS T3 ON T3.id = T2.gender_id WHERE T1.publisher_name = 'George Lucas'
SELECT CAST(COUNT(CASE WHEN T2.alignment = 'Good' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T1.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT id FROM superhero WHERE height_cm = (SELECT MIN(height_cm) FROM superhero) OR weight_kg = (SELECT MIN(weight_kg) FROM superhero)
SELECT T1.full_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Alien'
SELECT T2.full_name FROM superhero AS T1 JOIN hero_attributes AS T2 ON T1.id = T2.hero_id WHERE T1.weight_kg < 100 AND T2.eye_colour_id = (SELECT id FROM color WHERE name = 'Brown')
SELECT T2.* FROM superhero AS T1 JOIN physical_attribute AS T2 ON T1.eye_colour_id = T2.id OR T1.hair_colour_id = T2.id OR T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Aquababy'
SELECT T1.weight_kg, T1.race_id FROM superhero AS T1 WHERE T1.id = 40
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'neutral' AND T1.height_cm != 0;
SELECT T1.id FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T2.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT T2.power_name FROM superhero AS T1 JOIN superpower AS T2 ON T1.id = T2.id WHERE T1.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT T2.driverref FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 20 ORDER BY T2.q1 DESC LIMIT 5
SELECT T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 19 ORDER BY T2.q2 LIMIT 1
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai'
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Germany'
SELECT T2.circuitRef FROM constructors AS T1 JOIN circuits AS T2 ON T1.constructorId = T2.circuitId WHERE T1.name = 'Renault'
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T2.country NOT IN ('China', 'Japan', 'Malaysia', 'Singapore', 'Turkey') AND T2.country NOT IN ('Austria', 'Belgium', 'Bulgaria', 'Czech Republic', 'Denmark', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Ireland', 'Italy', 'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 'Slovakia', 'Spain', 'Sweden', 'Switzerland', 'Ukraine', 'United Kingdom')
SELECT T1.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T2.country = 'Spain'
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.name = 'Australian Grand Prix'
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Abu Dhabi Grand Prix'
SELECT T3.nationality FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN constructors AS T3 ON T2.constructorid = T3.constructorid WHERE T1.raceid = 24 AND T2.points = 1
SELECT T2.time FROM races AS T1 JOIN qualifying AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T3.driverid = T2.driverid WHERE T1.raceid = 354 AND T3.forename = 'Bruno' AND T3.surname = 'Senna';
SELECT T1.nationality FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 355 AND T2.q2time = '01:40'
SELECT T2.number FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 LIKE '0:%:54'
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND results.time IS NULL AND races.year = 2007;
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.raceid = 901
SELECT COUNT(*) FROM results WHERE raceid IN (SELECT raceId FROM races WHERE date = '2015-11-29') AND time IS NOT NULL
SELECT drivers.driverRef FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE races.raceId = 592 AND results.time IS NOT NULL ORDER BY drivers.dob ASC LIMIT 1;
SELECT T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.raceid = 161 AND T2.laptime LIKE '0:01:27%'
SELECT T2.nationality FROM races AS T1 JOIN results AS T3 ON T1.raceId = T3.raceId JOIN drivers AS T2 ON T2.driverId = T3.driverId WHERE T1.raceId = 933 ORDER BY T3.fastestLapSpeed DESC LIMIT 1
SELECT T2.lat, T2.lng FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix'
SELECT T1.url FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE raceId = 9 ORDER BY points DESC LIMIT 1
SELECT T2.q1 FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 345 AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Lucas' AND surname = 'di Grassi')
SELECT T3.nationality FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.raceid = 347 AND T2.q2time = '01:15'
SELECT T2.code FROM races AS T1 JOIN drivers AS T2 ON T1.raceid = 45 AND T2.q3 LIKE '01:33%' WHERE T1.raceid = 45
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.raceid = 743 AND T2.driverid = (SELECT driverid FROM drivers WHERE forename = 'Bruce' AND surname = 'McLaren')
SELECT T1.driverRef FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'San Marino Grand Prix' AND T2.year = 2006 AND T1.position = 2
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE T1.raceid = 901
SELECT COUNT(*) FROM results WHERE raceid = (SELECT raceId FROM races WHERE date = '2015-11-29') AND time NOT LIKE '%:%'
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.raceId = 872 AND T2.time IS NOT NULL ORDER BY T3.dob DESC LIMIT 1
SELECT T1.driverRef ,  T2.forename ,  T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE raceId = 348 ORDER BY time ASC LIMIT 1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.fastestLapSpeed = (SELECT MAX(T2.fastestLapSpeed) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId)
SELECT ((SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 853) - (SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 854)) * 100 / (SELECT results.fastestLapSpeed FROM results JOIN races ON results.raceId = races.raceId WHERE results.driverId = (SELECT drivers.driverId FROM drivers WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta') AND races.raceId = 853) AS percentage;
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '1983-07-16'
SELECT MIN(date) FROM races WHERE name = 'Singapore Grand Prix'
SELECT COUNT(*) FROM races WHERE date LIKE '2005%' ; SELECT name FROM races WHERE date LIKE '2005%' ORDER BY name DESC ;
SELECT name FROM races WHERE date = (SELECT MIN(date) FROM races)
SELECT name, date FROM races WHERE YEAR = 1999 ORDER BY round DESC LIMIT 1;
SELECT strftime('%Y', date) AS year ,  COUNT(*) AS race_count FROM races GROUP BY year ORDER BY race_count DESC LIMIT 1;
SELECT name FROM races WHERE date LIKE '2017%' EXCEPT SELECT name FROM races WHERE date LIKE '2000%'
SELECT T2.country, T1.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix' ORDER BY T1.date ASC LIMIT 1;
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.name = 'Brands Hatch' AND T2.name = 'British Grand Prix' ORDER BY T2.year DESC LIMIT 1;
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit' AND T1.name = 'British Grand Prix'
SELECT T3.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = 'Singapore Grand Prix' AND YEAR(T1.date) = 2010 ORDER BY T2.position ASC
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE points = (SELECT MAX(points) FROM results)
SELECT T1.driverName ,  T1.points FROM races AS T2 JOIN results AS T3 ON T2.raceId = T3.raceId JOIN drivers AS T1 ON T1.driverId = T3.driverId WHERE T2.name = 'Chinese Grand Prix' AND YEAR(T2.date) = 2017 ORDER BY T1.points DESC LIMIT 3
SELECT T1.forename, T1.surname, T3.name FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM laptimes)
SELECT AVG(results.time)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  JOIN races ON results.raceId = races.raceId  WHERE drivers.forename || ' ' || drivers.surname = 'Lewis Hamilton'  AND races.name = 'Malaysian Grand Prix'  AND races.year = 2009;
SELECT CAST(SUM(CASE WHEN T3.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.raceId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.surname = 'Hamilton' AND T1.year >= 2010
SELECT T1.nationality ,  T2.forename ,  T2.surname ,  MAX(T3.points) FROM constructors AS T1 JOIN constructorStandings AS T3 ON T1.constructorid = T3.constructorid JOIN drivers AS T2 WHERE T2.driverid = ( SELECT driverid FROM results GROUP BY driverid ORDER BY COUNT(wins) DESC LIMIT 1 )
SELECT MIN(YEAR(CURRENT_TIMESTAMP) - YEAR(dob)) AS youngest_age ,  name FROM drivers WHERE nationality = 'Japanese' GROUP BY name ORDER BY dob DESC LIMIT 1
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY T1.circuitId HAVING COUNT(*) >= 4
SELECT T1.name, T1.location, T2.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.country = 'USA' AND strftime('%Y', T2.date) = '2006'
SELECT T1.name, T2.name, T2.location FROM races AS T1 JOIN circuits AS T2 ON T1.circuitid = T2.circuitid WHERE MONTH(T1.date) = 9 AND YEAR(T1.date) = 2005
SELECT races.name FROM races JOIN results ON races.raceId = results.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T3.name = 'Sepang International Circuit' AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher') GROUP BY T2.driverid ORDER BY SUM(T2.points) DESC LIMIT 1
SELECT races.name, races.year FROM races JOIN results ON races.raceid = results.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' ORDER BY results.milliseconds ASC LIMIT 1;
SELECT AVG(T1.points) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.name = 'Eddie Irvine' AND T1.year = 2000
SELECT races.name, results.points FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY races.year ASC LIMIT 1;
SELECT T1.name, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE strftime('%Y', T1.date) = '2017' ORDER BY T1.date ASC;
SELECT T2.name, T2.date, T1.location FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T2.laps = (SELECT MAX(laps) FROM races)
SELECT CAST(SUM(IIF(T2.country = "Germany", 1, 0)) AS REAL) * 100 / COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = "European Grand Prix"
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring'))
SELECT T1.circuitRef FROM circuits AS T1 WHERE T1.name = "Marina Bay Street Circuit"
SELECT T1.country FROM circuits AS T1 WHERE T1.alt = (SELECT MAX(T2.alt) FROM circuits AS T2)
SELECT COUNT(*) FROM drivers WHERE code IS NULL
SELECT T2.nationality FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.dob = ( SELECT MIN(dob) FROM drivers )
SELECT T1.surname FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Italian" GROUP BY T1.surname
SELECT T1.url FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Anthony" AND T1.surname = "Davidson" LIMIT 1;
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.name = "Lewis Hamilton" GROUP BY T1.driverRef
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T2.name = 'Spanish Grand Prix' AND T2.date LIKE '2009%'
SELECT T2.year FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitRef WHERE T1.name = 'Silverstone Circuit'
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T1.name = 'Silverstone Circuit'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Abu Dhabi Circuit' AND T1.date BETWEEN '2010-01-01' AND '2019-12-31'
SELECT COUNT(*) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'
SELECT T2.date FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T2.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Spanish Grand Prix' AND T1.date LIKE '2009%'
SELECT MIN(T2.fastestLapTime) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T2.forename ,  T2.surname FROM results AS T1 JOIN drivers AS T2 ON T1.driverid = T2.driverid WHERE T1.fastestlapspeed = ( SELECT MAX(fastestlapspeed) FROM results )
SELECT T2.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2007 ORDER BY T2.position ASC LIMIT 1
SELECT T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT races.name FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.position ASC LIMIT 1;
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT DISTINCT T2.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = "Lewis" AND T1.surname = "Hamilton";
SELECT results.positionOrder FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix' AND races.year = 2008
SELECT T3.forename ,  T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 1989 AND T2.grid = 4
SELECT COUNT(*) FROM results WHERE raceId = (SELECT id FROM races WHERE name = 'Australian Grand Prix' AND date = '2008-03-16') AND time IS NOT NULL
SELECT T3.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN laps AS T3 ON T2.resultid = T3.resultid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY T3.milliseconds ASC LIMIT 1
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.position = 2
SELECT T1.driverRef ,  T1.url FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Australian Grand Prix' AND T2.year = 2008 AND T1.positionOrder = 1
SELECT COUNT(*)  FROM results  JOIN drivers ON results.driverId = drivers.driverId  WHERE results.raceId = (SELECT races.raceId FROM races WHERE races.name = 'Australian Grand Prix' AND YEAR(races.date) = 2008)  AND drivers.nationality = 'British';
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Chinese Grand Prix' AND T2.year = 2008 AND T1.time IS NOT NULL
SELECT SUM(T2.points) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(T2.fastestLapTime) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND T1.series = 'Formula_1'
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.raceId) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid WHERE T2.name = 'Australian Grand Prix' AND T2.year = 2008
SELECT (T2.time - T1.time) * 100 / T2.time FROM (SELECT time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008) AND position = 1) AS T1, (SELECT SUM(time) AS time FROM results WHERE raceId = (SELECT raceId FROM races WHERE name = 'Australian Grand Prix' AND year = 2008)) AS T2
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) > 1980;
SELECT MAX(T1.points) FROM constructorStandings AS T1 JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T2.nationality = "British"
SELECT T1.constructorRef FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId GROUP BY T1.constructorRef ORDER BY SUM(T2.points) DESC LIMIT 1;
SELECT T3.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.raceId = 291 AND T2.points = 0
SELECT COUNT(*) FROM (SELECT T1.constructorId FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = "Japanese" AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(T2.raceId) = 2)
SELECT constructorRef FROM results WHERE position = 1 GROUP BY constructorRef
SELECT COUNT(*) FROM constructors AS T1 JOIN constructorresults AS T2 ON T1.constructorid = T2.constructorid WHERE T1.nationality = "French" AND T2.laps > 50;
SELECT CAST(COUNT(CASE WHEN T3.time IS NOT NULL THEN T1.driverId ELSE NULL END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.year BETWEEN 2007 AND 2009 AND T2.nationality = 'Japanese'
SELECT AVG(T2.time) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year < 1975 AND T2.position = 1 AND T2.time NOT NULL GROUP BY T1.year
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.dob > '1975-01-01' AND T2.position = '2'
SELECT COUNT(*) FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = "Italian" AND T1.time IS NULL;
SELECT T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T2.fastestlaptime = ( SELECT MIN(fastestlaptime) FROM results )
SELECT T3.number FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN laps AS T3 ON T2.resultid = T3.resultid WHERE T1.year = 2009 ORDER BY T3.milliseconds ASC LIMIT 1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT T1.name ,  strftime('%Y',T1.date) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.milliseconds != 'NULL' ORDER BY T2.milliseconds LIMIT 1;
SELECT CAST(SUM(CASE WHEN T3.year < 1985 AND T1.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T2.year BETWEEN 2000 AND 2005
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = "French" AND T2.laptime < "02:00.00" AND T2.laptime < "120"
SELECT driverRef FROM drivers WHERE nationality = 'American'
SELECT circuitId FROM races WHERE date LIKE '2009%'
SELECT COUNT(*) FROM results WHERE raceId = 18;
SELECT T1.driverId ,  COUNT(T1.driverId) FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = "Dutch" GROUP BY T1.driverId ORDER BY T1.dob DESC LIMIT 3
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.name = "Robert Kubica" LIMIT 1;
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND YEAR(dob) = 1980;
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.nationality = 'German' AND strftime('%Y', T3.dob) BETWEEN '1980' AND '1990' ORDER BY T2.fastestlaptime ASC LIMIT 3
SELECT T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' ORDER BY STRFTIME('%Y', T1.dob) ASC LIMIT 1;
SELECT T2.driverId, T2.code FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE YEAR(T2.dob) = 1971 AND T1.fastestLapTime IS NOT NULL GROUP BY T2.driverId, T2.code ORDER BY T1.fastestLapTime LIMIT 1
SELECT T3.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T3.nationality = "Spanish" AND YEAR(T3.dob) < 1982 ORDER BY T2.time DESC LIMIT 10
SELECT year FROM races WHERE fastestLapTime = (SELECT MIN(fastestLapTime) FROM races)
SELECT date FROM races WHERE time = (SELECT MAX(time) FROM races) LIMIT 1;
SELECT T1.driverId FROM (SELECT driverId, MIN(time) AS min_time FROM laps GROUP BY driverId) AS T1 JOIN (SELECT driverId, time AS first_lap_time FROM laps WHERE lap = 1 GROUP BY driverId) AS T2 ON T1.driverId = T2.driverId WHERE T1.min_time = T2.first_lap_time ORDER BY T1.min_time LIMIT 5
SELECT COUNT(*) FROM results WHERE raceId BETWEEN 50 AND 100 AND statusId = 2 AND time IS NOT NULL
SELECT COUNT(*), T1.location, T1.lat, T1.lng FROM circuits AS T1 JOIN races AS T2 ON T1.circuitid = T2.circuitid WHERE T1.country = 'Austria' GROUP BY T1.location, T1.lat, T1.lng
SELECT T1.raceId, COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time IS NOT NULL GROUP BY T1.raceId ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.driverRef, T1.nationality, T1.dob FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 23 AND T2.q2 IS NOT NULL;
SELECT T3.year, T3.name, T3.date, T3.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MIN(dob) FROM drivers) AND T3.date = (SELECT MIN(date) FROM races)
SELECT COUNT(*) FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.nationality = "American" AND T2.status = "Puncture"
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1;
SELECT T1.url FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T2.position = 1 GROUP BY T1.constructorId ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.driver FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'French Grand Prix' ORDER BY T2.time DESC LIMIT 1;
SELECT T2.name, MIN(T1.time) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.lap = 1 GROUP BY T2.name ORDER BY MIN(T1.time) ASC LIMIT 1;
SELECT AVG(T3.fastestlaptime) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN (SELECT raceid, driverid, fastestlaptime, RANK() OVER(PARTITION BY raceid ORDER BY fastestlaptime ASC) as rank FROM results) AS T3 ON T2.raceid = T3.raceid AND T2.driverid = T3.driverid WHERE T1.name = 'United States Grand Prix' AND T1.year = 2006 AND T3.rank < 11
SELECT T3.forename, T3.surname FROM (SELECT T2.driverId, AVG(T1.duration) as avg_duration FROM pitStops AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'German' AND strftime('%Y', T2.dob) BETWEEN '1980' AND '1985' GROUP BY T2.driverId) AS T4 JOIN drivers AS T3 ON T4.driverId = T3.driverId ORDER BY T4.avg_duration LIMIT 3
SELECT T3.time FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN circuits AS T3 ON T1.circuitid = T3.circuitid WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2008 AND T2.position = 1
SELECT T1.constructorRef, T1.url FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Singapore Grand Prix' AND T2.year = 2009 ORDER BY T1.time ASC LIMIT 1
SELECT T1.forename, T1.surname, T1.dob FROM drivers AS T1 JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Austrian' AND YEAR(T1.dob) BETWEEN 1981 AND 1991
SELECT T1.forename, T1.surname, T1.wikipedia_link, T2.date_of_birth  FROM drivers AS T1  JOIN driverStandings AS T2 ON T1.driverId = T2.driverId  WHERE T1.nationality = 'German' AND YEAR(T2.date_of_birth) BETWEEN 1971 AND 1985  ORDER BY T2.date_of_birth DESC;
SELECT T1.location, T1.country, T1.lat, T1.lng FROM circuits AS T1 WHERE T1.name = 'Hungaroring'
SELECT MAX(results.points), constructors.name, constructors.nationality  FROM results  JOIN constructors ON results.constructorId = constructors.constructorId  JOIN races ON results.raceId = races.raceId  WHERE races.name = 'Monaco Grand Prix' AND races.year BETWEEN 1980 AND 2010  GROUP BY constructors.constructorId;
SELECT AVG(T3.points) FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.name = 'Turkish Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'
SELECT AVG(cnt) FROM (SELECT COUNT(*) AS cnt FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY strftime('%Y', date)) AS yearly_cnts;
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE rank = '91') AND T2.position = 1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T2.fastestlaptime IS NOT NULL ORDER BY T2.fastestlaptime LIMIT 1
SELECT T2.location, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.date = (SELECT MAX(date) FROM races)
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T2.driverid = T3.driverid WHERE T1.year = 2008 AND T1.circuitid IN (SELECT circuitid FROM circuits WHERE name = 'Marina Bay Street Circuit') ORDER BY T2.q3 ASC LIMIT 1
SELECT T1.forename, T1.surname, T1.nationality, T3.name FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T1.dob = (SELECT MAX(dob) FROM drivers)
SELECT COUNT(*) FROM results WHERE raceId IN (SELECT raceId FROM races WHERE name = 'Canadian Grand Prix') AND statusId = 3 GROUP BY driverId ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) , T1.forename ,  T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid WHERE T1.dob = ( SELECT MIN(dob) FROM drivers ) AND T2.position = '1' GROUP BY T1.forename ,  T1.surname
SELECT MAX(time) FROM races WHERE name = 'Pit Stop'
SELECT T1.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.position = 1 ORDER BY T1.time LIMIT 1
SELECT MAX(T2.duration) FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT T3.lap FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN pitstops AS T3 ON T2.resultid = T3.driverid WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2011 AND T2.driverid IN (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT T3.duration FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid JOIN pitStops AS T3 ON T2.driverid = T3.driverid AND T2.stop = T3.stop WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2011
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') ORDER BY T2.time LIMIT 1;
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN laptimes AS T2 ON T1.driverid = T2.driverid WHERE T2.rank = 1 ORDER BY T2.time LIMIT 1;
SELECT T2.position FROM (SELECT circuitId, MIN(time) AS fastest_lap_time FROM races GROUP BY circuitId) AS T1 JOIN results AS T2 ON T1.circuitId = T2.circuitId AND T1.fastest_lap_time = T2.time WHERE T2.driver = 'Lewis Hamilton'
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T1.time LIMIT 1;
SELECT T1.name, MIN(T2.time) FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T1.country = 'Italy' GROUP BY T1.name
SELECT T2.name FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T1.time LIMIT 1
SELECT T2.duration FROM races AS T1 JOIN results AS T2 ON T1.raceid = T2.raceid WHERE T1.name = 'Austrian Grand Prix' AND T2.fastestlap = 1;
SELECT T2.lat, T2.lng FROM results AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.fastestLapTime = '1:29.488'
SELECT AVG(T2.milliseconds) FROM races AS T1 JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T2.driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')
SELECT AVG(T2.milliseconds) FROM circuits AS T1 JOIN laps AS T2 ON T1.circuitid = T2.circuit_id WHERE T1.country = 'Italy'
SELECT T2.player_api_id FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT player_name, MAX(height) FROM Player
SELECT T1.preferred_foot FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.preferred_foot IS NOT NULL AND T1.attacking_work_rate IS NOT NULL ORDER BY T2.potential ASC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'Low'
SELECT T1.player_name, T2.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.crossing IS NOT NULL ORDER BY T2.crossing DESC LIMIT 5;
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.id ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) DESC LIMIT 1
SELECT T1.team_api_id FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.season = '2015/2016' AND (T2.home_team_goal - T2.away_team_goal) < 0 GROUP BY T1.team_api_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.penalties IS NOT NULL ORDER BY T1.penalties DESC LIMIT 10;
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.season = '2009/2010' AND T2.league_id IN (SELECT League.id FROM League WHERE League.name = 'Scotland Premier League') GROUP BY T2.away_team_api_id HAVING SUM(CASE WHEN T2.away_team_goal > T2.home_team_goal THEN 1 ELSE 0 END) >= ALL(SELECT SUM(CASE WHEN T3.away_team_goal > T3.home_team_goal THEN 1 ELSE 0 END) FROM Match AS T3 WHERE T3.season = '2009/2010' AND T3.league_id IN (SELECT League.id FROM League WHERE League.name = 'Scotland Premier League') GROUP BY T3.away_team_api_id)
SELECT T2.buildUpPlaySpeed FROM Player AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed IN (SELECT buildUpPlaySpeed FROM Team ORDER BY buildUpPlaySpeed DESC LIMIT 4) GROUP BY T2.buildUpPlaySpeed ORDER BY T2.buildUpPlaySpeed DESC
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2015/2016' GROUP BY T1.name ORDER BY SUM(CASE WHEN T2.home_team_goal = T2.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT T1.player_name ,  (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) AS age FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.sprint_speed >= 97 AND T2.date BETWEEN '2013-01-01' AND '2015-12-31'
SELECT T2.name ,  COUNT(T1.league_id) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T1.league_id ORDER BY COUNT(T1.league_id) DESC LIMIT 1
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE SUBSTR(T2.date, 1, 4) = '2010' GROUP BY T1.player_api_id HAVING AVG(T2.overall_rating) > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE SUBSTR(date, 1, 4) = '2010') ORDER BY AVG(T2.overall_rating) DESC LIMIT 1
SELECT team_fifa_api_id FROM Team WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Teams AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012') AND strftime('%Y', T1.date) = '2012'
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) * 100 AS REAL) / COUNT(T1.player_fifa_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T1.birthday) BETWEEN '1987' AND '1992'
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id GROUP BY T1.name ORDER BY SUM(T2.home_team_goal + T2.away_team_goal) ASC LIMIT 5
SELECT AVG(T2.long_shots) FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ahmed Samir Farag'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.height > 180 GROUP BY T2.player_fifa_api_id ORDER BY AVG(T1.heading_accuracy) DESC LIMIT 10
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00' AND T1.chanceCreationPassing < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes WHERE date BETWEEN '2014-01-01 00:00:00' AND '2014-01-31 00:00:00') ORDER BY T1.chanceCreationPassing DESC
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.country_id = T2.country_id WHERE T2.season = '2009/2010' GROUP BY T1.name HAVING SUM(T2.home_team_goal) / COUNT(DISTINCT T2.id) > SUM(T2.away_team_goal) / COUNT(DISTINCT T2.id)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers' LIMIT 1;
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'
SELECT T2.attacking_work_rate FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Franco Zennaro" ORDER BY T2.date DESC LIMIT 1
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'ADO Den Haag' AND T2.date = (SELECT MAX(date) FROM Team_Attributes WHERE team_fifa_api_id = (SELECT team_api_id FROM Team WHERE team_long_name = 'ADO Den Haag'))
SELECT T1.heading_accuracy FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Francois Affolter' AND T1.date = '2014-09-18 00:00:00'
SELECT T1.overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = "Gabriel Tamas" AND strftime('%Y', T1.date) = '2011'
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_id IN (SELECT id FROM League WHERE name = 'Scotland Premier League')
SELECT T1.preferred_foot FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T2.birthday DESC LIMIT 1;
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT COUNT(*) FROM Player WHERE weight < 130 AND preferred_foot = 'left'
SELECT T1.team_short_name FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Risky' GROUP BY T1.team_short_name;
SELECT T2.DW FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'David Wilson' ORDER BY T2.date DESC LIMIT 1
SELECT T2.birthday FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT T1.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = "Netherlands"
SELECT AVG(T2.home_team_goal) FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T1.name = 'Poland' AND T3.season = '2010/2011'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height = (SELECT MAX(T1.height) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_name HAVING AVG(T2.finishing) = (SELECT MAX(AVG(finishing)) FROM Player_Attributes GROUP BY player_api_id)) OR T1.height = (SELECT MIN(T1.height) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id GROUP BY T1.player_name HAVING AVG(T2.finishing) = (SELECT MAX(AVG(finishing)) FROM Player_Attributes GROUP BY player_api_id))
SELECT player_name FROM Player WHERE height > 180
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating > 80 AND strftime('%Y', T1.date) BETWEEN '2008' AND '2010' GROUP BY T2.player_name
SELECT T2.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = "Aaron Doran" ORDER BY T2.date DESC LIMIT 1;
SELECT player_name FROM Player WHERE preferred_foot = 'left'
SELECT T1.team_long_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast' GROUP BY T1.team_long_name
SELECT buildUpPlayPassingClass FROM Team WHERE team_short_name = 'CLB'
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlayPassing > 70
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 170 AND strftime('%Y', T2.date) BETWEEN '2010' AND '2015'
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)
SELECT T1.country FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = "Italy Serie A"
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Germany 1. Bundesliga') AND strftime('%Y-%m', date) BETWEEN '2008-08' AND '2008-10'
SELECT T2.team_short_name FROM Match AS T1 JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10
SELECT player_name FROM Player WHERE balance = (SELECT MAX(T1.balance) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = 61) AND potential = 61;
SELECT (SUM(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T2.ball_control ELSE 0 END) / COUNT(CASE WHEN T1.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN' LIMIT 1;
SELECT player_name FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY STRFTIME('%Y-%m-%d', birthday) LIMIT 1;
SELECT player_name FROM Player WHERE height = (SELECT MAX(height) FROM Player)
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T1.country FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = "Belgium Jupiler League"
SELECT League.name FROM League JOIN Country ON League.country_id = Country.id WHERE Country.name = 'Germany'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.attribute = 'Overall Rating' ORDER BY T1.value DESC LIMIT 1;
SELECT COUNT(DISTINCT T2.player_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id  =  T2.player_fifa_api_id WHERE strftime('%Y',T2.birthday) < '1986' AND T1.defensive_work_rate  =  'High'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY crossing DESC LIMIT 1
SELECT T2.BHA FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk'
SELECT COUNT(*) FROM Player WHERE height > 180 AND volleys > 70
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.volly > 70 AND T2.dribbling > 70 GROUP BY T1.player_name
SELECT COUNT(*) FROM Match WHERE season = '2008/2009' AND country_id IN (SELECT id FROM Country WHERE name = 'Belgium')
SELECT MAX(T1.long_passing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.long_passing IS NOT NULL AND T2.birthday IS NOT NULL ORDER BY T2.birthday LIMIT 1
SELECT COUNT(*) FROM Match WHERE league_id IN (SELECT id FROM League WHERE name = 'Belgium Jupiler League') AND date LIKE '2009-04%'
SELECT T1.name FROM League AS T1 JOIN Match AS T2 ON T1.id = T2.league_id WHERE T2.season = '2008/2009' GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986'
SELECT (T2.overall_rating - T1.overall_rating) / T1.overall_rating * 100 FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ariel Borysiuk' AND T2.overall_rating IN (SELECT overall_rating FROM Player_Stats WHERE player_api_id IN (SELECT player_api_id FROM Player WHERE player_name = 'Paulin Puel'))
SELECT AVG(T2.buildUpPlaySpeed) FROM Player AS T1 JOIN Player_Stats AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Lennox'
SELECT T2.chanceCreationPassingClass FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.team_long_name = 'Ajax' ORDER BY T2.chanceCreationPassing DESC LIMIT 1
SELECT T1.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Abdou Diallo' GROUP BY T1.preferred_foot ORDER BY COUNT(T2.id) DESC LIMIT 1
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(T2.away_team_goal) FROM Matches AS T1 JOIN League AS T2 ON T1.match_api_id = T2.match_api_id WHERE T1.team_long_name = 'Parma' AND T1.country = 'Italy'
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating = 77 AND T2.date LIKE '2016-06-23%' ORDER BY T1.birthday ASC LIMIT 1
SELECT T1.overall_rating FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Aaron Mooy' AND T1.date LIKE '2016-02-04%'
SELECT T1.potential FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Francesco Parravicini' AND T1.date = '2010-08-30 00:00:00'
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date LIKE '2015-05-01%'
SELECT T1.DW FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Berigaud' AND T1.date = '2013-02-22 00:00:00'
SELECT T1.date FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Kevin Constant' AND T1.crossing = (SELECT MAX(crossing) FROM Player_Attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM Player WHERE player_name = 'Kevin Constant'))
SELECT T3.BUPS FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2012-02-22' JOIN Team_Attributes AS T3 ON T1.team_api_id = T3.team_api_id AND T2.date = T3.date
SELECT T3.BUP FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.player_fifa_api_id JOIN Player AS T3 ON T2.player_fifa_api_id = T3.player_fifa_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'
SELECT T3.BUP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id JOIN Team_Statistics AS T3 ON T2.id = T3.match_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'
SELECT T4.CCP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00' UNION SELECT T4.CCP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'
SELECT T3.CC FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.date = '2010-02-22 00:00:00' AND T1.team_long_name = 'Hull City' UNION SELECT T3.CC FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.date = '2010-02-22 00:00:00' AND T1.team_long_name = 'Hull City'
SELECT T1.def_aggression FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Marko Arnautovic' AND SUBSTR(T1.date, 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'
SELECT (SUM(CASE WHEN T2.player_name = 'Landon Donovan' THEN T1.overall_rating ELSE 0 END) - SUM(CASE WHEN T2.player_name = 'Jordan Bowery' THEN T1.overall_rating ELSE 0 END)) / SUM(CASE WHEN T2.player_name = 'Landon Donovan' THEN T1.overall_rating ELSE 0 END) * 100 FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE date = '2013-07-12'
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE (datetime('now','localtime') - datetime(birthday)) / 365 >= 35
SELECT COUNT(T1.home_team_goal) FROM Match AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = "Aaron Lennon"
SELECT SUM(T2.away_team_goal) FROM Player AS T1 JOIN Game AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(T2.home_team_goal) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.player_api_id WHERE (datetime('now') - datetime(T1.birthday)) / 365 < 31
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT player_name FROM Player WHERE attacking_work_rate = 'High'
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.finishing = 1 ORDER BY datetime('now') - datetime(T2.birthday) DESC LIMIT 1
SELECT T2.player_name FROM Country AS T1 JOIN Player_Attributes AS T2 ON T1.id = T2.player_api_id WHERE T1.name = 'Belgium'
SELECT T1.player_name ,  T2.country_name FROM Player_Attributes AS T1 JOIN Country AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.vision > 89
SELECT T1.country_name FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id GROUP BY T1.country_name ORDER BY AVG(T2.weight) DESC LIMIT 1
SELECT T2.team_long_name FROM Team_Attributes AS T1 JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow' GROUP BY T2.team_long_name
SELECT T1.team_short_name FROM Team AS T1 JOIN Player_Attributes AS T2 ON T1.team_api_id = T2.player_team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T2.height) FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01'
SELECT (SELECT JUMPING FROM Player_Attributes WHERE player_fifa_api_id = 6) - (SELECT JUMPING FROM Player_Attributes WHERE player_fifa_api_id = 23) AS difference_in_jumping_scores
SELECT T1.player_api_id FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.preferred_foot = 'right' ORDER BY T2.potential ASC LIMIT 5;
SELECT COUNT(*) FROM Player WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player)
SELECT CAST(SUM(CASE WHEN T1.stamina > 80 AND T1.strength > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id
SELECT T2.country FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Poland Ekstraklasa'
SELECT T1.home_team_goal , T1.away_team_goal FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.date LIKE '2008-09-24%' AND T2.name = 'Belgium Jupiler League'
SELECT T1.sprint_speed ,  T1.agility ,  T1.acceleration FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = "Alexis Blin"
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' ORDER BY T2.date DESC LIMIT 1
SELECT COUNT(*) FROM Game WHERE season = '2015/2016' AND league = 'Italian Serie A'
SELECT MAX(T1.home_team_goal) FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.country = 'Netherlands' AND T2.name = 'Eredivisie'
SELECT T1.finishing, T1.curve FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.weight = (SELECT MAX(weight) FROM Player) LIMIT 1;
SELECT T2.name FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T1.league_id ORDER BY COUNT(T1.id) DESC LIMIT 4;
SELECT T1.team_long_name FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T2.away_team_goal = (SELECT MAX(away_team_goal) FROM Match)
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes) LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.height < 180 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 70
SELECT      (COUNT(CASE WHEN `Admission` = '+' THEN `ID` END) /       (COUNT(CASE WHEN `Admission` = '-' THEN `ID` END))) * 100 AS percentage_deviation,     SUM(CASE WHEN `Admission` = '+' THEN 1 ELSE 0 END) AS in_patient_count,     SUM(CASE WHEN `Admission` = '-' THEN 1 ELSE 0 END) AS out_patient_count FROM Examination WHERE SEX = 'M'
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' AND YEAR(T2.Birthday) > 1930 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CASE WHEN T2.SEX = 'F' THEN 1 ELSE NULL END) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID
SELECT CAST(SUM(CASE WHEN T2.Admisson = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM ( SELECT ID FROM Examination WHERE Examination_Date BETWEEN '1930-01-01' AND '1940-12-31' ) AS T1 JOIN ( SELECT * FROM Examination ) AS T2 ON T1.ID = T2.ID
SELECT CAST(SUM(CASE WHEN T2.Admisson = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.Admisson = '-' THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN (SELECT ID, CASE WHEN Diagnosis = 'SLE' THEN 'SLE' ELSE 'Others' END AS Diagnosis, Admission FROM Patients) AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE'
SELECT T1.Diagnosis, T2.Examination_Date FROM Examination AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.Patient = 30609 GROUP BY T1.Diagnosis, T2.Examination_Date ORDER BY T2.Examination_Date ASC
SELECT T1.Sex ,  T1.Birthday ,  T2.Examination_Date ,  T2.Symptoms FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = '163109'
SELECT T1.ID, T1.Sex, T1.Birthday FROM patient AS T1 JOIN lab_test AS T2 ON T1.ID = T2.Patient WHERE T2.LDH > 500
SELECT T1.ID, (YEAR(CURRENT_TIMESTAMP) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'
SELECT T1.ID, T1.Sex, T2.Diagnosis FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2;
SELECT T1.ID FROM Examination AS T1 JOIN BloodTest AS T2 ON T1.ID = T2.Patient WHERE YEAR(T1.Birthday) = 1937 AND T2.T_CHO >= 250
SELECT T1.ID, T2.Sex, T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.aLB < 3.5
SELECT CAST(SUM(CASE WHEN T2.sex = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID
SELECT AVG(T2.aCL_IgG) FROM Admission AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM T1.Birthday) >= 50
SELECT COUNT(*) FROM Examination WHERE `Examination Date` LIKE '1997%' AND Admission = '-' AND Sex = 'F'
SELECT MIN(T2.age) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.Patient_ID WHERE T2.age BETWEEN 0 AND 15 OR T2.age BETWEEN 65 AND 100
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 1 AND Examination_Date LIKE '1997%' AND ID IN (SELECT ID FROM Patient WHERE Sex = 'F')
SELECT MAX(T2.Birthday) - MIN(T2.Birthday) AS AgeGap FROM `Lab Test` AS T1 JOIN `Patient` AS T2 ON T1.Patient_ID = T2.ID WHERE T1.Lab_Test_Name = 'TG' AND CAST(REPLACE(SUBSTRING_INDEX(T1.Lab_Test_Value, '<', 1), ',', '.') AS REAL) >= 200
SELECT T2.Symptoms, T2.Diagnosis FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = (SELECT MIN(Birthday) FROM Patient WHERE ID IN (SELECT ID FROM Examination WHERE Symptoms IS NOT NULL))
SELECT COUNT(T1.ID) / 12 AS average_male_patients_per_month FROM Examination AS T1 JOIN Patients AS T2 ON T1.ID = T2.ID WHERE T1.Examination_Date BETWEEN '1998-01-01' AND '1998-12-31' AND T2.SEX = 'M'
SELECT T1.Examination_Date ,  T2.Birthday FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis LIKE '%SJS%' ORDER BY T2.Birthday LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.SEX = 'M' AND T1.UA <= 8 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.SEX = 'F' AND T1.UA <= 6.5 THEN 1 ELSE 0 END) FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T1.Lab_Test_Name = 'uric acid'
SELECT COUNT(DISTINCT T2.ID) FROM Hospital_Visit AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE (YEAR(T2.Examination_Date) - YEAR(T1.First_Date)) >= 1
SELECT COUNT(*) FROM Examination WHERE YEAR(`Examination Date`) BETWEEN '1990' AND '1993' AND ID IN (SELECT ID FROM Patient WHERE YEAR(Birthday) < 18)
SELECT COUNT(*) FROM Lab WHERE T_BIL >= 2.0 AND SEX = 'M'
SELECT Diagnosis  FROM Examination  WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  GROUP BY Diagnosis  ORDER BY COUNT(Diagnosis) DESC  LIMIT 1;
SELECT AVG(CAST('1999' - SUBSTR(Patient.Birthday, 1, 4) AS REAL)) FROM Patient JOIN Examination ON Patient.ID = Examination.ID WHERE Examination.Examination_Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT T1.Birthday ,  T2.Diagnosis FROM `Patient Basic Information` AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.HGB = ( SELECT MAX(HGB) FROM Laboratory )
SELECT ANA FROM Examination WHERE ID = 3605340 AND Examination_Date = '1996-12-02'
SELECT T1.Total_Cholesterol_Status FROM Biochemistry_Exam AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 2927464 AND T1.Examination_Date = '1995-09-04' AND T1.Total_Cholesterol_Status < 250
SELECT T1.SEX FROM Patients AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'AORTITIS' ORDER BY T2.Examination_Date ASC LIMIT 1;
SELECT aCL_IgM FROM Examination WHERE Diagnosis = 'SLE' AND Examination_Date = '1994-02-19' AND ID IN (SELECT ID FROM Examination WHERE Examination_Date = '1993-11-12')
SELECT T1.SEX FROM patient AS T1 JOIN examination AS T2 ON T1.ID = T2.ID WHERE T2.GPT = 9 AND T2.Date = '1992-06-12'
SELECT T2.age FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.UA = 8.4 AND T1.Examination_Date = '1991-10-21'
SELECT COUNT(T2.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' AND T1.Examination_Date > '1995-01-01' AND T1.Examination_Date < '1995-12-31' AND T1.First_Date = '1991-06-13'
SELECT Diagnosis FROM Examination WHERE Examination_Date = '1997-01-27' AND Diagnosis LIKE '%SLE%' ORDER BY ID ASC LIMIT 1
SELECT Symptoms FROM Examination WHERE ID = (SELECT ID FROM Patient WHERE Birthday = '1959-03-01') AND Examination_Date = '1993-09-27'
SELECT (SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T1.ExaminationDate) = '1981-11' THEN T2.T_CHO ELSE 0 END) - SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T1.ExaminationDate) = '1981-12' THEN T2.T_CHO ELSE 0 END)) / SUM(CASE WHEN T1.Birthday = '1959-02-18' AND strftime('%Y-%m', T1.ExaminationDate) = '1981-11' THEN T2.T_CHO ELSE 0 END) FROM Examination AS T1 JOIN BloodTest AS T2 ON T1.ID = T2.PatientID
SELECT ID FROM Examination WHERE Diagnosis = 'Behcet' AND Examination_Date BETWEEN '1997-01-01' AND '1997-12-31'
SELECT ID FROM Examination WHERE Examination_Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4 ORDER BY ID
SELECT COUNT(*), ID FROM Patient WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+' GROUP BY ID;
SELECT COUNT(*) FROM Examination WHERE `Thrombosis` = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination)
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN U_PRO > 0 AND U_PRO < 30 THEN 1 ELSE 0 END) FROM Examination WHERE Diagnosis IN ('MCTD, AMI', 'SLE', 'PSS', 'None', 'SLE, SjS, vertigo')
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination WHERE `Examination Date` LIKE '1981%' AND ID IN (SELECT ID FROM Examination WHERE `Examination Date` IS (SELECT MIN(`Examination Date`) FROM Examination GROUP BY ID HAVING strftime('%Y', `Examination Date`) = '1981'))
SELECT E.ID FROM Examination AS E JOIN LabTest AS LT ON E.ID = LT.Patient_ID WHERE E.ADMISSION = '-' AND LT.Date LIKE '1991-10%' AND LT.T_BIL < 2.0
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31' AND ID NOT IN (SELECT ID FROM Examination WHERE ANA_Pattern = 'P')
SELECT T1.Sex FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'PSS' AND T1.CRP > 2 AND T1.CRE = 1 AND T1.LDH = 123
SELECT AVG(Examination.ALB)  FROM Examination  WHERE Examination.SEX = 'F'  AND Examination.PLT > 400  AND Examination.Diagnosis = 'SLE';
SELECT Symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY Symptoms ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Examination_Date, T2.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.Patient_ID WHERE T2.Patient_ID = 48473 ORDER BY T1.Examination_Date ASC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'APS' AND ID IN (SELECT ID FROM Patient WHERE SEX = 'F')
SELECT COUNT(*) FROM Laboratory WHERE DATE LIKE '1997%' AND (tp < 6 OR tp > 8.5)
SELECT CAST(SUM(CASE WHEN T2.Symptoms = 'thrombocytopenia' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.Diagnosis LIKE '%SLE%' THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.Patient_ID WHERE T2.Symptoms = 'thrombocytopenia' AND T2.Diagnosis LIKE '%SLE%'
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Examination WHERE Diagnosis = 'RA' AND YEAR(BIRTHDAY) = '1980'
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'Behcet' AND `Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND ID IN (SELECT ID FROM Patient WHERE SEX = 'M') AND Admission = '-'
SELECT COUNT(*) FROM BloodTest WHERE SEX = 'F' AND WBC < 3.5;
SELECT DATEDIFF(`Examination Date`, (SELECT MIN(`Examination Date`) FROM Examination WHERE ID = 821298)) FROM Examination WHERE ID = 821298 LIMIT 1
SELECT T1.UA FROM Lab WHERE T1.ID = 57266 AND (T1.SEX = 'M' AND T1.UA > 8.0 OR T1.SEX = 'F' AND T1.UA > 6.5)
SELECT Examination.Examination_Date  FROM Examination  JOIN LabTest ON Examination.ID = LabTest.Patient_ID  WHERE Examination.ID = '48473' AND LabTest.Test_Name = 'AST glutamic oxaloacetic transaminase (GOT)' AND LabTest.Result >= 60;
SELECT T1.patient_id, T1.sex, T1.date_of_birth FROM patient AS T1 JOIN examination AS T2 ON T1.id = T2.ID WHERE T2.GOT < 60 AND YEAR(T2.Examination_Date) = 1994
SELECT ID FROM Examination WHERE SEX = 'M' AND GPT >= 60 AND History_of_GPT_abnormality = 'Yes'
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T2.DateOfBirth ASC
SELECT AVG(LDH) FROM Examination WHERE LDH < 500
SELECT T1.ID ,  T2.age FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID  =  T2.Patient WHERE T1.LDH BETWEEN 600 AND 800
SELECT T2.Admission FROM (SELECT T1.ID, T1.ALP FROM `Laboratory` AS T1 WHERE T1.ALP < 300) AS T1 INNER JOIN `Examination` AS T2 ON T1.ID = T2.ID GROUP BY T2.Admission
SELECT T1.ID FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birth_Date = '1982-04-01' AND T2.ALP < 300
SELECT T1.ID, T1.Sex, T1.Date_of_Birth FROM Patient AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.Lab_Test_Name = 'TP' AND T2.Lab_Test_Value < 6.0
SELECT SUBTRACT(TP, 8.5) AS Deviation FROM Examination WHERE SEX = 'F' AND TP > 8.5
SELECT T1.ID FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T1.ALB <= 3.5) OR (T1.SEX = 'M' AND T1.ALB >= 5.5) ORDER BY T1.BIRTHDAY DESC
SELECT T1.ID FROM `Examination` AS T1 JOIN `LabTest` AS T2 ON T1.ID = T2.Patient WHERE YEAR(T1.Birthday) = '1982' AND T2.LTName = 'ALB' AND T2.LTValue BETWEEN '3.5' AND '5.5'
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.UA > 8.0 OR T2.UA > 6.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND (T2.UA > 8.0 OR T2.UA > 6.5)
SELECT AVG(UA) FROM Examination WHERE ID IN (SELECT ID FROM Examination WHERE UA < CASE WHEN SEX = 'M' THEN 8.0 ELSE 6.5 END GROUP BY ID ORDER BY Examination_Date DESC LIMIT 1)
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.LabItem = 'UN' AND T2.Value = 29
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'RA' AND T1.UN < 30
SELECT COUNT(*) FROM Lab WHERE LabName = 'CRE' AND LabResult >= 1.5 AND ID IN (SELECT ID FROM Demographic WHERE Sex = 'M')
SELECT SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) AS Result FROM Examination WHERE CRE >= 1.5
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.LabItem = 'T-BIL' ORDER BY T2.Value DESC LIMIT 1
SELECT GROUP_CONCAT(DISTINCT T1.ID), T1.Sex FROM Basic AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.T_BIL >= 2.0 GROUP BY T1.Sex
SELECT ID, T_CHO FROM Lipid WHERE T_CHO = (SELECT MAX(T_CHO) FROM Lipid) AND birthday = (SELECT MIN(birthday) FROM Lipid WHERE T_CHO = (SELECT MAX(T_CHO) FROM Lipid))
SELECT AVG(T1.age) FROM (SELECT TIMESTAMPDIFF(YEAR, T2.birthday, NOW()) AS age FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.patient WHERE T2.sex = 'M' AND T1.`T-CHO` >= 250) AS T1
SELECT T2.ID, T2.Diagnosis FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.TG > 300;
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T2.Triglyceride >= 200 AND EXTRACT(YEAR FROM CURRENT_TIMESTAMP) - EXTRACT(YEAR FROM T1.Birthday) > 50
SELECT DISTINCT T1.ID FROM Examination AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T1.Admission = '-' AND T2.LabTestName = 'CPK' AND T2.LabResult < 250
SELECT COUNT(DISTINCT T1.id) FROM patient AS T1 JOIN examination AS T2 ON T1.id = T2.id WHERE T1.sex = 'M' AND T1.year BETWEEN 1936 AND 1956 AND T2.CPK >= 250;
SELECT T1.ID, T1.Sex, (YEAR(CURRENT_TIMESTAMP()) - YEAR(T1.Birthday)) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.T_CHO < 250
SELECT T1.ID FROM Examination AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T2.TestName = 'GLU' AND T2.Result < 180 AND YEAR(T1.ExaminationDate) = 1991 GROUP BY T1.ID
SELECT T1.ID, T1.Sex, T1.Birthday FROM Patient AS T1 JOIN BloodTest AS T2 ON T1.ID = T2.Patient WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 ORDER BY (YEAR(CURDATE()) - YEAR(T1.Birthday)) ASC GROUP BY T1.Sex
SELECT T1.ID, YEAR(CURDATE()) - YEAR(T1.Birthday) AS Age FROM Patient AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5 GROUP BY T1.ID, Diagnosis ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Admisson  FROM Patient AS T1  JOIN Admission AS T2 ON T1.ID = T2.Patient_ID  WHERE T1.Sex = 'F' AND (YEAR(CURDATE()) - YEAR(T1.Birthday)) >= 50 AND (T1.RBC <= 3.5 OR T1.RBC >= 6.0)
SELECT T2.ID, T2.Sex FROM lab WHERE T1.HBG < 10 AND T1.Admission = '-' AND T1.ID = T2.ID
SELECT T1.ID, T1.Sex FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' AND T2.HGB > 10 AND T2.HGB < 17 ORDER BY T1.Birthday ASC LIMIT 1
SELECT T1.ID ,  (YEAR(CURDATE()) - YEAR(T1.Birthday)) AS age FROM Patient AS T1 JOIN Lab AS T2 ON T1.Patient_ID  =  T2.Patient WHERE T2.HCT >= 52 GROUP BY T1.ID HAVING COUNT(*) >= 2
SELECT AVG(HCT) FROM Examination WHERE Date LIKE '1991%' AND HCT < 29;
SELECT      (SELECT COUNT(*) FROM Examination WHERE aCL_IgG < 8 AND PLT < 100) -      (SELECT COUNT(*) FROM Examination WHERE aCL_IgG < 8 AND PLT > 400) FROM      Examination WHERE      aCL_IgG < 8
SELECT T2.ID FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE YEAR(T1.Examination_Date) = '1984' AND (YEAR(CURRENT_TIMESTAMP) - YEAR(T2.Birthday)) < 50 AND T2.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN T2.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.ID WHERE SUBTRACT(year(current_timestamp), year(T2.Birthday)) > 55 AND T1.PT >= 14;
SELECT T1.ID FROM Examination AS T1 JOIN (SELECT ID, MIN(Examination_Date) AS First_Date FROM Examination GROUP BY ID HAVING YEAR(First_Date) > 1992) AS T2 ON T1.ID = T2.ID WHERE T1.KCT = '-' AND T1.RVVT = '-' AND T1.LAC = '-'
SELECT COUNT(*) FROM Examination WHERE RVVT = '+' AND Examination_Date > '1997-01-01'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN CoagulationTest AS T2 ON T1.ID = T2.Patient_ID WHERE T2.APTT > 45 AND T1.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T1.Sex = 'M' AND T2.LabTestName = 'WBC' AND T2.LabResult > 3.5 AND T2.LabResult < 9.0 AND EXISTS(SELECT * FROM LabTest AS T3 WHERE T1.ID = T3.Patient AND T3.LabTestName = 'FG' AND (T3.LabResult <= 150 OR T3.LabResult >= 450))
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN LabTest AS T2 ON T1.ID = T2.Patient WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450)
SELECT T2.Diagnosis FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`U-PRO` >= 30
SELECT T1.ID FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.U_PRO BETWEEN 0 AND 30 AND T2.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT ID) FROM Examination WHERE aCL_IgG > 2000;
SELECT COUNT(*) FROM Examination WHERE aCL_IgG * 100 > 900 AND aCL_IgG * 100 < 2000 AND Symptoms IS NOT NULL;
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.aCL_IgA BETWEEN 80 AND 500 ORDER BY T2.aCL_IgA DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE aCL_IgA > 80 AND aCL_IgA < 500 AND YEAR(Examination_Date) >= 1990;
SELECT T2.Diagnosis FROM `Lab Test` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE (T1.IgM <= 40 OR T1.IgM >= 400) GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE CRP = '+' AND Description IS NULL;
SELECT COUNT(*) FROM Patient WHERE CRE >= 1.5 AND (YEAR(CURDATE()) - YEAR(Birthday)) < 70
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.ID WHERE T1.RF IN ('-', '+-') AND T2.KCT = '+'
SELECT T2.Diagnosis FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.ID = T2.ID WHERE T1.Birthday >= '1985-01-01' AND T2.RF IN ('-', '+-')
SELECT T1.ID FROM Examination AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.RF < 20 AND SUBTRACT((YEAR(CURDATE()), YEAR(T1.Birthday))) > 60;
SELECT COUNT(*) FROM Examination WHERE `RF` < 20 AND `Thrombosis` = 0;
SELECT COUNT(DISTINCT ID) FROM Examination WHERE ANA_Pattern = 'P' AND C3 > 35
SELECT T1.ID FROM `Examination` AS T1 JOIN `LabTest` AS T2 ON T1.ID = T2.Patient WHERE T2.TestName = 'Hematocrit' AND (T2.Result < 29 OR T2.Result > 52) ORDER BY T1.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Lab AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis > 0 AND T2.C4 > 10
SELECT COUNT(DISTINCT ID) FROM Examination WHERE RNP IN ('-', 0) AND Admission = '+'
SELECT T1.Birthday FROM `Patient` AS T1 JOIN `Lab Test` AS T2 ON T1.ID = T2.Patient WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE SM IN ('-', '+-') AND Thrombosis = 0;
SELECT T1.ID FROM Examination AS T1 JOIN (SELECT ID, MIN(Birthday) AS Birthday FROM Patient GROUP BY ID) AS T2 ON T1.ID = T2.ID WHERE T1.SM NOT IN ('negative', '0') ORDER BY T2.Birthday DESC LIMIT 3;
SELECT T1.ID FROM Examination AS T1 INNER JOIN Autoantibodies AS T2 ON T1.ID = T2.Patient_ID WHERE T1.Examination_Date > '1997-01-01' AND T2.SC170 IN('negative','0')
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Symptoms IS NULL AND T2.Sex = 'F' AND T1.SC170 IN('negative', 0)
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN AutoimmuneDisease AS T2 ON T1.ID = T2.Patient WHERE T2.SSA IN('-','+-') AND YEAR(T1.Examination Date) < 2000
SELECT T1.ID FROM `Examination` AS T1 JOIN `Lab Test` AS T2 ON T1.ID = T2.Patient WHERE T2.SSA NOT IN ('negative', '0') ORDER BY T2.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT ID) FROM Examination WHERE SSB IN ('-', '0') AND Diagnosis = 'SLE'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T2.SSB IN ('negative', '0') AND T1.Symptoms IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 JOIN SampleTable AS T2 ON T1.ID = T2.ID WHERE T2.CENTROMERE IN('-', '+-') AND T2.SSB IN('-', '+-') AND T1.Sex = 'M'
SELECT T2.Diagnosis FROM Autoantibodies AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.DNA_II >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory WHERE T1.DNA-II < 8 AND T1.Description IS NULL
SELECT COUNT(*) FROM Laboratory WHERE IGG > 900 AND IGG < 2000 AND Admission = '+'
SELECT CAST(SUM(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.GOT >= 60 THEN 1 ELSE 0 END) FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Item = 'GOT'
SELECT COUNT(*) FROM Patient WHERE Sex = 'M' AND GOT < 60;
SELECT T2.Birthday FROM `Examination` AS T1 JOIN `Patient` AS T2 ON T1.ID = T2.Patient WHERE T2.GOT >= 60 ORDER BY T2.Birthday DESC LIMIT 1
SELECT T2.Birthday FROM Examination AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(*) FROM Laboratory WHERE LabTestName = 'GOT' AND LabResultValue < 60 AND ID IN (SELECT ID FROM Demographic WHERE Sex = 'M')
SELECT T1.Examination_Date FROM Examination AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.LDH < 500 ORDER BY T2.LDH DESC LIMIT 1
SELECT T2.Examination_Date FROM (SELECT ID, MAX(Examination_Date) AS max_date FROM Examination GROUP BY ID) AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.Patient WHERE T2.LDH >= 500 AND T1.max_date = T2.Date
SELECT COUNT(*) FROM Biochemistry WHERE ALP >= 300 AND ID IN (SELECT ID FROM Examination WHERE Admission = '+')
SELECT COUNT(*) FROM Lab WHERE Lab.ALP < 300 AND Lab.ID IN (SELECT Examination.ID FROM Examination WHERE Examination.Admission = '-')
SELECT Diagnosis FROM Examination WHERE ANA < 6.0;   (Note: This SQL statement assumes that 'TP' mentioned in the question actually refers to 'ANA', as there is no column named 'TP' in the provided table schema.)  However, based on the given information and assuming 'TP' was a typo for 'Total Protein' which isn't listed, and considering ANA might have been mistakenly interpreted as related, this SQL won't return correct results. Correct interpretation requires clarification or additional data about total protein levels.
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'SJS' AND TP BETWEEN 6.0 AND 8.5;
SELECT T2.Examination_Date FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ALB > 3.5 AND T1.ALB < 5.5 ORDER BY T1.ALB DESC LIMIT 1
SELECT COUNT(*) FROM Lab WHERE ALB >= 3.5 AND ALB <= 5.5 AND TP BETWEEN 6.0 AND 8.5 AND ID IN (SELECT ID FROM Demographic WHERE Sex = 'M')
SELECT MAX(E.aCL_IgG), MAX(E.aCL_IgM), MAX(E.aCL_IgA) FROM Examination E JOIN Patient P ON E.ID = P.ID WHERE P.Sex = 'F' AND UA > 6.50 GROUP BY E.ID ORDER BY UA DESC LIMIT 1
SELECT MAX(T2.ANA) FROM LabTest AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5
SELECT T1.ID FROM Laboratory AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 AND T2.aCL_IgA = (SELECT MAX(aCL_IgA) FROM Examination)
SELECT COUNT(*) FROM Examination WHERE T_BIL >= 2.0 AND ANA_Pattern LIKE '%P%'
SELECT T1.ANA FROM `Laboratory` AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` < 2.0 ORDER BY T1.ANA DESC LIMIT 1
SELECT COUNT(*) FROM Examination WHERE T_CHO >= 250 AND KCT = '-'
SELECT COUNT(*) FROM Examination WHERE T_CHO < 250 AND ANA_Pattern = 'P'
SELECT COUNT(*) FROM Examination WHERE TG < 200 AND Symptoms IS NOT NULL
SELECT T1.Diagnosis FROM Examination AS T1 JOIN Lab AS T2 ON T1.ID = T2.Patient WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1
SELECT T1.ID FROM Examination AS T1 JOIN Biochemistry AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.CPK < 250;
SELECT COUNT(*)  FROM Examination  WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+');
SELECT Birthday FROM Patient WHERE GLU > 180 ORDER BY Birthday LIMIT 1
SELECT COUNT(*) FROM BloodExamination AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0;
SELECT COUNT(*) FROM BloodTest WHERE WBC BETWEEN 3.5 AND 9.0 AND ID IN (SELECT ID FROM Admission WHERE Admission = '+')
SELECT COUNT(*) FROM Examination WHERE Diagnosis = 'SLE' AND WBC BETWEEN 3.5 AND 9.0;
SELECT T1.ID FROM Examination AS T1 JOIN BloodTest AS T2 ON T1.ID = T2.Patient_ID WHERE (T2.RBC <= 3.5 OR T2.RBC >= 6.0) AND T1.Admission = '-'
SELECT COUNT(*) FROM Examination WHERE PLT > 100 AND PLT < 400 AND Diagnosis IS NOT NULL
SELECT DNA_II FROM Examination WHERE PLT BETWEEN 100 AND 400 AND Diagnosis LIKE '%MCTD%'
SELECT AVG(T2.PT) FROM patient AS T1 JOIN examination AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T2.PT < 14
SELECT COUNT(*) FROM Examination WHERE Thrombosis IN (1, 2) AND PT < 14
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.major = T2.major_code WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(*) FROM student WHERE college = 'College of Engineering' AND student_id IN (SELECT student_id FROM Student_Club)
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN club AS T3 ON T2.clubid = T3.clubid WHERE T1.dept_name = 'Art and Design' AND T3.club_name = 'Student_Club'
SELECT COUNT(*) FROM student_club JOIN attendance USING (student_id) JOIN events USING (event_id) WHERE events.event_name = 'Women\'s Soccer'
SELECT T3.phone FROM club AS T1 JOIN student_club AS T2 ON T1.clubid = T2.clubid JOIN student AS T3 ON T2.stuid = T3.stuid JOIN event AS T4 ON T4.event_name = 'Women\'s Soccer' WHERE T4.eventid IN (SELECT eventid FROM attendance WHERE stuid = T3.stuid)
SELECT COUNT(*) FROM Student_Club JOIN attendance USING (student_id) WHERE event_name = 'Women''s Soccer' AND t_shirt_size = 'Medium'
SELECT T3.event_name FROM Student_Club AS T1 JOIN student_club_event_attendance AS T2 ON T1.student_id = T2.student_id JOIN events AS T3 ON T2.link_to_event = T3.record_id GROUP BY T2.link_to_event ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1
SELECT T1.college FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid WHERE T2.position = 'Vice President' GROUP BY T1.college ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.event_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean';
SELECT COUNT(*) FROM event JOIN member_of_club ON event.event_id = member_of_club.event_id WHERE member_of_club.member_name = 'Sacha Harrison' AND YEAR(event.event_date) = 2019;
SELECT COUNT(*) FROM ( SELECT T1.event_id FROM Event AS T1 JOIN Student_Club AS T2 ON T1.club_id = T2.club_id WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 10 ) AS T3
SELECT T1.event_name FROM events AS T1 JOIN student_events AS T2 ON T1.event_id = T2.event_id WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 20
SELECT AVG(T1.attendance) FROM events AS T1 WHERE T1.type = 'Meeting' AND YEAR(T1.event_date) = 2020
SELECT T1.expense_description FROM expenses AS T1 JOIN club_event_expenses AS T2 ON T1.record_id = T2.expense_record_id ORDER BY T1.cost DESC LIMIT 1
SELECT COUNT(*) FROM student_club_member WHERE major = 'Environmental Engineering'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T3.event_name = 'Laugh Out Loud'
SELECT T2.lastname FROM student AS T1 JOIN people AS T2 ON T1.student_id = T2.record_id WHERE T1.major = 'Law and Constitutional Studies'
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT T3.college_name FROM student AS T1 JOIN takes AS T2 ON T1.stud_id = T2.stud_id JOIN college AS T3 ON T3.college_id = T1.college_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt';
SELECT SUM(T2.amount) FROM student_club AS T1 JOIN transaction AS T2 ON T1.club_id = T2.club_id WHERE T1.position = 'Vice President'
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Food'
SELECT T3.city, T3.state FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN zip_code AS T3 ON T1.hometown_zip = T3.zip_code WHERE T2.position = 'President' GROUP BY T3.city, T3.state
SELECT T1.first_name, T1.last_name FROM student_club AS T1 JOIN person AS T2 ON T1.person_id = T2.record_id WHERE T2.state = 'IL' AND T1.member_type = 'member'
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Meeting' AND T1.category = 'Advertisement'
SELECT T4.department_name FROM student AS T1 JOIN takes AS T2 ON T1.stu_num = T2.stu_num JOIN course AS T3 ON T2.course_id = T3.course_id JOIN department AS T4 ON T3.dept_code = T4.dept_code WHERE T1.stu_fname = 'Pierce' AND T1.stu_lname = 'Guidi'
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'October Speaker'
SELECT T2.approved FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'October Meeting' AND T1.event_date = '2019-10-08T00:00:00'
SELECT AVG(T1.amount) FROM expenses AS T1 JOIN members AS T2 ON T1.member_id = T2.id WHERE T2.first_name = 'Elijah' AND T2.last_name = 'Allen' AND (strftime('%m', T1.expense_date) = '09' OR strftime('%m', T1.expense_date) = '10')
SELECT SUM(IIF(SUBSTR(T1.event_date, 1, 4) = '2019', T1.spent, 0)) - SUM(IIF(SUBSTR(T1.event_date, 1, 4) = '2020', T1.spent, 0)) FROM event AS T1 JOIN Student_Club AS T2 ON T1.club_id = T2.club_id;
SELECT T1.location FROM events AS T1 WHERE T1.event_name = "Spring Budget Review"
SELECT T1.cost FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'Posters' AND T2.event_date = '2019-09-04'
SELECT T1.remaining FROM `budget` AS T1 JOIN `category` AS T2 ON T1.category_id  =  T2.category_id WHERE T2.category_name  =  "Food" AND T1.amount  =  (SELECT MAX(T1.amount) FROM `budget` AS T1 JOIN `category` AS T2 ON T1.category_id  =  T2.category_id WHERE T2.category_name  =  "Food")
SELECT T1.notes FROM event AS T1 JOIN donation AS T2 ON T1.event_id = T2.event_id WHERE T2.source = 'Fundraising' AND T2.date_received = '2019-09-14'
SELECT COUNT(DISTINCT T2.major) FROM college AS T1 JOIN student AS T2 ON T1.college_id = T2.college_id WHERE T1.name = 'College of Humanities and Social Sciences'
SELECT T1.phone FROM member AS T1 JOIN person AS T2 ON T1.person = T2.rec_id WHERE T2.first_name = 'Carlo' AND T2.last_name = 'Jacobs'
SELECT T2.county FROM member AS T1 JOIN zip_code AS T2 ON T1.hometown_zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O'Gallagher'
SELECT COUNT(*) FROM budget WHERE event_name = 'November Meeting' AND remaining < 0
SELECT SUM(T1.amount) FROM budget AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'September Speaker'
SELECT T1.status FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Post Cards, Posters' AND T2.expense_date = '2019-8-20'
SELECT T2.major_name FROM member AS T1 JOIN major AS T2 ON T1.major = T2.major_code WHERE T1.first_name = 'Brent' AND T1.last_name = 'Thomason'
SELECT COUNT(*) FROM club_member WHERE major = 'Business' AND t_shirt_size = 'Medium'
SELECT T2.type FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'
SELECT T1.major_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stu_num = T2.stu_num WHERE T2.position = 'Vice President' GROUP BY T1.major_name HAVING COUNT(*) > 0
SELECT T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.hometown_zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T3.department FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN club AS T3 ON T2.clubid = T3.clubid WHERE T1.position = 'President' GROUP BY T3.department
SELECT T2.date_received FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.payer WHERE T1.first_name = 'Connor' AND T1.last_name = 'Hilton' AND T2.source = 'Dues'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T2.source = 'Dues' ORDER BY T2.received_date ASC LIMIT 1;
SELECT COUNT(*) FROM ( SELECT * FROM budget WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff' ) AS T1 JOIN ( SELECT * FROM budget WHERE category = 'Advertisement' AND event_name = 'October Meeting' ) AS T2 ON T1.event_id = T2.event_id WHERE T1.amount > T2.amount
SELECT (SUM(CASE WHEN T2.category = 'Parking' THEN T1.amount ELSE 0 END) / SUM(T1.amount)) * 100 FROM expenses AS T1 JOIN category AS T2 ON T1.category_id = T2.id JOIN events AS T3 ON T1.event_id = T3.id WHERE T3.event_name = 'November Speaker'
SELECT SUM(T2.cost) FROM event AS T1 JOIN expense AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Pizza'
SELECT COUNT(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT department_name FROM department WHERE college = 'College of Humanities and Social Sciences' GROUP BY department_name ORDER BY department_name ASC
SELECT T2.city, T2.county, T2.state FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T1.expense_description FROM budget AS T1 JOIN ( SELECT MIN(remaining) AS min_remaining FROM budget ) AS T2 WHERE T1.remaining = T2.min_remaining
SELECT T1.member_name FROM member AS T1 JOIN attendance AS T2 ON T1.rec_id = T2.member_rec_id JOIN event AS T3 ON T3.rec_id = T2.event_rec_id WHERE T3.event_name = 'October Meeting'
SELECT T2.college FROM member AS T1 JOIN major AS T2 ON T1.major = T2.id GROUP BY T2.college ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.major_name FROM person AS T1 JOIN student AS T2 ON T1.student_id = T2.student_id WHERE T1.phone_number = '809-555-3360'
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.record_id = T2.event_record_id GROUP BY T1.event_name ORDER BY SUM(T2.amount) DESC LIMIT 1
SELECT T3.expense_description FROM member AS T1 JOIN club AS T2 ON T1.club_id = T2.club_id JOIN expense AS T3 ON T3.club_id = T2.club_id WHERE T1.position = 'Vice President' AND T1.member_id = T3.member_id
SELECT COUNT(*) FROM events WHERE event_name = 'Women\'s Soccer' AND status = 'Closed'
SELECT T1.date_received FROM income AS T1 JOIN members AS T2 ON T1.member_id = T2.member_id WHERE T2.first_name = 'Casey' AND T2.last_name = 'Mason'
SELECT COUNT(*) FROM member WHERE zip_code IN (SELECT zip_code FROM zip_code WHERE state = 'Maryland')
SELECT COUNT(*) FROM event JOIN attendance ON event.event_id = attendance.event_id WHERE attendance.member_phone = '954-555-6240' AND event.status = 'Closed'
SELECT T1.first_name, T1.last_name FROM member AS T1 JOIN department AS T2 ON T1.dept_code = T2.dept_code WHERE T2.department_name = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM `event` AS T1 JOIN `budget` AS T2 ON T1.id = T2.event_id WHERE T1.status = 'Closed' ORDER BY (T2.spent / T2.amount) DESC LIMIT 1;
SELECT COUNT(*) FROM student WHERE position = 'President'
SELECT MAX(T2.spent) FROM events AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020'
SELECT SUM(T1.spent) FROM expense AS T1 JOIN category AS T2 ON T1.category_id = T2.id WHERE T2.category = 'Food'
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN attendance AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(T2.link_to_event) > 7
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN attendance AS T2 ON T1.student_id = T2.student_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T3.event_name = 'Community Theater' AND T1.major_name = 'Interior Design'
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T2.city = 'Georgetown' AND T2.state = 'South Carolina'
SELECT SUM(income.amount) FROM income WHERE income.member_id IN (SELECT member.id FROM member WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour')
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN income AS T2 ON T1.student_id = T2.student_id WHERE T2.amount > 40
SELECT SUM(T2.cost) FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name FROM student AS T1 JOIN manages_budget AS T2 ON T1.student_id = T2.student_id JOIN event AS T3 ON T3.event_id = T2.event_id WHERE T3.event_name = 'Yearly Kickoff'
SELECT T1.first_name, T1.last_name, T3.source FROM student AS T1 JOIN income AS T2 ON T1.student_id = T2.student_id JOIN source AS T3 ON T2.source_code = T3.source_code WHERE T2.amount = (SELECT MAX(amount) FROM income)
SELECT T1.event_name FROM events AS T1 JOIN costs AS T2 ON T1.id = T2.event_id ORDER BY T2.cost ASC LIMIT 1
SELECT (SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) / SUM(T1.cost)) * 100 FROM event_cost AS T1 JOIN events AS T2 ON T1.event_id = T2.id GROUP BY T2.event_name HAVING T2.event_name = 'Yearly Kickoff'
SELECT CAST(COUNT(CASE WHEN T2.major_name = 'Finance' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN T2.major_name = 'Physics' THEN 1 ELSE NULL END) FROM student AS T1 JOIN major AS T2 ON T1.major_id = T2.major_id
SELECT source FROM transactions WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY amount DESC LIMIT 1
SELECT T1.first_name, T1.last_name, T1.email FROM member AS T1 JOIN student_club AS T2 ON T1.stu_num = T2.officer WHERE T2.position = 'Secretary'
SELECT COUNT(*) FROM student_club AS T1 JOIN member AS T2 ON T1.club_id = T2.club_id JOIN major AS T3 ON T2.major_id = T3.major_id WHERE T3.major_name = 'Physics Teaching'
SELECT COUNT(*) FROM member_attendance WHERE event_id IN (SELECT id FROM events WHERE event_name = 'Community Theater' AND YEAR(event_date) = 2019)
SELECT COUNT(*), T3.major_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.attended JOIN major AS T3 ON T1.major_code = T3.major_code WHERE T1.first_name = 'Luisa' AND T1.last_name = 'Guidi' GROUP BY T3.major_name;
SELECT AVG(T2.amount) FROM student_club_events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.expense_event WHERE T2.category = 'Food' AND T1.status = 'Closed'
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.id = T2.event_id WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1
SELECT COUNT(*) FROM attendance JOIN members ON attendance.member_id = members.id JOIN events ON attendance.event_id = events.id WHERE members.first_name = 'Maya' AND members.last_name = 'Mclean' AND events.event_name = 'Women''s Soccer'
SELECT SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100 / COUNT(event_id) AS percentage  FROM events  WHERE event_date BETWEEN '2019-01-01' AND '2019-12-31';
SELECT T1.amount FROM expenses AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T1.description = 'Posters' AND T2.event_name = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.event_name FROM `event` AS T1 JOIN `cost` AS T2 ON T1.id = T2.event_id WHERE T1.status = 'Closed' AND T2.remaining < 0 ORDER BY T2.remaining ASC LIMIT 1;
SELECT T2.type, SUM(T2.cost) FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'October Meeting' AND T1.status = 'Closed' GROUP BY T2.type;
SELECT T2.category, SUM(T2.amount) FROM events AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'April Speaker' GROUP BY T2.category ORDER BY SUM(T2.amount) ASC
SELECT MAX(budgeted) FROM transactions WHERE category = 'Food'
SELECT T1.category ,  T1.amount FROM Financial_Transactions AS T1 WHERE T1.category  =  'Advertisement' ORDER BY T1.amount DESC LIMIT 3
SELECT SUM(T1.amount) FROM expenses AS T1 JOIN categories AS T2 ON T1.category_id = T2.id WHERE T2.category_name = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT T1.first_name, T1.last_name, SUM(T2.cost) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY T1.first_name, T1.last_name;
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T2.expense_description FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = 'X-Large'
SELECT T2.zip_code FROM member AS T1 JOIN address AS T2 ON T1.address_id = T2.address_id WHERE T1.cost < 50
SELECT T2.major_name FROM student AS T1 JOIN major AS T2 ON T1.major_code = T2.major_code WHERE T1.first_name = 'Phillip' AND T1.last_name = 'Cullen'
SELECT T2.position FROM member AS T1 JOIN club AS T2 ON T1.club_id = T2.club_id WHERE T1.major = 'Business'
SELECT COUNT(*) FROM member WHERE major_name = 'Business' AND t_shirt_size = 'Medium'
SELECT T1.event_name FROM events AS T1 JOIN budget AS T2 ON T1.id = T2.event_id WHERE T2.remaining > 30
SELECT type FROM event WHERE location = 'MU 215' GROUP BY type
SELECT type FROM events WHERE event_date = '2020-03-24T12:00:00'
SELECT T3.major_name FROM student AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN major AS T3 ON T1.majors = T3.major_code WHERE T1.position = 'Vice President'
SELECT (SUM(CASE WHEN T2.position = 'Member' AND T3.major_name = 'Business' THEN 1 ELSE 0 END) / COUNT(T1.member_id)) * 100 FROM member AS T1 JOIN membership AS T2 ON T1.member_id = T2.member_id JOIN major AS T3 ON T1.major_code = T3.major_code
SELECT T1.type FROM events AS T1 JOIN zip_code AS T2 ON T1.location = T2.city WHERE T1.location = "MU 215" GROUP BY T1.type
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences'
SELECT T2.last_name ,  T4.department_name ,  T5.college_name FROM member_of_club AS T1 JOIN student AS T2 ON T1.stu_num  =  T2.stu_num JOIN major AS T3 ON T2.major  =  T3.major_code JOIN department AS T4 ON T3.department_code  =  T4.department_code JOIN college AS T5 ON T4.college_code  =  T5.college_code WHERE T3.major_name  =  'Environmental Engineering'
SELECT T1.category FROM budget AS T1 JOIN event AS T2 ON T1.event_id = T2.id WHERE T2.location = 'MU 215' AND T2.type = 'Guest Speaker' AND T1.spent = 0
SELECT T3.city, T3.state FROM member AS T1 JOIN enroll AS T2 ON T1.member_id = T2.member_id JOIN zip_code AS T3 ON T3.zip_code = T1.zip_code WHERE T2.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'
SELECT T1.event_name FROM events AS T1 JOIN club_member AS T2 ON T1.club_id  =  T2.club_id WHERE T2.position  =  'Vice President' AND T1.type  =  'Social' AND T1.location  =  '900 E. Washington St.'
SELECT T3.lastname ,  T3.position FROM expenses AS T1 JOIN club_expense AS T2 ON T1.expense_id = T2.expense_id JOIN member AS T3 ON T2.president_id = T3.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'
SELECT T1.last_name FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.recid WHERE T3.event_name = 'Women''s Soccer' AND T1.position = 'Member'
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = 'Medium' AND T1.position = 'Member'
SELECT T2.country FROM zip_code AS T1 JOIN country AS T2 ON T1.state = T2.name WHERE T1.type = 'PO Box' GROUP BY T2.country
SELECT zip_code FROM zip_code WHERE county = "San Juan Municipio" AND state = "Puerto Rico" AND type = "PO Box"
SELECT T1.event_name FROM events AS T1 JOIN (SELECT * FROM event_status WHERE status = 'Closed') AS T2 ON T1.status_id = T2.id WHERE T1.type = 'Game' AND T1.event_date BETWEEN '2019-03-15T00:00:00' AND '2020-03-20T23:59:59'
SELECT T1.event_link FROM events AS T1 JOIN members AS T2 ON T1.member_id = T2.member_id WHERE T2.cost > 50
SELECT T1.member_name, T1.event_link FROM member AS T1 JOIN attendance AS T2 ON T1.member_id = T2.member_id JOIN event AS T3 ON T2.event_id = T3.event_id WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T3.college FROM person AS T1 JOIN student AS T2 ON T1.stuid = T2.stuid JOIN college AS T3 ON T2.collegeid = T3.collegeid WHERE T1.fname = 'Katy' AND T2.major = 'rec1N0upiVLy5esTO'
SELECT T2.phone FROM member AS T1 JOIN person AS T2 ON T1.member_id  =  T2.person_id JOIN major AS T3 ON T3.major_id  =  T1.major WHERE T3.college_name  =  'College of Agriculture and Applied Sciences' AND T3.major_name  =  'Business'
SELECT email FROM expenses WHERE expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND cost > 20
SELECT COUNT(*) FROM member WHERE major = 'education' AND college = 'College of Education & Human Services'
SELECT SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) * 100 / COUNT(T1.event_id) FROM event AS T1 JOIN budget AS T2 ON T1.event_id = T2.event_id WHERE T2.remaining < 0
SELECT event_id, location, status FROM events WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT expense_description FROM expenses GROUP BY expense_description HAVING AVG(cost) > 50
SELECT T1.first_name ,  T1.last_name FROM member AS T1 JOIN member_attendance AS T2 ON T1.member_id = T2.member_id WHERE T1.t_shirt_size = "X-Large"
SELECT SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) / COUNT(zip_code) * 100 FROM zip_code
SELECT T1.event_name, T1.location FROM events AS T1 JOIN expenses AS T2 ON T1.record_id = T2.record_id WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T2.expense_description = 'Pizza' AND T2.cost > 50 AND T2.cost < 100
SELECT T3.first_name, T3.last_name, T4.major_name FROM expenses AS T1 JOIN member_attendance AS T2 ON T1.member_id = T2.member_id JOIN members AS T3 ON T2.member_id = T3.member_id JOIN majors AS T4 ON T3.major_code = T4.major_code WHERE T1.cost > 100
SELECT T2.city, T2.county FROM events AS T1 JOIN zip_code AS T2 ON T1.location = T2.zip_code WHERE T1.status = 'Closed' GROUP BY T1.event_name HAVING COUNT(*) > 40
SELECT T2.member_name FROM expenses AS T1 JOIN members AS T2 ON T1.member_id = T2.member_id WHERE T1.event_id IN (SELECT event_id FROM expenses GROUP BY event_id HAVING COUNT(*) > 1) GROUP BY T1.member_id ORDER BY SUM(T1.cost) DESC LIMIT 1
SELECT AVG(T2.cost) FROM student AS T1 JOIN event AS T2 ON T1.event_id = T2.event_id WHERE T1.position != 'Member'
SELECT T1.event_name FROM `event` AS T1 JOIN expense AS T2 ON T1.event_id = T2.event_id WHERE T2.category = 'Parking' AND T2.cost < (SELECT AVG(cost) FROM expense WHERE category = 'Parking')
SELECT SUM(CASE WHEN T1.type = 'Meeting' THEN T1.cost ELSE 0 END) / SUM(T1.cost) * 100 FROM event AS T1 JOIN club_event AS T2 ON T1.event_id = T2.event_id WHERE T1.type = 'Meeting'
SELECT MAX(cost) FROM expenses WHERE expense_description = 'Water, chips, cookies'
SELECT T1.first_name , T1.last_name FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id ORDER BY T2.cost DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T2.cost > (SELECT AVG(cost) FROM expense)
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) / COUNT(CASE WHEN T1.position = 'Member' THEN 1 END)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) / COUNT(CASE WHEN T1.position = 'Member' THEN 1 END)) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code
SELECT T1.major_name, T2.department_name FROM student AS T3 JOIN majors AS T1 ON T3.major_id = T1.major_id JOIN departments AS T2 ON T1.department_id = T2.department_id WHERE T3.first_name = 'Garrett' AND T3.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, SUM(T2.amount) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.payer_member_id WHERE T2.expense_description = 'Water, Veggie tray, supplies' GROUP BY T1.first_name, T1.last_name
SELECT T2.last_name ,  T3.phone FROM student AS T1 JOIN person AS T2 ON T1.student_id = T2.person_id JOIN contact_number AS T3 ON T2.person_id = T3.person_id WHERE T1.major = 'Elementary Education'
SELECT T1.category, T1.amount FROM budget AS T1 JOIN events AS T2 ON T1.event_id = T2.id WHERE T2.event_name = 'January Speaker'
SELECT T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.id = T2.event_id WHERE T2.category = 'Food'
SELECT T1.first_name, T1.last_name, T2.amount FROM student AS T1 JOIN fund_transfer AS T2 ON T1.student_id = T2.student_id WHERE T2.date_received = '2019-09-09'
SELECT budget_category FROM expenses WHERE expense_description = 'Posters'
SELECT T1.first_name, T1.last_name, T3.college FROM club_member AS T1 JOIN member_of_club AS T2 ON T1.stuid = T2.stuid JOIN club AS T3 ON T2.clubid = T3.clubid WHERE T1.position = 'Secretary'
SELECT SUM(T2.spent), T1.event_name FROM events AS T1 JOIN expenses AS T2 ON T1.rec_id = T2.rec_id WHERE T2.category = 'Speaker Gifts' GROUP BY T1.event_name;
SELECT T2.city FROM member AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T1.first_name, T1.last_name, T1.position FROM student AS T1 JOIN zip_code AS T2 ON T1.zip_code = T2.zip_code WHERE T2.city = 'Lincolnton' AND T2.state = 'North Carolina' AND T2.zip_code = 28092
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT COUNT(CASE WHEN Currency = 'EUR' THEN 1 ELSE NULL END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 ELSE NULL END) AS Ratio FROM customers;
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.Date BETWEEN '201201' AND '201212' ORDER BY T2.Consumption ASC LIMIT 1
SELECT AVG(T2.Consumption) / 12 AS AverageMonthlyConsumption FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312'
SELECT T1.CustomerID FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Currency = 'CZK' AND T3.Date BETWEEN '201101' AND '201112' GROUP BY T1.CustomerID ORDER BY SUM(T3.Consumption) DESC LIMIT 1;
SELECT COUNT(*)  FROM customers c  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Segment = 'KAM'  AND ym.Date BETWEEN '201201' AND '201212'  AND ym.Consumption < 30000;
SELECT (SELECT SUM(T3.Consumption) FROM `customers` AS T1 JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID JOIN `yearmonth` AS T3 ON T2.CustomerID = T3.CustomerID WHERE T1.Currency = 'CZK' AND SUBSTR(T3.Date, 1, 4) BETWEEN '201201' AND '201212') - (SELECT SUM(T3.Consumption) FROM `customers` AS T1 JOIN `transactions_1k` AS T2 ON T1.CustomerID = T2.CustomerID JOIN `yearmonth` AS T3 ON T2.CustomerID = T3.CustomerID WHERE T1.Currency = 'EUR' AND SUBSTR(T3.Date, 1, 4) BETWEEN '201201' AND '201212')
SELECT Date FROM (     SELECT YEAR(Date) AS Year, SUM(Amount * Price) AS TotalGasUseEUR     FROM transactions_1k     JOIN customers ON transactions_1k.CustomerID = customers.CustomerID     WHERE Currency = 'EUR'     GROUP BY YEAR(Date) ) AS GasUseByYear ORDER BY TotalGasUseEUR DESC LIMIT 1;
SELECT T2.Segment FROM yearmonth AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID GROUP BY T2.Segment ORDER BY SUM(T1.Consumption) LIMIT 1
SELECT Date FROM yearmonth WHERE Consumption = (SELECT MAX(Consumption) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')) AND Date LIKE "____" GROUP BY SUBSTR(Date, 1, 4) ORDER BY Consumption DESC LIMIT 1;
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND SUBSTRING(T2.Date, 1, 4) BETWEEN '2013' AND '2013' AND SUBSTRING(T2.Date, 5, 6) IN (SELECT SUBSTRING(Date, 5, 6) FROM yearmonth WHERE Consumption = (SELECT MAX(Consumption) FROM yearmonth WHERE SUBSTRING(Date, 1, 4) BETWEEN '2013' AND '2013'))
SELECT      (SELECT SUM(CASE WHEN T1.Segment = 'SME' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'SME' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'LAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'LAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS SME_LAM,          (SELECT SUM(CASE WHEN T1.Segment = 'LAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'LAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'KAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'KAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS LAM_KAM,          (SELECT SUM(CASE WHEN T1.Segment = 'KAM' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'KAM' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') -     (SELECT SUM(CASE WHEN T1.Segment = 'SME' THEN T5.Consumption ELSE 0 END) / COUNT(CASE WHEN T1.Segment = 'SME' AND T4.Date BETWEEN '201301' AND '201312' THEN T1.CustomerID END)      FROM customers AS T1      JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID      JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID      JOIN yearmonth AS T4 ON T1.CustomerID = T4.CustomerID      WHERE T3.Country = 'CZE' AND T4.Date BETWEEN '201301' AND '201312') AS KAM_SME;
SELECT T1.Segment ,  MAX(T3.PercentageIncrease) ,  MIN(T3.PercentageIncrease) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN (SELECT CustomerID ,  `Date` ,  Consumption ,  LAG(Consumption,1) OVER(PARTITION BY CustomerID ORDER BY `Date`) AS prev_Consumption ,  ((Consumption - LAG(Consumption,1) OVER(PARTITION BY CustomerID ORDER BY `Date`)) / Consumption) * 100 AS PercentageIncrease FROM yearmonth WHERE SUBSTR(`Date`,1,4) IN ('2012','2013')) AS T3 ON T1.CustomerID = T3.CustomerID WHERE T3.PercentageIncrease IS NOT NULL AND T2.Currency = 'EUR' GROUP BY T1.Segment ORDER BY MAX(T3.PercentageIncrease) DESC ,  MIN(T3.PercentageIncrease) ASC LIMIT 1
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS Difference_In_Discount_Gas_Stations;
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304') AS Difference;
SELECT (SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T1.Currency = 'CZK') - (SELECT COUNT(DISTINCT T1.CustomerID) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T1.Currency = 'EUR') AS difference;
SELECT T1.CustomerID FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'EUR' AND T3.Date = '201310' ORDER BY T3.Consumption DESC LIMIT 1
SELECT T1.CustomerID, MAX(T2.Consumption)  FROM customers AS T1  JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID  WHERE T1.Segment = 'KAM'  GROUP BY T1.CustomerID  ORDER BY T2.Consumption DESC  LIMIT 1;
SELECT SUM(T1.Consumption)  FROM yearmonth AS T1  JOIN customers AS T2  ON T1.CustomerID = T2.CustomerID  WHERE T1.Date = '201305' AND T2.Segment = 'KAM'
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'
SELECT Country , COUNT(GasStationID) FROM gasstations WHERE `Segment` = 'Value for money' GROUP BY Country
SELECT CAST(SUM(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM';
SELECT CAST(SUM(CASE WHEN T1.Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM yearmonth AS T1 WHERE SUBSTR(T1.Date, 1, 4) = '2012' AND SUBSTR(T1.Date, 6, 2) = '02';
SELECT CAST(SUM(IIF(T2.Segment = 'Premium', 1, 0)) AS REAL) * 100 / COUNT(T1.GasStationID) FROM gasstations AS T1 JOIN chains AS T2 ON T1.ChainID = T2.ChainID WHERE T1.Country = 'SVK'
SELECT T1.CustomerID FROM yearmonth AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201309' ORDER BY T1.Consumption DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201309' ORDER BY T2.Consumption ASC LIMIT 1
SELECT T1.CustomerID FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date = '201206' ORDER BY T2.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE SUBSTR(Date,1,4) = '2012'
SELECT MAX(T3.Consumption) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T1.Currency = 'EUR' GROUP BY T3.Date ORDER BY SUM(T3.Consumption) DESC LIMIT 1;
SELECT T3.Description FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE SUBSTR(T2.Date, 6) = '09' AND SUBSTR(T2.Date, 1, 4) = '2013'
SELECT T3.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE SUBSTR(T3.Date, 1, 4) = '2013' AND SUBSTR(T3.Date, 5, 2) = '06' GROUP BY T3.Country
SELECT T3.ChainID FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.Currency = 'EUR' GROUP BY T3.ChainID
SELECT T3.Description FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Currency = 'EUR'
SELECT AVG(t1.Price * t1.Amount) FROM transactions_1k AS t1 WHERE t1.Date LIKE '2012-01%'
SELECT COUNT(DISTINCT c.CustomerID)  FROM customers c  JOIN transactions_1k t ON c.CustomerID = t.CustomerID  JOIN yearmonth ym ON c.CustomerID = ym.CustomerID  WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'
SELECT T2.Time FROM `gasstations` AS T1 JOIN `transactions_1k` AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ChainID = 11 GROUP BY T2.Time
SELECT COUNT(*) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(*) FROM transactions_1k  JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID  WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';
SELECT AVG(T1.Price * T1.Amount) FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'
SELECT AVG(t1.Price * t1.Amount) FROM transactions_1k AS t1 JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t2.Currency = 'EUR'
SELECT T1.CustomerID FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25' ORDER BY T2.Amount * T2.Price DESC LIMIT 1
SELECT T3.Country FROM transactions_1k AS T1 JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time LIMIT 1
SELECT T1.Currency FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-24' AND T2.Time = '16:25:00'
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-23' AND T2.Time = '21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00' AND CustomerID IN (SELECT CustomerID FROM customers WHERE Currency = 'CZK')
SELECT T1.Segment FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID ORDER BY T2.Date, T2.Time LIMIT 1
SELECT T3.Country FROM transactions_1k AS T1 JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT T1.ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'
SELECT T3.Consumption ,  T3.Date FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T3.CustomerID = T2.CustomerID WHERE T1.Price = 124.05 AND T1.Date = '2012-08-24' AND T3.Date LIKE '201201%'
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE'
SELECT T1.Currency FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201306' AND T2.Consumption = 214582.17
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467 GROUP BY T2.Country
SELECT T3.Country FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Price * T1.Amount = 548.4
SELECT CAST(SUM(IIF(T2.Currency = 'EUR', 1, 0)) AS REAL) * 100 / COUNT(*) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25'
SELECT ((SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2012%') - (SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2013%')) / (SELECT SUM(t1.Consumption) FROM yearmonth AS t1 WHERE t1.CustomerID IN (SELECT t2.CustomerID FROM transactions_1k AS t2 WHERE t2.Price = 634.8 AND t2.Date = '2012-08-25') AND t1.Date LIKE '2012%')
SELECT T2.GasStationID, SUM(T1.Amount * T1.Price) AS Revenue FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID GROUP BY T2.GasStationID ORDER BY Revenue DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK';
SELECT SUM(t1.Amount * t1.Price) AS AmountSpent FROM transactions_1k AS t1 JOIN customers AS t2 ON t1.CustomerID = t2.CustomerID WHERE t1.CustomerID = 38508 AND strftime('%Y%m', t1.Date) = '201201'
SELECT T1.Description FROM products AS T1 JOIN transactions_1k AS T2 ON T1.ProductID = T2.ProductID GROUP BY T1.ProductID ORDER BY SUM(T2.Amount) DESC LIMIT 5;
SELECT T1.CustomerID, T3.Currency, SUM(T2.Price) / SUM(T2.Amount) AS AvgPricePerItem FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN (SELECT CustomerID, MAX(SUM(Price)) AS MaxTotalPrice FROM transactions_1k GROUP BY CustomerID) AS T4 ON T1.CustomerID = T4.CustomerID JOIN products AS T5 ON T2.ProductID = T5.ProductID WHERE T4.MaxTotalPrice = (SELECT SUM(Price) FROM transactions_1k WHERE CustomerID = T1.CustomerID) AND T1.Segment IN ('SME', 'LAM', 'KAM') GROUP BY T1.CustomerID, T3.Currency ORDER BY AvgPricePerItem DESC LIMIT 1
SELECT T3.Country FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1
SELECT T5.Consumption FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID JOIN customers AS T3 ON T1.CustomerID = T3.CustomerID JOIN gasstations AS T4 ON T1.GasStationID = T4.GasStationID JOIN yearmonth AS T5 ON T1.CustomerID = T5.CustomerID WHERE T1.ProductID = 5 AND T2.Description = 'Special' AND T1.Price / T1.Amount > 29.00 AND T5.Date = '201208'
