#the number of times males pass more higher level subjects than females in mixed schools
#for all school types for all years for all counties in the province of Leinster

SELECT COUNT(Grade_in_subject) AS Male_passes_Gr8r_than_female, IFNULL(County, 'All Counties' ) AS County,
				IFNULL(Year, 'All years') AS Year, IFNULL(School_type, 'All school types') AS School_type
                
FROM (SELECT COUNT(CASE WHEN Gender = 'Male' THEN 1 ELSE NULL END) AS Number_of_male_students, 
			 COUNT(CASE WHEN Gender = 'Female' THEN 1 ELSE NULL END) AS Number_of_female_students, Subject_level, 
			 Province, Grade_in_subject, School_type, County, Year, Gender_of_school, School_roll_number

	  FROM fact_table JOIN residence USING (Eir_code)
					  JOIN school 	 USING (School_roll_number)
					  JOIN student 	 USING (Exam_number)
					  JOIN subject   USING (Subject_code)
					  JOIN time 	 USING (Year)

	  WHERE Subject_level = 'Higher' AND Gender_of_school = 'Mixed'
						AND Grade_in_subject NOT LIKE '%7' AND Grade_in_subject NOT LIKE '%8'
						#AND Province = 'Leinster'
                        AND Socio_economic_background = 'Non-DEIS'

	  GROUP BY School_roll_number) AS Passes_in_higher_in_mixed_in_leinster

WHERE Passes_in_higher_in_mixed_in_leinster.Number_of_male_students > Passes_in_higher_in_mixed_in_leinster.Number_of_female_students

GROUP BY County, Year, School_type WITH ROLLUP;
