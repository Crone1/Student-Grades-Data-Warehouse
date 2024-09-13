# Overview
This repository contains the SQL code and documents relating to a data warehouse on students grades.
The SQL syntax that these queries follow is _mysql_ as these were written using MySQL Workbench.

---
# Data
Due to the sensitivity of student grade data, it was not possible to use real grade data for this project.
The data used during this project was generated synthetically using randomisation and best guesses.

---
# Folder Breakdown
The folder structure runs through the following processes:
- Step-by-step development of the data warehouse
- OLAP queries run on the data warehouse
- Documenting of this process

### [Designing the data warehouse](01__design_data_warehouse)
This section covered designing the data warehouse, mainly:
- Creating a star schema

### [Creating the data warehouse](02__create_data_warehouse)
This section covered creating the data warehouse tables in line with the designed star schema.
The resulting data warehouse was based around a grade in the fact table and had the following dimensions:
- Details on the student themselves
- Details on the students residence
- Details on the students school
- Details on the subject studied
- Year the student was assessed

### [Populating the data warehouse with data](03__populate_data)
This section covered populating the data warehouse with synthetic data, including:
- Generating the data
- Inserting the data into each table

### [Querying the data warehouse](04__query_data)
This section covered running OLAP queries on the data warehouse to derive insights from it.
The main queries run were:
- Times male students pass more higher level subjects than females in mixed schools in the province of 'Leinster'
- Whether non-Irish people achieved more grades above 60% than Irish people in the years '2017' and '2018'

### [Creating a report describing the process](05__report)
This section covered reporting on the details of the project, mainly:
- Project background
- Warehouse star schema design
- Discussion of the OLAP queries ran
- The datasets returned by the queries
