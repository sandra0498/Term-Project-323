
use cecs323sec01s14;


INSERT INTO StaffTip (StaffID, ShiftType, ShiftDate, TipAmount) values 
(), 
(), 
(), 
();


-- completed
INSERT INTO SHIFTTYPE (ShiftType, ShiftStartTime, ShiftEndTime) values 
('Morning', '7:00:00','15:00:00'),
('Evening', '15:00:00', '23:00:00');


INSERT INTO Shift (ShiftType, ShiftDate, ManagerID, HeadChefID) values 
(),
(),
(),
();

INSERT INTO STATION (StationName) values 
('butcher'), ('fry cook'), ('grill chef'), ('pastry Chef'),
('roast chef'), ('sauté chef'), ('vegetable chef');


INSERT INTO StaffStation (LineCookID, StationName, ShiftType, ShiftDate)
(),
(),
(),
(),
(),
(),
();


INSERT INTO Attendance (StaffID, ShiftType, ShiftDate)
(),
(),
(),
(),
(),
(); 



 -- completed
INSERT INTO INSURANCE (InsuranceID, InsuranceName, InsurancePhoneNumber) values 
-- Medical Insurance 
(55458, 'UnitedHealth',359637),
(33270, 'Blue Cross', 6302583), 
-- -- life insurance
(63632, 'NorthWestern Mutual', 9504644),
(57574, 'Penn Mutual', 7541700),
-- -- Disability Insurance
(01583, 'Assurity', 8690355),
-- -- Dental Insurance 
(51347, 'Cigna', 2624274),
(89630, 'Delta Dental', 3231743);


-- CANNOT POPULATE THE TABLE UNTIL I HAVE THE STAFF TABLE POPULATED 
-- INSERT INTO STAFFINSURANCE (StaffID, InsuranceID) values
-- (  , 55458),
-- ( , 33270),
-- (, 3231743),
-- (   , 8690355),
-- (    , 9504644);



INSERT INTO LifeInsurance (StaffID, InsuranceID, DeathBenefitAmount) values 





INSERT INTO DisabilityInsurance (StaffID, InsuranceID, DisabilityAmount, WeekNumber, MaxWeekPay) values 



INSERT INTO MedicalInsurance(StaffID, InsuranceID, EmergencyRoomPay, DoctorVisitPay) values 
();


INSERT INTO DentalInsurance(StaffID, InsuranceID, DentalAmount) values 
(), ();