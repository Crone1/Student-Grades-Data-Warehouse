# Whether non irish people achieved more grades above 60% (ie a 1,2,3 or 4) than irish people for all subjects
# for all levels in the years 2017 and 2018 where a grade of over 60% was achieved

SELECT Year, Subject_name, Subject_level, IF((Class.Number_Irish_gr8r_than_60 = 0 AND Class.Number_non_Irish_gr8r_than_60 = 0),
	   'No grades over 60% in this class', IF((Class.Number_non_Irish_gr8r_than_60)/(Class.Number_non_Irish_in_class) > 
	   (Class.Number_Irish_gr8r_than_60) / (Class.Number_Irish_in_class) OR (Class.Number_Irish_in_class = 0 AND Class.Number_non_Irish_gr8r_than_60 != 0), 'Non-Irish', 
       IF((Class.Number_non_Irish_gr8r_than_60)/(Class.Number_non_Irish_in_class) = (Class.Number_Irish_gr8r_than_60) / (Class.Number_Irish_in_class), 'Same percentage of Non-Irish and Irish', 'Irish')))
       AS Group_w_more_grades_over_60

FROM (SELECT Subject_name, Subject_level, Year, 
			 COUNT(CASE WHEN Race LIKE '%Non-Irish%' AND (Grade_in_subject LIKE '%4' OR Grade_in_subject LIKE '%3' OR Grade_in_subject LIKE '%2' OR Grade_in_subject LIKE '%1') THEN 1 ELSE NULL END) AS Number_non_Irish_gr8r_than_60, 
			 COUNT(CASE WHEN Race NOT LIKE '%Non-Irish%' AND (Grade_in_subject LIKE '%4' OR Grade_in_subject LIKE '%3' OR Grade_in_subject LIKE '%2' OR Grade_in_subject LIKE '%1')THEN 1 ELSE NULL END) AS Number_Irish_gr8r_than_60,
             COUNT(CASE WHEN Race LIKE '%Non-Irish%' THEN 1 ELSE NULL END) AS Number_non_Irish_in_class, 
			 COUNT(CASE WHEN Race NOT LIKE '%Non-Irish%' THEN 1 ELSE NULL END) AS Number_Irish_in_class

	  FROM fact_table JOIN residence USING (Eir_code)
					JOIN school    USING (School_roll_number)
					JOIN student   USING (Exam_number)
					JOIN subject   USING (Subject_code)
					JOIN time 	   USING (Year)
		
	  GROUP BY year, Subject_code) AS Class

WHERE year = '2017'

GROUP BY year, Subject_name, Subject_level

ORDER BY year, Subject_name, Subject_level;