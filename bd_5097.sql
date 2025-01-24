-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2025 at 05:16 AM
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
-- Database: `bd_5097`
--

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` int(11) NOT NULL,
  `nama_matkul` varchar(100) NOT NULL,
  `kode_matkul` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL,
  `jenis_matkul` enum('Wajib','Pilihan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `nama_matkul`, `kode_matkul`, `sks`, `jenis_matkul`) VALUES
(1, 'Back End Development', 'BE101', 4, 'Pilihan'),
(2, 'Success Skill', 'SS102', 2, 'Wajib'),
(3, 'Pengolahan Basis Data', 'PBD204', 4, 'Pilihan'),
(4, 'Bahasa Indonesia', 'BI200', 2, 'Wajib');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) NOT NULL,
  `mahasiswa_id` int(11) DEFAULT NULL,
  `mata_kuliah_id` int(11) DEFAULT NULL,
  `nilai_tugas` decimal(5,2) DEFAULT NULL,
  `nilai_uts` decimal(5,2) DEFAULT NULL,
  `nilai_uas` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `mahasiswa_id`, `mata_kuliah_id`, `nilai_tugas`, `nilai_uts`, `nilai_uas`) VALUES
(6, 3, 1, 90.00, 80.00, 80.00),
(7, 3, 2, 80.00, 88.00, 80.00),
(8, 3, 3, 88.00, 98.00, 88.00),
(9, 4, 1, 99.00, 88.00, 88.00),
(10, 4, 3, 90.00, 90.00, 90.00),
(11, 4, 2, 88.00, 88.00, 90.00),
(12, 5, 1, 88.00, 99.00, 99.00),
(13, 5, 4, 90.00, 99.00, 98.00);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nim_nip` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `nim_nip`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'nur layla yenny', '-', 'laylaputri92@gmail.com', 'default.jpg', '$2y$10$0hF9v2R1r8cD4Nc2V5oVtOoy5dpjAb4WYtvgourYTR3KOgTM6A4DC', 1, 1, 1737638477),
(2, 'Firman Asharudin', '3404776688', 'Firman@gmail.com', 'default.jpg', '$2y$10$7TK7QOrstPuUNpR72/ZmRu8pGBDx03YkDDKMGfFVqxp6smbtgrKUC', 2, 1, 1737638497),
(3, 'dimas adiyaksa', '23.01.5077', 'dimas@gmail.com', 'default.jpg', '$2y$10$dZKf1GHvt4SO.ulBTTSMuedDxHs4YBoGt5wKoeq8YJ5MIP7Rs2GmC', 3, 1, 1737638514),
(4, 'zara saputri', '23.01.2001', 'zara@gmail.com', 'default.jpg', '$2y$10$mJbM4A9VnTZCpao/Orgt9.zAsxGXlv9OhfGkcyWuCCwx/jMlOEmNy', 3, 1, 1737644250),
(5, 'hastanto kurniawan', '23.01.0998', 'hastan@gmail.com', 'default.jpg', '$2y$10$xhNL9KcseeZrUt6pDZN26eQYApYei4ZpAMPZBWYtrwdpnEVUEQrSu', 3, 1, 1737670838);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'dosen'),
(3, 'mahasiswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_matkul` (`kode_matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`),
  ADD KEY `mata_kuliah_id` (`mata_kuliah_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
