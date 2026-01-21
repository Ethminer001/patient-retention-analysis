

```markdown
# 🏥 Patient Retention Analysis

## 🎯 Business Problem

A multi-specialty medical clinic network is experiencing a **30% patient no-show rate**, creating significant challenges:

**Health Impact:**
- Patients miss critical follow-up care
- Chronic conditions worsen without monitoring
- Preventable health complications increase

**Financial Impact:**
- $2.1M in lost annual revenue
- Wasted clinical resources and staff time
- Reduced operational efficiency

**Quality Metrics:**
- Lower patient satisfaction scores
- Compliance issues with care continuity standards
- Negative impact on health outcomes

**Executive Question:**  
"Why are patients not returning for appointments, and what interventions will improve retention?"

---

## 📊 Dataset

**Source:** [Kaggle Medical Appointment No-Shows Dataset](https://www.kaggle.com/datasets/joniarroba/noshowappointments)  
**Period:** April 2016 – June 2016  
**Records:** 110,527 appointments  
**Unique Patients:** 62,299  

**Key Variables:**
- **Demographics:** Age, gender, neighborhood  
- **Medical Factors:** Hypertension, diabetes, alcoholism, disability  
- **Behavioral Data:** SMS reminder status, previous no-show history  
- **Appointment Details:** Scheduled date, appointment date, booking advance time  
- **Outcome:** Showed up or no-show

---

## 🔍 Methodology

1. **Data Exploration & Cleaning**  
   Validated 110K+ records, converted dates, created time-based features, engineered risk indicators  
   **Tools:** Python (Pandas, NumPy), SQL (SQLite)

2. **SQL Analysis**  
   30+ queries across 4 domains: retention patterns, risk factors, geographic analysis, operational patterns

3. **Statistical Analysis & Segmentation**  
   Patient-level risk scoring, cohort analysis, correlation of predictors  
   **Tools:** Python (Pandas, SciPy)

4. **Predictive Modeling**  
   Random Forest classifier + ensemble models  
   ROC-AUC: ~0.72  
   **Tools:** Scikit-learn, XGBoost, imbalanced-learn (SMOTE)

5. **Intervention Analysis**  
   ROI calculation, cost-benefit analysis, implementation roadmap  
   **Tools:** Python (custom calculations)

---

## 📈 Key Findings

### 1. SMS Reminders Are Highly Effective

![No-show by SMS Reminder](visuals/no_show_sms.png)

- **With SMS:** 16.7% no-show rate  
- **Without SMS:** 27.6% no-show rate  
- **Impact:** 10.9 percentage point reduction (39% relative decrease)

---

### 2. Long Advance Bookings Dramatically Increase No-Shows

![No-show by Booking Advance](visuals/no_show_booking_advance.png)

- Same day: 18.3%  
- 1–7 days: 19.2%  
- 8–14 days: 21.5%  
- 15–30 days: 24.8%  
- **30+ days: 32.1%**

---

### 3. High-Risk Patient Segment Drives Disproportionate No-Shows

![Patient Segmentation](visuals/patient_segmentation.png)

- **Low Risk (<25%):** 54,203 patients (87.0%)  
- **Medium Risk (25–50%):** 5,849 patients (9.4%)  
- **High Risk (>50%):** 2,247 patients (3.6%)

High-risk group contributes **15% of all no-shows** despite being only 3.6% of patients.

---

### 4. Chronic Condition Patients Show Complex Behavior

- No chronic: 19.8% no-show  
- 1 chronic: 21.2%  
- 2+ chronic: 23.4%

**With SMS reminders:**
- Chronic patients: 15.9% no-show  
- Healthy patients: 17.1% no-show

---

### 5. Geographic Disparities Exist

![Temporal Patterns](visuals/temporal_patterns.png)

**Top 3 Best-Performing Neighborhoods:**
- Maria Ortiz: 15.2%  
- Resistência: 16.8%  
- Centro: 17.3%

**Bottom 3 Worst-Performing Neighborhoods:**
- Santos Dumont: 31.2%  
- Jesus de Nazareth: 29.8%  
- Itararé: 28.9%

---

## 💡 Business Recommendations

### Immediate Actions (Next 30 Days)
1. **Universal SMS Reminder System** → ROI: 18,443%  
2. **High-Risk Patient Outreach Program** → ROI: 485%  
3. **Optimize Appointment Scheduling Policy** → ROI: 1,790%

### Strategic Initiatives (Next 90 Days)
- Telehealth for high-risk neighborhoods  
- Chronic condition care navigation  
- Predictive model-driven slot assignment

---

## 💰 Total Business Impact

![Intervention ROI](visuals/intervention_roi.png)

**Year 1 Projection:**
- **Revenue Recovery:** $2,374,000  
- **Implementation Costs:** $105,540  
- **Net Benefit:** $2,268,460  
- **ROI:** 2,149%  
- **No-shows prevented:** ~13,000+

---

## ⚠️ Limitations and Future Work

- Data limited to April–June 2016  
- No direct health outcome linkage  
- Neighborhood-level geography only  
- No appointment type differentiation  

**Future Enhancements:**
- Integrate EHR/claims data  
- Real-time dashboard & automated outreach  
- A/B test reminder timing & content  
- Explore deep learning & time-series forecasting

---

## 🔬 Technical Skills Demonstrated

- SQL: Complex queries, CTEs, window functions  
- Python: Pandas, feature engineering, SMOTE, modeling  
- Predictive Modeling: Random Forest, XGBoost, Stacking, ROC-AUC ~0.72  
- Visualization: Matplotlib, Seaborn  
- Business: ROI modeling, intervention planning  
- Domain: Healthcare operations & patient behavior

---

## 📁 Project Structure

```
patient-retention-analysis/
├── README.md
├── data/
│   └── patient_appointments.csv
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_retention_analysis.sql
│   ├── 03_risk_factors.sql
│   └── 04_department_performance.sql
├── notebooks/
│   └── patient_retention_analysis.ipynb
├── visuals/
│   ├── temporal_patterns.png
│   ├── risk_heatmap.png
│   ├── patient_segmentation.png
│   ├── feature_importance.png
│   ├── intervention_roi.png
│   ├── no_show_sms.png
│   ├── no_show_booking_advance.png
│   └── age_distribution.png
└── presentation/
    └── executive_summary.pdf
```

---

## 🚀 How to Reproduce

```bash
# Clone repo
git clone https://github.com/Ethminer001/patient-retention-analysis.git
cd patient-retention-analysis

# Install dependencies
pip install pandas numpy matplotlib seaborn scikit-learn xgboost imbalanced-learn

# Download dataset → save as data/patient_appointments.csv

# Load data
python load_data.py

# Run SQL (optional)
sqlite3 patient_retention.db
.read sql/01_data_exploration.sql

# Run analysis
jupyter notebook notebooks/patient_retention_analysis.ipynb
```

---

## 📞 Contact

- Portfolio: (https://github.com/Ethminer001)
- LinkedIn: [linkedin.com/in/eriioluwa](https://linkedin.com/in/eriioluwa)  
- Email: olowu.tayo200@gmail.com  
- GitHub: @Ethminer001 (https://github.com/Ethminer001)

---

## 🙏 Acknowledgments

- Dataset: Kaggle Medical Appointment No-Shows  
- Inspired by real-world healthcare retention challenges  
- Built for data analytics portfolio

---

*End-to-end healthcare analytics: raw data → predictive modeling → measurable business ROI.*
```

