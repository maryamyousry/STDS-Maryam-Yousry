# 📊 Data Analytics & Engineering Portfolio

> A comprehensive collection of data-driven projects spanning business intelligence, data engineering, and workforce analytics — showcasing end-to-end capabilities from ETL pipelines to interactive dashboards.

**Author:** Maryam Yousry  
**GitHub:** [@maryamyousry](https://github.com/maryamyousry)

---

## 🎯 Portfolio Overview

This repository contains a diverse set of data projects demonstrating expertise across the full data lifecycle: from serverless ETL architecture and data quality engineering to business intelligence dashboard development and advanced analytics. Each project addresses real-world business challenges with scalable, production-ready solutions.

### Project Categories

- **📈 Business Intelligence Dashboards** — Interactive visualizations for actionable insights
- **⚙️ Data Engineering Pipelines** — Serverless ETL systems with comprehensive data quality controls
- **👥 Workforce Analytics** — HR analytics for talent retention and organizational health
- **🚗 Operations Analytics** — Ride-sharing performance and customer behavior analysis

---

## 📁 Projects

### 1. 🏪 Super Store Sales Dashboard
> **Type:** Business Intelligence | **Tool:** Excel/Power BI  
> **Focus:** Retail Performance Analytics

A comprehensive sales performance dashboard analyzing $5.4M in revenue across multiple dimensions.

**Key Features:**
- Financial health monitoring (42.18% profit margin)
- Customer segmentation by demographics (age, gender)
- Product category performance analysis across 8 beverage categories
- Regional performance comparison across US states
- Monthly growth rate tracking and target variance analysis
- Payment method distribution insights

**Business Impact:**
- Identifies top-performing customer segments (41-50, 51+ age groups)
- Highlights revenue leaders (Soft Drinks, Sports Drinks) vs. underperformers
- Enables store-level performance benchmarking
- Tracks actual vs. target with monthly variance reporting

[📄 Full Documentation](./STDS/Excel-Task/README.md)

---

### 2. ⚡ GreenStream Energy - Serverless ETL Pipeline
> **Type:** Data Engineering | **Platform:** AWS  
> **Scale:** 50,000+ Smart Meters | 4.8M Daily Readings

Production-grade serverless ETL pipeline processing real-time smart meter data with comprehensive data quality controls.

**Architecture Highlights:**
- Event-driven serverless architecture (S3 + Lambda)
- Three-tier storage strategy: Raw → Structured (RDS) → Analytics (Parquet)
- Comprehensive data validation with 6 transformation rule categories
- Idempotency controls with SHA256-based deduplication
- Exponential backoff retry logic with Dead Letter Queue

**Transformation Rules:**
- Unit standardization (W to kW conversion)
- Missing value handling and interpolation
- Range validation and anomaly detection
- Faulty meter detection (stuck/erratic/communication failure)
- Data enrichment (peak period classification, seasonal tagging)
- Quality scoring system (A-F grading)

**Technical Stack:**
- AWS S3, Lambda, RDS
- Parquet with Snappy compression (70% size reduction)
- Event-driven orchestration
- Comprehensive observability and alerting

[📄 Full Documentation](./STDS/Lecture-Task/greenstream_readme.md)
---

### 3. 👔 HR Analytics Dashboard
> **Type:** Workforce Analytics | **Tool:** Tableau  
> **Dataset:** 961 Employees | 40+ Attributes

Interactive HR dashboard analyzing employee attrition patterns, workforce demographics, and organizational health metrics.

**Key Metrics:**
- **Attrition Rate:** 13.84% (133 employees)
- **Active Workforce:** 828 employees
- **Average Age:** 37 years
- **Gender Distribution:** Male attrition 2x higher than female

**Analysis Dimensions:**
- Department-wise attrition (R&D: 56% of total)
- Age group segmentation with critical 25-34 bracket
- Job satisfaction matrix across 6 roles
- Education field correlation with attrition
- Gender-based attrition by age cohort

**Strategic Insights:**
- Early career retention challenge (25-34 age group highest attrition)
- R&D department requires focused retention strategies
- Life Sciences graduates show highest departure rates
- Workforce skews younger with fewer senior employees

**Recommended Actions:**
- Department-specific engagement programs for R&D
- Career development paths for mid-level professionals
- Gender-specific workplace factor investigation
- Education-role alignment review

[📄 Full Documentation](./STDS/Power-BI-Task/Uber_README.md)

---

### 4. 🚗 Uber Ride-Sharing Operations Dashboard
> **Type:** Operations Analytics | **Tool:** Power BI  
> **Volume:** 93K Completed Rides | 57K Cancellations

Interactive dashboard analyzing ride-sharing operations with focus on booking performance, revenue optimization, and customer behavior.

**Performance Metrics:**
- **Completion Rate:** 93K completed vs. 57K lost bookings
- **Total Revenue:** $52M
- **Distance Covered:** 2.51M km
- **Average Trip Distance:** 24.64 km
- **Ratings:** Driver 4.23 | Customer 4.40

**Multi-Dimensional Analysis:**
- **Vehicle Performance:** Auto-rickshaws lead with 32,948 customers and $13M revenue
- **Payment Methods:** UPI dominates transaction volume
- **Customer Segmentation:** Top spenders up to $7.7K individual revenue
- **Location Intelligence:** High-demand areas (Khandsa, Ashram) for supply optimization
- **Temporal Patterns:** Monthly seasonality and quarterly trends

**Business Applications:**
- Driver allocation optimization based on demand hotspots
- Revenue optimization by vehicle category
- Cancellation pattern analysis for supply-demand balancing
- Customer retention strategies for high-value riders

[📄 Full Documentation](./STDS/SQL-Server-Task/README.md)

---

### 5. 🚴 Adventure Works Sales & Performance Dashboard
> **Type:** Enterprise BI | **Tool:** Power BI/Excel  
> **Domain:** Manufacturing (Bicycles & Accessories)

Professional dashboard analyzing multinational manufacturing operations with focus on sales, profit, customer demographics, and reseller networks.

**Business Metrics:**
- **Total Sales:** $11.4M
- **Profit:** $4.7M
- **Customers:** 18,484
- **Orders:** 23,635
- **Units Sold:** 214.4K

**Dashboard Components:**

**View 1 - Customer & Reseller Insights:**
- Customer demographics (age, gender, education)
- Product performance by language variant (Spanish/English)
- Reseller network performance by city
- Gender-balanced sales ($14.5M Female | $14.8M Male)

**View 2 - Geographic & Temporal Analysis:**
- Profit by major cities (London, Paris, Calgary, Melbourne)
- Education level correlation with purchasing behavior
- Country-level customer distribution (US dominates)
- Monthly sales trends ($1.7M to $2.9M peak)

**Strategic Value:**
- Multi-language product portfolio optimization
- Reseller network effectiveness evaluation
- Geographic expansion opportunity identification
- Seasonal demand pattern recognition

[📄 Full Documentation](./STDS/Tableau-Task/hr_analytics_readme.md)

---

## 🛠️ Technical Skills Demonstrated

### Data Engineering
- Serverless architecture design (AWS Lambda, S3, RDS)
- ETL pipeline development with data quality controls
- Event-driven orchestration
- Idempotency and retry logic implementation
- Data lake design with Parquet optimization

### Business Intelligence
- Interactive dashboard development (Power BI, Tableau, Excel)
- DAX measures and calculated fields
- Multi-dimensional data modeling
- KPI design and metric definition
- Advanced visualization techniques

### Data Analysis
- Customer segmentation and cohort analysis
- Attrition pattern identification
- Revenue optimization analysis
- Geographic and temporal trend analysis
- Data quality scoring systems

### Tools & Technologies
- **Visualization:** Power BI, Tableau, Excel
- **Cloud Platforms:** AWS (S3, Lambda, RDS)
- **Data Formats:** CSV, Parquet, JSON
- **Languages:** SQL, DAX, Python (implied)
- **Concepts:** Data warehousing, ETL, serverless computing, event-driven architecture

---

## 📊 Project Impact Summary

| Project | Business Value | Technical Complexity | Scale |
|---------|---------------|---------------------|-------|
| **Super Store** | Revenue optimization & target tracking | Medium | $5.4M revenue |
| **GreenStream ETL** | Real-time data quality at IoT scale | High | 4.8M daily records |
| **HR Analytics** | Workforce retention strategies | Medium | 961 employees |
| **Uber Operations** | Operational efficiency & revenue growth | High | 150K total rides |
| **Adventure Works** | Enterprise sales intelligence | Medium | $11.4M sales |


---

## 🤝 Collaboration & Feedback
- **GitHub:** [@maryamyousry](https://github.com/maryamyousry)
