# Workforce Performance Analytics

## Project Overview

This project is an end-to-end HR & Payroll Analytics System built using:

- MySQL – Backend data modeling  
- Advanced SQL – Analytical logic & window functions  
- Power BI – Interactive dashboard & visualization  

The goal is to simulate a real-world HR analytics environment and demonstrate strong data modeling, SQL proficiency, and BI dashboard development skills.

---

## Database Design

The database was designed using a normalized relational structure.

### Core Tables

- departments  
- employees  
- salary_transactions (Fact Table)  

Key features:
- Primary & Foreign key constraints  
- UNIQUE constraints (email, employee-month salary)  
- Monthly payroll simulation  
- Realistic hire dates for tenure analysis  

---

## Analytical Layer (SQL Views)

- vw_monthly_payroll  
- vw_running_company_payroll  
- vw_employee_total_salary  
- vw_employee_salary_rank  
- vw_department_monthly_payroll  

Power BI connects to structured analytical views instead of raw tables.

---

## Power BI Dashboard

### Page 1 – Executive Overview

- Total Payroll  
- Total Employees  
- Average Base Salary  
- Average Tenure  
- Department-wise Payroll  
- Top 5 Highest Paid Employees  
- Monthly Payroll Trend  
- Interactive Department Slicer  

---

### Page 2 – Workforce Experience Analysis

- Salary vs Tenure (Scatter Analysis)  
- Department-wise Average Tenure  
- Salary Growth Pattern by Experience  

---

## Key Business Insights

- Payroll distribution across departments  
- Relationship between tenure and salary growth  
- Workforce maturity analysis  
- High-cost department identification  
- Employee ranking by compensation  

---

## Tools & Technologies

- MySQL  
- SQL (GROUP BY, Window Functions, RANK, PARTITION BY)  
- Power BI  
- DAX (Measures & Calculated Columns)  

---

## Dashboard Screenshots

### Executive Overview
![Executive Overview](https://github.com/priiyanka-b/workforce_anlaytics/blob/2cc538803b972d9ffea693b3ed775635e383cb69/Screenshot%20(530).png)

### Workforce Experience Analysis
![Workforce Experience](https://github.com/priiyanka-b/workforce_anlaytics/blob/d916fd78297de2f7604f2f41d96cb68daf1c4ad1/Screenshot%20(532).png)

---

## Project Objective

To build a portfolio-level HR analytics system demonstrating:

- Strong SQL fundamentals  
- Advanced window function mastery  
- Data modeling clarity  
- Clean BI architecture  
- Business KPI thinking  
