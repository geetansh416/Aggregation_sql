use world;
select * from city;
select * from country;
select * from countrylanguage;

-- Q1 Count how many cities are there in each country?
select country.Name, Count(city.countrycode) as city_count from country left join city on country.code = city.countrycode group by country.Name order by city_count; 

-- Q2 Display all continents having more than 30 countries
select Continent , count(Name) as Cnt from country group by continent having Cnt > 30;

-- Q3 List regions whose total population exceeds 200 million
select Region, Sum(population) as Total_Population from country group by region having total_population > 20000000;

-- Q4 Find the top 5 continents by average GNP per country
select continent, avg(GNP) as Average_GNP from country group by continent order by average_gnp desc limit 5;

-- Q5 Find the total number of official languages spoken in each continent.
select country.continent, country.code, count(countrylanguage.isofficial) from country 
join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.isofficial = 'T' 
group by country.continent, country.code;

-- Q6 Find the maximum and minimum GNP for each continent
select Continent, max(GNP), min(GNP) from country group by continent;

-- Q7 Find the country with the highest average city population.
select country.Name, city.countrycode, avg(city.population) as Pop from country
join city on country.code = city.countrycode group by city.countrycode, country.Name order by pop desc limit 1;

-- Q8 List continents where the average city population is greater than 200,000.
select country.continent, avg(city.population) as pop from country
join city on country.code = city.countrycode
 group by country.continent having pop > 200000;
 
 -- Q9 Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.
 select continent, sum(population), avg(lifeexpectancy) as lifeexpec from country group by continent order by lifeexpec desc;
 
 -- Q10 Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.
 select continent, sum(population) as pop, avg(lifeexpectancy) as lifeexpec from country group by continent having pop > 20000000 order by lifeexpec desc;