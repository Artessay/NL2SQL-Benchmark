  SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) FROM frpm WHERE `County Name` = 'Alameda';
  SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS EligibleFreeRate FROM frpm ORDER BY EligibleFreeRate ASC LIMIT 3
SELECT s.Zip  FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`District Name` = 'Fresno County Office of Education' AND f.`Charter School (Y/N)` = 1; 
SELECT MailStreet FROM schools WHERE CDSCode = (SELECT CDSCode FROM frpm ORDER BY `FRPM Count (K-12)` DESC LIMIT 1); 
  SELECT s.Phone FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Charter Funding Type` = 'Directly funded' AND f.`Charter School (Y/N)` = 1 AND s.OpenDate > '2000-01-01';
SELECT COUNT(s.School) FROM satscores AS sa INNER JOIN schools AS sc ON sa.cds = sc.CDSCode WHERE sa.AvgScrMath > 400 AND sc.Virtual = 'F'; 
SELECT s.School  FROM schools s  INNER JOIN satscores sat ON s.CDSCode = sat.cds  WHERE sat.NumTstTakr > 500 AND s.Magnet = 1; 
SELECT s.Phone FROM schools s  JOIN satscores ss ON s.CDSCode = ss.cds  WHERE ss.NumGE1500 IS NOT NULL  GROUP BY s.Phone  ORDER BY SUM(ss.NumGE1500) DESC  LIMIT 1; 
SELECT T2.NumTstTakr FROM frpm AS T1  INNER JOIN satscores AS T2  ON T1.CDSCode = T2.cds  WHERE T1.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm); 
SELECT COUNT(*)  FROM frpm  INNER JOIN satscores  ON frpm.CDSCode = satscores.cds  WHERE AvgScrMath > 560 AND `Charter Funding Type` = 'Directly funded'; 
  To determine the FRPM (Free or Reduced-Price Meal) count for the school with the highest average SAT score, we need to analyze both datasets. However, upon examining the provided data:  1. **SAT Scores Dataset (`satscores`)**:    - The highest average SAT score is **521**.    - This corresponds to the `cds` value **'1611190000000'**.  2. **FRPM Counts Dataset (`frpm`)**:    - We check if there's a matching `CDSCode` for **'1611190000000'** in the `frpm` table.    - Upon reviewing all entries, none of the `CDSCode` values match **'1611190000000'**.  Since there is no corresponding record in the FRPM dataset for the school with the highest SAT score, we conclude that the FRPM count is not available for this school.  **Answer:** There is no FRPM data available for the school with the highest average SAT score.
  SELECT CDSCode FROM frpm WHERE (`Enrollment (K-12)` + `Enrollment (Ages 5-17)`) > 500
WITH      -- Calculate average SAT score for each school     sat_scores AS (         SELECT school_id, AVG(sat_score) AS avg_sat         FROM student_data         GROUP BY school_id     ),          -- Calculate percentage of Asian students for each school     asian_percentages AS (         SELECT school_id,                 CAST(COUNT(CASE WHEN ethnicity = 'Asian' THEN 1 ELSE NULL END) AS REAL) / COUNT(*) * 100 AS asian_pct         FROM student_data         GROUP BY school_id     ),          -- Rank schools by SAT scores to find the top 20%     ranked_sat AS (         SELECT school_id, avg_sat,                ROW_NUMBER() OVER (ORDER BY avg_sat DESC) as sat_rank,                COUNT(*) OVER () as total_schools         FROM sat_scores     ),          -- Determine the cutoff for top 20% SAT scores     cutoff_sat AS (         SELECT MIN(avg_sat) AS sat_cutoff         FROM ranked_sat         WHERE sat_rank > 0.8 * total_schools     ),          -- Rank schools by Asian percentages to find the top 20%     ranked_asian AS (         SELECT school_id, asian_pct,                ROW_NUMBER() OVER (ORDER BY asian_pct DESC) as asian_rank,                COUNT(*) OVER () as total_schools         FROM asian_percentages     ),          -- Determine the cutoff for top 20% Asian percentages     cutoff_asian AS (         SELECT MIN(asian_pct) AS asian_cutoff         FROM ranked_asian         WHERE asian_rank > 0.8 * total_schools     )      -- Join and filter schools that meet both criteria SELECT s.school_id, s.avg_sat, a.asian_pct FROM sat_scores s JOIN asian_percentages a ON s.school_id = a.school_id WHERE s.avg_sat >= (SELECT sat_cutoff FROM cutoff_sat) AND a.asian_pct >= (SELECT asian_cutoff FROM cutoff_asian); 
SELECT      s.*,     COALESCE(t.total_takers, 0) AS total_takers,     COALESCE(ROUND((t.passed_count * 1.0 / t.total_takers) * 100, 2), 0) AS pass_percentage FROM      schools s LEFT JOIN  (     SELECT          SchoolCDSCode,         COUNT(DISTINCT StudentID) AS total_takers,         SUM(CASE WHEN Passed = 'Yes' THEN 1 ELSE 0 END) AS passed_count     FROM          exams     GROUP BY          SchoolCDSCode ) t ON s.CDSCode = t.SchoolCDSCode; 
SELECT NCESSchool, `Enrollment (Ages 5-17)` FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode ORDER BY `Enrollment (Ages 5-17)` DESC LIMIT 5; 
SELECT District, MAX(AvgScrRead) AS HighestAverage  FROM satscores  INNER JOIN schools  ON cds = CDSCode  WHERE StatusType = 'Active'  GROUP BY District; 
  To determine how many schools in Alameda have fewer than 100 test takers, we need to join the `satscores` and `schools` tables on their respective CDS codes. We then filter for schools where the county is 'Alameda' and the number of test takers is less than 100.  **Answer:**  SELECT COUNT(*) FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE County = 'Alameda' AND NumTstTakr < 100
  SELECT sname, AvgScrWrite, CharterNum FROM satscores WHERE AvgScrWrite > 499 AND CharterNum IS NOT NULL ORDER BY AvgScrWrite DESC;
  SELECT COUNT(DISTINCT s.CDSCode) FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode INNER JOIN satscores sa ON s.CDSCode = sa.cds WHERE s.County = 'Fresno' AND f.`Charter Funding Type` = 'Directly Funded' AND sa.NumTstTakr <= 250
SELECT s.Phone FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE ss.AvgScrMath IS NOT NULL AND ss.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores WHERE AvgScrMath IS NOT NULL) 
SELECT COUNT(*) AS num_schools  FROM frpm  INNER JOIN schools  ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Amador' AND frpm.`Low Grade` = '9' AND frpm.`High Grade` = '12'; 
  SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Los Angeles' AND `Free Meal Count (K-12)` > 500 AND `Free Meal Count (K-12)` < 700
SELECT sname, NumTstTakr FROM satscores WHERE cname = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1; 
SELECT s.School, s.StreetAbr  FROM frpm f  INNER JOIN schools s  ON f.CDSCode = s.CDSCode  WHERE (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30; 
SELECT frpm.`School Name` FROM frpm INNER JOIN satscores ON frpm.CDSCode = satscores.cds WHERE (frpm.`Free Meal Count (K-12)` / frpm.`Enrollment (K-12)`) > 0.1 AND satscores.NumGE1500 >= 1 AND frpm.`Enrollment (K-12)` > 0; 
WITH riverside_data AS (   SELECT      s.sname,     f.`Charter Funding Type`,     AVG(s.AvgScrMath) OVER () as avg_score   FROM frpm f   JOIN satscores s ON f.CDSCode = s.cds   WHERE `District Name` = 'Riverside' ) SELECT    sname AS SchoolName,   `Charter Funding Type` AS FundingType FROM riverside_data WHERE avg_score > 400; 
SELECT s.`School Name`, s.Street, s.City, s.State, s.Zip  FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`School Type` = 'High School'  AND s.County = 'Monterey' AND f.`Free Meal Count (Ages 5-17)` > 800; 
SELECT s.SchoolName, sat.AverageScore, s.Phone FROM Schools s INNER JOIN SATScores sat ON s.SchoolID = sat.SchoolID WHERE sat.AverageScore > 500; 
SELECT id, name, date, amount FROM (   SELECT id, name, date, amount,          AVG(amount) OVER (PARTITION BY name) AS avg_amount_by_name   FROM frpm ) AS subquery WHERE amount > avg_amount_by_name; 
SELECT s.OpenDate FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE f.`Enrollment (K-12)` = (SELECT MAX(`Enrollment (K-12)`) FROM frpm); 
SELECT City, `Enrollment (K-12)`  FROM frpm  INNER JOIN schools  ON frpm.CDSCode = schools.CDSCode  ORDER BY `Enrollment (K-12)` ASC  LIMIT 5; 
  SELECT `Enrollment (K-12)`, `Free Meal Count (K-12)`, `Free Meal Count (K-12)` / `Enrollment (K-12)` AS 'Eligible Free Rate' FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 2 OFFSET 9
SELECT CDSCode, `Enrollment (K-12)`, `FRPM Count (K-12)`, (`FRPM Count (K-12)` / `Enrollment (K-12)`) AS meal_rate FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.SOC = '66' ORDER BY `FRPM Count (K-12)` DESC LIMIT 5; 
SELECT s.`School Name`, sc.`Website` FROM frpm f INNER JOIN schools sc ON f.CDSCode = sc.CDSCode WHERE f.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000; 
  SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS FreeRate FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE AdmFName1 = 'Kacey' AND AdmLName1 = 'Gibson';
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1; 
  SELECT T3.AdmFName1 || ' ' || T3.AdmLName1 AS FullName FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode INNER JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) UNION ALL SELECT T3.AdmFName2 || ' ' || T3.AdmLName2 AS FullName FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode INNER JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores) UNION ALL SELECT T3.AdmFName3 || ' ' || T3.AdmLName3 AS FullName FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode INNER JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores);
 Street: (value from s.Street) City: (value from s.City) Zip: (value from s.Zip) State: (value from s.State) 
SELECT s.Website  FROM schools s  INNER JOIN satscores sa ON s.CDSCode = sa.cds  WHERE s.County = 'Los Angeles' AND sa.NumTstTakr BETWEEN 2000 AND 3000; 
SELECT AVG(s.NumTstTakr) AS average_test_takers FROM satscores s INNER JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.County = 'Fresno' AND sc.OpenDate LIKE '1980%'; 
  SELECT Phone FROM schools INNER JOIN satscores ON CDSCode = cds WHERE District = 'Fresno Unified' AND AvgScrRead IS NOT NULL ORDER BY AvgScrRead ASC LIMIT 1;
SELECT SchoolName FROM (     SELECT s.School,             ROW_NUMBER() OVER (PARTITION BY County ORDER BY ss.AvgScrRead DESC) AS RowNum     FROM schools s     INNER JOIN satscores ss ON s.CDSCode = ss.cds     WHERE s.Virtual = 'F' AND ss.AvgScrRead IS NOT NULL ) WHERE RowNum <= 5 ORDER BY School, AvgScrRead DESC; 
  SELECT EdOpsName FROM schools INNER JOIN satscores ON CDSCode = cds WHERE AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores WHERE AvgScrMath IS NOT NULL);
SELECT    AvgScrMath,   (AvgScrRead + AvgScrMath + AvgScrWrite) AS TotalScore FROM    satscores WHERE    AvgScrRead IS NOT NULL AND    AvgScrMath IS NOT NULL AND    AvgScrWrite IS NOT NULL; 
SELECT s.AvgSAT, sc.City FROM sat_scores s JOIN schools sc ON s.SchoolID = sc.SchoolID WHERE s.NumStudents1000Plus = (SELECT MAX(NumStudents1000Plus) FROM sat_scores); 
SELECT s.School, ss.AvgScrWrite FROM schools s JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich'; 
SELECT s.School, f.`Enrollment (K-12)` FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.DOC = '31' ORDER BY f.`Enrollment (K-12)` DESC; 
  SELECT COUNT(School) / 12 AS MonthlyAverage FROM schools WHERE County = 'Alameda' AND DOC = '52' AND STRFTIME('%Y', OpenDate) = '1980';
SELECT    (SELECT COUNT(StatusType) FROM schools WHERE County = 'Orange' AND DOC = '54') /    (SELECT COUNT(StatusType) FROM schools WHERE County = 'Orange' AND DOC = '52') AS Ratio; 
SELECT County, COUNT(*) as num_closed FROM schools WHERE ClosedDate IS NOT NULL GROUP BY County ORDER BY num_closed DESC; 
SELECT COALESCE(T1.Street, T1.MailStreet) AS PostalAddress, T1.School FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath IS NOT NULL ORDER BY T2.AvgScrMath DESC LIMIT 1 OFFSET 6; 
SELECT      s.MailStreet,     MIN(sa.score) AS min_score,     MAX(sa.score) AS max_score,     AVG(sa.score) AS avg_score FROM      schools s LEFT JOIN      satscores sa ON s.CDSCode = sa.cds GROUP BY      s.MailStreet ORDER BY      s.MailStreet ASC; 
  SELECT COUNT(*) FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode WHERE schools.MailCity = 'Lakeport' AND AvgScrRead IS NOT NULL AND AvgScrMath IS NOT NULL AND AvgScrWrite IS NOT NULL AND (AvgScrRead + AvgScrMath + AvgScrWrite) >= 1500
SELECT SUM(s.NumTstTakr)  FROM satscores s  INNER JOIN schools sc ON s.cds = sc.CDSCode  WHERE sc.MailCity = 'Fresno'; 
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'; 
SELECT      (SELECT COUNT(*) FROM schools WHERE County = 'Colusa' AND MailState = 'CA') /      (SELECT COUNT(*) FROM schools WHERE County = 'Humboldt' AND MailState = 'CA') AS Ratio; 
  SELECT COUNT(CDSCode) FROM schools WHERE MailState = 'CA' AND City = 'San Joaquin' AND StatusType = 'Active';
SELECT s.DistrictName, s.SchoolName, sc.OverallPerformance, sc.AcademicPerformance, sc.EnglishPerformance, sc.MathPerformance, sc.SciencePerformance  FROM satscores sc  LEFT JOIN schools s ON sc.cds = s.CDSCode; 
  SELECT `Phone`, `Ext`, `School` FROM `schools` WHERE `Zip` = '95203-3704'
  SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez');
  SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin';
SELECT COUNT(*) FROM schools WHERE Charter = 1 AND City = 'Hickman' AND DOC = '52'; 
SELECT COUNT(*)  FROM frpm  JOIN schools ON frpm.CDSCode = schools.CDSCode  WHERE schools.County = 'Los Angeles'  AND schools.Charter = 0  AND (Free Meal Count (K-12) * 100 / Enrollment (K-12)) < 0.18; 
  SELECT School, City, AdmFName1 || ' ' || AdmLName1 AS Administrator FROM schools WHERE Charter = 1 AND CharterNum = '00D2';
  To answer the question of finding the number of schools with a mailing city in Hickman and belonging to charter number 00D4, we'll use the COUNT(*) function with specific conditions.  **Answer:**  SELECT COUNT(*) FROM `schools` WHERE MailCity = 'Hickman' AND CharterNum = '00D4';
SELECT      ((         SELECT COUNT(*) FROM schools WHERE County = 'Santa Clara' AND FundingType = 'locally funded'     ) / (         SELECT COUNT(*) FROM schools WHERE County = 'Santa Clara'     )) * 100; 
SELECT COUNT(*) FROM `schools` WHERE County = 'Stanislaus' AND FundingType = 'Directly Funded' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'; 
  SELECT COUNT(*) FROM schools WHERE DOCType = 'Community College District' AND City = 'San Francisco' AND EXTRACT(YEAR FROM ClosedDate) = 1989;
SELECT County, COUNT(County) AS ClosureCount FROM schools  WHERE StatusType = 'Closed' AND SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY ClosureCount DESC LIMIT 1; 
  SELECT `NCESDist` FROM `schools` WHERE `SOC` = 31
  SELECT StatusType, COUNT(*) FROM schools WHERE County = 'Alpine' AND School = 'District Community Day' GROUP BY StatusType
  SELECT T2.`District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.City = 'Fresno' AND T1.Magnet = 0
