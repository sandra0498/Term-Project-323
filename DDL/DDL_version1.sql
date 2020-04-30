USE MIMINGS;



DROP TABLE IF EXISTS `dineInOrderItems`;
DROP TABLE IF EXISTS `seat`;
DROP TABLE IF EXISTS `tables`;
DROP TABLE IF EXISTS `orderItems`;
DROP TABLE IF EXISTS `meatType`;
DROP TABLE IF EXISTS `foodItemIngredients`;
DROP TABLE IF EXISTS `Ingredients`;
DROP TABLE IF EXISTS `menuItems`;
DROP TABLE IF EXISTS `foodItems`;
DROP TABLE IF EXISTS `headChef`;
DROP TABLE IF EXISTS `spicinessLevel`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `Menu`;
DROP TABLE IF EXISTS `size`;
DROP TABLE IF EXISTS `corporationAccount`;
DROP TABLE IF EXISTS `corporation`;
DROP TABLE IF EXISTS `personalAccount`;
DROP TABLE IF EXISTS `zipLocation`;
DROP TABLE IF EXISTS `paymentWithAccount`;
DROP TABLE IF EXISTS `mimingsAccount`;
DROP TABLE IF EXISTS `accountType`;
DROP TABLE IF EXISTS `paymentWithCard`;
DROP TABLE IF EXISTS `paymentWithCash`;
DROP TABLE IF EXISTS `knownCustomer`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `anonymous`;
DROP TABLE IF EXISTS `payment`;
DROP TABLE IF EXISTS `dineOrder`;
DROP TABLE IF EXISTS `phoneOrder`;
DROP TABLE IF EXISTS `onlineOrder`;
DROP TABLE IF EXISTS `orders`;

DROP TABLE IF EXISTS `paymentWithAccount`;



CREATE TABLE orders(
	`orderID` int NOT NULL AUTO_INCREMENT,
    `orderDate` datetime NOT NULL,
    `occasion` varchar(50) ,
    CONSTRAINT orders_pk PRIMARY KEY (orderID)
	);

SELECT * FROM orders;



CREATE TABLE onlineOrder(
	`orderID` int NOT NULL,
    `orderReadyTime` datetime NOT NULL,
    CONSTRAINT onlineOrder_pk PRIMARY KEY (orderID),
    CONSTRAINT onlineOrder_fk FOREIGN KEY (orderID) REFERENCES orders (orderID)
	);

SELECT * FROM onlineOrder;



CREATE TABLE phoneOrder(
	`orderID` int NOT NULL,
    `orderReadyTime` datetime NOT NULL,
    `phoneNumber` int(10) NOT NULL,
    CONSTRAINT phoneOrder_pk PRIMARY KEY (orderID),
    CONSTRAINT phoneOrder_fk FOREIGN KEY (orderID) REFERENCES orders (orderID)
	);

SELECT * FROM phoneOrder;



CREATE TABLE dineOrder(
	`orderID` int NOT NULL,
    CONSTRAINT dineOrder_pk PRIMARY KEY (orderID),
    CONSTRAINT dineOrder_fk FOREIGN KEY (orderID) REFERENCES orders (orderID)
	);

SELECT * FROM dineOrder;



CREATE TABLE payment(
	`orderID` int NOT NULL,
    `originalAmount` double ,
    `amountAfterDiscount` double ,
    CONSTRAINT payment_pk PRIMARY KEY (orderID),
    CONSTRAINT payment_fk FOREIGN KEY (orderID) REFERENCES orders (orderID)
	);

SELECT * FROM payment;



CREATE TABLE anonymous(
	`orderID` int NOT NULL,
    CONSTRAINT anonymous_pk PRIMARY KEY (orderID),
    CONSTRAINT anonymous_fk FOREIGN KEY (orderID) REFERENCES payment (orderID)
	);

SELECT * FROM anonymous;



CREATE TABLE customer(
	`customerID` int NOT NULL AUTO_INCREMENT,
    `customerFirstName` varchar(50) NOT NULL,
    `customerLastName` varchar(50) NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY (customerID)
	);

