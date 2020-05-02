
use cecs323sec01s14;


INSERT INTO StaffTip (StaffID, ShiftType, ShiftDate, TipAmount) values 
(100113 , 'Morning', '2020-05-05', 10.00 ), 
(100107, 'Morning', '2020-05-10', 7.00), 
(100101, 'Evening', '2020-05-08',8.00), 
(100107, 'Evening','2020-05-05', 9.00),
(100113, 'Evening','2020-05-06', 10.00),
(100107, 'Morning', '2020-05-07', 5.00),
(100101, 'Evening', '2020-05-07', 6.00),
(100107, 'Morning', '2020-05-08', 10.00),
(100113, 'Morning', '2020-05-10', 8.00),
(100101, 'Evening', '2020-05-10',7.00);


-- completed
INSERT INTO SHIFTTYPE (ShiftType, ShiftStartTime, ShiftEndTime) values 
('Morning', '7:00:00','15:00:00'),
('Evening', '15:00:00', '23:00:00');

-- cannot fill out yet since I don't have the foreign key values for headchefID
INSERT INTO Shift (ShiftType, ShiftDate, ManagerID, HeadChefID) values 
(),
(),
(),
();
 
INSERT INTO STATION (StationName) values 
('butcher'), ('fry cook'), ('grill chef'), ('pastry Chef'),
('roast chef'), ('sauté chef'), ('vegetable chef');


INSERT INTO StaffStation (LineCookID, StationName, ShiftType, ShiftDate) values
(100103, 'fry cook', 'Evening', '2020-05-10'),
(100103, 'grill chef', 'Evening', '2020-05-12'),
(100115, 'vegetable chef', 'Morning', '2020-05-10'),
(100115, 'sauté chef', 'Evening', '2020-05-11'),
(100109, 'pastry chef', 'Morning', '2020-05-10'),
(100109, 'grill chef', 'Evening', '2020-05-12'),
(100103, 'butcher','Morning', '2020-05-08'),
(100109, 'roast chef', 'Evening', '2020-05-09');



INSERT INTO Attendance (StaffID, ShiftType, ShiftDate)
(100103, 'Evening', '2020-05-10'),
(100103, 'Evening', '2020-05-12'),
(100115, 'Morning', '2020-05-10' ),
(100115,'Evening','2020-05-11'  ),
(100109, 'Morning','2020-05-10' ),
(100109, 'Evening', '2020-05-12'),
(100109, 'Evening', '2020-05-09'),
(100103, 'Morning', '2020-05-08'),
(100113 , 'Morning', '2020-05-05'),
(100107, 'Morning', '2020-05-10'),
(100101, 'Evening', '2020-05-08'),
(100107, 'Evening','2020-05-05'),
(100113, 'Evening','2020-05-06'),
(100107, 'Morning', '2020-05-07'),
(100101, 'Evening', '2020-05-07'),
(100107, 'Morning', '2020-05-08'),
(100113, 'Morning', '2020-05-10'),
(100101, 'Evening', '2020-05-10');




 -- completed
INSERT INTO INSURANCE (InsuranceID, InsuranceName, InsurancePhoneNumber) values 
-- Medical Insurance 
(55458, 'UnitedHealth','800359637'),
(33270, 'Blue Cross', '8006302583'), 
-- -- life insurance
(63632, 'NorthWestern Mutual', '8009504644'),
(57574, 'Penn Mutual', '18007541700'),
-- -- Disability Insurance
(01583, 'Assurity', '6008690355'),
-- -- Dental Insurance 
(51347, 'Cigna', '8002624274'),
(89630, 'Delta Dental', '18003231743');


-- CANNOT POPULATE THE TABLE UNTIL I HAVE THE STAFF TABLE POPULATED 
INSERT INTO STAFFINSURANCE (StaffID, InsuranceID) values
( 100118 ,63632),
(100112 , 63632),
(100106 , 57574),
(100102 , 57574),
(100114, 63632),
(100117,01583),
(100111, 01583),
(100109, 01583),
(100105, 01583),
(100103 , 33270),
(100106, 55458),
(100118, 55458),
(100112, 33270),
(100102, 55458),
(100114, 33270),
(100108, 33270),
(100106, 89630),
(100112, 51347),
(100118, 89630);


INSERT INTO LifeInsurance (StaffID, InsuranceID, DeathBenefitAmount) values 
( 100118 ,63632, 200125.65 ),
(100112 , 63632, 345877.90 ),
(100106 , 57574, 10000.57 ), 
( 100102 , 57574, 300000.60 ),
(100114, 63632, 250000.00 );



INSERT INTO DisabilityInsurance (StaffID, InsuranceID, DisabilityAmount, WeekNumber, MaxWeekPay) values 
(100117,01583, 650.00, 10, 12),
(100111, 01583, 500.00, 07, 05 ),
(100109, 01583, 400.00, 15, 05),
(100105, 01583, 500.00, 03, 04);


INSERT INTO MedicalInsurance(StaffID, InsuranceID, EmergencyRoomPay, DoctorVisitPay) values 
( 100103 , 33270, 700.00, 500.00),
(100106, 55458, 750.00, 600.00),
(100118, 55458, 750.00, 600.00),
(100112, 33270, 700.00, 500.00),
(100102, 55458, 750.00, 600.00),
(100114, 33270, 700.00, 500.00),
(100108, 33270, 700.00, 500.00);


INSERT INTO DentalInsurance(StaffID, InsuranceID, DentalAmount) values 
(100106, 89630, 450.00), 
(100112, 51347, 500.00),
(100118, 89630, 450.00) ;