create database MarCo;
use MarCo;

select * from Employee

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
    DependentID int primary key identity(1,1),
    SSN int,
    Dname nvarchar(20),
    Gender int,
	BD date,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

insert into Employee (FN, LN, BD, Gender) values
('Mariya', 'Rashid', '2000-09-30', 0), -- SSN = 1
('Alwaleed', 'Rashid', '2004-08-19', 1), -- SSN = 2
('Alreem', 'Rashid', '2006-08-05', 0), -- SSN = 3
('Mohammed', 'Rashid', '2015-07-23', 1), -- SSN = 4
('Mona', 'Fahad', '1998-09-09', 0);   -- SSN = 5

insert into Department (Dname, SSN, HiringDate) values
('Engineering', 1, '2022-10-12' ),
('Media', 2, '2022-09-27' ),
('AI', 3, '2024-10-1' ),
('Control', 4, '2020-11-30' ),
('Operations', 5, '2018-11-11');
  

  select * from Department

UPDATE Employee SET SuperviseId = 1 WHERE SSN = 1;
UPDATE Employee SET SuperviseId = 2 WHERE SSN = 3;
UPDATE Employee SET SuperviseId = 3 WHERE SSN = 4;
UPDATE Employee SET SuperviseId = 4 WHERE SSN = 5;
UPDATE Employee SET SuperviseId = 1 WHERE SSN = 2;

UPDATE Employee SET Dnum = 1 WHERE SSN =1 ;
UPDATE Employee SET Dnum = 2 WHERE SSN =3 ;
UPDATE Employee SET Dnum = 3 WHERE SSN =4 ;
UPDATE Employee SET Dnum = 4 WHERE SSN =5 ;
UPDATE Employee SET Dnum = 1 WHERE SSN =2 ;

insert into Locations (Dnum, Location) values
(1, 'Ibri'),
(2, 'Muscat'),
(3, 'Sohar'),
(4, 'Salalah'),
(5, 'Nizwa');

insert into Project (Pname, City, Location, Dnum) values
('OmanVision', 'Ibri', 'Ibri', 1),      -- Pnum = 1
('Sustainability', 'Muscat', 'Muscat', 2),     -- Pnum = 2
('HousingRenovation', 'Sohar', 'Sohar', 3),       -- Pnum = 3
('Urbaning2020', 'Salalah', 'Salalah', 4),        -- Pnum = 4
('CarUpgrading', 'Nizwa', 'Nizwa', 5);         -- Pnum = 5

insert into Work (SSN, Pnum, WorkingHours) values
(1, 1, 40),
(2, 2, 35),
(3, 3, 30),
(4, 4, 25),
(5, 5, 20);

insert into Dependent (SSN, Dname, Gender, BD) values
(1, 'Alia', 0, '2010-05-12'),
(2, 'Rakan', 1, '2014-03-03'),
(2, 'Dana', 0, '2017-07-22'),
(3, 'Salem', 1, '2015-09-01');

delete from Employee where SSN = 6
delete from Employee where SSN = 7
delete from Employee where SSN = 8
delete from Employee where SSN = 10

select * from Employee