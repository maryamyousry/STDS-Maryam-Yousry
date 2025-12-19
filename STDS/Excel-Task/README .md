# Super Store Dashboard

A comprehensive sales performance dashboard built for the Super Store dataset, providing actionable insights into revenue, profitability, customer demographics, product performance, and regional trends.

## Project Overview

This project features an interactive Excel-based dashboard (or Power BI/Tableau equivalent) designed to analyze sales data for a fictional retail chain called "Super Store." The dashboard consolidates key business metrics across multiple views to support data-driven decision-making for store managers, sales teams, and executives.

The dashboard is split across multiple sheets/tabs, with the two main dashboard views being:

### Dash1 – Profitability & Customer Insights
This sheet focuses on overall financial performance and customer segmentation.

**Key Metrics (Top Cards):**
- **Total Revenue:** $5.4M
- **Cost of Goods Sold (COGS):** $3.1M
- **Profit Margin:** $2.3M
- **% Profit:** 42.18%

**Visualizations:**
- **Profit by Gender** (Donut Chart): Shows profit distribution between Male (51%) and Female (49%) customers.
- **Profit by Customer Age** (Bar Chart): Average profit segmented into age groups (0-20, 21-30, 31-40, 41-50, 51+), highlighting the highest profit from the 41-50 and 51+ segments.
- **Top/Bottom Locations by Profit** (Bar Chart): Displays profit performance across states (e.g., Washington, California, Michigan, Virginia, Missouri).
- **Growth Rate of Profit by Month** (Line Chart): Monthly profit growth percentages, showing fluctuations throughout the year.
- **Product Analysis** (Clustered Bar Chart): Compares Total Qty Sold, Total Refund, and Plot Area across key products (Somebody Fusion, Race Rush, Property Mist, Include Breeze, Itself Breeze).

### Dash3 – Revenue & Operational Performance
This sheet emphasizes revenue trends, product categories, payment methods, and store-level performance.

**Visualizations:**
- **Product Category Revenue** (Horizontal Bar Chart): Ranked revenue by category (Soft Drink, Sports Drink, Water, Tea, Energy Drink, Coffee, Alcoholic Beverage, Juice).
- **Payment Methods** (Donut Chart): Distribution of transactions: Debit Card (24%), Credit Card (26%), Online Payment (25%), Cash (25%).
- **Top Revenue by Location** (Bar Chart): Revenue performance across states (Missouri, Massachusetts, Illinois, Virginia, Georgia).
- **Store Name List** (Table/Slicer): List of individual stores (e.g., Barron, Berg-Tran, Lee-Miller, Lopez, Martinez, etc.) for filtering.
- **Revenue & Target by Month** (Combo Chart):
  - Green bars: Monthly revenue growth % (ranging from +63.9% to -5.2%).
  - Blue line: Actual Total Revenue vs. Total Target, showing variance.

## Dataset Description

The project uses the following CSV files as data sources:

- **custome_table.csv**  
  Contains customer-related information (likely demographics such as gender, age, etc.).

- **fact_table.cvs** (note: likely a typo for .csv)  
  Main transactional fact table containing sales records, quantities, revenue, costs, refunds, dates, etc.

- **MONTLY_STOR_TARGETS.CSV**  
  Monthly revenue/profit targets per store or overall.

- **PRODUCT_TABLE.CSV**  
  Product master data (product names, categories, etc.).

- **SALES_PERSONS_TABLE.CSV**  
  Information about salespersons or store associates (names, assigned stores/regions).

These tables are connected through relationships (e.g., via Customer ID, Product ID, Store ID, Date) to enable the dynamic slicers and calculations shown in the dashboards.

## Purpose & Insights Provided

This dashboard enables stakeholders to:
- Monitor overall financial health and profitability.
- Identify high-performing customer segments (age, gender).
- Compare actual revenue against monthly targets.
- Analyze product category and individual product performance.
- Evaluate regional and store-level differences.
- Understand customer payment preferences.

## Tools Used
- Microsoft Excel (or Power BI/Tableau – based on dashboard appearance)
- Pivot Tables, Charts, Slicers, and Calculated Fields

---

**Author:** maryamyousry  
Feel free to explore, fork, or raise issues for improvements!