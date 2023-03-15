SELECT * 
FROM dbo.['public-health-expenditure-s (2)$']

--Looking at the Highiest Public Health Expediture in 2018
Select *
FROM dbo.['public-health-expenditure-s (2)$']
WHERE YEAR=2021
Order BY public_health_expenditure_pc_gdp desc;

--Looking at the Highiest Public Health Expediture in general
Select *
FROM dbo.['public-health-expenditure-s (2)$']
Order BY public_health_expenditure_pc_gdp desc;

--Looking at the Lowest Public Health Expediture in 2021
Select *
FROM dbo.['public-health-expenditure-s (2)$']
wHERE year=2021
Order BY public_health_expenditure_pc_gdp desc
;

---Looking at the oldest Public Health Expediutre
Select COUNT(Year), Entity
From dbo.['public-health-expenditure-s (2)$']
GROUP BY Entity;

--Looking at the Highiest Public Health Expediture in a specific country
SELECT Entity, MAX(public_health_expenditure_pc_gdp)
FROM dbo.['public-health-expenditure-s (2)$']
GROUP BY Entity;


 