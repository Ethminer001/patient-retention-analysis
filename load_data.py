import pandas as pd
import sqlite3

# Load the Kaggle dataset
df = pd.read_csv(r'C:\Users\USER\patient-retention-analysis\data\patient_appointments.csv\KaggleV2-May-2016.csv')

# Rename columns
df = df.rename(columns={
    'PatientId': 'patient_id',
    'AppointmentID': 'appointment_id',
    'Gender': 'gender',
    'ScheduledDay': 'scheduled_date',
    'AppointmentDay': 'appointment_date',
    'Age': 'age',
    'Neighbourhood': 'neighborhood',
    'Scholarship': 'financial_assistance',
    'Hipertension': 'hypertension',
    'Diabetes': 'diabetes',
    'Alcoholism': 'alcoholism',
    'Handcap': 'disability',
    'SMS_received': 'sms_reminder',
    'No-show': 'no_show'
})

# Transform fields
df['no_show'] = df['no_show'].map({'Yes': 1, 'No': 0})
df['scheduled_date'] = pd.to_datetime(df['scheduled_date'])
df['appointment_date'] = pd.to_datetime(df['appointment_date'])
df['days_advance'] = (df['appointment_date'] - df['scheduled_date']).dt.days
df['age_group'] = pd.cut(df['age'], bins=[0, 18, 35, 50, 65, 120], 
                          labels=['Child', 'Young Adult', 'Adult', 'Senior', 'Elderly'])
df['chronic_conditions'] = df['hypertension'] + df['diabetes']

# Clean data BEFORE writing to SQL
df = df[(df['age'] >= 0) & (df['age'] <= 120)]
df = df[df['days_advance'] >= 0]

print(f"✅ Cleaned dataset size: {len(df):,}")
print(f"✅ Date range: {df['appointment_date'].min()} to {df['appointment_date'].max()}")
print(f"✅ Unique patients: {df['patient_id'].nunique():,}")

# Write to SQLite
conn = sqlite3.connect('patient_retention.db')
df.to_sql('appointments', conn, if_exists='replace', index=False)
conn.close()
