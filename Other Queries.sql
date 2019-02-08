#SELECT Count(case Gender when 'Female' then 1 else null end) as Number_of_female_students
#FROM fact_table JOIN residence USING (Eir_code)
#				JOIN school USING (School_roll_number)
#				JOIN student USING (Exam_number)
#				JOIN subject USING (Subject_code)
#				JOIN time USING (Year)

SELECT Gender, School_roll_number, Province, Grade_in_subject, Subject_level, Gender_of_school
FROM fact_table JOIN residence USING (Eir_code)
				JOIN school USING (School_roll_number)
				JOIN student USING (Exam_number)
				JOIN subject USING (Subject_code)
				JOIN time USING (Year)
WHERE Grade_in_subject NOT LIKE '%7' AND Grade_in_subject NOT LIKE '%8' AND Subject_level = "Higher" AND Province = "Leinster"
		AND Gender_of_school = 'Mixed'
                
ORDER BY School_roll_number;