
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








INSERT INTO PAYMENTWITHACCOUNT (orderID,  accountNumber,  balanceAfterPurchase) values 