SELECT f.`Enrollment (Ages 5-17)`  FROM frpm f  INNER JOIN schools s  ON f.CDSCode = s.CDSCode  WHERE s.EdOpsCode = 'SSS' AND s.City = 'Fremont' AND f.`Academic Year` = '2014-2015'; 
SELECT f.`FRPM Count (Ages 5-17)` FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.MailStreet = 'PO Box 1040'; 
SELECT MAX(f.LowGrade) AS LowestGrade  FROM schools s  JOIN frpm f ON s.CDSCode = f.CDSCode  WHERE s.NCESDist = '0613360' AND s.EdOpsCode = 'SPECON'; 
SELECT s.School, s.EILName FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`County Code` = '37' AND f.`NSLP Provision Status` = 'Breakfast Provision 2'; 
SELECT s.City  FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Merced'   AND f.`NSLP Provision Status` = 'Lunch Provision 2'   AND f.LowGrade = '9'   AND f.HighGrade = '12'   AND s.EILCode = 'HS'; 
SELECT s.School, (f.`FRPM Count (Ages 5-17)` / f.`Enrollment (Ages 5-17)` * 100) AS PercentEligibleFRPM FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND s.GSserved = 'K-9'; 
  SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT County, COUNT(*) AS count  FROM schools  WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F'  GROUP BY County  ORDER BY count DESC  LIMIT 1; 
