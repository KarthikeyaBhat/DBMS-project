-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2022 at 06:39 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `department_of_defence`
--

-- --------------------------------------------------------

--
-- Table structure for table `asecr`
--

CREATE TABLE `asecr` (
  `PID` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Wing_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asecr`
--

INSERT INTO `asecr` (`PID`, `Name`, `Wing_id`) VALUES
(199901098, 'Tulsi', 10105),
(199901234, 'Rohan', 10102),
(200001123, 'Rahul', 10101),
(200401321, 'Ishan', 10103),
(200401456, 'Pratham', 10104),
(200501002, 'Aadarsh', 10103);

-- --------------------------------------------------------

--
-- Table structure for table `cantonment`
--

CREATE TABLE `cantonment` (
  `ID` int(11) NOT NULL,
  `Wing_id` int(11) DEFAULT NULL,
  `SW_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cantonment`
--

INSERT INTO `cantonment` (`ID`, `Wing_id`, `SW_id`) VALUES
(12635, 10103, 20106),
(54785, 10102, 20104),
(85202, 10102, 20103),
(96301, 10103, 20105);

-- --------------------------------------------------------

--
-- Table structure for table `defence_accounts`
--

CREATE TABLE `defence_accounts` (
  `From_name` varchar(40) DEFAULT NULL,
  `To_Name` varchar(40) DEFAULT NULL,
  `To_Bank` varchar(40) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `From_Bank` varchar(40) DEFAULT NULL,
  `To_AC_no` int(11) DEFAULT NULL,
  `From_AC_no` int(11) DEFAULT NULL,
  `DateofTr` datetime DEFAULT NULL,
  `Wing_id` int(11) DEFAULT NULL,
  `Details` varchar(40) DEFAULT NULL,
  `Trans_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defence_accounts`
--

INSERT INTO `defence_accounts` (`From_name`, `To_Name`, `To_Bank`, `Amount`, `From_Bank`, `To_AC_no`, `From_AC_no`, `DateofTr`, `Wing_id`, `Details`, `Trans_id`) VALUES
('IAI', 'GOI', 'HDFC', 2000000, 'CANARA BANK', 10256352, 455520022, '2022-10-04 00:00:00', 10101, 'Confidential', 354364),
('Wing4', 'GOI', 'KOTAK', 12350000, 'SBI', 10256352, 455665456, '2002-10-06 00:00:00', 10103, 'Confidential', 531343),
('Gen. Rawat', 'GOI', 'KOTAK', 125000, 'ICICI', 45689542, 145236905, '2022-10-04 00:00:00', 10101, 'Confidential', 576768),
('Energy inc', 'GOI', 'SBI', 5000000, 'CANARA BANK', 56525642, 545668855, '2022-10-04 00:00:00', 10101, 'Confidential', 676756),
('Reliance', 'GOI', 'SBI', 16547800, 'KOTAK', 10256352, 107202253, '2022-10-04 00:00:00', 10102, 'Confidential', 746745),
('USDoD', 'GOI', 'KOTAK', 500000, 'UNION BANK', 12526456, 552220255, '2022-01-12 00:00:00', 10102, 'Confidential', 758900),
('Tata steel', 'GOI', 'HDFC', 2000000, 'UNION BANK', 12526456, 102022558, '2012-11-01 00:00:00', 10103, 'Confidential', 867546),
('DRDO', 'GOI', 'KOTAK', 2000000, 'SBI', 56525642, 402562250, '2022-10-04 00:00:00', 10104, 'Confidential', 867547),
('Subwing6', 'GOI', 'SBI', 52000, 'INDIAN BANK', 12526456, 125252456, '2022-10-04 00:00:00', 10104, 'Confidential', 978098),
('Indian oil', 'GOI', 'HDFC', 10000000, 'UNION BANK', 45689542, 456665545, '2022-09-04 00:00:00', 10102, 'Confidential', 978776);

-- --------------------------------------------------------

--
-- Table structure for table `jt_secr`
--

CREATE TABLE `jt_secr` (
  `Wing_id` int(11) DEFAULT NULL,
  `SW_id` int(11) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `PID` int(11) NOT NULL,
  `Asecr_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jt_secr`
--

INSERT INTO `jt_secr` (`Wing_id`, `SW_id`, `Name`, `PID`, `Asecr_id`) VALUES
(10105, 20110, 'Rajani', 200102777, 199901098),
(10101, 20101, 'Jyotiraditya', 200202151, 200001123),
(10104, 20107, 'Vinaya', 200202555, 200401456),
(10101, 20102, 'Vatsal', 200302145, 200001123),
(10102, 20103, 'Shashank', 200302667, 199901234),
(10104, 20108, 'Amitha', 200302851, 200401456),
(10105, 20109, 'Jyothi', 200602444, 199901098),
(10102, 20104, 'Raghavendra', 200702102, 199901234),
(10103, 20106, 'Rupa', 200802045, 200401321),
(10103, 20105, 'Rekha', 201402457, 200401321);

-- --------------------------------------------------------

--
-- Table structure for table `land`
--

CREATE TABLE `land` (
  `ID` int(11) NOT NULL,
  `SW_id` int(11) DEFAULT NULL,
  `Wing_id` int(11) DEFAULT NULL,
  `Addr` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `land`
--

INSERT INTO `land` (`ID`, `SW_id`, `Wing_id`, `Addr`) VALUES
(10202, 20104, 10102, 'Mint Street\r'),
(10258, 20104, 10106, 'Like home PG'),
(10369, 20106, 10103, 'KSR Road\r'),
(17856, 20103, 10102, 'Old Airport Road Bangalore\r'),
(54862, 20101, 10101, 'New BEL Road\r');

-- --------------------------------------------------------

--
-- Table structure for table `pensions`
--

CREATE TABLE `pensions` (
  `ID` int(11) NOT NULL,
  `Addr` varchar(40) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `SW_Id` int(11) DEFAULT NULL,
  `YOS` int(11) DEFAULT NULL,
  `AMT` int(11) DEFAULT NULL,
  `dependentCount` int(11) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Wing_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pensions`
--

INSERT INTO `pensions` (`ID`, `Addr`, `Phone`, `SW_Id`, `YOS`, `AMT`, `dependentCount`, `Age`, `Name`, `Wing_id`) VALUES
(30101, 'New BEL Road', '958745631', 20101, 20, 20000, 3, 55, 'Capt. Vikram', 10101),
(30102, 'Mint Street', '8857452130', 20103, 30, 30000, 3, 70, 'Capt. Shishir', 10101),
(30103, 'KSR Road', '665587102', 20103, 30, 24000, 5, 65, 'Cdr. Rakesh', 10102),
(30104, 'Old Airport Road Bangalore', '887863025', 20104, 35, 26000, 5, 70, 'Brig. Chouhan', 10102),
(30105, 'Suranjan Das Road', '741058963', 20105, 50, 40000, 1, 85, 'Col. Rajesh', 10103);

-- --------------------------------------------------------

--
-- Table structure for table `sub_wings`
--

CREATE TABLE `sub_wings` (
  `Asecr_id` int(11) DEFAULT NULL,
  `Jt_Secr` int(11) DEFAULT NULL,
  `Wing_id` int(11) DEFAULT NULL,
  `HQ` varchar(20) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `SW_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_wings`
--

INSERT INTO `sub_wings` (`Asecr_id`, `Jt_Secr`, `Wing_id`, `HQ`, `Name`, `SW_id`) VALUES
(200001123, 200202151, 10101, 'Delhi', 'SW1', 20101),
(200001123, 200302145, 10101, 'Chennai', 'SW2', 20102),
(199901234, 200302667, 10102, 'Kolkata', 'SW3', 20103),
(199901234, 200702102, 10102, 'Chandigarh', 'SW4', 20104),
(200401321, 201402457, 10103, 'Bangalore', 'SW5', 20105),
(200401321, 200802045, 10103, 'Mumbai', 'SW6', 20106),
(200401456, 200202555, 10104, 'Bhopal', 'SW7', 20107),
(200401456, 200302851, 10104, 'Guwahati', 'SW8', 20108),
(199901098, 200602444, 10105, 'Jammu', 'SW9', 20109),
(199901098, 200102777, 10105, 'Kochi', 'SW10', 20110);

-- --------------------------------------------------------

--
-- Table structure for table `wings`
--

CREATE TABLE `wings` (
  `Wing_id` int(11) NOT NULL,
  `Asecr_id` int(11) DEFAULT NULL,
  `HQ` varchar(20) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wings`
--

INSERT INTO `wings` (`Wing_id`, `Asecr_id`, `HQ`, `Name`) VALUES
(10101, 200001123, 'Delhi', 'W1\r'),
(10102, 199901234, 'Jaipur', 'W2\r'),
(10103, 200401321, 'Bangalore', 'W3\r'),
(10104, 200401456, 'Chennai', 'W4\r'),
(10105, 199901098, 'Kolkata', 'W5\r'),
(10106, 200501002, 'Bangalore', 'W6');

-- --------------------------------------------------------

--
-- Table structure for table `work_force`
--

CREATE TABLE `work_force` (
  `PID` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Age` varchar(11) DEFAULT NULL,
  `Addr` varchar(40) DEFAULT NULL,
  `Ph_no` varchar(11) DEFAULT NULL,
  `Salary` varchar(11) DEFAULT NULL,
  `SW_id` int(11) DEFAULT NULL,
  `Wing_id` int(11) DEFAULT NULL,
  `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_force`
--

INSERT INTO `work_force` (`PID`, `Name`, `Age`, `Addr`, `Ph_no`, `Salary`, `SW_id`, `Wing_id`, `DOB`) VALUES
(199901098, 'Bhat', '20', 'Subramanya Nilaya', '8867010724', '650000', 20101, 10105, '2002-04-04'),
(199901234, 'Rohan', '55', '14 Kailsh Marg', '804134492', '20000', NULL, 10102, '1967-04-08'),
(200001123, 'Rahul', '56', '10 Downing', '804134491', '100000', NULL, 10101, '1966-04-14'),
(200102777, 'Rajani', '42', 'American Street', '641134491', '20000', 20110, 10105, '1980-04-14'),
(200202151, 'Jyotiraditya', '51', '4 Banyan Avenie', '804134478', '10000', 20101, 10101, '1971-04-14'),
(200202555, 'Vinaya', '45', 'JC Road', '804194491', '450000', 20107, 10104, '1977-04-14'),
(200302145, 'Vatsal', '50', '6 Poes Garden', '804534491', '60000', 20102, 10101, '1972-04-14'),
(200302667, 'Shashank', '49', '7 Dhamaka street', '804113391', '45000', 20103, 10102, '1973-04-14'),
(200302851, 'Amitha', '44', 'Anna Sali', '833113491', '550000', 20108, 10104, '1978-04-14'),
(200401321, 'Ishan', '54', '5 Lohia Garden', '804134497', '30000', NULL, 10103, '1968-04-14'),
(200401456, 'Pratham', '53', '1 Pink Street', '804114494', '50000', NULL, 10104, '1969-04-14'),
(200501002, 'Aadarsh', '32', '5 Rajpath marg', '8856325412', '55000', 20102, 10103, '2000-02-11'),
(200602444, 'Jyothi', '43', 'Church Street Bangalore', '841025491', '120000', 20109, 10105, '1979-04-08'),
(200702102, 'Raghavendra', '48', '8 Clone Colony', '808134491', '150000', 20104, 10102, '1974-04-14'),
(200802045, 'Rupa', '46', 'Mirza road', '801145991', '350000', 20106, 10103, '1976-04-14'),
(201102899, 'Likith', '20', 'PES University', '8845632105', '200000', 20103, 10102, '2002-08-01'),
(201402457, 'Rekha', '47', '56 Brigade Road', '984113491', '250000', 20105, 10103, '1975-04-08'),
(201602163, 'Karthikeya', '20', 'Subramanya Nilaya', '8867010724', '50000', 20105, 10103, '1966-12-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asecr`
--
ALTER TABLE `asecr`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `Wing_id` (`Wing_id`);

--
-- Indexes for table `cantonment`
--
ALTER TABLE `cantonment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Wing_id` (`Wing_id`),
  ADD KEY `SW_id` (`SW_id`);

--
-- Indexes for table `defence_accounts`
--
ALTER TABLE `defence_accounts`
  ADD PRIMARY KEY (`Trans_id`),
  ADD KEY `Wing_id` (`Wing_id`);

--
-- Indexes for table `jt_secr`
--
ALTER TABLE `jt_secr`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `Wing_id` (`Wing_id`),
  ADD KEY `SW_id` (`SW_id`),
  ADD KEY `Asecr_id` (`Asecr_id`);

--
-- Indexes for table `land`
--
ALTER TABLE `land`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Wing_id` (`Wing_id`),
  ADD KEY `SW_id` (`SW_id`);

--
-- Indexes for table `pensions`
--
ALTER TABLE `pensions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SW_Id` (`SW_Id`),
  ADD KEY `Wing_id` (`Wing_id`);

--
-- Indexes for table `sub_wings`
--
ALTER TABLE `sub_wings`
  ADD PRIMARY KEY (`SW_id`),
  ADD KEY `Asecr_id` (`Asecr_id`),
  ADD KEY `Jt_Secr` (`Jt_Secr`),
  ADD KEY `Wing_id` (`Wing_id`);

--
-- Indexes for table `wings`
--
ALTER TABLE `wings`
  ADD PRIMARY KEY (`Wing_id`),
  ADD KEY `Asecr_id` (`Asecr_id`);

--
-- Indexes for table `work_force`
--
ALTER TABLE `work_force`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `SW_id` (`SW_id`),
  ADD KEY `Wing_id` (`Wing_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asecr`
--
ALTER TABLE `asecr`
  ADD CONSTRAINT `asecr_ibfk_1` FOREIGN KEY (`Wing_id`) REFERENCES `wings` (`Wing_id`),
  ADD CONSTRAINT `asecr_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `work_force` (`PID`);

--
-- Constraints for table `cantonment`
--
ALTER TABLE `cantonment`
  ADD CONSTRAINT `cantonment_ibfk_1` FOREIGN KEY (`Wing_id`) REFERENCES `wings` (`Wing_id`),
  ADD CONSTRAINT `cantonment_ibfk_2` FOREIGN KEY (`SW_id`) REFERENCES `sub_wings` (`SW_id`);

--
-- Constraints for table `defence_accounts`
--
ALTER TABLE `defence_accounts`
  ADD CONSTRAINT `defence_accounts_ibfk_1` FOREIGN KEY (`Wing_id`) REFERENCES `wings` (`Wing_id`);

--
-- Constraints for table `jt_secr`
--
ALTER TABLE `jt_secr`
  ADD CONSTRAINT `jt_secr_ibfk_1` FOREIGN KEY (`Wing_id`) REFERENCES `wings` (`Wing_id`),
  ADD CONSTRAINT `jt_secr_ibfk_2` FOREIGN KEY (`SW_id`) REFERENCES `sub_wings` (`SW_id`),
  ADD CONSTRAINT `jt_secr_ibfk_3` FOREIGN KEY (`Asecr_id`) REFERENCES `asecr` (`PID`),
  ADD CONSTRAINT `jt_secr_ibfk_4` FOREIGN KEY (`PID`) REFERENCES `work_force` (`PID`);

--
-- Constraints for table `land`
--
ALTER TABLE `land`
  ADD CONSTRAINT `land_ibfk_1` FOREIGN KEY (`Wing_id`) REFERENCES `wings` (`Wing_id`),
  ADD CONSTRAINT `land_ibfk_2` FOREIGN KEY (`SW_id`) REFERENCES `sub_wings` (`SW_id`);

--
-- Constraints for table `pensions`
--
ALTER TABLE `pensions`
  ADD CONSTRAINT `pensions_ibfk_1` FOREIGN KEY (`SW_Id`) REFERENCES `sub_wings` (`SW_id`),
  ADD CONSTRAINT `pensions_ibfk_2` FOREIGN KEY (`Wing_id`) REFERENCES `wings` (`Wing_id`);

--
-- Constraints for table `sub_wings`
--
ALTER TABLE `sub_wings`
  ADD CONSTRAINT `sub_wings_ibfk_1` FOREIGN KEY (`Asecr_id`) REFERENCES `asecr` (`PID`),
  ADD CONSTRAINT `sub_wings_ibfk_2` FOREIGN KEY (`Jt_Secr`) REFERENCES `jt_secr` (`PID`),
  ADD CONSTRAINT `sub_wings_ibfk_3` FOREIGN KEY (`Wing_id`) REFERENCES `wings` (`Wing_id`);

--
-- Constraints for table `wings`
--
ALTER TABLE `wings`
  ADD CONSTRAINT `wings_ibfk_1` FOREIGN KEY (`Asecr_id`) REFERENCES `asecr` (`PID`);

--
-- Constraints for table `work_force`
--
ALTER TABLE `work_force`
  ADD CONSTRAINT `work_force_ibfk_1` FOREIGN KEY (`SW_id`) REFERENCES `sub_wings` (`SW_id`),
  ADD CONSTRAINT `work_force_ibfk_2` FOREIGN KEY (`Wing_id`) REFERENCES `wings` (`Wing_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
