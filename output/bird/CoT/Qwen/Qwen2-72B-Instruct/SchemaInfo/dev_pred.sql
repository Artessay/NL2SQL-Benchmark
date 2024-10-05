SELECT MAX(CAST(FreeMealCountK12 AS REAL) / EnrollmentK12) as highest_eligible_free_rate FROM schools WHERE county = 'Alameda';
SELECT ('Free Meal Count (Ages 5-17)') / ('Enrollment (Ages 5-17)') AS eligible_free_rate FROM schools WHERE SchoolType = 'Continuation' ORDER BY eligible_free_rate ASC LIMIT 3;
SELECT Zip FROM fprm WHERE `Charter School (Y/N)` = 1 AND `County Name` = 'Fresno County Office of Education';
SELECT s.MailingStreet FROM schools AS s JOIN enrollments AS e ON s.SchoolID = e.SchoolID WHERE e.Grade BETWEEN 'K' AND '12' ORDER BY e.FRPM DESC LIMIT 1;
SELECT Phone FROM frpm WHERE `Charter School (Y/N)` = 1 AND OpenDate > '2000-01-01';
SELECT COUNT(*) FROM Schools WHERE SATMathAvgScore > 400 AND Virtual = 'F';
SELECT * FROM schools WHERE SAT > 500 AND Magnet = 1;
SELECT S.Phone FROM Schools AS S JOIN Scores AS SC ON S.SchoolID = SC.SchoolID WHERE SC.SAT > 1500 GROUP BY S.SchoolID ORDER BY SUM(SC.TestTakers) DESC LIMIT 1;

SELECT COUNT(*) FROM Schools WHERE SATMathAvg > 560 AND FundingType = 'Directly Charter-Funded';
SELECT T3.FRPM_5_17 FROM Schools AS T1 JOIN SAT_Scores AS T2 ON T1.SchoolID = T2.SchoolID JOIN FRPM_Count AS T3 ON T1.SchoolID = T3.SchoolID WHERE T2.TestType = 'SAT' GROUP BY T1.SchoolID ORDER BY AVG(T2.Reading) DESC LIMIT 1;
SELECT SchoolCode FROM Schools WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS highest_eligible_free_rate FROM Schools WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;
SELECT T2.Phone FROM School AS T1 JOIN Contact AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.SATSchoolID IS NOT NULL ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3;
SELECT NCESID FROM Schools ORDER BY Enrollment DESC LIMIT 5;
SELECT d.district_name, AVG(s.reading_score) AS avg_reading_score FROM districts d JOIN schools sc ON d.district_id = sc.district_id JOIN scores s ON sc.school_id = s.school_id WHERE d.active = 1 GROUP BY d.district_id ORDER BY avg_reading_score DESC LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE County = 'Alameda' AND NumTestTakers < 100;
SELECT CharterNo, AVG(WritingScore) AS AvgWritingScore FROM Schools WHERE WritingScore > 499 AND CharterNo IS NOT NULL GROUP BY CharterNo ORDER BY AvgWritingScore DESC;
SELECT COUNT(*) FROM Schools WHERE City = 'Fresno' AND FundingType = 'Directly Funded' AND TestTakers <= 250;
SELECT S.Phone FROM Schools AS S JOIN TestScores AS TS ON S.SchoolID = TS.SchoolID GROUP BY TS.SchoolID ORDER BY AVG(TS.MathScore) DESC LIMIT 1
SELECT COUNT(*) FROM Schools WHERE CountyCode = '003' AND LowGrade = 9 AND HighGrade = 12;
SELECT COUNT(*) FROM Schools WHERE CityName = 'Los Angeles' AND FreeMeals BETWEEN 500 AND 700;

