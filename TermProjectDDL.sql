USE cecs323sec01bg08;

DROP TABLE IF EXISTS DENTALINSURANCE;
DROP TABLE IF EXISTS MEDICALINSURANCE;
DROP TABLE IF EXISTS DISABILITYINSURANCE;
DROP TABLE IF EXISTS LIFEINSURANCE;
DROP TABLE IF EXISTS STAFFINSURANCE;
DROP TABLE IF EXISTS INSURANCE;
DROP TABLE IF EXISTS STAFFTIP;
DROP TABLE IF EXISTS STAFFTABLELOG;
DROP TABLE IF EXISTS STAFFSTATION;
DROP TABLE IF EXISTS ATTENDANCE;
DROP TABLE IF EXISTS SHIFT;
DROP TABLE IF EXISTS SOUSCHEFMENTORSHIP;
DROP TABLE IF EXISTS SOUSCHEFSPECIALITY;
DROP TABLE IF EXISTS DINEINORDERITEMS;
DROP TABLE IF EXISTS ORDERITEMS;
DROP TABLE IF EXISTS MENUITEMS;
DROP TABLE IF EXISTS FOODITEMS;
DROP TABLE IF EXISTS FOODITEMINGREDIENTS;
DROP TABLE IF EXISTS INGREDIENTS;
DROP TABLE IF EXISTS LINECOOK;
DROP TABLE IF EXISTS SOUSCHEF;
DROP TABLE IF EXISTS WAITER;
DROP TABLE IF EXISTS DISHWASHER;
DROP TABLE IF EXISTS MAITRED;
DROP TABLE IF EXISTS HEADCHEF;
DROP TABLE IF EXISTS MANAGER;
DROP TABLE IF EXISTS STAFF;
DROP TABLE IF EXISTS SEAT;
DROP TABLE IF EXISTS MENU;
DROP TABLE IF EXISTS CORPORATIONACCOUNT;
DROP TABLE IF EXISTS CORPORATION;
DROP TABLE IF EXISTS PERSONALACCOUNT;
DROP TABLE IF EXISTS PAYMENTWITHACCOUNT;
DROP TABLE IF EXISTS MIMINGSACCOUNT;
DROP TABLE IF EXISTS PAYMENTWITHCARD;
DROP TABLE IF EXISTS PAYMENTWITHCASH;
DROP TABLE IF EXISTS KNOWNCUSTOMER;
DROP TABLE IF EXISTS ANONYMOUS;
DROP TABLE IF EXISTS PAYMENT;
DROP TABLE IF EXISTS DINEORDER;
DROP TABLE IF EXISTS PHONEORDER;
DROP TABLE IF EXISTS ONLINEORDER;
DROP TABLE IF EXISTS STATION;
DROP TABLE IF EXISTS SALARY;
DROP TABLE IF EXISTS SHIFTTYPE;
DROP TABLE IF EXISTS TABLES;
DROP TABLE IF EXISTS MEATTYPE;
DROP TABLE IF EXISTS SPICINESSLEVEL;
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS SIZE;
DROP TABLE IF EXISTS ZIPLOCATION;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS ACCOUNTTYPE;
DROP TABLE IF EXISTS ORDERS;




CREATE TABLE ORDERS(
	orderID int NOT NULL AUTO_INCREMENT,
    orderDate datetime NOT NULL,
    occasion varchar(50) ,
    CONSTRAINT orders_pk PRIMARY KEY (orderID)
	);




CREATE TABLE ONLINEORDER(
    orderID int NOT NULL,
    orderReadyTime datetime NOT NULL,
    CONSTRAINT onlineOrder_pk PRIMARY KEY (orderID),
    CONSTRAINT onlineOrder_fk FOREIGN KEY (orderID) REFERENCES ORDERS (orderID)
	);




CREATE TABLE PHONEORDER(
	orderID int NOT NULL,
    orderReadyTime datetime NOT NULL,
    phoneNumber int(10) NOT NULL,
    CONSTRAINT phoneOrder_pk PRIMARY KEY (orderID),
    CONSTRAINT phoneOrder_fk FOREIGN KEY (orderID) REFERENCES ORDERS (orderID)
	);





