# HR Analytics Dashboard

![Dashboard Preview](dashboard-preview.png)

## 📊 Project Overview

An interactive HR Analytics Dashboard built in Tableau to provide comprehensive insights into employee attrition patterns, workforce demographics, and organizational health metrics. This data-driven solution helps HR professionals and business leaders understand workforce trends and make informed decisions about talent retention.

---

## 📁 About the Dataset

This dataset contains comprehensive employee information from a company with **961 employees**, tracking 40+ attributes across multiple categories:

### Employee Demographics
- **Age**: Employee age and age bands for segmentation
- **Gender**: Male/Female distribution
- **Marital Status**: Single, Married, Divorced
- **Education**: Education level (1-5 scale) and field of study
- **Distance From Home**: Commute distance in miles/kilometers

### Employment Information
- **Employee Number**: Unique identifier for each employee
- **Department**: HR, R&D, Sales
- **Job Role**: Healthcare Representative, Laboratory Technician, Manager, Manufacturing Director, Research Director, Research Scientist
- **Job Level**: Hierarchical level (1-5)
- **Business Travel**: Frequency of travel (Rarely, Frequently, Non-Travel)

### Compensation & Benefits
- **Monthly Income**: Employee's monthly salary
- **Daily Rate / Hourly Rate / Monthly Rate**: Different pay rate calculations
- **Percent Salary Hike**: Recent salary increase percentage
- **Stock Option Level**: Stock options tier (0-3)

### Tenure & Experience
- **Total Working Years**: Overall professional experience
- **Years At Company**: Tenure with current organization
- **Years In Current Role**: Time in current position
- **Years Since Last Promotion**: Time elapsed since last promotion
- **Years With Current Manager**: Duration under current supervisor
- **Num Companies Worked**: Previous employers count

### Performance & Satisfaction Metrics
- **Performance Rating**: Annual performance score (1-4)
- **Job Satisfaction**: Satisfaction with job (1-4 scale)
- **Environment Satisfaction**: Satisfaction with work environment (1-4)
- **Relationship Satisfaction**: Satisfaction with workplace relationships (1-4)
- **Work Life Balance**: Work-life balance rating (1-4)
- **Job Involvement**: Level of job engagement (1-4)
- **Training Times Last Year**: Number of training sessions attended

### Attrition Data
- **Attrition**: Binary indicator (Yes/No) - whether employee left
- **CF_attrition label**: Categorized reason for attrition
- **CF_current Employee**: Current employment status
- **Over Time**: Whether employee works overtime (Yes/No)

### Other Fields
- **Over18**: All employees are over 18 (data validation field)
- **Employee Count**: Count field for aggregations
- **Standard Hours**: Standard working hours (constant at 80)

---

## 🎯 Dashboard Components

### Top-Level KPIs

**Employee Count: 961**
Total number of employees analyzed in the dataset.

**Attrition Count: 133**
Number of employees who have left the company.

**Attrition Rate: 13.84%**
Percentage of workforce that has departed, calculated as (133/961) × 100.

**Active Employees: 828**
Current workforce size after accounting for attrition.

**Average Age: 37**
Mean age of all employees in the organization.

**Attrition by Gender**
- Female: 43 employees departed
- Male: 90 employees departed

### Department-wise Attrition (Pie Chart)
Visual breakdown showing:
- **R&D Department**: 133 employees left (56.12% of total attrition) - highest attrition
- **Sales Department**: 92 employees left (38.82%)
- **HR Department**: 12 employees left (5.06%)

**Insight**: R&D department experiences the highest attrition, suggesting need for focused retention strategies in technical roles.

### No of Employee by Age Group (Bar Chart)
Distribution of employees across age ranges from 18 to 60+:
- Peaks at ages 28-36 with 70-99 employees per age year
- Shows workforce is concentrated in early-to-mid career stages
- Declining employee counts after age 45

**Insight**: Younger workforce composition may indicate either growth phase or retention challenges with senior employees.