SELECT SchoolName, StreetAddress FROM Schools WHERE ABS(EnrollmentK_12 - EnrollmentAges5_17) > 30;
SELECT S.SchoolName FROM Schools AS S JOIN TestScores AS T ON S.SchoolID = T.SchoolID WHERE (S.FreeMealCountK12 / S.TotalEnrollmentK12) > 0.1 AND T.TestScore >= 1500;
SELECT s.FundingType FROM schools AS s JOIN test_scores AS ts ON s.SchoolID = ts.SchoolID WHERE s.CountyName = 'Riverside' GROUP BY s.SchoolID HAVING AVG(ts.AvgMathScore) > 400;
SELECT SchoolName, Street, City, State, ZipCode FROM Schools WHERE County = 'Monterey' AND FreeReducedMeals_15_17 > 800;
SELECT SchoolName, AVG(WritingScore) AS AverageWritingScore, Phone FROM Schools WHERE (OpenDate > '1991-01-01' OR CloseDate < '2000-01-01') GROUP BY SchoolName;
SELECT SchoolName, DOCType FROM Schools WHERE (Enrollment_K_12 - Enrollment_Ages_5_17) > (SELECT AVG(Enrollment_K_12 - Enrollment_Ages_5_17) FROM Schools) AND Funding = 'Local';
SELECT OpenDate FROM Schools WHERE Grades = 'K-12' ORDER BY Enrollment DESC LIMIT 1;
SELECT CityName FROM Schools ORDER BY EnrollKto12 ASC LIMIT 5;
SELECT T1.SchoolName, (T1."Free Meal Count (K-12)" / T1."Enrollment (K-12)") AS eligible_free_rate FROM School AS T1 ORDER BY T1."Enrollment (K-12)" DESC LIMIT 2 OFFSET 9;
SELECT SchoolName, FRPMEligibleCountK_12 / EnrollmentK_12 AS EligibleFreeReducedMealRate FROM Schools WHERE Grades = 'K-12' AND OwnershipCode = 66 ORDER BY EligibleFreeReducedMealRate DESC LIMIT 5;
SELECT SchoolName, Website FROM Schools WHERE FreeMealCount BETWEEN 1900 AND 2000;
SELECT CAST(T2.FreeMealCount_5_17 AS REAL) / T2.Enrollment_5_17 FROM SchoolAdmins AS T1 JOIN SchoolDemographics AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson'
SELECT frm.AdmEmail1 FROM frm JOIN sch ON frm.SchoolID = sch.SchoolID WHERE sch."Charter School (Y/N)" = 'Y' ORDER BY sch."Enrollment (K-12)" ASC LIMIT 1;
SELECT A.AdmFName1 || ' ' || A.AdmLName1 AS Full_Name FROM (SELECT * FROM Schools WHERE NumGE1500 = (SELECT MAX(NumGE1500) FROM Schools)) S JOIN Admins A ON S.SchoolID = A.SchoolID;
SELECT Street, City, Zip, State FROM Schools WHERE NumTstTakr > 0 ORDER BY CAST(NumGE1500 AS REAL) / NumTstTakr LIMIT 1;
SELECT WebPage FROM Schools WHERE CountyCode = 'Los Angeles' AND CAST(REPLACE(TestTakers, ',', '') AS REAL) BETWEEN 2000 AND 3000;
SELECT AVG(T2.TestTakers) FROM Schools AS T1 JOIN TestTakers AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.City = 'Fresno' AND strftime('%Y', T1.OpenDate) = '1980';
SELECT T1.Telephone FROM schools AS T1 JOIN scores AS T2 ON T1.SchoolID = T2.SchoolID WHERE T1.DistrictName = 'Fresno Unified' ORDER BY AVG(T2.ReadingScore) ASC LIMIT 1;
SELECT Name FROM (SELECT Name, County, AVG(ReadingScore) AS avg_reading_score, ROW_NUMBER() OVER (PARTITION BY County ORDER BY AVG(ReadingScore) DESC) AS rank FROM Schools WHERE Virtual = 'F' GROUP BY Name, County) WHERE rank <= 5;
SELECT s.TypeOfEducation FROM schools AS s JOIN (SELECT SchoolID, AVG(MathScore) AS AvgMathScore FROM scores GROUP BY SchoolID ORDER BY AvgMathScore DESC LIMIT 1) AS t ON s.SchoolID = t.SchoolID
SELECT T2.CountyName, MIN(T1.AvgScrMath + T1.AvgScrRead + T1.AvgScrWrite) AS lowest_avg_score FROM Schools AS T1 JOIN Districts AS T2 ON T1.DCode = T2.DCode GROUP BY T1.SchoolID ORDER BY lowest_avg_score ASC LIMIT 1;
SELECT T2.City, AVG(T1.Writing) FROM (SELECT SchoolID, COUNT(*) AS num_test_takers FROM SAT WHERE Total >= 1500 GROUP BY SchoolID ORDER BY num_test_takers DESC LIMIT 1) AS T1 JOIN Schools AS T2 ON T1.SchoolID = T2.SchId;
SELECT s.SchoolName, AVG(sc.WritingScore) AS AvgWritingScore FROM schools s JOIN administrators a ON s.AdministratorID = a.AdministratorID JOIN scores sc ON s.SchoolID = sc.SchoolID WHERE a.AdmFName1 = 'Ricci' AND a.AdmLName1 = 'Ulrich' GROUP BY s.SchoolName;
SELECT SchoolName FROM Schools WHERE DOC = 31 AND Grades = 'K-12' ORDER BY Enrollees DESC LIMIT 1;
SELECT CAST(COUNT(*) AS REAL) / 12 FROM Schools WHERE OpenYr = 1980 AND CountyCode = 'Alameda' AND DOC = 52;
SELECT CAST(COUNT(CASE WHEN DOC = 54 THEN SchoolID ELSE NULL END) AS REAL) / COUNT(CASE WHEN DOC = 52 THEN SchoolID ELSE NULL END) AS ratio FROM Schools WHERE CountyCode = 'Orange';
SELECT D.CountyName AS County, S.SchoolName AS School_Name, S.ClosedDate AS Closure_Date FROM Schools AS S JOIN Districts AS D ON S.district_id = D.DistrictID WHERE S.StatusType = 'Closed' GROUP BY D.CountyName ORDER BY COUNT(S.SchoolID) DESC LIMIT 1;
SELECT S.PostalStreetAddress FROM (SELECT SchoolID FROM Scores ORDER BY MathAverage DESC LIMIT 1 OFFSET 6) AS T JOIN Schools AS S ON T.SchoolID = S.SchoolID;
SELECT A.MailingStreetAddress1, S.SchoolName FROM Schools AS S JOIN TestScores AS TS ON S.SchoolID = TS.SchoolID JOIN Addresses AS A ON S.SchoolID = A.SchoolID WHERE TS.Subject = 'Reading' GROUP BY S.SchoolID ORDER BY AVG(TS.Score) ASC LIMIT 1;
SELECT COUNT(*) FROM Schools WHERE MailingCity = 'Lakeport' AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500;
SELECT SUM(NumTestTakers) FROM Schools WHERE MailingCity = 'Fresno';
SELECT SchoolName, MailingZip FROM Schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian' OR AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian' OR AdmFName3 = 'Avetik' AND AdmLName3 = 'Atoian';
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) AS ratio FROM Schools WHERE MailingStateAddr = 'CA'
SELECT COUNT(*) FROM schools WHERE MailingStateAddress = 'CA' AND CityName = 'San Joaquin' AND Status = 'Active';
SELECT T1.PhoneNumber, T1.Extension FROM Schools AS T1 JOIN Scores AS T2 ON T1.SchoolID = T2.SchoolID ORDER BY T2.AvgWritingScore DESC LIMIT 1 OFFSET 332;
SELECT SchoolName, Phone FROM schools WHERE SchoolZip = '95203-3704';
SELECT Website FROM schools WHERE AdmFName1 IN ('Mike', 'Dante') AND AdmLName1 IN ('Larson', 'Alvarez');
SELECT s.Website FROM schools AS s JOIN Location AS l ON s.SchoolID = l.SchoolID WHERE s.Virtual = 'P' AND s.Charter = 1 AND l.County = 'San Joaquin';
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1;
SELECT COUNT(*) FROM Schools WHERE CountyName = 'Los Angeles' AND Charter = 0 AND (FreeMealCountK12 * 100.0 / EnrollmentK12) < 0.18;
SELECT s.SchoolName, s.City, a.AdmFName1, a.AdmLName1, a.AdmFName2, a.AdmLName2, a.AdmFName3, a.AdmLName3 FROM schools AS s JOIN administrators AS a ON s.ID = a.SchoolID WHERE s.Charter = 1 AND s.CharNum = '00D2';

SELECT CAST(COUNT(CASE WHEN FundingType = 'Local' THEN SchoolID ELSE NULL END) AS REAL) / COUNT(SchoolID) * 100 AS Ratio_Percentage FROM Schools WHERE County = 'Santa Clara';
SELECT COUNT(*) FROM Schools WHERE OpenDate BETWEEN '2000-01-01' AND '2005-12-31' AND CountyName = 'Stanislaus' AND FundingType = 'Directly Funded';

