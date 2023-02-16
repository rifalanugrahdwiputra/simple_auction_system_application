-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2021 at 02:42 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_lelang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(5) NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `harga_awal` int(11) DEFAULT NULL,
  `deskripsi_barang` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `id_petugas` char(5) DEFAULT NULL,
  `status` enum('dibuka','ditutup') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `tanggal`, `harga_awal`, `deskripsi_barang`, `gambar`, `id_petugas`, `status`) VALUES
(' BR01', 'Laptop', '2021-04-05', 15000000, 'Kondisi : Mulus, Warna : Putih, Tahun : 2019', '1292972044_laptop.jpg', 'PT03', 'dibuka'),
(' BR02', 'CBR 250RR', '2021-04-05', 50000000, 'Kondisi : Mulus, Warna : Putih, Tahun : 2018', '701628333_cbr.jpg', 'PT03', 'ditutup'),
(' BR03', 'BMW M3', '2021-04-05', 100000000, 'Kondisi : Sangat Mulus, Warna : Kuning, Tahun : 2015', '1671238767_m3.jpg', ' MS02', 'ditutup');

-- --------------------------------------------------------

--
-- Table structure for table `history_lelang`
--

CREATE TABLE `history_lelang` (
  `id_history` char(5) NOT NULL,
  `id_lelang` char(5) DEFAULT NULL,
  `id_barang` char(5) DEFAULT NULL,
  `id_user` char(5) DEFAULT NULL,
  `penawaran_harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_lelang`
--

INSERT INTO `history_lelang` (`id_history`, `id_lelang`, `id_barang`, `id_user`, `penawaran_harga`) VALUES
('HS01', 'LE01', ' BR01', ' MS01', 16000000),
('HS02', 'LE03', ' BR03', ' MS01', 110000000),
('HS03', 'LE02', ' BR02', ' MS01', 60000000),
('HS04', 'LE01', ' BR01', ' MS02', 20000000),
('HS05', 'LE03', ' BR03', ' MS02', 120000000),
('HS06', 'LE02', ' BR02', ' MS02', 66000000),
('HS07', 'LE01', ' BR01', ' MS02', 25000000),
('HS08', 'LE01', ' BR01', ' MS01', 27000000),
('HS09', 'LE01', ' BR01', ' MS02', 29000000),
('HS10', 'LE01', ' BR01', ' MS01', 31000000),
('HS11', 'LE03', ' BR03', ' MS01', 140000000),
('HS12', 'LE02', ' BR02', ' MS01', 120000000),
('HS13', 'LE01', ' BR01', ' MS01', 150000000),
('HS14', 'LE01', ' BR01', ' MS01', 160000000);

-- --------------------------------------------------------

--
-- Table structure for table `lelang`
--

CREATE TABLE `lelang` (
  `id_lelang` char(5) NOT NULL,
  `id_barang` char(5) DEFAULT NULL,
  `tgl_lelang` date DEFAULT NULL,
  `harga_akhir` int(11) DEFAULT NULL,
  `id_user` char(5) DEFAULT NULL,
  `id_petugas` char(5) DEFAULT NULL,
  `status` enum('dibuka','ditutup') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lelang`
--

INSERT INTO `lelang` (`id_lelang`, `id_barang`, `tgl_lelang`, `harga_akhir`, `id_user`, `id_petugas`, `status`) VALUES
('LE01', ' BR01', '2021-04-08', 160000000, ' MS01', 'PT03', 'dibuka'),
('LE02', ' BR02', '2021-04-05', 50000000, NULL, 'PT03', 'ditutup'),
('LE03', ' BR03', '2021-04-05', 100000000, NULL, ' MS02', 'ditutup');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` char(5) NOT NULL,
  `level` enum('administrator','petugas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `level`) VALUES
('LV1', 'administrator'),
('LV2', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `id_user` char(5) NOT NULL,
  `nama_lengkap` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `telp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`id_user`, `nama_lengkap`, `username`, `password`, `telp`) VALUES
(' MS01', 'Adi Febrian', 'adi', 'adi', 2147483647),
(' MS02', 'Irfan Sutisna Hendar', 'irfan', 'irfan', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` char(5) NOT NULL,
  `nama_petugas` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `id_level` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `id_level`) VALUES
(' MS02', 'Rendy Irawan', 'rendy', 'rendy', 'LV1'),
('PT01', 'Rifal Anugrah', 'rifal', 'rifal', 'LV2'),
('PT02', 'Faizal Rifqi', 'faizal', 'faizal', 'LV2'),
('PT03', 'Kevin Farrel', 'kevin', 'kevin', 'LV1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `history_lelang`
--
ALTER TABLE `history_lelang`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `id_lelang` (`id_lelang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `lelang`
--
ALTER TABLE `lelang`
  ADD PRIMARY KEY (`id_lelang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`),
  ADD KEY `id_level` (`id_level`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

--
-- Constraints for table `history_lelang`
--
ALTER TABLE `history_lelang`
  ADD CONSTRAINT `history_lelang_ibfk_1` FOREIGN KEY (`id_lelang`) REFERENCES `lelang` (`id_lelang`),
  ADD CONSTRAINT `history_lelang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `history_lelang_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `masyarakat` (`id_user`);

--
-- Constraints for table `lelang`
--
ALTER TABLE `lelang`
  ADD CONSTRAINT `lelang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `lelang_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `masyarakat` (`id_user`),
  ADD CONSTRAINT `lelang_ibfk_3` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

--
-- Constraints for table `petugas`
--
ALTER TABLE `petugas`
  ADD CONSTRAINT `petugas_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
