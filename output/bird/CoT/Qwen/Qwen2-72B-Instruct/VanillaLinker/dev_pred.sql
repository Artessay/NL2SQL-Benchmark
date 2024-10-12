SELECT MAX(CAST(schools.MealCountFree AS REAL) / schools.TotalEnrollment) as highest_eligible_free_rate FROM schools WHERE schools.CountyName = 'Alameda';
SELECT school_name, (Free_Meal_Count__Ages_5_17 / Enrollment__Ages_5_17) AS eligible_free_rate FROM schools WHERE School_Type = 'Continuation' ORDER BY eligible_free_rate ASC LIMIT 3;
SELECT Zip FROM schools WHERE `Charter School (Y/N)` = 1 AND `County Office of Education (COE)` LIKE '%Fresno%'
SELECT s.mailing_street_address FROM schools AS s JOIN school_demographics AS sd ON s.school_id = sd.school_id WHERE s.grades_offered = 'K-12' ORDER BY sd.frpm_count_k_12 DESC LIMIT 1;
SELECT s.PhoneNumber FROM schools AS s JOIN frpm ON s.SchoolCode = frpm.SchoolCode WHERE s.FundingType = 'Directly funded' AND frpm.[Charter School (Y/N)] = 1 AND s.Status = 'Active' AND s.DateOpened > '2000-01-01';
{     "chain_of_thought_reasoning": "To answer this question, we need to filter schools based on two conditions: average SAT Math score greater than 400 and exclusively virtual (Virtual = 'F'). However, the provided schema does not include a column for SAT scores or a Virtual column. Since we cannot create an SQL query without these columns, it seems there might be a misunderstanding in the question's requirements based on the given schema.",     "SQL": "" }
SELECT s.school_name FROM schools AS s JOIN test_scores AS ts ON s.school_id = ts.school_id WHERE s.Magnet = 1 AND ts.sat_test_takers > 500;
SELECT s.phone_number FROM schools AS s JOIN test_scores AS ts ON s.school_id = ts.school_id JOIN sat_scores AS ss ON ts.test_score_id = ss.test_score_id WHERE ss.total > 1500 GROUP BY s.school_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT sd.SAT_takers FROM schools AS s JOIN school_details AS sd ON s.school_id = sd.school_id WHERE s.grade_levels = 'K-12' ORDER BY s.frpm_count DESC LIMIT 1;
SELECT COUNT(*) FROM schools WHERE sat_math_avg > 560 AND funding_type = 'Directly funded';
SELECT s.frpm_5_17 FROM schools AS s JOIN (SELECT ts.school_id, AVG(ts.reading) AS avg_reading_score FROM test_scores AS ts GROUP BY ts.school_id ORDER BY avg_reading_score DESC LIMIT 1) AS highest_reading ON s.id = highest_reading.school_id
SELECT Code FROM schools WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500;
SELECT MAX(`Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)`) AS Highest_Eligible_Free_Rate FROM `schools` WHERE (`NumGE1500` / `NumTstTakr`) > 0.3;
SELECT s.Phone FROM schools AS s JOIN sat AS t ON s.SchCode = t.SchCode ORDER BY CAST(t.NumGE1500 AS REAL) / t.NumTstTakr DESC LIMIT 3;
SELECT nces_id FROM schools LIMIT 5;
SELECT s.district_name, AVG(sc.reading) AS avg_reading_score FROM scores sc JOIN schools s ON sc.school_id = s.school_id WHERE s.status = 'Active' GROUP BY s.district_name ORDER BY avg_reading_score DESC LIMIT 1;
SELECT COUNT(*) FROM schools JOIN test_takers ON schools.school_id = test_takers.school_id WHERE schools.county = 'Alameda' AND test_takers.num_test_takers < 100;
SELECT s.charter_number, AVG(sc.writing) AS avg_writing_score FROM schools s JOIN scores sc ON s.charter_number = sc.charter_number WHERE sc.writing > 499 GROUP BY s.school_name ORDER BY avg_writing_score DESC;
SELECT COUNT(*) FROM schools WHERE county = 'Fresno' AND funding_type = 'Directly funded';
SELECT s.phone_number FROM schools AS s JOIN scores_math AS sm ON s.id = sm.school_id JOIN (SELECT school_id, AVG(score) AS avg_score FROM scores_math GROUP BY school_id) AS a ON sm.school_id = a.school_id WHERE a.avg_score = (SELECT MAX(avg_score) FROM (SELECT school_id, AVG(score) AS avg_score FROM scores_math GROUP BY school_id))
SELECT COUNT(*) FROM schools WHERE county = 'Amador' AND low_grade = 9 AND high_grade = 12;
SELECT COUNT(*) FROM schools WHERE city = 'Los Angeles' AND (free_meals + reduced_price_meals) BETWEEN 500 AND 700 AND grade_levels = 'K-12';
SELECT s.school_name, COUNT(tt.student_id) AS num_test_takers FROM schools s JOIN test_takers tt ON s.id = tt.school_id WHERE s.county = 'Contra Costa' GROUP BY s.school_name ORDER BY num_test_takers DESC LIMIT 1;
SELECT Name, CONCAT(Address, ', ', City, ', ', State, ' ', Zip_Code) AS Full_Address FROM schools WHERE ABS(Enrollment_K_12 - Enrollment_Ages_5_17) > 30;
SELECT s.name FROM schools s JOIN test_scores ts ON s.school_id = ts.school_id WHERE (s.free_meal_count_k_12 / s.total_enrollment_k_12) > 0.1 AND ts.test_score >= 1500;
SELECT s.county, s.school_name, s.funding_type FROM schools AS s WHERE s.county = 'Riverside' AND (SELECT AVG(sat_math) FROM test_scores WHERE test_scores.school_id = s.id) > 400;
SELECT s.school_name, CONCAT(s.street_address, ', ', s.city, ', ', s.state_code, ' ', s.zip_code) AS full_communication_address FROM schools s JOIN school_demographics sd ON s.school_id = sd.school_id WHERE s.county = 'Monterey' AND s.school_type = 'High School' AND sd.free_or_reduced_price_meals > 800;
SELECT s.school_name, AVG(sw.score) AS avg_writing_score, s.communication_number FROM schools s JOIN scoreswriting sw ON s.id = sw.school_id JOIN scores sc ON s.id = sc.school_id WHERE (s.open_date > '1991-01-01' OR s.close_date < '2000-01-01') AND sc.year = sw.year GROUP BY s.id, s.school_name, s.communication_number;
SELECT School_Name, `DOC Type` FROM schools WHERE (`Funding Source` = 'Locally funded') AND ((`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) > (SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) FROM schools WHERE `Funding Source` = 'Locally funded'));
SELECT date_opened FROM schools WHERE grades_offered = 'K-12' ORDER BY enrollment DESC LIMIT 1;
SELECT T2.city, SUM(T1.enrollment) AS total_enrollment FROM schools AS T1 JOIN addresses AS T2 ON T1.address_id = T2.id WHERE T1.grade_low <= 1 AND T1.grade_high >= 12 GROUP BY T2.city ORDER BY total_enrollment ASC LIMIT 5;
WITH RankedSchools AS (SELECT *, ROW_NUMBER() OVER (ORDER BY Enrollment DESC) AS RowNum FROM schools WHERE GradeSpan = 'K-12') SELECT EligibleFreeRate10th AS "Eligible Free Rate of 10th School", EligibleFreeRate11th AS "Eligible Free Rate of 11th School" FROM (SELECT (SELECT CAST(FreeMealCount AS REAL) / Enrollment FROM schools WHERE id = RankedSchools.id AND GradeSpan = 'K-12' AND RowNum = 10) AS EligibleFreeRate10th, (SELECT CAST(FreeMealCount AS REAL) / Enrollment FROM schools WHERE id = RankedSchools.id AND GradeSpan = 'K-12' AND RowNum = 11) AS EligibleFreeRate11th FROM RankedSchools LIMIT 1);
SELECT name, (FRPM_Count_K_12 / Enrollment_K_12) AS Eligible_Free_Reduced_Meal_Rate FROM schools WHERE grades_offered = 'K-12' AND ownership_code = 66 ORDER BY FRPM_Count_K_12 DESC LIMIT 5;
SELECT school_name, website FROM schools WHERE meal_count BETWEEN 1900 AND 2000 AND (grade_span_min <= 'K' AND grade_span_max >= '8') OR (grade_span_min <= '9' AND grade_span_max >= '12');
SELECT (T2."Free Meal Count (Ages 5-17)" / T2."Enrollment (Ages 5-17)") AS Free_Rate FROM schools AS T1 JOIN school_demographics AS T2 ON T1."School Code" = T2."School Code" WHERE T1."Principal's Name" = 'Kacey Gibson';
SELECT s.Administrator_Email FROM schools AS s JOIN school_demographics AS sd ON s.School_Code = sd.School_Code WHERE s.`Charter School (Y/N)` = 1 ORDER BY sd.`Enrollment (K-12)` ASC LIMIT 1;
SELECT T2.first_name, T2.last_name FROM (SELECT school_id, MAX(NumGE1500) AS max_num_ge_1500 FROM SAT_scores GROUP BY school_id) AS T1 JOIN schools AS T2 ON T1.school_id = T2.school_id LEFT JOIN administrators AS T3 ON T2.administrator1_id = T3.administrator_id OR T2.administrator2_id = T3.administrator_id OR T2.administrator3_id = T3.administrator_id WHERE T1.max_num_ge_1500 >= 1500;
SELECT COALESCE(s.street_address || ', ' || s.street_address2, s.street_address) AS complete_street_address, s.city, s.zip_code, s.state FROM schools s WHERE (s.NumGE1500 / s.NumTstTakr) = (SELECT MIN(NumGE1500 / NumTstTakr) FROM schools)
SELECT school_name, webpage FROM schools WHERE county = 'Los Angeles' AND webpage IS NOT NULL;
SELECT AVG(T2.test_takers) FROM schools AS T1 JOIN test_scores AS T2 ON T1.school_id = T2.school_id WHERE T1.county = 'Fresno' AND strftime('%Y', T1.opened_date) = '1980';
SELECT s.telephone FROM schools AS s JOIN (SELECT sc.school_id, AVG(sc.reading) AS avg_reading FROM scores AS sc JOIN districts AS d ON sc.district_code = d.code WHERE d.name = 'Fresno Unified' GROUP BY sc.school_id ORDER BY avg_reading ASC LIMIT 1) AS lowest_reading ON s.id = lowest_reading.school_id;
SELECT s.Name FROM schools AS s JOIN scores AS sc ON s.School_ID = sc.School_ID WHERE s.Virtual = 'F' GROUP BY s.County, s.Name ORDER BY AVG(sc.Reading_Score) DESC LIMIT 5;
SELECT s.type_of_education FROM schools AS s JOIN (SELECT school_id, AVG(math) AS avg_math FROM scores GROUP BY school_id ORDER BY avg_math DESC LIMIT 1) AS t ON s.school_id = t.school_id;
SELECT s.CountyName, AVG(sc.AvgScrMath) AS avg_math_score FROM schools AS s JOIN scores AS sc ON s.SchoolID = sc.SchoolID GROUP BY s.SchoolID, s.CountyName ORDER BY (sc.AvgScrMath + sc.AvgScrRead + sc.AvgScrWrite) ASC LIMIT 1;
SELECT s.city, AVG(ts.writing) AS avg_writing_score FROM schools AS s JOIN (SELECT ts.school_id, COUNT(*) AS num_test_takers FROM test_scores AS ts WHERE ts.total_sat >= 1500 GROUP BY ts.school_id ORDER BY num_test_takers DESC LIMIT 1) AS top_school ON s.id = top_school.school_id JOIN test_scores AS ts ON s.id = ts.school_id GROUP BY top_school.school_id;
SELECT s.school_name, AVG(sc.writing) AS avg_writing_score FROM schools s JOIN administrators a ON s.principal_email = a.email JOIN scores sc ON s.school_code = sc.school_code WHERE a.first_name = 'Ricci' AND a.last_name = 'Ulrich' GROUP BY s.school_name;
SELECT name FROM schools WHERE DOC = '31' AND grade_levels_offered = 'K-12' ORDER BY enrollees DESC LIMIT 1;
SELECT ROUND(COUNT(*) / 12.0, 2) AS monthly_average FROM schools WHERE CNTYCD = '01' AND DISTCD = '52' AND strftime('%Y', ESTD) = '1980';
SELECT CAST(COUNT(CASE WHEN DOC = '54' THEN 1 ELSE NULL END) AS REAL) / COUNT(CASE WHEN DOC = '52' THEN 1 ELSE NULL END) AS ratio FROM schools WHERE county = 'Orange' AND status = 'Merged';
SELECT County, Name, ClosureDate FROM (SELECT County, Name, ClosureDate, ROW_NUMBER() OVER(PARTITION BY County ORDER BY COUNT(*) DESC) AS rn FROM schools WHERE StatusType = 'Closed' GROUP BY County) WHERE rn = 1;
SELECT T1.school_name, T1.street_address_postal AS postal_street_address FROM schools AS T1 JOIN (SELECT math_average, ROW_NUMBER() OVER (ORDER BY math_average DESC) AS row_num FROM schools) AS T2 ON T1.id = T2.id WHERE T2.row_num = 7;
SELECT s.mailing_street_address, s.name FROM schools AS s JOIN (SELECT school_id, AVG(score) AS avg_reading_score FROM scores JOIN subjects ON scores.subject_id = subjects.id WHERE subjects.description = 'Reading' GROUP BY school_id ORDER BY avg_reading_score ASC LIMIT 1) AS lowest_reading_school ON s.id = lowest_reading_school.school_id;
SELECT COUNT(*) FROM schools JOIN school_sat ON schools.SchCode = school_sat.SchCode WHERE (school_sat.AvgScrRead + school_sat.AvgScrMath + school_sat.AvgScrWrite) >= 1500 AND schools.MailingCity = 'Lakeport';
SELECT COUNT(*) FROM test_takers JOIN schools ON test_takers.school_id = schools.id WHERE schools.mailing_city = 'Fresno';
SELECT school_name, mailing_zip_code FROM schools WHERE principal_name = 'Avetik';
SELECT CAST(SUM(CASE WHEN T1.county = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.county = 'Humboldt' THEN 1 ELSE 0 END) FROM schools AS T1 WHERE T1.mailing_state = 'CA'
SELECT COUNT(*) FROM schools WHERE mailing_state = 'CA' AND city = 'San Joaquin' AND status = 'Active';
SELECT s.phone_number, s.extension FROM schools AS s JOIN scores AS sc ON s.school_id = sc.school_id WHERE sc.subject = 'Writing' ORDER BY sc.average DESC LIMIT 1 OFFSET 332;
SELECT phone, extension, name FROM schools WHERE zip = '95203-3704';
SELECT s.school_name, s.website FROM schools AS s JOIN administrators AS a ON s.school_id = a.school_id WHERE a.administrator_first_name IN ('Mike', 'Dante') AND a.administrator_last_name IN ('Larson', 'Alvarez');
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin';
SELECT COUNT(*) FROM schools WHERE City = 'Hickman' AND DOC = 52 AND Charter = 1;
SELECT COUNT(*) FROM schools WHERE County = 'Los Angeles' AND Charter = 0 AND ((`Free Meal Count (K-12)` * 100.0 / `Enrollment (K-12)`) < 0.18);
SELECT first_name, last_name AS administrator, school_name, city FROM schools WHERE Charter = 1 AND `charter number` = '00D2';
SELECT COUNT(*) FROM schools WHERE MailingCity = 'Hickman' AND CharterNumber = '00D4';
SELECT CAST(COUNT(CASE WHEN funding_type = 'Locally funded' THEN school_id ELSE NULL END) AS REAL) * 100 / COUNT(school_id) AS ratio_percentage FROM schools WHERE county = 'Santa Clara';
SELECT COUNT(*) FROM schools WHERE County = 'Stanislaus' AND FundingType = 'Directly funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31';
SELECT SUM(closure_amount) FROM schools WHERE city = 'San Francisco' AND status = 'Closed' AND closure_year <= 1989;
SELECT County FROM schools WHERE SOC = '11' AND Status = 'Closed' AND strftime('%Y', CloseDate) BETWEEN '1980' AND '1989' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1;
SELECT nces_id FROM schools WHERE soc = 31;
SELECT status, COUNT(school_id) FROM schools WHERE county = 'Alpine' AND school_type = 'District Community Day School' GROUP BY status;
SELECT district_code FROM schools WHERE city = 'Fresno' AND magnet = 0;
SELECT SUM(e.enrollment_count) FROM schools s JOIN enrollment e ON s.school_id = e.school_id WHERE s.city = 'Fremont' AND s.EdOpsCode = 'SSS' AND e.academic_year = 2014 AND e.age_range = '5-17';
SELECT meal_count_5_to_17 FROM schools WHERE school_name = 'Youth Authority School' AND mail_street_address = 'PO Box 1040';
SELECT MIN(s.low_grade) FROM schools s JOIN districts d ON s.district_id = d.id WHERE s.EdOpsCode = 'SPECON' AND d.NCES_district_id = '0613360';
SELECT school_name, edu_level_name FROM schools WHERE breakfast_provision_2 IS NOT NULL AND county_code = '37';
SELECT City FROM schools WHERE EILCode = 'HS' AND LunchProvision = '02' AND LowGrade = 9 AND HighGrade = 12 AND County = 'Merced';
SELECT s.school_name, (sd.FRPM_Count_Ages_5_17 / sd.Enrollment_Ages_5_17 * 100) AS Percent_Eligible_FRPM FROM schools s JOIN school_demographics sd ON s.id = sd.school_id WHERE s.County_Name = 'Los Angeles' AND s.Grades_Offered_Lowest = 'K' AND s.Grades_Offered_Highest >= 9;
SELECT grade_span_served, COUNT(*) AS num_schools FROM schools WHERE city = 'Adelanto' GROUP BY grade_span_served ORDER BY num_schools DESC LIMIT 1;
SELECT County, COUNT(*) AS num_schools FROM schools WHERE Virtual = 'F' AND City IN ('San Diego', 'Santa Barbara') GROUP BY County ORDER BY num_schools DESC LIMIT 1;
SELECT `School Name`, `Latitude` FROM schools WHERE `Latitude` = (SELECT MAX(`Latitude`) FROM schools);
SELECT city, low_grade, school_name FROM schools WHERE state = 'CA' ORDER BY latitude ASC LIMIT 1;
SELECT grade_span_min, grade_span_max FROM schools WHERE longitude = (SELECT MAX(longitude) FROM schools);
SELECT City, COUNT(*) AS School_Count FROM schools WHERE Grade_Span = 'K-8' AND Magnet = 1 AND `NSLP Provision Status` = 'Multiple Provision Types' GROUP BY City;
SELECT admin_first_name, district_name FROM (SELECT admin_first_name, district_name, COUNT(*) as count FROM schools GROUP BY admin_first_name) ORDER BY count DESC LIMIT 2;
SELECT T1.DistrictCode, (T1.[Free Meal Count (K-12)] / T1.[Enrollment (K-12)]) * 100 AS Percent_Eligible_Free FROM `schools` AS T1 WHERE T1.[Admin First Name] = 'Alusine';
SELECT admin_last_name, district, county, school_name FROM schools WHERE charter_number = 40;
SELECT AdministratorEmail FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND DateOpened BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54);
SELECT s.admin_email, s.school_name FROM schools AS s JOIN test_scores AS ts ON s.school_id = ts.school_id JOIN sat_scores AS ss ON ts.test_score_id = ss.test_score_id WHERE ss.total_score >= 1500 GROUP BY s.school_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*) FROM account AS T1 JOIN trans AS T2 ON T1.account_id = T2.account_id JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T2.type = 'POPLATEK PO OBRATU' AND T3.region = 'East Bohemia';
SELECT COUNT(*) FROM `account` WHERE A3 = 'Prague' AND EXISTS (SELECT 1 FROM `loan` WHERE `loan`.account_id = `account`.account_id);
SELECT AVG(A12) AS avg_unemployment_1995, AVG(A13) AS avg_unemployment_1996 FROM account;
SELECT T2.district FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' GROUP BY T2.district HAVING AVG(T2.salary) BETWEEN 6000 AND 10000;
SELECT COUNT(*) FROM customer AS T1 JOIN address AS T2 ON T1.address_id = T2.address_id WHERE T1.gender = 'M' AND T2.region = 'A3' AND T1.average_salary > 8000;
WITH oldest_female AS (SELECT * FROM person WHERE gender = 'F' ORDER BY birthdate ASC LIMIT 1), account_numbers AS (SELECT account_id FROM account WHERE client_id IN (SELECT client_id FROM oldest_female)), lowest_avg_salary AS (SELECT MIN(A11) AS min_avg_salary FROM account WHERE account_id IN (SELECT account_id FROM account_numbers)), highest_avg_salary AS (SELECT MAX(A11) AS max_avg_salary FROM account) SELECT T3.max_avg_salary - T2.min_avg_salary AS gap FROM oldest_female AS T1 JOIN account_numbers AS T2 ON T1.client_id = T2.client_id JOIN lowest_avg_salary AS T3 JOIN highest_avg_salary AS T4
SELECT a.account_number FROM account AS a JOIN client AS c ON a.client_id = c.client_id WHERE (c.birthdate = (SELECT MIN(birthdate) FROM client)) OR (c.avg_salary = (SELECT MAX(avg_salary) FROM client))
SELECT COUNT(*) FROM `account` JOIN `customer` ON `account`.`customer_id` = `customer`.`customer_id` WHERE `account`.`statement_issuance` = 'POPLATEK TYDNE' AND `customer`.`relationship_type` = 'Owner';
{     "chain_of_thought_reasoning": "To answer this question, we need to find clients who chose 'POPLATEK PO OBRATU' as their statement type after transactions. This information is stored in the 'trans' table, where the 'type' column indicates the transaction type. We also need to link this with the 'client' table using foreign keys to get the client's id number. However, there's no direct way to filter out clients who have chosen 'POPLATEK PO OBRATU' as their statement type after transactions because the 'type' column in the 'trans' table does not contain such information. Instead, it contains transaction types like 'PRIJEM', 'VYDAJ', etc. Therefore, we can't directly answer this question with the given database schema.",     "SQL": "" }
SELECT T1.account_id, MIN(T2.approved_amount) AS min_approved_amount FROM `account` AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE strftime('%Y', T2.approved_date) = '1997' AND T3.k_symbol = 'POPLATEK TYDNE' GROUP BY T1.account_id;
SELECT a.account_id FROM account AS a JOIN client AS c ON a.client_id = c.client_id JOIN loan AS l ON a.account_id = l.account_id WHERE strftime('%Y', a.opening_date) = '1993' AND l.duration > 12 ORDER BY l.approved_amount DESC LIMIT 1;
SELECT COUNT(*) FROM `client` c JOIN `address` a ON c.address_id = a.address_id WHERE c.gender = 'F' AND strftime('%Y', c.birth_date) < '1950' AND a.city = 'Sokolov';
SELECT account_id FROM trans WHERE strftime('%Y', date) = '1995' ORDER BY date ASC LIMIT 1;
SELECT DISTINCT a.account_id FROM `account` AS a JOIN `trans` AS t ON a.account_id = t.account_id WHERE a.opening_date < '1997-01-01' AND t.balance > 3000 ORDER BY a.account_id;
SELECT client_id FROM card WHERE valid_from = '1994-03-03';
SELECT a.opening_date FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.date = '1998-10-14' AND t.amount = 840;
SELECT b.district_id FROM loan l JOIN account a ON l.account_id = a.account_id JOIN branch b ON a.branch_id = b.branch_id WHERE l.date = '1994-08-25';
SELECT MAX(T3.amount) FROM `card` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `trans` AS T3 ON T2.account_id = T3.account_id WHERE T1.card_opening_date = '1996-10-21';
SELECT T4.gender FROM `account` AS T1 JOIN `client` AS T2 ON T1.client_id = T2.client_id JOIN `branch` AS T3 ON T1.branch_id = T3.branch_id JOIN `client` AS T4 ON T2.client_id = T4.client_id WHERE T3.A11 = (SELECT MAX(A11) FROM `branch`) AND T2.birthdate = (SELECT MIN(birthdate) FROM `client` WHERE branch_id IN (SELECT branch_id FROM `account` WHERE branch_id IN (SELECT branch_id FROM `branch` WHERE A11 = (SELECT MAX(A11) FROM `branch`)))));
SELECT t.amount FROM (SELECT a.account_id FROM(SELECT l.account_id, MAX(l.amount) AS max_loan FROM loan l GROUP BY l.account_id ORDER BY max_loan DESC LIMIT 1) JOIN account a ON a.account_id = .account_id) AS client_account JOIN trans t ON t.account_id = client_account.account_id WHERE t.type = 'PRIJEM' AND t.operation = 'VKLAD' ORDER BY t.date ASC LIMIT 1;
SELECT COUNT(*) FROM `client` JOIN `account` ON `client.client_id` = `account.client_id` WHERE `branch_name` = 'Jesenik' AND `gender` = 'F';
SELECT c.disposition_id FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN trans AS t ON a.account_id = t.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02';
SELECT COUNT(account_id) FROM account WHERE A2 = 'Litomerice' AND date_open BETWEEN '1996-01-01' AND '1996-12-31';
SELECT A2 FROM client JOIN account ON client.client_id = account.client_id WHERE gender = 'F' AND birth_date = '1976-01-29';
SELECT T1.birth_date FROM `client` AS T1 JOIN `account` AS T2 ON T1.client_id = T2.client_id JOIN `loan` AS T3 ON T2.account_id = T3.account_id WHERE T3.amount = 98832 AND T3.date = '1996-01-03';
SELECT account_id FROM account WHERE region = 'A3' ORDER BY account_id ASC LIMIT 1;
SELECT CAST(SUM(CASE WHEN A2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(A2.gender) FROM (SELECT B.branch_id, B.region_name, B.inhabitants FROM branch AS B WHERE B.region_name = 'south Bohemia' ORDER BY B.inhabitants DESC LIMIT 1) AS A1 JOIN client AS A2 ON A2.branch_id = A1.branch_id;
WITH client_account_id AS (SELECT account_id FROM loan WHERE date_approved = '1993-07-05'), balances AS (SELECT t.date, t.balance FROM trans t JOIN client_account_id c ON t.account_id = c.account_id WHERE t.date IN ('1993-03-22', '1998-12-27')) SELECT ((SELECT balance FROM balances WHERE date = '1998-12-27') - (SELECT balance FROM balances WHERE date = '1993-03-22')) / (SELECT balance FROM balances WHERE date = '1993-03-22') * 100 AS increase_rate;
SELECT CAST(SUM(CASE WHEN T2.status = 'A' THEN T1.amount ELSE 0 END) AS REAL) * 100 / SUM(T1.amount) FROM loan AS T1 JOIN contract AS T2 ON T1.contract_id = T2.contract_id;
SELECT CAST(COUNT(DISTINCT CASE WHEN T2.amount < 100000 AND T2.status = 'C' THEN T1.account_id END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN loan AS T2 ON T1.account_id = T2.account_id;
SELECT a.account_id, d.district_name, d.region FROM account AS a JOIN statement AS s ON a.account_id = s.account_id JOIN district AS d ON a.district_code = d.district_code WHERE strftime('%Y', a.date_of_account_creation) = '1993' AND s.type = 'POPLATEK PO OBRATU';
SELECT a.account_id, COUNT(s.statement_id) AS frequency FROM `account` a JOIN client c ON a.client_id = c.client_id JOIN statement s ON a.account_id = s.account_id WHERE c.region = 'east Bohemia' AND s.date BETWEEN '1995-01-01' AND '2000-12-31' GROUP BY a.account_id;
SELECT T1.account_id, T1.opening_date FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A2 = 'Prachatice';
SELECT T3.district, T3.region FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.loan_id = 4990;
SELECT T2.account_id, T4.district_name, T5.region_name FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN customer AS T3 ON T2.customer_id = T3.customer_id JOIN district AS T4 ON T3.district_id = T4.district_id JOIN region AS T5 ON T3.region_id = T5.region_id WHERE T1.amount > 300000;
SELECT T1.loan_id, T3.district, T3.avg_salary FROM loan AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id JOIN district AS T3 ON T2.district_code = T3.district_code WHERE T1.duration = 60;
SELECT c.district, c.state, ((ur1996.unemployment_rate - ur1995.unemployment_rate) / ur1995.unemployment_rate) * 100 AS unemployment_increment FROM loan l JOIN client c ON l.client_id = c.client_id JOIN (SELECT state, unemployment_rate as unemployment_rate_1995 FROM unemployment_rate WHERE year = '1995') ur1995 ON c.state = ur1995.state JOIN (SELECT state, unemployment_rate as unemployment_rate_1996 FROM unemployment_rate WHERE year = '1996') ur1996 ON c.state = ur1996.state WHERE l.status = 'D';
SELECT CAST(SUM(CASE WHEN A2.district = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM `account` JOIN A2 ON `account`.district_id = A2.district_id WHERE strftime('%Y', `account`.date_opened) = '1993';
SELECT account_id FROM account WHERE statement_issuance = 'POPLATEK MESICNE';
SELECT A2 AS District, COUNT(*) AS FemaleAccountHolders FROM client JOIN account ON client.client_id = account.client_id WHERE gender = 'F' GROUP BY District ORDER BY FemaleAccountHolders DESC LIMIT 9;
SELECT C.A2 AS District_Name, SUM(T.amount) AS Total_Withdrawals FROM trans T JOIN account A ON T.account_id = A.account_id JOIN client CL ON A.client_id = CL.client_id JOIN address AD ON CL.address_id = AD.address_id JOIN city CT ON AD.city_id = CT.city_id JOIN district D ON CT.district_id = D.district_id JOIN region R ON D.region_id = R.region_id WHERE T.type = 'VYDAJ' AND strftime('%Y-%m', T.date) = '1996-01' GROUP BY C.A2 ORDER BY Total_Withdrawals DESC LIMIT 10;
SELECT COUNT(DISTINCT T1.account_id) FROM `account` AS T1 JOIN `client` AS T2 ON T1.client_id = T2.client_id LEFT JOIN `credit_card` AS T3 ON T1.account_id = T3.account_id WHERE T2.region_name = 'South Bohemia' AND T3.card_number IS NULL;
SELECT A.A3 AS District, SUM(L.amount) AS TotalActiveLoan FROM `loan` L JOIN `account` A ON L.account_id = A.account_id WHERE L.status IN ('C', 'D') GROUP BY A.A3 ORDER BY TotalActiveLoan DESC LIMIT 1;
SELECT AVG(l.loan_amount) FROM `loan` l JOIN `account` a ON l.account_id = a.account_id WHERE a.gender = 'M';
SELECT T1.A4 AS branch_location, T1.A2 AS district_name FROM branch AS T1 WHERE T1.A13 = (SELECT MAX(A13) FROM branch);
SELECT COUNT(*) FROM account WHERE branch_id = (SELECT T1.branch_id FROM crime AS T1 JOIN branch AS T2 ON T1.branch_id = T2.branch_id WHERE strftime('%Y', T1.date) = '1996' GROUP BY T1.branch_id ORDER BY COUNT(T1.crime_id) DESC LIMIT 1)
SELECT COUNT(DISTINCT T1.account_id) FROM `account` AS T1 JOIN `credit_card` AS T2 ON T1.account_id = T2.account_id JOIN `trans` AS T3 ON T1.account_id = T3.account_id WHERE T3.type = 'VYBER KARTOU' AND T1.frequency = 'POPLATEK MESICNE' AND T3.balance < 0;
SELECT COUNT(*) AS loan_count FROM (SELECT a.account_id, l.loan_id FROM `account` AS a JOIN `loan` AS l ON a.account_id = l.account_id JOIN `statement_issuance` AS si ON a.account_id = si.account_id WHERE l.amount >= 250000 AND l.date BETWEEN '1995-01-01' AND '1997-12-31' AND si.frequency = 'POPLATEK MESICNE') GROUP BY account_id;
SELECT COUNT(DISTINCT account_id) FROM loan WHERE status = 'C' AND branch_id = 1;
SELECT COUNT(C2.gender) AS num_male_clients FROM (SELECT C1.branch_id FROM(SELECT B.branch_id, SUM(A15) AS total_crimes FROM `branch` AS B JOIN `crime` AS C ON B.branch_id = C.branch_id WHERE C.year = 1995 GROUP BY B.branch_id ORDER BY total_crimes DESC LIMIT 2) AS C1 ORDER BY C1.total_crimes ASC LIMIT 1) AS C3 JOIN `client` AS C2 ON C3.branch_id = C2.branch_id WHERE C2.gender = 'M';
SELECT COUNT(*) FROM card JOIN account ON card.account_id = account.account_id WHERE card.type = 'GOLD' AND account.disposition = 'OWNER';
SELECT COUNT(account_id) FROM account WHERE A2 = 'Pisek';
SELECT DISTINCT c.district FROM customer AS c JOIN account AS a ON c.customer_id = a.customer_id JOIN trans AS t ON a.account_id = t.account_id WHERE t.amount > 10000 AND strftime('%Y', t.date) = '1997';
SELECT a.account_id FROM `order` o JOIN `account` a ON o.account_id = a.account_id WHERE o.k_symbol = 'SIPO' AND a.city = 'Pisek';
SELECT * FROM `account` WHERE `card_type` = 'G'
SELECT strftime('%m', T.date) AS month, AVG(T.amount) AS avg_amount FROM trans T JOIN account A ON T.account_id = A.account_id WHERE T.type = 'VYBER' AND T.operation = 'KARTOU' AND strftime('%Y', T.date) = '2021' GROUP BY month;
SELECT T.account_id FROM trans AS T WHERE T.date LIKE '1998%' AND T.type = 'VYBER' AND T.operation = 'KARTOU' AND T.amount < ( SELECT AVG(amount) FROM trans WHERE date LIKE '1998%' AND type = 'VYBER' AND operation = 'KARTOU' )
SELECT c.first_name, c.last_name FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN credit_card AS cc ON a.account_id = cc.account_id JOIN loan AS l ON a.account_id = l.account_id WHERE c.gender = 'F';
SELECT COUNT(*) FROM client JOIN account ON client.client_id = account.client_id JOIN branch ON account.branch_id = branch.branch_id WHERE client.gender = 'F' AND branch.region = 'south Bohemia';
SELECT a.account_id FROM account AS a JOIN client AS c ON a.client_id = c.client_id WHERE c.A2 = 'Tabor' AND a.type = 'OWNER';
SELECT T1.type FROM account AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.income BETWEEN 8001 AND 9000 AND T1.type != 'OWNER';
SELECT COUNT(DISTINCT a.account_id) FROM account AS a JOIN client AS c ON a.client_id = c.client_id JOIN address AS ad ON c.address_id = ad.address_id JOIN trans AS t ON a.account_id = t.account_id WHERE ad.region = 'North Bohemia' AND t.bank = 'AB';
SELECT DISTINCT d.name FROM district AS d JOIN account AS a ON d.district_id = a.district_id JOIN trans AS t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';
SELECT AVG(T1.crime_1995) FROM crime AS T1 JOIN account AS T2 ON T1.region = T2.region WHERE T2.opened > '1996-12-31' GROUP BY T1.region HAVING AVG(T1.crime_1995) > 4000;
SELECT COUNT(*) FROM card JOIN account ON card.account_id = account.account_id WHERE card.card_type = 'CLASSIC' AND account.account_type = 'OWNER';
SELECT COUNT(*) FROM client JOIN address ON client.address_id = address.address_id WHERE client.gender = 'M' AND address.A2 = 'Hl.m. Praha';
SELECT CAST(SUM(CASE WHEN type = 'gold' AND strftime('%Y', issued) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM card;
SELECT c.name FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN loan AS l ON a.account_id = l.account_id ORDER BY l.amount DESC LIMIT 1;
SELECT a15.crimes_1995 FROM a15 JOIN account ON a15.district = account.district WHERE account.account_id = 532;
SELECT a.district_id FROM `order` o JOIN account a ON o.account_id = a.account_id WHERE o.order_id = 33333;
SELECT t.trans_id, t.date, t.type, t.operation, t.amount, t.balance FROM trans AS t JOIN account AS a ON t.account_id = a.account_id JOIN client AS c ON a.client_id = c.client_id WHERE c.client_id = 3356 AND t.operation = 'VYBER';
SELECT COUNT(*) FROM `account` JOIN `loan` ON `account`.`account_id` = `loan`.`account_id` WHERE `account`.`frequency` = 'POPLATEK TYDNE' AND `loan`.`amount` < 200000;
SELECT cc.type FROM credit_card AS cc JOIN client AS c ON cc.client_id = c.id WHERE c.id = 13539;
SELECT A3 FROM `client` WHERE id = 3541;
SELECT c.district FROM customer AS c JOIN account AS a ON c.customer_id = a.customer_id JOIN loan AS l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY c.district ORDER BY COUNT(a.account_id) DESC LIMIT 1;
SELECT c.first_name, c.last_name FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN `order` AS o ON a.account_id = o.account_id WHERE o.order_id = 32423;
SELECT t.* FROM trans AS t JOIN account AS a ON t.account_id = a.account_id WHERE a.district_id = 5;
SELECT COUNT(*) FROM `account` JOIN `client` ON `account.client_id` = `client.client_id` WHERE `client.address` LIKE '%Jesenik%'
SELECT c.client_id FROM `credit_card` AS cc JOIN `client` AS c ON cc.client_id = c.client_id WHERE cc.card_type = 'junior' AND cc.issue_date >= '1997-01-01';
SELECT CAST(SUM(CASE WHEN C.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM client AS C JOIN account AS A ON C.client_id = A.client_id WHERE A.district IN (SELECT D.district FROM district AS D JOIN A11 AS A1 ON D.district_id = A1.district_id WHERE A1.avg_salary > 10000);
SELECT (SUM(CASE WHEN strftime('%Y', l.date) = '1997' THEN l.amount ELSE 0 END) - SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) / CAST(SUM(CASE WHEN strftime('%Y', l.date) = '1996' THEN l.amount ELSE 0 END) AS REAL) * 100.0 FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.gender = 'M';
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01';
SELECT (SELECT SUM(A16) FROM crime WHERE A3 = 'North Bohemia') - (SELECT SUM(A16) FROM crime WHERE A3 = 'East Bohemia');
SELECT COUNT(*) FROM `account` JOIN `disposition` ON `account.account_id` = `disposition.account_id` WHERE `disposition.type` IN ('owner', 'disponent') AND `account.account_id` BETWEEN 1 AND 10;
SELECT COUNT(*) FROM `trans` WHERE account_id = 3 AND k_symbol = 'VYU'; SELECT DISTINCT k_symbol FROM `trans` WHERE amount = -3539;
SELECT strftime('%Y', birth_date) AS birth_year FROM account_owner WHERE owner_id = 130;
SELECT COUNT(*) FROM `account` JOIN `trans` ON `account`.account_id = `trans`.account_id WHERE `account`.disposition = 'DISP' AND `trans`.type = 'PRIJEM' AND `trans`.k_symbol = 'POPLATEK PO OBRATU';
SELECT SUM(T1.amount) AS debt_amount, T3.type, T3.operation, T3.amount AS payment_amount FROM loan AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id JOIN account AS T4 ON T4.client_id = T2.client_id JOIN trans AS T3 ON T3.account_id = T4.account_id WHERE T2.client_id = 992 GROUP BY T3.type, T3.operation;
SELECT T3.gender FROM (SELECT T1.balance FROM trans AS T1 JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.client_id = 4 AND T1.trans_id <= 851) AS T1 INNER JOIN (SELECT T4.gender FROM client AS T3 JOIN account AS T4 ON T3.client_id = T4.client_id WHERE T3.client_id = 4) AS T2 ON 1=1 ORDER BY T1.balance DESC LIMIT 1;
SELECT type FROM credit_card WHERE client_id = 9;
SELECT SUM(T3.amount) FROM `client` AS T1 JOIN `account` AS T2 ON T1.client_id = T2.client_id JOIN `trans` AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 617 AND strftime('%Y', T3.date) = '1998';
SELECT T1.client_id, T1.name FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id JOIN branch AS T3 ON T2.branch_id = T3.branch_id WHERE strftime('%Y', T1.birth_date) BETWEEN '1983' AND '1987' AND T3.city = 'East Bohemia';
SELECT c.client_id FROM client AS c JOIN account AS a ON c.client_id = a.client_id JOIN loan AS l ON a.account_id = l.account_id WHERE c.gender = 'F' ORDER BY l.amount DESC LIMIT 3;
SELECT COUNT(*) FROM `customer` AS c JOIN `account` AS a ON c.customer_id = a.customer_id JOIN `loan` AS l ON a.account_id = l.account_id JOIN `trans` AS t ON a.account_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND l.type = 'H' AND t.amount > 4000 AND t.k_symbol = 'SIPO';
SELECT COUNT(*) FROM account WHERE opened > '1996-01-01' AND location = 'Beroun';
SELECT COUNT(*) FROM `customer` JOIN `credit_card` ON `customer`.`customer_id` = `credit_card`.`customer_id` WHERE `customer`.`gender` = 'F' AND `credit_card`.`card_type` = 'junior';
SELECT CAST(SUM(CASE WHEN T3.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.gender) FROM branch AS T1 JOIN account AS T2 ON T1.branch_id = T2.branch_id JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.city = 'Prague';
SELECT CAST(SUM(CASE WHEN T2.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 JOIN client AS T2 ON T1.client_id = T2.client_id WHERE T1.statement_issuance = 'POPLATEK TYDNE';
SELECT COUNT(*) FROM `client_role` cr JOIN `account_client` ac ON cr.client_id = ac.client_id JOIN `account` a ON ac.account_id = a.account_id WHERE a.statement_frequency = 'POPLATEK TYDNE' AND cr.role = 'Vlastnik';
SELECT T1.account_id FROM `account` AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T2.validity > 24 AND strftime('%Y', T1.date) < '1997' ORDER BY T2.approved ASC LIMIT 1;
SELECT T2.account_number FROM client AS T1 JOIN account AS T2 ON T1.client_id = T2.client_id WHERE T1.gender = 'F' AND T1.birth_date = (SELECT MIN(`birth_date`) FROM `client` WHERE gender = 'F') AND T1.avg_salary = (SELECT MIN(`avg_salary`) FROM `client` WHERE age = (SELECT age FROM `client` WHERE client_id = T1.client_id) AND gender = 'F');
SELECT COUNT(*) FROM client WHERE A3 = 'East Bohemia' AND strftime('%Y', A4) = '1920';
SELECT COUNT(*) FROM loan WHERE duration = 24 AND frequency = 'POPLATEK TYDNE';
SELECT AVG(T3.amount) FROM `loan` AS T1 JOIN `account` AS T2 ON T1.account_id = T2.account_id JOIN `trans` AS T3 ON T2.account_id = T3.account_id WHERE (T1.status = 'C' OR T1.status = 'D') AND T3.type = 'POPLATEK PO OBRATU';
SELECT DISTINCT c.client_id, c.district FROM client AS c JOIN account AS a ON c.client_id = a.client_id WHERE a.account_type = 'owner';
SELECT client.client_id, client.age FROM client JOIN account ON client.client_id = account.client_id JOIN card ON account.account_id = card.account_id JOIN disp ON account.account_id = disp.account_id WHERE card.type = 'gold' AND disp.type = 'OWNER';
SELECT bond_type, COUNT(*) as count FROM bond GROUP BY bond_type ORDER BY count DESC LIMIT 1;
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '-' AND T1.element = 'cl';
SELECT AVG(T3.element) FROM (SELECT T1.molecule_id FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-') AS T1 JOIN connected AS T2 ON T1.molecule_id = T2.atom_id2 JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T3.element = 'o';
SELECT AVG(single_bonds) FROM (SELECT COUNT(DISTINCT c.bond_id) AS single_bonds FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE m.label = '+' AND b.bond_type = '-' GROUP BY m.molecule_id)
SELECT COUNT(DISTINCT a.molecule_id) FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'na' AND m.label = '-'
SELECT m.molecule_id FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '#' AND m.label = '+'
SELECT CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(a.atom_id) FROM atom a JOIN connected c ON a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';
SELECT COUNT(*) FROM `bond` WHERE `bond_type` = '#';
SELECT COUNT(*) FROM atom WHERE element != 'br';
SELECT COUNT(*) FROM `molecule` WHERE `label` = '+' AND `molecule_id` BETWEEN 'TR000' AND 'TR099';
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';
SELECT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR004_8_9';
SELECT DISTINCT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '=';
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(m.label) DESC LIMIT 1;
SELECT DISTINCT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'cl';
SELECT a1.element AS atom1_element, a2.element AS atom2_element FROM connected c JOIN bond b ON c.bond_id = b.bond_id JOIN atom a1 ON c.atom_id = a1.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id JOIN molecule AS m ON a1.molecule_id = m.molecule_id WHERE m.label = '-';
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY a.element ORDER BY COUNT(a.element) ASC LIMIT 1;
SELECT b.bond_type FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')
SELECT DISTINCT T3.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.element != 'sn' EXCEPT SELECT DISTINCT T3.label FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.element = 'sn';
SELECT COUNT(DISTINCT a.atom_id) FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond AS b ON c.bond_id = b.bond_id WHERE (a.element = 'i' OR a.element = 's') AND b.bond_type = '-';
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' ;
SELECT a.atom_id, c.atom_id2 FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE a.molecule_id = 'TR181';
SELECT CAST(SUM(CASE WHEN a.element != 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#';
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3;
SELECT A.element AS atom1_element, B.element AS atom2_element FROM connected C JOIN atom A ON C.atom_id = A.atom_id JOIN atom B ON C.atom_id2 = B.atom_id WHERE C.bond_id = 'TR001_2_6' AND A.molecule_id = 'TR001' AND B.molecule_id = 'TR001';
SELECT (SELECT COUNT(*) FROM molecule WHERE label = '+') - (SELECT COUNT(*) FROM molecule WHERE label = '-') AS difference;
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5';
SELECT bond_id FROM connected WHERE atom_id = 'TR000_2' OR atom_id2 = 'TR000_2';
SELECT DISTINCT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = ' =' ORDER BY T2.label ASC LIMIT 5;
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR008';
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule;
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) AS percent FROM atom WHERE molecule_id = 'TR206'
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR000';
SELECT atom.element, molecule.label FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR006';
SELECT b.bond_type FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.molecule_id = 'TR010' GROUP BY b.bond_type ORDER BY COUNT(*) DESC LIMIT 1;
SELECT DISTINCT m.molecule_id FROM molecule m JOIN connected c ON m.molecule_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE m.label = '-' AND b.bond_type = '-' ORDER BY m.molecule_id LIMIT 3;
SELECT b.bond_type FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE c.atom_id LIKE 'TR006%' OR c.atom_id2 LIKE 'TR006%' ORDER BY b.bond_type LIMIT 2;
SELECT COUNT(*) FROM connected JOIN atom ON connected.atom_id = atom.atom_id OR connected.atom_id2 = atom.atom_id WHERE (connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12') AND atom.molecule_id = 'TR009';
SELECT COUNT(DISTINCT a.molecule_id) FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'br' AND m.label = '+'
SELECT T2.bond_type, T1.atom_id, T1.atom_id2 FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9';
SELECT T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10';
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#' GROUP BY molecule_id;
SELECT COUNT(*) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19';
SELECT T1.element FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR004';
SELECT COUNT(*) FROM molecule WHERE label = '-';
SELECT DISTINCT T3.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN molecule AS T3 ON T2.atom_id2 = T3.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T3.label = '+'
SELECT b.bond_id FROM (SELECT a1.atom_id AS atom_id_p, a2.atom_id AS atom_id_n, c.bond_id FROM atom AS a1 JOIN connected AS c ON a1.atom_id = c.atom_id JOIN atom AS a2 ON a2.atom_id = c.atom_id2 WHERE a1.element = 'p' AND a2.element = 'n') AS b JOIN bond AS bd ON b.bond_id = bd.bond_id;
SELECT m.label FROM (SELECT b.molecule_id, COUNT(*) AS num_double_bonds FROM bond AS b WHERE b.bond_type = '=' GROUP BY b.molecule_id ORDER BY num_double_bonds DESC LIMIT 1) AS mb JOIN molecule AS m ON mb.molecule_id = m.molecule_id;
SELECT CAST(COUNT(T3.bond_id) AS REAL) / COUNT(T1.atom_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.atom_id2 = T3.atom_id AND T3.bond_id IS NOT NULL WHERE T1.element = 'i';
SELECT T2.bond_id, T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE CAST(SUBSTR(T1.atom_id, 7, 2) AS INTEGER) + 0 = 45
SELECT DISTINCT element FROM atom WHERE NOT EXISTS(SELECT * FROM connected WHERE connected.atom_id = atom.atom_id);
SELECT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE c.bond_id IN (SELECT b.bond_id FROM bond AS b WHERE b.molecule_id = 'TR041' AND b.bond_type = '#');
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR144_8_19';
SELECT m.molecule_id FROM `molecule` AS m JOIN `bond` AS b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = ' =' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1;
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.element ORDER BY COUNT(a.element) ASC LIMIT 1;
SELECT a.atom_id, a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE element = 'pb');
SELECT DISTINCT a1.element, a2.element FROM atom AS a1 JOIN connected AS c1 ON a1.atom_id = c1.atom_id JOIN bond AS b ON c1.bond_id = b.bond_id JOIN connected AS c2 ON c2.bond_id = b.bond_id AND c1.atom_id != c2.atom_id JOIN atom AS a2 ON a2.atom_id = c2.atom_id WHERE b.bond_type = '#';
WITH ElementCombination AS (SELECT A1.element AS Element1, A2.element AS Element2, COUNT(*) AS Count FROM atom AS A1 JOIN connected AS C ON A1.atom_id = C.atom_id JOIN atom AS A2 ON A2.atom_id = C.atom_id2 GROUP BY Element1, Element2 ORDER BY Count DESC LIMIT 1), BondCount AS (SELECT COUNT(*) AS TotalBonds FROM bond), CommonBondCount AS (SELECT COUNT(*) AS CommonBonds FROM connected WHERE (SELECT ElementCombination.Element1 FROM ElementCombination) IN (SELECT atom.element FROM atom WHERE atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2) AND (SELECT ElementCombination.Element2 FROM ElementCombination) IN (SELECT atom.element FROM atom WHERE atom.atom_id = connected.atom_id OR atom.atom_id = connected.atom_id2)) SELECT CAST(CommonBonds AS REAL) / TotalBonds * 100 AS Percentage FROM CommonBondCount, BondCount;
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT COUNT(atom_id) FROM atom WHERE element IN ('c', 'h')
SELECT c.atom_id2 FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE a.element = 's'
SELECT DISTINCT T3.bond_type FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'sn';
SELECT COUNT(DISTINCT a.element) FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-';
SELECT COUNT(*) FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id JOIN connected ON atom.atom_id = connected.atom_id WHERE (atom.element = 'p' OR atom.element = 'br') AND bond.bond_type = '#';
SELECT b.bond_id FROM `bond` AS b JOIN `molecule` AS m ON b.molecule_id = m.molecule_id WHERE m.label = '+'
SELECT m.molecule_id FROM molecule AS m JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-';
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) as percent FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT molecule_id, label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');
SELECT molecule_id FROM molecule WHERE label = '-';
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030';
SELECT bond.bond_type FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id LIKE 'TR0%' AND CAST(SUBSTR(molecule.molecule_id, 3) AS INTEGER) BETWEEN 0 AND 50;
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR001_10_11' UNION SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';
SELECT COUNT(DISTINCT T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.element = 'i';
SELECT m.label, COUNT(*) AS count FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca' GROUP BY m.label ORDER BY count DESC LIMIT 1;
SELECT COUNT(*) FROM (SELECT DISTINCT a.element FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR001_1_8') AS elements WHERE elements.element IN ('cl', 'c') GROUP BY elements.element HAVING COUNT(*) = 2;
SELECT DISTINCT T1.molecule_id FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-' INTERSECT SELECT DISTINCT T3.molecule_id FROM bond AS T3 JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T3.bond_type = '#' LIMIT 2
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001';
SELECT molecule_id FROM bond WHERE bond_type = ' = ';
SELECT c.atom_id, c.atom_id2 FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' GROUP BY b.molecule_id LIMIT 1 OFFSET 0;
SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR000_1_2' UNION SELECT a.element FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE c.bond_id = 'TR000_1_2';
SELECT COUNT(DISTINCT T2.molecule_id) FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-';
SELECT T2.label FROM bond AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11';
SELECT b.bond_id, m.label FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#';
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE SUBSTR(a.atom_id, 7, 1) = '4' AND m.label = '+'
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.atom_id) AS ratio, T2.label FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006';
SELECT m.label FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca';
SELECT b.bond_type FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a ON c.atom_id = a.atom_id WHERE a.element = 'c';
SELECT a.element FROM atom AS a JOIN (SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR001_10_11') AS c ON a.atom_id IN (c.atom_id, c.atom_id2);
SELECT CAST(COUNT(CASE WHEN T2.bond_type = '#' THEN 1 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id
SELECT CAST(SUM(CASE WHEN T2.bond_type = ' = ' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR047';
SELECT m.label FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.atom_id = 'TR001_1';
SELECT label FROM molecule WHERE molecule_id = 'TR151';
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR151' AND a.element IN ('cl', 'pb', 'te', 'sn', 'ca', 'na', 'br')
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT * FROM atom WHERE element = 'c' AND SUBSTR(molecule_id, 3, 3) >= '10' AND SUBSTR(molecule_id, 3, 3) <= '50';
SELECT COUNT(*) FROM `atom` WHERE `molecule_id` IN (SELECT `molecule_id` FROM `molecule` WHERE `label` = '+')
SELECT c.bond_id FROM connected AS c JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND b.bond_type = '=';
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'h';
SELECT b.molecule_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id = 'TR000_1' AND c.bond_id = 'TR000_1_2';
SELECT a.atom_id FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id2 WHERE a.element = 'c' AND c.bond_id IN (SELECT b.bond_id FROM bond AS b JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE m.label = '-')
SELECT CAST(SUM(CASE WHEN T1.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT label FROM molecule WHERE molecule_id = 'TR124';
SELECT * FROM atom WHERE molecule_id = 'TR186';
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4' UNION SELECT DISTINCT T3.element FROM atom AS T3 JOIN connected AS T4 ON T3.atom_id = T4.atom_id2 WHERE T4.bond_id = 'TR001_2_4';
SELECT COUNT(*) AS num_double_bonds, m.label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND b.molecule_id = 'TR006';
SELECT m.molecule_id, a.element FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE m.label = '+'
SELECT a1.element AS atom1_element, a2.element AS atom2_element, b.bond_type FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a1 ON c.atom_id = a1.atom_id JOIN atom AS a2 ON c.atom_id2 = a2.atom_id WHERE b.bond_type = '-';
SELECT DISTINCT a.molecule_id, a.element FROM atom AS a INNER JOIN connected AS c ON a.atom_id = c.atom_id INNER JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '#' GROUP BY a.molecule_id, a.element;
SELECT a.element FROM connected c JOIN atom a ON (c.atom_id = a.atom_id OR c.atom_id2 = a.atom_id) WHERE c.bond_id = 'TR000_2_3';
SELECT COUNT(DISTINCT T3.bond_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN connected AS T3 ON T2.atom_id2 = T3.atom_id WHERE T1.element = 'cl';
SELECT a.atom_id, COUNT(DISTINCT b.bond_type) AS num_bond_types FROM atom a JOIN connected c ON a.atom_id = c.atom_id OR a.atom_id = c.atom_id2 JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR346' GROUP BY a.atom_id
SELECT COUNT(*) FROM `bond` JOIN `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond`.`bond_type` = '=' AND `molecule`.`label` = '+'
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id LEFT JOIN connected AS T3 ON T1.atom_id = T3.atom_id2 LEFT JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T1.element != 's' AND (T4.bond_type IS NULL OR T4.bond_type != ' = ') GROUP BY T1.molecule_id HAVING COUNT(T1.atom_id) > 0
SELECT m.label FROM `molecule` AS m JOIN `bond` AS b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4';
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';
SELECT COUNT(*) FROM bond WHERE bond_type = '-';
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+'
SELECT DISTINCT a.molecule_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-';
SELECT CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(a.atom_id) FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7';
SELECT COUNT(DISTINCT element) FROM atom WHERE atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_3_4');
SELECT T2.bond_type FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE (T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2') OR (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_1')
SELECT T1.molecule_id FROM connected AS T1 JOIN bond AS T2 ON T1.bond_id = T2.bond_id JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE (T1.atom_id = 'TR000_2' AND T1.atom_id2 = 'TR000_4') OR (T1.atom_id = 'TR000_4' AND T1.atom_id2 = 'TR000_2')
SELECT element FROM atom WHERE atom_id = 'TR000_1';
SELECT label FROM molecule WHERE molecule_id = 'TR000';
SELECT CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.bond_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id;
SELECT COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'n' AND T2.label = '+'
SELECT DISTINCT T1.molecule_id FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 's' AND T3.bond_type = ' = ';
SELECT m.molecule_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5;
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '=' AND T1.molecule_id = 'TR024'
SELECT a.molecule_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '+' GROUP BY a.molecule_id ORDER BY COUNT(a.atom_id) DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN T4.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T2.molecule_id) FROM atom AS T1 JOIN connected AS T3 ON T1.atom_id = T3.atom_id JOIN bond AS T4 ON T3.bond_id = T4.bond_id JOIN molecule AS T5 ON T4.molecule_id = T5.molecule_id WHERE T1.element = 'h' AND T4.bond_type = '#' AND T5.label = '+'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(DISTINCT T2.molecule_id) FROM `bond` AS T1 JOIN `molecule` AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.molecule_id BETWEEN 'TR004' AND 'TR010';
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';
SELECT a.element FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR004_7' AND m.label = '-';
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 JOIN bond AS T3 ON T3.bond_id = T2.bond_id WHERE T1.element = 'o' AND T3.bond_type = '=';
SELECT COUNT(*) FROM `bond` JOIN `molecule` ON `bond`.`molecule_id` = `molecule`.`molecule_id` WHERE `bond_type` = '#' AND `label` = '-';
SELECT a.element, b.bond_type FROM atom AS a JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR002';
SELECT a.atom_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id JOIN connected AS c ON a.atom_id = c.atom_id JOIN bond AS b ON c.bond_id = b.bond_id WHERE m.label = '+' AND a.element = 'c' AND b.bond_type = '=' AND m.molecule_id = 'TR012';
SELECT a.atom_id FROM atom AS a JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';
SELECT * FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT * FROM `cards` WHERE borderColor = 'borderless' AND (cardKingdomFoilId IS NULL OR cardKingdomId IS NULL);
SELECT cardName, MAX(faceConvertedManaCost) AS max_face_converted_mana_cost FROM cards GROUP BY cardName ORDER BY max_face_converted_mana_cost DESC LIMIT 1;
SELECT * FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;
SELECT c.name FROM cards AS c JOIN prints AS p ON c.uuid = p.card_uuid JOIN statuses AS s ON p.status_id = s.id WHERE c.rarity = 'mythic' AND s.format = 'gladiator' AND s.status = 'Banned';
SELECT c.name, l.vintage FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.types LIKE '%Artifact%' AND c.side IS NULL;
SELECT c.card_id, c.artist FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE (c.power = '*' OR c.power IS NULL) AND r.format = 'commander' AND r.status = 'Legal';
SELECT c.id AS card_id, r.text AS ruling_text, c.hasContentWarning FROM cards AS c JOIN illustrations AS i ON c.uuid = i.card_uuid JOIN rulings AS r ON c.uuid = r.uuid WHERE i.artist = 'Stephen Daniele';
SELECT r.text FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s';
SELECT c.name AS card_name, c.artist, s.isPromo FROM cards c JOIN rulings r ON c.uuid = r.uuid JOIN sets s ON c.setCode = s.code GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1;
SELECT T3.language FROM `cards` AS T1 INNER JOIN `sets` AS T2 ON T1.setCode = T2.code INNER JOIN `set_translations` AS T3 ON T3.setCode = T2.code WHERE T1.name = 'Annul' AND T1.number = '29';
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Japanese';
SELECT CAST(SUM(CASE WHEN T2.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM sets AS T1 JOIN set_translations AS T2 ON T1.code = T2.setCode;
SELECT s.setName, s.totalSetSize FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Italian';
SELECT COUNT(DISTINCT substr(type_line, instr(type_line, ' —') + 7)) AS card_types FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
SELECT COUNT(*) FROM cards WHERE power = '*';
SELECT s.promoTypes FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Duress';
SELECT s.borderColor FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Ancestor''s Chosen';
SELECT originaltype FROM cards WHERE name = 'Ancestor's Chosen';
SELECT T2.language FROM cards AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy';
SELECT COUNT(DISTINCT c.id) FROM cards AS c INNER JOIN legalities AS l ON c.id = l.cardId INNER JOIN sets AS s ON c.setCode = s.code WHERE l.status = 'restricted' AND c.isTextless = 0;
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Condemn';
SELECT COUNT(c.id) FROM cards AS c INNER JOIN legalities AS l ON c.id = l.cardId INNER JOIN sets AS s ON c.setCode = s.code WHERE l.status = 'restricted' AND s.isStarter = 1;
SELECT * FROM cards WHERE name = 'Cloudchaser Eagle';
SELECT type_line FROM cards WHERE name = 'Benalish Knight';
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Benalish Knight';
SELECT DISTINCT c.artist FROM card_set cs JOIN cards c ON cs.cardId = c.id JOIN sets s ON cs.setID = s.id JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Phyrexian';
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage FROM cards;
SELECT COUNT(*) FROM (SELECT * FROM `cards` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`language` = 'German' AND `sets`.`isReprint` = 1);
SELECT COUNT(*) FROM `cards` JOIN `card_translations` ON `cards`.`uuid` = `card_translations`.`uuid` WHERE `cards`.`borderColor` = 'borderless' AND `card_translations`.`language` = 'Russian';
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM (SELECT id, isStorySpotlight FROM cards WHERE isStorySpotlight = 1) AS T1 JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T2.language = 'French';
SELECT COUNT(uuid) FROM cards WHERE toughness = 99;
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT COUNT(*) FROM `cards` JOIN `set_cards` ON `cards`.`uuid` = `set_cards`.`cardUUID` JOIN `sets` ON `set_cards`.`setCode` = `sets`.`code` WHERE `cards`.`borderColor` = 'black' AND `sets`.`availability` = 'mtgo';
SELECT uuid FROM cards WHERE convertedManaCost = 0;
SELECT c.layout FROM `cards` AS c JOIN `keywords` AS k ON c.uuid = k.card_uuid WHERE k.keyword = 'flying';
SELECT COUNT(*) FROM cards JOIN types ON cards.type_id = types.id JOIN subtypes ON cards.subtype_id = subtypes.id WHERE types.original_type = 'Summon - Angel' AND subtypes.name != 'Angel';
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT id FROM cards WHERE duelDeck = 'a';
SELECT edhrecRank FROM cards WHERE frameVersion = '2015';
SELECT c.artist FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode JOIN card_translations AS ct ON c.uuid = ct.card_uuid WHERE st.language = 'Chinese Simplified' AND ct.language = 'Chinese Simplified';
SELECT c.name FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.uuid WHERE c.availability = 'paper' AND ct.language = 'Japanese' AND NOT EXISTS (SELECT 1 FROM card_translations AS ct2 WHERE ct2.uuid = c.uuid AND ct2.language != 'Japanese')
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE cards.status = 'Banned' AND sets.borderColor = 'white';
SELECT c.uuid, ct.language FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.uuid WHERE c.format = 'legacy';
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality';
SELECT COUNT(c.uuid), l.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.card_uuid WHERE c.frameVersion = 'future' AND l.status = 'legal';
SELECT c.name, c.colors FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.setCode = 'OGW';
SELECT c.name, st.language, st.translation FROM cards AS c INNER JOIN sets AS s ON c.setCode = s.code INNER JOIN set_translations AS st ON s.code = st.setCode WHERE s.setCode = '10E' AND c.convertedManaCost = 5;
SELECT c.name, r.date FROM cards AS c JOIN card_types AS ct ON c.uuid = ct.uuid JOIN rulings AS r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';
SELECT c.colors, s.type, s.code, s.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.id BETWEEN 1 AND 20;
SELECT c.name FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B' AND ct.language IS NOT NULL;
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN rulings AS r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC LIMIT 3;
SELECT COUNT(*) FROM cards JOIN card_faces ON cards.uuid = card_faces.uuid WHERE card_faces.artist = 'John Avon' AND cards.cardKingdomId IS NOT NULL AND cards.cardKingdomFoilId IS NOT NULL;
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.borderColor = 'white' AND cards.cardKingdomFoilId IS NOT NULL AND cards.cardKingdomId IS NOT NULL;
SELECT COUNT(*) FROM cards JOIN artists ON cards.artist = artists.id JOIN availabilities ON cards.availability = availabilities.id WHERE artists.name = 'UDON' AND availabilities.type = 'mtgo' AND cards.hand = -1;
SELECT COUNT(*) FROM `cards` WHERE `frameVersion` = '1993' AND `availability` LIKE '%paper%' AND `hasContentWarning` = 1;
SELECT c.manaCost FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.layout = 'normal' AND s.frameVersion = '2003' AND s.borderColor = 'black' AND s.availability = 'mtgo,paper';
SELECT SUM(LENGTH(manaCost)) AS total_unconverted_mana_cost FROM cards WHERE artist = 'Rob Alexander';
SELECT DISTINCT type_line, sub_types, super_types FROM cards WHERE availability = 'arena';
SELECT set_translations.setCode FROM set_translations JOIN cards ON set_translations.setCode = cards.setCode WHERE set_translations.language = 'Spanish';
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorylight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN isStorylight = 1 THEN 1 ELSE 0 END) AS percentage, id FROM cards WHERE isStorylight = 1 AND isTextless = 0;
SELECT c.name, (COUNT(c.id) FILTER (WHERE st.language = 'Spanish') * 100 / COUNT(c.id)) AS percentage FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'Spanish' GROUP BY c.name
SELECT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309;
SELECT COUNT(*) FROM `set_translations` JOIN `sets` ON `set_translations.setCode` = `sets.code` WHERE `set_translations.language` = 'Portuguese (Brasil)' AND `sets.block` = 'Commander';
SELECT c.id FROM cards AS c JOIN legalities AS l ON c.uuid = l.uuid WHERE c.types LIKE '%Creature%' AND l.status = 'Legal';
SELECT DISTINCT ct.name AS 'Card Type', ctt.translation AS 'German Translation' FROM card_types AS ct JOIN card_type_translations AS ctt ON ct.id = ctt.cardTypeId WHERE ctt.language = 'German';
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM `cards` JOIN `sets` ON `cards`.`setCode` = `sets`.`code` LEFT JOIN `rulings` ON `cards`.`uuid` = `rulings`.`uuid` WHERE `sets`.`format` = 'premodern' AND `rulings`.`text` = 'This is a triggered mana ability.' AND `cards`.`side` IS NULL;
SELECT c.id FROM cards AS c JOIN formats AS f ON c.uuid = f.card_uuid WHERE c.artist = 'Erica Yang' AND f.format_name = 'pauper' AND c.availability = 'paper';
SELECT c.artist FROM cards AS c WHERE c.text = 'Das perfekte Gegenmittel zu einer dichten Formation';
SELECT st.translation FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE c.typeLine LIKE '%Creature%' AND c.layout = 'normal' AND c.borderColor = 'black' AND c.artist = 'Matthew D. Wilson' AND st.language = 'French';
SELECT COUNT(DISTINCT c.uuid) FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.rarity = 'rare' AND r.date = '2007-02-01';
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica';
SELECT CAST(SUM(CASE WHEN c.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.ID) FROM cards AS c JOIN card_legality AS cl ON c.uuid = cl.card_uuid WHERE cl.format = 'commander' AND cl.status = 'legal';
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM (SELECT DISTINCT uuid FROM cards WHERE power IS NULL OR power = '*') AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid;
SELECT CAST(COUNT(CASE WHEN T2.type = 'expansion' THEN T1.id END) AS REAL) * 100 / COUNT(T1.id) FROM set_translations AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese';
SELECT c.availability FROM cards AS c JOIN illustrators AS i ON c.uuid = i.card_uuid WHERE i.artist = 'Daren Bader';
SELECT COUNT(*) FROM `cards` WHERE `borderColor` = 'borderless' AND `colorIdentity` IS NOT NULL AND `edhrecRank` > 12000;
SELECT COUNT(*) FROM `cards` WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1;
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE (c.power = '*' OR c.power IS NULL) AND s.promoTypes LIKE '%arenaleague%' ORDER BY c.name LIMIT 3;
SELECT st.language FROM cards AS c JOIN set_translations AS st ON c.setCode = st.setCode WHERE c.multiverseid = 149934;
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3;
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM cards;
SELECT c.number FROM cards AS c INNER JOIN subtypes AS s ON c.uuid = s.card_uuid WHERE s.subtype IN ('Angel', 'Wizard') GROUP BY c.number HAVING COUNT(DISTINCT s.subtype) = 2 AND c.side IS NULL;
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3;
SELECT DISTINCT T2.language FROM `sets` AS T1 JOIN `set_translations` AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.setCode = 'ARC'
SELECT s.name, st.translation FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.id = 5;
SELECT s.type AS expansion_type, st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 206;
SELECT s.id, s.code FROM sets AS s JOIN set_translations AS st ON s.setCode = st.setCode WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2;
SELECT s.id FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.isForeignOnly = 1 AND s.isFoilOnly = 1 AND st.language = 'Japanese';
SELECT s.name FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN c.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM set_translations st JOIN cards c ON st.setCode = c.setCode WHERE st.language = 'Chinese Simplified';
SELECT COUNT(DISTINCT s.code) FROM sets AS s JOIN set_translations AS st ON s.setCode = st.setCode WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '')
SELECT c.id FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.borderColor = 'black';
SELECT id FROM cards WHERE frameEffects = 'extendedart';
SELECT * FROM cards WHERE borderColor = 'black' AND isFullArt = 1;
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.id = 174;
SELECT name FROM sets WHERE code = 'ALL';
SELECT st.language FROM set_translations AS st JOIN sets AS s ON st.setCode = s.code JOIN cards AS c ON c.setCode = s.code WHERE c.name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13';
SELECT code, baseSetSize FROM sets WHERE block = 'Masques' OR block = 'Mirage';
SELECT setCode FROM sets WHERE type = 'expansion';
SELECT T2.name, T2.type_line FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark LIKE '%boros%'
SELECT c.type, ct.flavor_text FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.translation_id WHERE c.watermark = 'colorpie';
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.id) FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Abyssal Horror';
SELECT setCode FROM sets WHERE type = 'expansion commander';
SELECT ct.name AS card_name, c.type_line AS card_type FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.uuid JOIN sets AS s ON c.setCode = s.code WHERE c.watermark = 'Abzan';
SELECT T2.language, T2.type FROM cards AS T1 JOIN card_translations AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark LIKE '%azorius%'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL;
SELECT COUNT(c.id) FROM `cards` AS c JOIN `sets` AS s ON c.set = s.code JOIN `set_translations` AS st ON s.code = st.setCode WHERE c.availability LIKE '%paper%' AND c.hand > 0 AND st.language = 'English';
SELECT name FROM cards WHERE isTextless = 0;
SELECT manaCost FROM cards WHERE name = 'Ancestor's Chosen';
SELECT COUNT(*) FROM cards WHERE border = 'W' AND (power = '*' OR power IS NULL);
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL;
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';
SELECT pu.purchaseUrl FROM purchase_urls AS pu JOIN cards AS c ON pu.cardId = c.id WHERE c.promoTypes = 'bundle';
SELECT COUNT(DISTINCT c.artist) AS num_artists FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.setCode = st.setCode WHERE s.border = 'black' AND (c.printings LIKE '%arena%' AND c.printings LIKE '%mtgo%');
SELECT name, convertedManaCost FROM cards WHERE name = 'Serra Angel' OR name = 'Shrine Keeper';
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer';
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3;
SELECT T3.translation FROM `cards` AS T1 JOIN `sets` AS T2 ON T1.setCode = T2.code JOIN `set_translations` AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T3.language = 'Italian'
SELECT COUNT(*) FROM (SELECT DISTINCT c.setCode FROM cards AS c WHERE c.name = 'Angel of Mercy') AS card_set JOIN set_translations AS st ON card_set.setCode = st.setCode;
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';
SELECT T3.translation FROM `cards` AS T1 INNER JOIN `sets` AS T2 ON T1.setId = T2.id INNER JOIN `set_translations` AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T3.language = 'Korean';
SELECT COUNT(*) FROM (SELECT c.id FROM `cards` AS c JOIN `sets` AS s ON c.setID = s.id JOIN `set_translations` AS st ON s.setCode = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND c.artist = 'Adam Rex') AS result
SELECT s.baseSetSize FROM `sets` AS s JOIN `set_translations` AS st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';
SELECT st.translation FROM set_translations AS st JOIN sets AS s ON st.setCode = s.code WHERE st.language = 'Chinese Simplified' AND s.name = 'Eighth Edition';
SELECT s.code FROM sets AS s JOIN cards AS c ON s.code = c.setCode WHERE c.name = 'Angel of Mercy' AND s.mtgoCode IS NOT NULL;
SELECT s.releaseDate FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Ancestor''s Chosen'
SELECT s.type FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition';
SELECT COUNT(*) FROM (SELECT s.code FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL)
SELECT s.isForeignOnly FROM cards c JOIN sets s ON c.setCode = s.code WHERE c.name = 'Adarkar Valkyrie';
SELECT COUNT(*) FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `set_translations`.`language` = 'Italian' AND `sets`.`baseSetSize` < 100;
SELECT COUNT(*) FROM cards JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND sets.borderColor = 'black';
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1;
SELECT DISTINCT c.artist FROM `cards` AS c JOIN `sets` AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.number = 4;
SELECT COUNT(*) FROM `cards` AS T1 INNER JOIN `sets` AS T2 ON T1.setCode = T2.code INNER JOIN `card_translations` AS T3 ON T1.uuid = T3.uuid WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL);
SELECT t.flavorText FROM translations AS t JOIN cards AS c ON t.uuid = c.uuid JOIN set_translations AS st ON c.setCode = st.setCode WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian'
SELECT T3.language FROM `cards` AS T1 INNER JOIN `translations` AS T2 ON T1.uuid = T2.uuid INNER JOIN `set_translations` AS T3 ON T1.setCode = T3.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL;
SELECT t.translation FROM cards AS c JOIN translations AS t ON c.uuid = t.uuid JOIN set_translations AS st ON st.setCode = c.setCode AND st.language = 'German' WHERE c.name = 'Ancestor''s Chosen';
SELECT s.name AS setName, st.translation AS italianTranslation, r.text AS italianRulingText FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode AND st.language = 'Italian' JOIN cards AS c ON s.code = c.setCode JOIN rulings AS r ON c.uuid = r.uuid WHERE s.name = 'Coldsnap';
SELECT T3.translation FROM sets AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode JOIN card_translations AS T3 ON T2.uuid = T3.uuid WHERE T1.name = 'Coldsnap' AND T3.language = 'Italian' AND T2.convertedManaCost = (SELECT MAX(convertedManaCost) FROM cards WHERE setCode = (SELECT setCode FROM sets WHERE name = 'Coldsnap'));
SELECT r.date FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN c.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(c.uuid) FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap';
SELECT CAST(SUM(CASE WHEN T2.cardKingdomFoilId IS NOT NULL AND T2.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.name) FROM sets AS T1 JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap';
SELECT code FROM sets WHERE releaseDate = '2017-07-14';
SELECT keyruneCode FROM sets WHERE code = 'PKHC';
SELECT mcmId FROM sets WHERE code = 'SS2';
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09';
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT c.name, r.text, CASE WHEN c.hasContentWarning = 1 THEN 'Yes' ELSE 'No' END AS hasMissingOrDegradedProperties FROM cards AS c JOIN artists AS a ON c.artistId = a.id JOIN rulings AS r ON c.uuid = r.uuid WHERE a.name = 'Jim Pavelec';
SELECT s.releaseDate FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Evacuation';
SELECT s.baseSetSize FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Rinascita di Alara';
SELECT s.type FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode JOIN types AS t ON s.type_id = t.id WHERE st.translation = 'Huitième édition'
SELECT st.translation FROM cards AS c JOIN card_translations AS ct ON c.uuid = ct.uuid JOIN sets AS s ON c.setCode = s.code JOIN set_translations AS st ON s.code = st.setCode WHERE ct.name = 'Tendo Ice Bridge' AND st.language = 'French';
SELECT COUNT(*) FROM `sets` JOIN `set_translations` ON `sets`.`code` = `set_translations`.`setCode` WHERE `sets`.`name` = 'Tenth Edition' AND `set_translations`.`translation` IS NOT NULL;
SELECT T3.translation FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Fellwar Stone' AND T3.language = 'Japanese';
SELECT c.name FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero\'s Path' ORDER BY c.convertedManaCost DESC LIMIT 1;
SELECT s.release_date FROM sets AS s JOIN set_translations AS st ON s.code = st.setCode WHERE st.translation = 'Ola de frío'
SELECT s.type FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards AS T1 JOIN card_sets AS T2 ON T1.id = T2.cardId JOIN sets AS T3 ON T2.setCode = T3.code WHERE T3.name = 'World Championship Decks 2004' AND T1.convertedManaCost = 3;
SELECT st.translation FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Chinese Simplified' AND s.name = 'Mirrodin'
SELECT CAST(SUM(CASE WHEN T2.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM set_translations AS T1 JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.language = 'Japanese';
SELECT CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM set_translations st JOIN sets s ON st.setCode = s.code WHERE st.language = 'Portuguese (Brazil)'
SELECT DISTINCT cp.availability FROM cards c JOIN card_printings cp ON c.id = cp.card_id WHERE c.isTextless = 1 AND c.artist != 'Aleksi Briclot';
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1;
SELECT c.artist FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.side IS NULL ORDER BY c.cmc DESC LIMIT 1;
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(frameEffects) DESC LIMIT 1;
SELECT COUNT(*) FROM cards WHERE (power IS NULL OR power = '*') AND hasFoil = 0 AND duelDeck = 'a';
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1;
SELECT c.name, c.manaCost FROM cards AS c JOIN formats AS f ON c.uuid = f.card_uuid WHERE f.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10;
SELECT c.name, s.originalReleaseDate, GROUP_CONCAT(lp.format) AS legal_play_formats FROM cards AS c JOIN sets AS s ON c.setCode = s.code LEFT JOIN (SELECT cardId, format FROM card_legality WHERE status = 'legal') AS lp ON c.id = lp.cardId WHERE c.rarity = 'mythic' GROUP BY c.name, s.originalReleaseDate ORDER BY s.originalReleaseDate ASC LIMIT 1;
SELECT COUNT(c.id) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.artist = 'Volkan Baǵa' AND st.language = 'French';
SELECT COUNT(*) FROM cards WHERE rarity = 'rare' AND types LIKE '%Enchantment%' AND name = 'Abundance' AND (SELECT COUNT(*) FROM legalities WHERE legalities.cardId = cards.id AND status != 'Legal') = 0;
SELECT b.format, c.name FROM bans AS b JOIN cards AS c ON b.cardId = c.id WHERE b.status = 'Banned' GROUP BY b.format ORDER BY COUNT(*) DESC LIMIT 1;
SELECT st.translation FROM set_translations AS st JOIN sets AS s ON st.setCode = s.code WHERE s.name = 'Battlebond';
SELECT artist, COUNT(*) AS num_cards FROM cards GROUP BY artist ORDER BY num_cards ASC LIMIT 1;
SELECT c.status FROM cards AS c JOIN legalities AS l ON c.uuid = l.card_uuid WHERE c.frameVersion = '1997' AND c.artist = 'D. Alexander Gregory' AND (c.hasContentWarning = 1 OR c.printer = 'Wizards of the Coast') AND l.format = 'legacy';
SELECT c.name, b.format FROM cards AS c JOIN cardedhrecs AS ce ON c.uuid = ce.card_uuid JOIN bans AS b ON c.uuid = b.card_uuid WHERE ce.edhrecRank = 1 AND b.status = 'Banned';
SELECT CAST(COUNT(DISTINCT s.id) AS REAL) / 4 AS average_sets_per_year, st.language AS common_language FROM sets s LEFT JOIN set_translations st ON s.code = st.setCode WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY st.language ORDER BY COUNT(st.id) DESC LIMIT 1;
SELECT DISTINCT c.artist FROM cards AS c JOIN sets AS s ON c.setCode = s.code WHERE c.borderColor = 'black' AND s.availability = 'arena';
SELECT uuid FROM `cards` WHERE format = 'oldschool' AND status IN ('banned', 'restricted');
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC;
SELECT c.name AS Card_Name, cl.format AS Format FROM cards AS c JOIN sets AS s ON c.setCode = s.code JOIN card_legality AS cl ON c.uuid = cl.card_uuid WHERE s.name = 'Hour of Devastation' AND cl.status = 'Legal';
SELECT DISTINCT s.name FROM sets AS s LEFT JOIN set_translations AS st_japanese ON s.code = st_japanese.setCode AND st_japanese.language LIKE '%Japanese%' LEFT JOIN set_translations AS st_korean ON s.code = st_korean.setCode AND st_korean.language = 'Korean' WHERE st_korean.translation IS NOT NULL AND st_japanese.translation IS NULL;
SELECT DISTINCT c.frameVersion, cf.name AS card_name FROM cards AS c JOIN card_faces AS cf ON c.uuid = cf.card_uuid LEFT JOIN set_translations AS st ON c.setCode = st.setCode WHERE c.artist = 'Allen Williams' AND c.status = 'Banned';
SELECT MAX(Reputation) AS max_reputation FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon');
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011';
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01';
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId GROUP BY u.Id ORDER BY SUM(p.ViewCount) DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1;
SELECT COUNT(*) FROM users WHERE Rep > 10 AND strftime('%Y', CreationDate) > '2013';
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie';
SELECT p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.Title = 'Eliciting priors from experts';
SELECT p.Title FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1;
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);
SELECT SUM(p.CommentCount) AS TotalComments FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT p.AnswerCount FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1;
SELECT u.DisplayName FROM Posts p JOIN Users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation';
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie' AND posts.ParentId IS NULL;
SELECT u.DisplayName FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ClosedDate IS NOT NULL;
SELECT COUNT(*) FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE users.Age > 65 AND posts.Score >= 20;
SELECT u.Location FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts';
SELECT p.Body FROM posts AS p JOIN post_tags AS pt ON p.Id = pt.PostId WHERE pt.TagName = 'bayesian'
SELECT p.Body FROM Posts AS p JOIN Tags AS t ON p.Id = t.ExcerptPostId JOIN (SELECT TagId, COUNT(*) AS Count FROM PostTags GROUP BY TagId ORDER BY Count DESC LIMIT 1) AS pt ON t.Id = pt.TagId
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie';
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT COUNT(*) FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE u.DisplayName = 'csgillespie' AND strftime('%Y', b.Date) = '2011';
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId GROUP BY b.UserId ORDER BY COUNT(b.Id) DESC LIMIT 1;
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie';
SELECT CAST(COUNT(b.Id) AS REAL) / COUNT(DISTINCT u.DisplayName) as average_badges FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200 GROUP BY u.DisplayName
SELECT CAST(COUNT(CASE WHEN T2.Age > 65 THEN T1.Id END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 JOIN Users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5;
SELECT COUNT(Id) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19';
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1;
SELECT COUNT(Id) FROM Badges WHERE Name = 'Revival';
SELECT p.Title FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.Score = (SELECT MAX(Score) FROM comments)
SELECT p.CommentCount FROM posts AS p WHERE p.ViewCount = 1910;
SELECT p.FavoriteCount FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.CreationDate = '2014-04-23 20:29:39.0' AND c.UserId = '3025';
SELECT Text FROM comments WHERE PostId = 107829;
SELECT p.ClosedDate FROM posts AS p JOIN comments AS c ON p.Id = c.PostId WHERE c.UserId = '23853' AND c.CreationDate = '2013-07-12 09:08:18.0';
SELECT u.Reputation FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.Id = 65041;
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Tiago Pasqualini';
SELECT u.DisplayName FROM votes AS v JOIN users AS u ON v.UserId = u.Id WHERE v.Id = '6347';
SELECT COUNT(*) FROM votes JOIN posts ON votes.PostId = posts.Id WHERE posts.Title LIKE '%data visualization%'
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'DatEpicCoderGuyWhoPrograms';
SELECT CAST(COUNT(DISTINCT p.Id) AS REAL) / COUNT(DISTINCT v.Id) as PostToVoteRatio FROM posts p LEFT JOIN votes v ON p.OwnerUserId = v.UserId WHERE p.OwnerUserId = 24 OR v.UserId = 24;
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';
SELECT Text FROM comments WHERE Score = 17;
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com';
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'SilentGhost';
SELECT u.DisplayName FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE c.Text = 'thank you user93!';
SELECT c.Text FROM Comments AS c JOIN Users AS u ON c.UserId = u.Id WHERE u.DisplayName = 'A Lion';
SELECT u.DisplayName, u.Reputation FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Understanding what Dassault iSight is doing?';
SELECT c.Text FROM comments AS c JOIN (SELECT Id FROM posts WHERE Title = 'How does gentle boosting differ from AdaBoost?') AS p ON c.PostId = p.Id
SELECT u.DisplayName FROM Users AS u JOIN Badges AS b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10;
SELECT u.DisplayName FROM posts p JOIN posthistory ph ON p.Id = ph.PostId JOIN users u ON ph.UserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data' AND ph.PostHistoryTypeId = 5;
SELECT p.Title FROM posts AS p JOIN users AS u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Vebjorn Ljosa';
SELECT SUM(p.Score) AS total_score, u.WebsiteUrl FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE u.DisplayName = 'Yevgeny' GROUP BY u.WebsiteUrl;
SELECT c.Text FROM Comments AS c JOIN Posts AS p ON c.PostId = p.Id JOIN PostHistory AS ph ON ph.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND ph.PostHistoryTypeId = 4 AND c.UserId = ph.UserId;
SELECT SUM(v.BountyAmount) FROM votes AS v JOIN (SELECT p.Id FROM posts AS p WHERE p.Title LIKE '%data%') AS subquery ON v.PostId = subquery.Id;
SELECT u.DisplayName FROM votes v JOIN posts p ON v.PostId = p.Id JOIN users u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT p.Title, p.Text, AVG(p.ViewCount) AS AverageViewCount FROM Posts p JOIN PostTags pt ON p.Id = pt.PostId JOIN Tags t ON pt.TagId = t.Id WHERE t.TagName = '<humor>' GROUP BY p.Title;
SELECT COUNT(*) FROM comments WHERE UserId = 13;
SELECT UserId FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT Id, MIN(Views) AS Lowest_Views FROM users GROUP BY Id ORDER BY Lowest_Views ASC LIMIT 1;
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011';
SELECT COUNT(DISTINCT UserId) FROM Badges GROUP BY UserId HAVING COUNT(*) > 5;
SELECT COUNT(b.UserId) FROM (SELECT u.Id AS UserId FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Location LIKE '%New York%' AND b.Name IN ('Supporter', 'Teacher')) b
SELECT u.Reputation FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE p.Id = 1;
SELECT p.UserId FROM (SELECT ph.UserId, COUNT(DISTINCT ph.PostId) AS post_count FROM PostHistories ph JOIN Posts p ON ph.PostId = p.Id GROUP BY ph.UserId HAVING post_count = 1) AS users_with_one_post_history JOIN Posts p ON users_with_one_post_history.UserId = p.OwnerUserId WHERE p.ViewCount >= 1000;
SELECT u.Badge FROM (SELECT c.UserId, COUNT(c.Id) AS CommentCount FROM Comments c GROUP BY c.UserId ORDER BY CommentCount DESC LIMIT 1) AS topUser JOIN Users u ON topUser.UserId = u.Id
SELECT COUNT(DISTINCT u.Id) FROM users u JOIN badges b ON u.Id = b.UserId AND u.Location = 'India' JOIN badge_types bt ON b.Name = bt.Name AND bt.Name = 'Teacher';
SELECT (CAST(SUM(CASE WHEN strftime('%Y', Date) = '2010' AND Name = 'Student' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN strftime('%Y', Date) = '2010' THEN 1 ELSE 0 END) - CAST(SUM(CASE WHEN strftime('%Y', Date) = '2011' AND Name = 'Student' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN strftime('%Y', Date) = '2011' THEN 1 ELSE 0 END)) * 100 AS percentage_difference FROM Badges;
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT p.OwnerUserId) AS UniqueUsersCommented FROM post_history AS ph JOIN posts AS p ON ph.PostId = p.Id WHERE ph.PostId = 3720 AND p.PostTypeId = 2 GROUP BY ph.PostHistoryTypeId;
SELECT P1.PostId, P1.ViewCount FROM Posts AS P1 JOIN Posts AS P2 ON P1.Id = P2.RelatedPostId WHERE P2.Id = 61217 UNION SELECT PostId, ViewCount FROM Posts WHERE Id = 61217;
SELECT p.Score, pl.LinkTypeId FROM posts AS p JOIN postLinks AS pl ON p.Id = pl.PostId WHERE p.Id = 395;
SELECT Id, OwnerUserId FROM posts WHERE Score > 60;
SELECT SUM(FavoriteCount) FROM posts WHERE UserId = 686 AND strftime('%Y', CreationDate) = '2011';
SELECT AVG(T2.UpVotes) AS avg_up_votes, AVG(T2.Age) AS avg_age FROM (SELECT UserId, COUNT(*) AS post_count FROM posts GROUP BY UserId HAVING post_count > 10) AS T1 JOIN users AS T2 ON T1.UserId = T2.Id;
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer';
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0';
SELECT COUNT(*) FROM comments WHERE Score > 60;
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:25:47.0';
SELECT COUNT(Id) FROM posts WHERE Score = 10;
SELECT B.Name FROM (SELECT MAX(Reputation) AS MaxRep FROM Users) AS UMax JOIN Users AS U ON U.Reputation = UMax.MaxRep JOIN Badges AS B ON B.UserId = U.Id
SELECT u.Reputation FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Date = '2010-07-19 19:39:08.0';
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Pierre';
SELECT b.Date FROM Badges AS b JOIN Users AS u ON b.UserId = u.Id WHERE u.Location LIKE '%Rochester, NY%'
SELECT CAST((SELECT COUNT(*) FROM badges WHERE Name = 'Teacher') AS REAL) * 100 / (SELECT COUNT(*) FROM users) AS Percentage
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM (SELECT UserId FROM badges WHERE Name = 'Organizer') AS T1 JOIN users AS T2 ON T1.UserId = T2.Id;
SELECT c.Score FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.CreationDate = '2010-07-19 19:19:56.0';
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'
SELECT u.Age FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE u.Location = 'Vienna, Austria' GROUP BY u.Age;
SELECT COUNT(*) FROM users JOIN badges ON users.Id = badges.UserId WHERE users.Age BETWEEN 19 AND 65 AND badges.Name = 'Supporter';
SELECT T3.ViewCount FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id INNER JOIN posts AS T3 ON T2.Id = T3.OwnerUserId WHERE T1.Date = '2010-07-19 19:39:08.0';
SELECT b.Name FROM (SELECT MIN(Reputation) AS MinRep FROM Users) AS u JOIN Badges AS b ON u.UserId = b.UserId WHERE u.Reputation = u.MinRep;
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Sharpie';
SELECT COUNT(*) FROM users JOIN badges ON users.Id = badges.UserId WHERE users.Age > 65 AND badges.Name = 'Supporter';
SELECT DisplayName FROM users WHERE Id = 30;
SELECT COUNT(*) FROM users WHERE Location = 'New York';
SELECT COUNT(Id) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010';
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65;
SELECT u.DisplayName, SUM(p.Views) as TotalViews FROM users u JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.DisplayName ORDER BY TotalViews DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN strftime('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN strftime('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) FROM votes;
SELECT t.TagName FROM (SELECT u.Id AS UserId FROM users u WHERE u.DisplayName = 'John Salvatier') AS js JOIN posts p ON p.OwnerUserId = js.UserId JOIN posttags pt ON pt.PostId = p.Id JOIN tags t ON t.Id = pt.TagId
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Daniel Vassallo';
SELECT COUNT(*) FROM votes WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Harlan');
SELECT p.Id AS PostId FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' ORDER BY p.AnswerCount DESC LIMIT 1;
SELECT MAX(SUM(p.ViewCount)) AS max_view_count, u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY u.DisplayName;
SELECT p.Id AS PostId FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN votes v ON p.Id = v.PostId WHERE u.DisplayName = 'Matt Parker' GROUP BY p.Id HAVING COUNT(v.Id) > 4;
SELECT COUNT(*) FROM comments c INNER JOIN posts p ON c.PostId = p.Id INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60;
SELECT DISTINCT T3.Tags FROM `users` AS T1 INNER JOIN `posts` AS T2 ON T1.Id = T2.UserId INNER JOIN `posts` AS T3 ON T2.Id = T3.Id WHERE T1.DisplayName = 'Mark Meckes' AND T2.CommentCount = 0;
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Organizer';
SELECT CAST(SUM(CASE WHEN T3.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) FROM Posts AS T1 INNER JOIN PostTags AS T2 ON T1.Id = T2.PostId INNER JOIN Tags AS T3 ON T2.TagId = T3.Id WHERE T1.OwnerUserId = 1;
SELECT (SUM(p1.ViewCount) - SUM(p2.ViewCount)) AS ViewDifference FROM (SELECT p.ViewCount FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Mornington') AS p1, (SELECT p.ViewCount FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Amos') AS p2
SELECT COUNT(*) FROM badges JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Commentator' AND strftime('%Y', badges.Date) = '2014';
SELECT COUNT(*) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59';
SELECT u.DisplayName, u.Age FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId GROUP BY u.Id ORDER BY SUM(p.Views) DESC LIMIT 1;
SELECT MAX(ph.CreationDate) AS LastEditDate, ph.UserId AS LastEditUserId FROM posts p JOIN posthistory ph ON p.Id = ph.PostId WHERE p.Title = 'Detecting a given face in a database of facial images' AND ph.PostHistoryTypeId IN (4, 5, 6) GROUP BY ph.PostId
SELECT COUNT(*) FROM comments WHERE UserId = 13 AND Score < 60;
SELECT p.Title, u.DisplayName FROM comments c JOIN posts p ON c.PostId = p.Id JOIN users u ON c.UserId = u.Id WHERE c.Score > 60;
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND strftime('%Y', b.Date) = '2011';
SELECT u.DisplayName, u.WebsiteUrl FROM Users AS u JOIN Posts AS p ON u.Id = p.OwnerUserId JOIN Votes AS v ON p.Id = v.PostId WHERE v.VoteTypeId = 5 AND v.CreationDate > 150;
SELECT ph.Count AS PostHistoryCount, MAX(ph.CreationDate) AS LastEditDate FROM posts p JOIN (SELECT PostId, COUNT(*) AS Count FROM post_history GROUP BY PostId) ph ON p.Id = ph.PostId WHERE p.Title = 'What is the best introductory Bayesian statistics textbook?' AND p.PostTypeId = 1;
SELECT u.LastAccessDate, u.Location FROM users AS u JOIN badges AS b ON u.Id = b.UserId WHERE b.Name = 'Outliers';
SELECT Title FROM Posts WHERE Body = 'How to tell if something happened in a data set which monitors a value over time';
SELECT p.Id AS PostId, b.Name AS BadgeName FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Samuel' AND strftime('%Y', p.CreationDate) = '2013' AND strftime('%Y', b.Date) = '2013';
SELECT u.DisplayName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount = (SELECT MAX(ViewCount) FROM posts)
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.OwnerUserId = u.Id JOIN posttags pt ON p.Id = pt.PostId JOIN tags t ON pt.TagId = t.Id WHERE t.TagName = 'hypothesis-testing';
SELECT p2.Title, pl.LinkTypeId FROM Posts AS p INNER JOIN PostLinks AS pl ON p.Id = pl.PostId INNER JOIN Posts AS p2 ON pl.RelatedPostId = p2.Id WHERE p.Title = 'What are principal component scores?';
SELECT u.DisplayName FROM Users AS u JOIN Posts AS p ON u.Id = p.OwnerUserId WHERE p.Id IN (SELECT ParentId FROM Posts WHERE ParentId IS NOT NULL ORDER BY Score DESC LIMIT 1)
SELECT u.DisplayName, u.WebsiteUrl FROM votes AS v JOIN users AS u ON v.UserId = u.Id JOIN posts AS p ON v.PostId = p.Id WHERE v.VoteTypeId = 8 GROUP BY v.UserId HAVING v.BountyAmount = MAX(v.BountyAmount);
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5;
SELECT COUNT(*) FROM tags WHERE Count BETWEEN 5000 AND 7000;
SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts);
SELECT T1.Age FROM users AS T1 INNER JOIN (SELECT MAX(Reputation) AS MaxRep FROM users) AS T2 ON T1.Reputation = T2.MaxRep;
SELECT COUNT(*) FROM posts p JOIN votes v ON p.Id = v.PostId WHERE YEAR(v.CreationDate) = 2011 AND v.BountyAmount = 50;
SELECT Id FROM users ORDER BY Age ASC LIMIT 1;
SELECT SUM(Score) FROM posts WHERE LastActivityDate LIKE '2010-07-19%'
SELECT CAST(COUNT(Id) AS REAL) / 12 FROM posts WHERE YEAR(CreationDate) = 2010 AND AnswerCount <= 2;
SELECT p.Id FROM posts AS p JOIN votes AS v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1;
SELECT Title FROM posts ORDER BY CreationDate ASC LIMIT 1;
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId GROUP BY u.Id ORDER BY COUNT(b.Name) DESC LIMIT 1;
SELECT MIN(v.CreationDate) AS first_vote_date FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl';
SELECT p.CreationDate FROM posts AS p JOIN users AS u ON p.OwnerUserId = u.Id WHERE u.Age = (SELECT MIN(Age) FROM users) AND p.CreationDate = (SELECT MIN(CreationDate) FROM posts WHERE OwnerUserId = u.Id)
SELECT u.DisplayName FROM users AS u JOIN badges AS b ON u.Id = b.UserId JOIN posts AS p ON u.Id = p.OwnerUserId WHERE b.Name = 'Autobiographer' AND p.PostTypeId = 2 ORDER BY b.Date LIMIT 1;
SELECT u.Id AS user_id, SUM(v.BountyAmount) AS total_favorite_amount FROM users u JOIN posts p ON u.Id = p.OwnerUserId JOIN votes v ON p.Id = v.PostId WHERE u.Location = 'United Kingdom' GROUP BY u.Id HAVING total_favorite_amount >= 4;
SELECT AVG(COUNT(v.PostId)) AS avg_posts_voted FROM (SELECT v.* FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users)) v GROUP BY v.UserId;
SELECT DisplayName FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users);
SELECT COUNT(*) FROM users JOIN posts ON users.Id = posts.UserId WHERE users.Reputation > 2000 AND posts.ViewCount > 1000;
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65;
SELECT COUNT(*) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', posts.CreationDate) = '2010';
SELECT p.Id AS PostId, p.Title FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1;
SELECT p.Id AS PostId, p.Title AS Title, u.DisplayName AS OwnerName FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = (SELECT MAX(Score) FROM posts)
SELECT AVG(p.Score) FROM posts p JOIN users u ON p.UserId = u.Id WHERE u.DisplayName = 'Stephen Turner';
SELECT u.DisplayName FROM users AS u JOIN posts AS p ON u.Id = p.OwnerUserId WHERE p.ViewCount > 20000 AND strftime('%Y', p.CreationDate) = '2011';
SELECT p.Id AS PostId, u.DisplayName AS OwnerName FROM Posts p JOIN Users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreationDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1;
SELECT CAST(SUM(CASE WHEN YEAR(p.CreationDate) = 2011 AND u.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(p.Id) FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE YEAR(p.CreationDate) = 2011;
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) as percentage FROM users;
SELECT p.ViewCount, u.DisplayName FROM posts AS p JOIN tags AS t ON p.Id = t.PostId JOIN users AS u ON p.OwnerUserId = u.Id WHERE t.Text = 'Computer Game Datasets';
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts);
SELECT COUNT(*) FROM comments WHERE PostId = (SELECT Id FROM posts ORDER BY Score DESC LIMIT 1);
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0;
SELECT u.DisplayName, u.Location FROM posts p JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1;
SELECT b.Name FROM badges AS b JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'Emmett' ORDER BY b.Date DESC LIMIT 1;
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000;
SELECT julianday((SELECT MIN(CreationDate) FROM stats_badges WHERE UserId = (SELECT Id FROM users WHERE DisplayName = 'Zolomon'))) - julianday((SELECT CreationDate FROM users WHERE DisplayName = 'Zolomon')) AS DaysToFirstBadge
SELECT (SELECT COUNT(*) FROM posts WHERE posts.OwnerUserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1)), (SELECT COUNT(*) FROM comments WHERE comments.UserId = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1));
SELECT c.Text, u.DisplayName FROM posts AS p JOIN comments AS c ON p.Id = c.PostId JOIN users AS u ON c.UserId = u.Id WHERE p.Title = 'Analysing wind data with R' ORDER BY c.CreationDate DESC LIMIT 10;
SELECT COUNT(*) FROM badges WHERE Name = 'Citizen Patrol';
SELECT COUNT(*) FROM Posts INNER JOIN PostTags ON Posts.Id = PostTags.PostId INNER JOIN Tags ON PostTags.TagId = Tags.Id WHERE Tags.TagName = 'careers';
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon';
SELECT COUNT(T3.Id) AS answer_count, (SELECT COUNT(*) FROM Comments WHERE PostId = T1.Id) AS comment_count FROM Posts AS T1 INNER JOIN Posts AS T2 ON T1.Id = T2.ParentId INNER JOIN Posts AS T3 ON T2.Id = T3.ParentId WHERE T1.Title = 'Clustering 1D data'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat';
SELECT COUNT(*) FROM votes WHERE BountyAmount >= 30;
WITH InfluentialUser AS (SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1), PostsByInfluentialUser AS (SELECT p.Id FROM posts p JOIN InfluentialUser u ON p.OwnerUserId = u.Id) SELECT CAST(SUM(CASE WHEN Score > 50 THEN 1 ELSE 0 END) AS REAL) / COUNT(*) * 100 AS Percentage FROM PostsByInfluentialUser JOIN posts ON PostsByInfluentialUser.Id = posts.Id;
SELECT COUNT(*) FROM posts WHERE Score < 20;
SELECT t.Id AS tag_id, COUNT(pt.PostId) AS post_count FROM tags AS t JOIN post_tags AS pt ON t.Id = pt.TagId WHERE t.Id < 15 GROUP BY t.Id HAVING post_count <= 20;
SELECT t.ExcerptPostId, t.WikiPostId FROM tags AS t WHERE t.TagName = 'sample';
SELECT u.Reputation, u.UpVotes FROM users AS u JOIN comments AS c ON u.Id = c.UserId WHERE c.Text = 'fine, you win :);'
SELECT C.Text FROM Comments AS C JOIN Posts AS P ON C.PostId = P.Id WHERE P.Title LIKE '%linear regression%'
SELECT c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id WHERE p.ViewCount BETWEEN 100 AND 150 ORDER BY c.Score DESC LIMIT 1;
SELECT u.CreationDate, u.Age FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%' OR c.Text LIKE '%https://%';
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE comments.Score = 0 AND posts.ViewCount < 5;
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id WHERE posts.CommentCount = 1 AND comments.Score = 0;
SELECT COUNT(*) FROM comments JOIN posts ON comments.PostId = posts.Id JOIN users ON posts.OwnerUserId = users.Id WHERE comments.Score = 0 AND users.Age = 40;
SELECT c.Id AS CommentId, c.PostId, c.Text FROM comments AS c JOIN posts AS p ON c.PostId = p.Id JOIN posthistory AS ph ON ph.PostHistoryTypeId = 3 AND ph.PostId = p.Id WHERE p.Title = 'Group differences on a five point Likert item';
SELECT COUNT(*) AS UpVotes FROM (SELECT u.Id, v.VoteTypeId FROM users u JOIN votes v ON u.Id = v.UserId WHERE u.Id IN (SELECT c.UserId FROM comments c WHERE c.Text = 'R is also lazy evaluated.')) WHERE VoteTypeId = 2;
SELECT c.Text FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky';
SELECT u.DisplayName FROM Users AS u JOIN Comments AS c ON u.Id = c.UserId WHERE c.Score BETWEEN 1 AND 5 AND NOT EXISTS(SELECT * FROM Votes AS v WHERE v.PostId = c.Id AND v.VoteTypeId = 3);
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.UpVotes) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10;
SELECT sp.power_name FROM `superhero` sh JOIN `hero_power` hp ON sh.id = hp.hero_id JOIN `superpower` sp ON hp.power_id = sp.id WHERE sh.superhero_name = '3-D Man';
SELECT COUNT(*) FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength';
SELECT COUNT(*) FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200;
SELECT s.full_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15;
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';
SELECT c.colour FROM `superhero` AS s JOIN `colour` AS c ON s.skin_colour_id = c.id WHERE s.superhero_name = 'Apocalypse'
SELECT COUNT(*) FROM `superhero` AS s JOIN `colour` AS c ON s.eye_colour_id = c.id JOIN `hero_power` AS hp ON s.id = hp.hero_id WHERE c.colour = 'Blue' AND EXISTS(SELECT * FROM `superpower` AS sp WHERE sp.power_name = 'Agility' AND sp.id = hp.power_id);
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c1 ON s.eye_colour_id = c1.id JOIN colour AS c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Blond';
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT s.superhero_name, s.height_cm FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC;
SELECT p.publisher_name FROM `superhero` AS s JOIN `publisher` AS p ON s.publisher_id = p.id WHERE s.superhero_name = 'Sauron';
SELECT c.colour AS Eye_Color, COUNT(s.id) AS Superhero_Count FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id WHERE s.publisher_id = 1 GROUP BY s.eye_colour_id ORDER BY Superhero_Count DESC;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'ABC Studios';
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND sp.power_name = 'Super Strength';
SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics';
SELECT p.publisher_name FROM publisher AS p JOIN superhero AS s ON p.id = s.publisher_id JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute JOIN attribute ON attribute_id = id WHERE attribute_name = 'Speed');
SELECT COUNT(*) FROM `superhero` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` JOIN `colour` ON `superhero.eye_colour_id` = `colour.id` WHERE `publisher.publisher_name` = 'Marvel Comics' AND `colour.colour` = 'Gold';
SELECT p.publisher_name FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE s.superhero_name = 'Blue Beetle II';
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Intelligence' ORDER BY ha.attribute_value LIMIT 1;
SELECT T2.race FROM `superhero` AS T1 JOIN `race` AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat';
SELECT s.superhero_name FROM `superhero` AS s JOIN `hero_attribute` AS ha ON s.id = ha.hero_id JOIN `attribute` AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50;
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';
SELECT COUNT(*) FROM `superhero` JOIN `gender` ON `superhero.gender_id` = `gender.id` JOIN `hero_attribute` ON `superhero.id` = `hero_attribute.hero_id` JOIN `attribute` ON `hero_attribute.attribute_id` = `attribute.id` WHERE `gender.gender` = 'Female' AND `attribute.attribute_name` = 'Strength' AND `hero_attribute.attribute_value` = 100;
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id GROUP BY s.superhero_name ORDER BY COUNT(hp.power_id) DESC LIMIT 1;
SELECT COUNT(*) FROM `superhero` WHERE `race_id` = (SELECT `id` FROM `race` WHERE `race` = 'Vampire');
SELECT CAST(SUM(CASE WHEN T3.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.id) FROM hero_power AS T1 JOIN superhero AS T2 ON T1.hero_id = T2.id JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T2.alignment = 'Bad';
SELECT (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics') - (SELECT COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics')
SELECT id FROM publisher WHERE publisher_name = 'Star Trek';
SELECT AVG(subquery.attribute_value) FROM (SELECT SUM(hero_attribute.attribute_value) as attribute_value FROM hero_attribute GROUP BY hero_id) as subquery;
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL;
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok';
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Female';
SELECT sp.power_name FROM superhero sh JOIN gender g ON sh.gender_id = g.id JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' LIMIT 5;
SELECT s.superhero_name FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.race = 'Alien';
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.height_cm BETWEEN 170 AND 190 AND c.colour = 'No Colour';
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id WHERE hp.hero_id = 56;
SELECT s.full_name FROM `superhero` AS s JOIN `race` AS r ON s.race_id = r.id WHERE r.race = 'Demi-God' LIMIT 5;
SELECT COUNT(*) FROM `superhero` JOIN `alignment` ON `superhero`.`alignment_id` = `alignment`.`id` WHERE `alignment`.`alignment` = 'Bad';
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 169;
SELECT c.colour FROM `superhero` s JOIN `race` r ON s.race_id = r.id JOIN `colour` c ON s.hair_colour_id = c.id WHERE s.height_cm = 185 AND r.race = 'human';
SELECT c.colour FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id WHERE s.weight_kg = (SELECT MAX(weight_kg) FROM `superhero`);
SELECT CAST(COUNT(CASE WHEN T2.publisher_id = 13 THEN 1 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180;
SELECT T1.superhero_name FROM `superhero` AS T1 JOIN `gender` AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM `superhero`)
SELECT T2.power_name FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T1.power_id ORDER BY COUNT(T1.power_id) DESC LIMIT 1;
SELECT ha.attribute_value FROM hero_attribute AS ha JOIN superhero AS s ON ha.hero_id = s.id WHERE s.superhero_name = 'Abomination';
SELECT sp.power_name FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1;
SELECT COUNT(*) FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'stealth';
SELECT s.full_name FROM superhero AS s JOIN hero_attribute AS ha ON s.id = ha.hero_id JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' ORDER BY ha.attribute_value DESC LIMIT 1;
SELECT CAST(COUNT(CASE WHEN s.skin_colour_id = 1 THEN 1 END) AS REAL) / COUNT(s.id) FROM superhero s;
SELECT COUNT(*) FROM `superhero` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` WHERE `publisher.publisher_name` = 'Dark Horse Comics';
SELECT s.superhero_name FROM `superhero` AS s JOIN `hero_attribute` AS ha ON s.id = ha.hero_id JOIN `attribute` AS a ON ha.attribute_id = a.id WHERE s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics') AND a.attribute_name = 'Durability' ORDER BY ha.attribute_value DESC LIMIT 1;
SELECT c.colour FROM `superhero` AS s JOIN `colour` AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Abraham Sapien';
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';
SELECT c1.colour AS eye_colour, c2.colour AS hair_colour, c3.colour AS skin_colour FROM `superhero` s JOIN `gender` g ON s.gender_id = g.id JOIN `publisher` p ON s.publisher_id = p.id JOIN `colour` c1 ON s.eye_colour_id = c1.id JOIN `colour` c2 ON s.hair_colour_id = c2.id JOIN `colour` c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND p.publisher_name = 'Dark Horse Comics';
SELECT s.superhero_name, p.publisher_name FROM superhero AS s JOIN colour AS c1 ON s.eye_colour_id = c1.id JOIN colour AS c2 ON s.hair_colour_id = c2.id JOIN colour AS c3 ON s.skin_colour_id = c3.id JOIN publisher AS p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.eye_colour_id = s.skin_colour_id;
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.superhero_name = 'A-Bomb';
SELECT CAST(SUM(CASE WHEN T3.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.gender) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN colour AS T3 ON T1.skin_colour_id = T3.id WHERE T2.gender = 'Female';
SELECT superhero_name, race_id FROM superhero WHERE full_name = 'Charles Chandler';
SELECT T2.gender FROM `superhero` AS T1 JOIN `gender` AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13';
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id WHERE hp.power_id IN (SELECT id FROM superpower WHERE power_name = 'Adaptation');
SELECT COUNT(*) FROM `hero_power` WHERE `hero_id` = (SELECT `id` FROM `superhero` WHERE `superhero_name` = 'Amazo');
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon';
SELECT s.height_cm FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Amber';
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c1 ON s.eye_colour_id = c1.id JOIN colour AS c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Black' AND c2.colour = 'Black';
SELECT c.colour FROM superhero s JOIN colour c ON s.eye_colour_id = c.id WHERE s.skin_colour_id = (SELECT id FROM colour WHERE colour = 'Gold');
SELECT s.full_name FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE r.race = 'Vampire';
SELECT s.superhero_name FROM superhero AS s JOIN alignment AS a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral';
SELECT COUNT(*) FROM (SELECT ha.hero_id, MAX(ha.attribute_value) AS max_strength FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' GROUP BY ha.hero_id HAVING max_strength = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = (SELECT id FROM attribute WHERE attribute_name = 'Strength'))) as result;
SELECT r.race, a.alignment FROM superhero s JOIN race r ON s.race_id = r.id JOIN alignment a ON s.alignment_id = a.id WHERE s.superhero_name = 'Cameron Hicks';
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
SELECT AVG(T1.weight_kg) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id WHERE T2.race = 'Alien';
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler')
SELECT AVG(height_cm) AS average_height FROM superhero;
SELECT T3.power_name FROM superhero AS T1 JOIN hero_power AS T2 ON T1.id = T2.hero_id JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination';
SELECT COUNT(*) FROM superhero JOIN gender ON superhero.gender_id = gender.id JOIN race ON superhero.race_id = race.id WHERE race.race = 'god/eternal' AND gender.gender = 'Male';
SELECT s.superhero_name FROM (SELECT ha.hero_id, MAX(ha.attribute_value) AS max_speed FROM hero_attribute ha JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' GROUP BY ha.hero_id) fas JOIN superhero s ON fas.hero_id = s.id
SELECT COUNT(*) FROM `superhero` INNER JOIN `alignment` ON `superhero.alignment_id` = `alignment.id` WHERE `alignment.alignment` = 'Neutral';
SELECT a.attribute_name, ha.attribute_value FROM `superhero` AS s JOIN `hero_attribute` AS ha ON s.id = ha.hero_id JOIN `attribute` AS a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man';
SELECT s.superhero_name FROM superhero AS s JOIN colour AS c1 ON s.eye_colour_id = c1.id JOIN colour AS c2 ON s.hair_colour_id = c2.id WHERE c1.colour = 'Blue' AND c2.colour = 'Brown';
SELECT s.superhero_name, p.publisher_name FROM superhero AS s JOIN publisher AS p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1;
SELECT CAST(COUNT(*) FILTER (WHERE T2.colour = 'Blue') AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id;
SELECT CAST(COUNT(CASE WHEN gender_id = 1 THEN 1 END) AS REAL) / COUNT(CASE WHEN gender_id = 2 THEN 1 END) AS ratio FROM superhero;
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1;
SELECT id FROM superpower WHERE power_name = 'cryokinesis';
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;
SELECT c.colour FROM `superhero` AS s JOIN `colour` AS c ON s.eye_colour_id = c.id WHERE s.full_name = 'Karen Beecher-Duncan';
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON hp.hero_id = sh.id WHERE sh.full_name = 'Helen Parr';
SELECT r.race FROM `superhero` s JOIN `race` r ON s.race_id = r.id WHERE s.weight_kg = 108 AND s.height_cm = 188;
SELECT p.publisher_name FROM `superhero` s JOIN `publisher` p ON s.publisher_id = p.id WHERE s.id = 38;
SELECT s.race_id FROM hero_attribute ha JOIN superhero s ON ha.hero_id = s.id WHERE ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)
SELECT a.alignment, sp.power_name FROM superhero AS s JOIN alignment AS a ON s.alignment_id = a.id JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Atom IV';
SELECT s.full_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE c.colour = 'Blue' LIMIT 5;
SELECT AVG(T2.attribute_value) FROM superhero AS T1 JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3;
SELECT c.colour FROM `superhero` s JOIN `hero_attribute` ha ON s.id = ha.hero_id JOIN `colour` c ON s.skin_colour_id = c.id WHERE ha.attribute_value = 100;
SELECT COUNT(*) FROM `superhero` JOIN `alignment` ON `superhero.alignment_id` = `alignment.id` JOIN `gender` ON `superhero.gender_id` = `gender.id` WHERE `alignment.id` = 1 AND `gender.id` = 2;
SELECT s.superhero_name FROM superhero AS s INNER JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;
SELECT s.race_id FROM superhero AS s JOIN gender AS g ON s.gender_id = g.id JOIN colour AS c ON s.hair_colour_id = c.id WHERE g.gender = 'Male' AND c.colour = 'Blue';
SELECT CAST(COUNT(CASE WHEN T2.gender = 'Female' THEN 1 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.alignment_id = 2;
SELECT (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 7 AND (weight_kg = 0 OR weight_kg IS NULL)) - (SELECT COUNT(*) FROM superhero WHERE eye_colour_id = 1 AND (weight_kg = 0 OR weight_kg IS NULL));
SELECT ha.attribute_value FROM hero_attribute AS ha JOIN attribute AS a ON ha.attribute_id = a.id JOIN superhero AS s ON ha.hero_id = s.id WHERE s.superhero_name = 'Hulk' AND a.attribute_name = 'Strength';
SELECT sp.power_name FROM `superhero` sh JOIN `hero_power` hp ON sh.id = hp.hero_id JOIN `superpower` sp ON hp.power_id = sp.id WHERE sh.superhero_name = 'Ajax';
SELECT COUNT(*) FROM superhero JOIN colour ON superhero.skin_colour_id = colour.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad';
SELECT COUNT(*) FROM `superhero` JOIN `gender` ON `superhero.gender_id` = `gender.id` JOIN `publisher` ON `superhero.publisher_id` = `publisher.id` WHERE `gender.gender` = 'Female' AND `publisher.publisher_name` = 'Marvel Comics';
SELECT s.superhero_name FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Wind Control' ORDER BY s.superhero_name ASC;
SELECT s.gender_id FROM superhero AS s JOIN hero_power AS hp ON s.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force';
SELECT s.superhero_name FROM `superhero` AS s JOIN `publisher` AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics' ORDER BY s.weight_kg DESC LIMIT 1;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.race <> 'Human' AND T3.publisher_name = 'Dark Horse Comics';
SELECT COUNT(DISTINCT ha.hero_id) FROM hero_attribute AS ha JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = 100;
SELECT (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'DC Comics')) - (SELECT COUNT(*) FROM superhero WHERE publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) AS difference;
SELECT a.attribute_name FROM `attribute` AS a JOIN `hero_attribute` AS ha ON a.id = ha.attribute_id WHERE ha.hero_id = (SELECT id FROM `superhero` WHERE superhero_name = 'Black Panther') AND ha.attribute_value = (SELECT MIN(attribute_value) FROM `hero_attribute` WHERE hero_id = (SELECT id FROM `superhero` WHERE superhero_name = 'Black Panther'));
SELECT T2.colour FROM `superhero` AS T1 JOIN `colour` AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination';
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero);
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';
SELECT CAST(SUM(CASE WHEN T2.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM superhero AS T1 JOIN gender AS T2 ON T1.gender_id = T2.id JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T3.publisher_name = 'George Lucas';
SELECT CAST(COUNT(CASE WHEN T3.alignment = 'Good' THEN 1 END) AS REAL) * 100 / COUNT(T2.publisher_id) FROM superhero AS T1 JOIN publisher AS T2 ON T1.publisher_id = T2.id JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.publisher_name = 'Marvel Comics';
SELECT COUNT(id) FROM superhero WHERE full_name LIKE 'John%';
SELECT ha.hero_id FROM hero_attribute ha WHERE ha.attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute);
SELECT full_name FROM superhero WHERE superhero_name = 'Alien';
SELECT s.full_name FROM superhero AS s JOIN colour AS c ON s.eye_colour_id = c.id WHERE s.weight_kg < 100 AND c.colour = 'Brown';
SELECT ha.attribute_value FROM hero_attribute AS ha JOIN superhero AS sh ON ha.hero_id = sh.id WHERE sh.superhero_name = 'Aquababy';
SELECT s.weight_kg, r.race FROM superhero AS s JOIN race AS r ON s.race_id = r.id WHERE s.id = 40;
SELECT AVG(T1.height_cm) FROM superhero AS T1 JOIN alignment AS T2 ON T1.alignment_id = T2.id WHERE T2.alignment = 'Neutral';
SELECT s.id AS hero_id FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.power_name = 'Intelligence' GROUP BY s.id ORDER BY ha.attribute_value DESC
SELECT c.colour FROM `superhero` s JOIN `colour` c ON s.eye_colour_id = c.id WHERE s.superhero_name = 'Blackwulf';
SELECT sp.power_name FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id JOIN superhero AS sh ON sh.id = hp.hero_id WHERE sh.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero);
SELECT T1.driverRef FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.raceId = 20 ORDER BY T1.q1 DESC LIMIT 5;
SELECT d.surname FROM results AS r JOIN drivers AS d ON r.driverId = d.driverId JOIN races AS ra ON r.raceId = ra.raceId WHERE ra.raceId = 19 ORDER BY r.q2 ASC LIMIT 1;
SELECT T2.year FROM locations AS T1 JOIN circuits AS T3 ON T1.locationId = T3.locationId JOIN races AS T2 ON T3.circuitId = T2.circuitId WHERE T1.name = 'Shanghai';
SELECT T2.url FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Circuit de Barcelona-Catalunya';
SELECT r.name FROM races AS r JOIN circuits AS c ON r.circuitId = c.circuitId WHERE c.country = 'Germany';
SELECT DISTINCT T2.positionText FROM constructors AS T1 JOIN results AS T2 ON T1.constructorId = T2.constructorId WHERE T1.name = 'Renault';
SELECT COUNT(*) FROM `races` JOIN `circuits` ON `races.circuitId` = `circuits.circuitId` JOIN `countries` ON `circuits.countryId` = `countries.countryId` WHERE `races.year` = 2010 AND `countries.continent` NOT IN ('Asia', 'Europe')
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN countries AS T3 ON T1.countryId = T3.countryId WHERE T3.name = 'Spain';
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.name = 'Australian Grand Prix';
SELECT * FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Sepang International Circuit';
SELECT T2.time FROM circuits AS T1 JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.name = 'Abu Dhabi Grand Prix';
SELECT c.nationality FROM constructors AS c JOIN results AS r ON c.constructorId = r.constructorId WHERE r.raceId = 24 AND r.points = 1;
SELECT T1.q1 FROM qualifying AS T1 JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 354 AND T2.forename = 'Bruno' AND T2.surname = 'Senna';
SELECT d.nationality FROM qualifying AS q JOIN races AS r ON q.raceId = r.raceId JOIN results AS res ON q.driverId = res.driverId AND q.constructorId = res.constructorId JOIN drivers AS d ON res.driverId = d.driverId WHERE q.q2Time = '01:40' AND r.raceId = 355;
SELECT q.number FROM qualifying AS q JOIN results AS r ON q.raceId = r.raceId AND q.driverId = r.driverId WHERE q.q3 LIKE '1:54%' AND r.raceId = 903;
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NULL;
SELECT T1.year FROM races AS T1 JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.resultId = 901;
SELECT COUNT(*) FROM results JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29' AND results.time IS NOT NULL;
SELECT d.driverId, d.forename, d.surname, d.dob FROM results AS r JOIN races AS ra ON r.raceId = ra.raceId JOIN drivers AS d ON r.driverId = d.driverId WHERE ra.raceId = 592 AND r.time IS NOT NULL ORDER BY d.dob DESC LIMIT 1;
SELECT T3.url FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 161 AND T1.time LIKE '0:01:%';
SELECT d.nationality FROM drivers AS d JOIN results AS r ON d.driverId = r.driverId WHERE r.raceId IN (SELECT raceId FROM races WHERE raceNo = 933) ORDER BY r.fastestLapSpeed DESC LIMIT 1;
SELECT c.lat, c.lng FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId WHERE r.name = 'Malaysian Grand Prix';
