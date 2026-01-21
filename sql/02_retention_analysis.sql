-- Query 1: Monthly trends
SELECT strftime('%Y-%m', appointment_date) AS month, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY month;

-- Query 2: Day of week analysis
SELECT strftime('%w', appointment_date) AS day_of_week, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY day_of_week;

-- Query 3: Advance booking impact
SELECT days_advance, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY days_advance
ORDER BY days_advance;

-- Query 4: Appointment frequency per patient
SELECT patient_id, COUNT(*) AS total_appointments, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY patient_id;

-- Query 5: First-time vs returning patients
SELECT 
    CASE WHEN COUNT(*) = 1 THEN 'First-time' ELSE 'Returning' END AS patient_type,
    AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY patient_type;

-- Query 6: Neighborhood analysis
SELECT neighborhood, COUNT(*) AS total, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY neighborhood
ORDER BY no_show_rate DESC;

-- Query 7: Retention over time (daily trend)
SELECT date(appointment_date) AS day, AVG(no_show) AS no_show_rate
FROM appointments
GROUP BY day
ORDER BY day;