SELECT s.`School Name`, f.`School Type`, sc.Latitude  FROM schools sc INNER JOIN frpm f ON sc.CDSCode = f.CDSCode WHERE sc.Latitude = (SELECT MAX(Latitude) FROM schools); 
SELECT s.City, f.`School Name`, f.`Low Grade` FROM schools s JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1; 
SELECT GSoffered FROM schools WHERE ABS(longitude) = (SELECT MAX(ABS(longitude)) FROM schools); 
SELECT      COUNT(*) as total_multiple_provisions,     COUNT(DISTINCT city) as number_of_cities,     (SELECT COUNT(city) FROM schools WHERE is_magnet = 1 AND grade_span = 'K-8' AND provision_type = 'Multiple') as per_city_counts FROM (     SELECT city     FROM schools     WHERE is_magnet = 1 AND grade_span = 'K-8' AND provision_type = 'Multiple' ) AS sub; 
SELECT AdmFName1, COUNT(*) as Frequency FROM Administrators GROUP BY AdmFName1 ORDER BY Frequency DESC LIMIT 2; 
SELECT frpm.`District Code`, (frpm.`Free Meal Count (K-12)` / frpm.`Enrollment (K-12)`) * 100 AS Percent_Eligible_Free FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Alusine'; 
  SELECT County, District, School, AdmLName1 FROM schools WHERE CharterNum = '40'
