SELECT *
FROM portfolioproject2.hpv_past_results
-- SELECT *
-- FROM portfolioproject2.results_2021

SELECT country_name, region, year,possible_cancer_cases,possible_cancer_deaths
FROM portfolioproject2.hpv_past_results
order by 1,3
-- BEFORE 2021

-- Looking at Countries with Highest Death Count, Possible Cancer Case commpared to Death Prevented Rate before 2021
SELECT distinct(country_name), round(sum(possible_cancer_cases),2) as TotalPossibleCancerCases, round(sum(possible_cancer_deaths),2) as TotalPossibleCancerDeaths,
round(sum(deaths_prevented)) as TotalDeathPrevented, (round(sum(deaths_prevented),2)/round(sum(possible_cancer_deaths),2))*100 as DeathPreventedRate
FROM portfolioproject2.hpv_past_results
group by country_name
Order by  5 

-- Looking at death prevented trend by country before 2021
SELECT year, country_name, (deaths_prevented)/(possible_cancer_deaths) *100 as DeathPreventedRates
FROM portfolioproject2.hpv_past_results
order by 1

-- Looking at Region with Highest Death Percentage compared to possible cases before 2021
SELECT distinct region, round(sum(possible_cancer_cases),2) as TotalPossibleCancerCases,round(sum(possible_cancer_deaths),2) as TotalPossibleCancerDeaths,(sum(possible_cancer_deaths)/sum(possible_cancer_cases))*100 as PossibleDeathPercentage
FROM portfolioproject2.hpv_past_results
group by region
Order by 4 desc

-- Looking at death prevented by Region before 2021
SELECT distinct region, round(sum(deaths_prevented)) as TotalDeathPrevented, round(sum(deaths_prevented)) as TotalDeathPrevented, (round(sum(deaths_prevented),2)/round(sum(possible_cancer_deaths),2))*100 as DeathPreventedRate
FROM portfolioproject2.hpv_past_results
group by region
Order by 4

-- Looking at death prevented trend by Region before 2021
SELECT year, region, (deaths_prevented)/(possible_cancer_deaths) *100 as DeathPreventedRates
FROM portfolioproject2.hpv_past_results
order by 1

SELECT year, region, (deaths_prevented)/(possible_cancer_deaths) *100 as DeathPreventedRates
FROM portfolioproject2.hpv_past_results
order by 1

-- Looking at total possible cancer death vs death prevented trend vs DeathPreventedRates worldwide before 2022
SELECT distinct(year), (sum(deaths_prevented)/round(sum(possible_cancer_deaths))) *100 as DeathPreventedRates
FROM portfolioproject2.hpv_past_results
group by year
order by 1
-- Looking at global number 
SELECT SUM(deaths_prevented) as TotalDeathPrevented, ROUND(SUM(possible_cancer_deaths)) as TotalPossibleCancerDeaths, 
(SUM(deaths_prevented)/ROUND(SUM(possible_cancer_deaths))) *100 as DeathPreventedRates
FROM portfolioproject2.hpv_past_results
order by 1



-- How Vacination works 2021

SELECT Withvac.Region, Withvac.country_name, Withvac.curr_vacc_cohort_size, round(((Withvac.cancer_prevented/Withvac.curr_vacc_cohort_size)*100),2) as CancerPreventedRatewithVaccine,
round(((Withvac.deaths_prevented/Withvac.curr_vacc_cohort_size) *100),2) as DeathPrevenedRateWithVaccine 
FROM portfolioproject2.results_2021 as Withvac
JOIN portfolioproject2.hpv_past_results as Nonvac
ON Nonvac.country_name= Withvac.country_name
and Withvac.Region= Nonvac.Region
and Withvac.year= Nonvac.year
order by 4 desc
	
    