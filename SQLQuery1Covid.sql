Select *
From .dbo.CovidDeaths$
order by 3,4

--Select *
--From .dbo.CovidVaccinations$
--order by 3,4

--Select data that are going to be using

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths$
order by 1,2


--Looking at Total Cases vs Total Deaths
Select Location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as DeathsProcentage
From PortfolioProject..CovidDeaths$
WHERE location like 'poland'
order by 1,2


--Looking at Total Cases vs Population
--Shows what procentage of population got Covid
Select Location, date, total_cases, Population, (total_cases/population)*100 as Cases_procentage
From PortfolioProject..CovidDeaths$
WHERE location like 'poland'
order by 1,2


--Looking at Countries with Highiest Infection Rate compared to Population
Select Location, MAX(total_cases), Population AS HighiestInfectionCount, MAX(total_cases/population)*100 as Cases_procentage
From PortfolioProject..CovidDeaths$
GROUP BY location, population
order by Cases_procentage desc

--Showing Countries wiht the Highiest Death Count per Population
Select Location, MAX(total_deaths) as TotalDeathCount
From PortfolioProject..CovidDeaths$
group by location
order by TotalDeathCount desc

--GLOBAL NUMBERS
SELECT date, SUM(new_cases), SUM(cast(new_deaths as int))
FROM PortfolioProject..CovidDeaths$
GROUP BY date
ORDER BY 1,2

--Looking at Total Population vs Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by dea.Location) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths$ dea
Join PortfolioProject..CovidVaccinations$ vac
	ON dea.location=vac.location
	and dea.date=vac.date
ORDER BY 2,3



SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by dea.Location) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths$ dea
Join PortfolioProject..CovidVaccinations$ vac
	ON dea.location=vac.location
	and dea.date=vac.date
ORDER BY 2,3


