-- Query 1: Clinic performance (by neighborhood)
SELECT neighborhood, COUNT(*) AS total, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY neighborhood;

-- Query 2: Best/worst locations
SELECT neighborhood, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY neighborhood
ORDER BY no_show_rate ASC; -- lowest = best

-- Query 3: Time-based patterns (morning vs afternoon)
SELECT 
    CASE WHEN CAST(strftime('%H', appointment_date) AS INTEGER) < 12 THEN 'Morning' ELSE 'Afternoon' END AS time_of_day,
    AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY time_of_day;

-- Query 4: Weekend vs weekday
SELECT 
    CASE WHEN strftime('%w', appointment_date) IN ('0','6') THEN 'Weekend' ELSE 'Weekday' END AS day_type,
    AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY day_type;

-- Query 5: Patient load per clinic
SELECT neighborhood, COUNT(*) AS total_appointments
FROM appointments
GROUP BY neighborhood
ORDER BY total_appointments DESC;

-- Query 6: Seasonal patterns (month trends)
SELECT strftime('%m', appointment_date) AS month, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY month
ORDER BY month;