CREATE TABLE DINEORDER(
	orderID int NOT NULL,
    CONSTRAINT dineOrder_pk PRIMARY KEY (orderID),
    CONSTRAINT dineOrder_fk FOREIGN KEY (orderID) REFERENCES ORDERS (orderID)
	);





CREATE TABLE PAYMENT(
	orderID int NOT NULL,
    originalAmount double ,
    amountAfterDiscount double ,
    CONSTRAINT payment_pk PRIMARY KEY (orderID),
    CONSTRAINT payment_fk FOREIGN KEY (orderID) REFERENCES ORDERS (orderID)
	);





CREATE TABLE ANONYMOUS(
	orderID int NOT NULL,
    CONSTRAINT anonymous_pk PRIMARY KEY (orderID),
    CONSTRAINT anonymous_fk FOREIGN KEY (orderID) REFERENCES PAYMENT (orderID)
	);




CREATE TABLE CUSTOMER(
	customerID int NOT NULL AUTO_INCREMENT,
    customerFirstName varchar(50) NOT NULL,
    customerLastName varchar(50) NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY (customerID)
	);





CREATE TABLE KNOWNCUSTOMER(
	orderID int NOT NULL,
    customerID int NOT NULL,
    CONSTRAINT knownCustomer_pk PRIMARY KEY (orderID),
    CONSTRAINT knownCustomer_fk1 FOREIGN KEY (orderID) REFERENCES PAYMENT (orderID),
    CONSTRAINT knownCustomer_fk2 FOREIGN KEY (customerID) REFERENCES CUSTOMER (customerID)
	);





CREATE TABLE PAYMENTWITHCASH(
	orderID int NOT NULL,
    amountGiven double NOT NULL,
    amountReturned double NOT NULL,
    CONSTRAINT paymentWithCash_pk PRIMARY KEY (orderID),
    CONSTRAINT paymentWithCash_fk1 FOREIGN KEY (orderID) REFERENCES PAYMENT (orderID),
    CONSTRAINT paymentWithCash_fk2 FOREIGN KEY (orderID) REFERENCES KNOWNCUSTOMER (orderID),
    CONSTRAINT paymentWithCash_fk3 FOREIGN KEY (orderID) REFERENCES ANONYMOUS (orderID)
	);





CREATE TABLE PAYMENTWITHCARD(
	orderID int NOT NULL,
    cardholderFirstName varchar(50) NOT NULL,
    cardholderLastName varchar(50) NOT NULL,
    lastFourDigitOfCardNum int(4) NOT NULL,
    CONSTRAINT paymentWithCard_pk PRIMARY KEY (orderID),
    CONSTRAINT paymentWithCard_fk1 FOREIGN KEY (orderID) REFERENCES PAYMENT (orderID),
    CONSTRAINT paymentWithCard_fk2 FOREIGN KEY (orderID) REFERENCES KNOWNCUSTOMER (orderID)
	);





CREATE TABLE ACCOUNTTYPE(
	accountTypeID int NOT NULL AUTO_INCREMENT,
    typeName varchar(50) NOT NULL,
    CONSTRAINT accountType_pk PRIMARY KEY (accountTypeID)
	);





CREATE TABLE MIMINGSACCOUNT(
	accountNumber int NOT NULL AUTO_INCREMENT,
	accountTypeID int NOT NULL,
	customerID int NOT NULL,
    balance double ,
    openDate datetime NOT NULL,
    discountPercentage int,
    phoneNumber int(10) NOT NULL,
    CONSTRAINT mimingsAccount_pk PRIMARY KEY (accountNumber),
    CONSTRAINT mimingsAccount_fk1 FOREIGN KEY (accountTypeID) REFERENCES ACCOUNTTYPE (accountTypeID),
	CONSTRAINT mimingsAccount_fk2 FOREIGN KEY (customerID) REFERENCES CUSTOMER (customerID)
    );





CREATE TABLE PAYMENTWITHACCOUNT(
	orderID int NOT NULL,
    accountNumber int NOT NULL,
    balanceAfterPurchase double,
    CONSTRAINT paymentWithAccount_pk PRIMARY KEY (orderID),
    CONSTRAINT paymentWithAccount_fk1 FOREIGN KEY (orderID) REFERENCES PAYMENT (orderID),
    CONSTRAINT paymentWithAccount_fk2 FOREIGN KEY (orderID) REFERENCES KNOWNCUSTOMER (orderID),
    CONSTRAINT paymentWithAccount_fk3 FOREIGN KEY (accountNumber) REFERENCES MIMINGSACCOUNT (accountNumber)
	);





