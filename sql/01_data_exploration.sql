-- Query 1: Dataset overview
SELECT COUNT(*) AS total_appointments FROM appointments;

-- Query 2: Retention metrics (overall no-show rate)
SELECT AVG(no_show) AS overall_no_show_rate FROM appointments;

-- Query 3: Demographics (gender distribution)
SELECT gender, COUNT(*) AS total, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY gender;

-- Query 4: Age distribution (group by age_group)
SELECT age_group, COUNT(*) AS total, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY age_group;

-- Query 5: Chronic conditions prevalence
SELECT 
    SUM(hypertension) AS total_hypertension,
    SUM(diabetes) AS total_diabetes,
    SUM(alcoholism) AS total_alcoholism,
    SUM(disability) AS total_disability
FROM appointments;

-- Query 6: SMS effectiveness
SELECT sms_reminder, COUNT(*) AS total, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY sms_reminder;

-- Query 7: Data quality checks (negative ages, invalid days_advance)
SELECT COUNT(*) AS invalid_records
FROM appointments
WHERE age < 0 OR days_advance < 0;
