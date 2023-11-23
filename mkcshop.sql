-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2022 at 05:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mkcshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `Brandcode` char(5) NOT NULL,
  `brandname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`Brandcode`, `brandname`) VALUES
('001', 'Burberry'),
('002', 'Dior'),
('003', 'Celine'),
('004', 'Givenchy'),
('005', 'Ysl');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `frist_name` varchar(35) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `birthDate` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` char(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `favorite_product` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Username`, `password`, `frist_name`, `last_name`, `birthDate`, `address`, `phone_number`, `email`, `favorite_product`) VALUES
('Cherchery', '000089', 'Thiyada', 'Waiyasorn', '2002-07-17', '101/98 ปิ่นเกล้า กรุงเทพฯ', '0954484210', 'Chreeyq_q@gmail.com', 'Hoodie'),
('jayB', '456123pp', 'Amornrada', 'Meechalad', '2002-11-24', '66 สาทร กรุงเทพฯ', '0962422590', 'MIll85@gmail.com', 'Short-Bib'),
('kawaZaki', '123321GG', 'Kawinphak', 'lnpho', '2003-02-25', '88 ธนบุรี กรุงเทพฯ', '0926390367', 'KIKI0025@gmail.com', 'Cardigan'),
('LanaDelRey', '268644LL', 'Weeranut', 'Wutthi', '2002-06-16', '99 ทองหล่อ กรุงเทพฯ', '0646918299', 'LLanadel@gmail.com', 'Jacket'),
('Maurizio', 'Aozx40716xa', 'Chatkom', 'Piboontanavanich', '2003-01-16', '67 เทอดไท \r\nบางหว้า\r\n', '0828921853', 'Tewro66@gmail.com', 'Suit'),
('ONIKA', '854567OO', 'Jiranuch', 'Booncharoen', '2003-03-09', '29 สามเสน กรุงเทพฯ', '0948852219', 'Roenn@gmail.com', 'Socks');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `Discountcode` varchar(10) NOT NULL,
  `discountpercent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`Discountcode`, `discountpercent`) VALUES