CREATE TABLE ZIPLOCATION(
	zipCode int(5) NOT NULL,
    city varchar(50) NOT NULL,
    state varchar(50) NOT NULL,
    CONSTRAINT zipLocation_pk PRIMARY KEY (zipCode)
	);





CREATE TABLE PERSONALACCOUNT(
    accountNumber int NOT NULL,
    address varchar(50) NOT NULL,
    zipCode int(5) NOT NULL,
    emailAddress varchar(50) NOT NULL,
    birthDate datetime,
    veteranStatus varchar(50),
    CONSTRAINT personalAccount_pk PRIMARY KEY (accountNumber),
    CONSTRAINT personalAccount_fk1 FOREIGN KEY (zipCode) REFERENCES ZIPLOCATION (zipCode),
    CONSTRAINT personalAccount_fk2 FOREIGN KEY (accountNumber) REFERENCES MIMINGSACCOUNT (accountNumber)
	);





CREATE TABLE CORPORATION(
	corporationID int NOT NULL AUTO_INCREMENT,
    corporationName varchar(50) NOT NULL,
    address varchar(50) NOT NULL,
    zipCode int(5) NOT NULL,
    CONSTRAINT corporation_pk PRIMARY KEY (corporationID),
    CONSTRAINT corporation_fk1 FOREIGN KEY (zipCode) REFERENCES ZIPLOCATION (zipCode)
	);





CREATE TABLE CORPORATIONACCOUNT(
	corporationID int NOT NULL,
	accountNumber int NOT NULL,
    departmentTitle varchar(50) NOT NULL,
	contactEmailAddress varchar(50) NOT NULL,
    CONSTRAINT corporationAccount_pk PRIMARY KEY (accountNumber),
    CONSTRAINT corporationAccount_fk1 FOREIGN KEY (corporationID) REFERENCES CORPORATION (corporationID),
    CONSTRAINT corporationAccount_fk2 FOREIGN KEY (accountNumber) REFERENCES MIMINGSACCOUNT (accountNumber)
	);





create table SIZE (
	size VARCHAR(10) not null,
	CONSTRAINT sizePK PRIMARY KEY (size)
);





create table MENU (
	menuID int NOT NULL AUTO_INCREMENT,
	menuType VARCHAR(20) not null,
	size VARCHAR(10) not null, 
	CONSTRAINT menuPK PRIMARY KEY (menuID),
	CONSTRAINT menu_FK FOREIGN KEY (size) REFERENCES SIZE(size)
);




create table CATEGORY (
	categoryID int NOT NULL AUTO_INCREMENT,
	categoryType VARCHAR(20) not null, 
	CONSTRAINT categoryPK PRIMARY KEY (categoryID)
);




create table SPICINESSLEVEL (
	spicinessLevel VARCHAR(20) not null,
	CONSTRAINT spicinessLevelPK PRIMARY KEY (spicinessLevel)
);





create table MEATTYPE (
	meatType VARCHAR(20) not null,
	CONSTRAINT meatTypePK PRIMARY KEY (meatType)
);





create table TABLES (
	tableNumber int NOT NULL AUTO_INCREMENT,
	numberOfSeats int not null, 
	CONSTRAINT tablePK PRIMARY KEY (tableNumber)
);





create table SEAT (
	seatNumber int not null,
	tableNumber int not null,
	CONSTRAINT seatPK PRIMARY KEY (seatNumber, tableNumber),
	CONSTRAINT seat_FK FOREIGN KEY (tableNumber) REFERENCES TABLES(tableNumber)
);





create table SALARY (
	salaryType VARCHAR(20) not null,
	CONSTRAINT salaryPK PRIMARY KEY (salaryType)
);





create table STAFF (
	staffID int not null AUTO_INCREMENT,
	firstName VARCHAR(20) not null,
	lastName VARCHAR(20) not null,
	address VARCHAR(20) not null,
	phoneNumber int(10) not null,
	salaryType VARCHAR(20) not null,
    CONSTRAINT staff_PK PRIMARY KEY (staffID),
	CONSTRAINT staff_FK FOREIGN KEY (salaryType) REFERENCES SALARY(salaryType)
);





