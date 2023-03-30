-- Get the total number of records in the dataset.

SELECT COUNT(*)
from [Portfolio Project]..CovidDeaths

SELECT COUNT(*)
from [Portfolio Project]..CovidVaccinations



 -- Get the total number of records for a specific country (e.g., United States).
select date, continent, location, population, total_cases, total_deaths from CovidDeaths
where location like '%states%'



 -- Get the total number of records for a specific continent (e.g.,North America).
select date, continent, location, population, total_cases, total_deaths from CovidDeaths
where continent like '%north%'
order by 1,3



--Get the earliest date in the dataset
SELECT MIN(date) FROM CovidDeaths



-- Get the latest date in the dataset.
SELECT MAX(date) FROM CovidDeaths



-- Get the average number of deaths across all records.
SELECT AVG(cast(total_deaths as int)) FROM CovidDeaths



-- Get the Maximum number of deaths across all records.
SELECT MAX(cast(total_deaths as int)) FROM CovidDeaths



-- Get the Mimimum number of deaths across all records.
SELECT MIN(cast(total_deaths as int)) FROM CovidDeaths



-- Get the total number of cases across all records.
SELECT SUM(cast(total_deaths as int)) FROM CovidDeaths; 



 -- Get the average number of cases for a specific country (e.g., India).
 SELECT AVG(cast(total_deaths as int))
 FROM CovidDeaths
 WHERE location like 'India';











 -- Get 
 Select *
From CovidDeaths
Where continent is not null 
order by 3,4

select *
from [Portfolio Project]..CovidVaccinations
order by 3,4



-- Getting the right Data to work with
select location, date, total_cases, new_cases, total_deaths,population
from [Portfolio Project]..CovidDeaths
where continent is not null
order by 1,2



-- Looking at Total Cases vs Total Deaths
-- Shows likelyhood of dying if you contract covid in your Country
select location, date, total_cases, total_deaths,population, (total_deaths/total_cases)*100 as DeathPercentage
from [Portfolio Project]..CovidDeaths
where location like '%states%'
order by 1,2



--Looking at Total Cases Vs Population
-- Shows what percengtage of the Population got Covid
select location, date, population, total_cases, (total_cases/population)*100 as PercentagePopulationInfected
from [Portfolio Project]..CovidDeaths
where location like '%nigeria%'
order by 1,2



--Looking at Countries with the Highest Infection Rate compared to the Population
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, 
(MAX(total_cases)/population)*100 AS PercentagePopulationInfected
FROM [Portfolio Project]..CovidDeaths
GROUP BY location, population
ORDER BY PercentagePopulationInfected desc



--Countries with the Highest Death Count Per Population
SELECT location, MAX(cast( total_deaths as int)) AS TotalDeathCount
FROM [Portfolio Project]..CovidDeaths
where continent is not null
GROUP BY location
ORDER BY TotalDeathCount desc



--Continents with the Highest Death Count Per Population
SELECT continent, MAX(cast( total_deaths as int)) AS TotalDeathCount
FROM [Portfolio Project]..CovidDeaths
where continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc



--TOTAL CASES TOTAL DEATHS AND PERCENTAGE DEATH BY DATE
select date, Sum(new_cases) as total_cases, Sum(cast(new_deaths as int)) as total_deaths, Sum(cast(new_deaths as int))/Sum(new_cases)*100 as DeathPercentage
from [Portfolio Project]..CovidDeaths
where continent is not null
group by date
order by 1,2



--TOTAL CASES TOTAL DEATHS AND PERCENTAGE DEATH
select Sum(new_cases) as total_cases, Sum(cast(new_deaths as int)) as total_deaths, Sum(cast(new_deaths as int))/Sum(new_cases)*100 as DeathPercentage
from [Portfolio Project]..CovidDeaths
where continent is not null
--group by date
order by 1,2



--LOOKING AT TOTAL POPULATION VS VACCINATIONS
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, Sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
from [Portfolio Project]..CovidDeaths dea
join [Portfolio Project]..CovidVaccinations vac
       on dea.location = vac.location
	   and dea.date = vac.date
where dea.continent is not null
order by 2,3



--USING CTE



/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/











 







 