SELECT * FROM customer;



CREATE TABLE knownCustomer(
	`orderID` int NOT NULL,
    `customerID` int NOT NULL,
    CONSTRAINT knownCustomer_pk PRIMARY KEY (orderID),
    CONSTRAINT knownCustomer_fk1 FOREIGN KEY (orderID) REFERENCES payment (orderID),
    CONSTRAINT knownCustomer_fk2 FOREIGN KEY (customerID) REFERENCES customer (customerID)
	);

SELECT * FROM knownCustomer;



CREATE TABLE paymentWithCash(
	`orderID` int NOT NULL,
    `amountGiven` double NOT NULL,
    `amountReturned` double NOT NULL,
    CONSTRAINT paymentWithCash_pk PRIMARY KEY (orderID),
    CONSTRAINT paymentWithCash_fk1 FOREIGN KEY (orderID) REFERENCES payment (orderID),
    CONSTRAINT paymentWithCash_fk2 FOREIGN KEY (orderID) REFERENCES knownCustomer (orderID),
    CONSTRAINT paymentWithCash_fk3 FOREIGN KEY (orderID) REFERENCES anonymous (orderID)
	);

SELECT * FROM paymentWithCash;



CREATE TABLE paymentWithCard(
	`orderID` int NOT NULL,
    `cardholderFirstName` varchar(50) NOT NULL,
    `cardholderLastName` varchar(50) NOT NULL,
    `lastFourDigitOfCardNum` int(4) NOT NULL,
    CONSTRAINT paymentWithCard_pk PRIMARY KEY (orderID),
    CONSTRAINT paymentWithCard_fk1 FOREIGN KEY (orderID) REFERENCES payment (orderID),
    CONSTRAINT paymentWithCard_fk2 FOREIGN KEY (orderID) REFERENCES knownCustomer (orderID)
	);

SELECT * FROM paymentWithCard;



CREATE TABLE accountType(
	`accountTypeID` int NOT NULL AUTO_INCREMENT,
    `typeName` varchar(50) NOT NULL,
    CONSTRAINT accountType_pk PRIMARY KEY (accountTypeID)
	);

SELECT * FROM accountType;



CREATE TABLE mimingsAccount(
	`accountNumber` int NOT NULL AUTO_INCREMENT,
	`accountTypeID` int NOT NULL,
	`customerID` int NOT NULL,
    `balance` double ,
    `openDate` datetime NOT NULL,
    `discountPercentage` int,
    `phoneNumber` int(10) NOT NULL,
    CONSTRAINT mimingsAccount_pk PRIMARY KEY (accountNumber),
    CONSTRAINT mimingsAccount_fk1 FOREIGN KEY (accountTypeID) REFERENCES accountType (accountTypeID),
	CONSTRAINT mimingsAccount_fk2 FOREIGN KEY (customerID) REFERENCES customer (customerID)
    );

SELECT * FROM mimingsAccount;



CREATE TABLE paymentWithAccount(
	`orderID` int NOT NULL,
    `accountNumber` int NOT NULL,
    `balanceAfterPurchase` double,
    CONSTRAINT paymentWithAccount_pk PRIMARY KEY (orderID),
    CONSTRAINT paymentWithAccount_fk1 FOREIGN KEY (orderID) REFERENCES payment (orderID),
    CONSTRAINT paymentWithAccount_fk2 FOREIGN KEY (orderID) REFERENCES knownCustomer (orderID),
    CONSTRAINT paymentWithAccount_fk3 FOREIGN KEY (accountNumber) REFERENCES mimingsAccount (accountNumber)
	);

SELECT * FROM paymentWithAccount;



CREATE TABLE zipLocation(
	`zipCode` int(5) NOT NULL,
    `city` varchar(50) NOT NULL,
    `state` varchar(50) NOT NULL,
    CONSTRAINT zipLocation_pk PRIMARY KEY (zipCode)
	);

SELECT * FROM zipLocation;



