SELECT * FROM Heart_Disease;

-- Total number of records
SELECT COUNT(*) AS Total_Records
FROM Heart_Disease;

SELECT Heart_Disease,COUNT(*) Heart_Disease
FROM Heart_Disease
GROUP BY Heart_Disease;

-- checking for null values
SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN Cholesterol IS NULL THEN 1 ELSE 0 END) AS missing_cholesterol,
  SUM(CASE WHEN BP IS NULL THEN 1 ELSE 0 END) AS missing_bp
FROM Heart_Disease;

-- HEART DISEASE DISTRIBUTION
SELECT
  Heart_Disease,
  COUNT(*) AS Patient_Count,
  CAST(ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS decimal(10,2)) AS percentage
FROM Heart_Disease
GROUP BY Heart_Disease;

-- AGE GROUP RISK ANALYSIS
SELECT
  CASE
    WHEN Age < 40 THEN 'Under 40'
    WHEN Age BETWEEN 40 AND 49 THEN '40–49'
    WHEN Age BETWEEN 50 AND 59 THEN '50–59'
    ELSE '60+'
  END AS age_group,
  Heart_Disease,
  COUNT(*) AS patients
FROM Heart_Disease
GROUP BY age, Heart_Disease
ORDER BY age;

-- GENDER COMPARISON
-- 0 fEMALE, 1 MALE
SELECT
  Sex,
  Heart_Disease,
  COUNT(*) AS patients
FROM Heart_Disease
GROUP BY Sex, Heart_Disease;

 -- AGGREGATION OF KEY RISK FACTORS
SELECT
  Heart_Disease,
  AVG(Cholesterol) AS avg_cholesterol,
  AVG(BP) AS avg_bp,
  AVG(Max_HR) AS avg_max_hr,
  CAST(AVG(ST_depression) AS decimal(10,2)) AS avg_st_depression
FROM Heart_Disease
GROUP BY Heart_Disease;

-- HIGH-RISK PROFILE
SELECT *
FROM Heart_Disease
WHERE
  Age > 55
  AND Cholesterol > 240
  AND Exercise_angina = 1
  AND Number_of_vessels_fluro >= 2
  AND Heart_Disease = 'Presence';





