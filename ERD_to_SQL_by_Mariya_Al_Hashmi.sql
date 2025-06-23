create database MarCo;
use MarCo;

CREATE TABLE Employee (
    SSN int primary key identity(1,1),
    FN nvarchar(20),
    LN nvarchar(20),
    BD date,
    Gender bit default 0,
    SuperviseId int,
    Dnum int
);

CREATE TABLE Department (
    Dnum int primary key identity(1,1),
    Dname nvarchar(20),
    SSN int,
    HiringDate DATE,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

ALTER TABLE Employee
ADD FOREIGN KEY (Dnum) REFERENCES Department(Dnum);

ALTER TABLE Employee
ADD FOREIGN KEY (SuperviseId) REFERENCES Employee(SSN);

CREATE TABLE Locations (
    Dnum int,
    Location nvarchar(20),
    PRIMARY KEY (Dnum, Location),
    FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);

CREATE TABLE Project (
    Pnum int primary key identity(1,1),
    Pname nvarchar(20),
    City nvarchar(20),
    Location nvarchar(20),
    Dnum int,
    FOREIGN KEY (Dnum) REFERENCES Department(Dnum)
);

CREATE TABLE Work (
    SSN int,
    Pnum int,
    WorkingHours int,
    PRIMARY KEY (SSN, Pnum),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (Pnum) REFERENCES Project(Pnum)
);

CREATE TABLE Dependent (
    SSN int,
    Dname nvarchar(20)PRIMARY KEY,
    Gender int,
	BD date,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);