create table MANAGER (
	managerID int NOT NULL,
	CONSTRAINT manager_PK PRIMARY KEY (managerID),
    CONSTRAINT manager_FK FOREIGN KEY (managerID) REFERENCES STAFF (staffID)
);





create table HEADCHEF (
	headChefID int NOT NULL,
	CONSTRAINT headChef_PK PRIMARY KEY (headChefID),
    CONSTRAINT headChef_FK FOREIGN KEY (headChefID) REFERENCES STAFF (staffID)
);





create table MAITRED (
	maitreDID int NOT NULL,
	CONSTRAINT maitreD_PK PRIMARY KEY (maitreDID),
    CONSTRAINT maitreD_FK FOREIGN KEY (maitreDID) REFERENCES STAFF (staffID)
);





create table DISHWASHER (
	dishWasherID int NOT NULL,
	CONSTRAINT dishWasher_PK PRIMARY KEY (dishWasherID),
    CONSTRAINT dishWasher_FK FOREIGN KEY (dishWasherID) REFERENCES STAFF (staffID)
);





create table WAITER (
	waiterID int NOT NULL,
	CONSTRAINT waiter_PK PRIMARY KEY (waiterID),
    CONSTRAINT waiter_FK FOREIGN KEY (waiterID) REFERENCES STAFF (staffID)
);




create table SOUSCHEF (
	sousChefID int NOT NULL,
	CONSTRAINT sousChef_PK PRIMARY KEY (sousChefID),
    CONSTRAINT sousChef_FK FOREIGN KEY (sousChefID) REFERENCES STAFF (staffID)
);





create table LINECOOK (
	lineCookID int NOT NULL,
	CONSTRAINT lineCook_PK PRIMARY KEY (lineCookID),
    CONSTRAINT lineCook_FK FOREIGN KEY (lineCookID) REFERENCES STAFF (staffID)
);





create table INGREDIENTS (
	ingredientName VARCHAR(50) not null,
	constraint ingredientsPK PRIMARY KEY (ingredientName)
);





create table FOODITEMS (
	foodItemName VARCHAR(50) not null,
	categoryID int NOT NULL,
	spicinessLevel VARCHAR(20) not null, 
	headChefID int not null, 
	ingredients VARCHAR(2000) not null,
	recipe VARCHAR(2000) not null,
	CONSTRAINT foodItemsPK PRIMARY KEY (foodItemName),
	CONSTRAINT foodItemsFK_1 FOREIGN KEY (categoryID) REFERENCES CATEGORY(categoryID),
	CONSTRAINT foodItems_FK2 FOREIGN KEY (spicinessLevel) REFERENCES SPICINESSLEVEL(spicinessLevel),
	CONSTRAINT foodItems_FK3 FOREIGN KEY (headChefID) REFERENCES HEADCHEF(headChefID)
);





create table FOODITEMINGREDIENTS (
	foodItemName VARCHAR(50) not null,
	ingredientName VARCHAR(50) not null,
	CONSTRAINT foodItemIngredientsPK PRIMARY KEY (foodItemName, ingredientName),
	CONSTRAINT foodItemIngredients_FK1 FOREIGN KEY (foodItemName) REFERENCES FOODITEMS(foodItemName),
	CONSTRAINT foodItemIngredients_FK2 FOREIGN KEY (ingredientName) REFERENCES INGREDIENTS (ingredientName)
);





create table MENUITEMS (
	menuID int not null,
	foodItemName VARCHAR(50) not null,
	price double not null, 
	CONSTRAINT menuItemsPK PRIMARY KEY (menuID, foodItemName),
	CONSTRAINT menuItems_FK1 FOREIGN KEY (menuID) REFERENCES MENU(menuID),
	CONSTRAINT menuItems_FK2 FOREIGN KEY (foodItemName) REFERENCES FOODITEMS(foodItemName)
);





