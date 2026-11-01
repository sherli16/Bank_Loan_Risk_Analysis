use BankRisk;
SELECT * FROM BankRisk.INFORMATION_SCHEMA.TABLES

select * from Loan_default;


--Total Default
select count(*) as total,sum(cast([Default] as int)) as Total_Default,
cast(sum(cast([Default] as int))*100.0/count(*) as decimal(5,2)) as default_percentage
from Loan_default;

--Credit Score Band wise Risk
select
case when CreditScore<600 Then 'Poor(High Risk)'
     when CreditScore<700 Then 'Medium'
     else 'Good(Low Risk)'
End as CreditBand,
count(*) as Loans,
sum(cast([Default] as int)) as defaults,
 CAST(AVG(cast([Default] as float))*100 as DECIMAL(5,2)) as Default_Rate
From Loan_default Group by
 Case when CreditScore < 600 Then 'Poor(High Risk)'
      when CreditScore < 700 Then 'Medium'
      else 'Good(Low Risk)'
 end;

 --Income vs Default
 with IncomeBand as(select *,
 case when Income<30000 then 'Low'
      when Income<60000 then 'Medium'
      else 'High'
  End  as Income_band
  from Loan_default)
  SELECT Income_Band, cast(avg(cast([Default] as FLOAT))*100 as DECIMAL(5,2)) as Default_Rate
  from IncomeBand 
  Group by Income_Band;

  --Risky Loan Purpose
  select LoanPurpose,count(*) as total,
  avg(cast([Default] as float)*100)as default_rate
  from Loan_default group by LoanPurpose order by default_rate desc;

  --High Risk Customers
select Top 100 Age,Income,DTIRatio,CreditScore,LoanAmount from Loan_default
where DTIRatio>0.4 and CreditScore<650 and [Default]=1;

--EmploymentType Risk
select EmploymentType,count(*) as Loans,
avg([Default]*100.0) as default_rate
from Loan_default group by EmploymentType
order by default_rate desc;

--Interest Rate Impact
select case
when InterestRate<10 then 'Low Interest'
when InterestRate<15 then 'Medium Interest'
else 'HighInterest'
End as Interest_Rate,avg([Default]*100.0) as Default_rate
from Loan_default group by case
when InterestRate<10 then 'Low Interest'
when InterestRate<15 then 'Medium Interest'
else 'HighInterest'

--Rank by creditscore
select Age,Income,CreditScore,[Default],
 rank() over(partition by [Default] order by CreditScore Desc) as creditRank
from Loan_default;


--Hs cosigner effect
Select HasCoSigner, Count(*) as Total, avg([Default]*100.0) as Default_Rate
from Loan_default Group by HasCoSigner;

--view
create view Risk_Dashboard as
select Loan_default.*,
case when CreditScore < 600 then 'High Risk'
               when CreditScore < 700 then 'Medium Risk' else 'Low Risk'
               END as Risk_Category
from Loan_default;
select * from Risk_Dashboard;