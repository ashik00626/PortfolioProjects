SELECT *
FROM china.covid_deaths
ORDER BY 3,4;

--SELECT *
--FROM china.vaccination
--ORDER BY 3,4

--Select Data that we are using

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM china.covid_deaths
WHERE Continent is not null
ORDER BY 1,2

--Looking at Total Cases vs Total Deaths
--Shows likelihood of dying
SELECT location, date, total_cases, total_deaths,(CAST(total_deaths AS DECIMAL) / total_cases)*100 as DeathPercentage
FROM china.covid_deaths
WHERE location like '%Bangladesh%'
AND Continent is not null
ORDER BY 1,2

--Looking at Total Cases vs Population
--Shows what Percentage of Population got Covid

SELECT location, date, population, total_cases, (CAST(total_cases AS DECIMAL)/population)*100 as PercentPopulationInfected
FROM china.covid_deaths
--WHERE location like '%Bangladesh%'
WHERE Continent is not null
ORDER BY 1,2

--Looking at Highest Infection Rate compare to Population

SELECT location, population, MAX(total_cases)as HighestInfectionCount, MAX((CAST(total_cases AS DECIMAL)/population))*100 as PercentPopulationInfected
FROM china.covid_deaths
--WHERE location like '%Bangladesh%'
WHERE Continent is not null
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC

--Showing Countries with Highest Death Count per Population

SELECT location, MAX(total_deaths) as TotalDeathCount
FROM china.covid_deaths
--WHERE location like '%Bangladesh%'
WHERE Continent is not null
GROUP BY location
ORDER BY TotalDeathCount DESC

--LETS BREAK THINGS DOWN BY CONTINENTS


--Showing continent with the highest death count per population


SELECT continent, MAX(total_deaths) as TotalDeathCount
FROM china.covid_deaths
--WHERE location like '%Bangladesh%'
WHERE Continent is not null
GROUP BY continent
ORDER BY TotalDeathCount DESC

--GLOBAL NUMBERS

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(CAST(new_deaths AS DECIMAL))/SUM(new_cases)*100 AS DeathPercentage
FROM china.covid_deaths
--WHERE location like '%Bangladesh%'
WHERE continent is not null
GROUP BY date
ORDER BY 1,2

--Total Numbers

SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(CAST(new_deaths AS DECIMAL))/SUM(new_cases)*100 AS DeathPercentage
FROM china.covid_deaths
--WHERE location like '%Bangladesh%'
WHERE continent is not null
--GROUP BY date
ORDER BY 1,2

--Looking at Total Population vs Vaccinations

SELECT dea.continent, dea.location, dea.date, vac.population, dea.new_vaccinations, SUM(dea.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date)
AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM china.covid_vaccinations dea
JOIN china.covid_deaths vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2, 3 

--USE CTE

WITH PopvsVac (Continent, Location, Date, Population, New_Vaccination, RollingPeopleVaccinated)
AS
(

SELECT dea.continent, dea.location, dea.date, vac.population, dea.new_vaccinations, 
SUM(dea.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM china.covid_vaccinations dea
JOIN china.covid_deaths vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3
)
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM PopvsVac


--TEMP TABLE for Percent Vaccination

DROP TABLE IF EXISTS PercentPopulationVaccinated;
CREATE TEMP TABLE PercentPopulationVaccinated
(
Continent text,
Location text,
Date date,
Population bigint,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
);

--Insert Data with Rolling Vaccination Calculation

INSERT INTO PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, vac.population, dea.new_vaccinations, 
SUM(dea.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM china.covid_vaccinations dea
JOIN china.covid_deaths vac
	ON dea.location = vac.location
	AND dea.date = vac.date;
--WHERE dea.continent is not null
--ORDER BY 2,3

--Query with Percentage Calculation

SELECT *, (RollingPeopleVaccinated/Population)*100 
FROM PercentPopulationVaccinated;


--Creating view to store data for later visualization

DROP VIEW IF EXISTS china.PercentPopulationVaccinated;
CREATE VIEW china.PercentPopulationVaccinated AS
SELECT dea.continent, dea.location, dea.date, vac.population, dea.new_vaccinations, 
SUM(dea.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM china.covid_vaccinations dea
JOIN china.covid_deaths vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null;
--ORDER BY 2,3