create table ORDERITEMS (
	orderID int not null,
	foodItemName VARCHAR(50) not null,
	menuID int not null,
	meatType VARCHAR(20) not null,
	quantity int not null,
	CONSTRAINT orderItemsPK PRIMARY KEY (orderID, foodItemName, menuID, meatType),
	CONSTRAINT ORDERITEMS_FK1 FOREIGN KEY (orderID) REFERENCES ORDERS(orderID),
	CONSTRAINT ORDERITEMS_FK2 FOREIGN KEY (menuID, foodItemName) REFERENCES MENUITEMS(menuID, foodItemName),
	CONSTRAINT ORDERITEMS_FK3 FOREIGN KEY (meatType) REFERENCES MEATTYPE(meatType)
);





create table DINEINORDERITEMS (
	orderID int not null,
	foodItemName VARCHAR(50) not null,
	menuID int not null,
	meatType VARCHAR(20) not null,
	seatNumber int not null,
	tableNumber int not null,
	quantity int not null,
	CONSTRAINT dineInOrderItemsPK PRIMARY KEY (orderID, foodItemName, menuID, meatType, seatNumber, tableNumber),
	CONSTRAINT DINEINORDERITEMSID_FK1 FOREIGN KEY (orderID, foodItemName, menuID, meatType) REFERENCES ORDERITEMS(orderID, foodItemName, menuID, meatType),
	CONSTRAINT DINEINORDERITEMS_FK5 FOREIGN KEY (seatNumber, tableNumber) REFERENCES SEAT(seatNumber, tableNumber)
);




CREATE TABLE SOUSCHEFSPECIALITY(
	sousChefID int not null,
    foodItemName varchar(50) not null,
    CONSTRAINT sousChefSpeciality_pk PRIMARY KEY (sousChefID, foodItemName),
    CONSTRAINT sousChefSpeciality_FK01 FOREIGN KEY (foodItemName) REFERENCES FOODITEMS(foodItemName),
    CONSTRAINT sousChefSpeciality_FK02 FOREIGN KEY (sousChefID) REFERENCES SOUSCHEF (sousChefID)
);





create table SOUSCHEFMENTORSHIP (
	sousChefID int not null,
	foodItemName VARCHAR(50) not null,
    sousChefMentorID int not null,
	startDate DATE not null,
	endDate DATE not null,
    CONSTRAINT sousPK PRIMARY KEY (sousChefID, sousChefMentorID, foodItemName, startDate),
	CONSTRAINT SOUSCHEFMENTORSHIP_FK1 FOREIGN KEY (sousChefID) REFERENCES SOUSCHEF(sousChefID),
	CONSTRAINT SOUSCHEFMENTORSHIP_FK2 FOREIGN KEY (foodItemName, sousChefMentorID) REFERENCES SOUSCHEFSPECIALITY(foodItemName, SousChefID)
);




CREATE TABLE SHIFTTYPE (
ShiftType varchar(50) NOT NULL,
ShiftStartTime time NOT NULL,
ShiftEndTime time NOT NULL,
CONSTRAINT shiftType_pk PRIMARY KEY(ShiftType)
);





CREATE TABLE SHIFT(
	ShiftType varchar(50) NOT NULL,
	ShiftDate date NOT NULL,
	ManagerID int NOT NULL, 
	HeadChefID int NOT NULL,
	CONSTRAINT Shift_pk PRIMARY KEY(ShiftType, ShiftDate),
	-- CONSTRAINT Shift_fk FOREIGN KEY(HeadChefID, ShiftType, ShiftDate)references 
	-- CONSTRAINT Shift_fk01 FOREIGN KEY(ManagerID, ShiftType, ShiftDate)references 
	CONSTRAINT Shift_fk02 FOREIGN KEY(ShiftType) references SHIFTTYPE (ShiftType),
	CONSTRAINT Shift_fk03 FOREIGN KEY(HeadChefID) references HEADCHEF (HeadChefID),
	CONSTRAINT Shift_fk04 FOREIGN KEY(ManagerID) references MANAGER (ManagerID)
);





CREATE TABLE ATTENDANCE(
StaffID int NOT NULL,
ShiftType varchar(50) NOT NULL,
ShiftDate date NOT NULL,
CONSTRAINT Attendance_pk PRIMARY KEY(StaffID, ShiftType, ShiftDate),
CONSTRAINT Attendance_fk01 FOREIGN KEY (StaffID) references STAFF (StaffID),
CONSTRAINT Attendance_fk02 FOREIGN KEY (ShiftType, ShiftDate) references SHIFT (ShiftType, ShiftDate)
);






