# Adventure Dashboard

An interactive sales and performance dashboard built for the Adventure Works dataset, providing deep insights into sales, profit, customer demographics, product performance, reseller networks, and geographical trends.

## Project Overview

This project features a professional dashboard (built in Power BI or Excel) analyzing the Adventure Works dataset – a widely used sample dataset representing a fictional multinational manufacturing company specializing in bicycles and accessories.

The dashboard consists of multiple views/pages, with two main dashboard sheets focusing on different aspects of the business.

### Dashboard View 1 – Customer & Reseller Insights
This view emphasizes customer demographics, product sales (Spanish-named products), gender distribution, and reseller performance.

**Key Metrics (Top Cards):**
- **Total Employees:** 296
- **Total Customers:** 18,484
- **Total Orders:** 23,635
- **Profit:** $4.7M
- **Total Sales:** $11.4M
- **Total Quantity Sold:** 214.4K

**Visualizations:**
- **Customers by Age** (Donut Chart): Distribution across age groups (31-40, 41-50, 51+).
- **Top Spanish Product Sales** (Bar Chart): Sales performance of Spanish-named products (e.g., Montaña 200 negra, Montaña 200 plateada, Carretera 150 roja, etc.).
- **Sales by Gender** (Donut Chart): Split between Female ($14.5M) and Male ($14.8M).
- **Reseller Profit & Sales** (Line Chart): Dual-axis trend showing Profit (blue) and Sales (orange) over time for resellers.
- **Reseller by City** (Bar Chart): Ranked reseller performance across various cities/stores (e.g., Metropolitan Equipment, Totes & Baskets Company, Field Trip Store, etc.).
- **Month Name Slicer**: Allows filtering by month (Jan–Dec).

### Dashboard View 2 – Location, Education & Monthly Trends
This view focuses on geographical performance, customer education levels, product profitability (English-named), and monthly sales trends.

**Visualizations:**
- **Profit by Location** (Bar Chart): Profit across major cities (London, Paris, Wollongong, Calgary, Melbourne, etc.).
- **Sales by Education** (Donut Chart): Sales distribution by customer education level (Bachelors, Graduate Degree, High School, Partial College, Partial High School).
- **Profit by English Product** (Bar Chart): Profit from key English-named products (e.g., Mountain-200 Silver/Black variants).
- **Customer by Country** (Bar Chart): Customer count across countries (United States dominating, followed by Australia, United Kingdom, France, Germany, Canada).
- **Sales by Month** (Line Chart): Monthly sales trend showing growth from ~$1.7M to peak at $2.9M, then slight decline to $2.5M.
- **Month Slicer**: Interactive month filter.

## Dataset Description

This dashboard is typically built using the standard Adventure Works data model, which includes interconnected tables such as:

- Fact tables: Sales, Reseller Sales, Internet Sales, etc.
- Dimension tables: Customer, Product, Date, Geography, Reseller, Employee, etc.

These tables are related through keys (e.g., CustomerKey, ProductKey, DateKey, SalesTerritoryKey) to enable dynamic filtering and slicing across all visuals.

## Purpose & Insights Provided

The Adventure Dashboard helps stakeholders to:
- Track overall business performance (sales, profit, orders, quantity).
- Understand customer demographics (age, gender, education, country).
- Analyze product performance across different naming/language variants.
- Evaluate reseller network effectiveness by city and over time.
- Identify high-performing geographic regions and cities.
- Monitor monthly sales trends and seasonality.

## Tools Used
- Microsoft Power BI (recommended) or Excel with Power Pivot
- DAX measures, relationships, slicers, and advanced visualizations

---

**Author:** maryamyousry  
Feel free to explore, fork, or raise issues for enhancements!