### Employee Count (Bin size filter)
Interactive histogram control allowing users to adjust age grouping granularity (currently set to 2-year bins).

### Job Satisfaction Rating (Matrix Table)
Detailed breakdown by job role showing satisfaction levels 1-4:

| Job Role | Satisfaction 1 | Satisfaction 2 | Satisfaction 3 | Satisfaction 4 | Grand Total |
|----------|---------------|----------------|----------------|----------------|-------------|
| Healthcare Representative | 26 | 19 | 43 | 43 | 131 |
| Laboratory Technician | 56 | 48 | 75 | 80 | 259 |
| Manager | 15 | 6 | 16 | 17 | 54 |
| Manufacturing Director | 26 | 32 | 49 | 38 | 145 |
| Research Director | 15 | 16 | 27 | 22 | 80 |
| Research Scientist | 54 | 53 | 90 | 95 | 292 |

**Insight**: Laboratory Technicians and Research Scientists represent the largest employee groups, with satisfaction relatively distributed across all levels.

### Education Field-wise Attrition (Horizontal Bar Chart)
Attrition counts by educational background:
- **Life Sciences**: 59 employees (highest)
- **Medical**: 47 employees
- **Technical Degree**: 20 employees
- **Other**: 7 employees

**Insight**: Life Sciences graduates show highest attrition, potentially due to competitive job market or misalignment with role expectations.

### Attrition Rate by Gender for Different Age Group (Donut Charts)
Five segmented visualizations showing gender-based attrition across age brackets:

**Under 25**: 22 total departures
- Female: 10 (7.52%)
- Male: 12 (9.02%)

**25-34**: 65 total departures (highest)
- Female: 20 (15.04%)
- Male: 45 (33.83%)

**35-44**: 29 total departures
- Female: 8 (6.02%)
- Male: 21 (15.79%)

**45-54**: 8 total departures
- Female: 1 (1.50%)
- Male: 6 (4.51%)

**Over 55**: 9 total departures
- Female: 3 (2.26%)
- Male: 6 (4.51%)

**Insight**: 25-34 age group shows critical attrition concern, especially among males. This suggests early-career retention is a key challenge.

---

## 🔍 Key Insights & Findings

1. **Moderate Attrition Concern**: 13.84% attrition rate is within industry norms but leaves room for improvement

2. **Department Disparity**: R&D department accounts for over half of all attrition despite likely being comparable in size to Sales

3. **Early Career Flight Risk**: The 25-34 age bracket represents the highest attrition segment, indicating challenges in retaining mid-level professionals

4. **Gender Gap**: Male employees show 2x higher attrition than females (90 vs 43), warranting investigation into gender-specific workplace factors

5. **Education Factor**: Life Sciences and Medical field graduates are leaving at higher rates, possibly indicating skills-market mismatch or better external opportunities

6. **Age Distribution**: Workforce skews younger (average age 37), with fewer senior employees suggesting either retention issues or company growth phase

---

## 💡 Recommended Actions

Based on dashboard insights:

- **Target R&D Retention**: Implement department-specific engagement programs
- **Focus on 25-34 Age Group**: Create career development paths and mentorship for mid-level employees
- **Investigate Male Attrition**: Conduct surveys to understand gender-specific workplace concerns
- **Education-Role Alignment**: Review job descriptions and growth opportunities for Life Sciences graduates
- **Satisfaction Monitoring**: Use job satisfaction data to identify at-risk employee segments

---

## 🛠️ Tools Used

- **Tableau Desktop**: Dashboard design and visualization
- **Data Source**: HR employee records (Excel/CSV format)
- **Analysis**: Descriptive statistics and segmentation analysis

---

## 👤 Author

**Maryam Yousry**

GitHub: [@maryamyousry](https://github.com/maryamyousry)

---

## 📧 Contact

For questions or feedback about this dashboard, please reach out through GitHub.

---

⭐ If you found this project insightful, please consider giving it a star!

**Last Updated**: December 2025