SELECT * FROM techno_culture.techno_culture;

-- To identify total of each column from the table
SELECT
COUNT(distinct STATE_OF_COLLEGE) AS TOTAL_STATES,
COUNT(NAME_OF_COLLEGE) AS TOTAL_COLLEGES,
COUNT(distinct TYPE_OF_COMPETIONS) AS TOTAL_COMPITION,
SUM(NO_OF_STUDENTS) AS TOTAL_STUDENTS,
 SUM(NO_OF_FEMALES) AS TOTAL_FEMALE,
SUM(NO_OF_MALES) AS TOTAL_MALE
FROM techno_culture;


-- To identify those people who odidn't opt for veg food 
-- To order them by those people who need food
select NO_OF_STUDENTS,VEG, FOOD
from techno_culture
where not VEG= "YES"
order by FOOD;

-- To collect the details of the food required in single table
select concat(FOOD," ", VEG," ", VEG_NO," ", NON_VEG," ", NON_VEG_NO) AS "FOOD_REQUIREMENT_DEETS"
from techno_culture;

SELECT CONCAT(FOOD, " ", VEG, " ", VEG_NO, " ", NON_VEG, " ", NON_VEG_NO) AS "FOOD_REQUIREMENT_DEETS",
    CASE WHEN FOOD = 'YES' AND VEG = 'YES' AND NON_VEG = 'YES' THEN 'YES'
    END AS "FOOD_REQUIRED"
FROM techno_culture;

-- To identify the highest number of participants from a particular college
select NAME_OF_COLLEGE,NO_OF_STUDENTS AS MAJORITY_STUDENTS
from techno_culture
where NO_OF_STUDENTS=(SELECT MAX(NO_OF_STUDENTS)FROM techno_culture);

-- Selecting the college having min no of female who need accomodation
SELECT NAME_OF_COLLEGE ,TYPE_OF_COMPETIONS ,NO_OF_STUDENTS,NO_OF_FEMALES ,NO_OF_MALES
from techno_culture
where NO_OF_STUDENTS<10 AND NO_OF_FEMALES=1;

-- To calculate average number of students participanting
select avg(NO_OF_STUDENTS) as AVERAGE_NO_OF_STUDENTS_PARTICIPATING
from techno_culture;

-- To identify the number of students consuming veg and non-veg
SELECT 
     'VEG' AS CATEGORY, 
	 SUM(CASE WHEN VEG = 'YES' THEN NO_OF_STUDENTS ELSE 0 END) AS TOTAL
 FROM 
     techno_culture
 WHERE 
     VEG = 'YES'
 UNION ALL
 SELECT 
     'NON_VEG' AS CATEGORY,
     SUM(CASE WHEN NON_VEG = 'YES' THEN NO_OF_STUDENTS ELSE 0 END) AS TOTAL
 FROM 
     techno_culture
 WHERE
	  NON_VEG = 'YES';

-- To identify those students who require both transport and accomodation
SELECT NAME_OF_COLLEGE, NO_OF_STUDENTS, ACCOMODATION, TRANSPORTATION,
CASE 
WHEN  ACCOMODATION= 'YES' AND TRANSPORTATION= 'YES' THEN 'TRUE'
END AS TRANS_ACC
FROM techno_culture;

-- To identify in which competition and college the Number of male participants are greater than average number of males
SELECT NAME_OF_COLLEGE,TYPE_OF_COMPETIONS,NO_OF_MALES
FROM techno_culture
WHERE NO_OF_MALES > (SELECT AVG(NO_OF_MALES) FROM techno_culture);

SELECT DEPARTURE_TIME, VEHICLES_REQUIRED
FROM techno_culture
WHERE DEPARTURE_DATE=(SELECT MAX(VEHICLE_REQUIRED) FROM techno_culture);
      
--
SELECT 'VEG' AS CATEGORY, SUM(CASE WHEN VEG = 'YES' THEN VEG_NO END) AS TOTAL
FROM techno_culture
WHERE VEG = 'YES'
UNION ALL
SELECT 'NON_VEG' AS CATEGORY, SUM(CASE WHEN NON_VEG = 'YES' THEN NON_VEG_NO  END) AS TOTAL
FROM techno_culture
WHERE NON_VEG = 'YES';

SELECT
    'VEG' AS CATEGORY,
    SUM(CASE WHEN VEG = 'YES' THEN VEG_NO  END) +
    SUM(CASE WHEN NON_VEG = 'YES' THEN NON_VEG_NO END) AS TOTAL
FROM techno_culture
WHERE VEG = 'YES' OR NON_VEG = 'YES';

