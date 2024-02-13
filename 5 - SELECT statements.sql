--All the names (first and last) of the people using the application

SELECT "firstName","lastName" FROM person;

--All the people who live in Nashville, TN

SELECT "firstName","lastName"
FROM person
WHERE location_id=1;

--How many people live in each of our four cities

SELECT city, COUNT(location_id)
FROM location
JOIN person ON location.id = person.location_id
GROUP BY city;

--How many people are interested in each of the 7 interests

SELECT title, COUNT(title)
FROM interest
JOIN person_interest ON interest.id = person_interest.interest_id
GROUP BY title;

--The names (first and last) of all the people who live in Nashville, TN and are interested in programming

SELECT "firstName","lastName",city,state,title
FROM person
JOIN location ON person.location_id = location.id
JOIN person_interest ON person.id = person_interest.person_id
JOIN interest ON person_interest.interest_id = interest.id
WHERE location_id = 1
AND interest_id = 1;

--OPTIONAL BONUS: How many people there are in each of the following age ranges: 20-30, 30-40, 40-50

SELECT CASE WHEN age BETWEEN 20 AND 30 THEN '20 - 30'
		    WHEN age BETWEEN 30 AND 40 THEN '30 - 40'
			WHEN age BETWEEN 40 AND 50 THEN '40 - 50'			
	   END AS range,
	   COUNT(*)
FROM person
GROUP BY 1
ORDER BY 1;