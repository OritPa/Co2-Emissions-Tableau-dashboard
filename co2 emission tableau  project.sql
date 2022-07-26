--Co2 Emissions Tableau Project
--Data retrieved from https://ourworldindata.org/co2-and-other-greenhouse-gas-emissions

--Full Dataset
select *
from dbo.[co2_data]

-------------------------
--Query no. 1: GDP Vs. Co2 per capita

UPDATE co2_data
SET population=0
where population is null

UPDATE co2_data
SET gdp=0.0
where gdp is null


select country,
	   year,
	   gdp,
	   population,
	   case when population<>0 then gdp/population 
			else 0
			end gdp_per_capita,
	   co2_per_capita 
from dbo.co2_data
where country not in ('World', 'Asia', 'Oceania', 'Europe', 'Africa', 'North America', 'South America', 'Antarctica', 'European Union (28)','European Union (27)','Europe (excl. EU-27)','Asia (excl. China & India)','Europe (excl. EU-28)','North America (excl. USA)','International transport')
and country not like '%income%'

------------------------------------------

--Query no. 2: CO2 levels over time per continent
select country, year, co2 
from dbo.co2_data
where country in ('Asia', 'Oceania', 'Europe', 'Africa', 'North America', 'South America', 'Antarctica')

-------------------------------------------

--Query no. 3: CO2 levels per income level
select country, year, co2 
from dbo.co2_data
where country like '%income%'

------------------------------------------

--Query no. 4: top 10 Cumulative CO2 levels countries
select top 10 country, round(isnull(cumulative_co2,0),2) cumulative_co2
from co2_data
where country not in ('World', 'Asia', 'Oceania', 'Europe', 'Africa', 'North America', 'South America', 'Antarctica', 'European Union (28)','European Union (27)','Europe (excl. EU-27)','Asia (excl. China & India)','Europe (excl. EU-28)','North America (excl. USA)','International transport')
and country not like '%income%'
and year=2020
order by 2 desc

-------------------

--Query no. 5: CO2 levels over time per country
select country,year, co2
from co2_data
where country not in ('World', 'Asia', 'Oceania', 'Europe', 'Africa', 'North America', 'South America', 'Antarctica', 'European Union (28)','European Union (27)','Europe (excl. EU-27)','Asia (excl. China & India)','Europe (excl. EU-28)','North America (excl. USA)','International transport')
and country not like '%income%'







