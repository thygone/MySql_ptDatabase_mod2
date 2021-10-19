CREATE TABLE IF NOT EXISTS `mydb`.`Approintments` (
  `aptID` INT NOT NULL AUTO_INCREMENT,
  `PhysicalTrainers_PTID` INT NOT NULL,
  `PatientInfo_custID` INT NOT NULL,
  `AptTime` VARCHAR(45) NULL,
  PRIMARY KEY (`aptID`),
  INDEX `fk_Approintments_PatientInfo1_idx` (`PatientInfo_custID` ASC) VISIBLE,
  INDEX `fk_Approintments_PhysicalTrainers1_idx` (`PhysicalTrainers_PTID` ASC) VISIBLE,
  CONSTRAINT `fk_Approintments_PatientInfo1`
    FOREIGN KEY (`PatientInfo_custID`)
    REFERENCES `mydb`.`PatientInfo` (`custID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Approintments_PhysicalTrainers1`
    FOREIGN KEY (`PhysicalTrainers_PTID`)
    REFERENCES `mydb`.`PhysicalTrainers` (`PTID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`PhysicalTrainers` (
  `PTID` INT NOT NULL AUTO_INCREMENT,
  `Fname` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  PRIMARY KEY (`PTID`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`PatientInfo` (
  `custID` INT NOT NULL AUTO_INCREMENT,
  `Lname` VARCHAR(45) NULL,
  `Fname` VARCHAR(45) NULL,
  `phone` DOUBLE NULL,
  `AptsRemaining` INT NULL,
  PRIMARY KEY (`custID`),
  UNIQUE INDEX `custID_UNIQUE` (`custID` ASC) VISIBLE)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Workouts` (
  `WorkoutID` INT NOT NULL AUTO_INCREMENT,
  `PatientInfo_custID` INT NOT NULL,
  `Exercises_Exercise` VARCHAR(24) NOT NULL,
  `numbReps` INT NULL,
  `numbSets` INT NULL,
  `Workoutscol` VARCHAR(45) NULL,
  PRIMARY KEY (`WorkoutID`),
  INDEX `fk_Workouts_PatientInfo1_idx` (`PatientInfo_custID` ASC) VISIBLE,
  INDEX `fk_Workouts_Exercises1_idx` (`Exercises_Exercise` ASC) VISIBLE,
  CONSTRAINT `fk_Workouts_PatientInfo1`
    FOREIGN KEY (`PatientInfo_custID`)
    REFERENCES `mydb`.`PatientInfo` (`custID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Workouts_Exercises1`
    FOREIGN KEY (`Exercises_Exercise`)
    REFERENCES `mydb`.`Exercises` (`Exercise`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`Exercises` (
  `Exercise` VARCHAR(24) NOT NULL,
  `tool` VARCHAR(45) NULL,
  PRIMARY KEY (`Exercise`))
ENGINE = InnoDB

insert into patientInfo
values (1, Stacy, Smith,702696658, 12),
    (2, Kyle, Kepper, 7026665555, 1),
    (3,Luke, Carson, 7021231234, 20),
    (4, Brad, Sitss, 8015556666, 6),
    (5, Tammy, Sitss, 8015556667, 6)
;

insert into exercises
values ('PPT', 'laying', 'nothing'),
    ('LRT', 'laying', 'nothing'),
    ('90-90s', 'laying', 'timer'),
    ('bridges', 'laying', 'nothing'),
    ('Rows', 'standing', 'free_motion'),
    ('SAPD', 'standing', 'free_motion'),
    ('ER/IR', 'standing', 'Theraband'),
    ('military_press', 'sitting', 'bench'),
    ('stx_piriformis', 'laying', 'nothing'),
    ('stx_prone_quad, laying', 'strap'),
    ('stx_prone_HS, laying', 'strap');
    
    
INSERT INTO PhysicalTrainers
VALUES(1, 'Jake', 'Tyson'),
	(2, 'Koby', 'Tompson');

insert into Appointments 
values (1, 1,3,'8:30'),
    (2, 2,4,'10:00'),
    (3,1,5,'10:00');
    
insert into Workouts
values(1,PPT, 2,10),
    (1,'90-90s',3,30),
    (1,bridges,2,12),
    (1,'Rows',2,10),
    (2,PPT, 2,10),
    (2,'90-90s',3,30),
    (2,bridges,2,12),
    (2,'Rows',3,8),
    (3,PPT, 2,10),
    (3,'90-90s',3,30),
    (3,bridges,2,12),
    (3,'Rows',2,10),
    (4,PPT, 2,10),
    (4,'90-90s',3,30),
    (4,bridges,2,12),
    (4,'Rows',2,10),
    (5,PPT, 2,10),
    (5,'90-90s',3,30),
    (5,bridges,2,12),
    (5,'Rows',2,10);


Update appointments
Set aptTime = '10:00', PTID = 2
Where aptID = 1;

DELETE FROM PatientInfo WHERE aptRemaining = 0;

SELECT A.aptID AS 'apt numb', P.Lname, P.Fname, PT.Lname AS "Physical_Trainer"
FROM Appointments A 
	LEFT JOIN PatientInfo P ON A.custID = P.custID
    LEFT JOIN PhysicalTrainers PT ON A.PTID = PT.PTID;
    
SELECT CONCAT(P.Lname, ', ', P.Fname) AS 'FullName', WO.exersice as 'Exercise' , WO.numbReps as 'Reps', 
	WO.numbSets AS 'Sets'
FROM PatiantInfo P LEFT JOIN Workouts WO ON P.custID = WO.custID