CREATE TABLE personalAccount(
    `accountNumber` int NOT NULL,
    `address` varchar(50) NOT NULL,
    `zipCode` int(5) NOT NULL,
    `emailAddress` varchar(50) NOT NULL,
    `birthDate` datetime,
    `veteranStatus` varchar(50),
    CONSTRAINT personalAccount_pk PRIMARY KEY (accountNumber),
    CONSTRAINT personalAccount_fk1 FOREIGN KEY (zipCode) REFERENCES zipLocation (zipCode),
    CONSTRAINT personalAccount_fk2 FOREIGN KEY (accountNumber) REFERENCES mimingsAccount (accountNumber)
	);

SELECT * FROM personalAccount;



CREATE TABLE corporation(
	`corporationID` int NOT NULL AUTO_INCREMENT,
    `corporationName` varchar(50) NOT NULL,
    `address` varchar(50) NOT NULL,
    `zipCode` int(5) NOT NULL,
    CONSTRAINT corporation_pk PRIMARY KEY (corporationID),
    CONSTRAINT corporation_fk1 FOREIGN KEY (zipCode) REFERENCES zipLocation (zipCode)
	);

SELECT * FROM corporation;



CREATE TABLE corporationAccount(
	`corporationID` int NOT NULL,
	`accountNumber` int NOT NULL,
    `departmentTitle` varchar(50) NOT NULL,
	`contactEmailAddress` varchar(50) NOT NULL,
    CONSTRAINT corporationAccount_pk PRIMARY KEY (accountNumber),
    CONSTRAINT corporationAccount_fk1 FOREIGN KEY (corporationID) REFERENCES corporation (corporationID),
    CONSTRAINT corporationAccount_fk2 FOREIGN KEY (accountNumber) REFERENCES mimingsAccount (accountNumber)
	);

SELECT * FROM corporationAccount;



create table SIZE (
	`size` VARCHAR(10) not null,
	CONSTRAINT sizePK PRIMARY KEY (size)
);

SELECT * FROM size;



create table MENU (
	menuID int NOT NULL AUTO_INCREMENT,
	menuType VARCHAR(20) not null,
	size VARCHAR(10) not null, 
	CONSTRAINT menuPK PRIMARY KEY (menuID),
	CONSTRAINT menuSizeFK FOREIGN KEY (size) REFERENCES Size(size)
);
SELECT * FROM menu;



create table CATEGORY (
	categoryID int NOT NULL AUTO_INCREMENT,
	categoryType VARCHAR(20) not null, 
	CONSTRAINT categoryPK PRIMARY KEY (categoryID)
);
SELECT * FROM category;



create table SPICINESSLEVEL (
	spicinessLevel VARCHAR(20) not null,
	CONSTRAINT spicinessLevelPK PRIMARY KEY (spicinessLevel)
);

SELECT * FROM spicinessLevel;



create table headChef (
	headChefID int NOT NULL,
	CONSTRAINT headChef_PK PRIMARY KEY (headChefID)
);

SELECT * FROM headChef;



create table FOODITEMS (
	foodItemName VARCHAR(50) not null,
	categoryID int NOT NULL,
	spicinessLevel VARCHAR(20) not null, 
	headChefID int not null, 
	ingredients VARCHAR(2000) not null,
	recipe VARCHAR(2000) not null,
	CONSTRAINT foodItemsPK PRIMARY KEY (foodItemName),
	CONSTRAINT foodItemsCategoryIDFK FOREIGN KEY (categoryID) REFERENCES Category(categoryID),
	CONSTRAINT foodItemsSpicinessLevelFK FOREIGN KEY (spicinessLevel) REFERENCES SpicinessLevel(spicinessLevel),
	CONSTRAINT foodItemsheadChefIDFK FOREIGN KEY (categoryID) REFERENCES HeadChef(headChefID)
);

SELECT * FROM foodItems;



