-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-10-12 20:48:38.805

-- tables
-- Table: Fact_Table
CREATE TABLE Fact_Table (
    Eir_Code Varchar(10) NOT NULL,
    School_roll_number int NOT NULL,
    Exam_number int NOT NULL,
    Year int NOT NULL,
    Subject_code int NOT NULL,
    Grade_in_subject char(2) NOT NULL
);

-- Table: Residence
CREATE TABLE Residence (
    Eir_Code varchar(10) NOT NULL,
    Country varchar(74) NOT NULL,
    County varchar(10) NOT NULL,
    Town varchar(30) NOT NULL,
    Street varchar(30) NOT NULL,
    CONSTRAINT Residence_pk PRIMARY KEY (Eir_Code)
);

-- Table: School
CREATE TABLE School (
    School_roll_number int NOT NULL,
    School_name varchar(50) NOT NULL,
    School_type varchar(50) NOT NULL,
    Gender_breakdown_Male_to_Female double NOT NULL,
    Main_religion varchar(20) NOT NULL,
    Average_age decimal(6,2) NOT NULL,
    Socio_economic_background varchar(50) NOT NULL,
    Proportion_of_Irish_origin int NOT NULL,
    Proportion_of_non_Irish_origin int NOT NULL,
    CONSTRAINT School_pk PRIMARY KEY (School_roll_number)
);

-- Table: Student
CREATE TABLE Student (
    Exam_number int NOT NULL,
    Age int NOT NULL,
    Gender varchar(10) NOT NULL,
    Race varchar(20) NOT NULL,
    Religion varchar(20) NOT NULL,
    Status_of_parents_relationship varchar(20) NOT NULL,
    Number_of_siblings int NOT NULL,
    Position_in_family int NOT NULL,
    CONSTRAINT Student_pk PRIMARY KEY (Exam_number)
);

-- Table: Subject
CREATE TABLE Subject (
    Subject_code int NOT NULL,
    Subject_name varchar(15) NOT NULL,
    Subject_level varchar(10) NOT NULL,
    CONSTRAINT Subject_pk PRIMARY KEY (Subject_code)
);

-- Table: Time
CREATE TABLE Time (
    Year int NOT NULL,
    CONSTRAINT Time_pk PRIMARY KEY (Year)
);

-- foreign keys
-- Reference: Fact Table_Residence (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_Residence FOREIGN KEY Fact_Table_Residence (Eir_Code)
    REFERENCES Residence (Eir_Code);

-- Reference: Fact Table_School (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_School FOREIGN KEY Fact_Table_School (School_roll_number)
    REFERENCES School (School_roll_number);

-- Reference: Fact Table_Student (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_Student FOREIGN KEY Fact_Table_Student (Exam_number)
    REFERENCES Student (Exam_number);

-- Reference: Fact Table_Subject (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_Subject FOREIGN KEY Fact_Table_Subject (Subject_code)
    REFERENCES Subject (Subject_code);

-- Reference: Fact Table_Time (table: Fact_Table)
ALTER TABLE Fact_Table ADD CONSTRAINT Fact_Table_Time FOREIGN KEY Fact_Table_Time (Year)
    REFERENCES Time (Year);

-- End of file.

