
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



INSERT INTO STAFFINSURANCE (StaffID, InsuranceID) values
-- Instances of life insurance policies
(100106 , 57574),
(100102 , 57574),
(100105, 63632),
-- instances of disability insurance policies 
(100104, 01583),
(100105, 01583),
-- instances of medical insurance policies
(100103 , 33270),
(100106, 55458),
(100102, 55458),
(100107, 33270),
(100104, 55458),
(100108, 33270),
-- instances of dental insurance policies
(100106, 89630),
 (100101, 51347), 
 (100109, 89630),
 (100107, 89630);



INSERT INTO LifeInsurance (StaffID, InsuranceID, DeathBenefitAmount) values 
(100106 , 57574, 10000.57 ), 
(100102, 57574, 300000.60 ),
(100105, 63632, 250000.00 );



INSERT INTO DisabilityInsurance (StaffID, InsuranceID, DisabilityAmount, WeekNumber, MaxWeekPay) values 
(100104, 01583, 400.00, 15, 05),
(100105, 01583, 500.00, 03, 04);


INSERT INTO MedicalInsurance(StaffID, InsuranceID, EmergencyRoomPay, DoctorVisitPay) values 
( 100103 , 33270, 700.00, 500.00),
(100106, 55458, 750.00, 600.00),
(100102, 55458, 750.00, 600.00),
(100107, 33270, 700.00,  500.00),
(100104, 55458, 750.00, 600.00),
(100108, 33270, 700.00, 500.00);


INSERT INTO DentalInsurance(StaffID, InsuranceID, DentalAmount) values 
(100106, 89630, 450.00), 
(100101, 51347, 400.00),
(100109, 89630, 450.00),
(100107, 89630, 450.00);