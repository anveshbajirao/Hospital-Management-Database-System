-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2026 at 12:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitaldb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateBill` (IN `v_id` INT)   BEGIN
    DECLARE fee DECIMAL(10,2);
    DECLARE p_id INT;

    SELECT d.consultation_fee, v.patient_id
    INTO fee, p_id
    FROM Visits v
    JOIN Doctors d ON v.doctor_id = d.doctor_id
    WHERE v.visit_id = v_id;

    INSERT INTO Bills (patient_id, visit_id, total_amount)
    VALUES (p_id, v_id, fee);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `patient_id`, `visit_id`, `total_amount`, `payment_status`) VALUES
(1, 1, 1, 500.00, 'Paid'),
(2, 2, 2, 300.00, 'Pending'),
(3, 3, 3, 400.00, 'Paid'),
(4, 4, 4, 600.00, 'Pending'),
(5, 5, 5, 350.00, 'Paid'),
(6, 6, 6, 450.00, 'Pending'),
(7, 7, 7, 300.00, 'Paid'),
(8, 8, 8, 250.00, 'Pending'),
(9, 9, 9, 550.00, 'Paid'),
(10, 10, 10, 700.00, 'Pending'),
(11, 1, 1, 500.00, 'Pending');

--
-- Triggers `bills`
--
DELIMITER $$
CREATE TRIGGER `AfterPaymentUpdate` AFTER UPDATE ON `bills` FOR EACH ROW BEGIN
    IF NEW.payment_status = 'Paid' THEN
        UPDATE Patients
        SET status = 'Discharged'
        WHERE patient_id = NEW.patient_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `consultation_fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `name`, `specialization`, `consultation_fee`) VALUES
(1, 'Dr. Mehta', 'Cardiologist', 500.00),
(2, 'Dr. Patel', 'Dermatologist', 300.00),
(3, 'Dr. Shah', 'Orthopedic', 400.00),
(4, 'Dr. Joshi', 'Neurologist', 600.00),
(5, 'Dr. Kulkarni', 'Pediatrician', 350.00),
(6, 'Dr. Desai', 'Gynecologist', 450.00),
(7, 'Dr. Iyer', 'ENT Specialist', 300.00),
(8, 'Dr. Reddy', 'General Physician', 250.00),
(9, 'Dr. Khan', 'Psychiatrist', 550.00),
(10, 'Dr. Verma', 'Oncologist', 700.00);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Admitted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `name`, `age`, `gender`, `phone`, `address`, `status`) VALUES
(1, 'Rahul Sharma', 30, 'Male', '9000000001', 'Pune', 'Admitted'),
(2, 'Priya Singh', 25, 'Female', '9000000002', 'Mumbai', 'Admitted'),
(3, 'Amit Verma', 40, 'Male', '9000000003', 'Nagpur', 'Admitted'),
(4, 'Sneha Patil', 28, 'Female', '9000000004', 'Nashik', 'Admitted'),
(5, 'Rohan Das', 35, 'Male', '9000000005', 'Delhi', 'Admitted'),
(6, 'Neha Gupta', 32, 'Female', '9000000006', 'Bangalore', 'Admitted'),
(7, 'Vikas Yadav', 45, 'Male', '9000000007', 'Hyderabad', 'Admitted'),
(8, 'Anjali Mehta', 22, 'Female', '9000000008', 'Pune', 'Admitted'),
(9, 'Suresh Kumar', 50, 'Male', '9000000009', 'Chennai', 'Admitted'),
(10, 'Kavita Sharma', 29, 'Female', '9000000010', 'Mumbai', 'Admitted'),
(11, 'Arjun Nair', 33, 'Male', '9000000011', 'Kerala', 'Admitted'),
(12, 'Pooja Jain', 27, 'Female', '9000000012', 'Indore', 'Admitted'),
(13, 'Manish Singh', 38, 'Male', '9000000013', 'Lucknow', 'Admitted'),
(14, 'Ritu Agarwal', 31, 'Female', '9000000014', 'Jaipur', 'Admitted'),
(15, 'Deepak Mishra', 42, 'Male', '9000000015', 'Varanasi', 'Admitted'),
(16, 'Meena Iyer', 36, 'Female', '9000000016', 'Chennai', 'Admitted'),
(17, 'Kiran Patil', 26, 'Male', '9000000017', 'Kolhapur', 'Admitted'),
(18, 'Sunita Reddy', 48, 'Female', '9000000018', 'Hyderabad', 'Admitted'),
(19, 'Ajay Kumar', 39, 'Male', '9000000019', 'Patna', 'Admitted'),
(20, 'Nisha Khan', 24, 'Female', '9000000020', 'Bhopal', 'Admitted');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`visit_id`, `patient_id`, `doctor_id`, `visit_date`, `diagnosis`) VALUES
(1, 1, 1, '2026-03-01', 'Heart Checkup'),
(2, 2, 2, '2026-03-02', 'Skin Allergy'),
(3, 3, 3, '2026-03-03', 'Fracture'),
(4, 4, 4, '2026-03-04', 'Migraine'),
(5, 5, 5, '2026-03-05', 'Child Fever'),
(6, 6, 6, '2026-03-06', 'Pregnancy Checkup'),
(7, 7, 7, '2026-03-07', 'Ear Infection'),
(8, 8, 8, '2026-03-08', 'General Fever'),
(9, 9, 9, '2026-03-09', 'Stress'),
(10, 10, 10, '2026-03-10', 'Cancer Screening');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `visit_id` (`visit_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`visit_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`visit_id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
