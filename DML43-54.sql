
use cecs323sec01s14;

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
-- (595967120, 55458),
-- (00506341, 33270),
-- (00506341, 3231743),
-- (59543013, 8690355),
-- (12596845, 9504644);

-- INSERT INTO MedicalInsurance() values 
-- ()

-- completed
INSERT INTO SHIFTTYPE (ShiftType, ShiftStartTime, ShiftEndTime) values 
('Morning', '7:00:00','15:00:00'),
('Evening', '15:00:00', '23:00:00');


INSERT INTO STATION (StationName) values 
('butcher'), ('fry cook'), ('grill chef'), ('pastry Chef'),
('roast chef'), ('sauté chef'), ('vegetable chef');