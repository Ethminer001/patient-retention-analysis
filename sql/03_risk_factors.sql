-- Query 1: Chronic conditions impact
SELECT chronic_conditions, COUNT(*) AS total, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY chronic_conditions;

-- Query 2: Individual conditions
SELECT 
    AVG(CASE WHEN hypertension = 1 THEN no_show END) AS hypertension_no_show_rate,
    AVG(CASE WHEN diabetes = 1 THEN no_show END) AS diabetes_no_show_rate,
    AVG(CASE WHEN alcoholism = 1 THEN no_show END) AS alcoholism_no_show_rate,
    AVG(CASE WHEN disability = 1 THEN no_show END) AS disability_no_show_rate
FROM appointments;

-- Query 3: Age/gender risk
SELECT age_group, gender, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY age_group, gender;

-- Query 4: Financial assistance impact
SELECT financial_assistance, COUNT(*) AS total, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY financial_assistance;

-- Query 5: SMS + chronic condition interaction
SELECT sms_reminder, chronic_conditions, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY sms_reminder, chronic_conditions;

-- Query 6: High-risk patient identification
SELECT patient_id, COUNT(*) AS total_appointments, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY patient_id
HAVING AVG(no_show) > 0.5
ORDER BY no_show_rate DESC;

-- Query 7: Previous no-show predictor
SELECT patient_id,
       SUM(no_show) AS past_no_shows,
       AVG(no_show) AS overall_no_show_rate
FROM appointments
GROUP BY patient_id
ORDER BY past_no_shows DESC
LIMIT 20;