create table MENUITEMS (
	menuID int not null,
	foodItemName VARCHAR(50) not null,
	price double not null, 
	CONSTRAINT menuItemsPK PRIMARY KEY (menuID, foodItemName),
	CONSTRAINT menuItemsMenuIDFK FOREIGN KEY (menuID) REFERENCES Menu(menuID),
	CONSTRAINT menuItemsFoodItemNameFK FOREIGN KEY (foodItemName) REFERENCES FoodItems(foodItemName)
);

SELECT * FROM menuItems;



create table INGREDIENTS (
	ingredientName VARCHAR(50) not null,
	constraint ingredientsPK PRIMARY KEY (ingredientName)
);

SELECT * FROM ingredients;



create table FOODITEMINGREDIENTS (
	foodItemName VARCHAR(50) not null,
	ingredientName VARCHAR(50) not null,
	CONSTRAINT foodItemIngredientsPK PRIMARY KEY (foodItemName, ingredientName),
	CONSTRAINT foodItemIngredientsFoodItemNameFK FOREIGN KEY (foodItemName) REFERENCES FoodItems(foodItemName),
	CONSTRAINT foodItemIngredientsIngredientNameFK FOREIGN KEY (ingredientName) REFERENCES Ingredients(ingredientName)
);

SELECT * FROM foodItemIngredients;



create table MEATTYPE (
	meatType VARCHAR(20) not null,
	CONSTRAINT meatTypePK PRIMARY KEY (meatType)
);

SELECT * FROM meatType;



create table ORDERITEMS (
	orderID int not null,
	foodItemName VARCHAR(50) not null,
	menuID int not null,
	meatType VARCHAR(20) not null,
	quantity int not null,
	CONSTRAINT orderItemsPK PRIMARY KEY (orderID, foodItemName, menuID, meatType),
	CONSTRAINT orderItemsOrderIDFK FOREIGN KEY (orderID) REFERENCES Orders(orderID),
	CONSTRAINT orderItemsFoodItemNameFK FOREIGN KEY (foodItemName) REFERENCES MenuItems(foodItemName),
	CONSTRAINT orderItemsMenuIDFK FOREIGN KEY (menuID) REFERENCES MenuItems(menuID),
	CONSTRAINT orderItemsMeatTypeFK FOREIGN KEY (meatType) REFERENCES MeatType(meatType)
);

SELECT * FROM orderItems;



create table TABLES (
	tableNumber int NOT NULL AUTO_INCREMENT,
	numberOfSeats int not null, 
	CONSTRAINT tablePK PRIMARY KEY (tableNumber)
);

SELECT * FROM tables;



create table SEAT (
	seatNumber int not null,
	tableNumber int not null,
	CONSTRAINT seatPK PRIMARY KEY (seatNumber, tableNumber),
	CONSTRAINT seatTableNumberFK FOREIGN KEY (tableNumber) REFERENCES Tables(tableNumber)
);

SELECT * FROM seat;



create table DINEINORDERITEMS (
	orderID int not null,
	foodItemName VARCHAR(50) not null,
	menuID int not null,
	meatType VARCHAR(20) not null,
	seatNumber int not null,
	tableNumber int not null,
	quantity int not null,
	CONSTRAINT dineInOrderItemsPK PRIMARY KEY (orderID, foodItemName, menuID, meatType, seatNumber, tableNumber),
	CONSTRAINT dineInOrderItemsOrderIDFK FOREIGN KEY (orderID) REFERENCES OrderItems(orderID),
	CONSTRAINT dineInOrderItemsFoodItemNameFK FOREIGN KEY (foodItemName) REFERENCES OrderItems(foodItemName),
	CONSTRAINT dineInOrderItemsMenuIDFK FOREIGN KEY (menuID) REFERENCES OrderItems(menuID),
	CONSTRAINT dineInOrderItemsMeatTypeFK FOREIGN KEY (meatType) REFERENCES OrderItems(meatType),
	CONSTRAINT dineInOrderItemsSeatNumberFK FOREIGN KEY (seatNumber) REFERENCES Seat(seatNumber),
	CONSTRAINT dineInOrderItemsTableNumberFK FOREIGN KEY (tableNumber) REFERENCES Seat(tableNumber)
);

SELECT * FROM dineInOrderItems;