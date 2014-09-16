-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 16, 2014 at 08:02 PM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.15-1+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `placementinformer`
--

-- --------------------------------------------------------

--
-- Table structure for table `APPLIED`
--

CREATE TABLE IF NOT EXISTS `APPLIED` (
  `USN` varchar(10) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `TSTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `USN` (`USN`),
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ATTENDED`
--

CREATE TABLE IF NOT EXISTS `ATTENDED` (
  `USN` varchar(10) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  KEY `USN` (`USN`),
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `BRANCHESELIGIBLE`
--

CREATE TABLE IF NOT EXISTS `BRANCHESELIGIBLE` (
  `NAME` varchar(40) DEFAULT NULL,
  `BRANCH` varchar(20) DEFAULT NULL,
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `COMPANY`
--

CREATE TABLE IF NOT EXISTS `COMPANY` (
  `NAME` varchar(40) NOT NULL,
  `PACKAGE` double NOT NULL,
  `GPACUTOFF` double NOT NULL,
  `TENTHCUTOFF` int(11) NOT NULL,
  `PUCCUTOFF` int(11) NOT NULL,
  `DIPLOMACUTOFF` int(11) NOT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DATEOFVISIT`
--

CREATE TABLE IF NOT EXISTS `DATEOFVISIT` (
  `NAME` varchar(40) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `JOBPROFILE`
--

CREATE TABLE IF NOT EXISTS `JOBPROFILE` (
  `NAME` varchar(40) DEFAULT NULL,
  `PROFILE` varchar(60) DEFAULT NULL,
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `OFFER`
--

CREATE TABLE IF NOT EXISTS `OFFER` (
  `USN` varchar(10) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `DATEOFOFFER` date DEFAULT NULL,
  `PROFILE` varchar(60) DEFAULT NULL,
  KEY `USN` (`USN`),
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PCWORKED`
--

CREATE TABLE IF NOT EXISTS `PCWORKED` (
  `USN` varchar(10) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  KEY `USN` (`USN`),
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SHORTLISTED`
--

CREATE TABLE IF NOT EXISTS `SHORTLISTED` (
  `USN` varchar(10) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  KEY `USN` (`USN`),
  KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STUDENT`
--

CREATE TABLE IF NOT EXISTS `STUDENT` (
  `USN` varchar(10) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `BRANCH` varchar(25) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `PHONE` int(11) NOT NULL,
  `COORDINATORUSN` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`USN`),
  KEY `COORDINATORUSN` (`COORDINATORUSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `STUDENT`
--

INSERT INTO `STUDENT` (`USN`, `NAME`, `BRANCH`, `EMAIL`, `PHONE`, `COORDINATORUSN`) VALUES
('1RV11IS042', 'RAM KUMAR', 'INFORMATION SCIENCE', 'ramkumar.kr94@gmail.com', 2147483647, NULL),
('1RV11IS056', 'UJJWAL GULECHA', 'ISE', 'ujjwalgulecha@gmail.com', 2147483647, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `APPLIED`
--
ALTER TABLE `APPLIED`
  ADD CONSTRAINT `APPLIED_ibfk_2` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`),
  ADD CONSTRAINT `APPLIED_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `STUDENT` (`USN`);

--
-- Constraints for table `ATTENDED`
--
ALTER TABLE `ATTENDED`
  ADD CONSTRAINT `ATTENDED_ibfk_2` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`),
  ADD CONSTRAINT `ATTENDED_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `STUDENT` (`USN`);

--
-- Constraints for table `BRANCHESELIGIBLE`
--
ALTER TABLE `BRANCHESELIGIBLE`
  ADD CONSTRAINT `BRANCHESELIGIBLE_ibfk_1` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`);

--
-- Constraints for table `DATEOFVISIT`
--
ALTER TABLE `DATEOFVISIT`
  ADD CONSTRAINT `DATEOFVISIT_ibfk_1` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`);

--
-- Constraints for table `JOBPROFILE`
--
ALTER TABLE `JOBPROFILE`
  ADD CONSTRAINT `JOBPROFILE_ibfk_1` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`);

--
-- Constraints for table `OFFER`
--
ALTER TABLE `OFFER`
  ADD CONSTRAINT `OFFER_ibfk_4` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`),
  ADD CONSTRAINT `OFFER_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `STUDENT` (`USN`),
  ADD CONSTRAINT `OFFER_ibfk_2` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`),
  ADD CONSTRAINT `OFFER_ibfk_3` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`);

--
-- Constraints for table `PCWORKED`
--
ALTER TABLE `PCWORKED`
  ADD CONSTRAINT `PCWORKED_ibfk_2` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`),
  ADD CONSTRAINT `PCWORKED_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `STUDENT` (`USN`);

--
-- Constraints for table `SHORTLISTED`
--
ALTER TABLE `SHORTLISTED`
  ADD CONSTRAINT `SHORTLISTED_ibfk_2` FOREIGN KEY (`NAME`) REFERENCES `COMPANY` (`NAME`),
  ADD CONSTRAINT `SHORTLISTED_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `STUDENT` (`USN`);

--
-- Constraints for table `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD CONSTRAINT `STUDENT_ibfk_1` FOREIGN KEY (`COORDINATORUSN`) REFERENCES `STUDENT` (`USN`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