SELECT AdmEmail1, AdmEmail2, AdmEmail3  FROM schools  WHERE County = 'San Bernardino'    AND District = 'San Bernardino City Unified'    AND (SOC = '62' OR DOCType = '54')    AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31'; 
SELECT s.name AS school_name, COUNT(st.id) as o_grade_count FROM students st LEFT JOIN schools s ON st.school_id = s.id WHERE st.grade = 'o' GROUP BY s.name ORDER BY o_grade_count DESC LIMIT 1; 
SELECT COUNT(a.district_id)  FROM account a  JOIN district d ON a.district_id = d.district_id  WHERE a.frequency = 'POPLATEK PO OBRATU' AND d.A3 = 'East Bohemia'; 
SELECT COUNT(a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN loan l ON a.account_id = l.account_id WHERE d.A3 = 'Prague'; 
SELECT      AVG(A12) AS avg_1995,     AVG(A13) AS avg_1996 FROM district; 
SELECT COUNT(DISTINCT d.district_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' AND d.A11 > 6000 AND d.A11 < 10000; 
SELECT COUNT(c.client_id) AS count  FROM client c  INNER JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'M' AND d.A3 = 'North Bohemia' AND d.A11 > 8000; 
-- Step 1: Find the oldest female client(s) WITH OldestFemales AS (     SELECT c.client_id, c.first_name, c.last_name, c.birth_date,            d.A11 as district_avg_salary,            ROW_NUMBER() OVER (ORDER BY c.birth_date ASC) as row_num     FROM client c     JOIN district d ON c.district_id = d.district_id     WHERE c.gender = 'F' ) -- Step 2: Identify the oldest among them and get their district average salary , OldestFemale AS (     SELECT *     FROM OldestFemales     WHERE row_num = 1 ) -- Step 3: Find all accounts linked to this client's district with the lowest A11 SELECT a.account_id,        o.client_id,        o.first_name,        o.last_name,        o.district_avg_salary as lowest_district_avg_salary FROM account a JOIN OldestFemale o ON a.district_id = o.district_id; 
WITH top_districts AS (     SELECT id, name     FROM district     WHERE A11 = (SELECT MAX(A11) FROM district) ), youngest_clients AS (     SELECT c.birth_date, d.id AS district_id, d.name AS district_name,            ROW_NUMBER() OVER (PARTITION BY d.id ORDER BY c.birth_date DESC) AS rn     FROM top_districts d     LEFT JOIN client c ON d.id = c.district_id ) SELECT district_name,        DATEDIFF(year, birth_date, GETDATE()) AS age_in_years FROM youngest_clients WHERE rn = 1 AND birth_date IS NOT NULL; 
SELECT COUNT(DISTINCT a.account_id)  FROM account a  JOIN disp d ON a.account_id = d.account_id  WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'; 
SELECT DISTINCT d.client_id  FROM disp d  INNER JOIN account a ON d.account_id = a.account_id  WHERE d.type = 'DISPONENT' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT a.account_id  FROM loan l  JOIN account a ON l.account_id = a.account_id WHERE STRFTIME('%Y', l.date) = '1997' AND l.amount = (SELECT MIN(amount) FROM loan WHERE STRFTIME('%Y', date) = '1997') AND a.frequency = 'POPLATEK TYDNE'; 
SELECT DISTINCT l.account_id FROM loan l JOIN account a ON l.account_id = a.account_id WHERE l.duration > 12    AND EXTRACT(YEAR FROM a.opening_date) = 1993   AND l.amount = (       SELECT MAX(l2.amount)       FROM loan l2       JOIN account a2 ON l2.account_id = a2.account_id       WHERE l2.duration > 12          AND EXTRACT(YEAR FROM a2.opening_date) = 1993     ); 
SELECT COUNT(*) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE gender = 'F' AND birth_date < '1950-01-01' AND A2 = 'Sokolov'; 
SELECT account_id FROM trans WHERE date = (SELECT MIN(date) FROM trans WHERE date >= '1995-01-01' AND date <= '1995-12-31') 
SELECT DISTINCT a.account_id  FROM account a  INNER JOIN trans t ON a.account_id = t.account_id  WHERE a.date < '1997-01-01' AND t.amount > 3000; 
SELECT c.client_id  FROM client c  INNER JOIN disp d ON c.client_id = d.client_id  INNER JOIN card ca ON d.disp_id = ca.disp_id  WHERE ca.issued = '1994-03-03'; 
  SELECT a.date FROM account a INNER JOIN trans t ON a.account_id = t.account_id WHERE t.amount = 840 AND t.date = '1998-10-14';
SELECT a.district_id FROM account a INNER JOIN loan l ON a.account_id = l.account_id WHERE l.date = '1994-08-25'; 
SELECT      account_id,     SUM(amount) AS total_amount FROM      trans GROUP BY      account_id; 
SELECT c.gender FROM client c WHERE c.district_id = (     SELECT d.district_id     FROM district d     WHERE d.A11 = (SELECT MAX(A11) FROM district) ) AND c.birth_date = (     SELECT MIN(c2.birth_date)     FROM client c2     WHERE c2.district_id = (         SELECT d.district_id         FROM district d         WHERE d.A11 = (SELECT MAX(A11) FROM district)     ) ); 
  To solve the problem of determining how much each customer pays in interest given the maximum loan amount, average loan per customer, and number of customers, we must first identify any missing information needed for the calculation. Specifically, the interest rate or term is required but not provided.  **Step-by-Step Explanation:**  1. **Understand the Given Information:**    - Maximum Loan Amount: 50,000    - Average Loan per Customer: 15,000    - Number of Customers: 100  2. **Identify Missing Data:**    - Interest Rate or Term (duration) is not provided.  3. **Recognize the Impasse:**    Without knowing either the interest rate or the term of the loans, we cannot accurately calculate the interest each customer pays.  4. **Conclusion:**    The problem as stated lacks essential details necessary to compute the interest amount. Additional information regarding the interest rate or loan duration is required to proceed with the calculation.  **Answer:** The problem cannot be solved with the provided information due to missing data on the interest rate or term.
SELECT COUNT(*)  FROM client  INNER JOIN district  ON client.district_id = district.district_id  WHERE district.A2 = 'Jesenik' AND client.gender = 'F'; 
SELECT d.disp_id  FROM disp d  JOIN trans t ON d.account_id = t.account_id  WHERE t.amount = 5100 AND t.date = '1998-09-02'; 
SELECT COUNT(a.account_id)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Litomerice' AND YEAR(a.date) = 1996; 
  SELECT T2.A2 FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT c.* FROM loan l JOIN account a ON l.account_id = a.account_id JOIN client c ON a.district_id = c.district_id WHERE l.amount = 98832 AND l.date = '1996-01-03'; 
SELECT a.account_id FROM account a INNER JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'Prague' ORDER BY a.date ASC LIMIT 1; 
SELECT      (CAST(COUNT(CASE WHEN T1.gender = 'M' THEN T1.client_id END) AS REAL) / COUNT(T1.client_id)) * 100 FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'south Bohemia' AND T2.district_id = (     SELECT district_id     FROM district     WHERE A3 = 'south Bohemia'     ORDER BY A4 DESC     LIMIT 1 ) 
WITH earlier_balance AS (     SELECT balance      FROM trans      WHERE account_id = 2 AND date <= '1993-03-22'      ORDER BY date ASC      LIMIT 1 ), later_balance AS (     SELECT balance      FROM trans      WHERE account_id = 2 AND date >= '1998-12-27'      ORDER BY date DESC      LIMIT 1 ) SELECT      ((lb.balance - eb.balance) / eb.balance) * 100 AS percentage_increase FROM earlier_balance eb, later_balance lb; 
SELECT ((SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END)) / (SUM(amount))) * 100 FROM loan; 
SELECT      (COUNT(CASE WHEN status = 'C' THEN 1 END) / COUNT(*)) * 100  FROM loan  WHERE amount < 100000; 
  SELECT account_id, A2 AS district_name, A3 AS district_region FROM account INNER JOIN district ON account.district_id = district.district_id WHERE frequency = 'POPLATEK PO OBRATU' AND date LIKE '1993%'
SELECT a.account_id, a.frequency  FROM account a INNER JOIN district d ON a.district_id = d.district_id WHERE d.A3 = 'east Bohemia' AND STRFTIME('%Y', a.date) BETWEEN '1995' AND '2000'; 
SELECT a.account_id, a.date  FROM account a INNER JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Prachatice'; 
SELECT d.A2, d.A3  FROM district d  INNER JOIN account a ON d.district_id = a.district_id  INNER JOIN loan l ON a.account_id = l.account_id  WHERE l.loan_id = 4990; 
SELECT a.account_id, d.A2 AS district, d.A3 AS region FROM account a INNER JOIN district d ON a.district_id = d.district_id INNER JOIN loan l ON a.account_id = l.account_id WHERE l.amount > 300000; 
SELECT l.loan_id, d.A2 AS district, d.A11 AS average_salary FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.duration = 60; 
  SELECT d.district_id, ((d.A13 - d.A12) / d.A12) * 100 AS unemployment_increment FROM loan l INNER JOIN account a ON l.account_id = a.account_id INNER JOIN district d ON a.district_id = d.district_id WHERE l.status = 'D'
SELECT      (SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Decin' AND a.date LIKE '%1993%') /      (SELECT COUNT(*) FROM account WHERE date LIKE '%1993%') * 100; 
SELECT account_id FROM account; 
SELECT      d.A2 AS District,     COUNT(DISTINCT c.client_id) AS FemaleAccountHolders FROM      client c INNER JOIN      account a ON c.client_id = a.client_id INNER JOIN      district d ON c.district_id = d.district_id WHERE      c.gender = 'F' GROUP BY      d.A2 ORDER BY      FemaleAccountHolders DESC LIMIT 9; 
SELECT      d.A2 AS district_name,     SUM(t.account) AS total_withdrawals FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.type = 'VYDAJ' AND t.date LIKE '1996-01%' GROUP BY d.A2 ORDER BY total_withdrawals DESC LIMIT 10; 
SELECT COUNT(DISTINCT c.client_id) FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'South Bohemia' AND c.client_id IN (     SELECT client_id FROM disp ) AND c.client_id NOT IN (     SELECT client_id FROM disp WHERE type = 'OWNER' ); 
SELECT d.A3, SUM(l.amount) as total_amount FROM loan l JOIN account a ON l.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE l.status IN ('C', 'D') GROUP BY d.A3 ORDER BY total_amount DESC LIMIT 1; 
SELECT AVG(l.amount) AS average_male_loan FROM loan l JOIN account a ON l.account_id = a.account_id WHERE a.district_id IN (   SELECT c.district_id    FROM client c    WHERE c.gender = 'M' ); 
  SELECT A2 AS district_name, district_id AS branch_location FROM district WHERE A13 = (SELECT MAX(A13) FROM district) ORDER BY A2;
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A16 = (SELECT MAX(A16) FROM district)); 
SELECT COUNT(DISTINCT t.account_id) FROM trans t JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU'   AND a.frequency = 'POPLATEK MESICNE'   AND t.balance < 0; 
SELECT COUNT(*)  FROM loan  INNER JOIN account  ON loan.account_id = account.account_id  WHERE loan.date BETWEEN '1995-01-01' AND '1997-12-31'    AND loan.amount >= 250000    AND account.frequency = 'POPLATEK MESICNE'; 
  To determine how many accounts in Branch location 1 have running contracts (status 'C' or 'D'), we join the `account` and `loan` tables on `account_id`, filter by `district_id = 1` and loan status in ('C', 'D').  **Answer:**  SELECT COUNT(DISTINCT a.account_id) FROM account a INNER JOIN loan l ON a.account_id = l.account_id WHERE a.district_id = 1 AND l.status IN ('C', 'D');
SELECT COUNT(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1); 
SELECT COUNT(*)  FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'gold' AND d.type = 'OWNER'; 
SELECT COUNT(a.account_id)  FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Pisek'; 
SELECT DISTINCT a.district_id  FROM account a  JOIN trans t ON a.account_id = t.account_id  WHERE t.amount > 10000 AND t.date BETWEEN '1997-01-01' AND '1997-12-31'; 
SELECT DISTINCT t.account_id  FROM trans t  JOIN account a ON t.account_id = a.account_id  JOIN district d ON a.district_id = d.district_id  WHERE t.k_symbol = 'SIPO' AND d.A2 = 'Pisek'; 
  To find the accounts with gold credit cards, we need to join the 'card' and 'disp' tables. The 'card' table has the type of card, and 'disp' links cards to accounts.  SELECT d.account_id FROM disp AS d INNER JOIN card AS c ON d.disp_id = c.disp_id WHERE c.type = 'gold';
SELECT      AVG(monthly_total) AS average_monthly_amount FROM (     SELECT          EXTRACT(MONTH FROM t.date) AS month_num,         SUM(t.amount) AS monthly_total     FROM trans t     -- Ensure the account has at least one card by joining with disp and card tables     JOIN disp d ON t.account_id = d.account_id     JOIN card c ON d.disp_id = c.disp_id     WHERE t.operation = 'VYBER KARTOU'     AND EXTRACT(YEAR FROM t.date) = 2021     GROUP BY month_num ) AS monthly_sums; 
SELECT DISTINCT T.account_id FROM trans T WHERE T.operation = 'VYBER KARTOU'   AND STRFTIME('%Y', T.date) = '1998'   AND T.amount < (SELECT AVG(amount)                   FROM trans                   WHERE operation = 'VYBER KARTOU'                     AND STRFTIME('%Y', date) = '1998') 
  SELECT DISTINCT c.client_id   FROM client c   JOIN disp d ON c.client_id = d.client_id   WHERE c.gender = 'F' AND d.disp_id IN (SELECT disp_id FROM card)   AND d.account_id IN (SELECT account_id FROM loan)
SELECT COUNT(c.client_id)  FROM client c  INNER JOIN district d ON c.district_id = d.district_id  WHERE c.gender = 'F' AND d.A3 = 'south Bohemia'; 
SELECT a.account_id FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Tabor' AND a.account_id IN (SELECT account_id FROM disp WHERE type = 'OWNER'); 
SELECT d.type  FROM disp d  JOIN account a ON d.account_id = a.account_id  JOIN district dis ON a.district_id = dis.district_id  WHERE d.type != 'OWNER' AND dis.A11 BETWEEN 8000 AND 9000; 
SELECT COUNT(DISTINCT a.account_id) FROM account a JOIN district d ON a.district_id = d.district_id JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'North Bohemia' AND t.bank = 'AB'; 
SELECT DISTINCT d.A2 FROM district d  JOIN account a ON d.district_id = a.district_id  JOIN trans t ON a.account_id = t.account_id  WHERE t.type = 'VYDAJ'; 
SELECT      AVG(d.A15) AS average_crime_rate FROM      district d WHERE      d.district_id IN (         SELECT              a.district_id         FROM              account a         WHERE              a.account_date >= '1997-01-01'     )     AND d.A15 > 4000; 
SELECT COUNT(*) FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'classic' AND disp.type = 'OWNER'; 
SELECT COUNT(*) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE district.A2 = 'Hl.m. Praha' AND client.gender = 'M'; 
  SELECT CAST( ( SELECT COUNT(*) FROM card WHERE type = 'gold' AND issued < '1998-01-01' ) AS FLOAT ) / ( SELECT COUNT(*) FROM card ) * 100
SELECT d.client_id  FROM disp d  INNER JOIN (     SELECT account_id, MAX(amount) as max_amount      FROM loan      GROUP BY account_id ) l  ON d.account_id = l.account_id  WHERE d.type = 'OWNER'; 
SELECT d.A15 FROM district d INNER JOIN account a ON d.district_id = a.district_id WHERE a.account_id = 532; 
SELECT a.district_id FROM account a INNER JOIN `order` o ON a.account_id = o.account_id WHERE o.order_id = 33333; 
SELECT * FROM trans JOIN disp ON trans.account_id = disp.account_id JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 3356 AND operation = 'VYBER'; 
SELECT COUNT(*) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE frequency = 'POPLATEK TYDNE' AND amount < 200000; 
SELECT c.type  FROM client  INNER JOIN disp ON client.client_id = disp.client_id AND disp.type = 'OWNER' INNER JOIN card ON disp.disp_id = card.disp_id  WHERE client.client_id = 13539; 
SELECT d.A3  FROM client c  JOIN district d ON c.district_id = d.district_id  WHERE c.client_id = 3541; 
SELECT      a.district_id,     COUNT(DISTINCT a.account_id) AS num_accounts_with_A_loans FROM account a JOIN loan l ON a.account_id = l.account_id WHERE l.status = 'A' GROUP BY a.district_id; 
-- Create a query that joins orders with accounts and clients based on district_id. SELECT o.order_id, a.account_id, c.client_id, c.client_name FROM orders o JOIN accounts a ON o.account_id = a.account_id JOIN clients c ON a.district_id = c.district_id; 
SELECT t.* FROM trans t INNER JOIN account a ON t.account_id = a.account_id WHERE a.district_id = 5; 
SELECT COUNT(*) FROM account a JOIN district d ON a.district_id = d.district_id WHERE d.A2 = 'Jesenik'; 
SELECT DISTINCT d.client_id FROM card c JOIN disp d ON c.disp_id = d.disp_id WHERE c.type = 'junior' AND c.issued >= '1997-01-01'; 
SELECT      CAST(COUNT(CASE WHEN c.gender = 'F' THEN c.client_id ELSE NULL END) AS FLOAT) / COUNT(c.client_id) * 100 FROM client c JOIN district d ON c.district_id = d.district_id WHERE d.A11 > 10000; 
SELECT      ((SUM(CASE WHEN STRFTIME('%Y', l.date) = '1997' THEN l.amount ELSE 0 END)) - (SUM(CASE WHEN STRFTIME('%Y', l.date) = '1996' THEN l.amount ELSE 0 END))) /      (SUM(CASE WHEN STRFTIME('%Y', l.date) = '1996' THEN l.amount ELSE 0 END)) * 100 AS growth_rate FROM loan l JOIN disp d ON l.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE c.gender = 'M'; 
SELECT COUNT(account_id) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-12-31'; 
SELECT      (SUM(CASE WHEN A3 = 'North Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'East Bohemia' THEN A16 ELSE 0 END)) AS difference; 
SELECT type, COUNT(*) FROM disp WHERE account_id BETWEEN 1 AND 10 GROUP BY type ORDER BY type ASC; 
SELECT frequency FROM account WHERE account_id = 3;  SELECT k_symbol, amount FROM order; 
  SELECT YEAR(c.birth_date) FROM disp AS d JOIN client AS c ON d.client_id = c.client_id WHERE d.account_id = '130';
SELECT COUNT(DISTINCT a.account_id) FROM account a INNER JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'; 
SELECT      SUM(amount) AS total_debt,     STRING_AGG(status, ', ') AS payment_statuses FROM loan WHERE account_id = 992; 
SELECT      (SELECT balance FROM trans WHERE trans_id = 851 AND account_id = 12) AS transaction_balance,     (SELECT gender FROM client WHERE client_id = 4) AS client_gender; 
  SELECT type FROM card WHERE disp_id = 9;
SELECT      SUM(amount) AS total_amount_1998 FROM      trans WHERE      account_id = 617 AND date BETWEEN '1998-01-01' AND '1998-12-31'; 
SELECT c.client_id FROM client c JOIN account a ON c.client_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'East Bohemia'; 
SELECT c.first_name, c.last_name FROM clients c JOIN accounts a ON c.client_id = a.client_id WHERE (a.district_id, a.balance) IN (   SELECT district_id, MAX(balance)   FROM accounts   GROUP BY district_id ) AND c.gender = 'F'; 
SELECT COUNT(DISTINCT c.client_id) AS total_customers FROM client c JOIN account a ON c.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE c.gender = 'M'   AND c.birth_date >= '1974-01-01'   AND c.birth_date <= '1976-12-31'   AND t.k_symbol = 'SIPO'   AND t.amount > 4000; 
SELECT COUNT(a.account_id)  FROM account a  INNER JOIN district d ON a.district_id = d.district_id  WHERE d.A2 = 'Beroun' AND a.date > '1996-12-31'; 
  SELECT COUNT(*) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN card ON disp.disp_id = card.disp_id WHERE client.gender = 'F' AND card.type = 'junior';
SELECT      (CAST(SUM(CASE WHEN c.gender = 'F' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(c.client_id)) * 100  FROM client c INNER JOIN district d ON c.district_id = d.district_id WHERE d.A3 = 'Prague'; 
SELECT      (COUNT(CASE WHEN c.gender = 'M' THEN 1 ELSE NULL END) / COUNT(*)) * 100 AS percentage FROM account a JOIN client c ON a.district_id = c.district_id WHERE a.frequency = 'POPLATEK TYDNE' 
SELECT COUNT(DISTINCT c.client_id) FROM account a JOIN disp d ON a.account_id = d.account_id JOIN client c ON d.client_id = c.client_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'; 
SELECT      a.account_id,      a.opening_date,      l.duration,      l.loan_date,      l.amount FROM      account a INNER JOIN      loan l ON a.account_id = l.account_id WHERE      a.opening_date < '1997-01-01'     AND l.duration > 24; 
-- Calculate the average A11 for single clients' districts WITH single_districts_average AS (     SELECT          AVG(d.average_salary) as avg_single_a11     FROM          Clients c     JOIN          Client_District_Link cd ON c.client_id = cd.client_id     JOIN          Districts d ON cd.district_id = d.district_id     WHERE          c.marital_status = 'single' ) 
SELECT COUNT(*) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE strftime('%Y', birth_date) = '1920' AND LOWER(A3) = 'east bohemia'; 
SELECT COUNT(*)  FROM account a  INNER JOIN loan l ON a.account_id = l.account_id  WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE'; 
SELECT AVG(l.payments) AS average_loan_amount FROM account a JOIN loan l ON a.account_id = l.account_id WHERE a.frequency = 'POPLATEK PO OBRATU'   AND l.status = 'C'; 
SELECT DISTINCT d.client_id, dis.A2  FROM disp d JOIN account a ON d.account_id = a.account_id JOIN district dis ON a.district_id = dis.district_id WHERE d.type = 'OWNER'; 
SELECT DISTINCT c.client_id, c.birth_date AS age  FROM client c  INNER JOIN disp d ON c.client_id = d.client_id  INNER JOIN card ca ON d.disp_id = ca.disp_id  WHERE d.type = 'OWNER' AND ca.type = 'gold'; 
  SELECT bond_type FROM ( SELECT bond_type, COUNT(bond_type) AS cnt FROM bond GROUP BY bond_type ) AS sub ORDER BY cnt DESC LIMIT 1
SELECT COUNT(DISTINCT m.molecule_id) FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'cl'; 
SELECT AVG(o_count) FROM (   SELECT      SUM(CASE WHEN element = 'o' THEN 1 ELSE 0 END) as o_count   FROM atom   WHERE molecule_id IN (SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '-')   GROUP BY molecule_id ) 
  SELECT (SELECT COUNT(*) FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+') AND bond_type = '-') / (SELECT COUNT(*) FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')) AS avg_single_bonds;
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'na' AND m.label = '-'; 
SELECT DISTINCT b.molecule_id  FROM bond b  INNER JOIN molecule m  ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '#' AND m.label = '+'; 
SELECT 100 * SUM(IIF(a.element = 'c', 1, 0)) / COUNT(a.atom_id) AS percentage_of_carbon FROM atom a WHERE a.molecule_id IN (     SELECT DISTINCT b.molecule_id      FROM bond b      WHERE b.bond_type = '=' ) 
  SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'; 
  SELECT COUNT(*) FROM molecule WHERE molecule_id >= 'TR000' AND molecule_id <= 'TR099' AND label = '+'
SELECT DISTINCT m.molecule_id  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE a.element = 'c'; 
  To find the elements in the "TR004_8_9" bond atoms, we need to join the `atom` and `connected` tables based on `atom_id`. Here's how you can do it:  SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR004_8_9')  This query first selects all `atom_id`s from the `connected` table where the `bond_id` is "TR004_8_9". It then uses those `atom_id`s to select the corresponding elements from the `atom` table.
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '=') 
  SELECT T.label FROM ( SELECT m.label, COUNT(a.element) AS cnt FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'h' GROUP BY m.label ) T ORDER BY T.cnt DESC LIMIT 1
SELECT DISTINCT b.bond_type  FROM atom a  JOIN connected c ON a.atom_id = c.atom_id  JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'cl'; 
  SELECT atom_id, atom_id2 FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond_type = '-';
SELECT DISTINCT c.atom_id FROM connected c INNER JOIN atom a ON c.atom_id = a.atom_id INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-'; 
WITH element_counts AS (   SELECT a.element, COUNT(*) as count   FROM atom a   JOIN molecule m ON a.molecule_id = m.molecule_id   WHERE m.label = '-'   GROUP BY a.element ) SELECT element FROM element_counts WHERE count = (SELECT MIN(count) FROM element_counts); 
  SELECT DISTINCT b.bond_type FROM bond b INNER JOIN connected c ON b.bond_id = c.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20') OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')
SELECT '-' EXCEPT SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element != 'sn') 
SELECT COUNT(DISTINCT a.atom_id)  FROM atom a  WHERE a.molecule_id IN (   SELECT b.molecule_id    FROM bond b    GROUP BY b.molecule_id    HAVING MIN(b.bond_type) = '-' AND MAX(b.bond_type) = '-' ) AND a.element IN ('i', 's'); 
SELECT c.atom_id, c.atom_id2 FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '#'; 
SELECT atom_id2 FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') UNION SELECT atom_id FROM connected WHERE atom_id2 IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181') 
SELECT      (COUNT(DISTINCT m.id) * 100.0 / total.total_count) AS percentage_without_fluorine FROM      molecule m WHERE      m.label = '+'     AND NOT EXISTS (         SELECT 1         FROM atom a         WHERE a.molecule_id = m.id         AND a.element = 'F'     ) CROSS JOIN (     SELECT COUNT(*) as total_count      FROM molecule      WHERE label = '+' ) total; 
SELECT (SUM(CASE WHEN bond_type = '#' THEN 1 ELSE 0 END) * 100) / COUNT(*) AS percentage  FROM bond  INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id  WHERE molecule.label = '+'; 
SELECT element, COUNT(*) as cnt FROM atom WHERE molecule_id = 'TR000' GROUP BY element; 
SELECT      SUBSTR(bond_id, 7, 1) AS atom1,     SUBSTR(bond_id, 9, 1) AS atom2 FROM bond WHERE molecule_id = 'TR001' AND bond_id = 'TR001_2_6'; 
  To find the difference between the number of carcinogenic and non-carcinogenic molecules:  SELECT COUNT(CASE WHEN label = '+' THEN molecule_id END) - COUNT(CASE WHEN label = '-' THEN molecule_id END) FROM molecule
