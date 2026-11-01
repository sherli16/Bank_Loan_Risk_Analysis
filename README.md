# BankRisk - Loan Risk & Default Intelligence Dashboard

Analyzing 200K Loans to Identify High-Risk Customers & Default Patterns using SQL + Power BI

### 📊 Dataset
- Database: BankRisk
- Table: Loan_default (200K Records)
- Columns: Age, Income, CreditScore, LoanAmount, DTIRatio, InterestRate, LoanPurpose, Default

### 🔍 SQL Analysis
- **Total Default Rate:** Calculated total loans, defaults & default percentage.
- **Credit Score Band:** Poor <600 (High Risk), Medium 600-700, Good >700 - Poor has highest default.
- **Income vs Default:** Low <30K, Medium <60K, High >60K - Low income = High risk.
- **Risky Loan Purpose:** Business loans show highest default rate.
- **High Risk Filter:** DTIRatio > 0.4 and CreditScore < 650 and Default=1 (Top 100 Customers)
- **Interest Rate Impact:** Low <10%, Medium <15%, High >15% - High interest = High default.
- **CoSigner Effect:** HasCoSigner reduces default risk.
- **View Created:** Risk_Dashboard view with Risk_Category (High/Medium/Low)

### 📈 Power BI Dashboard
- Risk_Category, CreditScore and InterestRate analysis
- CreditScore by Risk_Category: High 18%, Medium 27%, Low 54%
- %GT Average of Default by Risk_Category
- Average of Default by LoanPurpose - Business is highest

### 💡 Key Insights
- Credit Score < 600 = Most Risky
- Business Loan = Highest Default Rate  
- DTI > 0.4 + Low Credit Score = Danger Zone
- Having Co-Signer Reduces Risk

### 🛠️ Tech Stack
SQL Server, Power BI

### 📁 Files
- Loan Risk Analysis.sql
- dashboard.png
