SELECT *
FROM fact_table JOIN residence USING (Eir_code)
				JOIN school USING (School_roll_number)
				JOIN student USING (Exam_number)
				JOIN subject USING (Subject_code)
				JOIN time USING (Year)
                
GROUP BY School_roll_number
