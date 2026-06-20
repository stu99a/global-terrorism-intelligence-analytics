-- Top 10 countries by terrorism incidents
SELECT
    country_txt,
    COUNT(*) AS total_incidents
FROM terrorism
GROUP BY country_txt
ORDER BY total_incidents DESC
LIMIT 10;

-- Countries with the highest fatalities

SELECT
    country_txt,
    SUM(nkill) AS total_fatalities
FROM terrorism
GROUP BY country_txt
ORDER BY total_fatalities DESC
LIMIT 10;

-- Distribution of attack types

SELECT
    attacktype1_txt,
    COUNT(*) AS incidents
FROM terrorism
GROUP BY attacktype1_txt
ORDER BY incidents DESC;

-- Distribution of weapon types

SELECT
    weaptype1_txt,
    COUNT(*) AS incidents
FROM terrorism
GROUP BY weaptype1_txt
ORDER BY incidents DESC;

-- Most frequently attacked targets

SELECT
    targtype1_txt,
    COUNT(*) AS incidents
FROM terrorism
GROUP BY targtype1_txt
ORDER BY incidents DESC;

-- Most active terrorist organizations

SELECT
    gname,
    COUNT(*) AS incidents
FROM terrorism
WHERE gname <> 'Unknown Group'
GROUP BY gname
ORDER BY incidents DESC
LIMIT 10;

-- Groups causing the most fatalities

SELECT
    gname,
    SUM(nkill) AS fatalities
FROM terrorism
WHERE gname <> 'Unknown Group'
GROUP BY gname
ORDER BY fatalities DESC
LIMIT 10;

-- Fatalities by region

SELECT
    region_txt,
    SUM(nkill) AS fatalities
FROM terrorism
GROUP BY region_txt
ORDER BY fatalities DESC;

-- Attack outcomes

SELECT
    attack_success,
    COUNT(*) AS incidents
FROM terrorism
GROUP BY attack_success;

-- Suicide attack distribution

SELECT
    suicide_attack,
    COUNT(*) AS incidents
FROM terrorism
GROUP BY suicide_attack;

-- Historical trend by decade

SELECT
    decade,
    COUNT(*) AS incidents
FROM terrorism
GROUP BY decade
ORDER BY decade;

-- Events causing at least 100 casualties

SELECT
    eventid,
    country_txt,
    city,
    nkill,
    nwound,
    casualties
FROM terrorism
WHERE casualties >= 100
ORDER BY casualties DESC;

-- Average casualties by attack type

SELECT
    attacktype1_txt,
    ROUND(AVG(casualties),2) AS avg_casualties
FROM terrorism
GROUP BY attacktype1_txt
ORDER BY avg_casualties DESC;

-- Cities with the highest fatalities

SELECT
    city,
    SUM(nkill) AS fatalities
FROM terrorism
GROUP BY city
ORDER BY fatalities DESC
LIMIT 10;

-- Countries with the highest average casualties

SELECT
    country_txt,
    ROUND(AVG(casualties),2) AS avg_casualties
FROM terrorism
GROUP BY country_txt
ORDER BY avg_casualties DESC
LIMIT 10;
