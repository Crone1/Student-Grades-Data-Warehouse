CREATE SCHEMA IF NOT EXISTS `Students_grades` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `Students_grades`.`Fact_Table` (
  `Exam_number` INT(9) NOT NULL,
  `School_roll_number` VARCHAR(6) NOT NULL,
  `Eir_Code` VARCHAR(8) NOT NULL,
  `Subject_code` VARCHAR(6) NOT NULL,
  `Year` INT(4) NOT NULL,
  `Grade_in_subject` VARCHAR(2) NOT NULL,
  CONSTRAINT `fk_Fact_Table_Time`
    FOREIGN KEY (`Year`)
    REFERENCES `Students_grades`.`Time` (`Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fact_Table_School1`
    FOREIGN KEY (`School_roll_number`)
    REFERENCES `Students_grades`.`School` (`School_roll_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fact_Table_Residence1`
    FOREIGN KEY (`Eir_Code`)
    REFERENCES `Students_grades`.`Residence` (`Eir_Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fact_Table_Subject1`
    FOREIGN KEY (`Subject_code`)
    REFERENCES `Students_grades`.`Subject` (`Subject_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fact_Table_Student1`
    FOREIGN KEY (`Exam_number`)
    REFERENCES `Students_grades`.`Student` (`Exam_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Students_grades`.`Residence` (
  `Eir_Code` VARCHAR(8) NOT NULL,
  `Country` VARCHAR(7) NOT NULL,
  `Province` VARCHAR(10) NOT NULL,
  `County` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`Eir_Code`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Students_grades`.`School` (
  `School_roll_number` VARCHAR(6) NOT NULL,
  `School_name` VARCHAR(50) NOT NULL,
  `School_type` VARCHAR(20) NOT NULL,
  `Gender_of_school` VARCHAR(6) NOT NULL,
  `Main_religion` VARCHAR(10) NOT NULL,
  `Socio_economic_background` VARCHAR(9) BINARY NOT NULL,
  `Proportion_of_Irish_origin` INT NOT NULL,
  `Proportion_of_non_Irish_origin` INT NOT NULL,
  PRIMARY KEY (`School_roll_number`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Students_grades`.`Student` (
  `Exam_number` INT(9) NOT NULL,
  `Age` INT(2) NOT NULL,
  `Gender` VARCHAR(6) BINARY NOT NULL,
  `Religion` VARCHAR(20) NOT NULL,
  `Race` VARCHAR(25) NOT NULL,
  `Status_of_parents_relationship` VARCHAR(35) NOT NULL,
  `Number_of_siblings` INT(1) NOT NULL,
  `Poition_in_family_after_parents` INT(1) NOT NULL,
  PRIMARY KEY (`Exam_number`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Students_grades`.`Subject` (
  `Subject_code` VARCHAR(6) NOT NULL,
  `Subject_name` VARCHAR(35) NOT NULL,
  `Subject_level` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Subject_code`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Students_grades`.`Time` (
  `Year` INT(4) NOT NULL,
  PRIMARY KEY (`Year`))
ENGINE = InnoDB;