SELECT CountyName, COUNT(*) AS school_count FROM Schools WHERE SOC = '11' AND ClosureYear BETWEEN '1980' AND '1989' GROUP BY CountyName ORDER BY school_count DESC LIMIT 1;
SELECT NCES_District_ID FROM schools WHERE SOC = '31';
SELECT COUNT(*) FROM Schools WHERE SchStatus IN ('Active', 'Closed') AND SchType = 'District Community Day School' AND CountyName = 'Alpine';
SELECT district_code FROM schools WHERE magnet = 0 AND city = 'Fresno';
SELECT StudentCount FROM Schools WHERE EdOpsCode = 'SSS' AND City = 'Fremont' AND AcademicYear = '2014-2015';
SELECT Free_Reduced_Meal_Count_5_17 FROM Schools WHERE MailingStreetAddress = 'PO Box 1040';
SELECT LowGrade FROM schools WHERE NCES_SchDist_ID = '0613360' AND EdOpsCode = 'SPECON';
SELECT T1.EduLevelName, T2.SchoolName FROM EducationLevels AS T1 JOIN Schools AS T2 ON T1.EduLevelID = T2.EduLevelID WHERE T2.BreakfastProvision = 'Breakfast Provision 2' AND T2.CountyCode = '37';
SELECT T2.CityName FROM School AS T1 JOIN City AS T2 ON T1.CityCode = T2.CityCode WHERE T1.EILCode = 'HS' AND T1.LunchProvision = 2 AND T1.LowGrade = 9 AND T1.HighGrade = 12 AND T1.CountyCode = 'Merced';
SELECT SchoolName, (FRPMCountAges5_17 / EnrollmentAges5_17 * 100) AS PercentEligibleFRPM FROM Schools WHERE County = 'Los Angeles' AND GradeSpan = 'KG-9';
SELECT GradeSpan FROM Schools WHERE City = 'Adelanto' GROUP BY GradeSpan ORDER BY COUNT(*) DESC LIMIT 1;
SELECT CountyName, COUNT(*) AS num_schools FROM Schools WHERE CountyName IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY CountyName ORDER BY num_schools DESC LIMIT 1;
WITH max_lat AS (SELECT MAX(Lat) as max_latitude FROM schools) SELECT SchoolName, SchoolType, Lat FROM schools WHERE Lat = (SELECT max_latitude FROM max_lat)
SELECT City, LowGrade, SchoolName FROM Schools WHERE State = 'CA' ORDER BY Lat ASC LIMIT 1;
SELECT GradeSpan FROM Schools WHERE Longitude = (SELECT MAX(Longitude) FROM Schools);
SELECT City, COUNT(*) AS SchoolCount FROM Schools WHERE GradeSpan = 'K-8' AND Magnet = 1 AND NSLP_Provision_Status = 'Multiple Provision Types' GROUP BY City;
SELECT AdmFName1, District FROM SchoolAdmins GROUP BY AdmFName1 ORDER BY COUNT(*) DESC LIMIT 2;
SELECT s.DistrictCode, (s.FreeMealCountK_12 / s.EnrollmentK_12 * 100.0) AS Percent_Eligible_Free FROM Schools s JOIN SchoolAdmins sa ON s.DistrictCode = sa.DistrictCode WHERE sa.AdmFName1 = 'Alusine';
SELECT A.AdmLName1 AS AdministratorLastName, D.DistrictName AS District, C.CountyName AS County, S.SchoolName AS SchoolName FROM CharterSchools CS JOIN SchoolDistrictLink SDL ON CS.SchoolID = SDL.SchoolID JOIN Administrator A ON SDL.DistrictID = A.DistrictID JOIN County C ON CS.CountyCode = C.CountyCode JOIN School S ON CS.SchoolID = S.SchoolID WHERE CS.CharterNumber = 40;
SELECT AdmEmail1, AdmEmail2, AdmEmail3 FROM Schools WHERE County = 'San Bernardino' AND City = 'San Bernardino City Unified' AND (SOC = 62 OR DOC = 54) AND LastUpdate BETWEEN '2009-01-01' AND '2010-12-31';
SELECT s.SchoolName, a.AdmEmail1 FROM schools AS s JOIN (SELECT SchoolID, COUNT(*) AS num_test_takers FROM test_scores WHERE Score >= 1500 GROUP BY SchoolID) AS ts ON s.SchoolID = ts.SchoolID LEFT JOIN administrators AS a ON s.SchoolID = a.SchoolID ORDER BY num_test_takers DESC LIMIT 1;
SELECT COUNT(*) FROM account JOIN client ON account.district_id = client.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND client.district_id IN (SELECT district_id FROM client WHERE district_id IN ('1', '5', '12', '15'))
SELECT COUNT(*) FROM account WHERE district_id = 3;
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM unemployment;
SELECT T2.district_id, AVG(T1.salary) AS avg_salary FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.district_id HAVING avg_salary BETWEEN 6000 AND 10000;
SELECT COUNT(*) FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.frequency = 'POPLATEK MESICNE' AND T2.date > '1995-03-24' AND T2.date < '1997-07-07';
WITH oldest_female AS (SELECT MIN(birth_date) as min_birth FROM client WHERE gender = 'F'), female_accounts AS (SELECT a.account_id, a.account_to, COUNT(t.transaction_id) as transaction_count, SUM(t.amount) as total_amount FROM account a JOIN transactions t ON a.account_id = t.account_from JOIN client c ON a.district_id = c.district_id WHERE c.gender = 'F' GROUP BY a.account_id), average_salaries AS (SELECT account_id, account_to, total_amount / transaction_count as avg_salary FROM female_accounts) SELECT account_to, MIN(avg_salary) as lowest_avg_salary, MAX(avg_salary) as highest_avg_salary, (MAX(avg_salary) - MIN(avg_salary)) as gap FROM average_salaries JOIN oldest_female ON 1=1 WHERE account_id IN (SELECT account_id FROM client WHERE birth_date = (SELECT min_birth FROM oldest_female))
SELECT T1.account_to FROM transaction AS T1 JOIN (SELECT MIN(birth_date) AS min_birth_date FROM client) AS T2 ON T2.min_birth_date = (SELECT birth_date FROM client WHERE account_id IN (SELECT account_from FROM transaction GROUP BY account_from HAVING AVG(amount) = (SELECT MAX(avg_amount) FROM (SELECT AVG(amount) AS avg_amount FROM transaction GROUP BY account_from)) LIMIT 1))
SELECT COUNT(*) FROM account JOIN client ON account.account_id = client.client_id WHERE account.frequency = 'POPLATEK TYDNE';
SELECT c.client_id FROM account AS a JOIN client AS c ON a.district_id = c.district_id WHERE a.frequency = 'POPLATEK PO OBRATU';
SELECT T1.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE strftime('%Y', T1.date) = '1997' AND T2.frequency = 'POPLATEK TYDNE' ORDER BY T1.approved_amount ASC LIMIT 1;
SELECT T1.account_id FROM loan AS T1 JOIN account AS T2 ON T1.account = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.duration > 12 AND strftime('%Y', T2.date) = '1993' ORDER BY T1.approved_amount DESC LIMIT 1;
SELECT COUNT(*) FROM client AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND strftime('%Y', T1.birth_date) < '1950' AND T2.district_id = [Sokolov's district_id];
SELECT * FROM account WHERE SUBSTR(date, 1, 4) = '1995' ORDER BY date ASC LIMIT 1;
SELECT DISTINCT T1.account_id FROM `account` AS T1 JOIN `transaction` AS T2 ON T1.account_id = T2.account WHERE T1.date < '1997-01-01' AND T2.amount > 3000
SELECT T2.client_id FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T1.date = '1994-03-03';
SELECT a.date FROM account AS a JOIN transaction AS t ON a.account_id = t.id WHERE t.amount = 840 AND t.date = '1998-10-14'
SELECT T3.district_id FROM transaction AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id WHERE T1.k_symbol = 'UVER' AND T2.date = '1994-08-25'
SELECT MAX(T1.amount) FROM transactions AS T1 JOIN account AS T2 ON T1.account = T2.account_id JOIN client AS T3 ON T2.client = T3.client_id WHERE T2.date = '1996-10-21'
WITH highest_avg_salary AS (SELECT district_id FROM account GROUP BY district_id ORDER BY AVG(amount) DESC LIMIT 1), oldest_client AS (SELECT gender FROM client WHERE district_id = (SELECT district_id FROM highest_avg_salary) AND birth_date = (SELECT MIN(birth_date) FROM client WHERE district_id = (SELECT district_id FROM highest_avg_salary))) SELECT * FROM oldest_client;
SELECT t.amount FROM transaction AS t JOIN account AS a ON t.account_id = a.account_id JOIN client AS c ON a.client_id = c.client_id WHERE c.client_id = (SELECT c2.client_id FROM client AS c2 JOIN loan AS l ON c2.client_id = l.client_id ORDER BY l.amount DESC LIMIT 1) ORDER BY t.date ASC LIMIT 1;
SELECT COUNT(*) FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' AND a.district_id = (SELECT district_id FROM account WHERE district_id = 18 LIMIT 1);
SELECT T3.client_id FROM (SELECT * FROM transaction WHERE amount = 5100 AND date = '1998-09-02') AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id;
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND strftime('%Y', account.date) = '1996';
SELECT T1.district_id FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T2.birth_date FROM loan AS T1 JOIN account AS T3 ON T1.account_id = T3.account_id JOIN client AS T2 ON T3.client_id = T2.client_id WHERE T1.amount = 98832 AND T1.date = '1996-01-03';
SELECT a.account_id FROM account AS a JOIN client AS c ON a.district_id = c.district_id WHERE c.district_id = 15 ORDER BY a.date ASC LIMIT 1;
WITH branch_info AS (SELECT a.district_id, COUNT(c.client_id) as num_clients, SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) as num_male_clients FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.district_id IN (SELECT district_id FROM account WHERE district_id IN (SELECT district_id FROM account WHERE date LIKE '199%') AND frequency = 'POPLATEK MESICNE' GROUP BY district_id ORDER BY SUM(CASE WHEN k_symbol = 'POJISTNE' THEN amount ELSE 0 END) DESC LIMIT 1) GROUP BY a.district_id), max_inhabitants AS (SELECT MAX(num_clients) as max_clients FROM branch_info) SELECT CAST(num_male_clients AS REAL) / num_clients * 100 as percentage_male_clients FROM branch_info JOIN max_inhabitants ON branch_info.num_clients = max_inhabitants.max_clients;
WITH loan_client AS (SELECT t.client_id FROM transaction t JOIN client c ON t.account_to = c.account_id WHERE t.k_symbol = 'UVER' AND t.date = '1993-07-05' LIMIT 1), balance_changes AS (SELECT account_to, SUM(amount) as total_amount, date FROM transaction WHERE account_to IN (SELECT account_id FROM client WHERE client_id IN (SELECT * FROM loan_client)) GROUP BY account_to, date) SELECT ((SELECT total_amount FROM balance_changes WHERE date = '1998-12-27') - (SELECT total_amount FROM balance_changes WHERE date = '1993-03-22')) / (SELECT total_amount FROM balance_changes WHERE date = '1993-03-22') * 100 as increase_rate;
SELECT CAST(SUM(CASE WHEN t2.status = 'A' THEN t1.amount ELSE 0 END) AS REAL) * 100 / SUM(t1.amount) FROM transaction AS t1 JOIN contract AS t2 ON t1.contract_id = t2.contract_id WHERE t2.type = 'LOAN';
SELECT CAST(SUM(CASE WHEN T1.k_symbol = 'UVER' AND T1.amount < 100000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM transaction AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T2.frequency = 'POPLATEK MESICNE' AND T3.gender = 'M' GROUP BY T1.account_id HAVING SUM(CASE WHEN T1.k_symbol = 'UVER' THEN 1 ELSE 0 END) > 0;
SELECT A.account_id, D.district_name, R.region FROM account AS A JOIN district AS D ON A.district_id = D.district_id JOIN A3 AS R ON D.region_id = R.region_id WHERE strftime('%Y', A.date) = '1993' AND A.frequency = 'POPLATEK PO OBRATU';
SELECT c.client_id, a.account_id, a.frequency FROM client AS c JOIN account AS a ON c.district_id = a.district_id WHERE c.district_id IN (18, 1, 5, 12, 15) AND strftime('%Y', a.date) BETWEEN '1995' AND '2000';
SELECT T1.account_id, T2.date FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.district_id = 'Prachatice_district_id';
SELECT T2.district_id AS district, 'region' AS region FROM You AS T1 JOIN account AS T2 ON T1.id = T2.account_id WHERE T1.id = '4990';
SELECT T1.account_id, T2.district_id AS 'district', A2 AS 'region' FROM transaction AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id WHERE amount > 300000 AND k_symbol = 'UVER';

SELECT c.district_id, ((u.A13 - u.A12) / u.A12) * 100 AS unemployment_rate_increment FROM transaction t JOIN client c ON t.client_id = c.client_id JOIN (SELECT district_id, A12, A13 FROM unemployment WHERE year BETWEEN 1995 AND 1996) u ON c.district_id = u.district_id WHERE t.status = 'D';
SELECT CAST(SUM(CASE WHEN T3.district_name = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN A2 AS T3 ON T2.district_id = T3.district_id WHERE strftime('%Y', T1.date) = '1993';
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';
SELECT T3.district_id, COUNT(T2.account_id) AS num_female_accounts FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T1.gender = 'F' GROUP BY T3.district_id ORDER BY num_female_accounts DESC LIMIT 9;
SELECT T3.A2, SUM(T1.amount) AS total_amount FROM transaction AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.type = 'VYDAJ' AND strftime('%Y-%m', T1.date) = '1996-01' GROUP BY T3.A2 ORDER BY total_amount DESC LIMIT 10;
SELECT COUNT(DISTINCT T2.client_id) FROM district AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id LEFT JOIN account AS T3 ON T2.client_id = T3.account_id LEFT JOIN credit_card AS T4 ON T3.account_id = T4.account_id WHERE T1.name = 'South Bohemia' AND T4.account_id IS NULL;
SELECT T3.district_id FROM loan AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.status IN ('C', 'D') GROUP BY T3.district_id ORDER BY SUM(T1.amount) DESC LIMIT 1;
SELECT AVG(t.amount) FROM transactions t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.k_symbol = 'UVER' AND c.gender = 'M';
SELECT A2 FROM district ORDER BY A13 DESC LIMIT 1;
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM crime WHERE A16 = (SELECT MAX(A16) FROM crime WHERE strftime('%Y', date) = '1996')) AND strftime('%Y', date) = '1996';
SELECT COUNT(*) FROM transactions JOIN account ON transactions.account_id = account.account_id WHERE transactions.operation = 'VYBER KARTOU' AND account.frequency = 'POPLATEK MESICNE' AND (account.balance - transactions.amount) < 0;
SELECT COUNT(*) FROM (SELECT t.account_to AS account_id FROM transactions AS t JOIN account AS a ON t.account_from = a.account_id WHERE t.k_symbol = 'UVER' AND t.amount >= 250000 AND t.date BETWEEN '1995-01-01' AND '1997-12-31' AND a.frequency = 'POPLATEK MESICNE' GROUP BY t.account_to) WHERE COUNT(*) > 0;
SELECT COUNT(*) FROM account WHERE district_id = 1;
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT T2.district_id FROM (SELECT district_id, COUNT(*) AS A15 FROM crime GROUP BY district_id ORDER BY A15 DESC LIMIT 1 OFFSET 1) AS T1 JOIN branch AS T2 ON T1.district_id = T2.district_id);

SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.name = 'Pisek';
SELECT DISTINCT T3.district_id FROM `transaction` AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE strftime('%Y', date) = '1997' AND amount > 10000;
SELECT account.account_id FROM transaction JOIN account ON transaction.account_from = account.account_id WHERE transaction.k_symbol = 'SIPO'

SELECT AVG(t.amount) FROM (SELECT strftime('%m', t.date) AS month, AVG(t.amount) AS avg_amount FROM transaction AS t JOIN account AS a ON t.account_id = a.account_id JOIN client AS c ON a.client_id = c.client_id WHERE t.operation = 'VYBER KARTOU' AND strftime('%Y', t.date) = '2021' GROUP BY month) AS t
SELECT T2.client_id FROM (SELECT AVG(amount) AS avg_amount FROM operation WHERE operation = 'VYBER KARTOU' AND strftime('%Y', date) = '1998') AS subquery, operation AS T1 JOIN account AS T2 ON T1.account_from = T2.account_id WHERE T1.operation = 'VYBER KARTOU' AND T1.amount < (SELECT avg_amount FROM subquery) AND strftime('%Y', T1.date) = '1998';
SELECT c.client_id FROM client AS c JOIN account AS a ON c.district_id = a.district_id JOIN credit_card AS cc ON a.account_id = cc.account_id JOIN loan AS l ON a.account_id = l.account_id WHERE c.gender = 'F';
SELECT COUNT(*) FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.gender = 'F' AND c.district_id = (SELECT district_id FROM regions WHERE region_name = 'South Bohemia');
SELECT a.account_id FROM account AS a JOIN client AS c ON a.district_id = c.district_id WHERE a.frequency = 'POPLATEK MESICNE' AND c.district_id = (SELECT district_id FROM client WHERE district_id = 18) AND a.account_id IN (SELECT account_from FROM transactions WHERE k_symbol = 'UVER');

SELECT COUNT(DISTINCT T2.account_id) FROM transactions AS T1 JOIN account AS T2 ON T1.id = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T3.district_id IN (SELECT district_id FROM A3 WHERE region_name = 'North Bohemia') AND T1.bank_to = 'AB';
SELECT T3.A2 FROM transaction AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type = 'VYDAJ' GROUP BY T3.A2;
SELECT A3, AVG(A15) AS avg_crimes_1995 FROM region WHERE district_id IN (SELECT account.district_id FROM account JOIN client ON account.district_id = client.district_id WHERE strftime('%Y', date) >= '1997') GROUP BY A3 HAVING AVG(A15) > 4000;

SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id IN (SELECT district_id FROM account WHERE district_id = (SELECT district_id FROM account WHERE district_id = '18'));
SELECT CAST(SUM(CASE WHEN T2.type = 'Gold' AND strftime('%Y', T1.date) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / (SELECT COUNT(*) FROM card) FROM account AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id;
SELECT c.client_id FROM client AS c JOIN account AS a ON c.client_id = a.account_id JOIN transactions AS t ON a.account_id = t.account_from WHERE t.k_symbol = 'UVER' ORDER BY t.amount DESC LIMIT 1;

SELECT district_id FROM account WHERE account_id = 33333;
SELECT transaction.* FROM transaction JOIN account ON transaction.account = account.account_id JOIN client ON account.client = client.client_id WHERE client.client_id = 3356 AND transaction.operation = 'VYBER';
SELECT COUNT(*) FROM account JOIN (SELECT * FROM samples WHERE k_symbol = 'UVER') AS loans ON account.account_id = loans.account_to WHERE account.frequency = 'POPLATEK TYDNE' AND loans.amount < 200000;

SELECT T1.district_id FROM client AS T1 WHERE T1.client_id = 3541;
SELECT T1.district_id FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id JOIN loan AS T3 ON T1.account_id = T3.account_id WHERE T3.status = 'A' GROUP BY T1.district_id ORDER BY COUNT(T1.account_id) DESC LIMIT 1;

SELECT t.* FROM transaction AS t JOIN account AS a ON t.account_from = a.account_id JOIN client AS c ON a.district_id = c.district_id WHERE a.district_id = 5;

SELECT client.client_id FROM client JOIN account ON client.district_id = account.district_id WHERE strftime('%Y', account.date) > '1996';
SELECT CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.client_id) FROM client c JOIN account a ON c.district_id = a.district_id WHERE c.district_id IN (SELECT district_id FROM A11 WHERE AVG_salary > 10000);
WITH male_client_transactions AS ( 	SELECT t.amount, strftime('%Y', t.date) as transaction_year 	FROM transaction t JOIN account a ON t.account_from = a.account_id 	JOIN client c ON a.client_id = c.client_id 	WHERE c.gender = 'M' ), sum_amounts_by_year AS ( 	SELECT transaction_year, SUM(amount) as total_amount 	FROM male_client_transactions 	GROUP BY transaction_year ) SELECT ((IFNULL((SELECT total_amount FROM sum_amounts_by_year WHERE transaction_year = '1997'), 0) - IFNULL((SELECT total_amount FROM sum_amounts_by_year WHERE transaction_year = '1996'), 0)) / IFNULL((SELECT total_amount FROM sum_amounts_by_year WHERE transaction_year = '1996'), 1)) * 100 as growth_rate;
SELECT COUNT(*) FROM transaction WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01';
SELECT (SELECT A16 FROM table_name WHERE A3 = 'North Bohemia' AND A2 = '1996') - (SELECT A16 FROM table_name WHERE A3 = 'East Bohemia' AND A2 = '1996')
SELECT COUNT(*) FROM transaction WHERE account_from BETWEEN 1 AND 10 AND account_to BETWEEN 1 AND 10;
SELECT T1.frequency, T2.k_symbol FROM account AS T1 JOIN transaction AS T2 ON T1.account_id = T2.account_from WHERE T1.account_id = 3 AND T2.amount = 3539;
SELECT strftime('%Y', T2.birth_date) AS birth_year FROM account AS T1 JOIN client AS T2 ON T1.account_id = T2.client_id WHERE T2.client_id = 130;
SELECT COUNT(account_id) FROM account WHERE frequency = 'POPLATEK PO OBRATU';
SELECT SUM(T1.amount) FROM You AS T1 JOIN account AS T2 ON T1.id = T2.account_id JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T3.client_id = 992
SELECT SUM(t.amount), c.gender FROM transactions AS t JOIN account AS a ON t.account_id = a.account_id JOIN client AS c ON a.client_id = c.client_id WHERE t.transaction_id = 851 AND c.client_id = 4;

SELECT SUM(t.amount) FROM transactions t JOIN account a ON t.account_id = a.account_id JOIN client c ON a.client_id = c.client_id WHERE c.client_id = 617 AND strftime('%Y', t.date) = '1998';
SELECT c.client_id, c.gender, c.birth_date FROM client AS c JOIN account AS a ON c.district_id = a.district_id WHERE strftime('%Y', c.birth_date) BETWEEN '1983' AND '1987' AND a.district_id IN (SELECT district_id FROM district WHERE region = 'East Bohemia');
SELECT c.client_id FROM (SELECT a.account_id, t.amount FROM client AS c JOIN account AS a ON c.district_id = a.district_id JOIN transaction AS t ON a.account_id = t.account_from WHERE c.gender = 'F') AS subquery ORDER BY amount DESC LIMIT 3;
SELECT COUNT(DISTINCT T3.client_id) FROM payment AS T1 INNER JOIN account AS T2 ON T1.account_from = T2.account_id INNER JOIN client AS T3 ON T2.district_id = T3.district_id WHERE T3.gender = 'M' AND T3.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T1.k_symbol = 'SIPO' AND T1.amount > 4000;
SELECT COUNT(*) FROM account WHERE date > '1996-01-01' AND district_id = 18;
SELECT COUNT(*) FROM client WHERE gender = 'F';
WITH prague_district AS (SELECT district_id FROM account WHERE district_id = 'A3' LIMIT 1), female_clients_in_prague AS (SELECT COUNT(*) AS female_count FROM client c JOIN account a ON c.client_id = a.account_id WHERE c.gender = 'F' AND a.district_id IN (SELECT district_id FROM prague_district)), total_clients_in_prague AS (SELECT COUNT(*) AS total_count FROM client c JOIN account a ON c.client_id = a.account_id WHERE a.district_id IN (SELECT district_id FROM prague_district)) SELECT CAST(female_count AS REAL) / total_count * 100 AS percentage_female FROM female_clients_in_prague, total_clients_in_prague
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK TYDNE';
SELECT COUNT(*) FROM account JOIN client ON account.account_id = client.client_id WHERE account.frequency = 'POPLATEK TYDNE';

SELECT T2.account_id FROM client AS T1 JOIN account AS T2 ON T1.district_id = T2.district_id JOIN A11 ON T2.account_id = A11.account WHERE T1.gender = 'F' ORDER BY T1.birth_date, A11.salary ASC LIMIT 1;
SELECT COUNT(*) FROM client WHERE strftime('%Y', birth_date) = '1920';

SELECT AVG(t.amount) FROM transactions t JOIN account a ON t.account_from = a.account_id JOIN client c ON a.client_id = c.client_id WHERE t.k_symbol = 'UVER' AND (t.status = 'C' OR t.status = 'D') AND a.frequency = 'POPLATEK PO OBRATU';
SELECT DISTINCT c.client_id, c.district_id FROM client AS c JOIN account AS a ON c.district_id = a.district_id;
SELECT T1.client_id, (strftime('%Y', 'now') - strftime('%Y', T1.birth_date)) AS age FROM client AS T1 JOIN card AS T2 ON T1.account_id = T2.account_id JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T2.type = 'gold' AND T3.type = 'OWNER';
SELECT bond_type, COUNT(*) as count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1;
SELECT COUNT(*) FROM ( SELECT T1.molecule_id FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl' )
SELECT AVG(T3.element) AS avg_oxygen FROM(SELECT T1.bond_id, T2.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-') AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id JOIN (SELECT molecule_id FROM atom WHERE element = 'o') AS T3 ON T1.molecule_id = T3.molecule_id GROUP BY T1.molecule_id;
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(T3.atom_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.label = '+'
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'na' AND T2.label = '-';
SELECT DISTINCT b.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '#' AND m.label = '+'
SELECT CAST(SUM(CASE WHEN T3.element = 'c' OR T4.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.atom_id) FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_type = '=';
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '#' ;
SELECT COUNT(*) FROM atom WHERE element != 'br';
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' GROUP BY T2.molecule_id;
SELECT a1.element, a2.element FROM (SELECT * FROM connected WHERE bond_id = 'TR004_8_9') AS c JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id;
SELECT DISTINCT T3.element AS element1, T4.element AS element2 FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id JOIN atom AS T4 ON T4.atom_id = T2.atom_id2 WHERE T1.bond_type = '=';
SELECT m.label, COUNT(m.label) AS label_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY label_count DESC LIMIT 1;
SELECT T2.bond_type FROM (SELECT DISTINCT atom_id FROM atom WHERE element = 'cl') AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id OR T1.atom_id = T3.atom_id2 JOIN bond AS T2 ON T2.bond_id = T3.bond_id
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'
SELECT DISTINCT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id JOIN molecule AS m ON a1.molecule_id = m.molecule_id AND a2.molecule_id = m.molecule_id WHERE m.label = '-';
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element ORDER BY COUNT(a.element) ASC LIMIT 1;
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element != 'sn' GROUP BY T2.label HAVING COUNT(*) = (SELECT COUNT(*) FROM molecule) - COUNT(DISTINCT T1.molecule_id)
SELECT COUNT(DISTINCT CASE WHEN T1.element = 'i' OR T1.element = 's' THEN T1.atom_id ELSE NULL END) AS atom_count FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' 
SELECT DISTINCT T3.atom_id AS connected_atom FROM (SELECT * FROM atom WHERE molecule_id = 'TR181') AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id2 WHERE T3.molecule_id != 'TR181' UNION SELECT DISTINCT T4.atom_id AS connected_atom FROM (SELECT * FROM atom WHERE molecule_id = 'TR181') AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 JOIN atom AS T4 ON T4.atom_id = T2.atom_id WHERE T4.molecule_id != 'TR181';
SELECT CAST(SUM(CASE WHEN T3.element != 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.atom_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.label = '+'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.label = '+'
SELECT DISTINCT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR000' ORDER BY T1.element ASC LIMIT 3;
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR001' AND c.bond_id = 'TR001_2_6';
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';
SELECT m.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 5;
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR008' GROUP BY T2.molecule_id;
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule;
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percent FROM atom AS T1 WHERE T1.molecule_id = 'TR206'
SELECT DISTINCT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR000';
SELECT atom.element, molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR060';
SELECT b.bond_type, m.label FROM (SELECT bond_id, bond_type FROM bond WHERE molecule_id = 'TR010') AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN (SELECT molecule_id, label FROM molecule WHERE molecule_id = 'TR010') AS m GROUP BY b.bond_type ORDER BY COUNT(b.bond_type) DESC LIMIT 1;
SELECT m.molecule_id FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id JOIN connected AS c ON b.bond_id = c.bond_id WHERE m.label = '-' AND b.bond_type = '-' GROUP BY m.molecule_id ORDER BY m.molecule_id ASC LIMIT 3;
SELECT b.bond_id FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.molecule_id = 'TR006' ORDER BY b.bond_id LIMIT 2;
SELECT COUNT(*) FROM connected JOIN bond ON connected.bond_id = bond.bond_id JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE (connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12') AND atom.molecule_id = 'TR009';
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br';
SELECT T2.bond_type, T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9';
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10';
SELECT COUNT(DISTINCT T2.molecule_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#' GROUP BY T2.molecule_id;
SELECT COUNT(*) FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id LIKE 'TR%_19' OR connected.atom_id2 LIKE 'TR%_19';
SELECT atom.element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR004';
SELECT COUNT(*) FROM molecule WHERE label = '-';
SELECT a.atom_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'
SELECT b.bond_id FROM (SELECT * FROM atom AS a1 JOIN connected AS c ON a1.atom_id = c.atom_id JOIN atom AS a2 ON a2.atom_id = c.atom_id2 WHERE (a1.element = 'p' AND a2.element = 'n') OR (a1.element = 'n' AND a2.element = 'p')) AS b JOIN bond AS bd ON b.bond_id = bd.bond_id;
SELECT m.molecule_id FROM (SELECT b.molecule_id, COUNT(*) AS num_double_bonds FROM bond AS b WHERE b.bond_type = ' = ' GROUP BY b.molecule_id) AS subquery JOIN molecule AS m ON subquery.molecule_id = m.molecule_id WHERE m.label = '+' AND subquery.num_double_bonds IN (SELECT MAX(num_double_bonds) FROM (SELECT COUNT(*) AS num_double_bonds FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id));
SELECT CAST(COUNT(T2.bond_id) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'i';
SELECT T3.bond_type, T2.bond_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE SUBSTR(T1.atom_id, 7, 2) + 0 = 45;
SELECT A.atom_id FROM atom AS A WHERE A.atom_id NOT IN (SELECT C.atom_id FROM connected AS C UNION SELECT C.atom_id2 FROM connected AS C)
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR041' AND b.bond_type = '#';
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR144_8_19';
SELECT b.molecule_id, COUNT(*) AS num_double_bonds FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.bond_type = '=' AND b.molecule_id IN (SELECT m.molecule_id FROM molecule AS m WHERE m.label = '+') GROUP BY b.molecule_id ORDER BY num_double_bonds DESC LIMIT 1;
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T1.element ORDER BY COUNT(T1.atom_id) ASC LIMIT 1
SELECT a.atom_id, a.element FROM atom AS a JOIN connected AS c ON (a.atom_id = c.atom_id2 OR a.atom_id = c.atom_id) WHERE c.atom_id IN(SELECT atom_id FROM atom WHERE element='pb') AND a.element != 'pb';
SELECT DISTINCT T3.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '#' UNION SELECT DISTINCT T4.element FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T2.atom_id2 = T4.atom_id WHERE T1.bond_type = '#';
WITH atom_combinations AS (SELECT a1.element AS element1, a2.element AS element2, COUNT(*) AS combination_count FROM connected c JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id GROUP BY element1, element2), most_common_combination AS (SELECT element1, element2, MAX(combination_count) AS max_combination_count FROM atom_combinations GROUP BY 1, 2 LIMIT 1), total_bonds AS (SELECT COUNT(*) AS total_bond_count FROM bond) SELECT CAST((SELECT max_combination_count FROM most_common_combination) AS REAL) / (SELECT total_bond_count FROM total_bonds) * 100 AS percentage_of_most_common_combination;
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT COUNT(atom_id) FROM atom WHERE element IN('c', 'h')
SELECT c.atom_id2 FROM connected AS c JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.element = 's';
SELECT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'sn';
SELECT COUNT(DISTINCT T3.element) FROM (SELECT DISTINCT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')) AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id JOIN atom AS T3 ON T3.molecule_id = T2.molecule_id AND T3.atom_id != T1.atom_id
SELECT COUNT(*) FROM (SELECT a.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id WHERE b.bond_type = '#' AND a.element IN ('p', 'br') GROUP BY a.molecule_id) AS result;
SELECT b.bond_id FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE m.label = '+'
SELECT DISTINCT T2.molecule_id FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-';
SELECT CAST(SUM(CASE WHEN T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.atom_id) FROM (SELECT T2.bond_type, T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '-' AND T3.element = 'cl')
SELECT molecule_id, label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+'
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN molecule ON connected.atom_id LIKE CONCAT(molecule.molecule_id, '_%') OR connected.atom_id2 LIKE CONCAT(molecule.molecule_id, '_%') WHERE molecule.molecule_id BETWEEN 'TR000' AND 'TR050';
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11';
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'i'
SELECT m.label, COUNT(*) AS molecule_count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca' GROUP BY m.label ORDER BY molecule_count DESC LIMIT 1;
SELECT A.element AS element1, B.element AS element2 FROM atom AS A JOIN connected AS C ON A.atom_id = C.atom_id JOIN atom AS B ON B.atom_id = C.atom_id2 JOIN bond AS D ON D.bond_id = C.bond_id WHERE D.bond_id = 'TR001_1_8' AND (A.element = 'cl' OR B.element = 'cl') AND (A.element = 'c' OR B.element = 'c')
SELECT DISTINCT m.molecule_id FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id JOIN connected AS c ON (a.atom_id = c.atom_id OR a.atom_id = c.atom_id2) JOIN bond AS b ON c.bond_id = b.bond_id WHERE m.label = '-' AND b.bond_type = '#' AND a.element = 'c' LIMIT 2;
SELECT CAST(SUM(CASE WHEN T3.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.atom_id) FROM molecule AS T1 JOIN atom AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.label = '+'
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR001' AND T3.molecule_id = 'TR001';
SELECT DISTINCT T3.molecule_id FROM bond AS T1 JOIN connected AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T1.bond_type = ' = ';
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' ;
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_1_2';
SELECT COUNT(DISTINCT T2.molecule_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-';
SELECT m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_id = 'TR001_10_11';
SELECT b.bond_id, m.label, COUNT(*) AS count FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' GROUP BY m.label;
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 1) = '4' AND m.label = '+' GROUP BY a.molecule_id;
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id), T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'
SELECT m.label FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' AND m.label = '+' LIMIT 1;
SELECT DISTINCT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'c';
SELECT T2.element FROM connected AS T1 JOIN atom AS T2 ON (T1.atom_id = T2.atom_id OR T1.atom_id2 = T2.atom_id) WHERE T1.bond_id = 'TR001_10_11';
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '#' THEN T1.bond_id END) AS REAL) * 100 / COUNT(T1.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id;
SELECT CAST(SUM(CASE WHEN T2.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR047';
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_1';
SELECT label FROM molecule WHERE molecule_id = 'TR151';
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.molecule_id = 'TR151';
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE element = 'c' AND CAST(SUBSTR(molecule_id, 3, 3) AS INTEGER) BETWEEN 10 AND 50;
SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT b.bond_id FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.label = '+'
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'h';
SELECT T2.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.bond_id = 'TR000_1_2'
SELECT A.atom_id FROM atom AS A JOIN molecule AS M ON A.molecule_id = M.molecule_id WHERE A.element = 'c' AND M.label = '-'
SELECT CAST(SUM(CASE WHEN T1.element = 'h' AND T3.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN molecule AS T3 ON T1.molecule_id = T3.molecule_id WHERE T1.element = 'h' AND T3.label = '+'
SELECT label FROM molecule WHERE molecule_id = 'TR124';
SELECT atom.atom_id FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR186';
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR007_4_19';
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_2_4';
SELECT COUNT(*) AS num_double_bonds, m.label FROM (SELECT * FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR006' AND b.bond_type = '=') AS double_bonds JOIN molecule m ON m.molecule_id = 'TR006';
SELECT m.molecule_id, a.element FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE m.label = '+'
SELECT b.bond_id, a1.atom_id AS atom1, a2.atom_id AS atom2 FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';
SELECT DISTINCT T3.molecule_id, T3.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '#' UNION SELECT DISTINCT T4.molecule_id, T4.element FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T4 ON T1.atom_id2 = T4.atom_id WHERE T2.bond_type = '#';
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR000_2_3';
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T1.element = 'cl';
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS num_bond_types FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id;
SELECT COUNT(DISTINCT T3.molecule_id) AS total_molecules_with_double_bond, (SELECT COUNT(DISTINCT T4.molecule_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T4 ON T2.molecule_id = T4.molecule_id WHERE T2.bond_type = '=' AND T4.label = '+') AS carcinogenic_molecules_with_double_bond FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '=';
SELECT COUNT(DISTINCT T3.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T4 ON T1.atom_id = T4.atom_id OR T1.atom_id = T4.atom_id2 LEFT JOIN bond AS T3 ON T4.bond_id = T3.bond_id WHERE T1.element != 's' AND (T3.bond_type IS NULL OR T3.bond_type != '=')
SELECT m.label FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a ON a.molecule_id = b.molecule_id JOIN molecule m ON m.molecule_id = a.molecule_id WHERE c.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-';
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+'
SELECT m.molecule_id FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl';
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';
SELECT COUNT(DISTINCT T2.element) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_3_4' UNION SELECT COUNT(DISTINCT T2.element) FROM connected AS T1 JOIN atom AS T2 ON T1.atom_id2 = T2.atom_id WHERE T1.bond_id = 'TR001_3_4';
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2';
SELECT a1.molecule_id FROM atom AS a1 JOIN atom AS a2 ON a1.molecule_id = a2.molecule_id WHERE a1.atom_id = 'TR000_2' AND a2.atom_id = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT label FROM molecule WHERE molecule_id = 'TR000';
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.atom_id) FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id;
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+'
SELECT DISTINCT T2.molecule_id FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 's' AND T2.bond_type = '='
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5
SELECT DISTINCT a1.element, a2.element FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id LEFT JOIN atom AS a1 ON c.atom_id = a1.atom_id AND a1.molecule_id = 'TR024' LEFT JOIN atom AS a2 ON c.atom_id2 = a2.atom_id AND a2.molecule_id = 'TR024' WHERE b.bond_type = '=';
SELECT T2.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' GROUP BY T2.molecule_id ORDER BY COUNT(T1.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T4.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM (SELECT T1.molecule_id, COUNT(*) AS triple_bonded_hydrogen FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id JOIN connected AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'h' AND T2.bond_type = '#' GROUP BY T1.molecule_id) AS T5 JOIN molecule AS T4 ON T5.molecule_id = T4.molecule_id;
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE bond_type = '-' AND molecule_id BETWEEN 'TR004' AND 'TR010';
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND molecule.molecule_id = 'TR008';
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-';
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'o' AND T2.bond_type = '=';
SELECT COUNT(DISTINCT T2.molecule_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '-';
SELECT a.element, b.bond_type FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR002';
SELECT T3.atom_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T3.molecule_id = 'TR012' AND T3.element = 'c' AND T2.bond_type = '=';
SELECT T1.atom_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'o';
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT * FROM set WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);
SELECT c.name FROM (SELECT MAX(faceConvertedManaCost) AS max_cmc FROM cards) AS max_cmc JOIN cards AS c ON c.faceConvertedManaCost = max_cmc.max_cmc;
SELECT * FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;
SELECT c.name FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'Banned' AND l.format = 'gladiator'
SELECT l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.types LIKE '%Artifact%' AND c.side IS NULL AND l.format = 'vintage';
SELECT c.uuid AS card_id, c.artist FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE (c.power = '*' OR c.power IS NULL) AND l.format = 'commander' AND l.status = 'Legal';
SELECT c.uuid, cf.text, l.status, c.hasContentWarning FROM cards AS c JOIN card_faces AS cf ON c.card_faces_id = cf.id JOIN legalities AS l ON c.uuid = l.uuid WHERE cf.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;
SELECT c.name, r.text, s.setName FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid JOIN sets AS s ON c.setCode = s.setCode WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';
SELECT c.name AS card_name, c.artist, c.isPromo FROM (SELECT r.uuid, COUNT(*) AS ruling_count FROM rulings r GROUP BY r.uuid) AS ruling_counts JOIN cards c ON c.uuid = ruling_counts.uuid WHERE ruling_counts.ruling_count = (SELECT MAX(ruling_count) FROM (SELECT COUNT(*) AS ruling_count FROM rulings GROUP BY uuid)) AND c.isPromo = 1;
SELECT sc.lang FROM cards AS c JOIN set_cards AS sc ON c.uuid = sc.uuid WHERE c.name = 'Annul' AND sc.number = '29';
SELECT variations FROM cards
SELECT CAST(SUM(CASE WHEN language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 FROM set
SELECT s.setName, COUNT(sc.uuid) AS total_cards FROM sets AS s LEFT JOIN set_cards AS sc ON s.code = sc.setCode WHERE s.languages LIKE '%Italian%' GROUP BY s.setName;
SELECT COUNT(DISTINCT uuid) FROM cards WHERE artist = 'Aaron Boyd';
SELECT s.subtype FROM cards c JOIN subtypes s ON c.uuid = s.uuid WHERE c.name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE power = '*';
SELECT c.promoTypes FROM cards AS c WHERE c.card_name = 'Duress';
SELECT border_color FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originaltype FROM cards WHERE name = 'Ancestor's Chosen';
SELECT DISTINCT T3.language FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.setCode JOIN translations AS T3 ON T1.uuid = T3.cardUUID WHERE T1.name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Restricted' AND cards.isTextless = 0;
SELECT r.text FROM rulings AS r JOIN cards AS c ON r.uuid = c.uuid WHERE c.name = 'Condemn'
SELECT COUNT(*) FROM (SELECT * FROM cards WHERE isStarter = 1) AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE l.status = 'Restricted';
SELECT L.status FROM (SELECT uuid FROM cards WHERE name = 'Cloudchaser Eagle') AS C JOIN legalities AS L ON C.uuid = L.uuid
SELECT types FROM cards WHERE name = 'Benalish Knight';
SELECT L.format, L.status FROM legalities AS L JOIN (SELECT uuid FROM cards WHERE name = 'Benalish Knight') AS C ON L.uuid = C.uuid;
SELECT DISTINCT artist FROM cards WHERE watermark LIKE '%Phyrexian%' OR type_line LIKE '%Phyrexian%'
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM sets
SELECT COUNT(*) FROM cards WHERE language = 'German' AND isReprint = 1;
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND language = 'Russian'
SELECT CAST(SUM(CASE WHEN language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / (SELECT COUNT(*) FROM cards WHERE isStorySpotlight = 1) AS percentage FROM cards WHERE isStorySpotlight = 1;

SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo';
SELECT uuid FROM cards WHERE convertedManaCost = 0;
