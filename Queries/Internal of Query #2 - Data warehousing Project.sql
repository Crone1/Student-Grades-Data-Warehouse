SELECT Subject_name, Subject_level, Count(case when Race LIKE '%Non-Irish%' then 1 else null end) as number_non_Irish, 
			Count(case when Race LIKE '%Irish%' then 1 else null end) as number_Irish, Subject_Code, year
FROM fact_table JOIN residence USING (Eir_code)
						JOIN school USING (School_roll_number)
						JOIN student USING (Exam_number)
						JOIN subject USING (Subject_code)
						JOIN time USING (Year)

WHERE Grade_in_subject LIKE '%4' OR Grade_in_subject LIKE '%3' OR Grade_in_subject LIKE '%2' OR Grade_in_subject LIKE '%1'
GROUP BY Subject_code