CREATE TABLE STATION(
StationName varchar(50) NOT NULL,
CONSTRAINT station_pk PRIMARY KEY(StationName)
);





CREATE TABLE STAFFSTATION (
LineCookID INT NOT NULL,
StationName varchar(50) NOT NULL,
ShiftType varchar(50) NOT NULL,
ShiftDate date NOT NULL,
CONSTRAINT staffstation_pk PRIMARY KEY(LineCookID,StationName, ShiftType, ShiftDate),
CONSTRAINT staffstation_fk01 FOREIGN KEY (LineCookID) references LINECOOK (LINECOOKID),
CONSTRAINT staffstation_fk02 FOREIGN KEY (StationName) references STATION (StationName),
CONSTRAINT staffstation_fk03 FOREIGN KEY (ShiftType, ShiftDate) references SHIFT (ShiftType, ShiftDate)
); 





create table STAFFTABLELOG (
	staffID int not null,
	tableNumber int not null,
	shiftType VARCHAR(20) not null,
	shiftDate DATE,
    CONSTRAINT STAFFTABLELOGPK PRIMARY KEY (staffID),
	CONSTRAINT STAFFTABLELOG_FK1 FOREIGN KEY (staffID)REFERENCES WAITER(waiterID),
	CONSTRAINT STAFFTABLELOG_FK2 FOREIGN KEY (tableNumber) REFERENCES TABLES(tableNumber),
	CONSTRAINT staffstationlog_fk3 FOREIGN KEY (ShiftType, ShiftDate)references SHIFT (ShiftType, ShiftDate)
);





CREATE TABLE STAFFTIP (
StaffID int NOT NULL,
ShiftType varchar(50) NOT NULL,
ShiftDate  date  NOT NULL,
TipAmount double,
CONSTRAINT StaffTip_pk PRIMARY KEY(StaffID, ShiftType, ShiftDate),
CONSTRAINT StaffTip_fk1 FOREIGN KEY(StaffID, ShiftType, ShiftDate) references ATTENDANCE (StaffID, ShiftType, ShiftDate),
CONSTRAINT StaffTip_FK2 FOREIGN KEY (staffID)REFERENCES WAITER(waiterID)
);





CREATE TABLE INSURANCE (
InsuranceID int NOT NULL AUTO_INCREMENT, 
InsuranceName varchar(50) NOT NULL,
InsurancePhoneNumber int(10) NOT NULL,
CONSTRAINT Insurance_pk PRIMARY KEY (InsuranceID)
);





CREATE TABLE STAFFINSURANCE(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
CONSTRAINT StaffInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT StaffInsur_fk01 FOREIGN KEY (StaffID) references STAFF (StaffID),
CONSTRAINT StaffInsur_fk02 FOREIGN KEY (InsuranceID) references INSURANCE (InsuranceID)
);





CREATE TABLE LIFEINSURANCE(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
DeathBenefitAmount decimal(10,2) NOT NULL,
CONSTRAINT LifeInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT LifeInsur_fk01 FOREIGN KEY (StaffID, InsuranceID) references STAFFINSURANCE (StaffID, InsuranceID)
);





CREATE TABLE DISABILITYINSURANCE(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
DisabilityAmount decimal(10,2) NOT NULL,
WeekNumber int NOT NULL,
MaxWeekPay int NOT NULL,
CONSTRAINT DisInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT DisInsur_fk01 FOREIGN KEY (StaffID, InsuranceID)references STAFFINSURANCE (StaffID, InsuranceID)
);





CREATE TABLE MEDICALINSURANCE(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
EmergencyRoomPay decimal(10,2) NOT NULL,
DoctorVisitPay decimal(10,2) NOT NULL,
CONSTRAINT MedInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT MedInsur_fk FOREIGN KEY (StaffID, InsuranceID)references STAFFINSURANCE (StaffID, InsuranceID)
);





CREATE TABLE DENTALINSURANCE(
StaffID int NOT NULL,
InsuranceID int NOT NULL,
DentalAmount decimal(10,2) NOT NULL,
CONSTRAINT DentalInsur_pk PRIMARY KEY (StaffID, InsuranceID),
CONSTRAINT DentalInsur_fk FOREIGN KEY (StaffID, InsuranceID)references STAFFINSURANCE (StaffID, InsuranceID)
);