('10.10', 15),
('BLACKFRI', 10),
('KMCN', 30),
('KMCP', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `incomeperdayqry`
-- (See below for the actual view)
--
CREATE TABLE `incomeperdayqry` (
`order_date` date
,`TotalIncome` double
);

-- --------------------------------------------------------

--
-- Table structure for table `itemlist`
--

CREATE TABLE `itemlist` (
  `ItemNo` int(11) NOT NULL,
  `OrderNo` char(4) NOT NULL,
  `Productid` char(5) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Discountcode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemlist`
--

INSERT INTO `itemlist` (`ItemNo`, `OrderNo`, `Productid`, `Quantity`, `Discountcode`) VALUES
(1, '100', 'KMP11', 2, 'KMCN'),
(2, '100', 'KMP18', 2, 'KMCN'),
(3, '100', 'KMP15', 1, 'KMCN'),
(4, '101', 'KMP05', 2, 'BLACKFRI'),
(5, '101', 'KMP14', 1, 'BLACKFRI'),
(6, '101', 'KMP15', 1, 'BLACKFRI'),
(7, '102', 'KMP03', 2, 'KMCP'),
(8, '102', 'KMP04', 1, 'KMCP'),
(9, '102', 'KMP07', 1, 'KMCP'),
(10, '103', 'KMP10', 1, 'KMCN'),
(11, '103', 'KMP13', 2, 'KMCN'),
(12, '103', 'KMP22', 1, 'KMCN'),
(13, '104', 'KMP24', 1, NULL),
(14, '104', 'KMP25', 1, NULL),
(15, '104', 'KMP26', 2, NULL),
(16, '105', 'KMP20', 2, '10.10'),
(17, '105', 'KMP21', 1, '10.10'),
(18, '105', 'KMP23', 1, '10.10');

-- --------------------------------------------------------

--
-- Stand-in structure for view `paymentorder`
-- (See below for the actual view)
--
CREATE TABLE `paymentorder` (
`OrderNo` char(4)
,`order_date` date
,`username` varchar(30)
,`totalprice` double
,`totaldiscount` double
,`totalpayment` double
,`paymentstatus` varchar(20)
,`payment_method` varchar(20)
,`delivery_status` varchar(20)
,`delivery_date` date
,`discountcode` char(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `priceproductdescqry`
-- (See below for the actual view)
--
CREATE TABLE `priceproductdescqry` (
`Productid` char(5)
,`productname` varchar(30)
,`price` double
);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Productid` char(5) NOT NULL,
  `productname` varchar(30) NOT NULL,
  `brandcode` char(5) NOT NULL,
  `size` varchar(2) NOT NULL,
  `price` double NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Productid`, `productname`, `brandcode`, `size`, `price`, `amount`) VALUES
('KMP01', 'Short-Shirt', '001', 'L', 1650, 30),
('KMP02', 'Long-Shirt', '001', 'L', 1950, 20),
('KMP03', 'Vest', '002', 'M', 1000, 25),
('KMP04', 'Short Jeans', '004', 'M', 2100, 10),
('KMP05', 'Jeans', '004', 'M', 2500, 20),
('KMP06', 'Pajamas', '002', 'L', 2550, 10),
('KMP07', 'Short Skirt', '005', 'M', 2400, 20),
('KMP08', 'Long Skirt', '005', 'L', 2600, 20),
('KMP09', 'Long Dress', '005', 'L', 5400, 30),
('KMP10', 'Short Dress', '005', 'M', 5000, 10),
('KMP11', 'Suit', '001', 'XL', 21000, 15),
('KMP12', 'Polo Shirt', '001', 'L', 2350, 20),
('KMP13', 'Long Sleeve T-Shirt', '003', 'XL', 2690, 20),
('KMP14', 'Sweater', '003', 'L', 7999, 30),
('KMP15', 'Hoodie', '003', 'L', 9999, 25),
('KMP16', 'Jacket', '001', 'M', 2345, 10),
('KMP17', 'Socks', '002', 'M', 1000, 30),
('KMP18', 'Glove', '002', 'L', 2000, 10),
('KMP19', 'Cardigan', '002', 'M', 5500, 15),
('KMP20', 'Coat', '001', 'M', 3300, 10),
('KMP21', 'Warm pants', '003', 'M', 15000, 30),
('KMP22', 'Three quarter pants', '001', 'L', 5500, 30),
('KMP23', 'Short-Bib', '004', 'M', 4200, 15),
('KMP24', 'Long-Bib', '004', 'S', 4500, 20),
('KMP25', 'Skiny Jeans', '004', 'M', 4700, 20),
('KMP26', 'Coat', '005', 'L', 4800, 10);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `OrderNo` char(4) NOT NULL,
  `order_date` date NOT NULL,
  `username` varchar(30) NOT NULL,
  `totalprice` double NOT NULL,
  `totaldiscount` double DEFAULT NULL,
  `totalpayment` double NOT NULL,
  `paymentstatus` varchar(20) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `delivery_status` varchar(20) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `discountcode` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchaseorder`
--

INSERT INTO `purchaseorder` (`OrderNo`, `order_date`, `username`, `totalprice`, `totaldiscount`, `totalpayment`, `paymentstatus`, `payment_method`, `delivery_status`, `delivery_date`, `discountcode`) VALUES
('100', '2022-09-01', 'Maurizio', 54199, 16799.7, 39199.3, 'ชำระเงินเรียบร้อย', 'บัตรเครดิต', 'จัดส่งเรียบร้อย', '2022-09-12', 'KMCN'),
('101', '2022-09-16', 'kawaZaki', 22998, 2299.8, 20698.2, 'ชำระเงินเรียบร้อย', 'โมบายแบงค์กิ้ง', 'กำลังขนส่ง', '2022-09-19', 'BLACKFRI'),
('102', '2022-09-30', 'jayB', 12399, 619.95, 11779.05, 'ชำระเงินเรียบร้อย', 'โมบายแบงค์กิ้ง', 'กำลังขนส่ง', '2022-10-03', 'KMCP'),
('103', '2022-10-06', 'LanaDelRey', 15880, 4764, 11116, 'ชำระเงินเรียบร้อย', 'บัตรเครดิต', 'กำลังจัดส่ง', '2022-10-04', 'KMCN'),
('104', '2022-10-08', 'Cherchery', 18800, NULL, 18800, 'ชำระเงินเรียบร้อย', 'บัตรเครดิต', 'กำลังจัดส่ง', '2022-10-11', NULL),
('105', '2022-10-10', 'ONIKA', 25800, 3870, 21930, 'ชำระเงินเรียบร้อย', 'บัตรเครดิต', 'กำลังจัดส่ง', '2022-10-14', '10.10');

-- --------------------------------------------------------

--
-- Structure for view `incomeperdayqry`
--
DROP TABLE IF EXISTS `incomeperdayqry`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `incomeperdayqry`  AS SELECT `purchaseorder`.`order_date` AS `order_date`, sum(`purchaseorder`.`totalpayment`) AS `TotalIncome` FROM `purchaseorder` WHERE `purchaseorder`.`order_date` <> 0 GROUP BY `purchaseorder`.`order_date``order_date`  ;

-- --------------------------------------------------------

--
-- Structure for view `paymentorder`
--
DROP TABLE IF EXISTS `paymentorder`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `paymentorder`  AS SELECT `purchaseorder`.`OrderNo` AS `OrderNo`, `purchaseorder`.`order_date` AS `order_date`, `purchaseorder`.`username` AS `username`, `purchaseorder`.`totalprice` AS `totalprice`, `purchaseorder`.`totaldiscount` AS `totaldiscount`, `purchaseorder`.`totalpayment` AS `totalpayment`, `purchaseorder`.`paymentstatus` AS `paymentstatus`, `purchaseorder`.`payment_method` AS `payment_method`, `purchaseorder`.`delivery_status` AS `delivery_status`, `purchaseorder`.`delivery_date` AS `delivery_date`, `purchaseorder`.`discountcode` AS `discountcode` FROM `purchaseorder` WHERE `purchaseorder`.`OrderNo` in ('104','105')  ;

-- --------------------------------------------------------

--
-- Structure for view `priceproductdescqry`
--
DROP TABLE IF EXISTS `priceproductdescqry`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `priceproductdescqry`  AS SELECT `product`.`Productid` AS `Productid`, `product`.`productname` AS `productname`, `product`.`price` AS `price` FROM `product` ORDER BY `product`.`price` AS `DESCdesc` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`Brandcode`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`Discountcode`);

--
-- Indexes for table `itemlist`
--
ALTER TABLE `itemlist`
  ADD PRIMARY KEY (`ItemNo`),
  ADD KEY `Productid` (`Productid`),
  ADD KEY `Discountcode` (`Discountcode`),
  ADD KEY `OrderNo` (`OrderNo`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Productid`),
  ADD KEY `brandcode` (`brandcode`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`OrderNo`),
  ADD KEY `username` (`username`),
  ADD KEY `discountcode` (`discountcode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `itemlist`
--
ALTER TABLE `itemlist`
  ADD CONSTRAINT `itemlist_ibfk_1` FOREIGN KEY (`Productid`) REFERENCES `product` (`Productid`),
  ADD CONSTRAINT `itemlist_ibfk_2` FOREIGN KEY (`Discountcode`) REFERENCES `discount` (`discountcode`),
  ADD CONSTRAINT `itemlist_ibfk_3` FOREIGN KEY (`OrderNo`) REFERENCES `purchaseorder` (`OrderNo`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brandcode`) REFERENCES `brand` (`Brandcode`);

--
-- Constraints for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`Username`),
  ADD CONSTRAINT `purchaseorder_ibfk_2` FOREIGN KEY (`discountcode`) REFERENCES `discount` (`discountcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