SELECT DISTINCT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR000_2_5'; 
  SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '=' ORDER BY molecule_id LIMIT 5; 
SELECT CAST(SUM(IIF(bond_type = '=', 1, 0)) / COUNT(bond_id) * 100 AS DECIMAL(5, 5))  FROM bond  WHERE molecule_id = 'TR008'; 
SELECT ROUND( (SUM(IIF(label = '+', 1, 0)) / COUNT(molecule_id)) * 100, 3 ) AS percentage FROM molecule; 
  SELECT CAST(SUM(IIF(element = 'h', 1, 0)) / COUNT(atom_id) * 100 AS DECIMAL(10,4)) FROM atom WHERE molecule_id = 'TR206'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'; 
SELECT a.element, m.label  FROM atom a  LEFT JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.molecule_id = 'TR060'; 
SELECT      (SELECT bond_type FROM (         SELECT bond_type, COUNT(*) as count          FROM bond          WHERE molecule_id = 'TR010'          GROUP BY bond_type          ORDER BY count DESC          LIMIT 1     ) AS sub)      AS majority_bond_type,          CASE WHEN EXISTS(         SELECT 1          FROM molecule          WHERE molecule_id = 'TR010'            AND label = '-'     ) THEN 'Yes' ELSE 'No' END AS is_carcinogenic; 
SELECT DISTINCT m.molecule_id FROM molecule m INNER JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_type = '-' AND m.label = '-' ORDER BY m.molecule_id ASC LIMIT 3; 
  To answer the question of listing the top two bonds connected to the molecule TR006 in alphabetical order, we can use the following SQL query:  SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR006') GROUP BY bond_id ORDER BY COUNT(*) DESC, bond_id ASC LIMIT 2;
