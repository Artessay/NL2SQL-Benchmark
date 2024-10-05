SELECT MAX(CAST(FreeMealCountK12 AS REAL) / EnrollmentK12) as highest_eligible_free_rate FROM schools WHERE county = 'Alameda';	california_schools
SELECT ('Free Meal Count (Ages 5-17)') / ('Enrollment (Ages 5-17)') AS eligible_free_rate FROM schools WHERE SchoolType = 'Continuation' ORDER BY eligible_free_rate ASC LIMIT 3;	california_schools
SELECT Zip FROM fprm WHERE `Charter School (Y/N)` = 1 AND `County Name` = 'Fresno County Office of Education';	california_schools
SELECT s.MailingStreet FROM schools AS s JOIN enrollments AS e ON s.SchoolID = e.SchoolID WHERE e.Grade BETWEEN 'K' AND '12' ORDER BY e.FRPM DESC LIMIT 1;	california_schools
SELECT Phone FROM frpm WHERE `Charter School (Y/N)` = 1 AND OpenDate > '2000-01-01';	california_schools
SELECT COUNT(*) FROM Schools WHERE SATMathAvgScore > 400 AND Virtual = 'F';	california_schools
SELECT * FROM schools WHERE SAT > 500 AND Magnet = 1;	california_schools
SELECT S.Phone FROM Schools AS S JOIN Scores AS SC ON S.SchoolID = SC.SchoolID WHERE SC.SAT > 1500 GROUP BY S.SchoolID ORDER BY SUM(SC.TestTakers) DESC LIMIT 1;	california_schools
;	california_schools
SELECT COUNT(*) FROM Schools WHERE SATMathAvg > 560 AND FundingType = 'Directly Charter-Funded';	california_schools
SELECT T3.FRPM_5_17 FROM Schools AS T1 JOIN SAT_Scores AS T2 ON T1.SchoolID = T2.SchoolID JOIN FRPM_Count AS T3 ON T1.SchoolID = T3.SchoolID WHERE T2.TestType = 'SAT' GROUP BY T1.SchoolID ORDER BY AVG(T2.Reading) DESC LIMIT 1;	california_schools
SELECT SchoolCode FROM Schools WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;	california_schools
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS highest_eligible_free_rate FROM Schools WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;	california_schools
SELECT T2.Phone FROM School AS T1 JOIN Contact AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.SATSchoolID IS NOT NULL ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3;	california_schools
SELECT NCESID FROM Schools ORDER BY Enrollment DESC LIMIT 5;	california_schools
SELECT d.district_name, AVG(s.reading_score) AS avg_reading_score FROM districts d JOIN schools sc ON d.district_id = sc.district_id JOIN scores s ON sc.school_id = s.school_id WHERE d.active = 1 GROUP BY d.district_id ORDER BY avg_reading_score DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM Schools WHERE County = 'Alameda' AND NumTestTakers < 100;	california_schools
SELECT CharterNo, AVG(WritingScore) AS AvgWritingScore FROM Schools WHERE WritingScore > 499 AND CharterNo IS NOT NULL GROUP BY CharterNo ORDER BY AvgWritingScore DESC;	california_schools
SELECT COUNT(*) FROM Schools WHERE City = 'Fresno' AND FundingType = 'Directly Funded' AND TestTakers <= 250;	california_schools
SELECT S.Phone FROM Schools AS S JOIN TestScores AS TS ON S.SchoolID = TS.SchoolID GROUP BY TS.SchoolID ORDER BY AVG(TS.MathScore) DESC LIMIT 1	california_schools
SELECT COUNT(*) FROM Schools WHERE CountyCode = '003' AND LowGrade = 9 AND HighGrade = 12;	california_schools
SELECT COUNT(*) FROM Schools WHERE CityName = 'Los Angeles' AND FreeMeals BETWEEN 500 AND 700;	california_schools
;	california_schools
SELECT SchoolName, StreetAddress FROM Schools WHERE ABS(EnrollmentK_12 - EnrollmentAges5_17) > 30;	california_schools
SELECT S.SchoolName FROM Schools AS S JOIN TestScores AS T ON S.SchoolID = T.SchoolID WHERE (S.FreeMealCountK12 / S.TotalEnrollmentK12) > 0.1 AND T.TestScore >= 1500;	california_schools
SELECT s.FundingType FROM schools AS s JOIN test_scores AS ts ON s.SchoolID = ts.SchoolID WHERE s.CountyName = 'Riverside' GROUP BY s.SchoolID HAVING AVG(ts.AvgMathScore) > 400;	california_schools
SELECT SchoolName, Street, City, State, ZipCode FROM Schools WHERE County = 'Monterey' AND FreeReducedMeals_15_17 > 800;	california_schools
SELECT SchoolName, AVG(WritingScore) AS AverageWritingScore, Phone FROM Schools WHERE (OpenDate > '1991-01-01' OR CloseDate < '2000-01-01') GROUP BY SchoolName;	california_schools
SELECT SchoolName, DOCType FROM Schools WHERE (Enrollment_K_12 - Enrollment_Ages_5_17) > (SELECT AVG(Enrollment_K_12 - Enrollment_Ages_5_17) FROM Schools) AND Funding = 'Local';	california_schools
SELECT OpenDate FROM Schools WHERE Grades = 'K-12' ORDER BY Enrollment DESC LIMIT 1;	california_schools
SELECT CityName FROM Schools ORDER BY EnrollKto12 ASC LIMIT 5;	california_schools
SELECT T1.SchoolName, (T1."Free Meal Count (K-12)" / T1."Enrollment (K-12)") AS eligible_free_rate FROM School AS T1 ORDER BY T1."Enrollment (K-12)" DESC LIMIT 2 OFFSET 9;	california_schools
SELECT SchoolName, FRPMEligibleCountK_12 / EnrollmentK_12 AS EligibleFreeReducedMealRate FROM Schools WHERE Grades = 'K-12' AND OwnershipCode = 66 ORDER BY EligibleFreeReducedMealRate DESC LIMIT 5;	california_schools
SELECT SchoolName, Website FROM Schools WHERE FreeMealCount BETWEEN 1900 AND 2000;	california_schools
SELECT CAST(T2.FreeMealCount_5_17 AS REAL) / T2.Enrollment_5_17 FROM SchoolAdmins AS T1 JOIN SchoolDemographics AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson'	california_schools
SELECT frm.AdmEmail1 FROM frm JOIN sch ON frm.SchoolID = sch.SchoolID WHERE sch."Charter School (Y/N)" = 'Y' ORDER BY sch."Enrollment (K-12)" ASC LIMIT 1;	california_schools
SELECT A.AdmFName1 || ' ' || A.AdmLName1 AS Full_Name FROM (SELECT * FROM Schools WHERE NumGE1500 = (SELECT MAX(NumGE1500) FROM Schools)) S JOIN Admins A ON S.SchoolID = A.SchoolID;	california_schools
SELECT Street, City, Zip, State FROM Schools WHERE NumTstTakr > 0 ORDER BY CAST(NumGE1500 AS REAL) / NumTstTakr LIMIT 1;	california_schools
SELECT WebPage FROM Schools WHERE CountyCode = 'Los Angeles' AND CAST(REPLACE(TestTakers, ',', '') AS REAL) BETWEEN 2000 AND 3000;	california_schools
SELECT AVG(T2.TestTakers) FROM Schools AS T1 JOIN TestTakers AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.City = 'Fresno' AND strftime('%Y', T1.OpenDate) = '1980';	california_schools
SELECT T1.Telephone FROM schools AS T1 JOIN scores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.DistrictName = 'Fresno Unified' ORDER BY AVG(T2.ReadingScore) ASC LIMIT 1;	california_schools
SELECT Name FROM (SELECT Name, County, AVG(ReadingScore) AS avg_reading_score, ROW_NUMBER() OVER (PARTITION BY County ORDER BY AVG(ReadingScore) DESC) AS rank FROM Schools WHERE Virtual = 'F' GROUP BY Name, County) WHERE rank <= 5;	california_schools
SELECT s.TypeOfEducation FROM schools AS s JOIN (SELECT SchoolID, AVG(MathScore) AS AvgMathScore FROM scores GROUP BY SchoolID ORDER BY AvgMathScore DESC LIMIT 1) AS t ON s.SchoolID = t.SchoolID	california_schools
SELECT T2.CountyName, MIN(T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite) AS lowest_avg_score FROM Schools AS T1 JOIN Districts AS T2 ON T1.DCode = T2.DCode GROUP BY T1.SchoolID ORDER BY lowest_avg_score ASC LIMIT 1;	california_schools
SELECT T2.City, AVG(T1.Writing) FROM (SELECT SchoolID, COUNT(*) AS num_test_takers FROM SAT WHERE Total >= 1500 GROUP BY SchoolID ORDER BY num_test_takers DESC LIMIT 1) AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchId;	california_schools
SELECT s.SchoolName, AVG(sc.WritingScore) AS AvgWritingScore FROM schools s JOIN administrators a ON s.AdministratorID = a.AdministratorID JOIN scores sc ON s.SchoolID = sc.SchoolID WHERE a.AdmFName1 = 'Ricci' AND a.AdmLName1 = 'Ulrich' GROUP BY s.SchoolName;	california_schools
SELECT SchoolName FROM Schools WHERE DOC = 31 AND Grades = 'K-12' ORDER BY Enrollees DESC LIMIT 1;	california_schools
SELECT CAST(COUNT(*) AS REAL) / 12 FROM Schools WHERE OpenYr = 1980 AND CountyCode = 'Alameda' AND DOC = 52;	california_schools
SELECT CAST(COUNT(CASE WHEN DOC = 54 THEN SchoolID ELSE NULL END) AS REAL) / COUNT(CASE WHEN DOC = 52 THEN SchoolID ELSE NULL END) AS ratio FROM Schools WHERE CountyCode = 'Orange';	california_schools
SELECT D.CountyName AS County, S.SchoolName AS School_Name, S.ClosedDate AS Closure_Date FROM Schools AS S JOIN Districts AS D ON S.district_id = D.DistrictID WHERE S.StatusType = 'Closed' GROUP BY D.CountyName ORDER BY COUNT(S.SchoolID) DESC LIMIT 1;	california_schools
SELECT S.PostalStreetAddress FROM (SELECT SchoolID FROM Scores ORDER BY MathAverage DESC LIMIT 1 OFFSET 6) AS T JOIN Schools AS S ON T.SchoolID = S.SchoolID;	california_schools
SELECT A.MailingStreetAddress1, S.SchoolName FROM Schools AS S JOIN TestScores AS TS ON S.SchoolID = TS.SchoolID JOIN Addresses AS A ON S.SchoolID = A.SchoolID WHERE TS.Subject = 'Reading' GROUP BY S.SchoolID ORDER BY AVG(TS.Score) ASC LIMIT 1;	california_schools
SELECT COUNT(*) FROM Schools WHERE MailingCity = 'Lakeport' AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500;	california_schools
SELECT SUM(NumTestTakers) FROM Schools WHERE MailingCity = 'Fresno';	california_schools
SELECT SchoolName, MailingZip FROM Schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' OR AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian' OR AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian';	california_schools
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS ratio FROM Schools WHERE MailingStateAddr = 'CA'	california_schools
SELECT COUNT(*) FROM schools WHERE MailingStateAddress = 'CA' AND CityName = 'San Joaquin' AND Status = 'Active';	california_schools
SELECT T1.PhoneNumber, T1.Extension FROM Schools AS T1 JOIN Scores AS T2 ON T1.SchoolID = T2.SchoolID ORDER BY T2.AvgWritingScore DESC LIMIT 1 OFFSET 332;	california_schools
SELECT SchoolName, Phone FROM schools WHERE SchoolZip = '95203-3704';	california_schools
SELECT Website FROM schools WHERE AdmFName1 IN ('Mike', 'Dante') AND AdmLName1 IN ('Larson', 'Alvarez');	california_schools
SELECT s.Website FROM schools AS s JOIN Location AS l ON s.SchoolID = l.SchoolID WHERE s.Virtual = 'P' AND s.Charter = 1 AND l.County = 'San Joaquin';	california_schools
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1;	california_schools
SELECT COUNT(*) FROM Schools WHERE CountyName = 'Los Angeles' AND Charter = 0 AND (FreeMealCountK12 * 100.0 / EnrollmentK12) < 0.18;	california_schools
SELECT s.SchoolName, s.City, a.AdmFName1, a.AdmLName1, a.AdmFName2, a.AdmLName2, a.AdmFName3, a.AdmLName3 FROM schools AS s JOIN administrators AS a ON s.ID = a.SchoolID WHERE s.Charter = 1 AND s.CharNum = '00D2';	california_schools
;	california_schools
SELECT CAST(COUNT(CASE WHEN FundingType = 'Local' THEN SchoolID ELSE NULL END) AS REAL) / COUNT(SchoolID) * 100 AS Ratio_Percentage FROM Schools WHERE County = 'Santa Clara';	california_schools
SELECT COUNT(*) FROM Schools WHERE OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND CountyName = 'Stanislaus' AND FundingType = 'Directly Funded';	california_schools
;	california_schools
SELECT CountyName, COUNT(*) AS school_count FROM Schools WHERE SOC = '11' AND ClosureYear BETWEEN '1980' AND '1989' GROUP BY CountyName ORDER BY school_count DESC LIMIT 1;	california_schools
SELECT NCES_District_ID FROM schools WHERE SOC = '31';	california_schools
SELECT COUNT(*) FROM Schools WHERE SchStatus IN ('Active', 'Closed') AND SchType = 'District Community Day School' AND CountyName = 'Alpine';	california_schools
SELECT district_code FROM schools WHERE magnet = 0 AND city = 'Fresno';	california_schools
SELECT StudentCount FROM Schools WHERE EdOpsCode = 'SSS' AND City = 'Fremont' AND AcademicYear = '2014-2015';	california_schools
SELECT Free_Reduced_Meal_Count_5_17 FROM Schools WHERE MailingStreetAddress = 'PO Box 1040';	california_schools
SELECT LowGrade FROM schools WHERE NCES_SchDist_ID = '0613360' AND EdOpsCode = 'SPECON';	california_schools
SELECT T1.EduLevelName, T2.SchoolName FROM EducationLevels AS T1 JOIN Schools AS T2 ON T1.EduLevelID = T2.EduLevelID WHERE T2.BreakfastProvision = 'Breakfast Provision 2' AND T2.CountyCode = '37';	california_schools
SELECT City FROM Schools WHERE EILCode = 'HS' AND LunchProvision = 2 AND LowGrade = 9 AND HighGrade = 12 AND CountyFIPS = (SELECT FIPS FROM Counties WHERE CountyName = 'Merced');	california_schools
SELECT SchoolName, (FRPMCount_5_17 / Enrollment_5_17 * 100) AS PercentEligibleFRPM FROM Schools WHERE County = 'Los Angeles' AND GradeSpan = 'KG-9'	california_schools
SELECT GradeSpan, COUNT(*) AS frequency FROM Schools WHERE City = 'Adelanto' GROUP BY GradeSpan ORDER BY frequency DESC LIMIT 1;	california_schools
SELECT County, COUNT(*) AS num_schools FROM Schools WHERE Virtual='F' AND Latitude BETWEEN 32.57184 AND 34.96083 GROUP BY County ORDER BY num_schools DESC LIMIT 1;	california_schools
SELECT SchoolName, LatLong FROM Schools ORDER BY CAST(SUBSTR(LatLong, 1, INSTR(LatLong, ',')-1) AS REAL) DESC LIMIT 1;	california_schools
SELECT City, MinGrade, SchName FROM Schools WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1;	california_schools
SELECT grade_span FROM Schools WHERE longitude = (SELECT MAX(longitude) FROM Schools);	california_schools
SELECT City, COUNT(*) AS SchoolCount FROM Schools WHERE GradeSpan = 'K-8' AND Magnet = 1 AND NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY City;	california_schools
SELECT AdmFName1, District FROM SchoolAdmins GROUP BY AdmFName1 ORDER BY COUNT(*) DESC LIMIT 2;	california_schools
SELECT s.DistrictCode, (s.FreeMealCountK_12 / s.EnrollmentK_12 * 100.0) AS Percent_Eligible_Free FROM Schools s JOIN SchoolAdmins sa ON s.DistrictCode = sa.DistrictCode WHERE sa.AdmFName1 = 'Alusine';	california_schools
SELECT D.AdmLName1 AS Administrator_Last_Name, S.SchoolName AS School_Name, C.CountyName AS County_Name FROM Schools AS S JOIN Districts AS D ON S.DistrictID = D.DistrictID JOIN Counties AS C ON S.CountyID = C.CountyID WHERE S.CharterNumber = 40;	california_schools
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54);	california_schools
SELECT s.AdmEmail1 FROM schools AS s JOIN test_scores AS ts ON s.SchoolID = ts.SchoolID WHERE ts.SATScore >= 1500 GROUP BY s.SchoolName ORDER BY COUNT(*) DESC LIMIT 1;	california_schools
SELECT COUNT(*) FROM account JOIN client ON account.district_id = client.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND client.district_id IN (SELECT district_id FROM client WHERE district_id IN ('1', '5', '12'))	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK MESICNE' AND district_id = 3;	financial
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM unemployment;	financial
SELECT COUNT(T2.district_id) FROM (SELECT T1.district_id, AVG(T1.salary) AS avg_salary FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T1.district_id) AS T2 WHERE T2.avg_salary > 6000 AND T2.avg_salary < 10000;	financial
SELECT COUNT(DISTINCT T1.client_id) FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN transaction AS T3 ON T2.account_id = T3.account_from WHERE T1.gender = 'M' AND T1.district_id IN (SELECT district_id FROM district WHERE region = 'A3') GROUP BY T1.client_id HAVING AVG(T3.amount) > 8000;	financial
WITH oldest_female AS (SELECT MIN(birth_date) as min_birth FROM client WHERE gender = 'F'), female_clients AS (SELECT c.client_id, a.account_id FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' AND c.birth_date = (SELECT min_birth FROM oldest_female)), avg_salaries AS (SELECT fc.client_id, AVG(a.amount) as avg_salary FROM female_clients fc JOIN transaction t ON fc.account_id = t.account_from GROUP BY fc.client_id) SELECT fc.account_id, MAX(avg_salaries.avg_salary) - MIN(avg_salaries.avg_salary) as gap FROM female_clients fc JOIN avg_salaries ON fc.client_id = avg_salaries.client_id WHERE avg_salaries.avg_salary = (SELECT MIN(avg_salary) FROM avg_salaries);	financial
WITH youngest_client AS (SELECT MIN(birth_date) AS min_birth_date FROM client), avg_salary AS (SELECT account_from AS account, AVG(amount) AS average_salary FROM transaction GROUP BY account_from), highest_avg_salary AS (SELECT MAX(average_salary) AS max_avg_salary FROM avg_salary) SELECT a.account_to AS account_number FROM youngest_client yc JOIN client c ON yc.min_birth_date = c.birth_date JOIN account a ON c.client_id = a.account_id WHERE a.account_id IN (SELECT account FROM avg_salary WHERE average_salary = (SELECT max_avg_salary FROM highest_avg_salary));	financial
SELECT COUNT(DISTINCT c.client_id) FROM client AS c JOIN account AS a ON c.client_id = a.account_id WHERE a.frequency = 'POPLATEK TYDNE';	financial
SELECT client.client_id FROM client JOIN account ON client.client_id = account.account_id WHERE account.frequency = 'POPLATEK PO OBRATU';	financial
SELECT L.account_id, L.client_id, MIN(L.approved_amount) FROM loan AS L JOIN account AS A ON L.account_id = A.account_id WHERE strftime('%Y', L.date) = '1997' AND A.frequency = 'POPLATEK TYDNE';	financial
SELECT T1.account_to FROM loan AS T1 JOIN account AS T2 ON T1.account_to = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T1.duration > 12 AND strftime('%Y', T2.date) = '1993' ORDER BY T1.approved_amount DESC LIMIT 1;	financial
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.district_id = (SELECT district_id FROM account WHERE district = 'Sokolov');	financial
SELECT * FROM account WHERE SUBSTR(date, 1, 4) = '1995' ORDER BY date ASC LIMIT 1;	financial
SELECT DISTINCT T1.account_id FROM `account` AS T1 JOIN `transaction` AS T2 ON T1.account_id = T2.id WHERE strftime('%Y', T1.date) < '1997' AND T2.amount > 3000	financial
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y%m%d', T1.date) = '19940303'	financial
SELECT T2.date FROM (SELECT * FROM transactions WHERE amount = 840 AND strftime('%Y/%m/%d', date) = '1998/10/14') AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id;	financial
SELECT T2.district_id FROM transaction AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id WHERE T1.k_symbol = 'UVER' AND T2.date = '1994-08-25'	financial
SELECT MAX(t.amount) FROM transactions t JOIN account a ON t.account = a.account_id JOIN client c ON a.client = c.client_id WHERE a.date = '1996-10-21'	financial
SELECT T2.gender FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date = (SELECT MIN(T4.birth_date) FROM transaction AS T3 JOIN account AS T5 ON T3.account_from = T5.account_id JOIN client AS T4 ON T5.district_id = T4.district_id WHERE T5.district_id IN (SELECT district_id FROM account GROUP BY district_id ORDER BY AVG(CASE WHEN k_symbol='POPLATEK MESICNE' THEN amount ELSE 0 END) DESC LIMIT 1))	financial
SELECT T1.amount FROM (SELECT T3.client_id, MIN(T2.date) AS min_date FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id GROUP BY T3.client_id) AS subquery JOIN transaction AS T4 ON subquery.min_date = T4.date AND subquery.client_id = (SELECT client_id FROM loan WHERE amount = (SELECT MAX(amount) FROM loan))	financial
SELECT COUNT(*) FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' AND a.district_id = (SELECT district_id FROM account WHERE district_id = 18 LIMIT 1);	financial
SELECT T3.client_id FROM transaction AS T1 JOIN account AS T2 ON T1.account_to = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.amount = 5100 AND T1.date = '1998-09-02'	financial
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.name = 'Litomerice' AND strftime('%Y', account.date) = '1996';	financial
SELECT T2.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29';	financial
SELECT T2.birth_date FROM loan AS T1 JOIN account AS T3 ON T1.account_id = T3.account_id JOIN client AS T2 ON T3.client_id = T2.client_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03';	financial
SELECT a.account_id FROM account AS a JOIN client AS c ON a.district_id = c.district_id WHERE c.district_id IN (SELECT district_id FROM client WHERE district_id = 'A3') ORDER BY a.date ASC LIMIT 1;	financial
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.client_id) FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.frequency = 'POPLATEK MESICNE' AND T2.date LIKE '____-__-__' GROUP BY T1.district_id ORDER BY (SELECT inhabitants FROM district WHERE id = T1.district_id) DESC LIMIT 1;	financial
WITH first_loan_client AS (SELECT T1.client_id FROM client AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_to WHERE T2.k_symbol = 'UVER' AND T2.date = '1993-07-05' LIMIT 1), account_balance_changes AS (SELECT date, SUM(amount) AS balance_change FROM transaction WHERE account_to IN (SELECT account_id FROM first_loan_client) GROUP BY date) SELECT ((SELECT SUM(balance_change) FROM account_balance_changes WHERE date = '1998-12-27') - (SELECT SUM(balance_change) FROM account_balance_changes WHERE date = '1993-03-22')) / (SELECT SUM(balance_change) FROM account_balance_changes WHERE date = '1993-03-22') * 100 AS increase_rate;	financial
SELECT (SUM(CASE WHEN t2.status = 'A' THEN t1.amount ELSE 0 END) / SUM(t1.amount)) * 100 AS loan_percentage FROM transaction AS t1 JOIN contract AS t2 ON t1.contract_id = t2.contract_id WHERE t1.k_symbol = 'UVER';	financial
SELECT CAST(SUM(CASE WHEN T1.k_symbol = 'UVER' AND T1.amount < 100000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM transaction AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.k_symbol = 'UVER' AND T1.amount < 100000 GROUP BY T1.account_id HAVING SUM(CASE WHEN T1.k_symbol = 'UVER' THEN 1 ELSE 0 END) > 0;	financial
SELECT A.account_id, D.name AS district_name, A3.region FROM account AS A INNER JOIN district AS D ON A.district_id = D.id INNER JOIN A3 ON A.frequency = 'POPLATEK PO OBRATU' WHERE strftime('%Y', A.date) = '1993';	financial
SELECT T1.account_id, T1.frequency FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.birth_date BETWEEN '1970-01-01' AND '1985-12-31' AND T1.date BETWEEN '1995-01-01' AND '2000-12-31';	financial
SELECT a.account_id, a.date FROM account AS a JOIN client AS c ON a.district_id = c.district_id;	financial
;	financial
SELECT T1.account_id, T2.district_id AS District, A3.region AS Region FROM transaction AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS A3 ON T2.client_id = A3.client_id WHERE T1.amount > 300000 AND T1.k_symbol = 'UVER';	financial
SELECT account.district_id AS District_ID, AVG(client.birth_date) AS Average_Salary FROM account JOIN client ON account.district_id = client.district_id WHERE /* Ideally, we would filter by loan duration here, but it's not possible with the given schema */ GROUP BY account.district_id;	financial
SELECT c.district_id, ((ur.A13 - ur.A12) / ur.A12) * 100 AS unemployment_increment FROM transaction t JOIN client c ON t.client_id = c.client_id JOIN unemployment_rate ur ON c.district_id = ur.district_id WHERE t.status = 'D' AND ur.year BETWEEN 1995 AND 1996;	financial
SELECT CAST(SUM(CASE WHEN T3.district_name = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN A2 AS T3 ON T2.district_id = T3.district_id WHERE strftime('%Y', T1.date) = '1993';	financial
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT T2.district_id, COUNT(T1.account_id) AS num_accounts FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.gender = 'F' GROUP BY T2.district_id ORDER BY num_accounts DESC LIMIT 9;	financial
SELECT T3.A2 AS district_name, T1.amount AS withdrawal_amount FROM transaction AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.type = 'VYDAJ' AND strftime('%Y-%m', T1.date) = '1996-01' ORDER BY T1.amount DESC LIMIT 10;	financial
SELECT COUNT(*) FROM client WHERE district_id IN (SELECT district_id FROM district WHERE name = 'South Bohemia') AND client_id NOT IN (SELECT client_id FROM account JOIN credit_card ON account.account_id = credit_card.account_id);	financial
SELECT T3.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.status IN ('C', 'D') GROUP BY T3.district_id ORDER BY SUM(T1.amount) DESC LIMIT 1;	financial
SELECT AVG(t.amount) FROM transactions t JOIN account a ON t.account_from = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.k_symbol = 'UVER' AND c.gender = 'M';	financial
SELECT A2 FROM district ORDER BY A13 DESC LIMIT 1;	financial
SELECT T2.district_id, COUNT(*) AS num_accounts FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE strftime('%Y', T1.date) = '1996' GROUP BY T2.district_id ORDER BY num_accounts DESC LIMIT 1;	financial
SELECT COUNT(*) FROM transactions JOIN account ON transactions.account_id = account.account_id WHERE transactions.operation = 'VYBER KARTOU' AND account.frequency = 'POPLATEK MESICNE' AND (account.balance - transactions.amount) < 0;	financial
SELECT COUNT(*) FROM (SELECT t.account_to AS account_id FROM transactions AS t JOIN account AS a ON t.account_from = a.account_id WHERE t.k_symbol = 'UVER' AND t.amount >= 250000 AND t.date BETWEEN '1995-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK MESICNE' GROUP BY t.account_to) WHERE COUNT(*) > 0;	financial
SELECT COUNT(*) FROM account WHERE district_id = 1;	financial
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT T2.district_id FROM(SELECT district_id, SUM(A15) as total_crimes FROM branch GROUP BY district_id ORDER BY total_crimes DESC LIMIT 1 OFFSET 1) AS T1 INNER JOIN branch AS T2 ON T1.district_id = T2.district_id);	financial
;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE name = 'Pisek');	financial
SELECT DISTINCT T3.district_id FROM `transaction` AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE strftime('%Y', date) = '1997' AND amount > 10000;	financial
SELECT a.account_id FROM transactions t JOIN account a ON t.account_from = a.account_id JOIN client c ON a.district_id = c.district_id WHERE t.k_symbol = 'SIPO' AND c.district_id = (SELECT district_id FROM client WHERE district_id = 18);	financial
;	financial
SELECT AVG(t.amount) FROM (SELECT strftime('%m', t.date) AS month, AVG(t.amount) AS avg_amount FROM transaction AS t JOIN account AS a ON t.account_id = a.account_id JOIN client AS c ON a.client_id = c.client_id WHERE t.operation = 'VYBER KARTOU' AND strftime('%Y', t.date) = '2021' GROUP BY month) AS t	financial
SELECT T2.client_id FROM (SELECT AVG(amount) AS avg_amount FROM operation WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) = '1998') AS subquery, operation AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T1.amount < (SELECT avg_amount FROM subquery) AND strftime('%Y', T1.date) = '1998';	financial
SELECT c.client_id FROM client AS c JOIN account AS a ON c.district_id = a.district_id WHERE c.gender = 'F' AND EXISTS (SELECT 1 FROM transaction AS t WHERE t.account_id = a.account_id AND t.k_symbol IN ('POJISTNE', 'UVER'))	financial
SELECT COUNT(*) FROM client JOIN account ON client.district_id = account.district_id WHERE client.gender = 'F' AND client.district_id = 3;	financial
SELECT t1.account_id FROM `account` AS t1 JOIN `client` AS t2 ON t1.district_id = t2.district_id WHERE t1.frequency IN ('POPLATEK MESICNE', 'POPLATEK TYDNE', 'POPLATEK PO OBRATU') AND t2.gender IN ('F', 'M') AND t2.district_id IN (18, 1, 5, 12, 15)	financial
;	financial
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 JOIN transactions AS T2 ON T1.account_id = T2.account_from WHERE T1.district_id IN (SELECT district_id FROM client WHERE district_id IN (SELECT district_id FROM A3 WHERE region_name = 'North Bohemia')) AND T2.bank_to = 'AB'	financial
SELECT T3.A2 FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2;	financial
SELECT A3 FROM (SELECT R.region_name AS A3, AVG(R.crime_1995) AS A15 FROM region AS R JOIN client AS C ON R.district_id = C.district_id JOIN account AS A ON C.client_id = A.account_id WHERE strftime('%Y', A.date) >= '1997' GROUP BY R.region_name HAVING AVG(R.crime_1995) > 4000)	financial
SELECT COUNT(*) FROM account WHERE frequency = 'POPLATEK MESICNE';	financial
SELECT COUNT(client_id) FROM client WHERE gender = 'M' AND district_id = 2;	financial
SELECT CAST(SUM(CASE WHEN T2.type = 'GOLD' AND strftime('%Y', T1.date) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.account_id) FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id;	financial
SELECT c.client_id FROM (SELECT a.account_id FROM (SELECT * FROM transactions WHERE k_symbol = 'UVER' ORDER BY amount DESC LIMIT 1) t JOIN account a ON t.account_from = a.account_id) ac JOIN client c ON ac.client_id = c.client_id;	financial
SELECT district_id FROM account WHERE account_id = 532;	financial
;	financial
SELECT transaction.* FROM transaction JOIN account ON transaction.account = account.account_id JOIN client ON account.client_id = client.client_id WHERE operation = 'VYBER' AND client.client_id = 3356;	financial
SELECT COUNT(*) FROM account JOIN (SELECT * FROM samples WHERE k_symbol = 'UVER') AS loans ON account.account_id = loans.account_to WHERE account.frequency = 'POPLATEK TYDNE' AND loans.amount < 200000;	financial
;	financial
SELECT district_id FROM client WHERE client_id = 3541;	financial
SELECT c.district_id FROM client AS c JOIN account AS a ON c.client_id = a.account_id JOIN (SELECT * FROM You WHERE k_symbol = 'UVER' AND status = 'A') AS y ON a.account_id = y.id GROUP BY c.district_id ORDER BY COUNT(*) DESC LIMIT 1;	financial
;	financial
SELECT t.* FROM transaction AS t JOIN account AS a ON t.account_from = a.account_id JOIN client AS c ON a.district_id = c.district_id WHERE a.district_id = 5;	financial
SELECT COUNT(*) FROM account WHERE district_id = 18;	financial
SELECT DISTINCT c.client_id FROM client AS c JOIN account AS a ON c.district_id = a.district_id WHERE a.date >= '1997-01-01';	financial
SELECT CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.client_id) FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.district_id IN (SELECT district_id FROM A11 WHERE AVG_salary > 10000);	financial
WITH male_loans_1996 AS (  SELECT SUM(t.amount) AS total_amount  FROM transaction t  JOIN account a ON t.account_from = a.account_id  JOIN client c ON a.account_id = c.client_id  WHERE c.gender = 'M' AND strftime('%Y', t.date) = '1996' ), male_loans_1997 AS (  SELECT SUM(t.amount) AS total_amount  FROM transaction t  JOIN account a ON t.account_from = a.account_id  JOIN client c ON a.account_id = c.client_id  WHERE c.gender = 'M' AND strftime('%Y', t.date) = '1997' ) SELECT ((ml_1997.total_amount - ml_1996.total_amount) / (ml_1996.total_amount)) * 100.0 AS growth_rate FROM male_loans_1996 ml_1996, male_loans_1997 ml_1997;	financial
SELECT COUNT(*) FROM You JOIN account ON You.id = account.account_id WHERE strftime('%Y', account.date) > '1995';	financial
SELECT (SELECT A16 FROM table_name WHERE A3 = 'North Bohemia') - (SELECT A16 FROM table_name WHERE A3 = 'East Bohemia')	financial
;	financial
SELECT T1.frequency, T2.k_symbol FROM account AS T1 JOIN You AS T2 ON T1.account_id = T2.account_to WHERE T1.account_id = 3 AND T2.amount = 3539;	financial
SELECT strftime('%Y', birth_date) AS birth_year FROM client WHERE client_id = 130;	financial
SELECT COUNT(account_id) FROM account WHERE frequency = 'POPLATEK PO OBRATU';	financial
SELECT SUM(T1.amount) FROM You AS T1 JOIN account AS T2 ON T1.id = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T3.client_id = 992;	financial
SELECT SUM(t.amount), c.gender FROM transactions AS t JOIN account AS a ON t.account_id = a.account_id JOIN client AS c ON a.client_id = c.client_id WHERE t.transaction_id = 851 AND c.client_id = 4;	financial
;	financial
SELECT SUM(t.amount) FROM (SELECT * FROM transactions JOIN account ON transactions.account_id = account.account_id) AS t JOIN client AS c ON t.client_id = c.client_id WHERE c.client_id = 617 AND strftime('%Y', t.date) = '1998';	financial
SELECT c.client_id, c.gender, c.birth_date FROM client AS c JOIN account AS a ON c.district_id = a.district_id WHERE strftime('%Y', c.birth_date) BETWEEN '1983' AND '1987' AND a.district_id IN (SELECT district_id FROM district WHERE region = 'East Bohemia');	financial
SELECT c.client_id FROM (SELECT a.account_id, t.amount FROM client AS c JOIN account AS a ON c.district_id = a.district_id JOIN transaction AS t ON a.account_id = t.account_from WHERE c.gender = 'F') AS subquery ORDER BY amount DESC LIMIT 3;	financial
SELECT COUNT(DISTINCT T3.client_id) FROM payment AS T1 INNER JOIN account AS T2 ON T1.account_from = T2.account_id INNER JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T3.gender = 'M' AND T3.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T1.k_symbol = 'SIPO' AND T1.amount > 4000;	financial
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM client WHERE district_id = 'Beroun') AND date LIKE '1997%' OR date LIKE '1998%' OR date LIKE '1999%' OR date LIKE '2000%'	financial
;	financial
WITH prague_district AS (SELECT district_id FROM account WHERE district_id = 'A3' LIMIT 1), female_clients_in_prague AS (SELECT COUNT(*) AS female_count FROM client c JOIN account a ON c.client_id = a.account_id WHERE c.gender = 'F' AND a.district_id IN (SELECT district_id FROM prague_district)), total_clients_in_prague AS (SELECT COUNT(*) AS total_count FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.district_id IN (SELECT district_id FROM prague_district)) SELECT CAST(female_count AS REAL) / total_count * 100 AS percentage_female FROM female_clients_in_prague, total_clients_in_prague	financial
SELECT CAST((SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.frequency = 'POPLATEK TYDNE') AS REAL) * 100 / (SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.frequency = 'POPLATEK TYDNE')	financial
SELECT COUNT(DISTINCT T2.client_id) FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T1.frequency = 'POPLATEK TYDNE'	financial
SELECT * FROM account WHERE date < '1997-01-01'	financial
SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN A11 ON T2.account_id = A11.account WHERE T1.gender = 'F' ORDER BY T1.birth_date, A11.salary ASC LIMIT 1;	financial
SELECT COUNT(*) FROM client WHERE strftime('%Y', birth_date) = '1920';	financial
SELECT COUNT(*) FROM account JOIN transaction ON account.account_id = transaction.account_from WHERE account.frequency = 'POPLATEK TYDNE' AND transaction.k_symbol = 'UVER';	financial
SELECT AVG(t.amount) FROM transactions t JOIN account a ON t.account_from = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.k_symbol = 'UVER' AND a.frequency = 'POPLATEK PO OBRATU' AND c.status = 'C'	financial
SELECT DISTINCT c.client_id, c.district_id FROM client AS c JOIN account AS a ON c.district_id = a.district_id;	financial
SELECT T1.client_id, strftime('%Y', 'now') - strftime('%Y', T1.birth_date) AS age FROM client AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T2.type = 'gold' AND T3.type = 'OWNER';	financial
SELECT bond_type, COUNT(*) as count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1;	toxicology
SELECT COUNT(T2.atom_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl';	toxicology
SELECT AVG(oxygen_count) AS avg_oxygen_atoms FROM (SELECT COUNT(*) AS oxygen_count FROM(SELECT a.molecule_id, a.element FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '-' AND a.element = 'o' UNION ALL SELECT a.molecule_id, a.element FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '-' AND a.element = 'o') GROUP BY molecule_id) AS oxygen_atoms_per_molecule;	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(T3.atom_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.label = '+'	toxicology
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'na' AND T3.label = '-';	toxicology
SELECT DISTINCT T3.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T2.bond_type = '#' AND T3.label = '+'	toxicology
SELECT CAST(SUM(CASE WHEN T3.element = 'c' OR T4.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id JOIN atom AS T4 ON T1.atom_id2 = T4.atom_id WHERE T2.bond_type = '='	toxicology
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '#';	toxicology
SELECT COUNT(*) FROM atom WHERE element != 'br';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR099';	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT a1.element, a2.element FROM (SELECT c.atom_id AS atom_id1, c.atom_id2 AS atom_id2 FROM connected c WHERE c.bond_id = 'TR004_8_9') AS b JOIN atom a1 ON b.atom_id1 = a1.atom_id JOIN atom a2 ON b.atom_id2 = a2.atom_id;	toxicology
SELECT DISTINCT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '=' UNION SELECT DISTINCT T4.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T1.atom_id2 = T4.atom_id WHERE T2.bond_type = '='	toxicology
SELECT m.label, COUNT(m.label) AS label_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY label_count DESC LIMIT 1;	toxicology
SELECT DISTINCT T2.bond_type FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id OR T1.atom_id = T3.atom_id2 JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T1.element = 'cl';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id JOIN molecule AS m ON a1.molecule_id = m.molecule_id AND a2.molecule_id = m.molecule_id WHERE m.label = '-';	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element ORDER BY COUNT(a.element) ASC LIMIT 1;	toxicology
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')	toxicology
SELECT T3.label FROM (SELECT DISTINCT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element != 'sn') AS T3 JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id;	toxicology
SELECT COUNT(DISTINCT CASE WHEN T1.element = 'i' OR T1.element = 's' THEN T1.atom_id ELSE NULL END) AS atom_count FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'	toxicology
SELECT DISTINCT c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id WHERE (a1.molecule_id = 'TR181' OR a2.molecule_id = 'TR181') AND (c.atom_id != c.atom_id2);	toxicology
SELECT CAST((SELECT COUNT(DISTINCT atom_id) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND element != 'f') AS REAL) * 100 / (SELECT COUNT(DISTINCT atom_id) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+'))	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.label = '+'	toxicology
SELECT DISTINCT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR000' ORDER BY T1.element ASC LIMIT 3;	toxicology
SELECT c.atom_id, c2.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id JOIN atom AS a ON c.atom_id = a.atom_id AND a.molecule_id = 'TR001' JOIN atom AS a2 ON c.atom_id2 = a2.atom_id AND a2.molecule_id = 'TR001' WHERE c.bond_id = 'TR001_2_6';	toxicology
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference	toxicology
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';	toxicology
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';	toxicology
SELECT m.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = ' =' GROUP BY m.molecule_id ORDER BY m.molecule_id LIMIT 5;	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR008' GROUP BY T2.molecule_id;	toxicology
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule;	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 WHERE T1.molecule_id = 'TR206'	toxicology
SELECT DISTINCT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR000';	toxicology
SELECT atom.element, molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR060';	toxicology
SELECT b.bond_type, m.label FROM (SELECT bond_type, COUNT(*) as count FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.molecule_id = 'TR010' GROUP BY bond_type ORDER BY count DESC LIMIT 1) AS b JOIN molecule AS m ON m.molecule_id = 'TR010';	toxicology
SELECT m.molecule_id FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id JOIN connected AS c ON b.bond_id = c.bond_id WHERE m.label = '-' AND b.bond_type = '-' GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 3;	toxicology
SELECT b.bond_id FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.molecule_id = 'TR006' ORDER BY b.bond_id LIMIT 2;	toxicology
SELECT COUNT(*) FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN atom ON (connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id) WHERE (connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12') AND atom.molecule_id = 'TR009'	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br';	toxicology
SELECT T2.bond_type, T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9';	toxicology
SELECT m.molecule_id, m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '#';	toxicology
SELECT COUNT(*) FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id LIKE 'TR%_19' OR connected.atom_id2 LIKE 'TR%_19';	toxicology
SELECT atom.element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR004';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '-';	toxicology
SELECT a.atom_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'	toxicology
SELECT DISTINCT T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN atom AS T4 ON T4.atom_id = T2.atom_id OR T4.atom_id = T2.atom_id2 JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE (T1.element = 'p' AND T4.element = 'n') OR (T1.element = 'n' AND T4.element = 'p')	toxicology
SELECT m.molecule_id FROM (SELECT b.molecule_id, COUNT(*) AS num_double_bonds FROM bond AS b WHERE b.bond_type = ' = ' GROUP BY b.molecule_id) AS subquery JOIN molecule AS m ON subquery.molecule_id = m.molecule_id WHERE m.label = '+' AND subquery.num_double_bonds IN (SELECT MAX(num_double_bonds) FROM (SELECT COUNT(*) AS num_double_bonds FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id));	toxicology
SELECT CAST(COUNT(T2.bond_id) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'i';	toxicology
SELECT T3.bond_type, T3.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE CAST(SUBSTR(T1.atom_id, 7, 2) AS INTEGER) + 0 = 45;	toxicology
SELECT A.atom_id FROM atom AS A WHERE A.atom_id NOT IN (SELECT C.atom_id FROM connected AS C UNION SELECT C.atom_id2 FROM connected AS C)	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#';	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR144_8_19';	toxicology
SELECT b.molecule_id, COUNT(*) AS num_double_bonds FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.bond_type = '=' AND (SELECT m.label FROM molecule AS m WHERE m.molecule_id = b.molecule_id) = '+' GROUP BY b.molecule_id ORDER BY num_double_bonds DESC LIMIT 1;	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.element ORDER BY COUNT(*) ASC LIMIT 1;	toxicology
SELECT c.atom_id2 FROM connected AS c JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.element = 'pb';	toxicology
SELECT DISTINCT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '#' UNION SELECT DISTINCT T4.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_type = '#';	toxicology
WITH atom_combinations AS (SELECT a1.element AS element1, a2.element AS element2, COUNT(*) AS combination_count FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id GROUP BY element1, element2), most_common_combination AS (SELECT element1, element2, MAX(combination_count) AS max_combination_count FROM atom_combinations GROUP BY 1, 2 LIMIT 1), total_bonds AS (SELECT COUNT(*) AS total_bond_count FROM bond) SELECT CAST((SELECT max_combination_count FROM most_common_combination) AS REAL) / (SELECT total_bond_count FROM total_bonds) * 100 AS percentage_of_most_common_combination;	toxicology
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'	toxicology
SELECT COUNT(atom_id) FROM atom WHERE element IN('c', 'h')	toxicology
SELECT c.atom_id2 FROM connected AS c JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.element = 's';	toxicology
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'sn';	toxicology
SELECT COUNT(DISTINCT T3.element) FROM (SELECT DISTINCT T1.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-') AS T1 JOIN atom AS T3 ON T1.atom_id = T3.atom_id	toxicology
SELECT COUNT(*) FROM (SELECT a.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '#' AND (a.element = 'p' OR a.element = 'br') GROUP BY a.molecule_id) AS result;	toxicology
SELECT b.bond_id FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE m.label = '+'	toxicology
SELECT DISTINCT m.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-';	toxicology
SELECT CAST(SUM(CASE WHEN T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.atom_id) FROM (SELECT T2.bond_type, T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '-' AND T3.element = 'cl')	toxicology
SELECT molecule_id, label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')	toxicology
SELECT molecule_id FROM molecule WHERE label = '-'	toxicology
SELECT COUNT(*) FROM molecule WHERE molecule_id LIKE 'TR[0-9][0-9][0-9]' AND CAST(SUBSTR(molecule_id,4,1) AS INTEGER) BETWEEN 0 AND 30 AND label = '+'	toxicology
SELECT B.bond_type FROM connected C JOIN bond B ON C.bond_id = B.bond_id WHERE B.molecule_id BETWEEN 'TR000' AND 'TR050';	toxicology
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'i'	toxicology
SELECT m.label, COUNT(*) as count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca' GROUP BY m.label ORDER BY count DESC LIMIT 1;	toxicology
SELECT A1.element AS element1, A2.element AS element2 FROM atom AS A1 JOIN connected AS C ON A1.atom_id = C.atom_id JOIN atom AS A2 ON A2.atom_id = C.atom_id2 JOIN bond AS B ON B.bond_id = C.bond_id WHERE B.bond_id = 'TR001_1_8' AND (A1.element = 'cl' OR A2.element = 'cl') AND (A1.element = 'c' OR A2.element = 'c')	toxicology
SELECT DISTINCT m.molecule_id FROM molecule AS m JOIN atom AS a1 ON m.molecule_id = a1.molecule_id AND a1.element = 'c' JOIN atom AS a2 ON m.molecule_id = a2.molecule_id AND a2.element = 'c' JOIN connected AS c ON (a1.atom_id = c.atom_id OR a1.atom_id = c.atom_id2) AND (a2.atom_id = c.atom_id OR a2.atom_id = c.atom_id2) JOIN bond AS b ON b.bond_id = c.bond_id WHERE m.label = '-' AND b.bond_type = '#' LIMIT 2;	toxicology
SELECT CAST(SUM(CASE WHEN T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.atom_id) FROM molecule AS T1 JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.label = '+'	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR001';	toxicology
SELECT T1.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '=';	toxicology
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' ;	toxicology
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_1_2';	toxicology
SELECT COUNT(DISTINCT T2.molecule_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-';	toxicology
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';	toxicology
SELECT b.bond_id, m.label, COUNT(*) AS count FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' GROUP BY m.label;	toxicology
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 1) = '4' AND m.label = '+' GROUP BY a.molecule_id;	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id), T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006';	toxicology
SELECT EXISTS(SELECT 1 FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'ca' AND molecule.label = '+');	toxicology
SELECT T3.bond_type FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T1.bond_id = T3.bond_id INNER JOIN atom AS T4 ON T1.atom_id2 = T4.atom_id WHERE T2.element = 'c' OR T4.element = 'c';	toxicology
SELECT a.element FROM atom AS a JOIN connected AS c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) WHERE c.bond_id = 'TR001_10_11';	toxicology
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '#' THEN T1.bond_id END) AS REAL) * 100 / COUNT(T1.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id;	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR047';	toxicology
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR151';	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR151';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT atom_id FROM atom WHERE element = 'c' AND CAST(SUBSTR(molecule_id, 3, 3) AS INTEGER) BETWEEN 10 AND 50;	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');	toxicology
SELECT b.bond_id FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+'	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'h';	toxicology
SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR000_1' OR T1.atom_id2 = 'TR000_1') AND T1.bond_id = 'TR000_1_2'	toxicology
SELECT a.atom_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T1.element = 'h' AND T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h' AND T3.label = '+'	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR124';	toxicology
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR186';	toxicology
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR007_4_19';	toxicology
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_2_4';	toxicology
SELECT COUNT(*) AS num_double_bonds, m.label FROM (SELECT * FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR006' AND b.bond_type = '=') AS double_bonds JOIN molecule m ON m.molecule_id = 'TR006';	toxicology
SELECT DISTINCT T2.molecule_id, T2.element FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'	toxicology
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';	toxicology
SELECT DISTINCT T3.molecule_id AS molecule_with_triple_bond, GROUP_CONCAT(T1.element) AS elements FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '#' GROUP BY T3.molecule_id;	toxicology
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_2_3';	toxicology
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'cl';	toxicology
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS num_bond_types FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;	toxicology
SELECT COUNT(DISTINCT T3.molecule_id) AS total_molecules_with_double_bond, (SELECT COUNT(DISTINCT T4.molecule_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T4 ON T2.molecule_id = T4.molecule_id WHERE T2.bond_type = '=' AND T4.label = '+') AS carcinogenic_molecules_with_double_bond FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T4 ON T2.bond_id = T4.bond_id WHERE NOT EXISTS (SELECT * FROM atom AS T5 WHERE T5.element = 's' AND T5.molecule_id = T3.molecule_id) AND T4.bond_type != '=' GROUP BY T3.molecule_id	toxicology
SELECT m.label FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE c.bond_id = 'TR001_2_4'	toxicology
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';	toxicology
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-';	toxicology
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+'	toxicology
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'	toxicology
SELECT CAST(SUM(CASE WHEN T4.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.atom_id = T3.atom_id OR T2.atom_id = T3.atom_id2 JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.label = '+'	toxicology
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';	toxicology
SELECT COUNT(DISTINCT T2.element) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_3_4' UNION SELECT COUNT(DISTINCT T2.element) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T1.bond_id = 'TR001_3_4';	toxicology
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')	toxicology
SELECT a1.molecule_id FROM atom AS a1 JOIN atom AS a2 ON a1.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4'	toxicology
SELECT element FROM atom WHERE atom_id = 'TR000_1';	toxicology
SELECT label FROM molecule WHERE molecule_id = 'TR000';	toxicology
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id	toxicology
SELECT COUNT(T1.molecule_id), T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+' GROUP BY T2.molecule_id;	toxicology
SELECT DISTINCT T2.molecule_id FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 's' AND T2.bond_type = '='	toxicology
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5	toxicology
SELECT DISTINCT T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id OR T1.atom_id2 = T3.atom_id WHERE T2.bond_type = '=' AND T3.molecule_id = 'TR024';	toxicology
SELECT a.molecule_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.molecule_id ORDER BY COUNT(a.atom_id) DESC LIMIT 1;	toxicology
SELECT CAST(SUM(CASE WHEN T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id JOIN atom AS T4 ON T4.atom_id = T1.atom_id WHERE T4.element = 'h' AND T2.bond_type = '#';	toxicology
SELECT COUNT(*) FROM molecule WHERE label = '+'	toxicology
SELECT COUNT(*) FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.molecule_id BETWEEN 'TR004' AND 'TR010' AND bond.bond_type = '-'	toxicology
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND molecule.molecule_id = 'TR008';	toxicology
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-';	toxicology
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'o' AND T2.bond_type = '=';	toxicology
SELECT COUNT(DISTINCT m.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '-'	toxicology
SELECT DISTINCT atom.element, bond.bond_type FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id JOIN connected ON atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2 JOIN bond ON connected.bond_id = bond.bond_id WHERE molecule.molecule_id = 'TR002';	toxicology
SELECT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id WHERE a.element = 'c' AND b.bond_type = '=' AND a.molecule_id = 'TR012';	toxicology
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o';	toxicology
SELECT uuid FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT * FROM set WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);	card_games
SELECT c.name FROM cards AS c JOIN (SELECT uuid, MAX(faceConvertedManaCost) AS max_face_converted_mana_cost FROM cards GROUP BY uuid) AS subquery ON c.uuid = subquery.uuid AND c.faceConvertedManaCost = subquery.max_face_converted_mana_cost;	card_games
SELECT * FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator'	card_games
SELECT l.status FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Artifact' AND c.side IS NULL AND l.format = 'vintage';	card_games
SELECT c.uuid AS card_id, c.artist FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT c.uuid, cf.rulings_text, c.hasContentWarning FROM cards AS c JOIN card_faces AS cf ON c.uuid = cf.card_uuid WHERE cf.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;	card_games
SELECT c.name, r.text, s.setName FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid JOIN sets AS s ON c.set = s.setCode WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';	card_games
SELECT c.name AS card_name, c.artist, p.isPromo FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid JOIN printings AS p ON c.uuid = p.uuid GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;	card_games
SELECT t.language FROM translations AS t JOIN cards AS c ON t.uuid = c.uuid WHERE c.name = 'Annul' AND c.number = '29';	card_games
;	card_games
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 AS percentage FROM set_cards;	card_games
SELECT s.setName, SUM(sc.totalSetSize) AS total_cards FROM sets AS s LEFT JOIN set_cards AS sc ON s.code = sc.setCode WHERE s.language = 'Italian' GROUP BY s.setName;	card_games
SELECT COUNT(DISTINCT type) FROM (SELECT unnest(string_to_array(type, ',')) AS type FROM cards WHERE artist = 'Aaron Boyd')	card_games
SELECT s.subtype FROM cards c JOIN subtypes s ON c.uuid = s.uuid WHERE c.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM cards WHERE power = '*'	card_games
SELECT c.promoTypes FROM cards AS c WHERE c.card_name = 'Duress';	card_games
SELECT border_color FROM cards WHERE name = 'Ancestor''s Chosen'	card_games
SELECT originaltype FROM cards WHERE name = 'Ancestor's Chosen';	card_games
SELECT DISTINCT T3.language FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.setCode JOIN translations AS T3 ON T1.uuid = T3.cardUUID WHERE T1.name = 'Angel of Mercy'	card_games
SELECT COUNT(*) FROM (SELECT * FROM cards WHERE isTextless = 0) AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.status = 'Restricted';	card_games
SELECT r.text FROM rulings AS r JOIN cards AS c ON r.uuid = c.uuid WHERE c.name = 'Condemn'	card_games
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.isStarter = 1 AND l.status = 'Restricted';	card_games
SELECT L.status FROM (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle') AS C JOIN legalities AS L ON C.uuid = L.uuid	card_games
SELECT types FROM cards WHERE name = 'Benalish Knight';	card_games
SELECT l.format, l.status FROM legalities AS l JOIN cards AS c ON l.uuid = c.uuid WHERE c.name = 'Benalish Knight'	card_games
SELECT artist FROM cards WHERE watermark = 'Phyrexian';	card_games
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets	card_games
SELECT COUNT(*) FROM cards WHERE language = 'German' AND isReprint = 1;	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND language = 'Russian'	card_games
SELECT CAST(SUM(CASE WHEN language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / (SELECT COUNT(*) FROM cards WHERE isStorySpotlight = 1) AS percentage FROM cards WHERE isStorySpotlight = 1;	card_games
;	card_games
SELECT name FROM cards WHERE artist = 'Aaron Boyd';	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';	card_games
SELECT uuid FROM cards WHERE convertedManaCost = 0;	card_games
SELECT layout FROM cards WHERE type LIKE '%Flying%'	card_games
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND NOT subTypes LIKE '%Angel%'	card_games
SELECT uuid FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'duel' AND l.status = 'Legal';	card_games
;	card_games
SELECT c.artist FROM cards AS c JOIN foreign_data AS fd ON c.multiverse_id = fd.id WHERE fd.language = 'Chinese Simplified'	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.availability LIKE '%paper%' AND s.language = 'Japanese'	card_games
SELECT COUNT(DISTINCT c.uuid) FROM (SELECT * FROM cards WHERE borderColor = 'white') AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.status = 'Banned';	card_games
SELECT c.uuid, json_extract(c.foreign_data, '$[*].language') AS language FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'legacy' AND l.status = 'Legal';	card_games
SELECT l.format, l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.name = 'Beacon of Immortality';	card_games
SELECT COUNT(*) FROM (SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.frameVersion = 'future') AS future_cards JOIN legalities AS l2 ON future_cards.uuid = l2.uuid WHERE l2.status = 'Legal';	card_games
SELECT c.name, c.colorIdentity FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.setCode = 'OGW';	card_games
SELECT c.name, t.language FROM cards AS c JOIN translations AS t ON c.uuid = t.uuid WHERE c.setCode = '10E' AND c.convertedManaCost = 5;	card_games
SELECT c.name, r.date FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.types LIKE '%Creature - Elf%'	card_games
SELECT c.colors FROM (SELECT uuid FROM cards WHERE id BETWEEN 1 AND 20) AS subquery JOIN cards AS c ON subquery.uuid = c.uuid	card_games
{\"B\"}	card_games
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'uncommon' ORDER BY c.released_at ASC LIMIT 3;	card_games
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'John Avon' AND c.cardKingdomId IS NOT NULL AND c.cardKingdomFoilId IS NOT NULL AND l.status NOT IN ('Banned', 'Restricted');	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.sets_id = sets.id WHERE sets.borderColor = 'white' AND cards.cardKingdomFoilId IS NOT NULL AND cards.cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM card WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1;	card_games
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1;	card_games
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability LIKE '%mtgo%' AND availability LIKE '%paper%';	card_games
{', '') AS INTEGER)) FROM cards WHERE artist = 'Rob Alexander';" }	card_games
SELECT DISTINCT types FROM cards WHERE availability = 'arena';	card_games
SELECT c.setCode FROM cards AS c JOIN foreignNames AS fn ON c.uuid = fn.uuid WHERE fn.language = 'Spanish';	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE frameEffects = 'legendary';	card_games
SELECT CAST(SUM(CASE WHEN isStorylight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN isStorylight = 1 THEN 1 ELSE 0 END) AS percentage, GROUP_CONCAT(id) AS ids FROM cards WHERE isStorylight = 1;	card_games
SELECT COUNT(c.name) AS total_cards, (SELECT COUNT(*) FROM json_each(cards.foreignNames) WHERE json_extract(json_each.value, '$.language') = 'Spanish') * 100 / COUNT(c.name) AS percentage_spanish_cards, c.name FROM cards AS c GROUP BY c.name HAVING json_extract(json_each.value, '$.language') = 'Spanish';	card_games
SELECT T2.name FROM sets AS T1 JOIN languages AS T2 ON T1.setCode = T2.setCode WHERE T1.baseSetSize = 309;	card_games
SELECT COUNT(*) FROM sets JOIN languages ON sets.code = languages.setCode WHERE sets.block = 'Commander' AND languages.language = 'Portuguese (Brasil)'	card_games
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'Legal';	card_games
SELECT DISTINCT C.subTypes, C.superTypes FROM `cards` AS C JOIN `foreignData` AS FD ON C.uuid = FD.uuid WHERE FD.language = 'German' AND C.subTypes IS NOT NULL AND C.superTypes IS NOT NULL;	card_games
SELECT COUNT(*) FROM card WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'	card_games
SELECT COUNT(*) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rulings_text LIKE '%This is a triggered mana ability.%' AND c.side IS NULL AND l.format = 'premodern' AND l.status = 'Legal';	card_games
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND c.availability = 'paper' AND l.format = 'pauper' AND l.status = 'Legal'	card_games
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation'	card_games
SELECT f.name FROM foreignNames AS f JOIN cards AS c ON f.uuid = c.uuid WHERE f.language = 'French' AND c.type = 'Creature' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson'	card_games
SELECT COUNT(DISTINCT c.name) FROM cards AS c JOIN printings AS p ON c.uuid = p.card_uuid JOIN rulings AS r ON c.uuid = r.card_uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';	card_games
SELECT s.language FROM `sets` AS s JOIN `set_types` AS st ON s.type = st.type WHERE s.baseSetSize = 180 AND st.setName = 'Expansion' AND s.block = 'Ravnica'	card_games
SELECT CAST(SUM(CASE WHEN c.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id) FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'commander' AND l.status = 'Legal';	card_games
SELECT CAST(SUM(CASE WHEN language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM (SELECT * FROM cards WHERE power IS NULL OR power = '*') WHERE uuid IN (SELECT uuid FROM card_details WHERE language = 'French')	card_games
SELECT CAST(COUNT(CASE WHEN language = 'Japanese' AND type = 'expansion' THEN 1 END) AS REAL) * 100 / COUNT(*) FROM sets WHERE language = 'Japanese';	card_games
SELECT DISTINCT T2.kind FROM cards AS T1 JOIN printings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Daren Bader'	card_games
{}	card_games
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;	card_games
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND json_extract(promoTypes, '$[*]'@'arenaleague') IS NOT NULL ORDER BY name LIMIT 3;	card_games
SELECT * FROM cards WHERE multiverse_ids LIKE '%149934%'	card_games
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;	card_games
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards WHERE layout = 'normal';	card_games
SELECT c.cardNumber FROM `cards` AS c JOIN `subTypes` AS st ON c.uuid = st.uuid WHERE c.side IS NULL AND (st.subType = 'Angel' OR st.subType = 'Wizard') GROUP BY c.cardNumber HAVING COUNT(DISTINCT st.subType) = 2	card_games
SELECT setName FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY setName ASC LIMIT 3;	card_games
SELECT languages.name FROM sets JOIN languages ON sets.setCode = languages.code WHERE sets.mcmName = 'Archenemy' AND sets.setCode = 'ARC';	card_games
SELECT name, foreignNames FROM sets WHERE id = 5;	card_games
SELECT language, expansion_type FROM sets WHERE id = 206	card_games
SELECT s.set_name, s.code FROM sets AS s JOIN languages AS l ON s.languages = l.uuid WHERE l.name = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.set_name LIMIT 2;	card_games
SELECT set_id FROM sets WHERE is_foreign_only = 1 AND is_foil_only = 1 AND language = 'Japanese';	card_games
SELECT * FROM sets WHERE language = 'Russian' ORDER BY baseSetSize DESC LIMIT 1;	card_games
SELECT CAST(COUNT(CASE WHEN language = 'Chinese Simplified' AND isOnlineOnly = 1 THEN 1 END) AS REAL) * 100 / COUNT(*) FROM cards;	card_games
SELECT COUNT(setCode) FROM sets WHERE language = 'Japanese' AND (mtgoCode IS NULL OR mtgoCode = '')	card_games
SELECT uuid FROM cards WHERE borderColor = 'black';	card_games
SELECT uuid FROM cards WHERE frameEffects = 'extendedart';	card_games
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;	card_games
SELECT s.language FROM sets AS s JOIN cards AS c ON s.set_id = c.set_id WHERE s.set_id = '174'	card_games
SELECT setName FROM sets WHERE setCode = 'ALL';	card_games
;	card_games
;	card_games
SELECT baseSetSize, code FROM sets WHERE name = 'Masques' OR name = 'Mirage';	card_games
SELECT code FROM sets WHERE type = 'expansion';	card_games
SELECT c.foreignNames, c.types FROM cards AS c WHERE c.watermark = 'boros';	card_games
SELECT types, lang, flavor_text FROM cards WHERE watermark = 'colorpie';	card_games
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c WHERE c.setName = 'Abyssal Horror';	card_games
SELECT code FROM sets WHERE type = 'expansion' AND block = 'commander';	card_games
SELECT types FROM cards WHERE watermark = 'abzan';	card_games
SELECT type FROM cards WHERE watermark = 'azorius';	card_games
SELECT COUNT(uuid) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;	card_games
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3';	card_games
SELECT name FROM cards WHERE text IS NOT NULL AND text != ''	card_games
SELECT manaCost FROM cards WHERE name = 'Ancestor`s Chosen'	card_games
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL);	card_games
SELECT name FROM card WHERE variations IS NOT NULL;	card_games
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';	card_games
SELECT p.purchaseUrls FROM purchases AS p JOIN setComponents AS sc ON p.setId = sc.setId JOIN sets AS s ON sc.setCode = s.code WHERE s.promoTypes = 'bundle';	card_games
SELECT COUNT(DISTINCT artist) AS num_artists FROM cards WHERE border_color = 'black' AND availability LIKE '%arena,mtgo%'	card_games
SELECT MAX(convertedManaCost) FROM cards WHERE name IN ('Serra Angel', 'Shrine Keeper')	card_games
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';	card_games
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;	card_games
SELECT s.name FROM sets AS s JOIN cards AS c ON s.code = c.set_code JOIN translations AS t ON c.uuid = t.uuid WHERE t.language = 'Italian' AND c.name = 'Ancestor''s Chosen';	card_games
SELECT COUNT(*) FROM translations INNER JOIN sets ON translations.set = sets.code WHERE translations.name = 'Angel of Mercy';	card_games
SELECT c.name FROM cards AS c JOIN cardSets AS cs ON c.uuid = cs.cardUUID JOIN sets AS s ON cs.setID = s.setId WHERE s.translation = 'Hauptset Zehnte Edition';	card_games
SELECT EXISTS(SELECT * FROM cards WHERE name = 'Ancestor''s Chosen' AND language = 'Korean')	card_games
SELECT COUNT(*) FROM cards AS c JOIN sets AS s ON c.set_id = s.id JOIN card_faces AS cf ON c.uuid = cf.card_uuid WHERE s.translation = 'Hauptset Zehnte Edition' AND cf.artist = 'Adam Rex';	card_games
SELECT baseSetSize FROM sets WHERE translation = 'Hauptset Zehnte Edition'	card_games
SELECT t.translation FROM `sets` AS s JOIN `translations` AS t ON s.uuid = t.set_uuid WHERE s.name = 'Eighth Edition' AND t.language = 'Chinese Simplified'	card_games
SELECT c.name FROM cards AS c JOIN sets AS s ON c.sets_uuid = s.uuid WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;	card_games
SELECT s.releaseDate FROM sets AS s JOIN cards AS c ON s.uuid = c.set WHERE c.name = 'Ancestor''s Chosen'	card_games
SELECT type FROM sets WHERE name = 'Hauptset Zehnte Edition'	card_games
SELECT COUNT(*) FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL;	card_games
SELECT c.watermark FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.name = 'Adarkar Valkyrie';	card_games
SELECT COUNT(DISTINCT s.setCode) FROM `sets` AS s INNER JOIN `translations` AS t ON JSON_EXTRACT(t.languages, '$[*]') LIKE '%"Italian"%' WHERE s.baseSetSize < 100 AND s.uuid = t.uuid	card_games
SELECT COUNT(*) FROM cards JOIN sets ON cards.set = sets.code WHERE sets.name = 'Coldsnap' AND cards.borderColor = 'black';	card_games
SELECT c.name FROM (SELECT MAX(convertedManaCost) AS max_cmc FROM cards WHERE setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')) AS max_cmc_subquery JOIN cards c ON c.convertedManaCost = max_cmc_subquery.max_cmc AND c.setCode = (SELECT code FROM sets WHERE name = 'Coldsnap')	card_games
SELECT DISTINCT artist FROM cards WHERE set_name = 'Coldsnap' AND artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')	card_games
SELECT name FROM cards WHERE set_name = 'Coldsnap' AND number = 4;	card_games
SELECT COUNT(*) FROM cards AS T1 JOIN sets AS T2 ON T1.uuid = T2.uuid JOIN cardTypes AS T3 ON T1.type_uuid = T3.uuid WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL) AND T3.types NOT LIKE '%Creature%'	card_games
SELECT t.flavorText FROM translations AS t JOIN cards AS c ON t.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND t.language = 'Italian';	card_games
SELECT DISTINCT language FROM foreignData WHERE cardName = 'Ancestor''s Chosen' AND flavorText IS NOT NULL;	card_games
SELECT t.name FROM translations AS t JOIN cards AS c ON t.uuid = c.uuid WHERE c.name = 'Ancestor''s Chosen' AND t.language = 'German'	card_games
SELECT c.italianText FROM cards AS c JOIN set_cards AS sc ON c.uuid = sc.uuid WHERE sc.name = 'Coldsnap' AND c.language = 'Italian';	card_games
SELECT c.name FROM cards AS c INNER JOIN sets AS s ON c.set = s.code INNER JOIN languages AS l ON c.uuid = l.card_uuid WHERE s.name = 'Coldsnap' AND l.language = 'Italian' ORDER BY c.convertedManaCost DESC LIMIT 1;	card_games
SELECT r.created_at FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Reminisce'	card_games
SELECT CAST(SUM(CASE WHEN t2.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(t2.uuid) FROM sets AS t1 JOIN cards AS t2 ON t1.code = t2.set WHERE t1.name = 'Coldsnap';	card_games
SELECT CAST(SUM(CASE WHEN t1.cardKingdomFoilId IS NOT NULL AND t1.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(t1.uuid) FROM cards AS t1 WHERE t1.set = 'Coldsnap';	card_games
SELECT code FROM sets WHERE releaseDate = '2017-07-14';	card_games
SELECT keyruneCode FROM sets WHERE code = 'PKHC';	card_games
SELECT mcmId FROM sets WHERE code = 'SS2';	card_games
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';	card_games
SELECT type FROM sets WHERE name LIKE 'From the Vault: Lore';	card_games
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';	card_games
SELECT c.name, r.text, c.hasContentWarning FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.artist = 'Jim Pavelec';	card_games
SELECT s.releaseDate FROM sets AS s JOIN cards AS c ON s.code = c.set WHERE c.name = 'Evacuation'	card_games
SELECT baseSetSize FROM sets WHERE translation = 'Rinascita di Alara';	card_games
SELECT type FROM sets WHERE name = 'Huitième édition'	card_games
SELECT s.name_fr AS french_set_name FROM sets AS s JOIN cards AS c ON s.set = c.set_code JOIN translations AS t ON c.uuid = t.uuid WHERE t.name_en = 'Tendo Ice Bridge' AND t.language = 'French'	card_games
SELECT COUNT(*) FROM sets WHERE name = 'Tenth Edition' AND translations IS NOT NULL;	card_games
SELECT s.name AS SetName, t.value AS JapaneseName FROM (SELECT c.set_uuid, s.name FROM cards AS c JOIN sets AS s ON c.set_uuid = s.uuid WHERE c.name = 'Fellwar Stone') AS s JOIN translations AS t ON s.set_uuid = t.uuid AND t.language = 'Japanese'	card_games
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.set = 'Journey into Nyx Hero''s Path' ORDER BY c.cmc DESC LIMIT 1;	card_games
SELECT releaseDate FROM sets WHERE name = 'Ola de frío'	card_games
SELECT s.type FROM cards c JOIN sets s ON c.uuid = s.uuid WHERE c.name = 'Samite Pilgrim'	card_games
SELECT COUNT(*) FROM cards AS c JOIN sets AS s ON c.set_uuid = s.uuid WHERE s.name = 'World Championship Decks 2004' AND c.converted_mana_cost = 3;	card_games
SELECT t.translation FROM sets s JOIN translations t ON s.uuid = t.set_uuid WHERE s.name = 'Mirrodin' AND t.language = 'Chinese Simplified';	card_games
SELECT CAST(SUM(CASE WHEN isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets WHERE language = 'Japanese';	card_games
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) as percentage FROM cards WHERE language = 'Portuguese (Brazil)'	card_games
SELECT DISTINCT c.availability FROM cards AS c JOIN card_details AS cd ON c.uuid = cd.uuid WHERE cd.artist = 'Aleksi Briclot' AND cd.isTextless = 1;	card_games
SELECT s.id FROM sets AS s JOIN cards AS c ON s.setId = c.setId GROUP BY s.id ORDER BY s.baseSetSize DESC LIMIT 1;	card_games
SELECT c.artist FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.side IS NULL ORDER BY c.cmc DESC LIMIT 1;	card_games
SELECT c.frameEffects FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL GROUP BY c.frameEffects ORDER BY COUNT(*) DESC LIMIT 1;	card_games
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a';	card_games
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;	card_games
SELECT c.name, c.manaCost FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10;	card_games
SELECT C.uuid, C.name, MIN(S.originalReleaseDate), L.format FROM sets AS S JOIN cards AS C ON S.setCode = C.setCode WHERE C.rarity = 'mythic' GROUP BY C.uuid ORDER BY MIN(S.originalReleaseDate) ASC LIMIT 1; SELECT L.format FROM legalities AS L JOIN (SELECT C.uuid FROM sets AS S JOIN cards AS C ON S.setCode = C.setCode WHERE C.rarity = 'mythic' GROUP BY C.uuid ORDER BY MIN(S.originalReleaseDate) ASC LIMIT 1) AS CU ON L.uuid = CU.uuid WHERE L.status = 'Legal';	card_games
SELECT COUNT(*) FROM cards WHERE artist = 'Volkan Baǵa' AND language = 'French'	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types LIKE '%Enchantment%' AND cards.name = 'Abundance' AND legalities.status = 'Legal';	card_games
SELECT L.format AS play_format, C.name AS card_name FROM (SELECT format, COUNT(*) AS banned_count FROM legalities WHERE status = 'Banned' GROUP BY format ORDER BY banned_count DESC LIMIT 1) AS LF JOIN legalities L ON L.format = LF.format AND L.status = 'Banned' JOIN cards C ON C.uuid = L.uuid;	card_games
SELECT language FROM sets WHERE name = 'Battlebond';	card_games
SELECT L.format FROM (SELECT C.artist, COUNT(C.uuid) AS card_count FROM cards AS C JOIN legalities AS L ON C.uuid = L.uuid GROUP BY C.artist ORDER BY card_count ASC LIMIT 1) AS A JOIN cards AS C ON A.artist = C.artist JOIN legalities AS L ON C.uuid = L.uuid;	card_games
SELECT l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.frameVersion = '1997' AND (c.artist = 'D. Alexander Gregory' OR c.hasContentWarning = 1 OR c.setCode = 'wotc') AND l.format = 'legacy'	card_games
SELECT c.name, l.format FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.edhrecRank = 1 AND l.status = 'Banned';	card_games
SELECT CAST(COUNT(*) AS REAL) / 4 AS annual_average_sets, (SELECT language FROM sets GROUP BY language ORDER BY COUNT(language) DESC LIMIT 1) AS common_language FROM sets WHERE releaseDate BETWEEN '2012-01-01' AND '2015-12-31';	card_games
SELECT c.artist FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.borderColor = 'black' AND c.availability = 'arena';	card_games
SELECT c.uuid FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.format = 'oldschool' AND (l.status = 'banned' OR l.status = 'restricted');	card_games
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'Matthew D. Wilson' AND cards.availability = 'paper'	card_games
SELECT r.text FROM (SELECT c.*, a.name AS artist_name FROM cards AS c JOIN artists AS a ON c.artist_id = a.id) AS ca JOIN rulings AS r ON ca.uuid = r.uuid WHERE ca.artist_name = 'Kev Walker' ORDER BY r.date DESC;	card_games
SELECT DISTINCT c.name AS card_name, l.format AS format FROM cards AS c JOIN sets AS s ON c.set_uuid = s.uuid JOIN legalities AS l ON c.uuid = l.uuid WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal';	card_games
;	card_games
SELECT c.frameVersion, c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.artist = 'Allen Williams' AND l.status = 'Banned';	card_games
SELECT MAX(Reputation) AS max_reputation FROM Users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon')	codebase_community
SELECT DisplayName FROM Users WHERE strftime('%Y', CreationDate) = '2011';	codebase_community
SELECT COUNT(*) FROM Users WHERE LastAccessDate > '2014-09-01';	codebase_community
SELECT DisplayName FROM Users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Users WHERE UpVotes > 100 && DownVotes > 1;	codebase_community
SELECT COUNT(*) FROM Users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013';	codebase_community
SELECT COUNT(*) FROM Posts JOIN Users ON Posts.OwnerUserId = Users.AccountId WHERE Users.DisplayName = 'csgillespie';	codebase_community
SELECT p.Title FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.AccountId WHERE u.DisplayName = 'csgillespie';	codebase_community
SELECT U.DisplayName FROM Posts P JOIN Users U ON P.OwnerUserId = U.Id WHERE P.Title = 'Eliciting priors from experts';	codebase_community
SELECT P.Title FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.AccountId WHERE U.DisplayName = 'csgillespie' ORDER BY P.ViewCount DESC LIMIT 1;	codebase_community
SELECT U.DisplayName FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id WHERE P.FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts)	codebase_community
SELECT SUM(T1.CommentCount) AS TotalComments FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie';	codebase_community
SELECT p.AnswerCount FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.AccountId WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Posts AS P ON U.AccountId = P.LastEditorUserId WHERE P.Title = 'Examples for teaching: Correlation does not mean causation';	codebase_community
SELECT COUNT(*) FROM Posts JOIN Users ON Posts.OwnerUserId = Users.Id WHERE Users.DisplayName = 'csgillespie' AND Posts.ParentId IS NULL;	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Posts AS P ON U.Id = P.OwnerUserId WHERE P.ClosedDate IS NOT NULL;	codebase_community
SELECT COUNT(*) FROM Posts JOIN Users ON Posts.OwnerUserId = Users.AccountId WHERE Users.Age > 65 AND Posts.Score >= 20;	codebase_community
SELECT T2.Location FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts';	codebase_community
SELECT P.Body FROM Posts AS P JOIN PostTags AS PT ON P.Id = PT.PostId JOIN Tags AS T ON PT.TagId = T.Id WHERE T.TagName = 'bayesian';	codebase_community
SELECT p.Body FROM Posts AS p JOIN (SELECT t.ExcerptPostId FROM Tags AS t JOIN (SELECT TagId, COUNT(*) AS Count FROM PostTags GROUP BY TagId ORDER BY Count DESC LIMIT 1) AS pt ON t.Id = pt.TagId) AS te ON p.Id = te.ExcerptPostId;	codebase_community
SELECT COUNT(*) FROM Badges WHERE AccountId = (SELECT AccountId FROM Users WHERE DisplayName = 'csgillespie')	codebase_community
SELECT B.Name FROM Users AS U JOIN Badges AS B ON U.AccountId = B.UserId WHERE U.DisplayName = 'csgillespie';	codebase_community
SELECT COUNT(*) FROM Users JOIN Badges ON Users.AccountId = Badges.UserId WHERE Users.DisplayName = 'csgillespie' AND strftime('%Y', Badges.Date) = '2011';	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Badges AS B ON U.AccountId = B.UserId GROUP BY B.UserId ORDER BY COUNT(B.Id) DESC LIMIT 1;	codebase_community
SELECT AVG(T1.Score) FROM Posts AS T1 INNER JOIN Users AS T2 ON T1.OwnerUserId = T2.AccountId WHERE T2.DisplayName = 'csgillespie';	codebase_community
SELECT AVG(CAST(Badges AS REAL)) FROM Users WHERE Views > 200;	codebase_community
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.AccountId WHERE T1.Score > 5;	codebase_community
SELECT COUNT(*) FROM Votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
SELECT U.CreationDate FROM Users AS U JOIN Votes AS V ON U.AccountId = V.UserId GROUP BY U.CreationDate ORDER BY COUNT(V.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Badges WHERE Name = 'Revival';	codebase_community
SELECT P.Title FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId WHERE C.Score = (SELECT MAX(Score) FROM Comments)	codebase_community
SELECT COUNT(*) FROM Comments JOIN Posts ON Comments.PostId = Posts.Id WHERE Posts.Views = 1910;	codebase_community
SELECT T1.FavoriteCount FROM Posts AS T1 INNER JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = '3025' AND T2.CreationDate = '2014-04-23 20:29:39'	codebase_community
SELECT CommentText FROM Comments WHERE PostId = 107829 AND (SELECT CommentCount FROM Posts WHERE Id = 107829) = '1' LIMIT 1;	codebase_community
SELECT T1.ClosedDate IS NULL AS well_finished FROM Posts AS T1 JOIN Comments AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = '23853' AND T2.CreationDate = '2013-07-12 09:08:18.0';	codebase_community
SELECT U.Reputation FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.AccountId WHERE P.Id = '65041';	codebase_community
SELECT COUNT(*) FROM Posts AS p JOIN Users AS u ON p.OwnerUserId = u.AccountId WHERE u.DisplayName = 'Tiago Pasqualini';	codebase_community
SELECT U.DisplayName FROM Votes AS V JOIN Users AS U ON V.AccountId = U.Id WHERE V.Id = '6347'	codebase_community
SELECT UpVotes - DownVotes AS TotalVotes FROM Posts WHERE Title LIKE '%data visualization%'	codebase_community
SELECT B.Name FROM Badges AS B JOIN (SELECT U.Id AS UserId FROM Users AS U WHERE U.DisplayName = 'DatEpicCoderGuyWhoPrograms') AS T ON B.UserId = T.UserId;	codebase_community
SELECT CAST(COUNT(p.Id) AS REAL) / COUNT(v.Id) FROM (SELECT Id FROM posts WHERE OwnerUserId = '24') p, (SELECT Id FROM votes WHERE UserId = '24') v;	codebase_community
SELECT ViewCount FROM Posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';	codebase_community
SELECT Text FROM Comments WHERE Score = 17;	codebase_community
SELECT DisplayName FROM Users WHERE WebsiteUrl = 'http://stackoverflow.com'	codebase_community
SELECT B.BadgeName FROM Users AS U JOIN Badges AS B ON U.AccountId = B.UserId WHERE U.DisplayName = 'SilentGhost';	codebase_community
SELECT U.DisplayName FROM Comments AS C JOIN Users AS U ON C.UserId = U.Id WHERE C.Text = 'thank you user93!';	codebase_community
SELECT C.Text FROM Comments AS C JOIN Users AS U ON C.AccountId = U.Id WHERE U.DisplayName = 'A Lion';	codebase_community
SELECT U.DisplayName, U.Reputation FROM Posts P JOIN Users U ON P.OwnerUserId = U.AccountId WHERE P.Title = 'Understanding what Dassault iSight is doing?';	codebase_community
SELECT C.Text FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId WHERE P.Title = 'How does gentle boosting differ from AdaBoost?'	codebase_community
SELECT DISTINCT U.DisplayName FROM Users AS U JOIN Badges AS B ON U.AccountId = B.AccountId WHERE B.Name = 'Necromancer' LIMIT 10;	codebase_community
SELECT U.DisplayName FROM Posts AS P JOIN PostHistory AS PH ON P.Id = PH.PostId JOIN Users AS U ON PH.UserId = U.Id WHERE P.Title = 'Open source tools for visualizing multi-dimensional data' AND PH.PostHistoryTypeId = 5;	codebase_community
SELECT p.Title FROM Posts AS p JOIN Users AS u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';	codebase_community
SELECT SUM(p.Score) AS total_score, u.WebsiteUrl FROM Posts p JOIN Users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;	codebase_community
SELECT C.* FROM Posts AS P JOIN PostHistory AS PH ON P.Id = PH.PostId JOIN Comments AS C ON P.Id = C.PostId WHERE P.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND PH.PostHistoryTypeId = 4;	codebase_community
SELECT SUM(p.BountyAmount) FROM Posts p JOIN PostTags pt ON p.Id = pt.PostId WHERE p.Title LIKE '%data%' AND EXISTS(SELECT 1 FROM PostHistory ph WHERE ph.PostId = p.Id AND ph.PostHistoryTypeId = 8) GROUP BY p.Id	codebase_community
SELECT U.DisplayName FROM Posts AS P JOIN PostBounty AS PB ON P.Id = PB.PostId JOIN Users AS U ON P.OwnerUserId = U.AccountId WHERE PB.BountyAmount = 50 AND P.Title LIKE '%variance%'	codebase_community
SELECT P.Title, P.Text, AVG(P.ViewCount) AS AverageViewCount FROM Posts AS P JOIN PostTags AS PT ON P.Id = PT.PostId JOIN Tags AS T ON PT.TagId = T.Id WHERE T.TagName = 'humor' GROUP BY P.Id;	codebase_community
SELECT COUNT(UserId) FROM Comments WHERE UserId = 13;	codebase_community
SELECT AccountId FROM Users WHERE Reputation = (SELECT MAX(Reputation) FROM Users);	codebase_community
SELECT AccountId FROM Users ORDER BY Views ASC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011';	codebase_community
SELECT COUNT(DISTINCT u.Id) AS NumberOfUsers FROM Users u JOIN Badges b ON u.Id = b.UserId GROUP BY u.Id HAVING COUNT(b.Name) > 5;	codebase_community
SELECT COUNT(*) FROM (SELECT u.UserId FROM Users u JOIN Badges b ON u.Id = b.UserId WHERE u.Location LIKE '%New York%' AND b.Name IN ('Supporter', 'Teacher') GROUP BY u.UserId HAVING COUNT(DISTINCT b.Name) = 2)	codebase_community
SELECT U.Reputation FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id WHERE P.PostId = 1;	codebase_community
SELECT Users.UserId FROM Users JOIN Posts ON Users.UserId = Posts.OwnerUserId JOIN PostHistory ON Posts.Id = PostHistory.PostId WHERE Posts.ViewCount >= 1000 GROUP BY Users.UserId HAVING COUNT(PostHistory.PostId) = 1;	codebase_community
SELECT U.Badge FROM Users AS U JOIN Comments AS C ON U.Id = C.UserId GROUP BY C.UserId ORDER BY COUNT(C.Id) DESC LIMIT 1;	codebase_community
SELECT COUNT(B.UserId) FROM Badges B JOIN Users U ON B.UserId = U.Id WHERE B.Name = 'Teacher' AND U.Location LIKE '%India%'	codebase_community
SELECT (CAST(SUM(CASE WHEN strftime('%Y', b.Date) = '2010' AND b.Name = 'Student' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN strftime('%Y', b.Date) = '2010' THEN 1 ELSE 0 END) * 100 - CAST(SUM(CASE WHEN strftime('%Y', b.Date) = '2011' AND b.Name = 'Student' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN strftime('%Y', b.Date) = '2011' THEN 1 ELSE 0 END) * 100) AS percentage_difference FROM Badges b;	codebase_community
SELECT PostHistory.PostHistoryTypeID, COUNT(DISTINCT Comments.UserId) AS UniqueUsersCommented FROM PostHistory JOIN PostHistoryTypes ON PostHistory.PostHistoryTypeID = PostHistoryTypes.Id JOIN Comments ON Comments.PostId = PostHistory.PostId JOIN Users ON Comments.UserId = Users.Id WHERE PostHistory.PostId = 3720 GROUP BY PostHistory.PostHistoryTypeID;	codebase_community
SELECT PostId, RelatedPostId, ViewCount FROM Posts WHERE RelatedPostId = 61217 OR PostId = 61217;	codebase_community
SELECT Score, LinkTypeId FROM Posts WHERE Id = 395;	codebase_community
SELECT PostId, OwnerUserId FROM Posts WHERE Score > 60;	codebase_community
SELECT SUM(pf.FavouriteCount) FROM Posts p JOIN PostFeedback pf ON p.Id = pf.PostId WHERE p.OwnerUserId = 686 AND strftime('%Y', p.CreationDate) = '2011';	codebase_community
SELECT AVG(T2.UpVotes) AS avg_upvotes, AVG(T2.Age) AS avg_age FROM (SELECT UserId, COUNT(*) AS post_count FROM Posts GROUP BY UserId HAVING post_count > 10) AS T1 JOIN Users AS T2 ON T1.UserId = T2.Id;	codebase_community
SELECT COUNT(*) FROM Badges WHERE Name = 'Announcer';	codebase_community
SELECT Name FROM Badges WHERE Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT COUNT(*) FROM Comments WHERE Score > 60;	codebase_community
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:25:47.0'	codebase_community
SELECT COUNT(Id) FROM Posts WHERE Score = 10;	codebase_community
SELECT B.Name FROM (SELECT UserId, MAX(Reputation) AS MaxRep FROM Users) AS U JOIN Badges AS B ON U.UserId = B.UserId WHERE U.Reputation = B.Reputation;	codebase_community
SELECT U.Reputation FROM `Users` AS U JOIN `Badges` AS B ON U.AccountId = B.AccountId WHERE B.Date = '2010-07-19 19:39:08.0';	codebase_community
SELECT B.Name FROM Badges AS B JOIN Users AS U ON U.Id = B.UserId WHERE U.DisplayName = 'Pierre'	codebase_community
SELECT B.Date FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE U.Location LIKE '%Rochester, NY%'	codebase_community
SELECT CAST(SUM(CASE WHEN B.Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) / (SELECT COUNT(*) FROM Users) * 100 AS Percentage FROM Badges B JOIN Users U ON B.UserId = U.Id WHERE B.Name = 'Teacher';	codebase_community
SELECT CAST(COUNT(CASE WHEN T1.Age BETWEEN 13 AND 18 THEN T1.UserId END) AS REAL) * 100 / COUNT(T1.UserId) FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer';	codebase_community
SELECT C.Score FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId WHERE P.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT Text FROM Comments WHERE CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT U.Age FROM Users AS U JOIN Badges AS B ON U.Id = B.UserId WHERE U.Location = 'Vienna, Austria';	codebase_community
SELECT COUNT(*) FROM Users JOIN Badges ON Users.AccountId = Badges.AccountId WHERE Users.Age BETWEEN 19 AND 65 AND Badges.Name = 'Supporter';	codebase_community
SELECT U.Views FROM Users AS U JOIN Badges AS B ON U.AccountId = B.AccountId WHERE B.Date = '2010-07-19 19:39:08.0' GROUP BY U.Views	codebase_community
SELECT DISTINCT T2.Name FROM Users AS T1 JOIN Badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = (SELECT MIN(Reputation) FROM Users)	codebase_community
SELECT B.Name FROM (SELECT A.Id AS UserId FROM Users AS A WHERE A.DisplayName = 'Sharpie') AS U JOIN Badges AS B ON U.UserId = B.UserId;	codebase_community
SELECT COUNT(*) FROM Users JOIN Badges ON Users.AccountId = Badges.AccountId WHERE Users.Age > 65 AND Badges.Name = 'Supporter';	codebase_community
SELECT DisplayName FROM Users WHERE AccountId = 30;	codebase_community
SELECT COUNT(*) FROM Users WHERE Location = 'New York';	codebase_community
SELECT COUNT(*) FROM Votes WHERE STRFTIME('%Y', CreationDate) = '2010';	codebase_community
SELECT COUNT(AccountId) FROM Users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT DisplayName FROM Users ORDER BY Views DESC LIMIT 1;	codebase_community
SELECT CAST(COUNT(CASE WHEN strftime('%Y', CreationDate) = '2010' THEN Id ELSE NULL END) AS REAL) / COUNT(CASE WHEN strftime('%Y', CreationDate) = '2011' THEN Id ELSE NULL END) FROM votes;	codebase_community
SELECT T3.TagName FROM (SELECT * FROM Users WHERE DisplayName = 'John Salvatier') AS T1 JOIN Posts AS T2 ON T1.AccountId = T2.OwnerUserId JOIN PostTags AS T4 ON T2.Id = T4.PostId JOIN Tags AS T3 ON T4.TagId = T3.Id;	codebase_community
SELECT COUNT(*) FROM Posts JOIN Users ON Posts.OwnerUserId = Users.Id WHERE Users.DisplayName = 'Daniel Vassallo';	codebase_community
SELECT SUM(UpVotes) + SUM(DownVotes) AS TotalVotes FROM Users WHERE DisplayName = 'Harlan';	codebase_community
SELECT p.Id AS PostID FROM Posts p JOIN Users u ON p.OwnerUserId = u.AccountId WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;	codebase_community
SELECT MAX(SUM(Views)) AS max_views FROM (SELECT SUM(Views) AS total_views FROM Posts WHERE DisplayName = 'Harvey Motulsky' UNION ALL SELECT SUM(Views) AS total_views FROM Posts WHERE DisplayName = 'Noah Snyder')	codebase_community
SELECT COUNT(PostId) FROM Posts WHERE DisplayName = 'Matt Parker' AND (UpVotes + DownVotes) > 4;	codebase_community
SELECT COUNT(*) FROM Posts AS p JOIN Comments AS c ON p.Id = c.PostId WHERE p.OwnerDisplayName = 'Neil McGuigan' AND c.Score < 60;	codebase_community
SELECT T3.TagName FROM (SELECT * FROM Posts WHERE DisplayName = 'Mark Meckes' AND CommentCount = 0) AS T1 INNER JOIN PostTags AS T2 ON T1.Id = T2.PostId INNER JOIN Tags AS T3 ON T2.TagId = T3.Id;	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Badges AS B ON U.AccountId = B.AccountId WHERE B.Name = 'Organizer';	codebase_community
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 INNER JOIN PostTags AS T2 ON T1.Id = T2.PostId INNER JOIN Tags AS T3 ON T2.TagId = T3.Id INNER JOIN Users AS T4 ON T1.OwnerUserId = T4.AccountId WHERE T4.DisplayName = 'Community'	codebase_community
SELECT (SELECT SUM(Views) FROM Posts WHERE DisplayName = 'Mornington') - (SELECT SUM(Views) FROM Posts WHERE DisplayName = 'Amos') AS ViewCountDifference;	codebase_community
SELECT COUNT(*) FROM Badges WHERE Name = 'Commentator' AND strftime('%Y', Date) = '2014';	codebase_community
SELECT COUNT(*) FROM Posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';	codebase_community
SELECT DisplayName, Age FROM Users WHERE Views = (SELECT MAX(Views) FROM Users);	codebase_community
SELECT ph.CreationDate AS LastEditDate, ph.UserId AS LastEditUserId FROM Posts p JOIN PostHistory ph ON p.Id = ph.PostId JOIN PostHistoryTypes pht ON ph.HistoryTypeId = pht.Id WHERE p.Title = 'Detecting a given face in a database of facial images' AND pht.Name = 'Edit' ORDER BY ph.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Comments WHERE UserId = 13 AND Score < 60;	codebase_community
SELECT P.Title, U.DisplayName FROM Comments AS C JOIN Posts AS P ON C.PostId = P.Id JOIN Users AS U ON C.UserId = U.Id WHERE C.Score > 60;	codebase_community
SELECT B.Name FROM Users AS U JOIN Badges AS B ON U.AccountId = B.AccountId WHERE strftime('%Y', B.Date) = '2011' AND U.Location LIKE '%North Pole%'	codebase_community
SELECT U.DisplayName, U.WebsiteUrl FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id WHERE P.FavoriteCount > 150;	codebase_community
SELECT PH.PostHistoryTypeId, PH.CreationDate, COUNT(*) AS EditCount FROM PostHistory AS PH JOIN Posts AS P ON PH.PostId = P.Id WHERE P.Title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY PH.PostHistoryTypeId, PH.CreationDate ORDER BY PH.CreationDate DESC LIMIT 1;	codebase_community
SELECT U.LastAccessDate, U.Location FROM Users AS U JOIN Badges AS B ON U.AccountId = B.AccountId WHERE B.Name = 'Outliers';	codebase_community
SELECT p.Title FROM Posts AS p JOIN PostHistory AS ph ON p.Id = ph.PostId WHERE ph.PostHistoryTypeId = 3 AND ph.Text LIKE '%How to tell if something happened in a data set which monitors a value over time%'	codebase_community
SELECT P.PostId, B.BadgeName FROM Posts AS P JOIN PostHistory AS PH ON P.PostId = PH.PostId JOIN Badges AS B ON P.AccountId = B.UserId WHERE P.UserDisplayName = 'Samuel' AND strftime('%Y', P.CreationDate) = '2013' AND strftime('%Y', B.Date) = '2013';	codebase_community
SELECT U.DisplayName FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id ORDER BY P.ViewCount DESC LIMIT 1;	codebase_community
SELECT U.DisplayName, U.Location FROM Users AS U JOIN Posts AS P ON U.Id = P.OwnerUserId JOIN PostTags AS PT ON P.Id = PT.PostId WHERE PT.TagName = 'hypothesis-testing';	codebase_community
SELECT P2.Title, PL.LinkTypeId FROM Posts AS P1 JOIN PostLinks AS PL ON P1.Id = PL.PostId JOIN Posts AS P2 ON P2.Id = PL.RelatedPostId WHERE P1.Title = 'What are principal component scores?';	codebase_community
SELECT U.DisplayName FROM Posts P JOIN Users U ON P.AccountId = U.Id WHERE P.ParentId IS NOT NULL ORDER BY P.Score DESC LIMIT 1;	codebase_community
SELECT U.DisplayName, U.WebsiteUrl FROM Votes AS V JOIN Posts AS P ON V.PostId = P.Id JOIN Users AS U ON P.OwnerUserId = U.Id WHERE V.VoteTypeId = 8 GROUP BY U.Id ORDER BY MAX(V.BountyAmount) DESC LIMIT 1;	codebase_community
SELECT Title FROM Posts ORDER BY ViewCount DESC LIMIT 5;	codebase_community
SELECT COUNT(*) FROM Tags WHERE Count BETWEEN 5000 AND 7000;	codebase_community
SELECT OwnerUserId FROM Posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM Posts);	codebase_community
SELECT U.Age FROM Users AS U WHERE U.Reputation = (SELECT MAX(Reputation) FROM Users);	codebase_community
SELECT COUNT(*) FROM Posts AS p JOIN Votes AS v ON p.Id = v.PostId WHERE YEAR(p.CreationDate) = 2011 AND p.BountyAmount = 50;	codebase_community
SELECT AccountId FROM Users WHERE Age = (SELECT MIN(Age) FROM Users)	codebase_community
SELECT SUM(Score) FROM Posts WHERE LastActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(Id) AS REAL) / 12 FROM Posts WHERE STRFTIME('%Y', CreationDate) = '2010' AND AnswerCount <= 2;	codebase_community
SELECT P.Id FROM Posts AS P JOIN Votes AS V ON P.Id = V.PostId WHERE V.UserId = 1465 ORDER BY P.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT Title FROM Posts ORDER BY CreationDate ASC LIMIT 1;	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Badges AS B ON U.AccountId = B.UserId GROUP BY U.DisplayName ORDER BY COUNT(B.Name) DESC LIMIT 1;	codebase_community
SELECT MIN(V.CreationDate) AS FirstVote FROM Users U JOIN Votes V ON U.AccountId = V.UserId WHERE U.DisplayName = 'chl';	codebase_community
SELECT MIN(p.CreationDate) AS FirstPostDate FROM Posts p JOIN Users u ON p.OwnerUserId = u.AccountId WHERE u.Age = (SELECT MIN(Age) FROM Users)	codebase_community
SELECT U.DisplayName FROM Badges AS B JOIN Users AS U ON B.AccountId = U.Id WHERE B.Name = 'Autobiographer' AND EXISTS(SELECT * FROM Posts AS P WHERE P.OwnerUserId = U.Id AND P.PostTypeId = 2) ORDER BY B.Date ASC LIMIT 1	codebase_community
SELECT COUNT(*) FROM Users JOIN Posts ON Users.AccountId = Posts.OwnerUserId WHERE Users.Location LIKE '%United Kingdom%' AND Posts.FavoriteCount >= 4;	codebase_community
SELECT AVG(T2.PostId) FROM Users AS T1 JOIN Votes AS T2 ON T1.AccountId = T2.VoterAccountId WHERE T1.Age = (SELECT MAX(Age) FROM Users);	codebase_community
SELECT DisplayName FROM Users WHERE Reputation = (SELECT MAX(Reputation) FROM Users);	codebase_community
SELECT * FROM Users WHERE Reputation > 2000 AND Views > 1000;	codebase_community
SELECT DisplayName FROM Users WHERE Age BETWEEN 19 AND 65;	codebase_community
SELECT COUNT(*) FROM Posts WHERE OwnerUserId IN (SELECT Id FROM Users WHERE DisplayName = 'Jay Stevens') AND strftime('%Y', CreationDate) = '2010';	codebase_community
SELECT P.Id, P.Title FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.Id WHERE U.DisplayName = 'Harvey Motulsky' ORDER BY P.ViewCount DESC LIMIT 1;	codebase_community
SELECT Id, Title FROM Posts WHERE Score = (SELECT MAX(Score) FROM Posts);	codebase_community
SELECT AVG(P.Score) AS AverageScore FROM Posts P JOIN Users U ON P.OwnerUserId = U.AccountId WHERE U.DisplayName = 'Stephen Turner';	codebase_community
SELECT U.DisplayName FROM Users AS U JOIN Posts AS P ON U.AccountId = P.OwnerUserId WHERE P.ViewCount > 20000 AND strftime('%Y', P.CreationDate) = '2011';	codebase_community
SELECT P.PostId, U.DisplayName FROM Posts AS P INNER JOIN Users AS U ON P.OwnerUserId = U.Id WHERE strftime('%Y', P.CreationDate) = '2010' ORDER BY P.FavoriteCount DESC LIMIT 1;	codebase_community
SELECT CAST(SUM(CASE WHEN strftime('%Y', P.CreationDate) = '2011' AND U.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN strftime('%Y', P.CreationDate) = '2011' THEN 1 ELSE 0 END) FROM Posts AS P JOIN Users AS U ON P.OwnerUserId = U.AccountId;	codebase_community
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Users WHERE Age IS NOT NULL) FROM Users WHERE Age BETWEEN 13 AND 18;	codebase_community
SELECT P.ViewCount, U.DisplayName FROM Posts AS P JOIN PostHistory AS PH ON P.Id = PH.PostId JOIN Users AS U ON P.OwnerUserId = U.Id WHERE PH.Text = 'Computer Game Datasets' ORDER BY PH.CreationDate DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM Posts);	codebase_community
SELECT COUNT(*) FROM Comments WHERE PostId = (SELECT Id FROM Posts WHERE Score = (SELECT MAX(Score) FROM Posts))	codebase_community
SELECT COUNT(*) FROM Posts WHERE ViewCount > 35000 AND CommentCount = 0;	codebase_community
SELECT U.DisplayName, U.Location FROM Posts P JOIN Users U ON P.OwnerUserId = U.Id WHERE P.Id = 183 ORDER BY P.LastEditDate DESC LIMIT 1;	codebase_community
SELECT B.Name FROM (SELECT U.AccountId FROM Users AS U WHERE U.DisplayName = 'Emmett') AS A JOIN Badges AS B ON A.AccountId = B.UserId ORDER BY B.Date DESC LIMIT 1;	codebase_community
SELECT COUNT(*) FROM Users WHERE Age >= 19 AND Age <= 65 AND UpVotes > 5000;	codebase_community
SELECT strftime('%s', sb.Date) - strftime('%s', u.CreationDate) AS time_difference FROM stats_badges sb JOIN users u ON sb.AccountId = u.AccountId WHERE u.DisplayName = 'Zolomon';	codebase_community
SELECT COUNT(p.Id) AS num_posts, COUNT(c.Id) AS num_comments FROM Users u JOIN Posts p ON u.AccountId = p.OwnerUserId JOIN Comments c ON u.AccountId = c.UserId WHERE u.CreationDate = (SELECT MAX(CreationDate) FROM Users);	codebase_community
SELECT C.Text, U.DisplayName FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId JOIN Users AS U ON C.UserId = U.Id WHERE P.Title = 'Analysing wind data with R' ORDER BY C.CreationDate DESC LIMIT 10;	codebase_community
SELECT COUNT(Id) FROM Badges WHERE Name = 'Citizen Patrol';	codebase_community
SELECT COUNT(*) FROM Posts AS p JOIN PostTags AS pt ON p.Id = pt.PostId JOIN Tags AS t ON t.Id = pt.TagId WHERE t.TagName = 'careers';	codebase_community
SELECT Reputation, Views FROM Users WHERE DisplayName = 'Jarrod Dixon';	codebase_community
SELECT COUNT(*) AS num_comments FROM Comments WHERE PostId IN (SELECT Id FROM Posts WHERE Title = 'Clustering 1D data'); SELECT COUNT(*) AS num_answers FROM Posts WHERE ParentId IN (SELECT Id FROM Posts WHERE Title = 'Clustering 1D data') AND PostTypeId = 2;	codebase_community
SELECT CreationDate FROM Users WHERE DisplayName = 'IrishStat';	codebase_community
SELECT COUNT(*) FROM Bounties WHERE BountyAmount > 30;	codebase_community
WITH InfluentialUser AS (SELECT AccountId FROM Posts JOIN Users ON Posts.OwnerUserId = Users.Id ORDER BY Reputation DESC LIMIT 1), HighScorePosts AS (SELECT COUNT(*) AS high_score_count FROM Posts WHERE Score > 50 AND OwnerUserId IN (SELECT AccountId FROM InfluentialUser)), TotalPosts AS (SELECT COUNT(*) AS total_post_count FROM Posts WHERE OwnerUserId IN (SELECT AccountId FROM InfluentialUser)) SELECT CAST(high_score_count AS REAL) * 100 / total_post_count AS percentage FROM HighScorePosts, TotalPosts;	codebase_community
SELECT COUNT(*) FROM Posts WHERE Score < 20;	codebase_community
SELECT * FROM Tags WHERE Id < 15 AND Count <= 20;	codebase_community
SELECT ExcerptPostID, WikiPostID FROM Tags WHERE TagName = 'sample';	codebase_community
SELECT U.Reputation, U.UpVotes FROM Users AS U JOIN Comments AS C ON U.Id = C.UserId WHERE C.Text = 'fine, you win :);'	codebase_community
SELECT C.Text FROM Comments AS C JOIN Posts AS P ON C.PostId = P.Id WHERE P.Title LIKE '%linear regression%'	codebase_community
SELECT C.Text FROM Posts AS P JOIN Comments AS C ON P.Id = C.PostId WHERE P.ViewCount BETWEEN 100 AND 150 ORDER BY C.Score DESC LIMIT 1;	codebase_community
SELECT U.CreationDate, U.Age FROM Users AS U JOIN Comments AS C ON U.AccountId = C.UserId WHERE C.Text LIKE '%http://%'	codebase_community
SELECT COUNT(*) FROM Comments INNER JOIN Posts ON Comments.PostId = Posts.Id WHERE Comments.Score = 0 AND Posts.ViewCount < 5;	codebase_community
SELECT COUNT(*) FROM Posts JOIN Comments ON Posts.Id = Comments.PostId WHERE Posts.CommentCount = 1 AND Comments.Score = 0;	codebase_community
SELECT COUNT(*) FROM Comments AS C INNER JOIN Users AS U ON C.AccountId = U.AccountId WHERE C.Score = 0 AND U.Age = 40;	codebase_community
SELECT C.Id AS CommentId, C.PostId, C.Text FROM Posts P JOIN Comments C ON P.Id = C.PostId JOIN PostHistory PH ON P.Id = PH.PostId WHERE P.Title = 'Group differences on a five point Likert item' AND PH.PostHistoryTypeId != 12 AND PH.PostHistoryTypeId != 13;	codebase_community
SELECT U.UpVotes FROM Comments AS C JOIN Users AS U ON C.AccountId = U.Id WHERE C.Text = 'R is also lazy evaluated.'	codebase_community
SELECT C.Text FROM Comments AS C JOIN Users AS U ON C.AccountId = U.Id WHERE U.DisplayName = 'Harvey Motulsky';	codebase_community
SELECT DISTINCT U.DisplayName FROM Comments AS C JOIN Users AS U ON C.UserId = U.AccountId WHERE C.Score BETWEEN 1 AND 5 AND U.DownVotes = 0;	codebase_community
SELECT CAST(SUM(CASE WHEN UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Comments WHERE Score BETWEEN 5 AND 10;	codebase_community
SELECT T3.power_name FROM superhero AS T1 JOIN superhero_power AS T2 ON T1.id = T2.superhero_id JOIN power AS T3 ON T3.id = T2.power_id WHERE T1.superhero_name = '3-D Man';	superhero
SELECT COUNT(*) FROM superhero JOIN superhero_power ON superhero.id = superhero_power.superhero_id JOIN power ON power.id = superhero_power.power_id WHERE power.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN superpower ON superhero.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;	superhero
SELECT s.full_name FROM superhero AS s JOIN (SELECT superhero_id, COUNT(*) AS superpowers_count FROM superpower GROUP BY superhero_id) AS sp ON s.id = sp.superhero_id WHERE sp.superpowers_count > 15	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour_name = 'Blue';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id JOIN superpower ON superhero.id = superpower.superhero_id WHERE colour.colour_name = 'Blue' AND superpower.power_name = 'Agility';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN colour AS ec ON s.eye_colour_id = ec.id JOIN colour AS hc ON s.hair_colour_id = hc.id WHERE ec.colour = 'Blue' AND hc.colour = 'Blond';	superhero
SELECT COUNT(*) FROM superhero JOIN publishers ON superhero.publisher_id = publishers.id WHERE publishers.publisher_name = 'Marvel Comics';	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' ORDER BY T1.height_cm DESC;	superhero
SELECT p.name AS publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';	superhero
SELECT COUNT(s.id) AS superhero_count, ec.eye_colour FROM superhero s JOIN publisher p ON s.publisher_id = p.id JOIN eye_colour ec ON s.eye_colour_id = ec.id WHERE p.publisher_name = 'Marvel Comics' GROUP BY s.eye_colour_id ORDER BY superhero_count DESC;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT s.superhero_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id JOIN superhero_power AS sp ON s.id = sp.superhero_id JOIN power AS pw ON sp.power_id = pw.id WHERE p.publisher_name = 'Marvel Comics' AND pw.power_name = 'Super Strength';	superhero
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics';	superhero
SELECT p.publisher_name FROM publisher AS p JOIN superhero AS s ON p.id = s.publisher_id WHERE s.id IN (SELECT superhero_id FROM superpower WHERE attribute_name = 'Speed' ORDER BY attribute_value ASC LIMIT 1)	superhero
SELECT COUNT(*) FROM superhero JOIN eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE eye_colour.colour = 'Gold' AND publisher.name = 'Marvel Comics';	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II'	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';	superhero
;	superhero
SELECT T2.race_name FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN attribute AS a ON s.id = a.superhero_id WHERE a.attribute_name = 'Durability' AND a.attribute_value < 50;	superhero
SELECT s.superhero_name FROM superhero AS s JOIN power AS p ON s.id = p.superhero_id WHERE p.power_name = 'Death Touch'	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN superhero_attribute ON superhero.id = superhero_attribute.superhero_id JOIN attribute ON superhero_attribute.attribute_id = attribute.id WHERE gender.name = 'Female' AND attribute.name = 'Strength' AND superhero_attribute.value = 100;	superhero
SELECT s.superhero_name FROM superhero AS s JOIN superhero_superpower AS ss ON s.id = ss.superhero_id GROUP BY s.superhero_name ORDER BY COUNT(ss.superpower_id) DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = (SELECT id FROM race WHERE name = 'Vampire');	superhero
SELECT CAST(SUM(CASE WHEN a.alignment_name = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) AS percentage, SUM(CASE WHEN a.alignment_name = 'Bad' AND p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS marvel_count FROM superhero s JOIN alignment a ON s.alignment_id = a.id JOIN publisher p ON s.publisher_id = p.id;	superhero
SELECT (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics') - (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics')	superhero
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';	superhero
SELECT AVG(height_cm) AS avg_height, AVG(weight_kg) AS avg_weight FROM superhero WHERE height_cm > 0 AND weight_kg > 0;	superhero
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;	superhero
SELECT colour.name FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75;	superhero
;	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female'	superhero
SELECT p.power_name FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN superhero_power sp ON s.id = sp.superhero_id JOIN power p ON sp.power_id = p.id WHERE g.gender = 'Male' LIMIT 5;	superhero
SELECT superhero_name FROM superhero WHERE race_id = (SELECT id FROM races WHERE race = 'Alien');	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN eye_colour_reference_table AS T2 ON T1.eye_colour_id = T2.id WHERE T1.height_cm BETWEEN 170 AND 190 AND T2.colour = 'No Colour';	superhero
SELECT hp.power_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id WHERE s.id = 56;	superhero
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race_name = 'Demi-God' LIMIT 5;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = (SELECT id FROM alignment WHERE alignment_name = 'Bad')	superhero
SELECT race_id FROM superhero WHERE weight_kg = 169;	superhero
SELECT c.colour_name FROM superhero s JOIN colour c ON s.hair_colour_id = c.id WHERE s.height_cm = 185 AND s.race_id IN (SELECT id FROM race WHERE race_name = 'human');	superhero
SELECT c.colour_name FROM (SELECT * FROM superhero WHERE weight_kg = (SELECT MAX(weight_kg) FROM superhero)) AS a JOIN colour AS c ON a.eye_colour_id = c.id;	superhero
SELECT CAST(SUM(CASE WHEN publisher_id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superheroes WHERE height_cm BETWEEN 150 AND 180;	superhero
SELECT T1.superhero_name FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)	superhero
SELECT you_name, COUNT(*) as power_count FROM superhero GROUP BY you_name ORDER BY power_count DESC LIMIT 1;	superhero
SELECT * FROM superhero WHERE superhero_name = 'Abomination';	superhero
SELECT power_name FROM superpower WHERE hero_id = 1;	superhero
SELECT COUNT(*) FROM superhero JOIN power ON superhero.id = power.superhero_id WHERE power.power_name = 'stealth';	superhero
SELECT s.full_name FROM superhero AS s JOIN attributes AS a ON s.id = a.superhero_id WHERE a.attribute_name = 'strength' ORDER BY a.attribute_value DESC LIMIT 1;	superhero
SELECT CAST(COUNT(*) FILTER (WHERE skin_colour_id = 1) AS REAL) / (SELECT COUNT(*) FROM superhero) AS average_no_skin_colour FROM superhero;	superhero
SELECT COUNT(*) FROM superhero JOIN publishers ON superhero.publisher_id = publishers.id WHERE publishers.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN attribute_value AS av ON s.id = av.superhero_id JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Dark Horse Comics' AND av.attribute_name = 'durability' ORDER BY av.attribute_value DESC LIMIT 1;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN superpower AS p ON s.id = p.superhero_id WHERE p.power_name = 'Flight';	superhero
SELECT s.eye_colour_id, s.hair_colour_id, s.skin_colour_id FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id JOIN publisher AS p ON s.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';	superhero
SELECT s.superhero_name, p.publisher_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id;	superhero
SELECT race_id FROM superhero WHERE superhero_name = 'A-Bomb';	superhero
SELECT CAST(SUM(CASE WHEN sc.colour_name = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN skin_colour sc ON s.skin_colour_id = sc.id WHERE g.gender_name = 'Female';	superhero
SELECT superhero.superhero_name, superhero.race_id FROM superhero WHERE superhero.full_name = 'Charles Chandler';	superhero
SELECT gender_id FROM superhero WHERE superhero_name = 'Agent 13';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN superpower AS sp ON s.id = sp.superhero_id WHERE sp.power_name = 'Adaptation';	superhero
SELECT COUNT(*) FROM superhero WHERE superhero_name = 'Amazo';	superhero
SELECT p.power_name FROM superpower AS p JOIN superhero_power AS sp ON p.id = sp.superpower_id JOIN superhero AS s ON sp.superhero_id = s.id WHERE s.full_name = 'Hunter Zolomon';	superhero
SELECT s.height_cm FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c1 ON s.eye_colour_id = c1.id JOIN colour AS c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Black' AND c2.colour = 'Black';	superhero
SELECT c1.colour FROM superhero AS s JOIN colour AS c1 ON s.eye_colour_id = c1.id JOIN colour AS c2 ON s.skin_colour_id = c2.id WHERE c2.colour = 'Gold';	superhero
SELECT s.full_name FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.name = 'Vampire';	superhero
SELECT superhero_name FROM superhero WHERE alignment_id = (SELECT id FROM alignments WHERE name = 'Neutral');	superhero
;	superhero
SELECT r.race_name, a.alignment_name FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';	superhero
SELECT CAST(COUNT(*) FILTER (WHERE T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics') AS REAL) * 100 / COUNT(*) FILTER (WHERE T3.publisher_name = 'Marvel Comics') FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id;	superhero
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race_name = 'Alien';	superhero
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler')	superhero
SELECT AVG(height_cm) AS average_height FROM superhero WHERE height_cm > 0;	superhero
SELECT s.superhero_name, s.full_name FROM superhero AS s WHERE s.superhero_name = 'Abomination';	superhero
SELECT COUNT(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;	superhero
SELECT s.superhero_name FROM superhero AS s JOIN superpower AS sp ON s.id = sp.hero_id WHERE sp.power_name LIKE '%Speed%' ORDER BY sp.power_level DESC LIMIT 1;	superhero
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3;	superhero
SELECT * FROM superhero WHERE superhero_name = '3-D Man';	superhero
SELECT s.superhero_name FROM superhero AS s INNER JOIN color AS c1 ON s.eye_colour_id = c1.id INNER JOIN color AS c2 ON s.hair_colour_id = c2.id WHERE c1.color = 'Blue' AND c2.color = 'Brown';	superhero
SELECT T2.publisher_name FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')	superhero
SELECT COUNT(id) FROM superhero WHERE publisher_id = 1 OR publisher_id IS NULL;	superhero
SELECT CAST(SUM(CASE WHEN T2.color = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN color AS T2 ON T1.eye_colour_id = T2.id WHERE T2.id = 7;	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS ratio FROM superhero;	superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;	superhero
SELECT id FROM superpower WHERE power_name = 'cryokinesis';	superhero
SELECT superhero_name FROM superhero WHERE id = 294;	superhero
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';	superhero
SELECT p.power_name FROM powers AS p JOIN superhero_powers AS sp ON p.id = sp.power_id JOIN superhero AS s ON sp.superhero_id = s.id WHERE s.full_name = 'Helen Parr';	superhero
SELECT s.race_id FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE s.weight_kg = 108 AND s.height_cm = 188;	superhero
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.id = 38;	superhero
SELECT r.race_name FROM (SELECT s.id, s.height_cm, s.weight_kg, s.race_id FROM superhero AS s WHERE s.height_cm = (SELECT MAX(height_cm) FROM superhero) OR s.weight_kg = (SELECT MAX(weight_kg) FROM superhero)) AS max_attr JOIN race AS r ON max_attr.race_id = r.id LIMIT 1;	superhero
SELECT s.alignment_id, p.power_name FROM superhero AS s JOIN power AS p ON s.id = p.superhero_id WHERE s.superhero_name = 'Atom IV';	superhero
SELECT s.full_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;	superhero
SELECT AVG(height_cm) AS avg_height, AVG(weight_kg) AS avg_weight FROM superhero WHERE alignment_id = 3;	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.skin_colour_id = c.id JOIN attribute a ON s.id = a.superhero_id WHERE a.attribute_value = 100;	superhero
SELECT COUNT(*) FROM superhero WHERE gender_id = 2 AND alignment_id = 1;	superhero
SELECT superhero_name FROM superhero WHERE height_cm BETWEEN 75 AND 80 OR weight_kg BETWEEN 75 AND 80;	superhero
SELECT r.race FROM superhero s JOIN gender g ON s.gender_id = g.id JOIN colour c ON s.hair_colour_id = c.id JOIN race r ON s.race_id = r.id WHERE c.colour = 'blue' AND g.gender = 'male';	superhero
SELECT CAST(SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM superhero WHERE alignment_id = 2;	superhero
SELECT SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END) AS difference FROM superheroes AS T1 WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL;	superhero
SELECT weight_kg FROM superhero WHERE superhero_name = 'Hulk';	superhero
SELECT p.power_name FROM superhero s JOIN superpower sp ON s.id = sp.superhero_id JOIN power p ON sp.power_id = p.id WHERE s.superhero_name = 'Ajax';	superhero
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Green' AND superhero.alignment_id IN (SELECT id FROM alignment WHERE alignment = 'Bad');	superhero
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN publisher ON superhero.publisher_id = publisher.id WHERE gender.name = 'Female' AND publisher.name = 'Marvel Comics';	superhero
SELECT s.superhero_name FROM superhero AS s JOIN powers AS p ON s.superpower_id = p.id WHERE p.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;	superhero
SELECT s.gender_id FROM superhero AS s JOIN superpower AS sp ON s.id = sp.superhero_id WHERE sp.power_name = 'Phoenix Force';	superhero
SELECT superhero_name FROM superhero WHERE publisher_id = (SELECT id FROM publishers WHERE publisher_name = 'DC Comics') ORDER BY weight_kg DESC LIMIT 1;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T1.race_id != (SELECT id FROM race WHERE race_name = 'Human')	superhero
;	superhero
SELECT (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics') - (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics') AS difference	superhero
SELECT MIN(height_cm) AS min_height, MIN(weight_kg) AS min_weight FROM superhero WHERE superhero_name = 'Black Panther';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Abomination';	superhero
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);	superhero
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';	superhero
SELECT CAST(SUM(CASE WHEN T1.gender_id = (SELECT id FROM gender WHERE name = 'Female') THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.name = 'George Lucas'	superhero
SELECT CAST(SUM(CASE WHEN T3.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.publisher_name) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%';	superhero
SELECT id FROM superhero WHERE height_cm = (SELECT MIN(height_cm) FROM superhero WHERE height_cm > 0 AND height_cm IS NOT NULL) OR weight_kg = (SELECT MIN(weight_kg) FROM superhero WHERE weight_kg > 0 AND weight_kg IS NOT NULL);	superhero
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';	superhero
SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = 9;	superhero
SELECT * FROM superhero WHERE superhero_name = 'Aquababy';	superhero
SELECT weight_kg, race_id FROM superhero WHERE id = 40;	superhero
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment_name = 'Neutral'	superhero
SELECT s.id FROM superhero AS s INNER JOIN power AS p ON s.id = p.superhero_id WHERE p.power_name = 'Intelligence';	superhero
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';	superhero
SELECT p.power_name FROM power AS p JOIN superhero AS s ON p.superhero_id = s.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);	superhero
SELECT T1.driverRef FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.q1 IS NOT NULL AND T2.raceId = 20 ORDER BY T1.q1 DESC LIMIT 5;	formula_1
SELECT T3.surname FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 19 ORDER BY T1.q2 ASC LIMIT 1;	formula_1
SELECT DISTINCT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.location = 'Shanghai';	formula_1
SELECT T1.url FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Circuit de Barcelona-Catalunya'	formula_1
SELECT r.name FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';	formula_1
SELECT c.position FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuit_id JOIN results AS res ON r.raceId = res.race_id JOIN constructors AS con ON res.constructorId = con.constructorId WHERE con.name = 'Renault';	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2010 AND circuits.country NOT IN ('Asia', 'Europe')	formula_1
SELECT R.name FROM races AS R JOIN circuits AS C ON R.circuitId = C.circuitId WHERE C.country = 'Spain';	formula_1
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix'	formula_1
SELECT R.url FROM circuits AS C JOIN races AS R ON C.circuitId = R.circuitId WHERE C.circuitRef = 'sepang';	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Sepang International Circuit'	formula_1
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix'	formula_1
SELECT C.country FROM (SELECT Cr.circuitId, R.constructorId FROM races AS R JOIN results AS Res ON R.raceId = Res.raceId WHERE R.raceId = 24 AND Res.points = 1) AS RC JOIN circuits AS C ON RC.circuitId = C.circuitId JOIN constructors AS Co ON RC.constructorId = Co.constructorId	formula_1
SELECT q1 FROM qualifying WHERE raceId = 354 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna')	formula_1
SELECT T1.nationality FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T3.raceId = T2.raceId WHERE T2.time = '0:01:40' AND T2.raceId = 355 AND T3.name = 'Qualifying'	formula_1
SELECT T1.driverId FROM qualifying AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.q3 LIKE '1:54%' AND T1.raceId = 903	formula_1
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Bahrain Grand Prix' AND T2.year = 2007 AND T1.time IS NULL;	formula_1
SELECT s.url FROM seasons AS s JOIN races AS r ON s.year = r.year WHERE r.raceId = 901;	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29' AND results.time IS NOT NULL;	formula_1
SELECT T3.forename, T3.surname FROM results AS T1 JOIN races AS T2 ON T1.raceid = T2.raceid JOIN drivers AS T3 ON T1.driverid = T3.driverid WHERE T2.raceid = 592 AND T1.time IS NOT NULL ORDER BY T3.dob ASC LIMIT 1;	formula_1
SELECT T3.url FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.raceId = 161 AND T2.lapTime LIKE '01:27%'	formula_1
SELECT d.nationality FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN drivers AS d ON r.driverId = d.driverId WHERE ra.raceId = 933 ORDER BY r.fastestLapSpeed DESC LIMIT 1;	formula_1
SELECT c.lat, c.lng FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'Malaysian Grand Prix'	formula_1
SELECT c.url FROM constructors AS c JOIN constructorResults AS cr ON c.constructorId = cr.constructorId WHERE cr.raceId = 9 GROUP BY cr.constructorId ORDER BY cr.points DESC LIMIT 1;	formula_1
SELECT T2.q1 FROM drivers AS T1 JOIN qualifying AS T2 ON T1.driverid = T2.driverid WHERE T1.forename = 'Lucas' AND T1.surname = 'di Grassi' AND T2.raceid = 345;	formula_1
SELECT T4.nationality FROM (SELECT * FROM qualifying WHERE q2 = '0:01:15' AND raceId = 347) AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN results AS T3 ON T1.driverId = T3.driverId AND T1.raceId = T3.raceId JOIN drivers AS T4 ON T3.driverId = T4.driverId	formula_1
SELECT T1.driverRef FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 45 AND T1.q3 LIKE '01:33%'	formula_1
SELECT r.time FROM races AS r INNER JOIN results AS res ON r.raceId = res.raceId INNER JOIN drivers AS d ON res.driverId = d.driverId WHERE r.raceId = 743 AND d.name = 'Bruce McLaren';	formula_1
SELECT T3.name FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.year = 2006 AND T2.name = 'San Marino Grand Prix' AND T1.position = 2;	formula_1
SELECT s.url FROM seasons AS s JOIN races AS r ON s.seasonId = r.season WHERE r.raceId = 901;	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29' AND results.time IS NULL;	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.raceId = 872 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN (SELECT MIN(time) AS best_time, driverId FROM results WHERE raceId = 348) AS T2 ON T1.driverId = T2.driverId	formula_1
SELECT d.nationality FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)	formula_1
SELECT CAST((results1.fastestLapSpeed - results2.fastestLapSpeed) AS REAL) * 100 / results1.fastestLapSpeed AS percentage_difference FROM (SELECT * FROM results WHERE raceId = 853 AND driverId IN (SELECT driverId FROM drivers WHERE forename = 'Paul' AND surname = 'di Resta')) AS results1, (SELECT fastestLapSpeed FROM results WHERE raceId = 854) AS results2	formula_1
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM (SELECT driverId FROM results WHERE raceId IN(SELECT raceId FROM races WHERE date = '1983-07-16')) AS T1 LEFT JOIN (SELECT driverId, time FROM results WHERE raceId IN(SELECT raceId FROM races WHERE date = '1983-07-16')) AS T2 ON T1.driverId = T2.driverId;	formula_1
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix';	formula_1
SELECT COUNT(*), name FROM races WHERE date LIKE '2005%' GROUP BY name ORDER BY name DESC;	formula_1
SELECT raceName FROM races WHERE year = (SELECT strftime('%Y', MIN(date)) FROM races) AND month = (SELECT strftime('%m', MIN(date)) FROM races);	formula_1
SELECT T2.name, T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 1999 ORDER BY T1.round DESC LIMIT 1;	formula_1
SELECT strftime('%Y', date) AS year, COUNT(*) AS num_races FROM races GROUP BY year ORDER BY num_races DESC LIMIT 1;	formula_1
SELECT T1.raceName FROM (SELECT raceName FROM races WHERE year = 2017) AS T1 EXCEPT SELECT T2.raceName FROM (SELECT raceName FROM races WHERE year = 2000) AS T2	formula_1
SELECT c.name AS circuit_name, c.location, c.country FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE c.country IN (SELECT DISTINCT country FROM circuits WHERE country LIKE '%Europe%') ORDER BY strftime('%Y', r.time) ASC LIMIT 1;	formula_1
SELECT MAX(r.year) FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.name = 'Brands Hatch'	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit' AND races.race = 'British Grand Prix';	formula_1
SELECT d.driverRef FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId JOIN races AS ra ON r.raceId = ra.raceId WHERE ra.year = 2010 AND ra.name = 'Singapore Grand Prix' ORDER BY r.position;	formula_1
SELECT d.forename, d.surname, r.points FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId WHERE r.points = (SELECT MAX(points) FROM results);	formula_1
SELECT r.driverId, r.points FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId WHERE ra.year = 2017 AND ra.name = 'Chinese Grand Prix' ORDER BY r.points DESC LIMIT 3;	formula_1
SELECT MIN(T1.milliseconds) AS best_lap_time, T3.forename, T3.surname, T2.name AS race_name FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId GROUP BY T1.driverId, T1.raceId;	formula_1
SELECT AVG(T4.milliseconds) FROM (SELECT T1.raceId, T2.driverId FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2009 AND T1.name = 'Malaysian Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton') AS T4 JOIN laps AS T5 ON T4.raceId = T5.raceId AND T4.driverId = T5.driverId;	formula_1
SELECT CAST((SELECT COUNT(*) FROM(SELECT * FROM results WHERE surname = 'Hamilton' AND position > 1 AND year >= 2010) AS subquery1) AS REAL) / (SELECT COUNT(*) FROM(SELECT * FROM results WHERE surname = 'Hamilton' AND year >= 2010) AS subquery2) * 100	formula_1
SELECT d.forename, d.surname, c.nationality, MAX(r.points) AS max_points FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId WHERE r.position = 1 GROUP BY r.driverId ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT name, dob FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1;	formula_1
SELECT c.name FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE strftime('%Y', r.date) BETWEEN '1990' AND '2000' GROUP BY c.circuitId HAVING COUNT(*) = 4;	formula_1
SELECT c.name AS circuit_name, c.location, r.name AS race_name FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.year = 2006 AND c.country = 'USA';	formula_1
SELECT r.name AS race_name, c.name AS circuit_name, c.location FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE MONTH(r.date) = 9 AND YEAR(r.date) = 2005;	formula_1
SELECT R.raceName FROM (SELECT * FROM results AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Alex' AND T2.surname = 'Yoong' AND T1.position < 20) AS D JOIN races AS R ON D.raceId = R.raceId	formula_1
SELECT COUNT(*) FROM (SELECT r.raceId FROM results AS rs JOIN races AS r ON rs.raceId = r.raceId JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'sepang' AND rs.driverId = (SELECT driverId FROM drivers WHERE forename = 'Michael' AND surname = 'Schumacher') GROUP BY r.raceId HAVING MAX(rs.points))	formula_1
SELECT T2.raceName, T4.year FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId JOIN seasons AS T4 ON T2.year = T4.season WHERE T3.forename = 'Michael' AND T3.surname = 'Schumacher' ORDER BY T1.milliseconds ASC LIMIT 1;	formula_1
SELECT AVG(T1.points) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.name = 'Eddie Irvine' AND strftime('%Y', T2.date) = '2000';	formula_1
SELECT T2.year, T1.points FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' GROUP BY T2.year ORDER BY T2.year ASC LIMIT 1;	formula_1
SELECT T1.name AS race_name, T2.country FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE strftime('%Y', T1.date) = '2017' ORDER BY T1.date;	formula_1
SELECT T1.name, T1.year, T3.location FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN circuits AS T3 ON T1.circuitId = T3.circuitId GROUP BY T1.raceId ORDER BY SUM(T2.laps) DESC LIMIT 1;	formula_1
SELECT CAST(SUM(CASE WHEN T2.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.circuitId) FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix'	formula_1
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit';	formula_1
SELECT name FROM circuits WHERE lat = (SELECT MAX(lat) FROM circuits WHERE name IN ('Silverstone', 'Hockenheimring', 'Hungaroring')) AND name IN ('Silverstone', 'Hockenheimring', 'Hungaroring')	formula_1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'	formula_1
SELECT T1.country FROM circuits AS T1 WHERE T1.alt = (SELECT MAX(T2.alt) FROM circuits AS T2)	formula_1
SELECT COUNT(*) FROM drivers WHERE code IS NULL;	formula_1
SELECT nationality FROM drivers ORDER BY dob ASC LIMIT 1;	formula_1
SELECT surname FROM drivers WHERE nationality = 'Italian';	formula_1
;	formula_1
SELECT driverRef FROM drivers WHERE name = 'Lewis Hamilton'	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Spanish Grand Prix' AND T2.year = 2009;	formula_1
SELECT DISTINCT T1.year FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.name = 'Silverstone Circuit'	formula_1
SELECT R.url FROM (SELECT * FROM circuits WHERE name = 'Silverstone') AS C JOIN races AS R ON C.circuitId = R.circuitId	formula_1
SELECT T1.time FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T2.name = 'Abu Dhabi' AND T2.location = 'Yas Island'	formula_1
SELECT COUNT(*) FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy';	formula_1
SELECT T1.date FROM races AS T1 JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.circuitRef = 'catalunya'	formula_1
SELECT c.url FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.year = 2009 AND r.name = 'Spanish Grand Prix'	formula_1
SELECT MIN(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT D.forename, D.surname FROM drivers AS D JOIN (SELECT driverId, raceId, MIN(milliseconds) as fastest_lap_time FROM lap_times GROUP BY raceId) AS LT ON D.driverId = LT.driverId JOIN results AS R ON R.resultId = LT.raceId AND R.driverId = LT.driverId ORDER BY LT.fastest_lap_time ASC LIMIT 1;	formula_1
SELECT T3.driverRef FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Canadian Grand Prix' AND T1.year = 2007 ORDER BY T2.position ASC LIMIT 1;	formula_1
SELECT r.name FROM races AS r JOIN results AS rs ON r.raceId = rs.raceId JOIN drivers AS d ON d.driverId = rs.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'	formula_1
SELECT T2.raceName FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.forename = 'Lewis' AND T3.surname = 'Hamilton' ORDER BY T1.rank ASC LIMIT 1;	formula_1
SELECT MAX(T3.fastestLapSpeed) FROM (SELECT * FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009) AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId	formula_1
SELECT DISTINCT T3.year FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.name = 'Lewis Hamilton'	formula_1
SELECT T3.positionOrder FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2008 AND T1.name = 'Chinese Grand Prix' AND T3.forename = 'Lewis' AND T3.surname = 'Hamilton'	formula_1
SELECT T3.forename, T3.surname FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 1989 AND T1.name = 'Australian Grand Prix' AND T2.grid = 4;	formula_1
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Australian Grand Prix' AND races.year = 2008 AND results.time IS NOT NULL;	formula_1
SELECT T3.fastestLapTime FROM (SELECT * FROM races WHERE year = 2008 AND name = 'Australian Grand Prix') AS T1 JOIN (SELECT * FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AS T2 ON T1.raceId = results.raceId JOIN results AS T3 ON T2.driverId = T3.driverId WHERE T3.fastestLapTime IS NOT NULL ORDER BY T3.fastestLapTime LIMIT 1	formula_1
SELECT T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.rank = 2;	formula_1
SELECT d.name, d.url FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN drivers AS d ON r.driverId = d.driverId WHERE ra.name = 'Australian Grand Prix' AND ra.year = 2008 ORDER BY r.time LIMIT 1;	formula_1
SELECT COUNT(*) FROM (SELECT DISTINCT T1.driverId FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN driver_standings AS T3 ON T1.driverId = T3.driverId JOIN drivers AS T4 ON T3.driverId = T4.driverId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix' AND T4.nationality = 'British') AS temp	formula_1
SELECT COUNT(DISTINCT T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Chinese Grand Prix' AND T1.time IS NOT NULL;	formula_1
SELECT SUM(r.points) FROM results r JOIN drivers d ON r.driverId = d.driverId WHERE d.name = 'Lewis Hamilton';	formula_1
SELECT AVG(T2.fastestLapTime) AS avg_fastest_lap_time FROM (SELECT * FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId;	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.resultId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix'	formula_1
WITH champion_time AS (SELECT MIN(time) AS champ_time FROM results WHERE position = 1 AND race_id IN (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')), last_driver_time AS (SELECT MAX(CAST(SUBSTR(time, 7, 2) AS INTEGER) * 3600 + CAST(SUBSTR(time, 4, 2) AS INTEGER) * 60 + CAST(SUBSTR(time, 1, 2) AS INTEGER) + CAST(SUBSTR(incremental_time, 7, 2) AS INTEGER) * 3600 + CAST(SUBSTR(incremental_time, 4, 2) AS INTEGER) * 60 + CAST(SUBSTR(incremental_time, 1, 2) AS INTEGER)) AS last_time FROM results WHERE race_id IN (SELECT raceId FROM races WHERE year = 2008 AND name = 'Australian Grand Prix')) SELECT ((last_driver_time.last_time - champion_time.champ_time) / last_driver_time.last_time * 100) AS percentage_difference FROM champion_time, last_driver_time	formula_1
SELECT COUNT(*) FROM circuits WHERE location = 'Adelaide' AND country = 'Australia';	formula_1
SELECT lat, lng FROM circuits WHERE country = 'USA';	formula_1
SELECT COUNT(driverId) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) > '1980';	formula_1
SELECT MAX(cs.points) FROM constructorStandings AS cs JOIN constructors AS c ON cs.constructorId = c.constructorId WHERE c.nationality = 'British'	formula_1
SELECT constructorRef FROM constructorStandings WHERE points = (SELECT MAX(points) FROM constructorStandings);	formula_1
SELECT T3.name FROM results AS T1 JOIN constructors AS T3 ON T1.constructorId = T3.constructorId JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 291 AND T1.points = 0;	formula_1
SELECT COUNT(T3.raceId) AS num_races FROM (SELECT T1.constructorId FROM constructors AS T1 JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Japanese' AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(T2.raceId) = 2 LIMIT 1) AS T3	formula_1
SELECT c.constructorRef FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE r.position = 1;	formula_1
SELECT COUNT(*) FROM (SELECT * FROM results JOIN races ON results.raceId = races.raceId AND results.laps > 50) AS T1 JOIN constructors ON T1.constructorId = constructors.constructorId WHERE constructors.nationality = 'French';	formula_1
SELECT CAST(SUM(CASE WHEN T1.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.driverId) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T3.nationality = 'Japanese' AND T2.year BETWEEN 2007 AND 2009;	formula_1
SELECT AVG(strftime('%s', T2.time) - strftime('%s', '1970-01-01T00:00:00')) AS average_time FROM (SELECT * FROM results WHERE position = 1 AND year < 1975) AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.time IS NOT NULL;	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE strftime('%Y', T1.dob) > '1975' AND T2.rank = 2;	formula_1
SELECT COUNT(*) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.nationality = 'Italian' AND results.time IS NULL;	formula_1
SELECT drivers.forename, drivers.surname FROM laps JOIN drivers ON laps.driverId = drivers.driverId WHERE laps.time = (SELECT MIN(time) FROM laps);	formula_1
SELECT T2.fastestLap FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2009 AND T2.position = 1	formula_1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009;	formula_1
SELECT T1.name, T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.milliseconds IS NOT NULL ORDER BY T2.milliseconds ASC LIMIT 1;	formula_1
SELECT CAST(COUNT(CASE WHEN T3.dob < '1985-01-01' AND T2.laps > 50 THEN T2.driverId END) AS REAL) * 100 / COUNT(T2.driverId) FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year BETWEEN 2000 AND 2005;	formula_1
SELECT COUNT(*) FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.nationality = 'French' AND CAST(SUBSTR(results.time, 7, 2) AS INTEGER) * 60 + CAST(SUBSTR(results.time, 4, 2) AS INTEGER) < 120;	formula_1
SELECT code FROM drivers WHERE nationality = 'America';	formula_1
SELECT raceId FROM races WHERE time LIKE '2009%'	formula_1
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18;	formula_1
SELECT COUNT(*) FROM (SELECT d.driverId, n.nationality FROM drivers AS d JOIN nationalities AS n ON d.nationalityId = n.nationalityId WHERE d.driverId IN (SELECT driverId FROM drivers ORDER BY STRFTIME('%Y', dob) DESC LIMIT 3)) WHERE nationality = 'Dutch';	formula_1
SELECT driverRef FROM drivers WHERE name = 'Robert Kubica';	formula_1
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND strftime('%Y', dob) = '1980';	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId JOIN circuits AS c ON r.circuitId = c.circuitId WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1990' ORDER BY r.time ASC LIMIT 3	formula_1
SELECT T1.driverRef FROM drivers AS T1 JOIN nationalities AS T2 ON T1.nationalityId = T2.nationalityId WHERE T2.nationality = 'German' ORDER BY T1.dob ASC LIMIT 1;	formula_1
SELECT DISTINCT T1.driverId, T1.driverRef FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE strftime('%Y', T1.dob) = '1971' AND T2.fastestLapTime IS NOT NULL	formula_1
SELECT d.driverRef AS driver_reference, MAX(r.time) AS latest_lap_time FROM drivers d JOIN results r ON d.driverId = r.driverId WHERE d.nationality = 'Spanish' AND strftime('%Y', d.dob) < '1982' GROUP BY d.driverId ORDER BY latest_lap_time DESC LIMIT 10;	formula_1
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL GROUP BY T1.year ORDER BY MIN(T2.fastestLapTime) ASC LIMIT 1	formula_1
SELECT races.year FROM races WHERE races.time = (SELECT MAX(time) FROM races);	formula_1
SELECT T4.driverId FROM (SELECT T1.raceId, MIN(T1.time) AS min_time FROM results AS T1 GROUP BY T1.raceId) AS T2 JOIN races AS T3 ON T2.raceId = T3.raceId JOIN laps AS T4 ON T4.resultId = T2.raceId WHERE T4.lap = 1 GROUP BY T4.driverId ORDER BY min_time ASC LIMIT 5;	formula_1
SELECT COUNT(*) FROM results WHERE statusId = 2 AND time IS NOT NULL AND raceId BETWEEN 50 AND 100;	formula_1
SELECT location, lat, lng FROM circuits WHERE country = 'Austria';	formula_1
SELECT raceNumber, COUNT(*) AS num_finishers FROM races WHERE time IS NOT NULL GROUP BY raceNumber ORDER BY num_finishers DESC LIMIT 1;	formula_1
SELECT T3.driverRef, T3.nationality, T3.dob FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 23 AND T1.q2 IS NOT NULL;	formula_1
SELECT T3.name, T3.date, T3.time FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.dob = (SELECT MIN(dob) FROM drivers) AND T3.date = (SELECT MIN(date) FROM races)	formula_1
SELECT COUNT(*) FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.nationality = 'American' AND results.status = 'Puncture';	formula_1
SELECT c.url FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE c.nationality = 'Italian' ORDER BY r.points DESC LIMIT 1;	formula_1
;	formula_1
SELECT d.name FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId JOIN races AS ra ON r.raceId = ra.raceId JOIN circuits AS c ON ra.circuitId = c.circuitId WHERE ra.name = 'French Grand Prix' AND r.lap = 3 ORDER BY r.time DESC LIMIT 1;	formula_1
SELECT T1.raceName FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN constructorStandings AS T3 ON T2.constructorId = T3.constructorId WHERE T2.milliseconds = (SELECT MIN(milliseconds) FROM results)	formula_1
SELECT AVG(T1.fastestLapTime) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2006 AND T2.name = 'United States Grand Prix' AND T1.position <= 10;	formula_1
SELECT d.forename, d.surname, MIN(AVG(ps.duration)) AS avg_duration FROM drivers d JOIN status s ON d.driverId = s.driverId JOIN lap_times lt ON s.raceId = lt.raceId JOIN races r ON lt.raceId = r.raceId JOIN pit_stops ps ON lt.lap_time_id = ps.lap_time_id WHERE d.nationality = 'German' AND strftime('%Y', d.dob) BETWEEN '1980' AND '1985' GROUP BY d.driverId ORDER BY avg_duration ASC LIMIT 3;	formula_1
SELECT T3.forename, T3.surname, T2.time FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Canadian Grand Prix' AND strftime('%Y', T1.date) = '2008' ORDER BY T2.position ASC LIMIT 1;	formula_1
SELECT c.constructorRef, c.url FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN constructors AS c ON r.constructorId = c.constructorId WHERE ra.year = 2009 AND ra.name = 'Singapore Grand Prix' ORDER BY r.time ASC LIMIT 1;	formula_1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND strftime('%Y', dob) BETWEEN '1981' AND '1991';	formula_1
SELECT T1.forename || ' ' || T1.surname AS full_name, T1.url, T1.dob FROM drivers AS T1 WHERE T1.nationality = 'German' AND strftime('%Y', T1.dob) BETWEEN '1971' AND '1985' ORDER BY T1.dob DESC;	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'	formula_1
SELECT SUM(T3.points) AS total_points, T2.name, T2.nationality FROM races AS T1 JOIN results AS T3 ON T1.raceId = T3.raceId JOIN constructors AS T2 ON T3.constructorId = T2.constructorId WHERE T1.name = 'Monaco Grand Prix' AND T1.year BETWEEN 1980 AND 2010 GROUP BY T3.constructorId ORDER BY total_points DESC LIMIT 1;	formula_1
SELECT AVG(T3.points) FROM (SELECT * FROM races WHERE name = 'Turkish Grand Prix') AS T1 JOIN (SELECT * FROM results WHERE raceId = T1.raceId) AS T2 ON T1.raceId = T2.raceId JOIN (SELECT * FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AS T3 ON T2.driverId = T3.driverId;	formula_1
SELECT AVG(cnt) AS avg_races FROM (SELECT COUNT(*) AS cnt FROM races WHERE date BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY strftime('%Y', date))	formula_1
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;	formula_1
SELECT COUNT(*) FROM (SELECT r.raceId, d.driverId FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId WHERE r.position = '91' GROUP BY r.raceId, d.driverId) AS subquery	formula_1
SELECT T1.name FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime ASC LIMIT 1;	formula_1
SELECT c.name, c.country FROM circuits AS c JOIN (SELECT circuitId, MAX(date) AS max_date FROM races GROUP BY circuitId) AS r ON c.circuitId = r.circuitId WHERE r.date = (SELECT MAX(date) FROM races)	formula_1
SELECT T1.forename, T1.surname FROM drivers AS T1 JOIN results AS T2 ON T1.driverid = T2.driverid JOIN races AS T3 ON T2.raceid = T3.raceid WHERE T3.year = 2008 AND T3.circuitid IN (SELECT circuitid FROM circuits WHERE circuitRef = 'marina_bay') ORDER BY T2.q3 ASC LIMIT 1	formula_1
SELECT d.forename || ' ' || d.surname AS full_name, c.nationality, r.name AS race_name FROM drivers d JOIN results rsl ON d.driverId = rsl.driverId JOIN races r ON rsl.raceId = r.raceId JOIN constructors c ON d.constructorId = c.constructorId WHERE d.dob = (SELECT MAX(dob) FROM drivers)	formula_1
SELECT T1.driverId, COUNT(*) AS num_accidents FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Canadian Grand Prix' AND T1.statusId = 3 GROUP BY T1.driverId ORDER BY num_accidents DESC LIMIT 1;	formula_1
SELECT T1.forename, T1.surname, COUNT(T2.raceId) AS wins FROM drivers AS T1 JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.dob = (SELECT MIN(dob) FROM drivers) GROUP BY T1.driverId	formula_1
SELECT MAX(duration) FROM pit_stops;	formula_1
;	formula_1
SELECT MAX(duration) FROM pit_stops WHERE driver = 'Lewis Hamilton';	formula_1
SELECT T3.lap FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId JOIN pit_stops AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix' AND T2.driverId IN (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton')	formula_1
SELECT T3.name, T1.duration FROM pit_stops AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.year = 2011 AND T2.name = 'Australian Grand Prix';	formula_1
SELECT results.fastestLapTime FROM results JOIN drivers ON results.driverId = drivers.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'	formula_1
SELECT d.forename, d.surname FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId JOIN races AS ra ON r.raceId = ra.raceId JOIN lap_times AS lt ON ra.raceId = lt.raceId WHERE lt.time = (SELECT MIN(time) FROM lap_times)	formula_1
SELECT c.name AS circuit_name FROM (SELECT r.circuitId, MIN(r.time) AS min_time FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE r.driverId = (SELECT d.driverId FROM drivers d WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton') GROUP BY r.circuitId) AS fastest_laps JOIN circuits c ON fastest_laps.circuitId = c.circuitId	formula_1
;	formula_1
SELECT name FROM circuits WHERE country = 'Italy';	formula_1
SELECT T1.name FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuit_id WHERE T1.name = 'Red Bull Ring'	formula_1
SELECT cs.duration FROM constructorStandings AS cs JOIN races AS r ON cs.raceId = r.raceId JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.name = 'Red Bull Ring' ORDER BY r.time ASC LIMIT 1	formula_1
SELECT c.lat, c.lng FROM circuits AS c JOIN lap_records AS lr ON c.circuitId = lr.circuitId WHERE lr.time = '1:29.488';	formula_1
SELECT AVG(T2.milliseconds) FROM drivers AS T1 JOIN pit_stops AS T2 ON T1.driverId = T2.driverId JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.name = 'Lewis Hamilton' AND T3.series = 'Formula_1';	formula_1
SELECT AVG(lt.milliseconds) FROM lap_times lt JOIN circuits c ON lt.circuitId = c.circuitId WHERE c.country = 'Italy'	formula_1
SELECT player_api_id FROM Player WHERE GBH = (SELECT MAX(GBH) FROM Player) OR GBD = (SELECT MAX(GBD) FROM Player) OR GBA = (SELECT MAX(GBA) FROM Player) OR BSH = (SELECT MAX(BSH) FROM Player) OR BSD = (SELECT MAX(BSD) FROM Player) OR BSA = (SELECT MAX(BSA) FROM Player);	european_football_2
SELECT player_name, height FROM Player WHERE height = (SELECT MAX(height) FROM Player);	european_football_2
SELECT T2.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.potential = (SELECT MIN(potential) FROM Player_Attributes)	european_football_2
SELECT COUNT(*) FROM Player WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low';	european_football_2
SELECT P.player_name, P.id FROM Player AS P JOIN (SELECT id, MAX(crossing) as max_crossing FROM Player GROUP BY id LIMIT 5) AS C ON P.id = C.id ORDER BY C.max_crossing DESC;	european_football_2
SELECT T2.league_name FROM Match AS T1 JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.league_name ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1	european_football_2
SELECT T2.team_long_name FROM (SELECT T1.home_team_api_id, COUNT(*) AS num_losses FROM Matches AS T1 WHERE T1.season = '2015/2016' AND T1.home_team_goal < T1.away_team_goal GROUP BY T1.home_team_api_id) AS T3 JOIN Team AS T2 ON T3.home_team_api_id = T2.team_api_id ORDER BY num_losses ASC LIMIT 1;	european_football_2
SELECT Player.player_name FROM Player JOIN Penalties ON Player.id = Penalties.player_id ORDER BY Penalties.penalties DESC LIMIT 10;	european_football_2
SELECT T2.team_long_name FROM `Match` AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.season = '2009/2010' AND T1.league_id IN (SELECT league_id FROM League WHERE name = 'Scotland Premier League') GROUP BY T1.away_team_api_id HAVING SUM(T1.away_team_goal > T1.home_team_goal) > 0 ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT buildUpPlaySpeed FROM Team ORDER BY buildUpPlaySpeed DESC LIMIT 4;	european_football_2
SELECT T1.country_id, T1.league_id FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T3.season = '2015/2016' AND T3.home_team_goal = T3.away_team_goal GROUP BY T1.country_id, T1.league_id ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT (JULIANDAY('now') - JULIANDAY(T2.birthday)) / 365 AS age FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.sprint_speed >= 97 AND strftime('%Y', T1.date) BETWEEN '2013' AND '2015'	european_football_2
SELECT L.league_name, COUNT(M.match_api_id) AS total_matches FROM Match M JOIN League L ON M.league_id = L.id GROUP BY L.league_name ORDER BY total_matches DESC LIMIT 1;	european_football_2
SELECT AVG(height) FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'	european_football_2
SELECT T2.player_api_id FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE SUBSTR(T1.date, 1, 4) = '2010' AND T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes WHERE SUBSTR(date, 1, 4) = '2010' AND overall_rating > (SELECT AVG(overall_rating) FROM Player_Attributes WHERE SUBSTR(date, 1, 4) = '2010'))	european_football_2
SELECT team_fifa_api_id FROM Team WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60;	european_football_2
SELECT team_long_name FROM Team_Attributes WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012' AND buildUpPlayPassing IS NOT NULL)	european_football_2
SELECT CAST(SUM(CASE WHEN T1.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.player_fifa_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T2.birthday) BETWEEN '1987' AND '1992';	european_football_2
;	european_football_2
SELECT AVG(T2.GBD) FROM Player AS T1 JOIN (SELECT * FROM TableWithShootingStats) AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ahmed Samir Farag';	european_football_2
SELECT P.player_name, AVG(PA.heading_accuracy) AS avg_heading_accuracy FROM Player_Attributes PA JOIN Player P ON PA.player_fifa_api_id = P.player_fifa_api_id WHERE P.height > 180 GROUP BY PA.player_fifa_api_id ORDER BY avg_heading_accuracy DESC LIMIT 10;	european_football_2
SELECT T.team_long_name FROM (SELECT AVG(T2.chanceCreationPassing) AS avg_chance_creation_passing FROM Team_Attributes AS T2 WHERE T2.date >= '2014-01-01 00:00:00' AND T2.date <= '2014-01-31 00:00:00') AS avg_table JOIN (SELECT T1.team_long_name, T1.chanceCreationPassing FROM Team_Attributes AS T1 JOIN Teams AS T ON T1.team_api_id = T.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date >= '2014-01-01 00:00:00' AND T1.date <= '2014-01-31 00:00:00') AS filtered_table ON avg_table.avg_chance_creation_passing > filtered_table.chanceCreationPassing ORDER BY filtered_table.chanceCreationPassing DESC;	european_football_2
SELECT L.name AS league_name FROM (SELECT League.name, SUM(Match.home_team_goal) AS total_home_goals, SUM(Match.away_team_goal) AS total_away_goals, COUNT(DISTINCT Match.id) AS match_count FROM Match JOIN League ON Match.country_id = League.country_id WHERE Match.season = '2009/2010' GROUP BY League.name) AS L WHERE L.total_home_goals / L.match_count > L.total_away_goals / L.match_count;	european_football_2
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers';	european_football_2
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10';	european_football_2
SELECT pa.att_work_rate FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Franco Zennaro'	european_football_2
SELECT T1.buildUpPlayPositioningClass FROM Team_Attributes AS T1 JOIN Teams AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'ADO Den Haag' AND T1.date = (SELECT MAX(date) FROM Team_Attributes WHERE team_api_id = (SELECT team_api_id FROM Teams WHERE team_long_name = 'ADO Den Haag'))	european_football_2
SELECT T2.heading_accuracy FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00';	european_football_2
SELECT AVG(T2.GBD + T3.GBA + T4.BSH + T5.BSD + T6.BSA) AS overall_rating FROM Player AS T1 JOIN GBD AS T2 ON T1.player_api_id = T2.player_api_id JOIN GBA AS T3 ON T1.player_api_id = T3.player_api_id JOIN BSH AS T4 ON T1.player_api_id = T4.player_api_id JOIN BSD AS T5 ON T1.player_api_id = T5.player_api_id JOIN BSA AS T6 ON T1.player_api_id = T6.player_api_id WHERE T1.player_name = 'Gabriel Tamas' AND strftime('%Y', date) = '2011';	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND league_name = 'Scotland Premier League';	european_football_2
SELECT pa.preferred_foot FROM Player AS p JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MAX(birthday) FROM Player)	european_football_2
SELECT Player.player_name, MAX(CASE WHEN GBH IS NOT NULL THEN CAST(GBH AS REAL) ELSE 0 END), MAX(CASE WHEN GBD IS NOT NULL THEN CAST(GBD AS REAL) ELSE 0 END), MAX(CASE WHEN GBA IS NOT NULL THEN CAST(GBA AS REAL) ELSE 0 END), MAX(CASE WHEN BSH IS NOT NULL THEN CAST(BSH AS REAL) ELSE 0 END), MAX(CASE WHEN BSD IS NOT NULL THEN CAST(BSD AS REAL) ELSE 0 END), MAX(CASE WHEN BSA IS NOT NULL THEN CAST(BSA AS REAL) ELSE 0 END) FROM Player WHERE (GBH = (SELECT MAX(GBH) FROM Player) OR GBD = (SELECT MAX(GBD) FROM Player) OR GBA = (SELECT MAX(GBA) FROM Player) OR BSH = (SELECT MAX(BSH) FROM Player) OR BSD = (SELECT MAX(BSD) FROM Player) OR BSA = (SELECT MAX(BSA) FROM Player));	european_football_2
SELECT COUNT(*) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.weight < 130 AND T1.preferred_foot = 'left';	european_football_2
SELECT team_short_name FROM Team WHERE chanceCreationPassingClass = 'Risky';	european_football_2
SELECT pa.GKD FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'David Wilson'	european_football_2
SELECT T1.birthday FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_fifa_api_id WHERE T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Netherlands'	european_football_2
SELECT AVG(T1.home_team_goal) FROM Match AS T1 JOIN Country AS T2 ON T1.country_id = T2.id JOIN Season AS T3 ON T1.season_id = T3.id WHERE T2.name = 'Poland' AND T3.season = '2010/2011';	european_football_2
WITH tallest_shortest AS (SELECT id FROM Player WHERE height = (SELECT MAX(height) FROM Player) UNION SELECT id FROM Player WHERE height = (SELECT MIN(height) FROM Player)), avg_finishing AS (SELECT p.id, AVG(ps.finishing) as avg_finishing FROM Player p JOIN Player_Stats ps ON p.player_api_id = ps.player_api_id WHERE p.id IN (SELECT * FROM tallest_shortest) GROUP BY p.id) SELECT player_name, avg_finishing FROM Player JOIN avg_finishing ON Player.id = avg_finishing.id ORDER BY avg_finishing DESC LIMIT 1;	european_football_2
SELECT player_name FROM Player WHERE height > 180;	european_football_2
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) > '1990';	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170;	european_football_2
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.overall_rating > 80 AND strftime('%Y', T2.date) BETWEEN '2008' AND '2010';	european_football_2
SELECT pa.potential FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Doran'	european_football_2
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.preferred_foot = 'left';	european_football_2
SELECT team_long_name FROM Teams WHERE buildUpPlaySpeedClass = 'Fast';	european_football_2
SELECT T.buildUpPlayPassingClass FROM Teams AS T WHERE T.team_short_name = 'CLB';	european_football_2
SELECT team_short_name FROM Team WHERE buildUpPlayPassing > 70;	european_football_2
SELECT CAST(SUM(T2.overall_rating) AS REAL) / COUNT(T2.id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T2.date) >= '2010' AND strftime('%Y', T2.date) <= '2015' AND T1.height > 170;	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player);	european_football_2
SELECT T1.country FROM League AS T1 WHERE T1.name = 'Italy Serie A';	european_football_2
SELECT T1.team_short_name FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32;	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Doran';	european_football_2
SELECT COUNT(*) FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10';	european_football_2
SELECT T1.team_short_name FROM `Team` AS T1 JOIN `Match` AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.home_team_goal = 10;	european_football_2
SELECT player_name FROM Player WHERE GBD = (SELECT MAX(GBD) FROM Player) AND potential = 61;	european_football_2
SELECT (SUM(CASE WHEN T2.player_name = 'Abdou Diallo' THEN T1.ball_control ELSE 0 END) / COUNT(CASE WHEN T2.player_name = 'Abdou Diallo' THEN T1.id ELSE NULL END)) - (SUM(CASE WHEN T2.player_name = 'Aaron Appindangoye' THEN T1.ball_control ELSE 0 END) / COUNT(CASE WHEN T2.player_name = 'Aaron Appindangoye' THEN T1.id ELSE NULL END)) AS diff FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id	european_football_2
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN';	european_football_2
SELECT player_name FROM Player WHERE birthday < (SELECT birthday FROM Player WHERE player_name = 'Abdelaziz Barrada') AND player_name = 'Aaron Lennon' UNION SELECT player_name FROM Player WHERE birthday > (SELECT birthday FROM Player WHERE player_name = 'Aaron Lennon') AND player_name = 'Abdelaziz Barrada'	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN (SELECT MAX(height) as max_height FROM Player) AS T2 WHERE T1.height = T2.max_height;	european_football_2
SELECT COUNT(*) FROM Player p JOIN Player_Attributes pa ON p.player_fifa_api_id = pa.player_fifa_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low';	european_football_2
SELECT T2.name FROM League AS T1 JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.name = 'Belgium Jupiler League';	european_football_2
SELECT T2.name FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Germany';	european_football_2
SELECT player_name FROM Player WHERE GBH = (SELECT MAX(GBH) FROM Player) OR GBD = (SELECT MAX(GBD) FROM Player) OR GBA = (SELECT MAX(GBA) FROM Player) OR BSH = (SELECT MAX(BSH) FROM Player) OR BSD = (SELECT MAX(BSD) FROM Player) OR BSA = (SELECT MAX(BSA) FROM Player);	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'high';	european_football_2
SELECT player_name FROM Player WHERE crossing = (SELECT MAX(crossing) FROM Player) AND player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone');	european_football_2
SELECT pa.heading_accuracy FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk'	european_football_2
SELECT COUNT(*) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 180 AND T2.volleys > 70;	european_football_2
SELECT T1.player_name FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.volleys > 70 AND T2.dribbling > 70;	european_football_2
SELECT COUNT(*) FROM Match JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Belgium' AND Match.season = '2008/2009';	european_football_2
SELECT pa.long_passing FROM Player AS p JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.birthday = (SELECT MIN(birthday) FROM Player)	european_football_2
SELECT COUNT(*) FROM `Match` JOIN League ON `Match`.league_id = League.id JOIN Country ON League.country_id = Country.id WHERE SUBSTR(`date`, 1, 7) = '2009-04' AND Country.name = 'Belgium Jupiler League';	european_football_2
SELECT T1.league_name FROM Country AS T1 JOIN Match AS T2 ON T1.id = T2.country_id WHERE T2.season = '2008/2009' GROUP BY T1.league_name ORDER BY COUNT(*) DESC LIMIT 1;	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE strftime('%Y', T2.birthday) < '1986';	european_football_2
SELECT (CAST((SELECT GBA FROM Player WHERE player_name = 'Ariel Borysiuk') - (SELECT GBA FROM Player WHERE player_name = 'Paulin Puel') AS REAL) / (SELECT GBA FROM Player WHERE player_name = 'Paulin Puel')) * 100;	european_football_2
SELECT AVG(Team_Attributes.buildUpPlaySpeed) FROM Team_Attributes JOIN Teams ON Team_Attributes.team_api_id = Teams.team_api_id WHERE Teams.team_long_name = 'Heart of Midlothian'	european_football_2
SELECT AVG(T1.overall_rating) FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'	european_football_2
SELECT SUM(T1.crossing) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennox'	european_football_2
SELECT MAX(TA.chanceCreationPassing), TA.chanceCreationPassingClass FROM Team_Attributes AS TA JOIN Teams AS T ON TA.team_api_id = T.team_api_id WHERE T.team_long_name = 'Ajax'	european_football_2
SELECT T2.preferred_foot FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Abdou Diallo'	european_football_2
SELECT MAX(T1.overall_rating) FROM Player AS T2 JOIN Player_Attributes AS T1 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'	european_football_2
SELECT AVG(T2.away_team_goal) FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id WHERE T1.team_long_name = 'Parma' AND T2.country = 'Italy'	european_football_2
SELECT P.player_name FROM Player AS P JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.date LIKE '2016-06-23%' AND PA.overall_rating = 77 ORDER BY P.birthday ASC LIMIT 1;	european_football_2
SELECT pa.overall_rating FROM Player_Attributes AS pa JOIN Player AS p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE p.player_name = 'Aaron Mooy' AND pa.date LIKE '2016-02-04%'	european_football_2
SELECT T2.potential FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Francesco Parravicini' AND T2.date = '2010-08-30 00:00:00'	european_football_2
SELECT T1.attacking_work_rate FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Francesco Migliore' AND T1.date LIKE '2015-05-01%'	european_football_2
SELECT GBD FROM Player JOIN (SELECT * FROM Player_Attributes WHERE date = '2013-02-22 00:00:00') AS PA ON Player.player_api_id = PA.player_api_id WHERE player_name = 'Kevin Berigaud'	european_football_2
SELECT T2.date FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1;	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2012-02-22'	european_football_2
SELECT T1.BPD FROM Team_Attributes AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.date = '2015-09-10 00:00:00' AND T2.home_team_short_name = 'LEI'	european_football_2
SELECT T1.BUPP FROM Team AS T1 JOIN Match AS T2 ON T1.team_api_id = T2.home_team_api_id WHERE T2.date LIKE '2010-02-22%' AND T1.team_long_name = 'FC Lorient';	european_football_2
SELECT T2.chance_creation_passing FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'	european_football_2
SELECT T2.GCA FROM Team AS T1 JOIN Player_Stats AS T2 ON T1.team_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'	european_football_2
SELECT T1.BDA FROM Team_Attributes AS T1 JOIN Teams AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.team_long_name = 'Hannover 96' AND T1.date LIKE '2015-09-10%'	european_football_2
SELECT AVG(T2.overall_rating) FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Marko Arnautovic' AND SUBSTR(CAST(T2.date AS TEXT), 1, 10) BETWEEN '2007-02-22' AND '2016-04-21'	european_football_2
SELECT CAST((SUM(CASE WHEN T2.player_name = 'Landon Donovan' THEN (T1.overall_rating) ELSE 0 END) - SUM(CASE WHEN T2.player_name = 'Jordan Bowery' THEN (T1.overall_rating) ELSE 0 END)) AS REAL) / SUM(CASE WHEN T2.player_name = 'Landon Donovan' THEN (T1.overall_rating) ELSE 0 END) * 100 FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE date = '2013-07-12'	european_football_2
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1;	european_football_2
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10;	european_football_2
SELECT player_name FROM Player WHERE datetime('now') - datetime(birthday) > '34 years'	european_football_2
SELECT COUNT(T1.home_team_goal) FROM match AS T1 JOIN player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Aaron Lennon' AND T1.home_team_api_id = T2.team_api_id;	european_football_2
SELECT SUM(T2.away_team_goal) FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')	european_football_2
SELECT SUM(T1.FTHG) FROM Match AS T1 JOIN Player_Attributes AS T2 ON T1.home_team_api_id = T2.player_api_id JOIN Player AS T3 ON T2.player_api_id = T3.player_api_id WHERE (datetime('now', 'localtime') - datetime(T3.birthday)) / 365 <= 30	european_football_2
SELECT T2.player_name FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Stats)	european_football_2
SELECT T2.player_name FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Stats)	european_football_2
SELECT player_name FROM Player WHERE id IN (SELECT player_api_id FROM (SELECT player_api_id, MAX(GBD) as max_GBD FROM Player GROUP BY player_api_id UNION SELECT player_api_id, MAX(GBA) as max_GBA FROM Player GROUP BY player_api_id UNION SELECT player_api_id, MAX(BSH) as max_BSH FROM Player GROUP BY player_api_id UNION SELECT player_api_id, MAX(BSD) as max_BSD FROM Player GROUP BY player_api_id UNION SELECT player_api_id, MAX(BSA) as max_BSA FROM Player GROUP BY player_api_id) WHERE max_GBD >= 3 OR max_GBA >= 3 OR max_BSH >= 3 OR max_BSD >= 3 OR max_BSA >= 3)	european_football_2
SELECT P.player_name FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_fifa_api_id = P.player_fifa_api_id WHERE PA.finishing = 1 ORDER BY P.birthday ASC LIMIT 1;	european_football_2
SELECT T2.player_name FROM Country AS T1 JOIN Player AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Belgium'	european_football_2
SELECT T1.player_name, T1.country FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.vision > 89	european_football_2
SELECT C.name AS country_name, AVG(P.weight) AS avg_weight FROM Player P JOIN Country C ON P.country_id = C.id GROUP BY C.name ORDER BY avg_weight DESC LIMIT 1;	european_football_2
SELECT team_long_name FROM Team WHERE buildUpPlaySpeedClass = 'Slow';	european_football_2
SELECT T.team_short_name FROM Chances AS C JOIN Teams AS T ON C.team_id = T.id WHERE C.chanceCreationPassingClass = 'Safe';	european_football_2
SELECT AVG(T3.height) FROM (SELECT T1.player_api_id FROM Player AS T2 JOIN Player_Attributes AS T1 ON T2.player_api_id = T1.player_api_id JOIN Country AS T4 ON T2.id = T4.id WHERE T4.name = 'Italy') AS T5 JOIN Player AS T3 ON T5.player_api_id = T3.player_api_id	european_football_2
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;	european_football_2
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-01-01'	european_football_2
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6) - (SELECT jumping FROM Player_Attributes WHERE id = 23)	european_football_2
SELECT player_fifa_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5;	european_football_2
SELECT COUNT(DISTINCT T1.player_api_id) FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND T2.preferred_foot = 'left'	european_football_2
SELECT CAST(COUNT(*) AS REAL) * 100 / (SELECT COUNT(*) FROM Player) FROM Player WHERE ((GBD > 80 OR BSH > 80) AND (GBA > 80 OR BSD > 80));	european_football_2
SELECT T1.country FROM League AS T1 WHERE T1.name = 'Poland Ekstraklasa'	european_football_2
SELECT T1.home_team_goal, T1.away_team_goal FROM Match AS T1 JOIN Country AS T2 ON T1.country_id = T2.id JOIN League AS T3 ON T2.id = T3.country_id WHERE T1.date LIKE '2008-09-24%' AND T3.name = 'Belgium Jupiler League'	european_football_2
SELECT pa.GBD, pa.GBA, pa.BSH FROM Player AS p JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Alexis Blin'	european_football_2
SELECT T2.buildUpPlaySpeedClass FROM Teams AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT COUNT(*) FROM Match WHERE season = '2015/2016' AND country_id = (SELECT id FROM Country WHERE name = 'Italy') AND league_id = (SELECT id FROM League WHERE country_id = (SELECT id FROM Country WHERE name = 'Italy') AND name = 'Serie A')	european_football_2
SELECT MAX(T1.home_team_goal) FROM `Match` AS T1 JOIN League AS T2 ON T1.league_id = T2.id JOIN Country AS T3 ON T2.country_id = T3.id WHERE T3.name = 'Netherlands' AND T2.name = 'Eredivisie'	european_football_2
SELECT T2.finishing, T2.curve FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight = (SELECT MAX(weight) FROM Player)	european_football_2
SELECT T3.name AS League_Name, COUNT(T2.id) AS Number_of_Games FROM Country AS T1 JOIN League AS T2 ON T1.id = T2.country_id JOIN Match AS T3 ON T2.id = T3.league_id WHERE T3.season = '2015/2016' GROUP BY T3.name ORDER BY Number_of_Games DESC LIMIT 4;	european_football_2
SELECT T2.team_long_name FROM `Match` AS T1 JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id WHERE T1.away_team_goal = (SELECT MAX(away_team_goal) FROM `Match`)	european_football_2
SELECT T2.player_name FROM Player_Attributes AS T1 JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)	european_football_2
SELECT CAST(COUNT(CASE WHEN T2.height < 180 AND T1.overall_rating > 70 THEN T1.id ELSE NULL END) AS REAL) * 100 / COUNT(T1.id) FROM Player_Stats AS T1 JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id;	european_football_2
SELECT (COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN ID END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN ID END)) / CAST(COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN ID END) AS REAL) * 100 AS percentage_deviation FROM lupus	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN strftime('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM patient WHERE SEX = 'F';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T2.Admisson = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Admisson) FROM Patient AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE strftime('%Y', T1.Birthday) BETWEEN '1930' AND '1940';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.Admission = '-' THEN 1 ELSE 0 END) FROM patient_table AS T1 WHERE T1.Diagnosis = 'SLE';	thrombosis_prediction
SELECT Diagnosis, Examination_Date FROM table_name WHERE Patient_ID = '30609';	thrombosis_prediction
SELECT Examination_Date, Symptoms FROM table_name WHERE Patient_ID = '163109';	thrombosis_prediction
SELECT ID, sex, birthday FROM Examination WHERE LDH > '500';	thrombosis_prediction
SELECT `You ID` FROM table_name WHERE RVVT = '+'	thrombosis_prediction
SELECT You, Diagnosis FROM table_name WHERE Thrombosis = 2;	thrombosis_prediction
;	thrombosis_prediction
SELECT ID, sex, Diagnosis FROM table_name WHERE albumin < 3.5;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.sex = 'F' AND (T2.TP < '6.0' OR T2.TP > '8.5') THEN T2.ID ELSE NULL END) AS REAL) * 100 / COUNT(CASE WHEN T2.sex = 'F' THEN T2.ID ELSE NULL END) FROM patient AS T1 JOIN examination AS T2 ON T1.patient_id = T2.patient_id;	thrombosis_prediction
SELECT AVG(`aCL IgG`) FROM Lupus WHERE Admission = '+' AND (strftime('%Y', 'now') - strftime('%Y', Examination_Date)) >= '50'	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE Examination_Date LIKE '1997%' AND Thrombosis = 1;	thrombosis_prediction
;	thrombosis_prediction
SELECT Symptoms, Diagnosis FROM table_name WHERE Examination_Date = (SELECT MAX(Examination_Date) FROM table_name WHERE Symptoms IS NOT NULL)	thrombosis_prediction
SELECT CAST(COUNT(DISTINCT ID) AS REAL) / 12 FROM lab WHERE Examination_Date BETWEEN '1998-01-01' AND '1998-12-31' AND SEX = 'M';	thrombosis_prediction
SELECT T2.Examination_Date, (strftime('%Y', T1.First_Date) - strftime('%Y', T1.Birthday)) AS age FROM Patient AS T1 JOIN Lab AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T1.Diagnosis LIKE '%SJS%' ORDER BY T1.Birthday ASC LIMIT 1	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'M' AND UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN SEX = 'F' AND UA <= 6.5 THEN 1 ELSE 0 END) FROM patient WHERE SEX IN ('M', 'F')	thrombosis_prediction
SELECT COUNT(DISTINCT `identification of the patient`) FROM (SELECT `identification of the patient`, MIN(`Examination Date`) AS first_date, `Examination Date` FROM table_name GROUP BY `identification of the patient`) WHERE strftime('%Y', `Examination Date`) - strftime('%Y', first_date) >= 1;	thrombosis_prediction
SELECT COUNT(*) FROM Lupus WHERE strftime('%Y', `Examination Date`) BETWEEN '1990' AND '1993' AND strftime('%Y', `Examination Date`) - strftime('%Y', Birthday) < 18;	thrombosis_prediction
;	thrombosis_prediction
SELECT Diagnosis, COUNT(*) AS count FROM table_name WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY count DESC LIMIT 1;	thrombosis_prediction
SELECT AVG(CAST(SUBSTR('1999', -2) AS INTEGER) - CAST(SUBSTR(Birthday, -4) AS INTEGER)) FROM LabExamination WHERE Examination_Date BETWEEN '1991-10-01' AND '1991-10-30';	thrombosis_prediction
;	thrombosis_prediction
SELECT ANA FROM Lupus WHERE Patient_ID = 3605340 AND Examination_Date = '1996-12-02';	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
SELECT aCL_IgM FROM table_name WHERE Diagnosis = 'SLE' AND Examination_Date <= '1993-11-12' ORDER BY Examination_Date DESC LIMIT 1	thrombosis_prediction
SELECT SEX FROM lab WHERE GPT = '9' AND Date = '1992-06-12'	thrombosis_prediction
SELECT strftime('%Y', '1991-10-21') - strftime('%Y', Birthday) AS Age FROM LabTest WHERE Date = '1991-10-21' AND UA = '8.4'	thrombosis_prediction
SELECT COUNT(L.ID) FROM Laboratory L JOIN Patient P ON L.Patient_ID = P.ID WHERE P.First_Date = '1991-06-13' AND P.Diagnosis = 'SJS' AND strftime('%Y', L.Examination_Date) = '1995';	thrombosis_prediction
SELECT T1.Diagnosis FROM lupus AS T1 JOIN (SELECT PatientID, MIN(ExaminationDate) AS FirstDate FROM lupus WHERE ExaminationDate = '1997-01-27' AND Diagnosis LIKE '%SLE%' GROUP BY PatientID) AS T2 ON T1.PatientID = T2.PatientID AND T1.ExaminationDate = T2.FirstDate;	thrombosis_prediction
SELECT Symptoms FROM table_name WHERE Examination_Date = '1993-09-27'	thrombosis_prediction
SELECT (SUM(CASE WHEN strftime('%Y-%m', Date) = '1981-11' THEN `T-CHO` ELSE 0 END) - SUM(CASE WHEN strftime('%Y-%m', Date) = '1981-12' THEN `T-CHO` ELSE 0 END)) AS decrease_rate FROM patient WHERE Birthday = '1959-02-18'	thrombosis_prediction
SELECT ID FROM table_name WHERE Diagnosis LIKE '%Behcet%' AND Examination_Date BETWEEN '1997-01-01' AND '1997-12-31';	thrombosis_prediction
SELECT ID FROM table_name WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4;	thrombosis_prediction
SELECT ID FROM Patients WHERE SEX = 'F' AND YEAR(Birthday) = 1964 AND Admission = '+'	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` >= ((SELECT AVG(`aCL IgM`) FROM table_name) + (0.2 * (SELECT AVG(`aCL IgM`) FROM table_name)))	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN UA <= 6.5 THEN 1 END) AS REAL) * 100 / COUNT(*) FROM table_name WHERE `U-PRO` > 0 AND `U-PRO` < 30;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM table_name WHERE SEX = 'M' AND strftime('%Y', `FIRST DATE`) = '1981';	thrombosis_prediction
SELECT Patient_ID FROM patient_data WHERE Admission = '-' AND Examination_Date LIKE '1991-10%' AND T_BIL < 2.0;	thrombosis_prediction
SELECT COUNT(*) FROM lupus WHERE ANA_Pattern != 'P' AND SEX = 'F' AND BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31';	thrombosis_prediction
SELECT T1.Sex FROM Patient AS T1 JOIN MedicalExamination AS T2 ON T1.Patient_ID = T2.Patient_ID JOIN LabTest AS T3 ON T1.Patient_ID = T3.Patient_ID WHERE T2.Diagnosis = 'PSS' AND T3.CRP > 2 AND T3.CRE = 1 AND T3.LDH = 123;	thrombosis_prediction
SELECT AVG(ALB) FROM Lupus WHERE SEX = 'F' AND PLT > 400 AND Diagnosis = 'SLE';	thrombosis_prediction
SELECT T1.Symptoms FROM Examination AS T1 JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SLE' GROUP BY T1.Symptoms ORDER BY COUNT(T1.Symptoms) DESC LIMIT 1;	thrombosis_prediction
SELECT `Examination Date`, Diagnosis FROM table_name WHERE You = '48473'	thrombosis_prediction
SELECT COUNT(*) FROM Examination WHERE Diagnosis='APS';	thrombosis_prediction
;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Symptoms LIKE '%ITP%' OR Symptoms LIKE '%thrombocytopenia%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM lupus WHERE Diagnosis LIKE '%SLE%';	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM patient WHERE strftime('%Y', BIRTHDAY) = '1980' AND Diagnosis LIKE '%RA%'	thrombosis_prediction
SELECT COUNT(*) FROM patient WHERE SEX = 'M' AND Examination_Date BETWEEN '1995-01-01' AND '1997-12-31' AND Diagnosis LIKE '%Behcet%' AND Admission = '-'	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
SELECT E.Examination_Date FROM Patient AS P JOIN Examination AS E ON P.patient_id = E.patient_id WHERE P.Patient_ID = '48473' AND E.GOT >= 60;	thrombosis_prediction
SELECT T1.PatientID, T2.Sex, T2.DateOfBirth FROM LaboratoryExamination AS T1 JOIN PatientInformation AS T2 ON T1.PatientID = T2.PatientID WHERE strftime('%Y', T1.ExaminationDate) = '1994' AND T1.GOT < 60;	thrombosis_prediction
SELECT ID FROM Patient WHERE SEX = 'M' AND GPT >= 60;	thrombosis_prediction
SELECT Diagnosis FROM lupus WHERE Examination_Date IN (SELECT Examination_Date FROM lupus WHERE aCL_IgG > 60 OR aCL_IgM > 60 OR ANA > 60 OR aCL_IgA > 60) ORDER BY Examination_Date ASC;	thrombosis_prediction
SELECT AVG(LDH) FROM table_name WHERE LDH < 500	thrombosis_prediction
SELECT Patient.ID, (strftime('%Y', 'now') - strftime('%Y', Birthday)) AS age FROM Patient JOIN Examination ON Patient.ID = Examination.Patient_ID WHERE LDH BETWEEN 600 AND 800;	thrombosis_prediction
SELECT Treatment FROM patients WHERE ALP < 300	thrombosis_prediction
;	thrombosis_prediction
SELECT ID, sex, date_of_birth FROM patient WHERE TP < 6.0;	thrombosis_prediction
SELECT SUBTRACT(TP, 8.5) AS Deviation FROM AutoimmuneDisease WHERE SEX = 'F' AND TP > 8.5;	thrombosis_prediction
SELECT * FROM patients WHERE SEX_COLUMN = 'M' AND (ALB_COLUMN <= 3.5 OR ALB_COLUMN >= 5.5) ORDER BY birthday_column DESC;	thrombosis_prediction
;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN UA > 6.5 AND SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM table_name WHERE SEX = 'F';	thrombosis_prediction
SELECT AVG(lab.UA) FROM lab JOIN patient ON lab.PatientID = patient.PatientID WHERE (patient.SEX = 'M' AND lab.UA < 8.0) OR (patient.SEX = 'F' AND lab.UA < 6.5);	thrombosis_prediction
SELECT p.ID, p.sex, p.birthday FROM patients AS p JOIN lab_results AS lr ON p.ID = lr.patient_id WHERE lr.urea_nitrogen = 29;	thrombosis_prediction
SELECT `You ID`, Examination_Date FROM table_name WHERE Diagnosis = 'RA';	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE Sex = 'M' AND CRE >= 1.5	thrombosis_prediction
SELECT (SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END)) AS result FROM Lupus WHERE CRE >= 1.5;	thrombosis_prediction
SELECT Patient_ID, Sex, Birthday FROM Patients WHERE T_BIL = (SELECT MAX(T_BIL) FROM Patients);	thrombosis_prediction
SELECT GROUP_CONCAT(DISTINCT ID) AS Patient_IDs, Sex FROM patient_data WHERE T_BIL >= 2.0 GROUP BY Sex;	thrombosis_prediction
;	thrombosis_prediction
SELECT AVG(JULIANDAY('now') - JULIANDAY(birthday)) FROM patients WHERE sex = 'M' AND `T-CHO` >= 250;	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient_ID) FROM table_name WHERE TG >= 200 AND (strftime('%Y', 'now') - strftime('%Y', Birthday)) > 50;	thrombosis_prediction
;	thrombosis_prediction
SELECT DISTINCT T1.patient_id FROM patient AS T1 JOIN examination AS T2 ON T1.patient_id = T2.patient_id WHERE strftime('%Y', T1.birthday) BETWEEN '1936' AND '1956' AND T1.sex = 'M' AND T2.CPK >= 250;	thrombosis_prediction
SELECT ID, sex, strftime('%Y', 'now') - strftime('%Y', Birthday) AS age FROM patient WHERE GLU >= 180 AND T_CHO < 250;	thrombosis_prediction
SELECT Patient_ID, GLU FROM patient WHERE GLU < 180 AND strftime('%Y', Examination_Date) = '1991';	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
SELECT * FROM patients WHERE Sex = 'F' AND (SUBTRACT(year(current_timestamp), year(Birthday)) >= 50) AND (RBC <= 3.5 OR RBC >= 6.0);	thrombosis_prediction
SELECT ID, Sex FROM [Table_Name] WHERE Admission = '-' AND HBG < 10;	thrombosis_prediction
SELECT ID, Sex FROM lupus WHERE Diagnosis = 'SLE' AND HGB > 10 AND HGB < 17 ORDER BY Birthday ASC LIMIT 1;	thrombosis_prediction
SELECT P.ID, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Patient P JOIN Examination E ON P.ID = E.Patient_ID WHERE P.ID IN (SELECT L.Patient_ID FROM LabTest L WHERE L.HCT >= 52 GROUP BY L.Patient_ID HAVING COUNT(L.Patient_ID) > 2);	thrombosis_prediction
SELECT AVG(HCT) FROM Laboratory_Examinations WHERE Examination_Date LIKE '1991%' AND HCT < 29;	thrombosis_prediction
;	thrombosis_prediction
SELECT * FROM Laboratory_Examinations WHERE strftime('%Y', Examination_Date) = '1984' AND (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', Birthday)) < 50 AND PLT BETWEEN 100 AND 400;	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND T2.PT >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T2.PT >= 14 THEN 1 ELSE 0 END) FROM Patient AS T1 JOIN Examination AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) > 55;	thrombosis_prediction
SELECT * FROM Patient_Information WHERE strftime('%Y', `First Date`) > '1992' AND (`KCT` = 'None' OR `RVVT` = 'None' OR `LAC` = 'None')	thrombosis_prediction
SELECT COUNT(*) FROM lupus WHERE Examination_Date > '1997-01-01' AND (RVVT = 'None' OR RVVT = '-');	thrombosis_prediction
SELECT COUNT(DISTINCT Examination_Date) FROM table_name WHERE (RVVT = '+' OR LAC = '+') AND Thrombosis = 0;	thrombosis_prediction
SELECT DISTINCT T1.Patient_ID FROM `Patient` AS T1 JOIN `Examination` AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T1.Sex = 'M' AND T2.WBC > 3.5 AND T2.WBC < 9.0 AND (T2.FG <= 150 OR T2.FG >= 450);	thrombosis_prediction
SELECT COUNT(DISTINCT T1.Patient_ID) FROM `Patient` AS T1 INNER JOIN `Examination` AS T2 ON T1.Patient_ID = T2.Patient_ID WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450);	thrombosis_prediction
;	thrombosis_prediction
SELECT Identification FROM table_name WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT DISTINCT ID FROM table_name WHERE aCL_IgG >= 2000;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE aCL_IgG > 900 AND aCL_IgG < 2000 AND Symptoms IS NOT NULL;	thrombosis_prediction
SELECT T1.Diagnosis FROM `table_name` AS T1 JOIN `table_name` AS T2 ON T1.You = T2.You WHERE T2.aCL IgA BETWEEN 80 AND 500 ORDER BY T2.aCL IgA DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM patient WHERE `Examination Date` >= '1990-01-01' AND aCL_IgA > 80 AND aCL_IgA < 500;	thrombosis_prediction
SELECT Diagnosis FROM patient_data WHERE aCL_IgM <= 40 OR aCL_IgM >= 400 GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1;	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(DISTINCT `Patient`) FROM table_name WHERE `ANA` IN (0, '0') AND `KCT` = '+'	thrombosis_prediction
SELECT Diagnosis FROM table_name WHERE YEAR(Birthday) >= 1985 AND RA IN ('-', '+-');	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE ANA < 20 AND Thrombosis = '0';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient_ID) FROM Lupus WHERE C3 > 35 AND ANA_Pattern = 'P';	thrombosis_prediction
SELECT `Patient ID` FROM `lupus_dataset` WHERE Hematocrit < 29 OR Hematocrit > 52 ORDER BY `aCL IgA` DESC LIMIT 1;	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient) FROM lupus WHERE RNP IN ('-', '+-') AND Admission = '+'	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(*) FROM lupus WHERE SM IN ('-', '+-') AND Thrombosis = 0;	thrombosis_prediction
SELECT You FROM table_name WHERE SM NOT IN ('negative', '0') ORDER BY Birthday DESC LIMIT 3;	thrombosis_prediction
SELECT Patient_ID FROM AutoimmuneDiseaseDB WHERE Examination_Date > '1997-01-01' AND SC170 IN('negative','0');	thrombosis_prediction
SELECT COUNT(DISTINCT Patient_ID) FROM AutoimmuneDisease WHERE SC170 IN('negative', '0') AND Sex = 'F' AND Symptoms IS NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT *) FROM table_name WHERE Examination_Date < '2000-01-01' AND aSSA IN('-','+-')	thrombosis_prediction
SELECT `identification of the patient` FROM table_name WHERE `ANA Pattern` LIKE '%SSA%' OR `Symptoms` LIKE '%SSA%' ORDER BY `Examination Date` ASC LIMIT 1;	thrombosis_prediction
SELECT COUNT(DISTINCT Patient ID) FROM Examination WHERE Diagnosis = 'SLE';	thrombosis_prediction
SELECT COUNT(DISTINCT Patient) FROM table_name WHERE Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT ID) FROM lupus WHERE CENTROMEA IN ('-', '+-') AND SSB IN ('-', '+-') AND Sex = 'M';	thrombosis_prediction
SELECT Diagnosis FROM table_name WHERE ANA >= 8;	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE aCL_IgG > 900 AND aCL_IgG < 2000;	thrombosis_prediction
SELECT CAST(COUNT(CASE WHEN T2.GOT >= 60 AND T1.Diagnosis = 'SLE' THEN T1.ID END) AS REAL) * 100 / COUNT(CASE WHEN T2.GOT >= 60 THEN T1.ID END) FROM lupus AS T1 JOIN labtest AS T2 ON T1.ID = T2.ID;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE Sex = 'M' AND GOT < 60;	thrombosis_prediction
SELECT MAX(BirthDate) FROM patients WHERE GOT >= 60;	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
SELECT MAX(`Examination Date`) FROM table_name	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE ALP >= 300 AND Admission = '+'	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
SELECT Examination_Date FROM table_name WHERE ALB > 3.5 AND ALB < 5.5 ORDER BY ALB DESC LIMIT 1;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE ALB > 3.5 AND ALB < 5.5 AND TP BETWEEN 6.0 AND 8.5;	thrombosis_prediction
SELECT T1.aCL_IgG, T1.aCL_IgM, T1.aCL_IgA FROM Lupus AS T1 WHERE T1.Sex = 'F' AND T1.UA > 6.50 ORDER BY T1.UA DESC LIMIT 1;	thrombosis_prediction
SELECT MAX(ANA) FROM table_name	thrombosis_prediction
SELECT Samples FROM (SELECT *, ROW_NUMBER() OVER(ORDER BY aCL IgA DESC) AS rn FROM table_name WHERE CRE < 1.5) WHERE rn = 1;	thrombosis_prediction
SELECT COUNT(*) FROM lupus WHERE T_BIL >= 2.0 AND ANA_Pattern LIKE '%P%'	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE `T-CHO` >= 250 AND KCT = '-'	thrombosis_prediction
SELECT COUNT(*) FROM lupus WHERE `T-CHO` < 250 AND `ANA Pattern` = 'P';	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE Symptoms IS NOT NULL;	thrombosis_prediction
SELECT Diagnosis FROM table_name WHERE aCL_IgG < 200 ORDER BY aCL_IgG DESC LIMIT 1	thrombosis_prediction
SELECT Samples FROM table_name WHERE Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(*) FROM lupus WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+');	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE Thrombosis = 0;	thrombosis_prediction
;	thrombosis_prediction
;	thrombosis_prediction
SELECT Patient FROM patient WHERE (RBC <= 3.5 OR RBC >= 6.0) AND Admission = '-'	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE Diagnosis IS NOT NULL AND Symptoms != 'None';	thrombosis_prediction
SELECT PLT FROM lupus WHERE Diagnosis LIKE '%MCTD%' AND PLT > 100 AND PLT < 400;	thrombosis_prediction
;	thrombosis_prediction
SELECT COUNT(*) FROM table_name WHERE Thrombosis IN (1, 2);	thrombosis_prediction
SELECT m.major_name FROM student s JOIN major m ON s.major_id = m.id WHERE s.first_name = 'Angela' AND s.last_name = 'Sanders';	student_club
SELECT COUNT(*) FROM Student_Club AS T1 JOIN Student AS T2 ON T1.student_id = T2.student_id WHERE T2.college = 'College of Engineering';	student_club
SELECT s.first_name, s.last_name FROM student AS s JOIN student_club AS sc ON s.student_id = sc.student_id JOIN department AS d ON d.department_id = s.department_id WHERE d.name = 'Art and Design';	student_club
SELECT COUNT(*) FROM (SELECT s.student_id FROM Student_Event se JOIN Student s ON se.student_id = s.student_id WHERE se.event_id IN (SELECT e.event_id FROM Event e WHERE e.name = 'Women\'s Soccer'))	student_club
SELECT SC.phone FROM Student_Club AS SC JOIN Club AS C ON SC.club_id = C.club_id JOIN Event AS E ON C.club_id = E.club_id JOIN Attendance AS A ON E.event_id = A.event_id WHERE E.notes LIKE '%Women\'s soccer game%' AND A.student_id = SC.student_id;	student_club
SELECT COUNT(*) FROM Student_Club AS sc JOIN event_attendance AS ea ON sc.student_id = ea.student_id WHERE ea.event_name = 'Women\'s Soccer' AND sc.t_shirt_size = 'Medium';	student_club
SELECT e.event_name FROM (SELECT l.event_id, COUNT(l.link_id) AS attendance FROM link_to_event l JOIN student_club s ON l.student_id = s.student_id GROUP BY l.event_id ORDER BY attendance DESC LIMIT 1) subquery JOIN event e ON subquery.event_id = e.event_id;	student_club
SELECT m.college FROM student_club AS sc JOIN club_member AS cm ON sc.club_id = cm.club_id JOIN member AS m ON cm.member_id = m.member_id WHERE sc.position = 'Vice President';	student_club
SELECT e.name FROM event AS e JOIN attendance AS a ON e.id = a.event_id WHERE a.attendee_name = 'Maya Mclean';	student_club
SELECT COUNT(*) FROM Student_Club WHERE strftime('%Y', date) = '2019' AND notes LIKE '%Sacha Harrison%'	student_club
SELECT COUNT(*) FROM (SELECT e.event_id FROM event AS e JOIN student_club_event AS sce ON e.event_id = sce.event_id JOIN student_club AS sc ON sce.student_club_id = sc.student_club_id WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(sce.student_club_id) > 10)	student_club
SELECT e.event_name FROM event AS e JOIN student_event AS se ON e.event_id = se.event_id JOIN event_type AS et ON e.type = et.event_type WHERE et.event_type != 'Fundraiser' GROUP BY e.event_id HAVING COUNT(se.student_id) > 20;	student_club
SELECT CAST(COUNT(event_id) AS REAL) / COUNT(DISTINCT event_name) as average_attendance FROM events WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020';	student_club
SELECT expense_description, MAX(cost) FROM expense WHERE expense_description LIKE '%club event%'	student_club
SELECT COUNT(member_id) FROM Student_Club WHERE major = 'Environmental Engineering';	student_club
SELECT m.first_name, m.last_name FROM attendance AS a JOIN events AS e ON a.event_id = e.id JOIN member_attendance AS ma ON a.id = ma.attendance_id JOIN members AS m ON ma.member_id = m.id WHERE e.name = 'Laugh Out Loud';	student_club
SELECT last_name FROM student WHERE major = 'Law and Constitutional Studies';	student_club
;	student_club
SELECT c.college_name FROM colleges AS c JOIN majors AS m ON c.college_id = m.college_id JOIN majors_taken AS mt ON m.major_id = mt.major_id JOIN students AS s ON s.student_id = mt.student_id WHERE s.first_name = 'Tyler' AND s.last_name = 'Hewitt';	student_club
SELECT cf.amount FROM club_funds AS cf JOIN student_club AS sc ON cf.club_id = sc.club_id WHERE sc.position = 'Vice President';	student_club
SELECT SUM(amount) FROM transactions WHERE category = 'Food' AND event_name = 'September Meeting';	student_club
SELECT T3.city, T3.state FROM student_club AS T1 JOIN person AS T2 ON T1.president = T2.id JOIN zip_code AS T3 ON T2.zip_code = T3.zip_code WHERE T1.club_name = 'Student_Club';	student_club
SELECT m.first_name, m.last_name FROM member AS m JOIN student_club_member AS scm ON m.member_id = scm.member_id JOIN zip_code AS zc ON m.zip_code = zc.zip_code WHERE zc.state = 'Illinois';	student_club
SELECT SUM(e.amount) FROM expense e JOIN event ev ON e.event_id = ev.id WHERE ev.name = 'September Meeting' AND e.category = 'Advertisement';	student_club
SELECT T3.department_name FROM student AS T1 JOIN major AS T2 ON T1.major = T2.major_id JOIN department AS T3 ON T2.department_id = T3.department_id WHERE T1.first_name IN ('Pierce', 'Guidi') GROUP BY T3.department_name HAVING COUNT(*) = 2	student_club
SELECT SUM(amount) FROM budget WHERE event_name = 'October Speaker';	student_club
SELECT e.approved FROM expenses AS e JOIN events AS ev ON e.event_id = ev.id WHERE ev.name = 'October Meeting' AND ev.date_time = '2019-10-08T00:00:00';	student_club
SELECT AVG(T2.amount) FROM member AS T1 JOIN expense AS T2 ON T1.member_id = T2.member_id WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND strftime('%m', T2.expense_date) IN ('09', '10')	student_club
SELECT (SUM(CASE WHEN SUBSTR(T2.event_date, 1, 4) = '2019' THEN T1.spent ELSE 0 END) - SUM(CASE WHEN SUBSTR(T2.event_date, 1, 4) = '2020' THEN T1.spent ELSE 0 END)) AS difference FROM transaction AS T1 JOIN event AS T2 ON T1.event_id = T2.id WHERE T2.club_id IN (SELECT id FROM club WHERE name = 'Student_Club')	student_club
SELECT location FROM event WHERE name = 'Spring Budget Review'	student_club
SELECT e.cost FROM expenses AS e JOIN events AS ev ON e.event_id = ev.id WHERE ev.description = 'Posters' AND ev.event_date = '2019-09-04';	student_club
SELECT remaining FROM budget WHERE amount = (SELECT MAX(amount) FROM budget WHERE category = 'Food') AND category = 'Food';	student_club
SELECT notes FROM events WHERE type = 'Fundraising' AND start_time = '2019-09-14T00:00:00'	student_club
;	student_club
SELECT m.phone_number FROM member AS m JOIN person AS p ON m.person_id = p.id WHERE p.first_name = 'Carlo' AND p.last_name = 'Jacobs';	student_club
SELECT z.county FROM member m JOIN zip_code z ON m.zip_code = z.zip_code WHERE m.first_name = 'Adela' AND m.last_name = 'O\'Gallagher';	student_club
SELECT COUNT(*) FROM event JOIN budget ON event.event_id = budget.event_id WHERE event.name = 'November Meeting' AND budget.remaining < 0;	student_club
SELECT SUM(e.amount) FROM expenses AS e JOIN events AS ev ON e.event_id = ev.id WHERE ev.type = 'Guest Speaker' AND ev.notes LIKE '%September%'	student_club
SELECT e.status FROM `event` AS e JOIN expense AS ex ON e.event_id = ex.event_id WHERE ex.description = 'Post Cards, Posters' AND ex.expense_date = '2019-08-20';	student_club
SELECT m.major_name FROM student s JOIN major m ON s.major_id = m.major_id WHERE s.first_name = 'Brent' AND s.last_name = 'Thomason';	student_club
SELECT COUNT(*) FROM club_members WHERE major = 'Business' AND t_shirt_size = 'Medium';	student_club
;	student_club
SELECT major FROM members WHERE position = 'Vice President';	student_club
SELECT z.state FROM member m JOIN zip_code z ON m.zip_code = z.zip_code WHERE m.first_name || ' ' || m.last_name = 'Sacha Harrison';	student_club
SELECT d.department_name FROM department AS d JOIN student AS s ON d.department_id = s.major JOIN club_member AS cm ON s.student_id = cm.student_id WHERE cm.position = 'President';	student_club
SELECT p.date_received FROM payment AS p JOIN member AS m ON p.member_id = m.member_id WHERE m.first_name = 'Connor' AND m.last_name = 'Hilton' AND p.source = 'Dues';	student_club
SELECT m.first_name, m.last_name FROM members AS m JOIN payments AS p ON m.member_id = p.member_id WHERE p.source = 'Dues' ORDER BY p.received_date ASC LIMIT 1;	student_club
SELECT CASE WHEN (SELECT SUM(amount) FROM budget WHERE category = 'Advertisement' AND event_name = 'Yearly Kickoff') > (SELECT SUM(amount) FROM budget WHERE category = 'Advertisement' AND event_name = 'October Meeting') THEN 1 ELSE 0 END;	student_club
SELECT (SUM(CASE WHEN T2.category = 'Parking' THEN T1.amount ELSE 0 END) / SUM(T1.amount)) * 100 AS percentage FROM budget AS T1 JOIN category AS T2 ON T1.category_id = T2.id WHERE T1.event_name = 'November Speaker'	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza';	student_club
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';	student_club
;	student_club
;	student_club
SELECT e.expense_description FROM expense AS e JOIN budget AS b ON e.budget_id = b.budget_id WHERE b.remaining = (SELECT MIN(remaining) FROM budget);	student_club
SELECT e.*, a.* FROM events AS e JOIN attendance AS a ON e.event_id = a.event_id WHERE e.notes LIKE '%October Meeting%'	student_club
SELECT m2.college, MAX(COUNT(m1.id)) AS max_members FROM member AS m1 JOIN major AS m2 ON m1.major_id = m2.id GROUP BY m2.college ORDER BY max_members DESC LIMIT 1;	student_club
SELECT m.major_name FROM major AS m JOIN student AS s ON m.major_id = s.major_id JOIN phone_number AS pn ON s.student_id = pn.student_id WHERE pn.phone_number = '809-555-3360';	student_club
;	student_club
SELECT e.expense_description FROM expense AS e JOIN club_member AS cm ON e.club_id = cm.club_id WHERE cm.position = 'Vice President';	student_club
SELECT COUNT(*) FROM events WHERE notes LIKE '%Women's soccer%' OR type = 'Game';	student_club
;	student_club
SELECT COUNT(*) FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland';	student_club
SELECT COUNT(*) FROM event_attendance ea JOIN members m ON ea.member_id = m.member_id WHERE m.phone_number = '954-555-6240';	student_club
SELECT m.first_name, m.last_name FROM members AS m JOIN department AS d ON m.department_id = d.id WHERE d.name = 'School of Applied Sciences, Technology and Education';	student_club
SELECT e.event_name, MAX(ee.spent / e.budget) as spend_to_budget_ratio FROM events e JOIN expenses ee ON e.event_name = ee.event_name WHERE e.status = 'Closed' GROUP BY e.event_name ORDER BY spend_to_budget_ratio DESC LIMIT 1;	student_club
SELECT COUNT(*) FROM student_club WHERE position = 'President';	student_club
;	student_club
SELECT COUNT(*) FROM events WHERE type = 'Meeting' AND strftime('%Y', event_date) = '2020';	student_club
SELECT SUM(spent) FROM expenses WHERE category = 'Food';	student_club
SELECT s.first_name, s.last_name FROM student AS s JOIN attendance AS a ON s.student_id = a.student_id GROUP BY s.student_id HAVING COUNT(a.link_to_event) > 7;	student_club
SELECT s.student_name FROM student AS s JOIN attendance AS a ON s.student_id = a.student_id JOIN event AS e ON a.event_id = e.event_id WHERE s.major_name = 'Interior Design' AND e.type = 'Meeting' AND e.notes LIKE '%Community Theater%'	student_club
SELECT s.first_name, s.last_name FROM student AS s JOIN location AS l ON s.location_id = l.id JOIN zip_code AS zc ON l.zip_code = zc.zip_code WHERE zc.city = 'Georgetown' AND zc.state = 'South Carolina';	student_club
;	student_club
SELECT s.first_name, s.last_name FROM student AS s JOIN income AS i ON s.student_id = i.student_id WHERE i.amount > 40;	student_club
SELECT SUM(T2.cost) FROM events AS T1 JOIN expenses AS T2 ON T1.event_id = T2.event_id WHERE T1.name = 'Yearly Kickoff';	student_club
SELECT s.first_name, s.last_name FROM students AS s JOIN events AS e ON s.event_id = e.id WHERE e.name = 'Yearly Kickoff';	student_club
SELECT S.first_name, S.last_name, I.source FROM student AS S JOIN income AS I ON S.student_id = I.student_id GROUP BY S.student_id ORDER BY MAX(I.amount) DESC LIMIT 1;	student_club
SELECT name FROM event WHERE cost = (SELECT MIN(cost) FROM event);	student_club
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) AS REAL) * 100 / SUM(T1.cost) FROM event_cost AS T1 JOIN events AS T2 ON T1.event_id = T2.id;	student_club
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) FROM student;	student_club
SELECT T1.source FROM fund AS T1 JOIN transaction AS T2 ON T1.transaction_id = T2.transaction_id WHERE T2.date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY T1.source ORDER BY SUM(T1.amount) DESC LIMIT 1;	student_club
SELECT p.first_name, p.last_name, p.email_address FROM student_club AS sc JOIN member AS m ON sc.club_id = m.club_id JOIN person AS p ON m.person_id = p.person_id WHERE m.position = 'Secretary';	student_club
SELECT COUNT(*) FROM Student_Club WHERE major_name = 'Physics Teaching';	student_club
SELECT COUNT(T2.member_id) FROM events AS T1 JOIN attendance AS T2 ON T1.event_id = T2.event_id WHERE T1.event_name = 'Community Theater' AND strftime('%Y', T1.event_date) = '2019';	student_club
SELECT COUNT(e.event_id), m.major_name FROM events e JOIN attendees a ON e.event_id = a.event_id JOIN students s ON a.student_id = s.student_id JOIN majors m ON s.major_id = m.major_id WHERE a.attendee_name = 'Luisa Guidi' GROUP BY m.major_name;	student_club
SELECT SUM(e.amount) / COUNT(e.expense_id) AS average_spent_on_food FROM expense e JOIN event ev ON e.event_id = ev.event_id JOIN category c ON e.category_id = c.category_id WHERE c.category_name = 'Food' AND ev.status = 'Closed';	student_club
SELECT e.event_name FROM event AS e JOIN expense AS x ON e.id = x.event_id WHERE x.category = 'Advertisement' ORDER BY x.spent DESC LIMIT 1;	student_club
;	student_club
SELECT CAST(SUM(CASE WHEN T2.type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) FROM event AS T1 JOIN student_club_event AS T2 ON T1.event_id = T2.event_id WHERE strftime('%Y', T1.event_date) = '2019';	student_club
SELECT e.cost FROM expense AS e JOIN event AS ev ON e.event_id = ev.id WHERE ev.name = 'September Speaker' AND e.description = 'Posters';	student_club
SELECT t_shirt_size, COUNT(t_shirt_size) AS size_count FROM member GROUP BY t_shirt_size ORDER BY size_count DESC LIMIT 1;	student_club
SELECT e.event_name FROM event AS e JOIN budget AS b ON e.event_id = b.event_id WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1;	student_club
SELECT e.type AS expense_type, SUM(e.cost) AS total_value FROM expenses AS e JOIN events AS ev ON e.event_id = ev.id WHERE ev.name = 'October Meeting' GROUP BY e.type;	student_club
SELECT b.category, SUM(b.amount) AS total_amount FROM events e JOIN budget b ON e.event_id = b.event_id WHERE e.name = 'April Speaker' GROUP BY b.category ORDER BY total_amount ASC;	student_club
;	student_club
SELECT amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;	student_club
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking';	student_club
SELECT SUM(cost) FROM expenses WHERE expense_date = '2019-08-20';	student_club
SELECT m.first_name, m.last_name, SUM(oi.quantity * pv.price) AS total_cost FROM members m JOIN orders o ON m.member_id = o.member_id JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id JOIN product_variants pv ON oi.variant_id = pv.variant_id WHERE m.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY m.first_name, m.last_name;	student_club
;	student_club
SELECT e.expense_description FROM expense AS e JOIN member AS m ON e.member_id = m.id WHERE m.t_shirt_size = 'X-Large';	student_club
;	student_club
SELECT m.major_name FROM student s JOIN major m ON s.major_id = m.id WHERE s.name = 'Phillip Cullen';	student_club
SELECT T1.position FROM member AS T1 JOIN membership AS T2 ON T1.member_id = T2.member_id WHERE T2.major = 'Business';	student_club
SELECT COUNT(*) FROM members WHERE major_name = 'Business' AND t_shirt_size = 'Medium';	student_club
SELECT T2.type FROM event_budget AS T1 INNER JOIN events AS T2 ON T1.event_id = T2.id INNER JOIN budget AS T3 ON T1.budget_id = T3.id WHERE T3.remaining > 30	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT type FROM events WHERE event_date = '2020-03-24T12:00:00';	student_club
SELECT T1.major_name FROM student AS T1 JOIN student_club_members AS T2 ON T1.student_id = T2.student_id WHERE T2.position = 'Vice President'	student_club
SELECT CAST(SUM(CASE WHEN position = 'Member' AND major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(member_id) FROM members;	student_club
SELECT type FROM event WHERE location = 'MU 215';	student_club
SELECT COUNT(*) FROM income WHERE amount = 50;	student_club
SELECT COUNT(*) FROM members WHERE position = 'Member' AND t_shirt_size = 'X-Large';	student_club
;	student_club
SELECT m.last_name, d.name AS department_name, c.name AS college_name FROM member AS m JOIN major AS mj ON m.major_id = mj.id JOIN department AS d ON mj.department_id = d.id JOIN college AS c ON d.college_id = c.id WHERE mj.major_name = 'Environmental Engineering';	student_club
SELECT eb.category FROM event_budget AS eb JOIN events AS e ON eb.event_id = e.id WHERE e.location = 'MU 215' AND e.type = 'Guest Speaker' AND eb.spent = 0;	student_club
SELECT T3.city, T3.state FROM member AS T1 JOIN department AS T2 ON T1.department_id = T2.department_id JOIN zip_code AS T3 ON T2.location_zip_code = T3.zip_code WHERE T1.position = 'Member' AND T2.name = 'Electrical and Computer Engineering Department';	student_club
SELECT T3.event_name FROM club AS T1 JOIN member_of_club AS T2 ON T1.club_id = T2.club_id JOIN event AS T3 ON T3.club_id = T1.club_id WHERE T1.location = '900 E. Washington St.' AND T2.position = 'Vice President' AND T3.type = 'Social';	student_club
SELECT m.last_name, m.position FROM expense AS e JOIN member AS m ON e.member_id = m.member_id WHERE e.expense_description = 'Pizza' AND e.expense_date = '2019-09-10';	student_club
SELECT m.last_name FROM members AS m JOIN attendance AS a ON m.member_id = a.member_id JOIN events AS e ON a.event_id = e.event_id WHERE m.position = 'Member' AND e.type = 'Game' AND e.notes LIKE '%Women's soccer%'	student_club
SELECT CAST(COUNT(CASE WHEN T2.amount = 50 THEN T1.member_id END) AS REAL) * 100 / COUNT(T1.member_id) FROM member AS T1 JOIN transaction AS T2 ON T1.member_id = T2.member_id WHERE T1.position = 'Member' AND T1.t_shirt_size = 'Medium';	student_club
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box';	student_club
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico';	student_club
SELECT event_name FROM events WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15T00:00:00' AND '2020-03-20T23:59:59';	student_club
SELECT e.link FROM event AS e JOIN event_member AS em ON e.event_id = em.event_id JOIN (SELECT m.member_id, p.cost FROM member AS m JOIN payment AS p ON m.member_id = p.member_id) AS mp ON em.member_id = mp.member_id WHERE mp.cost > 50;	student_club
SELECT m.member_id, m.first_name, m.last_name, e.event_id AS 'link_to_event' FROM member m JOIN expense e ON m.member_id = e.member_id JOIN attendance a ON e.event_id = a.event_id WHERE m.approved = 'true' AND e.expense_date BETWEEN '2019-01-10' AND '2019-11-19';	student_club
SELECT T1.college FROM student AS T1 JOIN student_major_link AS T2 ON T1.student_id = T2.student_id JOIN major AS T3 ON T3.major_id = T2.major_id WHERE T1.first_name = 'Katy' AND T3.link = 'rec1N0upiVLy5esTO';	student_club
SELECT m.phone FROM member AS m JOIN college_member AS cm ON m.member_id = cm.member_id JOIN college AS c ON cm.college_id = c.college_id WHERE m.major_name = 'Business' AND c.college_name = 'College of Agriculture and Applied Sciences';	student_club
SELECT person.email FROM person JOIN membership ON person.id = membership.person_id JOIN expense ON membership.id = expense.membership_id WHERE expense.cost > 20 AND expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19';	student_club
SELECT COUNT(*) FROM member WHERE position = 'Member' AND major = 'education';	student_club
;	student_club
SELECT id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';	student_club
;	student_club
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large';	student_club
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code;	student_club
SELECT e.event_name, e.location FROM event AS e JOIN budget AS b ON e.event_id = b.event_id WHERE b.remaining > 0;	student_club
SELECT e.event_name, e.event_date FROM event AS e INNER JOIN expense AS ex ON e.event_id = ex.event_id WHERE ex.expense_description = 'Pizza' AND ex.cost > 50 AND ex.cost < 100;	student_club
SELECT m.first_name, m.last_name, ma.major_name FROM member AS m JOIN major AS ma ON m.major_id = ma.id JOIN expense AS e ON m.member_id = e.member_id WHERE e.cost > 100;	student_club
SELECT T3.city, T3.county FROM event_income AS T1 JOIN events AS T2 ON T1.event_id = T2.id JOIN zip_code AS T3 ON T3.zip_code = (SELECT SUBSTR(T2.location, -5) WHERE T2.location LIKE '% %') WHERE T1.income > 40;	student_club
SELECT m.member_name, SUM(e.cost) AS total_cost FROM expense e JOIN member m ON e.member_id = m.member_id GROUP BY e.member_id HAVING COUNT(e.event_id) > 1 ORDER BY total_cost DESC LIMIT 1;	student_club
SELECT AVG(cost) FROM student WHERE position != 'Member';	student_club
SELECT event_name FROM events WHERE cost < (SELECT AVG(cost) FROM events WHERE category = 'Parking')	student_club
;	student_club
SELECT MAX(cost) FROM expenses WHERE expense_description = 'Water, chips, cookies';	student_club
;	student_club
SELECT m.first_name, m.last_name, m.phone FROM member AS m INNER JOIN payment AS p ON m.member_id = p.member_id INNER JOIN expense AS e ON p.expense_id = e.expense_id WHERE e.cost > (SELECT AVG(cost) FROM expense);	student_club
SELECT (SUM(CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END) * 100 / COUNT(T1.member_id)) - (SUM(CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END) * 100 / COUNT(T1.member_id)) AS percentage_difference FROM member AS T1 JOIN address AS T2 ON T1.address_id = T2.address_id WHERE T1.position = 'Member';	student_club
SELECT student.major, department.department_name FROM students AS student JOIN majors AS major ON student.major_id = major.id JOIN departments AS department ON major.department_id = department.id WHERE student.name = 'Garrett Gerke';	student_club
SELECT m.first_name, m.last_name, e.cost FROM member AS m JOIN expense AS e ON m.member_id = e.member_id JOIN expense_description AS ed ON e.expense_description_id = ed.expense_description_id WHERE ed.description = 'Water, Veggie tray, supplies';	student_club
SELECT s.last_name, s.phone FROM student AS s JOIN major AS m ON s.major_id = m.id WHERE m.name = 'Elementary Education';	student_club
;	student_club
SELECT * FROM event WHERE notes LIKE '%food%'	student_club
SELECT S.first_name, S.last_name, T.amount FROM student AS S JOIN fund AS F ON S.student_id = F.student_id JOIN transaction AS T ON F.fund_id = T.fund_id WHERE T.date_received = '2019-09-09';	student_club
SELECT budget_category FROM expenses WHERE description = 'Posters';	student_club
SELECT p.first_name, p.last_name, c.college FROM club_member AS cm JOIN person AS p ON cm.member_id = p.id JOIN club AS c ON cm.club_id = c.id WHERE cm.position = 'Secretary';	student_club
SELECT SUM(amount) AS total_spent, event_name FROM expenses WHERE category = 'Speaker Gifts' GROUP BY event_name;	student_club
;	student_club
SELECT s.first_name, s.last_name, so.position FROM students AS s JOIN addresses AS a ON s.address_id = a.address_id LEFT JOIN student_officer_years AS so ON s.student_id = so.student_id WHERE a.city = 'Lincolnton' AND a.state = 'North Carolina' AND a.zip_code = 28092;	student_club
SELECT COUNT(GasStationID) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS Ratio FROM customers;	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND SUBSTR(y.Date, 1, 4) BETWEEN '201201' AND '201212' GROUP BY c.CustomerID, c.Segment ORDER BY SUM(y.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT AVG(CAST(SUM(Consumption) AS REAL) / 12) FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Segment = 'SME' AND SUBSTR(yearmonth.Date, 1, 4) BETWEEN '2013' AND '2013';	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'CZK' AND strftime('%Y%m', t.Date) BETWEEN '201101' AND '201112' GROUP BY c.CustomerID ORDER BY ym.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers AS c JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID WHERE c.Segment = 'KAM' AND ym.Consumption < 30000 AND ym.Date BETWEEN '201201' AND '201212';	debit_card_specializing
SELECT (SUM(CASE WHEN T1.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN T2.Consumption ELSE 0 END)) AS Consumption_Difference FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE SUBSTR(T2.Date, 1, 4) = '2012'	debit_card_specializing
SELECT strftime('%Y', T3.Date) AS Year, SUM(T3.Consumption) AS TotalConsumption FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN yearmonth AS T3 ON T1.CustomerID = T3.CustomerID WHERE T2.Currency = 'EUR' GROUP BY strftime('%Y', T3.Date) ORDER BY TotalConsumption DESC LIMIT 1	debit_card_specializing
SELECT c.Segment, SUM(y.Consumption) as TotalConsumption FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID JOIN gasstations g ON g.ChainID = c.CustomerID GROUP BY c.Segment ORDER BY TotalConsumption ASC LIMIT 1	debit_card_specializing
SELECT substr(T2.Date, 1, 4) AS Year, SUM(T2.Consumption) AS TotalConsumption FROM transactions_1k AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'CZK' GROUP BY Year ORDER BY TotalConsumption DESC LIMIT 1;	debit_card_specializing
SELECT T2.Date FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312' GROUP BY SUBSTR(T2.Date, 5, 2) ORDER BY T2.Consumption DESC LIMIT 1;	debit_card_specializing
WITH LowestConsumption AS (SELECT Segment, MIN(SUM(Consumption)) AS MinConsumption FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE SUBSTR(Date, 1, 4) = '2013' GROUP BY Segment), AnnualAverage AS (SELECT Segment, SUM(Consumption) / COUNT(CASE WHEN Consumption = (SELECT MinConsumption FROM LowestConsumption WHERE Segment = c.Segment) THEN CustomerID END) AS AnnualAvgConsumption FROM yearmonth JOIN customers c ON yearmonth.CustomerID = c.CustomerID WHERE SUBSTR(Date, 1, 4) = '2013' GROUP BY Segment) SELECT AVG(CASE WHEN Segment = 'SME' THEN AnnualAvgConsumption ELSE NULL END) - AVG(CASE WHEN Segment = 'LAM' THEN AnnualAvgConsumption ELSE NULL END) AS SME_LAM_Diff, AVG(CASE WHEN Segment = 'LAM' THEN AnnualAvgConsumption ELSE NULL END) - AVG(CASE WHEN Segment = 'KAM' THEN AnnualAvgConsumption ELSE NULL END) AS LAM_KAM_Diff, AVG(CASE WHEN Segment = 'KAM' THEN AnnualAvgConsumption ELSE NULL END) - AVG(CASE WHEN Segment = 'SME' THEN AnnualAvgConsumption ELSE NULL END) AS KAM_SME_Diff FROM AnnualAverage;	debit_card_specializing
WITH Consumption_2012 AS (SELECT c.Segment, SUM(y.Consumption) AS Total_Consumption_2012 FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2012' GROUP BY c.Segment), Consumption_2013 AS (SELECT c.Segment, SUM(y.Consumption) AS Total_Consumption_2013 FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE SUBSTR(y.Date, 1, 4) = '2013' GROUP BY c.Segment), Combined_Consumption AS (SELECT C2012.Segment, C2012.Total_Consumption_2012, C2013.Total_Consumption_2013 FROM Consumption_2012 C2012 JOIN Consumption_2013 C2013 ON C2012.Segment = C2013.Segment) SELECT Segment, (Total_Consumption_2013 - Total_Consumption_2012) AS Increase, ((Total_Consumption_2013 - Total_Consumption_2012) / Total_Consumption_2013 * 100) AS Percentage_Increase FROM Combined_Consumption ORDER BY Percentage_Increase DESC LIMIT 1 UNION ALL SELECT Segment, (Total_Consumption_2013 - Total_Consumption_2012) AS Increase, ((Total_Consumption_2013 - Total_Consumption_2012) / Total_Consumption_2013 * 100) AS Percentage_Increase FROM Combined_Consumption ORDER BY Percentage_Increase ASC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption) FROM yearmonth AS y JOIN transactions_1k AS t ON y.CustomerID = t.CustomerID WHERE y.Date BETWEEN '201308' AND '201311' AND t.CustomerID = 6;	debit_card_specializing
SELECT (SELECT COUNT(GasStationID) FROM gasstations WHERE Segment = 'Discount' AND Country = 'CZE') - (SELECT COUNT(GasStationID) FROM gasstations WHERE Segment = 'Discount' AND Country = 'SVK')	debit_card_specializing
SELECT (SELECT Consumption FROM yearmonth WHERE CustomerID = 7 AND Date = '201304') - (SELECT Consumption FROM yearmonth WHERE CustomerID = 5 AND Date = '201304')	debit_card_specializing
SELECT (SELECT COUNT(DISTINCT t.CustomerID) FROM transactions_1k AS t JOIN customers AS c ON t.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND c.Currency = 'CZK') - (SELECT COUNT(DISTINCT t.CustomerID) FROM transactions_1k AS t JOIN customers AS c ON t.CustomerID = c.CustomerID WHERE c.Segment = 'SME' AND c.Currency = 'EUR') AS difference;	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM' AND c.Currency = 'EUR' AND y.Date = '201310' ORDER BY y.Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID, MAX(y.Consumption) AS MaxConsumption FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' GROUP BY c.CustomerID ORDER BY MaxConsumption DESC LIMIT 1;	debit_card_specializing
SELECT SUM(y.Consumption) FROM customers c JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'KAM' AND y.Date = '201305';	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM';	debit_card_specializing
SELECT Country, COUNT(*) AS Total_Gas_Stations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM';	debit_card_specializing
SELECT CAST(COUNT(*) FILTER (WHERE T1.Consumption > 528.3) AS REAL) * 100 / COUNT(T1.CustomerID) FROM yearmonth AS T1 WHERE SUBSTR(T1.Date, 1, 6) = '201202'	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.GasStationID) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK';	debit_card_specializing
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT c.Segment FROM customers AS c JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE y.Date = '201309' GROUP BY c.Segment ORDER BY SUM(y.Consumption) ASC LIMIT 1;	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE y.Date = '201206' AND c.Segment = 'SME' ORDER BY y.Consumption ASC LIMIT 1;	debit_card_specializing
SELECT Date, Consumption FROM yearmonth WHERE Date LIKE '2012%' ORDER BY Consumption DESC LIMIT 1;	debit_card_specializing
SELECT MAX(T3.Consumption / 12) AS biggest_monthly_consumption FROM (SELECT T1.CustomerID FROM customers AS T1 WHERE T1.Currency = 'EUR') AS T2 JOIN yearmonth AS T3 ON T2.CustomerID = T3.CustomerID;	debit_card_specializing
SELECT T3.Description FROM (SELECT * FROM yearmonth WHERE Date LIKE '201309%') AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID JOIN products AS T3 ON T2.ProductID = T3.ProductID	debit_card_specializing
SELECT DISTINCT T3.Country FROM `transactions_1k` AS T1 JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE strftime('%Y-%m', T1.Date) = '2013-06'	debit_card_specializing
SELECT DISTINCT T3.ChainID FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.Currency = 'EUR'	debit_card_specializing
SELECT p.Description FROM products AS p JOIN transactions_1k AS t ON p.ProductID = t.ProductID JOIN customers AS c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR';	debit_card_specializing
SELECT AVG(TotalPrice) FROM (SELECT Amount * Price AS TotalPrice FROM transactions_1k WHERE Date LIKE '2012-01-%') AS SubQuery	debit_card_specializing
SELECT COUNT(DISTINCT c.CustomerID) FROM customers AS c JOIN yearmonth AS ym ON c.CustomerID = ym.CustomerID WHERE c.Currency = 'EUR' AND ym.Consumption > 1000;	debit_card_specializing
SELECT T3.Description FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID JOIN products AS T3 ON T1.ProductID = T3.ProductID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT DISTINCT T1.Time FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.ChainID = 11;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000;	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Date > '2012-01-01';	debit_card_specializing
SELECT AVG(T1.Amount * T1.Price) AS AverageTotalPrice FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT AVG(T2.Price * T2.Amount) FROM customers AS T1 JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR'	debit_card_specializing
SELECT c.CustomerID FROM customers AS c JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-25' GROUP BY c.CustomerID ORDER BY SUM(t.Amount * t.Price) DESC LIMIT 1;	debit_card_specializing
SELECT g.Country FROM `transactions_1k` t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE t.Date = '2012-08-25' ORDER BY t.TransactionID LIMIT 1;	debit_card_specializing
SELECT c.Currency FROM customers AS c JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00';	debit_card_specializing
SELECT c.Segment FROM customers AS c JOIN transactions_1k AS t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-23' AND t.Time = '21:20:00';	debit_card_specializing
SELECT COUNT(T1.TransactionID) FROM transactions_1k AS T1 JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-26' AND T1.Time < '13:00:00' AND T2.Currency = 'CZK'	debit_card_specializing
SELECT c.Segment FROM customers AS c JOIN (SELECT CustomerID, MIN(Date) AS EarliestDate FROM transactions_1k GROUP BY CustomerID) AS t ON c.CustomerID = t.CustomerID	debit_card_specializing
SELECT T2.Country FROM `transactions_1k` AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'	debit_card_specializing
SELECT T1.ProductID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'	debit_card_specializing
SELECT y.Date, y.Consumption FROM transactions_1k AS t JOIN customers AS c ON t.CustomerID = c.CustomerID JOIN yearmonth AS y ON t.CustomerID = y.CustomerID WHERE t.Price = 124.05 AND strftime('%Y-%m-%d', t.Date) = '2012-08-24' AND y.Date LIKE '201201%'	debit_card_specializing
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Date = '2012-08-26' AND transactions_1k.Time BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE';	debit_card_specializing
SELECT c.Currency FROM customers AS c JOIN (SELECT t.CustomerID FROM transactions_1k AS t JOIN yearmonth AS y ON t.CustomerID = y.CustomerID WHERE strftime('%Y%m', t.Date) = '201306' AND (t.Amount * t.Price) = 214582.17) AS subquery ON c.CustomerID = subquery.CustomerID	debit_card_specializing
SELECT T2.Country FROM transactions_1k AS T1 JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467;	debit_card_specializing
SELECT c.Currency FROM transactions_1k t JOIN customers c ON t.CustomerID = c.CustomerID WHERE t.Date = '2012-08-24' AND t.Amount * t.Price = 548.4;	debit_card_specializing
SELECT CAST(COUNT(DISTINCT T1.CustomerID) AS REAL) * 100 / (SELECT COUNT(DISTINCT CustomerID) FROM customers) FROM transactions_1k AS T2 JOIN customers AS T1 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '2012-08-25' AND T1.Currency = 'EUR'	debit_card_specializing
WITH CustomerID AS (SELECT t.CustomerID FROM transactions_1k t WHERE t.Price = 634.8 AND t.Date = '2012-08-25'), Consumption2012 AS (SELECT y.Consumption FROM yearmonth y JOIN CustomerID c ON y.CustomerID = c.CustomerID WHERE strftime('%Y', y.Date) = '2012'), Consumption2013 AS (SELECT y.Consumption FROM yearmonth y JOIN CustomerID c ON y.CustomerID = c.CustomerID WHERE strftime('%Y', y.Date) = '2013') SELECT (c2012.Consumption - c2013.Consumption) / c2012.Consumption AS ConsumptionDecreaseRate FROM Consumption2012 c2012, Consumption2013 c2013;	debit_card_specializing
SELECT gs.GasStationID, gs.ChainID, SUM(t.Amount * t.Price) AS TotalRevenue FROM transactions_1k t JOIN gasstations gs ON t.GasStationID = gs.GasStationID GROUP BY gs.GasStationID ORDER BY TotalRevenue DESC LIMIT 1;	debit_card_specializing
SELECT CAST(SUM(CASE WHEN T2.Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.GasStationID) FROM gasstations AS T1 JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'SVK';	debit_card_specializing
SELECT SUM(t.Amount * t.Price) AS TotalSpent FROM transactions_1k AS t WHERE t.CustomerID = '38508' AND strftime('%Y-%m', t.Date) = '2012-01';	debit_card_specializing
SELECT p.Description AS ProductName, SUM(t.Amount * t.Price) AS TotalSales FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID GROUP BY t.ProductID ORDER BY TotalSales DESC LIMIT 5;	debit_card_specializing
SELECT c1.CustomerID, SUM(t.Price * t.Amount) AS Total_Spent, (SUM(t.Price * t.Amount) / SUM(t.Amount)) AS Average_Price_Per_Item, c2.Currency FROM transactions_1k AS t JOIN customers AS c1 ON t.CustomerID = c1.CustomerID JOIN customers AS c2 ON t.CustomerID = c2.CustomerID GROUP BY t.CustomerID ORDER BY Total_Spent DESC LIMIT 1;	debit_card_specializing
SELECT T3.Country FROM transactions_1k AS T1 JOIN products AS T2 ON T1.ProductID = T2.ProductID JOIN gasstations AS T3 ON T1.GasStationID = T3.GasStationID WHERE T2.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1;	debit_card_specializing
SELECT y.Consumption FROM transactions_1k t JOIN products p ON t.ProductID = p.ProductID JOIN customers c ON t.CustomerID = c.CustomerID JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE p.ProductID = 5 AND (t.Price / t.Amount) > 29.00 AND strftime('%Y-%m', t.Date) = '2012-08' AND y.Date = '201208';	debit_card_specializing
