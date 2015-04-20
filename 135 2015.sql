CREATE TABLE INVESTIGATOR
(
  SSN CHAR(9),
  First_Name VARCHAR(255),
	Last_Name VARCHAR(255),
  Organization VARCHAR(255),
  Address VARCHAR(255),
  Phone CHAR(10),
  PRIMARY KEY (SSN)
)ENGINE = InnoDB;

CREATE TABLE REVIEWER
(
  SSN CHAR(9),
  First_Name VARCHAR(255),
	Last_Name VARCHAR(255),
  PRIMARY KEY (SSN)
)ENGINE=InnoDB;

CREATE TABLE PROJECT
(
  Project_ID CHAR(6),
  Title VARCHAR(255),
  Archived VARCHAR (5),
  Project_Status VARCHAR(6),
  PRIMARY KEY (Project_ID)
)ENGINE = InnoDB;

CREATE TABLE LANGUAGE
(
  Project_ID CHAR(6),
  Language VARCHAR(255),
  PRIMARY KEY (Project_ID, Language),
  FOREIGN KEY (Project_ID) REFERENCES PROJECT(Project_ID)
)ENGINE = InnoDB;


CREATE TABLE WORKS_ON
(
  Project_ID CHAR(6),
  SSN CHAR(9),
  Inv_Role VARCHAR(255),
  PRIMARY KEY (Project_ID, SSN),
  FOREIGN KEY (Project_ID) REFERENCES PROJECT(Project_ID),
  FOREIGN KEY (SSN) REFERENCES INVESTIGATOR (SSN)
)ENGINE = InnoDB;

CREATE TABLE REVIEWS
(
  Project_ID CHAR(6),
  SSN CHAR(9),
  Reviewer_Role VARCHAR(255),
  PRIMARY KEY (SSN, Project_ID),
  FOREIGN KEY (SSN) REFERENCES REVIEWER (SSN),
  FOREIGN KEY (Project_ID) REFERENCES PROJECT (Project_ID)
) ENGINE = InnoDB;


CREATE TABLE CONTACT_HISTORY
(
  Contact_ID CHAR(6),
  Project_ID CHAR(6),
  CP_Name VARCHAR(255),
  Contact_Type VARCHAR(255),
  Contact_Details VARCHAR(255),
  PRIMARY KEY (Contact_ID, Project_ID),
  FOREIGN KEY (Project_ID) REFERENCES PROJECT (Project_ID)
)ENGINE = InnoDB;

CREATE TABLE CONTACT_REMINDER
(
  Contact_ID CHAR(6),
  Project_ID CHAR(6),
  Contact_Reminders VARCHAR(255),
  PRIMARY KEY (Contact_ID, Project_ID, Contact_Reminders),
  FOREIGN KEY (Contact_ID) REFERENCES CONTACT_HISTORY (Contact_ID),
  FOREIGN KEY (Project_ID) REFERENCES CONTACT_HISTORY (Project_ID)
)ENGINE = InnoDB;
