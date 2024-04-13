--select * from PortfolioProject..CovidDeaths

select * from PortfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 3,4


--select * from PortfolioProject..CovidVaccinations
--ORDER BY 3,4



--SELECT DATA THAT WE ARE GOING TO BE USING

select Location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
order by 1,2



--looking at total cases vs total deaths
--showing likelihood of dying if you contact covid in your country

select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%india%'
order by 1,2



--Looking at Total Cases vs Population
--Shows what percentage of population got covid

select Location, date, Population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
where location like '%india%'
order by 1,2



--Looking at countries with highest infection rate compared to population


select Location, Population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
--where location like '%india%'
GROUP BY Location, Population
order by  PercentPopulationInfected desc


--Showing Countries With Highest Death Count per Population


select Location, MAX(Total_deaths) AS TotalDeathCount
from PortfolioProject..CovidDeaths
GROUP BY Location
order by  TotalDeathCount desc


--Changing data type of total deaths by using CAST functiom

select Location, MAX(CAST (Total_deaths as int)) AS TotalDeathCount
from PortfolioProject..CovidDeaths
GROUP BY Location
order by  TotalDeathCount desc



--removing null by using where func 

select Location, MAX(CAST (Total_deaths as int)) AS TotalDeathCount
from PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY Location
order by  TotalDeathCount desc


--Let's Break Things Down By Continent

select continent, MAX(CAST (Total_deaths as int)) AS TotalDeathCount
from PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY continent
order by  TotalDeathCount desc



select location, MAX(CAST (Total_deaths as int)) AS TotalDeathCount
from PortfolioProject..CovidDeaths
WHERE continent is null
GROUP BY location
order by  TotalDeathCount desc



--Showing Continent With Highest Death Count per population

select continent, MAX(CAST (Total_deaths as int)) AS TotalDeathCount
from PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY continent
order by  TotalDeathCount desc



--GLOBAL NUMBERS

SELECT date, SUM(new_cases), SUM(CAST(new_deaths as int)),SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where Continent is not null
group by date
order by 1,2


SELECT date, SUM(new_cases) as Total_Cases, SUM(CAST(new_deaths as int)) as Total_Deaths,SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where Continent is not null
group by date
order by 1,2


SELECT SUM(new_cases) as Total_Cases, SUM(CAST(new_deaths as int)) as Total_Deaths,SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where Continent is not null
--group by date
order by 1,2




SELECT *
From  PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    on  dea.location = vac.location
	and dea.date = vac.date


--Looking at total population vs vaccinations



SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM (CONVERT(int,vac.new_vaccinations)) OVER (Partition by  dea.location)
From  PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    on  dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3   



SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM (Cast(vac.new_vaccinations as int)) OVER (Partition by  dea.location)
From  PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    on  dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3  



SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM (CONVERT(int,vac.new_vaccinations)) OVER (Partition by  dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
From  PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    on  dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3  



--USE CTE

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM (CONVERT(int,vac.new_vaccinations)) OVER (Partition by  dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
From  PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    on  dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3  
)
SELECT *, (RollingPeopleVaccinated/Population)*100
from PopvsVac




--TEMP TABLE

CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM (CONVERT(int,vac.new_vaccinations)) OVER (Partition by  dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
From  PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    on  dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3  

SELECT *, (RollingPeopleVaccinated/Population)*100
from #PercentPopulationVaccinated



DROP TABLE IF exists #PercentPopulationVaccinated

CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM (CONVERT(int,vac.new_vaccinations)) OVER (Partition by  dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
From  PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    on  dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null
--order by 2,3  

SELECT *, (RollingPeopleVaccinated/Population)*100
from #PercentPopulationVaccinated




--CREATING VIEW TO STORE DATA FOR LATER VISUALIZATION

CREATE VIEW PercentPopulationVaccinated as 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
 SUM (CONVERT(int,vac.new_vaccinations)) OVER (Partition by  dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
From  PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    on  dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
--order by 2,3


Select*
from PercentPopulationVaccinated