SELECT COUNT(DISTINCT b.bond_id) FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.molecule_id = 'TR009'   AND (c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12'); 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'br'; 
SELECT DISTINCT b.bond_type, c.atom_id, c.atom_id2  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE c.bond_id = 'TR001_6_9'; 
SELECT m.molecule_id, m.label AS IsCarcinogenic  FROM atom a  INNER JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.atom_id = 'TR001_10'; 
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'; 
SELECT COUNT(bond_id) AS number_of_connections  FROM connected  WHERE atom_id LIKE 'TR%_19'; 
  SELECT element FROM atom WHERE molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'; 
  SELECT DISTINCT T1.molecule_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T2.label = '+'
SELECT c.bond_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id GROUP BY c.bond_id HAVING COUNT(CASE WHEN a.element = 'p' THEN 1 END) > 0     AND COUNT(CASE WHEN a.element = 'n' THEN 1 END) > 0; 
WITH bond_counts AS (   SELECT      molecule_id,     COUNT(CASE WHEN bond_type = '=' THEN 1 END) as double_bond_count   FROM      bond   GROUP BY      molecule_id ) SELECT    m.label FROM    bond_counts bc JOIN    molecule m ON bc.molecule_id = m.molecule_id WHERE    bc.double_bond_count = (SELECT MAX(double_bond_count) FROM bond_counts); 
WITH iodine_atoms AS (     SELECT atom_id FROM atom WHERE element = 'I' ) SELECT      COALESCE(AVG(bond_count), 0) AS average_bonds_per_iodine_atom FROM (     SELECT ia.atom_id, COUNT(DISTINCT c.bond_id) as bond_count     FROM iodine_atoms ia     LEFT JOIN connected c ON ia.atom_id = c.atom_id     GROUP BY ia.atom_id ) AS per_atom_counts; 
SELECT b.bond_type, b.bond_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE SUBSTR(c.atom_id, 7, 2) = '45'; 
SELECT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected); 
SELECT DISTINCT atom_id AS atom  FROM (     SELECT atom_id FROM connected WHERE bond_id IN (         SELECT bond_id FROM bond WHERE molecule_id = 'TR041' AND type = 'triple'     )     UNION     SELECT atom_id2 FROM connected WHERE bond_id IN (         SELECT bond_id FROM bond WHERE molecule_id = 'TR041' AND type = 'triple'     ) ) AS atoms; 
SELECT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR144_8_19'; 
SELECT m.molecule_id FROM `molecule` m JOIN `bond` b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_type) DESC LIMIT 1; 
SELECT element FROM (     SELECT a.element, COUNT(a.element) as count_element     FROM atom a     WHERE a.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')     GROUP BY a.element ) ORDER BY count_element ASC LIMIT 1; 
SELECT DISTINCT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb' UNION SELECT DISTINCT T2.atom_id FROM connected AS T2 INNER JOIN atom AS T1 ON T2.atom_id2 = T1.atom_id WHERE T1.element = 'pb' 
SELECT a1.element, a2.element  FROM bond  INNER JOIN connected c1 ON bond.bond_id = c1.bond_id  INNER JOIN connected c2 ON bond.bond_id = c2.bond_id  INNER JOIN atom a1 ON c1.atom_id = a1.atom_id  INNER JOIN atom a2 ON c2.atom_id = a2.atom_id  WHERE bond.bond_type = '#'; 
WITH bond_atoms AS (   SELECT      bond_id,     string_agg(atom_id, ',' ORDER BY atom_id) AS atoms_key   FROM      connected   GROUP BY      bond_id ), frequency_counts AS (   SELECT      COUNT(*) as frequency   FROM      bond_atoms   GROUP BY      atoms_key ) SELECT MAX(frequency) FROM frequency_counts; 
SELECT      ROUND(         (COUNT(CASE WHEN m.label = '+' THEN 1 ELSE NULL END) * 100.0 / COUNT(*)),         5     ) AS proportion FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-'; 
SELECT COUNT(atom_id) FROM atom WHERE element IN ('c', 'h'); 
SELECT T1.atom_id2 AS result FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id AND T2.element = 's' UNION SELECT T1.atom_id AS result FROM connected AS T1 INNER JOIN atom AS T3 ON T1.atom_id2 = T3.atom_id AND T3.element = 's'; 
SELECT b.bond_type FROM atom a INNER JOIN connected c ON a.atom_id = c.atom_id INNER JOIN bond b ON c.bond_id = b.bond_id WHERE a.element = 'sn'; 
SELECT DISTINCT element  FROM atom  WHERE molecule_id IN (SELECT id FROM molecule); 
SELECT COUNT(*)  FROM atom  WHERE molecule_id IN (     SELECT molecule_id      FROM bond      WHERE bond_type = '#' )  AND element IN ('p', 'br'); 
SELECT b.bond_id FROM bond b INNER JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+'; 
SELECT m.molecule_id  FROM molecule m WHERE m.label = '-' AND m.molecule_id IN (     SELECT DISTINCT b.molecule_id      FROM bond b      WHERE b.bond_type = '-' ); 
SELECT      (SUM(CASE WHEN element = 'cl' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_cl_in_single_bonds FROM atom WHERE molecule_id IN (     SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '-' ); 
  SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');
  SELECT molecule_id FROM molecule WHERE label = '-';
  SELECT COUNT(label) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030';
  SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050';
  SELECT element FROM atom WHERE atom_id IN ( SELECT atom_id FROM connected WHERE bond_id = 'TR001_10_11' )
SELECT COUNT(bond_id)  FROM bond  WHERE molecule_id IN (     SELECT DISTINCT molecule_id FROM atom WHERE element = 'i' ); 
SELECT m.label, COUNT(DISTINCT m.molecule_id) as count FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca' GROUP BY m.label; 
SELECT    COUNT(DISTINCT element) = 2 AS has_both_elements FROM (   SELECT a.element    FROM atom a   WHERE a.atom_id IN (     SELECT c.atom_id FROM connected c WHERE c.bond_id = 'TR001_1_8'     UNION     SELECT c.atom_id2 FROM connected c WHERE c.bond_id = 'TR001_1_8'   ) ) 
  SELECT DISTINCT m.molecule_id FROM molecule m INNER JOIN bond b ON m.molecule_id = b.molecule_id INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND b.bond_type = '#' AND a.element = 'c' LIMIT 2
  SELECT (COUNT(CASE WHEN element = 'cl' THEN molecule_id ELSE NULL END) / COUNT(molecule_id)) * 100 AS percentage FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
SELECT element FROM atom WHERE molecule_id = 'TR001'; 
SELECT molecule_id FROM bond WHERE bond_type = '='; 
  SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#';
SELECT DISTINCT T1.element  FROM atom AS T1  JOIN connected AS T2 ON T1.atom_id = T2.atom_id  WHERE T2.bond_id = 'TR000_1_2'; 
SELECT COUNT(DISTINCT m.molecule_id) FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.label = '-'; 
SELECT s.name FROM students s JOIN (     SELECT student_id, mark     FROM marks     WHERE subject = 'Computer Science' ) m ON s.student_id = m.student_id WHERE m.mark = (     SELECT MAX(mark)     FROM marks     WHERE subject = 'Computer Science' ); 
  SELECT bond_id, label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond_type = '#';
  SELECT element, COUNT(*) FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE substr(atom_id, 7, 1) = '4' AND label = '+' GROUP BY element
SELECT      COALESCE(         (SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR-6' AND element = 'H') /          (SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR-6'),          0     ) AS hydrogen_ratio,     m.label FROM molecule m WHERE m.molecule_id = 'TR-6'; 
SELECT m.label  FROM atom a  INNER JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE a.element = 'ca'; 
SELECT DISTINCT b.bond_type  FROM bond b  JOIN connected c ON b.bond_id = c.bond_id  WHERE c.atom_id IN (SELECT atom_id FROM atom WHERE element = 'c')  OR c.atom_id2 IN (SELECT atom_id FROM atom WHERE element = 'c') 
SELECT element FROM atom WHERE atom_id = (   SELECT atom_id FROM connected WHERE bond_id = 'TR001_10_11' ) UNION SELECT element FROM atom WHERE atom_id = (   SELECT atom_id FROM connected WHERE bond_id = 'TR001_10_11' ); 
SELECT (COUNT(CASE WHEN bond_type = '#' THEN bond_id ELSE NULL END) / COUNT(bond_id)) * 100 FROM bond; 
SELECT      (SUM(CASE WHEN bond_type = ' = ' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percent_double_bonds FROM bond WHERE molecule_id = 'TR047'; 
SELECT m.label FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1'; 
SELECT label FROM molecule WHERE molecule_id = 'TR151'; 
  SELECT element FROM atom WHERE molecule_id = 'TR151'
  To determine how many chemical compounds are identified as carcinogenic, we'll count the rows where the 'label' is '+', which indicates carcinogenicity.  **Answer:** SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'
  SELECT atom_id FROM atom WHERE substr(molecule_id,3,3) >= '10' AND substr(molecule_id,3,3) <= '50' AND element = 'c';
SELECT COUNT(a.atom_id) FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+'; 
SELECT b.bond_id  FROM bond b  INNER JOIN molecule m ON b.molecule_id = m.molecule_id  WHERE b.bond_type = '=' AND m.label = '+'; 
SELECT COUNT(*) AS count  FROM atom  INNER JOIN molecule  ON atom.molecule_id = molecule.molecule_id  WHERE atom.element = 'h' AND molecule.label = '+'; 
SELECT DISTINCT b.molecule_id  FROM bond b JOIN connected c ON b.bond_id = c.bond_id WHERE c.bond_id = 'TR000_1_2' AND (c.atom_id = 'TR000_1' OR c.atom_id2 = 'TR000_1'); 
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'; 
SELECT      (COUNT(DISTINCT CASE WHEN label = '+' THEN molecule_id END) /       (SELECT COUNT(DISTINCT molecule_id) FROM atom WHERE element = 'h')) * 100.0 AS percentage FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE element = 'h'; 
  To determine if molecule TR124 is carcinogenic, we select its label from the `molecule` table.  **SQL Query:** SELECT label FROM molecule WHERE molecule_id = 'TR124'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'; 
  SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';
  SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR001_2_4'
SELECT label FROM molecule WHERE molecule_id = 'TR006'; SELECT COUNT(*) FROM bond WHERE molecule_id = 'TR006' AND bond_type = '='; 
  SELECT m.molecule_id, GROUP_CONCAT(a.element) FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' GROUP BY m.molecule_id
  SELECT b.bond_id, c.atom_id, c.atom_id2 FROM bond b INNER JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '-';
SELECT DISTINCT b.molecule_id, a.element  FROM bond b  JOIN atom a ON b.molecule_id = a.molecule_id  WHERE b.bond_type = '#'; 
SELECT DISTINCT atom.element  FROM atom  INNER JOIN connected  ON atom.atom_id = connected.atom_id  WHERE connected.bond_id = 'TR000_2_3'; 
   SELECT COUNT(DISTINCT c.bond_id) AS number_of_cl_bonds    FROM connected c    INNER JOIN atom a ON c.atom_id = a.atom_id    WHERE a.element = 'Cl';    
SELECT atom_id FROM atom WHERE molecule_id = 'TR346'; SELECT COUNT(DISTINCT bond_type) AS number_of_bond_types FROM bond WHERE molecule_id = 'TR346'; 
SELECT      COUNT(DISTINCT CASE WHEN b.bond_type = '=' THEN m.molecule_id END) AS total_with_double_bond,     COUNT(DISTINCT CASE WHEN b.bond_type = '=' AND m.label = '+' THEN m.molecule_id END) AS carcinogenic_with_double_bond FROM bond b LEFT JOIN molecule m ON b.molecule_id = m.molecule_id; 
SELECT COUNT(*) FROM (   SELECT DISTINCT molecule_id FROM atom   UNION   SELECT DISTINCT molecule_id FROM bond ) m WHERE NOT EXISTS (SELECT 1 FROM atom WHERE element = 's' AND molecule_id = m.molecule_id) AND NOT EXISTS (SELECT 1 FROM bond WHERE bond_type = '=' AND molecule_id = m.molecule_id); 
SELECT m.label FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE b.bond_id = 'TR001_2_4'; 
  To determine how many atoms belong to the molecule with ID 'TR001', we query the `atom` table and filter by `molecule_id`.  SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR001';
  SELECT COUNT(*) FROM bond WHERE bond_type = '-';
SELECT DISTINCT a.molecule_id FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'cl' AND m.label = '+'; 
SELECT DISTINCT a.molecule_id FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'c' AND m.label = '-'; 
SELECT      ((         SELECT COUNT(DISTINCT a.molecule_id)         FROM atom a         JOIN molecule m ON a.molecule_id = m.molecule_id         WHERE a.element = 'Cl' AND m.label = '+'     ) / (         SELECT COUNT(molecule_id)         FROM molecule         WHERE label = '+'     )) * 100; 
SELECT T2.molecule_id FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_1_7'; 
SELECT COUNT(DISTINCT a.element)  FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR001_3_4'; 
SELECT b.bond_type  FROM connected c  JOIN bond b ON c.bond_id = b.bond_id  WHERE (c.atom_id = 'TR000_1' AND c.atom_id2 = 'TR000_2')     OR (c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_1'); 
  SELECT b.molecule_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR000_2' AND c.atom_id2 = 'TR000_4') OR (c.atom_id = 'TR000_4' AND c.atom_id2 = 'TR000_2')
  SELECT element FROM atom WHERE atom_id = 'TR000_1';
  SELECT COUNT(*) FROM molecule WHERE molecule_id = 'TR000' AND label = '+'
SELECT (SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) / COUNT(bond_id)) * 100; 
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '+' AND a.element = 'n'; 
SELECT DISTINCT a.molecule_id  FROM atom a  INNER JOIN bond b  ON a.molecule_id = b.molecule_id  WHERE a.element = 'S' AND b.bond_type = '='; 
SELECT m.molecule_id FROM molecule m WHERE m.label = '-' AND m.molecule_id IN (     SELECT a.molecule_id     FROM atom a     GROUP BY a.molecule_id     HAVING COUNT(a.atom_id) > 5 ); 
SELECT element FROM atom WHERE molecule_id = 'TR024' AND EXISTS ( SELECT 1 FROM bond WHERE bond.molecule_id = atom.molecule_id AND bond.bond_type = '=' ); 
SELECT MAX(atom_count) AS max_atoms FROM (     SELECT COUNT(a.atom_id) AS atom_count     FROM molecule m     JOIN atom a ON m.molecule_id = a.molecule_id     WHERE m.label = '+'     GROUP BY m.molecule_id ); 
SELECT      (COUNT(DISTINCT m.molecule_id) / (SELECT COUNT(m2.molecule_id) FROM molecule m2 WHERE m2.label = '+') * 100.0) AS percentage FROM molecule m WHERE m.label = '+' AND EXISTS (     SELECT 1 FROM atom a WHERE a.molecule_id = m.molecule_id AND a.element = 'h' ) AND EXISTS (     SELECT 1 FROM bond b WHERE b.molecule_id = m.molecule_id AND b.bond_type = '#'; 
  To determine how many molecules are carcinogenic based on the given data and extra knowledge:  SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond WHERE molecule_id BETWEEN 'TR004' AND 'TR010' AND bond_type = '-'; 
SELECT COUNT(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c'; 
  SELECT element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR004_7' AND molecule.label = '-';
SELECT COUNT(*) FROM (     SELECT DISTINCT molecule_id FROM atom WHERE element = 'o'     INTERSECT     SELECT DISTINCT molecule_id FROM bond WHERE bond_type = '=' ) AS subquery; 
SELECT COUNT(DISTINCT m.molecule_id) FROM bond b INNER JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label = '-'; 
SELECT element AS info FROM atom WHERE molecule_id = 'TR002' UNION ALL SELECT bond_type AS info FROM bond WHERE molecule_id = 'TR002'; 
SELECT atom_id  FROM atom  WHERE molecule_id = 'TR012'    AND element = 'c'   AND EXISTS (     SELECT 1      FROM bond      WHERE bond.molecule_id = 'TR012'        AND bond.bond_type = '='   ); 
SELECT a.atom_id  FROM atom a  INNER JOIN molecule m ON a.molecule_id = m.molecule_id  WHERE m.label = '+' AND a.element = 'o'; 
  SELECT * FROM cards WHERE cardKingdomFoilId NOT NULL AND cardKingdomId NOT NULL;
SELECT * FROM cards WHERE borderColor = 'black' AND cardKingdomId IS NULL; 
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards) AND faceConvertedManaCost IS NOT NULL; 
  SELECT id, edhrecRank, frameVersion FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;
SELECT c.id, c.rarity, l.format, l.status  FROM cards c  INNER JOIN legalities l  ON c.uuid = l.uuid  WHERE c.rarity = 'mythic' AND l.format = 'gladiator' AND l.status = 'Banned'; 
SELECT l.status  FROM cards c  INNER JOIN legalities l ON c.uuid = l.uuid  WHERE c.type = 'Artifact'    AND c.side IS NULL    AND l.format = 'vintage'; 
SELECT c.id, c.artist  FROM cards c  INNER JOIN legalities l ON c.uuid = l.uuid  WHERE c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal'; 
  SELECT c.id, r.text, c.hasContentWarning FROM cards c INNER JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele';
SELECT rulings.text FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s'; 
SELECT c.name, c.artist, MAX COUNT(r.uuid) FROM cards c INNER JOIN rulings r ON c.uuid = r.uuid GROUP BY c.uuid ORDER BY COUNT(r.uuid) DESC LIMIT 1; 
  SELECT f.language FROM cards c INNER JOIN foreign_data f ON c.uuid = f.uuid WHERE c.name = 'Annul' AND c.number = 29
SELECT c.name FROM cards c INNER JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'Japanese'; 
SELECT      (COUNT(CASE WHEN foreign_data.language = 'Chinese Simplified' THEN cards.id END) / COUNT(DISTINCT cards.id)) * 100; FROM cards LEFT JOIN foreign_data ON cards.uuid = foreign_data.uuid; 
SELECT s.name, s.totalSetSize  FROM sets s  INNER JOIN set_translations st  ON s.code = st.setCode  WHERE st.language = 'Italian'; 
  SELECT COUNT(DISTINCT artist) FROM cards WHERE type = 'Aaron Boyd';
  SELECT keywords FROM cards WHERE name = 'Angel of Mercy';
