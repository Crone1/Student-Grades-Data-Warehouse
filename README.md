# Project Explanation
This repository houses the code I wrote in developing a data waehouse on students grades. This project took place as part of a module called 'Data Warehousing and Mining' where we were to design and develop a data warehouse of our choice.

I chose to implement a data warehouse on students grades as I wanted to deleop something practical that I felt there would be a practical need for. However, due to the sensitivity of this data, I could not get access to real data so proceeded with synthetic data that I generated to fulfil this purpose.

# Warehouse development
The delopment of this data warehouse involved:
- Generating the data,
- Creating a star schema,
- Creating the data warehouse,
- Populating the data warehouse.

The resulting data wareouhouse was based around a grade in the fact table and had the following dimensions:
- Details on the student themselves,
- The students residence details,
- The students schools details,
- Details on the subject studied,
- The year the student was assessed.

I could then running queries on this data warehouse to derive some interesting insights from it. While the results were based on synthetic data, these queries would hold true if the data warehouse was implemented on real student data.
