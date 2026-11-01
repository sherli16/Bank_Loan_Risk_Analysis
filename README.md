# 🏦 Bank Loan Risk & Default Analysis

> Analyzed 255K loan records to identify default patterns, high-risk customers & loan risk factors using SQL Server & Power BI.

### 🔑 KPIs
- **Total Loans:** 255K
- **Default Rate:** 12% (0.12)
- **Avg Credit Score:** 574.26

### 🔍 SQL Analysis Done

**1. Total Default Analysis**
- Total Loans, Total Defaults, Default Percentage

**2. Credit Score Band Risk**
- Poor (High Risk <600), Medium (<700), Good (Low Risk)

**3. Income vs Default**
- Low (<30K), Medium (<60K), High - Using CTE

**4. Risky Loan Purpose**
- Business, Auto, Education, Home - Highest default purpose

**5. High Risk Customers**
- Filter: DTIRatio>0.4, CreditScore<650, Default=1 - Top 100

**6. Employment & CoSigner Risk**
- EmploymentType, HasCoSigner effect on default

**7. Advanced SQL**
- Window Function: `RANK() OVER(PARTITION BY Default)`
- View Created: `Risk_Dashboard` with Risk_Category

### 🛠️ Tech Stack
SQL Server, Power BI, SQL (CASE, CTE, CAST, RANK, VIEW)

### 👩‍💻 Author: Sherli
