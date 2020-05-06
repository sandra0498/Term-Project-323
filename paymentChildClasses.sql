
INSERT INTO PAYMENTWITHCASH(orderID, amountGiven, amountReturned) values 
(11, 10.00, 0.00),
(12, 20.00, 0.00),
(13, 10.00, 0.00),
(14, 10.00, 0.00 ),
(15, 10.00, 0.00),

(31,10.00, 2.00),
(32, 20.00, 4.00),
(33, 10.00, 2.00),
(34, 10.00, 0.00),
(35, 10.00, 0.00),



(51,5.00, 0.00),
(52, 50.00, 5.00),
(53, 20.00, 5.00),
(54), 50.00, 5.00,
(55, 20.00, 5.00),


(71, 10.00, 0.00),
(72, 20.00, 0.00),
(73, 20.00, 0.00),
(74, 10.00, 0.00),
(75, 10.00, 0.00),


(91, 10.00, 2.00),
(92, 20.00, 4.00),
(93, 10.00, 2.00),
(94, 10.00, 0.00),
(95, 20.00, 0.00),


(111, 5.00, 0.00),
(112, 50.00, 5.00),
(113, 20.00, 5.00),
(114, 50.00, 5.00),
(115, 20.00, 5.00),


(131, 10.00, 0.00),
(132, 20.00, 0.00),
(133, 20.00, 0.00),
(134, 10.00, 0.00),
(135, 10.00, 0.00),


(151, 10.00, 2.00),
(152, 20.00, 4.00),


(154, 10.00, 0.00),
(155, 10.00, 0.00),


(171, 5.00, 0.00),
(172, 50.00, 5.00),
(173, 20.00, 5.00),
(174, 50.00, 5.00),
(175, 20.00, 5.00),

(191, 10.00, 0.00),
(192, 20.00, 0.00),
(193, 20.00, 0.00),
(194, 5.00, 0.00),
(195, 10.00, 0.00),

(211, 10.00, 2.00),
(212, 20.00, 4.00),
(213, 10.00, 2.00),
(214, 10.00, 0.00),
(215, 20.00, 0.00),

(231, 5.00, 0.00),
(232, 50.00, 5.00),
(233, 20.00, 5.00),
(234, 20.00, 5.00),
(235, 20.00, 5.00),

(241, 20.00, 5.00),
(242, 20.00, 5.00),
(243, 20.00, 5.00);





INSERT INTO PAYMENTWITHCARD (orderID, cardholderFirstName,  cardholderLastName, lastFourDigitOfCardNum) values 
(1, 'Schmitt', 'Carine', 0000),
(2,'King','Jean',0001),
(3, 'Peter', 'Ferguson',0002),
(4, 'Janine', 'Labrune',0003 ),
(5,'Jonas', 'Bergulfsen', 0004),
(6, 'Susan', 'Nelson', 0005),
(7, 'Zbyszek', 'Piestrzeniewicz', 0006),
(8, 'Roland', 'Keitel', 0007),
(9, 'Julie', 'Murphy', 0008),
(10, 'Kwai', 'Lee', 0009),


(16, 'Diego', 'Freyre', 1000 ),
(17, 'Christina', 'Berglund', 1001),
(18, 'Jytte', 'Petersen', 1002 ),
(19, 'Mary', 'Saveley', 1003 ),
(20,'Jeff', 'Young', 1004),
(21,'Juri', 'Hashimoto', 1005 ),
(22,'Veysel', 'Oeztan', 1006),
(23,'Schmitt', 'Carine', 0000),
(24,'King','Jean',0001),
(25,'Peter', 'Ferguson',0002),
(26, 'Janine', 'Labrune',0003 ),
(27,'Jonas', 'Bergulfsen', 0004),
(28, 'Susan', 'Nelson', 0005),
(29,'Zbyszek', 'Piestrzeniewicz', 0006),
(30,'Roland', 'Keitel', 0007),



(59, 'Julie', 'Murphy', 0008),
(60,'Kwai', 'Lee', 0009)),
(61,'Diego', 'Freyre', 1000 ),
(62,'Christina', 'Berglund', 1001),
(63,'Jytte', 'Petersen', 1002),
(64,'Mary', 'Saveley', 1003),
(65,'Jeff', 'Young', 1004),
(66,'Juri', 'Hashimoto', 1005),
(67,'Veysel', 'Oeztan', 1006),
(68,'Schmitt', 'Carine', 0000),
(69,'Janine', 'Labrune',0003 ),
(70,'Jonas', 'Bergulfsen', 0004),


(76,'Schmitt', 'Carine', 0000),
(77,'Jonas', 'Bergulfsen', 0004),
(78,'Janine', 'Labrune',0003 ),
(79,'King','Jean',0001),
(80,'Peter', 'Ferguson',0002),
(81,'Schmitt', 'Carine', 0000),
(82,'Janine', 'Labrune',0003),
(83,'Jonas', 'Bergulfsen', 0004),
(84,'Peter', 'Ferguson',0002),
(85,'Kwai', 'Lee', 0009),
(86,'Jonas', 'Bergulfsen', 0004),
(87,'Janine', 'Labrune',0003),
(88,'Peter', 'Ferguson',0002),
(89,'Diego', 'Freyre', 1000 ),
(90,'Christina', 'Berglund', 1001),

(46,'Schmitt', 'Carine', 0000),


INSERT INTO PAYMENTWITHACCOUNT (orderID,  accountNumber,  balanceAfterPurchase) values 
(36,11, 3.00),
(37,12, 5.00),
(38, 13, 6.00),
(39, 14, 5.00),
(40, 15, 5.00),
(41,16, 3.00),
(42,17, 5.00),
(43,18, 2.00),
(44, 19, 5.00),
(45, 1, 6.00),
(47,2, 5.00),
(48,3, 3.00),
( 49, 4, 5.00),
(50,5, 3.00),
(56, 6, 5.00), 
(57,7, 3.00), 
(58,10, 6.00), 