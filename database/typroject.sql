-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 07, 2023 at 11:10 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `typroject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`mail`, `password`) VALUES
('yash@gmail.com', 'yash');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `name` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`name`, `mail`, `subject`, `message`) VALUES
('yash', 'codebhau@gmail.com', 'about donating organ of my friend.', 'mera dost jee ke bhi kuch nahi kr raha hain to socha donate krdu , kisiki jindagi to bach jayegi.');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `name` varchar(255) NOT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `mob` int(10) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `name_of_ngo` varchar(255) DEFAULT NULL,
  `type_of_donation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`name`, `gender`, `mail`, `mob`, `address`, `name_of_ngo`, `type_of_donation`) VALUES
('yash khadkeshwar', 'on', 'yash@gmial.com', 2147483647, 'at nanded', 'sggs', 'heart');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `lid` bigint(20) UNSIGNED NOT NULL,
  `emalid` text DEFAULT NULL,
  `password` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`lid`, `emalid`, `password`) VALUES
(1, 'Parth15@gmail.com', 'ParthJoshi@14'),
(2, 'Taara31@gmail.com', 'TaaraShirole@30'),
(3, 'Radha@gmail.com', 'RadhaKale@01'),
(4, 'Raj10@gmail.com', 'RajDeshpande@01'),
(5, 'Siddesh20@gmail.com', 'Siddesh@22');

-- --------------------------------------------------------

--
-- Table structure for table `login_donor`
--

CREATE TABLE `login_donor` (
  `lid` bigint(20) UNSIGNED NOT NULL,
  `did` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_donor`
--

INSERT INTO `login_donor` (`lid`, `did`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ngo_dir`
--

CREATE TABLE `ngo_dir` (
  `Sr No.` int(200) NOT NULL,
  `Name of VO/NGO` varchar(200) NOT NULL,
  `Registration No.,City & State` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Sectors working in` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ngo_dir`
--

INSERT INTO `ngo_dir` (`Sr No.`, `Name of VO/NGO`, `Registration No.,City & State`, `Address`, `Sectors working in`) VALUES
(1, 'LOKDHARA PRATISHTHAN', 'E-12361 (THANE), BHIWANDI (MAHARASHTRA)', 'AT. SAMATANAGAR, BORIVALI, NEAR Z.P. SCHOOL MARATHI, POST. PADGHA, TAL. BHIWANDI', 'Art & Culture,Children,Education & Literacy,Aged/Elderly'),
(2, 'nanded pratishtan', '431606 vishnupuri nanded', 'sggs college', 'cse');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `amount` int(11) DEFAULT NULL,
  `bankname` varchar(30) DEFAULT NULL CHECK (`bankname` in ('Axis Bank','HDFC Bank','ICICI Bank','State Bank of India')),
  `cardname` varchar(30) DEFAULT NULL,
  `cardnumber` decimal(16,0) DEFAULT NULL,
  `expmonth` int(11) DEFAULT NULL,
  `expyear` int(11) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`amount`, `bankname`, `cardname`, `cardnumber`, `expmonth`, `expyear`, `cvv`) VALUES
(10000, 'Axis Bank', 'Divya Virat Sharma', 2345567245645674, 12, 2025, 456),
(5000, 'HDFC Bank', 'Samrat Vijay Kumar', 2567456234654567, 2, 2023, 786);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mob` int(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `username`, `mail`, `mob`, `password`, `gender`) VALUES
('aditya', 'aditya@123', 'aditya@gmail.com', 2147483647, 'adit', 'on'),
('yash khadkeshwar', 'yash@123', 'yash@gmail.com', 2147483647, 'coder', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `vid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `occupation` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `contactno` text DEFAULT NULL,
  `gender` varchar(90) DEFAULT NULL CHECK (`gender` in ('Male','Female','other')),
  `hcyh` varchar(90) DEFAULT NULL CHECK (`hcyh` in ('I would like to volunteer my time','I would like to contribute financially','both')),
  `offences` varchar(9) DEFAULT NULL CHECK (`offences` in ('yes','no')),
  `medical` varchar(9) DEFAULT NULL CHECK (`medical` in ('yes','no'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`vid`, `name`, `email`, `occupation`, `address`, `city`, `contactno`, `gender`, `hcyh`, `offences`, `medical`) VALUES
(1, 'Vinay Dhamale', 'vinayd12@gmail.com', 'businessman', 'fashion street,Gujrat', 'Ahmedabad', '9372346748', 'Male', 'both', 'no', 'no'),
(2, 'Ketan Bhoj', 'ketanBhoj@gmail.com', 'analyst job', 'Dreamer college lane,divya apartment,flat no 9,Nashik 9', 'Nashik', '9345679848', 'Male', 'I would like to volunteer my time', 'yes', 'no'),
(3, 'Khushi Narayan', 'khushinarayan34@gmail.com', 'software engineer', 'Taware colony,Raghukul,Pune-11', 'Pune', '7774524767', 'Female', 'I would like to volunteer my time', 'no', 'no'),
(4, 'Shraddha Kale', 'shraddhak4@gmail.com', 'Content Creater', 'Bibwewadi,Pune', 'Pune', '9876424767', 'Female', 'both', 'no', 'yes'),
(5, 'Rohit Joshi', 'rohitjoshi@gmail.com', 'Developer', 'MG road,Kolhapur-06', 'Kolhapur', '7755924767', 'Male', 'both', 'no', 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `login_donor`
--
ALTER TABLE `login_donor`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `ngo_dir`
--
ALTER TABLE `ngo_dir`
  ADD PRIMARY KEY (`Sr No.`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`vid`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `lid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_donor`
--
ALTER TABLE `login_donor`
  MODIFY `lid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ngo_dir`
--
ALTER TABLE `ngo_dir`
  MODIFY `Sr No.` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `vid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
