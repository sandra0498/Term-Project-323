

CREATE TABLE StaffTip (
StaffID int NOT NULL,
ShiftType varchar(50) NOT NULL,
ShiftDate  date  NOT NULL,
TipAmount decimal(10,2) 
);


CREATE TABLE ShiftType (
ShiftType varchar(50) NOT NULL,
ShiftStartTime time NOT NULL,
ShiftEndTime time NOT NULL,
CONSTRAINT shiftType_pk PRIMARY KEY(ShiftType)
);

--***** a little confused on shift since it has so many migrating foreign keys 
    -- so i did not finish the table's first two foreign keys *****
CREATE TABLE Shift(
ShiftType varchar(50) NOT NULL,
ShiftDate date NOT NULL,
ManagerID int NOT NULL, 
HeadChefID int NOT NULL
CONSTRAINT Shift_pk PRIMARY KEY(ShiftType, ShiftDate),
CONSTRAINT Shift_fk FOREIGN KEY(HeadChefID, ShiftType, ShiftDate)
references Attendance (StaffID, ShiftType, ShiftDate),
CONSTRAINT Shift_fk01 FOREIGN KEY(ManagerID, ShiftType, ShiftDate)
references Attendance  (StaffID, ShiftType, ShiftDate),
CONSTRAINT Shift_fk02 FOREIGN KEY(ShiftType) references ShiftType (ShiftType),
CONSTRAINT Shift_fk03 FOREIGN KEY(HeadChefID) references HEADCHEF (HeadChefID),
CONSTRAINT Shift_fk04 FOREIGN KEY(ManagerID) references Manager (ManagerID)
);


CREATE TABLE Station(
StationName varchar(50) NOT NULL,
CONSTRAINT station_pk PRIMARY KEY(StationName)
);


CREATE TABLE StaffStation (
LineCookID INT NOT NULL,
StationName varchar(50) NOT NULL,
ShiftType varchar(50) NOT NULL,
ShiftDate date NOT NULL,
CONSTRAINT staffstation_pk PRIMARY KEY
(LineCookID,StationName, ShiftType, ShiftDate),
CONSTRAINT staffstation_fk01 FOREIGN KEY (LineCookID)
references LineCook (LINECOOKID),
CONSTRAINT  staffstation_fk02 FOREIGN KEY (StationName)
references Station (StationName),
CONSTRAINT staffstation_fk03 FOREIGN KEY (ShiftType, ShiftDate)
references Shift (ShiftType, ShiftDate)
); 

CREATE TABLE Attendance(
StaffID int NOT NULL,
ShiftType varchar(50) NOT NULL,
ShiftDate date NOT NULL,
CONSTRAINT Attendance_pk PRIMARY KEY(StaffID, ShiftType, ShiftDate),
CONSTRAINT Attendance_fk01 FOREIGN KEY (StaffID) references Staff (StaffID),
CONSTRAINT Attendance_fk02 FOREIGN KEY (ShiftType, ShiftDate) 
references Shift (ShiftType, ShiftDate)
);

CREATE TABLE Insurance (
InsuranceID int NOT NULL, 
InsuranceName varchar(100) NOT NULL,
InsurancePhoneNumber varchar(50) NOT NULL,
CONSTRAINT Insurance_pk PRIMARY KEY (InsuranceID)
);

CREATE TABLE StaffInsurance(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
CONSTRAINT StaffInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT StaffInsur_fk01 FOREIGN KEY (StaffID) references Staff (StaffID),
CONSTRAINT StaffInsur_fk02 FOREIGN KEY (InsuranceID) 
references Insurance (InsuranceID)
);

CREATE TABLE LifeInsurance(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
DeathBenefitAmount decimal(10,2) NOT NULL,
CONSTRAINT LifeInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT LifeInsur_fk01 FOREIGN KEY (StaffID, InsuranceID)
references StaffInsurance (StaffID, InsuranceID)
);


CREATE TABLE DisabilityInsurance(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
DisabilityAmount decimal(10,2) NOT NULL,
WeekNumber int NOT NULL,
MaxWeekPay int NOT NULL,
CONSTRAINT DisInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT DisInsur_fk01 FOREIGN KEY (StaffID, InsuranceID)
references StaffInsurance (StaffID, InsuranceID)
);


CREATE TABLE MedicalInsurance(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
EmergencyRoomPay decimal(10,2) NOT NULL,
DoctorVisitPay decimal(10,2) NOT NULL,
CONSTRAINT MedInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT MedInsur_fk FOREIGN KEY (StaffID, InsuranceID)
references StaffInsurance (StaffID, InsuranceID)
);


CREATE TABLE DentalInsurance(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
DentalAmount decimal(10,2) NOT NULL,
CONSTRAINT DentalInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT DentalInsur_fk FOREIGN KEY (StaffID, InsuranceID)
references StaffInsurance (StaffID, InsuranceID)
);