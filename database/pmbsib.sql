-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 11, 2022 at 08:14 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmbsib`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pendaftar` ()   BEGIN

DECLARE i,n INT;
DECLARE jalur INT;
DECLARE no_pendaftar varchar(20);
DECLARE nama varchar(100);
DECLARE nisn varchar(15);
DECLARE nik varchar(20);
DECLARE tempat_lahir varchar(60);
DECLARE tanggal_lahir date;
DECLARE jenis_kelamin varchar(30);
DECLARE no_hp varchar(20);
DECLARE alamat text;
DECLARE agama varchar(25);
DECLARE idp1 int(11);
DECLARE idp2 int(11);
DECLARE nominal_bayar varchar(15);
DECLARE id_bank varchar(15);
DECLARE is_bayar varchar(10);

SET i = 0;
SET n = 1000;

while i < n DO
	
    SET jalur = (SELECT id_jalur FROM jalur_masuk ORDER BY RAND() LIMIT 1);
    SET no_pendaftar = (SELECT CONCAT('P',YEAR(CURRENT_DATE()),jalur, (i+1)));
    SET nama = (SELECT CONCAT('Cut Naila Fadia Fiadharma ', (i+1)));
    SET nisn = (SELECT CONCAT('84750239', (i+1)));
    SET nik = (SELECT CONCAT('3671010023', (i+1)));
    SET tempat_lahir = 'Tangerang';
    SET tanggal_lahir = (SELECT '2001-12-31'- INTERVAL FLOOR(RAND()* 200) DAY);
    SET jenis_kelamin = 'Perempuan';
    SET no_hp = (SELECT CONCAT('08965766', (i+1)));
    SET alamat = (SELECT CONCAT('Jl. Lamda 3 No. ', (i+1)));
    SET agama = 'Islam';
    SET idp1 = (SELECT id_prodi FROM prodi ORDER BY RAND() LIMIT 1);
    SET idp2 = (SELECT id_prodi FROM prodi ORDER BY RAND() LIMIT 1);
    SET nominal_bayar = 1500000;
    SET id_bank = (SELECT id_bank FROM bank ORDER BY RAND() LIMIT 1);
    SET is_bayar = 1;
    
    IF jalur = 1 THEN
    	SET nominal_bayar = null;
        SET id_bank = null;
        SET is_bayar = 1;
    END IF;

	IF (i+1) % 5 = 0 THEN
    	SET jenis_kelamin = 'Laki-laki';
        SET tempat_lahir = 'Jakarta';
        SET alamat = (SELECT CONCAT('Jl. Sigma 7 No. ', (i+1)));
        SET agama = 'Muslim';
    END IF;
    
    IF (i+1) % 3 = 0 THEN
    	SET is_bayar = 0;
    END IF;

    INSERT INTO pendaftar ( id_jalur, no_pendaftar, nama, nisn, nik, tempat_lahir, tanggal_lahir, jenis_kelamin, no_hp, alamat, agama, id_prodi1, id_prodi2, nominal_bayar, id_bank,is_bayar)
    VALUES ( jalur, no_pendaftar, nama, nisn, nik, tempat_lahir, tanggal_lahir, jenis_kelamin, no_hp, alamat, agama, idp1, idp2, nominal_bayar, id_bank, is_bayar);
 
          # increment
        SET i = i + 1;

END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pendaftar_prestasi` ()   BEGIN
    DECLARE i,n INT;
    DECLARE jalur_id INT;
    DECLARE no_pendaftar varchar(20);
    DECLARE nama varchar(100);
    DECLARE nisn varchar(15);
    DECLARE nik varchar(20);
    DECLARE tempat_lahir varchar(60);
    DECLARE tanggal_lahir date;
    DECLARE jenis_kelamin varchar(30);
    DECLARE no_hp varchar(20);
    DECLARE alamat text;
    DECLARE agama varchar(25);
    DECLARE idp1 int(11);
    DECLARE idp2 int(11);
    DECLARE nominal_bayar varchar(15);
    DECLARE bank_id int(11);
    DECLARE isb enum('1','0');
    DECLARE pendaftar_id INT;
    DECLARE tingkat_prestasi VARCHAR(30);
    DECLARE nama_prestasi VARCHAR(255);
    DECLARE tahun int;
    DECLARE url_dokumen VARCHAR(100);

SET i = 0;
SET n = 1000;
while i < n DO

    SET jalur_id = (SELECT id_jalur FROM jalur_masuk ORDER BY RAND() LIMIT 1);
    SET no_pendaftar = (SELECT CONCAT('P',YEAR(CURRENT_DATE()),jalur_id , (i+1)));
    SET nama = (SELECT CONCAT('Cut Naila Fadia Fiadharma ', (i+1)));
    SET nisn = (SELECT CONCAT('84750239', (i+1)));
    SET nik = (SELECT CONCAT('3671010023', (i+1)));
    SET tempat_lahir = 'Tangerang';
    SET tanggal_lahir = (SELECT '2001-12-31'- INTERVAL FLOOR(RAND()* 200) DAY);
    SET jenis_kelamin = 'Perempuan';
    SET no_hp = (SELECT CONCAT('08965766', (i+1)));
    SET alamat = (SELECT CONCAT('Jl. Lamda 3 No. ', (i+1)));
    SET agama = 'Islam';
    SET idp1 = (SELECT id_prodi FROM prodi ORDER BY RAND() LIMIT 1);
    SET idp2 = (SELECT id_prodi FROM prodi ORDER BY RAND() LIMIT 1);
    SET nominal_bayar = 150000;
    SET bank_id = (SELECT id_bank FROM bank ORDER BY RAND() LIMIT 1);
    SET isb = '1';
    
    IF jalur_id = 3 THEN
        SET nominal_bayar = null;
        SET bank_id = null;
        SET isb = '0';
        END IF;

    IF (i+1) % 5 = 0 THEN
        SET jenis_kelamin = 'Laki-laki';
        SET tempat_lahir = 'Jakarta';
        END IF;
 
    INSERT INTO pendaftar (id_jalur, no_pendaftar, nama, nisn, nik, tempat_lahir, tanggal_lahir, jenis_kelamin, no_hp, alamat, agama, id_prodi1, id_prodi2, nominal_bayar, id_bank, is_bayar)
    VALUES (jalur_id, no_pendaftar, nama, nisn, nik, tempat_lahir, tanggal_lahir, jenis_kelamin, no_hp, alamat, agama, idp1, idp2, nominal_bayar, bank_id, isb);

        SET pendaftar_id = (SELECT LAST_INSERT_ID());

        if jalur_id = 3 THEN
        SET tingkat_prestasi = 'NASIONAL';
        SET tahun = (SELECT YEAR(CURRENT_DATE()));

        if (1+i) % 6 = 0 THEN
        	SET tingkat_prestasi = 'INTERNASIONAL';
        	SET tahun = (SELECT YEAR(CURRENT_DATE()));
        END if;
        SET nama_prestasi = (SELECT CONCAT('Prestasi ', tingkat_prestasi,' ', nama));
        SET url_dokumen = (SELECT CONCAT('public/uploads/prestasi/', pendaftar_id)); 
        
        INSERT INTO pendaftar_prestasi (id_pendaftar, tingkat_prestasi, nama_prestasi, tahun, url_dokumen)
        VALUES(pendaftar_id, tingkat_prestasi, nama_prestasi, tahun, url_dokumen);
        
        END IF;
        SET i = i + 1;
END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id_bank`, `bank`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 'BCA', '2022-12-07 04:46:34', NULL, NULL, NULL),
(2, 'MANDIRI', '2022-12-07 04:47:11', NULL, NULL, NULL),
(3, 'BNI', '2022-12-07 04:47:31', NULL, NULL, NULL),
(4, 'BRI', '2022-12-07 04:47:44', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `id_perguruan_tinggi` int(11) NOT NULL DEFAULT 0,
  `nama_fakultas` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `id_perguruan_tinggi`, `nama_fakultas`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 1, 'Teknologi Industri', '2022-12-07 05:04:36', NULL, NULL, NULL),
(2, 1, 'Fakultas Sastra', '2022-12-07 05:06:18', NULL, NULL, NULL),
(3, 1, 'Fakultas Ilmu Komunikasi Dan Teknlogi Informasi', '2022-12-07 05:07:39', NULL, NULL, NULL),
(4, 1, 'Fakultas Ekonomi', '2022-12-07 05:08:25', NULL, NULL, NULL),
(5, 1, 'Fakultas Psikologi', '2022-12-07 05:21:02', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jalur_masuk`
--

CREATE TABLE `jalur_masuk` (
  `id_jalur` int(11) NOT NULL,
  `nama_jalur` varchar(255) NOT NULL,
  `is_tes` int(11) NOT NULL,
  `is_mandiri` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jalur_masuk`
--

INSERT INTO `jalur_masuk` (`id_jalur`, `nama_jalur`, `is_tes`, `is_mandiri`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 'Mandiri (Test)', 1, 1, '2022-12-07 11:45:56', NULL, NULL, '2022-12-07 12:48:57'),
(2, 'Mandiri (Prestasi)', 0, 1, '2022-12-07 11:47:27', NULL, NULL, '2022-12-07 12:49:03'),
(3, 'SNMPTN', 0, 0, '2022-12-07 12:30:18', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pendaftar`
--

CREATE TABLE `pendaftar` (
  `id_pendaftar` int(11) NOT NULL,
  `id_jalur` int(11) NOT NULL,
  `no_pendaftar` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nisn` varchar(15) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(60) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` text NOT NULL,
  `agama` varchar(25) NOT NULL,
  `id_prodi1` int(11) NOT NULL,
  `id_prodi2` int(11) DEFAULT NULL,
  `nominal_bayar` decimal(12,2) DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `is_bayar` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pendaftar`
--

INSERT INTO `pendaftar` (`id_pendaftar`, `id_jalur`, `no_pendaftar`, `nama`, `nisn`, `nik`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `no_hp`, `alamat`, `agama`, `id_prodi1`, `id_prodi2`, `nominal_bayar`, `id_bank`, `is_bayar`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 1, 'P202211', 'Cut Naila Fadia Fiadharma 1', '847502391', '36710100231', 'Tangerang', '2001-08-23', 'Perempuan', '089657661', 'Jl. Lamda 3 No. 1', 'Islam', 4, 1, '150000.00', 1, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(2, 1, 'P202212', 'Cut Naila Fadia Fiadharma 2', '847502392', '36710100232', 'Tangerang', '2001-07-11', 'Perempuan', '089657662', 'Jl. Lamda 3 No. 2', 'Islam', 7, 2, '150000.00', 1, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(3, 1, 'P202213', 'Cut Naila Fadia Fiadharma 3', '847502393', '36710100233', 'Tangerang', '2001-10-26', 'Perempuan', '089657663', 'Jl. Lamda 3 No. 3', 'Islam', 8, 11, '150000.00', 2, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(4, 3, 'P202234', 'Cut Naila Fadia Fiadharma 4', '847502394', '36710100234', 'Tangerang', '2001-11-14', 'Perempuan', '089657664', 'Jl. Lamda 3 No. 4', 'Islam', 5, 3, NULL, NULL, '0', '2022-12-11 07:08:05', NULL, NULL, NULL),
(5, 2, 'P202225', 'Cut Naila Fadia Fiadharma 5', '847502395', '36710100235', 'Jakarta', '2001-08-16', 'Laki-Laki', '089657665', 'Jl. Lamda 3 No. 5', 'Islam', 13, 13, '150000.00', 3, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(6, 1, 'P202216', 'Cut Naila Fadia Fiadharma 6', '847502396', '36710100236', 'Tangerang', '2001-09-07', 'Perempuan', '089657666', 'Jl. Lamda 3 No. 6', 'Islam', 4, 7, '150000.00', 2, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(7, 2, 'P202227', 'Cut Naila Fadia Fiadharma 7', '847502397', '36710100237', 'Tangerang', '2001-08-09', 'Perempuan', '089657667', 'Jl. Lamda 3 No. 7', 'Islam', 3, 13, '150000.00', 3, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(8, 2, 'P202228', 'Cut Naila Fadia Fiadharma 8', '847502398', '36710100238', 'Tangerang', '2001-06-23', 'Perempuan', '089657668', 'Jl. Lamda 3 No. 8', 'Islam', 1, 5, '150000.00', 4, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(9, 2, 'P202229', 'Cut Naila Fadia Fiadharma 9', '847502399', '36710100239', 'Tangerang', '2001-09-17', 'Perempuan', '089657669', 'Jl. Lamda 3 No. 9', 'Islam', 9, 12, '150000.00', 3, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(10, 3, 'P2022310', 'Cut Naila Fadia Fiadharma 10', '8475023910', '367101002310', 'Jakarta', '2001-07-07', 'Laki-Laki', '0896576610', 'Jl. Lamda 3 No. 10', 'Islam', 6, 5, NULL, NULL, '0', '2022-12-11 07:08:05', NULL, NULL, NULL),
(11, 2, 'P2022211', 'Cut Naila Fadia Fiadharma 11', '8475023911', '367101002311', 'Tangerang', '2001-12-15', 'Perempuan', '0896576611', 'Jl. Lamda 3 No. 11', 'Islam', 11, 3, '150000.00', 2, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(12, 1, 'P2022112', 'Cut Naila Fadia Fiadharma 12', '8475023912', '367101002312', 'Tangerang', '2001-06-28', 'Perempuan', '0896576612', 'Jl. Lamda 3 No. 12', 'Islam', 6, 10, '150000.00', 4, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(13, 3, 'P2022313', 'Cut Naila Fadia Fiadharma 13', '8475023913', '367101002313', 'Tangerang', '2001-12-01', 'Perempuan', '0896576613', 'Jl. Lamda 3 No. 13', 'Islam', 3, 3, NULL, NULL, '0', '2022-12-11 07:08:05', NULL, NULL, NULL),
(14, 2, 'P2022214', 'Cut Naila Fadia Fiadharma 14', '8475023914', '367101002314', 'Tangerang', '2001-07-15', 'Perempuan', '0896576614', 'Jl. Lamda 3 No. 14', 'Islam', 9, 11, '150000.00', 1, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(15, 2, 'P2022215', 'Cut Naila Fadia Fiadharma 15', '8475023915', '367101002315', 'Jakarta', '2001-11-28', 'Laki-Laki', '0896576615', 'Jl. Lamda 3 No. 15', 'Islam', 4, 12, '150000.00', 4, '1', '2022-12-11 07:08:05', NULL, NULL, NULL),
(16, 3, 'P2022316', 'Cut Naila Fadia Fiadharma 16', '8475023916', '367101002316', 'Tangerang', '2001-07-28', 'Perempuan', '0896576616', 'Jl. Lamda 3 No. 16', 'Islam', 5, 2, NULL, NULL, '0', '2022-12-11 07:08:05', NULL, NULL, NULL),
(17, 3, 'P2022317', 'Cut Naila Fadia Fiadharma 17', '8475023917', '367101002317', 'Tangerang', '2001-07-03', 'Perempuan', '0896576617', 'Jl. Lamda 3 No. 17', 'Islam', 5, 2, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(18, 3, 'P2022318', 'Cut Naila Fadia Fiadharma 18', '8475023918', '367101002318', 'Tangerang', '2001-06-15', 'Perempuan', '0896576618', 'Jl. Lamda 3 No. 18', 'Islam', 6, 9, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(19, 3, 'P2022319', 'Cut Naila Fadia Fiadharma 19', '8475023919', '367101002319', 'Tangerang', '2001-08-19', 'Perempuan', '0896576619', 'Jl. Lamda 3 No. 19', 'Islam', 12, 3, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(20, 1, 'P2022120', 'Cut Naila Fadia Fiadharma 20', '8475023920', '367101002320', 'Jakarta', '2001-11-21', 'Laki-Laki', '0896576620', 'Jl. Lamda 3 No. 20', 'Islam', 2, 1, '150000.00', 1, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(21, 3, 'P2022321', 'Cut Naila Fadia Fiadharma 21', '8475023921', '367101002321', 'Tangerang', '2001-11-05', 'Perempuan', '0896576621', 'Jl. Lamda 3 No. 21', 'Islam', 9, 5, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(22, 1, 'P2022122', 'Cut Naila Fadia Fiadharma 22', '8475023922', '367101002322', 'Tangerang', '2001-09-21', 'Perempuan', '0896576622', 'Jl. Lamda 3 No. 22', 'Islam', 3, 10, '150000.00', 2, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(23, 3, 'P2022323', 'Cut Naila Fadia Fiadharma 23', '8475023923', '367101002323', 'Tangerang', '2001-07-24', 'Perempuan', '0896576623', 'Jl. Lamda 3 No. 23', 'Islam', 1, 3, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(24, 3, 'P2022324', 'Cut Naila Fadia Fiadharma 24', '8475023924', '367101002324', 'Tangerang', '2001-12-16', 'Perempuan', '0896576624', 'Jl. Lamda 3 No. 24', 'Islam', 11, 11, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(25, 3, 'P2022325', 'Cut Naila Fadia Fiadharma 25', '8475023925', '367101002325', 'Jakarta', '2001-12-06', 'Laki-Laki', '0896576625', 'Jl. Lamda 3 No. 25', 'Islam', 9, 4, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(26, 3, 'P2022326', 'Cut Naila Fadia Fiadharma 26', '8475023926', '367101002326', 'Tangerang', '2001-08-04', 'Perempuan', '0896576626', 'Jl. Lamda 3 No. 26', 'Islam', 10, 10, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(27, 1, 'P2022127', 'Cut Naila Fadia Fiadharma 27', '8475023927', '367101002327', 'Tangerang', '2001-11-26', 'Perempuan', '0896576627', 'Jl. Lamda 3 No. 27', 'Islam', 11, 10, '150000.00', 4, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(28, 2, 'P2022228', 'Cut Naila Fadia Fiadharma 28', '8475023928', '367101002328', 'Tangerang', '2001-09-04', 'Perempuan', '0896576628', 'Jl. Lamda 3 No. 28', 'Islam', 5, 13, '150000.00', 4, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(29, 3, 'P2022329', 'Cut Naila Fadia Fiadharma 29', '8475023929', '367101002329', 'Tangerang', '2001-08-12', 'Perempuan', '0896576629', 'Jl. Lamda 3 No. 29', 'Islam', 11, 6, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(30, 1, 'P2022130', 'Cut Naila Fadia Fiadharma 30', '8475023930', '367101002330', 'Jakarta', '2001-08-20', 'Laki-Laki', '0896576630', 'Jl. Lamda 3 No. 30', 'Islam', 13, 4, '150000.00', 2, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(31, 2, 'P2022231', 'Cut Naila Fadia Fiadharma 31', '8475023931', '367101002331', 'Tangerang', '2001-07-20', 'Perempuan', '0896576631', 'Jl. Lamda 3 No. 31', 'Islam', 3, 4, '150000.00', 3, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(32, 2, 'P2022232', 'Cut Naila Fadia Fiadharma 32', '8475023932', '367101002332', 'Tangerang', '2001-10-03', 'Perempuan', '0896576632', 'Jl. Lamda 3 No. 32', 'Islam', 12, 12, '150000.00', 4, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(33, 3, 'P2022333', 'Cut Naila Fadia Fiadharma 33', '8475023933', '367101002333', 'Tangerang', '2001-09-09', 'Perempuan', '0896576633', 'Jl. Lamda 3 No. 33', 'Islam', 6, 8, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(34, 2, 'P2022234', 'Cut Naila Fadia Fiadharma 34', '8475023934', '367101002334', 'Tangerang', '2001-10-19', 'Perempuan', '0896576634', 'Jl. Lamda 3 No. 34', 'Islam', 6, 13, '150000.00', 1, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(35, 2, 'P2022235', 'Cut Naila Fadia Fiadharma 35', '8475023935', '367101002335', 'Jakarta', '2001-11-24', 'Laki-Laki', '0896576635', 'Jl. Lamda 3 No. 35', 'Islam', 12, 2, '150000.00', 4, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(36, 1, 'P2022136', 'Cut Naila Fadia Fiadharma 36', '8475023936', '367101002336', 'Tangerang', '2001-12-28', 'Perempuan', '0896576636', 'Jl. Lamda 3 No. 36', 'Islam', 11, 7, '150000.00', 4, '1', '2022-12-11 07:08:06', NULL, NULL, NULL),
(37, 3, 'P2022337', 'Cut Naila Fadia Fiadharma 37', '8475023937', '367101002337', 'Tangerang', '2001-09-22', 'Perempuan', '0896576637', 'Jl. Lamda 3 No. 37', 'Islam', 3, 1, NULL, NULL, '0', '2022-12-11 07:08:06', NULL, NULL, NULL),
(38, 1, 'P2022138', 'Cut Naila Fadia Fiadharma 38', '8475023938', '367101002338', 'Tangerang', '2001-12-18', 'Perempuan', '0896576638', 'Jl. Lamda 3 No. 38', 'Islam', 13, 10, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(39, 2, 'P2022239', 'Cut Naila Fadia Fiadharma 39', '8475023939', '367101002339', 'Tangerang', '2001-09-02', 'Perempuan', '0896576639', 'Jl. Lamda 3 No. 39', 'Islam', 1, 9, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(40, 1, 'P2022140', 'Cut Naila Fadia Fiadharma 40', '8475023940', '367101002340', 'Jakarta', '2001-09-22', 'Laki-Laki', '0896576640', 'Jl. Lamda 3 No. 40', 'Islam', 13, 11, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(41, 3, 'P2022341', 'Cut Naila Fadia Fiadharma 41', '8475023941', '367101002341', 'Tangerang', '2001-07-04', 'Perempuan', '0896576641', 'Jl. Lamda 3 No. 41', 'Islam', 2, 3, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(42, 3, 'P2022342', 'Cut Naila Fadia Fiadharma 42', '8475023942', '367101002342', 'Tangerang', '2001-10-19', 'Perempuan', '0896576642', 'Jl. Lamda 3 No. 42', 'Islam', 6, 2, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(43, 1, 'P2022143', 'Cut Naila Fadia Fiadharma 43', '8475023943', '367101002343', 'Tangerang', '2001-09-03', 'Perempuan', '0896576643', 'Jl. Lamda 3 No. 43', 'Islam', 9, 8, '150000.00', 4, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(44, 2, 'P2022244', 'Cut Naila Fadia Fiadharma 44', '8475023944', '367101002344', 'Tangerang', '2001-12-29', 'Perempuan', '0896576644', 'Jl. Lamda 3 No. 44', 'Islam', 12, 5, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(45, 2, 'P2022245', 'Cut Naila Fadia Fiadharma 45', '8475023945', '367101002345', 'Jakarta', '2001-08-23', 'Laki-Laki', '0896576645', 'Jl. Lamda 3 No. 45', 'Islam', 1, 8, '150000.00', 3, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(46, 2, 'P2022246', 'Cut Naila Fadia Fiadharma 46', '8475023946', '367101002346', 'Tangerang', '2001-06-21', 'Perempuan', '0896576646', 'Jl. Lamda 3 No. 46', 'Islam', 2, 1, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(47, 3, 'P2022347', 'Cut Naila Fadia Fiadharma 47', '8475023947', '367101002347', 'Tangerang', '2001-07-01', 'Perempuan', '0896576647', 'Jl. Lamda 3 No. 47', 'Islam', 3, 12, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(48, 2, 'P2022248', 'Cut Naila Fadia Fiadharma 48', '8475023948', '367101002348', 'Tangerang', '2001-06-26', 'Perempuan', '0896576648', 'Jl. Lamda 3 No. 48', 'Islam', 5, 6, '150000.00', 4, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(49, 3, 'P2022349', 'Cut Naila Fadia Fiadharma 49', '8475023949', '367101002349', 'Tangerang', '2001-11-28', 'Perempuan', '0896576649', 'Jl. Lamda 3 No. 49', 'Islam', 4, 10, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(50, 3, 'P2022350', 'Cut Naila Fadia Fiadharma 50', '8475023950', '367101002350', 'Jakarta', '2001-11-30', 'Laki-Laki', '0896576650', 'Jl. Lamda 3 No. 50', 'Islam', 8, 7, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(51, 2, 'P2022251', 'Cut Naila Fadia Fiadharma 51', '8475023951', '367101002351', 'Tangerang', '2001-12-13', 'Perempuan', '0896576651', 'Jl. Lamda 3 No. 51', 'Islam', 11, 4, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(52, 1, 'P2022152', 'Cut Naila Fadia Fiadharma 52', '8475023952', '367101002352', 'Tangerang', '2001-09-09', 'Perempuan', '0896576652', 'Jl. Lamda 3 No. 52', 'Islam', 2, 8, '150000.00', 4, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(53, 1, 'P2022153', 'Cut Naila Fadia Fiadharma 53', '8475023953', '367101002353', 'Tangerang', '2001-07-20', 'Perempuan', '0896576653', 'Jl. Lamda 3 No. 53', 'Islam', 1, 4, '150000.00', 4, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(54, 3, 'P2022354', 'Cut Naila Fadia Fiadharma 54', '8475023954', '367101002354', 'Tangerang', '2001-09-06', 'Perempuan', '0896576654', 'Jl. Lamda 3 No. 54', 'Islam', 1, 1, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(55, 2, 'P2022255', 'Cut Naila Fadia Fiadharma 55', '8475023955', '367101002355', 'Jakarta', '2001-08-18', 'Laki-Laki', '0896576655', 'Jl. Lamda 3 No. 55', 'Islam', 9, 13, '150000.00', 1, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(56, 3, 'P2022356', 'Cut Naila Fadia Fiadharma 56', '8475023956', '367101002356', 'Tangerang', '2001-08-02', 'Perempuan', '0896576656', 'Jl. Lamda 3 No. 56', 'Islam', 11, 9, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(57, 3, 'P2022357', 'Cut Naila Fadia Fiadharma 57', '8475023957', '367101002357', 'Tangerang', '2001-11-04', 'Perempuan', '0896576657', 'Jl. Lamda 3 No. 57', 'Islam', 11, 1, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(58, 1, 'P2022158', 'Cut Naila Fadia Fiadharma 58', '8475023958', '367101002358', 'Tangerang', '2001-08-08', 'Perempuan', '0896576658', 'Jl. Lamda 3 No. 58', 'Islam', 2, 4, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(59, 3, 'P2022359', 'Cut Naila Fadia Fiadharma 59', '8475023959', '367101002359', 'Tangerang', '2001-12-29', 'Perempuan', '0896576659', 'Jl. Lamda 3 No. 59', 'Islam', 10, 10, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(60, 1, 'P2022160', 'Cut Naila Fadia Fiadharma 60', '8475023960', '367101002360', 'Jakarta', '2001-11-04', 'Laki-Laki', '0896576660', 'Jl. Lamda 3 No. 60', 'Islam', 4, 11, '150000.00', 4, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(61, 3, 'P2022361', 'Cut Naila Fadia Fiadharma 61', '8475023961', '367101002361', 'Tangerang', '2001-07-11', 'Perempuan', '0896576661', 'Jl. Lamda 3 No. 61', 'Islam', 5, 10, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(62, 2, 'P2022262', 'Cut Naila Fadia Fiadharma 62', '8475023962', '367101002362', 'Tangerang', '2001-10-02', 'Perempuan', '0896576662', 'Jl. Lamda 3 No. 62', 'Islam', 2, 6, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(63, 3, 'P2022363', 'Cut Naila Fadia Fiadharma 63', '8475023963', '367101002363', 'Tangerang', '2001-06-21', 'Perempuan', '0896576663', 'Jl. Lamda 3 No. 63', 'Islam', 10, 5, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(64, 3, 'P2022364', 'Cut Naila Fadia Fiadharma 64', '8475023964', '367101002364', 'Tangerang', '2001-08-29', 'Perempuan', '0896576664', 'Jl. Lamda 3 No. 64', 'Islam', 12, 5, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(65, 1, 'P2022165', 'Cut Naila Fadia Fiadharma 65', '8475023965', '367101002365', 'Jakarta', '2001-06-17', 'Laki-Laki', '0896576665', 'Jl. Lamda 3 No. 65', 'Islam', 11, 6, '150000.00', 1, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(66, 2, 'P2022266', 'Cut Naila Fadia Fiadharma 66', '8475023966', '367101002366', 'Tangerang', '2001-09-10', 'Perempuan', '0896576666', 'Jl. Lamda 3 No. 66', 'Islam', 10, 5, '150000.00', 1, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(67, 2, 'P2022267', 'Cut Naila Fadia Fiadharma 67', '8475023967', '367101002367', 'Tangerang', '2001-09-19', 'Perempuan', '0896576667', 'Jl. Lamda 3 No. 67', 'Islam', 5, 11, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(68, 3, 'P2022368', 'Cut Naila Fadia Fiadharma 68', '8475023968', '367101002368', 'Tangerang', '2001-09-29', 'Perempuan', '0896576668', 'Jl. Lamda 3 No. 68', 'Islam', 2, 8, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(69, 2, 'P2022269', 'Cut Naila Fadia Fiadharma 69', '8475023969', '367101002369', 'Tangerang', '2001-07-28', 'Perempuan', '0896576669', 'Jl. Lamda 3 No. 69', 'Islam', 13, 12, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(70, 2, 'P2022270', 'Cut Naila Fadia Fiadharma 70', '8475023970', '367101002370', 'Jakarta', '2001-10-14', 'Laki-Laki', '0896576670', 'Jl. Lamda 3 No. 70', 'Islam', 11, 9, '150000.00', 2, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(71, 1, 'P2022171', 'Cut Naila Fadia Fiadharma 71', '8475023971', '367101002371', 'Tangerang', '2001-09-14', 'Perempuan', '0896576671', 'Jl. Lamda 3 No. 71', 'Islam', 4, 6, '150000.00', 4, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(72, 1, 'P2022172', 'Cut Naila Fadia Fiadharma 72', '8475023972', '367101002372', 'Tangerang', '2001-08-23', 'Perempuan', '0896576672', 'Jl. Lamda 3 No. 72', 'Islam', 4, 6, '150000.00', 4, '1', '2022-12-11 07:08:07', NULL, NULL, NULL),
(73, 3, 'P2022373', 'Cut Naila Fadia Fiadharma 73', '8475023973', '367101002373', 'Tangerang', '2001-11-01', 'Perempuan', '0896576673', 'Jl. Lamda 3 No. 73', 'Islam', 3, 4, NULL, NULL, '0', '2022-12-11 07:08:07', NULL, NULL, NULL),
(74, 1, 'P2022174', 'Cut Naila Fadia Fiadharma 74', '8475023974', '367101002374', 'Tangerang', '2001-10-09', 'Perempuan', '0896576674', 'Jl. Lamda 3 No. 74', 'Islam', 7, 10, '150000.00', 4, '1', '2022-12-11 07:08:08', NULL, NULL, NULL),
(75, 1, 'P2022175', 'Cut Naila Fadia Fiadharma 75', '8475023975', '367101002375', 'Jakarta', '2001-07-28', 'Laki-Laki', '0896576675', 'Jl. Lamda 3 No. 75', 'Islam', 11, 9, '150000.00', 2, '1', '2022-12-11 07:08:08', NULL, NULL, NULL),
(76, 1, 'P2022176', 'Cut Naila Fadia Fiadharma 76', '8475023976', '367101002376', 'Tangerang', '2001-11-21', 'Perempuan', '0896576676', 'Jl. Lamda 3 No. 76', 'Islam', 1, 7, '150000.00', 2, '1', '2022-12-11 07:08:08', NULL, NULL, NULL),
(77, 3, 'P2022377', 'Cut Naila Fadia Fiadharma 77', '8475023977', '367101002377', 'Tangerang', '2001-10-28', 'Perempuan', '0896576677', 'Jl. Lamda 3 No. 77', 'Islam', 12, 8, NULL, NULL, '0', '2022-12-11 07:08:08', NULL, NULL, NULL),
(78, 1, 'P2022178', 'Cut Naila Fadia Fiadharma 78', '8475023978', '367101002378', 'Tangerang', '2001-07-31', 'Perempuan', '0896576678', 'Jl. Lamda 3 No. 78', 'Islam', 9, 6, '150000.00', 3, '1', '2022-12-11 07:08:08', NULL, NULL, NULL),
(79, 3, 'P2022379', 'Cut Naila Fadia Fiadharma 79', '8475023979', '367101002379', 'Tangerang', '2001-10-03', 'Perempuan', '0896576679', 'Jl. Lamda 3 No. 79', 'Islam', 3, 13, NULL, NULL, '0', '2022-12-11 07:08:08', NULL, NULL, NULL),
(80, 3, 'P2022380', 'Cut Naila Fadia Fiadharma 80', '8475023980', '367101002380', 'Jakarta', '2001-09-05', 'Laki-Laki', '0896576680', 'Jl. Lamda 3 No. 80', 'Islam', 3, 7, NULL, NULL, '0', '2022-12-11 07:08:08', NULL, NULL, NULL),
(81, 3, 'P2022381', 'Cut Naila Fadia Fiadharma 81', '8475023981', '367101002381', 'Tangerang', '2001-11-02', 'Perempuan', '0896576681', 'Jl. Lamda 3 No. 81', 'Islam', 13, 6, NULL, NULL, '0', '2022-12-11 07:08:08', NULL, NULL, NULL),
(82, 3, 'P2022382', 'Cut Naila Fadia Fiadharma 82', '8475023982', '367101002382', 'Tangerang', '2001-10-28', 'Perempuan', '0896576682', 'Jl. Lamda 3 No. 82', 'Islam', 2, 2, NULL, NULL, '0', '2022-12-11 07:08:08', NULL, NULL, NULL),
(83, 3, 'P2022383', 'Cut Naila Fadia Fiadharma 83', '8475023983', '367101002383', 'Tangerang', '2001-10-27', 'Perempuan', '0896576683', 'Jl. Lamda 3 No. 83', 'Islam', 8, 10, NULL, NULL, '0', '2022-12-11 07:08:08', NULL, NULL, NULL),
(84, 2, 'P2022284', 'Cut Naila Fadia Fiadharma 84', '8475023984', '367101002384', 'Tangerang', '2001-11-02', 'Perempuan', '0896576684', 'Jl. Lamda 3 No. 84', 'Islam', 1, 11, '150000.00', 3, '1', '2022-12-11 07:08:08', NULL, NULL, NULL),
(85, 2, 'P2022285', 'Cut Naila Fadia Fiadharma 85', '8475023985', '367101002385', 'Jakarta', '2001-08-19', 'Laki-Laki', '0896576685', 'Jl. Lamda 3 No. 85', 'Islam', 4, 9, '150000.00', 3, '1', '2022-12-11 07:08:08', NULL, NULL, NULL),
(86, 1, 'P2022186', 'Cut Naila Fadia Fiadharma 86', '8475023986', '367101002386', 'Tangerang', '2001-08-17', 'Perempuan', '0896576686', 'Jl. Lamda 3 No. 86', 'Islam', 10, 13, '150000.00', 2, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(87, 3, 'P2022387', 'Cut Naila Fadia Fiadharma 87', '8475023987', '367101002387', 'Tangerang', '2001-12-21', 'Perempuan', '0896576687', 'Jl. Lamda 3 No. 87', 'Islam', 10, 5, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(88, 3, 'P2022388', 'Cut Naila Fadia Fiadharma 88', '8475023988', '367101002388', 'Tangerang', '2001-12-16', 'Perempuan', '0896576688', 'Jl. Lamda 3 No. 88', 'Islam', 3, 2, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(89, 2, 'P2022289', 'Cut Naila Fadia Fiadharma 89', '8475023989', '367101002389', 'Tangerang', '2001-06-26', 'Perempuan', '0896576689', 'Jl. Lamda 3 No. 89', 'Islam', 12, 3, '150000.00', 4, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(90, 2, 'P2022290', 'Cut Naila Fadia Fiadharma 90', '8475023990', '367101002390', 'Jakarta', '2001-12-05', 'Laki-Laki', '0896576690', 'Jl. Lamda 3 No. 90', 'Islam', 1, 7, '150000.00', 1, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(91, 1, 'P2022191', 'Cut Naila Fadia Fiadharma 91', '8475023991', '367101002391', 'Tangerang', '2001-10-25', 'Perempuan', '0896576691', 'Jl. Lamda 3 No. 91', 'Islam', 10, 6, '150000.00', 3, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(92, 3, 'P2022392', 'Cut Naila Fadia Fiadharma 92', '8475023992', '367101002392', 'Tangerang', '2001-08-13', 'Perempuan', '0896576692', 'Jl. Lamda 3 No. 92', 'Islam', 1, 6, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(93, 3, 'P2022393', 'Cut Naila Fadia Fiadharma 93', '8475023993', '367101002393', 'Tangerang', '2001-12-15', 'Perempuan', '0896576693', 'Jl. Lamda 3 No. 93', 'Islam', 10, 2, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(94, 2, 'P2022294', 'Cut Naila Fadia Fiadharma 94', '8475023994', '367101002394', 'Tangerang', '2001-11-09', 'Perempuan', '0896576694', 'Jl. Lamda 3 No. 94', 'Islam', 12, 11, '150000.00', 2, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(95, 1, 'P2022195', 'Cut Naila Fadia Fiadharma 95', '8475023995', '367101002395', 'Jakarta', '2001-08-10', 'Laki-Laki', '0896576695', 'Jl. Lamda 3 No. 95', 'Islam', 12, 2, '150000.00', 3, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(96, 3, 'P2022396', 'Cut Naila Fadia Fiadharma 96', '8475023996', '367101002396', 'Tangerang', '2001-09-17', 'Perempuan', '0896576696', 'Jl. Lamda 3 No. 96', 'Islam', 10, 11, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(97, 3, 'P2022397', 'Cut Naila Fadia Fiadharma 97', '8475023997', '367101002397', 'Tangerang', '2001-11-19', 'Perempuan', '0896576697', 'Jl. Lamda 3 No. 97', 'Islam', 13, 10, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(98, 2, 'P2022298', 'Cut Naila Fadia Fiadharma 98', '8475023998', '367101002398', 'Tangerang', '2001-09-23', 'Perempuan', '0896576698', 'Jl. Lamda 3 No. 98', 'Islam', 1, 1, '150000.00', 1, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(99, 3, 'P2022399', 'Cut Naila Fadia Fiadharma 99', '8475023999', '367101002399', 'Tangerang', '2001-07-02', 'Perempuan', '0896576699', 'Jl. Lamda 3 No. 99', 'Islam', 12, 11, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(100, 3, 'P20223100', 'Cut Naila Fadia Fiadharma 100', '84750239100', '3671010023100', 'Jakarta', '2001-11-15', 'Laki-Laki', '08965766100', 'Jl. Lamda 3 No. 100', 'Islam', 8, 13, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(101, 2, 'P20222101', 'Cut Naila Fadia Fiadharma 101', '84750239101', '3671010023101', 'Tangerang', '2001-08-23', 'Perempuan', '08965766101', 'Jl. Lamda 3 No. 101', 'Islam', 4, 10, '150000.00', 1, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(102, 3, 'P20223102', 'Cut Naila Fadia Fiadharma 102', '84750239102', '3671010023102', 'Tangerang', '2001-11-10', 'Perempuan', '08965766102', 'Jl. Lamda 3 No. 102', 'Islam', 2, 6, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(103, 3, 'P20223103', 'Cut Naila Fadia Fiadharma 103', '84750239103', '3671010023103', 'Tangerang', '2001-09-29', 'Perempuan', '08965766103', 'Jl. Lamda 3 No. 103', 'Islam', 8, 11, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(104, 3, 'P20223104', 'Cut Naila Fadia Fiadharma 104', '84750239104', '3671010023104', 'Tangerang', '2001-09-11', 'Perempuan', '08965766104', 'Jl. Lamda 3 No. 104', 'Islam', 2, 10, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(105, 1, 'P20221105', 'Cut Naila Fadia Fiadharma 105', '84750239105', '3671010023105', 'Jakarta', '2001-11-09', 'Laki-Laki', '08965766105', 'Jl. Lamda 3 No. 105', 'Islam', 9, 8, '150000.00', 1, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(106, 2, 'P20222106', 'Cut Naila Fadia Fiadharma 106', '84750239106', '3671010023106', 'Tangerang', '2001-12-20', 'Perempuan', '08965766106', 'Jl. Lamda 3 No. 106', 'Islam', 2, 1, '150000.00', 4, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(107, 3, 'P20223107', 'Cut Naila Fadia Fiadharma 107', '84750239107', '3671010023107', 'Tangerang', '2001-08-02', 'Perempuan', '08965766107', 'Jl. Lamda 3 No. 107', 'Islam', 7, 3, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(108, 1, 'P20221108', 'Cut Naila Fadia Fiadharma 108', '84750239108', '3671010023108', 'Tangerang', '2001-08-15', 'Perempuan', '08965766108', 'Jl. Lamda 3 No. 108', 'Islam', 4, 11, '150000.00', 2, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(109, 1, 'P20221109', 'Cut Naila Fadia Fiadharma 109', '84750239109', '3671010023109', 'Tangerang', '2001-08-25', 'Perempuan', '08965766109', 'Jl. Lamda 3 No. 109', 'Islam', 3, 5, '150000.00', 1, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(110, 3, 'P20223110', 'Cut Naila Fadia Fiadharma 110', '84750239110', '3671010023110', 'Jakarta', '2001-12-26', 'Laki-Laki', '08965766110', 'Jl. Lamda 3 No. 110', 'Islam', 8, 6, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(111, 2, 'P20222111', 'Cut Naila Fadia Fiadharma 111', '84750239111', '3671010023111', 'Tangerang', '2001-12-19', 'Perempuan', '08965766111', 'Jl. Lamda 3 No. 111', 'Islam', 13, 11, '150000.00', 2, '1', '2022-12-11 07:08:09', NULL, NULL, NULL),
(112, 3, 'P20223112', 'Cut Naila Fadia Fiadharma 112', '84750239112', '3671010023112', 'Tangerang', '2001-10-19', 'Perempuan', '08965766112', 'Jl. Lamda 3 No. 112', 'Islam', 3, 7, NULL, NULL, '0', '2022-12-11 07:08:09', NULL, NULL, NULL),
(113, 3, 'P20223113', 'Cut Naila Fadia Fiadharma 113', '84750239113', '3671010023113', 'Tangerang', '2001-12-22', 'Perempuan', '08965766113', 'Jl. Lamda 3 No. 113', 'Islam', 13, 9, NULL, NULL, '0', '2022-12-11 07:08:10', NULL, NULL, NULL),
(114, 3, 'P20223114', 'Cut Naila Fadia Fiadharma 114', '84750239114', '3671010023114', 'Tangerang', '2001-08-15', 'Perempuan', '08965766114', 'Jl. Lamda 3 No. 114', 'Islam', 5, 13, NULL, NULL, '0', '2022-12-11 07:08:10', NULL, NULL, NULL),
(115, 1, 'P20221115', 'Cut Naila Fadia Fiadharma 115', '84750239115', '3671010023115', 'Jakarta', '2001-06-15', 'Laki-Laki', '08965766115', 'Jl. Lamda 3 No. 115', 'Islam', 6, 12, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(116, 1, 'P20221116', 'Cut Naila Fadia Fiadharma 116', '84750239116', '3671010023116', 'Tangerang', '2001-08-23', 'Perempuan', '08965766116', 'Jl. Lamda 3 No. 116', 'Islam', 9, 6, '150000.00', 3, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(117, 1, 'P20221117', 'Cut Naila Fadia Fiadharma 117', '84750239117', '3671010023117', 'Tangerang', '2001-09-27', 'Perempuan', '08965766117', 'Jl. Lamda 3 No. 117', 'Islam', 11, 4, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(118, 2, 'P20222118', 'Cut Naila Fadia Fiadharma 118', '84750239118', '3671010023118', 'Tangerang', '2001-10-19', 'Perempuan', '08965766118', 'Jl. Lamda 3 No. 118', 'Islam', 11, 13, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(119, 1, 'P20221119', 'Cut Naila Fadia Fiadharma 119', '84750239119', '3671010023119', 'Tangerang', '2001-11-03', 'Perempuan', '08965766119', 'Jl. Lamda 3 No. 119', 'Islam', 9, 12, '150000.00', 2, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(120, 2, 'P20222120', 'Cut Naila Fadia Fiadharma 120', '84750239120', '3671010023120', 'Jakarta', '2001-10-14', 'Laki-Laki', '08965766120', 'Jl. Lamda 3 No. 120', 'Islam', 8, 3, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(121, 2, 'P20222121', 'Cut Naila Fadia Fiadharma 121', '84750239121', '3671010023121', 'Tangerang', '2001-06-16', 'Perempuan', '08965766121', 'Jl. Lamda 3 No. 121', 'Islam', 2, 9, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(122, 2, 'P20222122', 'Cut Naila Fadia Fiadharma 122', '84750239122', '3671010023122', 'Tangerang', '2001-10-18', 'Perempuan', '08965766122', 'Jl. Lamda 3 No. 122', 'Islam', 2, 7, '150000.00', 1, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(123, 1, 'P20221123', 'Cut Naila Fadia Fiadharma 123', '84750239123', '3671010023123', 'Tangerang', '2001-12-06', 'Perempuan', '08965766123', 'Jl. Lamda 3 No. 123', 'Islam', 11, 7, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(124, 2, 'P20222124', 'Cut Naila Fadia Fiadharma 124', '84750239124', '3671010023124', 'Tangerang', '2001-12-03', 'Perempuan', '08965766124', 'Jl. Lamda 3 No. 124', 'Islam', 11, 10, '150000.00', 3, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(125, 3, 'P20223125', 'Cut Naila Fadia Fiadharma 125', '84750239125', '3671010023125', 'Jakarta', '2001-11-13', 'Laki-Laki', '08965766125', 'Jl. Lamda 3 No. 125', 'Islam', 10, 5, NULL, NULL, '0', '2022-12-11 07:08:10', NULL, NULL, NULL),
(126, 1, 'P20221126', 'Cut Naila Fadia Fiadharma 126', '84750239126', '3671010023126', 'Tangerang', '2001-06-20', 'Perempuan', '08965766126', 'Jl. Lamda 3 No. 126', 'Islam', 9, 1, '150000.00', 3, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(127, 1, 'P20221127', 'Cut Naila Fadia Fiadharma 127', '84750239127', '3671010023127', 'Tangerang', '2001-07-18', 'Perempuan', '08965766127', 'Jl. Lamda 3 No. 127', 'Islam', 9, 8, '150000.00', 2, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(128, 3, 'P20223128', 'Cut Naila Fadia Fiadharma 128', '84750239128', '3671010023128', 'Tangerang', '2001-10-03', 'Perempuan', '08965766128', 'Jl. Lamda 3 No. 128', 'Islam', 4, 4, NULL, NULL, '0', '2022-12-11 07:08:10', NULL, NULL, NULL),
(129, 2, 'P20222129', 'Cut Naila Fadia Fiadharma 129', '84750239129', '3671010023129', 'Tangerang', '2001-09-08', 'Perempuan', '08965766129', 'Jl. Lamda 3 No. 129', 'Islam', 13, 13, '150000.00', 1, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(130, 2, 'P20222130', 'Cut Naila Fadia Fiadharma 130', '84750239130', '3671010023130', 'Jakarta', '2001-12-05', 'Laki-Laki', '08965766130', 'Jl. Lamda 3 No. 130', 'Islam', 13, 4, '150000.00', 3, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(131, 2, 'P20222131', 'Cut Naila Fadia Fiadharma 131', '84750239131', '3671010023131', 'Tangerang', '2001-07-03', 'Perempuan', '08965766131', 'Jl. Lamda 3 No. 131', 'Islam', 7, 6, '150000.00', 2, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(132, 3, 'P20223132', 'Cut Naila Fadia Fiadharma 132', '84750239132', '3671010023132', 'Tangerang', '2001-09-05', 'Perempuan', '08965766132', 'Jl. Lamda 3 No. 132', 'Islam', 11, 8, NULL, NULL, '0', '2022-12-11 07:08:10', NULL, NULL, NULL),
(133, 3, 'P20223133', 'Cut Naila Fadia Fiadharma 133', '84750239133', '3671010023133', 'Tangerang', '2001-07-19', 'Perempuan', '08965766133', 'Jl. Lamda 3 No. 133', 'Islam', 1, 1, NULL, NULL, '0', '2022-12-11 07:08:10', NULL, NULL, NULL),
(134, 2, 'P20222134', 'Cut Naila Fadia Fiadharma 134', '84750239134', '3671010023134', 'Tangerang', '2001-12-08', 'Perempuan', '08965766134', 'Jl. Lamda 3 No. 134', 'Islam', 9, 2, '150000.00', 1, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(135, 2, 'P20222135', 'Cut Naila Fadia Fiadharma 135', '84750239135', '3671010023135', 'Jakarta', '2001-08-19', 'Laki-Laki', '08965766135', 'Jl. Lamda 3 No. 135', 'Islam', 12, 9, '150000.00', 2, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(136, 1, 'P20221136', 'Cut Naila Fadia Fiadharma 136', '84750239136', '3671010023136', 'Tangerang', '2001-06-16', 'Perempuan', '08965766136', 'Jl. Lamda 3 No. 136', 'Islam', 2, 4, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(137, 2, 'P20222137', 'Cut Naila Fadia Fiadharma 137', '84750239137', '3671010023137', 'Tangerang', '2001-11-24', 'Perempuan', '08965766137', 'Jl. Lamda 3 No. 137', 'Islam', 4, 11, '150000.00', 3, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(138, 1, 'P20221138', 'Cut Naila Fadia Fiadharma 138', '84750239138', '3671010023138', 'Tangerang', '2001-10-09', 'Perempuan', '08965766138', 'Jl. Lamda 3 No. 138', 'Islam', 10, 8, '150000.00', 2, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(139, 2, 'P20222139', 'Cut Naila Fadia Fiadharma 139', '84750239139', '3671010023139', 'Tangerang', '2001-06-30', 'Perempuan', '08965766139', 'Jl. Lamda 3 No. 139', 'Islam', 1, 7, '150000.00', 3, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(140, 2, 'P20222140', 'Cut Naila Fadia Fiadharma 140', '84750239140', '3671010023140', 'Jakarta', '2001-09-11', 'Laki-Laki', '08965766140', 'Jl. Lamda 3 No. 140', 'Islam', 7, 5, '150000.00', 2, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(141, 1, 'P20221141', 'Cut Naila Fadia Fiadharma 141', '84750239141', '3671010023141', 'Tangerang', '2001-11-14', 'Perempuan', '08965766141', 'Jl. Lamda 3 No. 141', 'Islam', 4, 12, '150000.00', 3, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(142, 2, 'P20222142', 'Cut Naila Fadia Fiadharma 142', '84750239142', '3671010023142', 'Tangerang', '2001-11-17', 'Perempuan', '08965766142', 'Jl. Lamda 3 No. 142', 'Islam', 10, 6, '150000.00', 2, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(143, 2, 'P20222143', 'Cut Naila Fadia Fiadharma 143', '84750239143', '3671010023143', 'Tangerang', '2001-11-20', 'Perempuan', '08965766143', 'Jl. Lamda 3 No. 143', 'Islam', 10, 7, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(144, 2, 'P20222144', 'Cut Naila Fadia Fiadharma 144', '84750239144', '3671010023144', 'Tangerang', '2001-08-25', 'Perempuan', '08965766144', 'Jl. Lamda 3 No. 144', 'Islam', 13, 4, '150000.00', 1, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(145, 1, 'P20221145', 'Cut Naila Fadia Fiadharma 145', '84750239145', '3671010023145', 'Jakarta', '2001-06-15', 'Laki-Laki', '08965766145', 'Jl. Lamda 3 No. 145', 'Islam', 3, 13, '150000.00', 4, '1', '2022-12-11 07:08:10', NULL, NULL, NULL),
(146, 2, 'P20222146', 'Cut Naila Fadia Fiadharma 146', '84750239146', '3671010023146', 'Tangerang', '2001-09-15', 'Perempuan', '08965766146', 'Jl. Lamda 3 No. 146', 'Islam', 3, 5, '150000.00', 2, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(147, 3, 'P20223147', 'Cut Naila Fadia Fiadharma 147', '84750239147', '3671010023147', 'Tangerang', '2001-08-12', 'Perempuan', '08965766147', 'Jl. Lamda 3 No. 147', 'Islam', 10, 2, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(148, 1, 'P20221148', 'Cut Naila Fadia Fiadharma 148', '84750239148', '3671010023148', 'Tangerang', '2001-11-20', 'Perempuan', '08965766148', 'Jl. Lamda 3 No. 148', 'Islam', 2, 8, '150000.00', 2, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(149, 2, 'P20222149', 'Cut Naila Fadia Fiadharma 149', '84750239149', '3671010023149', 'Tangerang', '2001-11-02', 'Perempuan', '08965766149', 'Jl. Lamda 3 No. 149', 'Islam', 2, 6, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(150, 1, 'P20221150', 'Cut Naila Fadia Fiadharma 150', '84750239150', '3671010023150', 'Jakarta', '2001-11-28', 'Laki-Laki', '08965766150', 'Jl. Lamda 3 No. 150', 'Islam', 7, 7, '150000.00', 4, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(151, 3, 'P20223151', 'Cut Naila Fadia Fiadharma 151', '84750239151', '3671010023151', 'Tangerang', '2001-07-22', 'Perempuan', '08965766151', 'Jl. Lamda 3 No. 151', 'Islam', 11, 2, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(152, 3, 'P20223152', 'Cut Naila Fadia Fiadharma 152', '84750239152', '3671010023152', 'Tangerang', '2001-11-17', 'Perempuan', '08965766152', 'Jl. Lamda 3 No. 152', 'Islam', 3, 7, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(153, 3, 'P20223153', 'Cut Naila Fadia Fiadharma 153', '84750239153', '3671010023153', 'Tangerang', '2001-07-15', 'Perempuan', '08965766153', 'Jl. Lamda 3 No. 153', 'Islam', 3, 4, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(154, 2, 'P20222154', 'Cut Naila Fadia Fiadharma 154', '84750239154', '3671010023154', 'Tangerang', '2001-07-25', 'Perempuan', '08965766154', 'Jl. Lamda 3 No. 154', 'Islam', 10, 13, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(155, 2, 'P20222155', 'Cut Naila Fadia Fiadharma 155', '84750239155', '3671010023155', 'Jakarta', '2001-08-31', 'Laki-Laki', '08965766155', 'Jl. Lamda 3 No. 155', 'Islam', 4, 2, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(156, 1, 'P20221156', 'Cut Naila Fadia Fiadharma 156', '84750239156', '3671010023156', 'Tangerang', '2001-11-07', 'Perempuan', '08965766156', 'Jl. Lamda 3 No. 156', 'Islam', 4, 5, '150000.00', 2, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(157, 3, 'P20223157', 'Cut Naila Fadia Fiadharma 157', '84750239157', '3671010023157', 'Tangerang', '2001-07-20', 'Perempuan', '08965766157', 'Jl. Lamda 3 No. 157', 'Islam', 3, 6, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(158, 1, 'P20221158', 'Cut Naila Fadia Fiadharma 158', '84750239158', '3671010023158', 'Tangerang', '2001-07-27', 'Perempuan', '08965766158', 'Jl. Lamda 3 No. 158', 'Islam', 4, 13, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(159, 1, 'P20221159', 'Cut Naila Fadia Fiadharma 159', '84750239159', '3671010023159', 'Tangerang', '2001-07-10', 'Perempuan', '08965766159', 'Jl. Lamda 3 No. 159', 'Islam', 7, 10, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(160, 3, 'P20223160', 'Cut Naila Fadia Fiadharma 160', '84750239160', '3671010023160', 'Jakarta', '2001-11-22', 'Laki-Laki', '08965766160', 'Jl. Lamda 3 No. 160', 'Islam', 11, 2, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(161, 1, 'P20221161', 'Cut Naila Fadia Fiadharma 161', '84750239161', '3671010023161', 'Tangerang', '2001-11-22', 'Perempuan', '08965766161', 'Jl. Lamda 3 No. 161', 'Islam', 2, 5, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(162, 1, 'P20221162', 'Cut Naila Fadia Fiadharma 162', '84750239162', '3671010023162', 'Tangerang', '2001-07-22', 'Perempuan', '08965766162', 'Jl. Lamda 3 No. 162', 'Islam', 13, 11, '150000.00', 2, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(163, 3, 'P20223163', 'Cut Naila Fadia Fiadharma 163', '84750239163', '3671010023163', 'Tangerang', '2001-07-12', 'Perempuan', '08965766163', 'Jl. Lamda 3 No. 163', 'Islam', 6, 4, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(164, 1, 'P20221164', 'Cut Naila Fadia Fiadharma 164', '84750239164', '3671010023164', 'Tangerang', '2001-06-20', 'Perempuan', '08965766164', 'Jl. Lamda 3 No. 164', 'Islam', 11, 10, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(165, 2, 'P20222165', 'Cut Naila Fadia Fiadharma 165', '84750239165', '3671010023165', 'Jakarta', '2001-10-29', 'Laki-Laki', '08965766165', 'Jl. Lamda 3 No. 165', 'Islam', 7, 1, '150000.00', 4, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(166, 1, 'P20221166', 'Cut Naila Fadia Fiadharma 166', '84750239166', '3671010023166', 'Tangerang', '2001-08-05', 'Perempuan', '08965766166', 'Jl. Lamda 3 No. 166', 'Islam', 13, 1, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(167, 3, 'P20223167', 'Cut Naila Fadia Fiadharma 167', '84750239167', '3671010023167', 'Tangerang', '2001-11-06', 'Perempuan', '08965766167', 'Jl. Lamda 3 No. 167', 'Islam', 1, 8, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(168, 2, 'P20222168', 'Cut Naila Fadia Fiadharma 168', '84750239168', '3671010023168', 'Tangerang', '2001-12-17', 'Perempuan', '08965766168', 'Jl. Lamda 3 No. 168', 'Islam', 9, 4, '150000.00', 2, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(169, 1, 'P20221169', 'Cut Naila Fadia Fiadharma 169', '84750239169', '3671010023169', 'Tangerang', '2001-10-27', 'Perempuan', '08965766169', 'Jl. Lamda 3 No. 169', 'Islam', 11, 7, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(170, 2, 'P20222170', 'Cut Naila Fadia Fiadharma 170', '84750239170', '3671010023170', 'Jakarta', '2001-12-22', 'Laki-Laki', '08965766170', 'Jl. Lamda 3 No. 170', 'Islam', 8, 11, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(171, 2, 'P20222171', 'Cut Naila Fadia Fiadharma 171', '84750239171', '3671010023171', 'Tangerang', '2001-11-14', 'Perempuan', '08965766171', 'Jl. Lamda 3 No. 171', 'Islam', 4, 8, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(172, 1, 'P20221172', 'Cut Naila Fadia Fiadharma 172', '84750239172', '3671010023172', 'Tangerang', '2001-11-15', 'Perempuan', '08965766172', 'Jl. Lamda 3 No. 172', 'Islam', 12, 9, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(173, 2, 'P20222173', 'Cut Naila Fadia Fiadharma 173', '84750239173', '3671010023173', 'Tangerang', '2001-11-20', 'Perempuan', '08965766173', 'Jl. Lamda 3 No. 173', 'Islam', 8, 1, '150000.00', 4, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(174, 3, 'P20223174', 'Cut Naila Fadia Fiadharma 174', '84750239174', '3671010023174', 'Tangerang', '2001-08-08', 'Perempuan', '08965766174', 'Jl. Lamda 3 No. 174', 'Islam', 11, 4, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(175, 3, 'P20223175', 'Cut Naila Fadia Fiadharma 175', '84750239175', '3671010023175', 'Jakarta', '2001-07-01', 'Laki-Laki', '08965766175', 'Jl. Lamda 3 No. 175', 'Islam', 2, 11, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(176, 2, 'P20222176', 'Cut Naila Fadia Fiadharma 176', '84750239176', '3671010023176', 'Tangerang', '2001-07-20', 'Perempuan', '08965766176', 'Jl. Lamda 3 No. 176', 'Islam', 10, 1, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(177, 1, 'P20221177', 'Cut Naila Fadia Fiadharma 177', '84750239177', '3671010023177', 'Tangerang', '2001-09-06', 'Perempuan', '08965766177', 'Jl. Lamda 3 No. 177', 'Islam', 4, 12, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(178, 1, 'P20221178', 'Cut Naila Fadia Fiadharma 178', '84750239178', '3671010023178', 'Tangerang', '2001-09-03', 'Perempuan', '08965766178', 'Jl. Lamda 3 No. 178', 'Islam', 1, 8, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(179, 3, 'P20223179', 'Cut Naila Fadia Fiadharma 179', '84750239179', '3671010023179', 'Tangerang', '2001-10-21', 'Perempuan', '08965766179', 'Jl. Lamda 3 No. 179', 'Islam', 13, 1, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(180, 2, 'P20222180', 'Cut Naila Fadia Fiadharma 180', '84750239180', '3671010023180', 'Jakarta', '2001-12-01', 'Laki-Laki', '08965766180', 'Jl. Lamda 3 No. 180', 'Islam', 3, 1, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(181, 3, 'P20223181', 'Cut Naila Fadia Fiadharma 181', '84750239181', '3671010023181', 'Tangerang', '2001-07-31', 'Perempuan', '08965766181', 'Jl. Lamda 3 No. 181', 'Islam', 5, 12, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(182, 2, 'P20222182', 'Cut Naila Fadia Fiadharma 182', '84750239182', '3671010023182', 'Tangerang', '2001-11-02', 'Perempuan', '08965766182', 'Jl. Lamda 3 No. 182', 'Islam', 4, 4, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(183, 3, 'P20223183', 'Cut Naila Fadia Fiadharma 183', '84750239183', '3671010023183', 'Tangerang', '2001-11-13', 'Perempuan', '08965766183', 'Jl. Lamda 3 No. 183', 'Islam', 5, 5, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(184, 1, 'P20221184', 'Cut Naila Fadia Fiadharma 184', '84750239184', '3671010023184', 'Tangerang', '2001-06-19', 'Perempuan', '08965766184', 'Jl. Lamda 3 No. 184', 'Islam', 6, 7, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(185, 2, 'P20222185', 'Cut Naila Fadia Fiadharma 185', '84750239185', '3671010023185', 'Jakarta', '2001-09-09', 'Laki-Laki', '08965766185', 'Jl. Lamda 3 No. 185', 'Islam', 12, 4, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(186, 1, 'P20221186', 'Cut Naila Fadia Fiadharma 186', '84750239186', '3671010023186', 'Tangerang', '2001-11-21', 'Perempuan', '08965766186', 'Jl. Lamda 3 No. 186', 'Islam', 8, 11, '150000.00', 4, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(187, 2, 'P20222187', 'Cut Naila Fadia Fiadharma 187', '84750239187', '3671010023187', 'Tangerang', '2001-10-11', 'Perempuan', '08965766187', 'Jl. Lamda 3 No. 187', 'Islam', 5, 9, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(188, 1, 'P20221188', 'Cut Naila Fadia Fiadharma 188', '84750239188', '3671010023188', 'Tangerang', '2001-12-05', 'Perempuan', '08965766188', 'Jl. Lamda 3 No. 188', 'Islam', 13, 8, '150000.00', 3, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(189, 2, 'P20222189', 'Cut Naila Fadia Fiadharma 189', '84750239189', '3671010023189', 'Tangerang', '2001-06-17', 'Perempuan', '08965766189', 'Jl. Lamda 3 No. 189', 'Islam', 3, 9, '150000.00', 1, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(190, 3, 'P20223190', 'Cut Naila Fadia Fiadharma 190', '84750239190', '3671010023190', 'Jakarta', '2001-12-03', 'Laki-Laki', '08965766190', 'Jl. Lamda 3 No. 190', 'Islam', 6, 3, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(191, 3, 'P20223191', 'Cut Naila Fadia Fiadharma 191', '84750239191', '3671010023191', 'Tangerang', '2001-07-17', 'Perempuan', '08965766191', 'Jl. Lamda 3 No. 191', 'Islam', 11, 3, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(192, 3, 'P20223192', 'Cut Naila Fadia Fiadharma 192', '84750239192', '3671010023192', 'Tangerang', '2001-12-11', 'Perempuan', '08965766192', 'Jl. Lamda 3 No. 192', 'Islam', 6, 11, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(193, 1, 'P20221193', 'Cut Naila Fadia Fiadharma 193', '84750239193', '3671010023193', 'Tangerang', '2001-06-17', 'Perempuan', '08965766193', 'Jl. Lamda 3 No. 193', 'Islam', 6, 10, '150000.00', 4, '1', '2022-12-11 07:08:11', NULL, NULL, NULL),
(194, 3, 'P20223194', 'Cut Naila Fadia Fiadharma 194', '84750239194', '3671010023194', 'Tangerang', '2001-08-27', 'Perempuan', '08965766194', 'Jl. Lamda 3 No. 194', 'Islam', 10, 11, NULL, NULL, '0', '2022-12-11 07:08:11', NULL, NULL, NULL),
(195, 3, 'P20223195', 'Cut Naila Fadia Fiadharma 195', '84750239195', '3671010023195', 'Jakarta', '2001-07-09', 'Laki-Laki', '08965766195', 'Jl. Lamda 3 No. 195', 'Islam', 3, 4, NULL, NULL, '0', '2022-12-11 07:08:12', NULL, NULL, NULL),
(196, 1, 'P20221196', 'Cut Naila Fadia Fiadharma 196', '84750239196', '3671010023196', 'Tangerang', '2001-10-21', 'Perempuan', '08965766196', 'Jl. Lamda 3 No. 196', 'Islam', 10, 12, '150000.00', 4, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(197, 1, 'P20221197', 'Cut Naila Fadia Fiadharma 197', '84750239197', '3671010023197', 'Tangerang', '2001-12-08', 'Perempuan', '08965766197', 'Jl. Lamda 3 No. 197', 'Islam', 4, 8, '150000.00', 2, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(198, 3, 'P20223198', 'Cut Naila Fadia Fiadharma 198', '84750239198', '3671010023198', 'Tangerang', '2001-11-10', 'Perempuan', '08965766198', 'Jl. Lamda 3 No. 198', 'Islam', 3, 9, NULL, NULL, '0', '2022-12-11 07:08:12', NULL, NULL, NULL),
(199, 2, 'P20222199', 'Cut Naila Fadia Fiadharma 199', '84750239199', '3671010023199', 'Tangerang', '2001-06-18', 'Perempuan', '08965766199', 'Jl. Lamda 3 No. 199', 'Islam', 12, 4, '150000.00', 2, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(200, 1, 'P20221200', 'Cut Naila Fadia Fiadharma 200', '84750239200', '3671010023200', 'Jakarta', '2001-08-16', 'Laki-Laki', '08965766200', 'Jl. Lamda 3 No. 200', 'Islam', 3, 2, '150000.00', 4, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(201, 2, 'P20222201', 'Cut Naila Fadia Fiadharma 201', '84750239201', '3671010023201', 'Tangerang', '2001-08-22', 'Perempuan', '08965766201', 'Jl. Lamda 3 No. 201', 'Islam', 4, 8, '150000.00', 1, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(202, 2, 'P20222202', 'Cut Naila Fadia Fiadharma 202', '84750239202', '3671010023202', 'Tangerang', '2001-09-18', 'Perempuan', '08965766202', 'Jl. Lamda 3 No. 202', 'Islam', 6, 2, '150000.00', 1, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(203, 2, 'P20222203', 'Cut Naila Fadia Fiadharma 203', '84750239203', '3671010023203', 'Tangerang', '2001-11-14', 'Perempuan', '08965766203', 'Jl. Lamda 3 No. 203', 'Islam', 8, 7, '150000.00', 4, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(204, 1, 'P20221204', 'Cut Naila Fadia Fiadharma 204', '84750239204', '3671010023204', 'Tangerang', '2001-12-25', 'Perempuan', '08965766204', 'Jl. Lamda 3 No. 204', 'Islam', 6, 9, '150000.00', 3, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(205, 3, 'P20223205', 'Cut Naila Fadia Fiadharma 205', '84750239205', '3671010023205', 'Jakarta', '2001-08-12', 'Laki-Laki', '08965766205', 'Jl. Lamda 3 No. 205', 'Islam', 4, 9, NULL, NULL, '0', '2022-12-11 07:08:12', NULL, NULL, NULL),
(206, 2, 'P20222206', 'Cut Naila Fadia Fiadharma 206', '84750239206', '3671010023206', 'Tangerang', '2001-11-21', 'Perempuan', '08965766206', 'Jl. Lamda 3 No. 206', 'Islam', 7, 1, '150000.00', 1, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(207, 1, 'P20221207', 'Cut Naila Fadia Fiadharma 207', '84750239207', '3671010023207', 'Tangerang', '2001-06-21', 'Perempuan', '08965766207', 'Jl. Lamda 3 No. 207', 'Islam', 13, 11, '150000.00', 1, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(208, 1, 'P20221208', 'Cut Naila Fadia Fiadharma 208', '84750239208', '3671010023208', 'Tangerang', '2001-09-05', 'Perempuan', '08965766208', 'Jl. Lamda 3 No. 208', 'Islam', 8, 13, '150000.00', 2, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(209, 3, 'P20223209', 'Cut Naila Fadia Fiadharma 209', '84750239209', '3671010023209', 'Tangerang', '2001-12-13', 'Perempuan', '08965766209', 'Jl. Lamda 3 No. 209', 'Islam', 1, 12, NULL, NULL, '0', '2022-12-11 07:08:12', NULL, NULL, NULL),
(210, 3, 'P20223210', 'Cut Naila Fadia Fiadharma 210', '84750239210', '3671010023210', 'Jakarta', '2001-11-06', 'Laki-Laki', '08965766210', 'Jl. Lamda 3 No. 210', 'Islam', 6, 5, NULL, NULL, '0', '2022-12-11 07:08:12', NULL, NULL, NULL);
INSERT INTO `pendaftar` (`id_pendaftar`, `id_jalur`, `no_pendaftar`, `nama`, `nisn`, `nik`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `no_hp`, `alamat`, `agama`, `id_prodi1`, `id_prodi2`, `nominal_bayar`, `id_bank`, `is_bayar`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(211, 2, 'P20222211', 'Cut Naila Fadia Fiadharma 211', '84750239211', '3671010023211', 'Tangerang', '2001-09-17', 'Perempuan', '08965766211', 'Jl. Lamda 3 No. 211', 'Islam', 4, 11, '150000.00', 4, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(212, 1, 'P20221212', 'Cut Naila Fadia Fiadharma 212', '84750239212', '3671010023212', 'Tangerang', '2001-08-27', 'Perempuan', '08965766212', 'Jl. Lamda 3 No. 212', 'Islam', 13, 1, '150000.00', 1, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(213, 2, 'P20222213', 'Cut Naila Fadia Fiadharma 213', '84750239213', '3671010023213', 'Tangerang', '2001-11-04', 'Perempuan', '08965766213', 'Jl. Lamda 3 No. 213', 'Islam', 3, 12, '150000.00', 3, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(214, 1, 'P20221214', 'Cut Naila Fadia Fiadharma 214', '84750239214', '3671010023214', 'Tangerang', '2001-11-04', 'Perempuan', '08965766214', 'Jl. Lamda 3 No. 214', 'Islam', 8, 3, '150000.00', 1, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(215, 2, 'P20222215', 'Cut Naila Fadia Fiadharma 215', '84750239215', '3671010023215', 'Jakarta', '2001-06-27', 'Laki-Laki', '08965766215', 'Jl. Lamda 3 No. 215', 'Islam', 6, 10, '150000.00', 4, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(216, 1, 'P20221216', 'Cut Naila Fadia Fiadharma 216', '84750239216', '3671010023216', 'Tangerang', '2001-07-17', 'Perempuan', '08965766216', 'Jl. Lamda 3 No. 216', 'Islam', 5, 6, '150000.00', 4, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(217, 1, 'P20221217', 'Cut Naila Fadia Fiadharma 217', '84750239217', '3671010023217', 'Tangerang', '2001-07-21', 'Perempuan', '08965766217', 'Jl. Lamda 3 No. 217', 'Islam', 13, 13, '150000.00', 2, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(218, 1, 'P20221218', 'Cut Naila Fadia Fiadharma 218', '84750239218', '3671010023218', 'Tangerang', '2001-11-09', 'Perempuan', '08965766218', 'Jl. Lamda 3 No. 218', 'Islam', 2, 2, '150000.00', 3, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(219, 2, 'P20222219', 'Cut Naila Fadia Fiadharma 219', '84750239219', '3671010023219', 'Tangerang', '2001-08-26', 'Perempuan', '08965766219', 'Jl. Lamda 3 No. 219', 'Islam', 7, 4, '150000.00', 2, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(220, 2, 'P20222220', 'Cut Naila Fadia Fiadharma 220', '84750239220', '3671010023220', 'Jakarta', '2001-09-14', 'Laki-Laki', '08965766220', 'Jl. Lamda 3 No. 220', 'Islam', 6, 1, '150000.00', 1, '1', '2022-12-11 07:08:12', NULL, NULL, NULL),
(221, 3, 'P20223221', 'Cut Naila Fadia Fiadharma 221', '84750239221', '3671010023221', 'Tangerang', '2001-12-12', 'Perempuan', '08965766221', 'Jl. Lamda 3 No. 221', 'Islam', 4, 13, NULL, NULL, '0', '2022-12-11 07:08:12', NULL, NULL, NULL),
(222, 3, 'P20223222', 'Cut Naila Fadia Fiadharma 222', '84750239222', '3671010023222', 'Tangerang', '2001-07-19', 'Perempuan', '08965766222', 'Jl. Lamda 3 No. 222', 'Islam', 2, 11, NULL, NULL, '0', '2022-12-11 07:08:12', NULL, NULL, NULL),
(223, 3, 'P20223223', 'Cut Naila Fadia Fiadharma 223', '84750239223', '3671010023223', 'Tangerang', '2001-11-28', 'Perempuan', '08965766223', 'Jl. Lamda 3 No. 223', 'Islam', 13, 8, NULL, NULL, '0', '2022-12-11 07:08:12', NULL, NULL, NULL),
(224, 3, 'P20223224', 'Cut Naila Fadia Fiadharma 224', '84750239224', '3671010023224', 'Tangerang', '2001-07-27', 'Perempuan', '08965766224', 'Jl. Lamda 3 No. 224', 'Islam', 13, 11, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(225, 1, 'P20221225', 'Cut Naila Fadia Fiadharma 225', '84750239225', '3671010023225', 'Jakarta', '2001-09-18', 'Laki-Laki', '08965766225', 'Jl. Lamda 3 No. 225', 'Islam', 9, 8, '150000.00', 1, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(226, 3, 'P20223226', 'Cut Naila Fadia Fiadharma 226', '84750239226', '3671010023226', 'Tangerang', '2001-07-03', 'Perempuan', '08965766226', 'Jl. Lamda 3 No. 226', 'Islam', 6, 5, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(227, 1, 'P20221227', 'Cut Naila Fadia Fiadharma 227', '84750239227', '3671010023227', 'Tangerang', '2001-11-09', 'Perempuan', '08965766227', 'Jl. Lamda 3 No. 227', 'Islam', 9, 4, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(228, 1, 'P20221228', 'Cut Naila Fadia Fiadharma 228', '84750239228', '3671010023228', 'Tangerang', '2001-08-29', 'Perempuan', '08965766228', 'Jl. Lamda 3 No. 228', 'Islam', 1, 8, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(229, 2, 'P20222229', 'Cut Naila Fadia Fiadharma 229', '84750239229', '3671010023229', 'Tangerang', '2001-11-24', 'Perempuan', '08965766229', 'Jl. Lamda 3 No. 229', 'Islam', 13, 10, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(230, 1, 'P20221230', 'Cut Naila Fadia Fiadharma 230', '84750239230', '3671010023230', 'Jakarta', '2001-07-09', 'Laki-Laki', '08965766230', 'Jl. Lamda 3 No. 230', 'Islam', 11, 3, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(231, 2, 'P20222231', 'Cut Naila Fadia Fiadharma 231', '84750239231', '3671010023231', 'Tangerang', '2001-12-03', 'Perempuan', '08965766231', 'Jl. Lamda 3 No. 231', 'Islam', 11, 2, '150000.00', 4, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(232, 1, 'P20221232', 'Cut Naila Fadia Fiadharma 232', '84750239232', '3671010023232', 'Tangerang', '2001-07-24', 'Perempuan', '08965766232', 'Jl. Lamda 3 No. 232', 'Islam', 10, 13, '150000.00', 1, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(233, 2, 'P20222233', 'Cut Naila Fadia Fiadharma 233', '84750239233', '3671010023233', 'Tangerang', '2001-08-15', 'Perempuan', '08965766233', 'Jl. Lamda 3 No. 233', 'Islam', 8, 11, '150000.00', 1, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(234, 1, 'P20221234', 'Cut Naila Fadia Fiadharma 234', '84750239234', '3671010023234', 'Tangerang', '2001-11-04', 'Perempuan', '08965766234', 'Jl. Lamda 3 No. 234', 'Islam', 2, 10, '150000.00', 2, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(235, 2, 'P20222235', 'Cut Naila Fadia Fiadharma 235', '84750239235', '3671010023235', 'Jakarta', '2001-09-22', 'Laki-Laki', '08965766235', 'Jl. Lamda 3 No. 235', 'Islam', 13, 2, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(236, 3, 'P20223236', 'Cut Naila Fadia Fiadharma 236', '84750239236', '3671010023236', 'Tangerang', '2001-10-13', 'Perempuan', '08965766236', 'Jl. Lamda 3 No. 236', 'Islam', 13, 3, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(237, 2, 'P20222237', 'Cut Naila Fadia Fiadharma 237', '84750239237', '3671010023237', 'Tangerang', '2001-06-19', 'Perempuan', '08965766237', 'Jl. Lamda 3 No. 237', 'Islam', 12, 7, '150000.00', 4, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(238, 3, 'P20223238', 'Cut Naila Fadia Fiadharma 238', '84750239238', '3671010023238', 'Tangerang', '2001-12-21', 'Perempuan', '08965766238', 'Jl. Lamda 3 No. 238', 'Islam', 4, 6, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(239, 1, 'P20221239', 'Cut Naila Fadia Fiadharma 239', '84750239239', '3671010023239', 'Tangerang', '2001-11-30', 'Perempuan', '08965766239', 'Jl. Lamda 3 No. 239', 'Islam', 5, 13, '150000.00', 2, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(240, 1, 'P20221240', 'Cut Naila Fadia Fiadharma 240', '84750239240', '3671010023240', 'Jakarta', '2001-10-06', 'Laki-Laki', '08965766240', 'Jl. Lamda 3 No. 240', 'Islam', 1, 3, '150000.00', 4, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(241, 2, 'P20222241', 'Cut Naila Fadia Fiadharma 241', '84750239241', '3671010023241', 'Tangerang', '2001-06-22', 'Perempuan', '08965766241', 'Jl. Lamda 3 No. 241', 'Islam', 4, 9, '150000.00', 2, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(242, 3, 'P20223242', 'Cut Naila Fadia Fiadharma 242', '84750239242', '3671010023242', 'Tangerang', '2001-09-07', 'Perempuan', '08965766242', 'Jl. Lamda 3 No. 242', 'Islam', 13, 8, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(243, 3, 'P20223243', 'Cut Naila Fadia Fiadharma 243', '84750239243', '3671010023243', 'Tangerang', '2001-12-21', 'Perempuan', '08965766243', 'Jl. Lamda 3 No. 243', 'Islam', 11, 4, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(244, 2, 'P20222244', 'Cut Naila Fadia Fiadharma 244', '84750239244', '3671010023244', 'Tangerang', '2001-12-17', 'Perempuan', '08965766244', 'Jl. Lamda 3 No. 244', 'Islam', 12, 4, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(245, 3, 'P20223245', 'Cut Naila Fadia Fiadharma 245', '84750239245', '3671010023245', 'Jakarta', '2001-12-14', 'Laki-Laki', '08965766245', 'Jl. Lamda 3 No. 245', 'Islam', 10, 5, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(246, 1, 'P20221246', 'Cut Naila Fadia Fiadharma 246', '84750239246', '3671010023246', 'Tangerang', '2001-07-23', 'Perempuan', '08965766246', 'Jl. Lamda 3 No. 246', 'Islam', 12, 3, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(247, 1, 'P20221247', 'Cut Naila Fadia Fiadharma 247', '84750239247', '3671010023247', 'Tangerang', '2001-12-21', 'Perempuan', '08965766247', 'Jl. Lamda 3 No. 247', 'Islam', 1, 4, '150000.00', 4, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(248, 2, 'P20222248', 'Cut Naila Fadia Fiadharma 248', '84750239248', '3671010023248', 'Tangerang', '2001-12-20', 'Perempuan', '08965766248', 'Jl. Lamda 3 No. 248', 'Islam', 4, 7, '150000.00', 4, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(249, 2, 'P20222249', 'Cut Naila Fadia Fiadharma 249', '84750239249', '3671010023249', 'Tangerang', '2001-09-13', 'Perempuan', '08965766249', 'Jl. Lamda 3 No. 249', 'Islam', 6, 13, '150000.00', 4, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(250, 2, 'P20222250', 'Cut Naila Fadia Fiadharma 250', '84750239250', '3671010023250', 'Jakarta', '2001-10-01', 'Laki-Laki', '08965766250', 'Jl. Lamda 3 No. 250', 'Islam', 13, 8, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(251, 3, 'P20223251', 'Cut Naila Fadia Fiadharma 251', '84750239251', '3671010023251', 'Tangerang', '2001-12-12', 'Perempuan', '08965766251', 'Jl. Lamda 3 No. 251', 'Islam', 3, 12, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(252, 3, 'P20223252', 'Cut Naila Fadia Fiadharma 252', '84750239252', '3671010023252', 'Tangerang', '2001-06-30', 'Perempuan', '08965766252', 'Jl. Lamda 3 No. 252', 'Islam', 4, 9, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(253, 1, 'P20221253', 'Cut Naila Fadia Fiadharma 253', '84750239253', '3671010023253', 'Tangerang', '2001-07-05', 'Perempuan', '08965766253', 'Jl. Lamda 3 No. 253', 'Islam', 10, 2, '150000.00', 2, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(254, 1, 'P20221254', 'Cut Naila Fadia Fiadharma 254', '84750239254', '3671010023254', 'Tangerang', '2001-11-25', 'Perempuan', '08965766254', 'Jl. Lamda 3 No. 254', 'Islam', 10, 8, '150000.00', 3, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(255, 1, 'P20221255', 'Cut Naila Fadia Fiadharma 255', '84750239255', '3671010023255', 'Jakarta', '2001-12-04', 'Laki-Laki', '08965766255', 'Jl. Lamda 3 No. 255', 'Islam', 10, 5, '150000.00', 1, '1', '2022-12-11 07:08:13', NULL, NULL, NULL),
(256, 3, 'P20223256', 'Cut Naila Fadia Fiadharma 256', '84750239256', '3671010023256', 'Tangerang', '2001-11-30', 'Perempuan', '08965766256', 'Jl. Lamda 3 No. 256', 'Islam', 7, 6, NULL, NULL, '0', '2022-12-11 07:08:13', NULL, NULL, NULL),
(257, 3, 'P20223257', 'Cut Naila Fadia Fiadharma 257', '84750239257', '3671010023257', 'Tangerang', '2001-11-27', 'Perempuan', '08965766257', 'Jl. Lamda 3 No. 257', 'Islam', 7, 10, NULL, NULL, '0', '2022-12-11 07:08:14', NULL, NULL, NULL),
(258, 3, 'P20223258', 'Cut Naila Fadia Fiadharma 258', '84750239258', '3671010023258', 'Tangerang', '2001-10-03', 'Perempuan', '08965766258', 'Jl. Lamda 3 No. 258', 'Islam', 12, 3, NULL, NULL, '0', '2022-12-11 07:08:14', NULL, NULL, NULL),
(259, 1, 'P20221259', 'Cut Naila Fadia Fiadharma 259', '84750239259', '3671010023259', 'Tangerang', '2001-08-04', 'Perempuan', '08965766259', 'Jl. Lamda 3 No. 259', 'Islam', 6, 11, '150000.00', 4, '1', '2022-12-11 07:08:14', NULL, NULL, NULL),
(260, 2, 'P20222260', 'Cut Naila Fadia Fiadharma 260', '84750239260', '3671010023260', 'Jakarta', '2001-12-24', 'Laki-Laki', '08965766260', 'Jl. Lamda 3 No. 260', 'Islam', 9, 3, '150000.00', 2, '1', '2022-12-11 07:08:14', NULL, NULL, NULL),
(261, 2, 'P20222261', 'Cut Naila Fadia Fiadharma 261', '84750239261', '3671010023261', 'Tangerang', '2001-09-01', 'Perempuan', '08965766261', 'Jl. Lamda 3 No. 261', 'Islam', 8, 3, '150000.00', 3, '1', '2022-12-11 07:08:14', NULL, NULL, NULL),
(262, 3, 'P20223262', 'Cut Naila Fadia Fiadharma 262', '84750239262', '3671010023262', 'Tangerang', '2001-06-27', 'Perempuan', '08965766262', 'Jl. Lamda 3 No. 262', 'Islam', 12, 9, NULL, NULL, '0', '2022-12-11 07:08:14', NULL, NULL, NULL),
(263, 2, 'P20222263', 'Cut Naila Fadia Fiadharma 263', '84750239263', '3671010023263', 'Tangerang', '2001-06-18', 'Perempuan', '08965766263', 'Jl. Lamda 3 No. 263', 'Islam', 13, 6, '150000.00', 2, '1', '2022-12-11 07:08:14', NULL, NULL, NULL),
(264, 1, 'P20221264', 'Cut Naila Fadia Fiadharma 264', '84750239264', '3671010023264', 'Tangerang', '2001-11-05', 'Perempuan', '08965766264', 'Jl. Lamda 3 No. 264', 'Islam', 2, 3, '150000.00', 4, '1', '2022-12-11 07:08:14', NULL, NULL, NULL),
(265, 3, 'P20223265', 'Cut Naila Fadia Fiadharma 265', '84750239265', '3671010023265', 'Jakarta', '2001-07-04', 'Laki-Laki', '08965766265', 'Jl. Lamda 3 No. 265', 'Islam', 4, 7, NULL, NULL, '0', '2022-12-11 07:08:14', NULL, NULL, NULL),
(266, 3, 'P20223266', 'Cut Naila Fadia Fiadharma 266', '84750239266', '3671010023266', 'Tangerang', '2001-09-28', 'Perempuan', '08965766266', 'Jl. Lamda 3 No. 266', 'Islam', 4, 12, NULL, NULL, '0', '2022-12-11 07:08:14', NULL, NULL, NULL),
(267, 2, 'P20222267', 'Cut Naila Fadia Fiadharma 267', '84750239267', '3671010023267', 'Tangerang', '2001-09-14', 'Perempuan', '08965766267', 'Jl. Lamda 3 No. 267', 'Islam', 3, 2, '150000.00', 1, '1', '2022-12-11 07:08:14', NULL, NULL, NULL),
(268, 3, 'P20223268', 'Cut Naila Fadia Fiadharma 268', '84750239268', '3671010023268', 'Tangerang', '2001-11-17', 'Perempuan', '08965766268', 'Jl. Lamda 3 No. 268', 'Islam', 13, 11, NULL, NULL, '0', '2022-12-11 07:08:14', NULL, NULL, NULL),
(269, 3, 'P20223269', 'Cut Naila Fadia Fiadharma 269', '84750239269', '3671010023269', 'Tangerang', '2001-12-11', 'Perempuan', '08965766269', 'Jl. Lamda 3 No. 269', 'Islam', 9, 4, NULL, NULL, '0', '2022-12-11 07:08:14', NULL, NULL, NULL),
(270, 2, 'P20222270', 'Cut Naila Fadia Fiadharma 270', '84750239270', '3671010023270', 'Jakarta', '2001-11-09', 'Laki-Laki', '08965766270', 'Jl. Lamda 3 No. 270', 'Islam', 8, 10, '150000.00', 1, '1', '2022-12-11 07:08:14', NULL, NULL, NULL),
(271, 3, 'P20223271', 'Cut Naila Fadia Fiadharma 271', '84750239271', '3671010023271', 'Tangerang', '2001-06-30', 'Perempuan', '08965766271', 'Jl. Lamda 3 No. 271', 'Islam', 12, 2, NULL, NULL, '0', '2022-12-11 07:08:14', NULL, NULL, NULL),
(272, 3, 'P20223272', 'Cut Naila Fadia Fiadharma 272', '84750239272', '3671010023272', 'Tangerang', '2001-12-04', 'Perempuan', '08965766272', 'Jl. Lamda 3 No. 272', 'Islam', 5, 1, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(273, 3, 'P20223273', 'Cut Naila Fadia Fiadharma 273', '84750239273', '3671010023273', 'Tangerang', '2001-06-20', 'Perempuan', '08965766273', 'Jl. Lamda 3 No. 273', 'Islam', 1, 10, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(274, 2, 'P20222274', 'Cut Naila Fadia Fiadharma 274', '84750239274', '3671010023274', 'Tangerang', '2001-07-22', 'Perempuan', '08965766274', 'Jl. Lamda 3 No. 274', 'Islam', 6, 13, '150000.00', 3, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(275, 3, 'P20223275', 'Cut Naila Fadia Fiadharma 275', '84750239275', '3671010023275', 'Jakarta', '2001-07-06', 'Laki-Laki', '08965766275', 'Jl. Lamda 3 No. 275', 'Islam', 4, 5, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(276, 3, 'P20223276', 'Cut Naila Fadia Fiadharma 276', '84750239276', '3671010023276', 'Tangerang', '2001-11-14', 'Perempuan', '08965766276', 'Jl. Lamda 3 No. 276', 'Islam', 13, 7, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(277, 1, 'P20221277', 'Cut Naila Fadia Fiadharma 277', '84750239277', '3671010023277', 'Tangerang', '2001-12-09', 'Perempuan', '08965766277', 'Jl. Lamda 3 No. 277', 'Islam', 12, 1, '150000.00', 4, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(278, 2, 'P20222278', 'Cut Naila Fadia Fiadharma 278', '84750239278', '3671010023278', 'Tangerang', '2001-12-03', 'Perempuan', '08965766278', 'Jl. Lamda 3 No. 278', 'Islam', 6, 2, '150000.00', 4, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(279, 3, 'P20223279', 'Cut Naila Fadia Fiadharma 279', '84750239279', '3671010023279', 'Tangerang', '2001-06-28', 'Perempuan', '08965766279', 'Jl. Lamda 3 No. 279', 'Islam', 5, 9, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(280, 1, 'P20221280', 'Cut Naila Fadia Fiadharma 280', '84750239280', '3671010023280', 'Jakarta', '2001-09-06', 'Laki-Laki', '08965766280', 'Jl. Lamda 3 No. 280', 'Islam', 3, 7, '150000.00', 3, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(281, 3, 'P20223281', 'Cut Naila Fadia Fiadharma 281', '84750239281', '3671010023281', 'Tangerang', '2001-10-01', 'Perempuan', '08965766281', 'Jl. Lamda 3 No. 281', 'Islam', 2, 13, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(282, 1, 'P20221282', 'Cut Naila Fadia Fiadharma 282', '84750239282', '3671010023282', 'Tangerang', '2001-07-08', 'Perempuan', '08965766282', 'Jl. Lamda 3 No. 282', 'Islam', 4, 7, '150000.00', 2, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(283, 3, 'P20223283', 'Cut Naila Fadia Fiadharma 283', '84750239283', '3671010023283', 'Tangerang', '2001-09-14', 'Perempuan', '08965766283', 'Jl. Lamda 3 No. 283', 'Islam', 11, 4, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(284, 2, 'P20222284', 'Cut Naila Fadia Fiadharma 284', '84750239284', '3671010023284', 'Tangerang', '2001-07-15', 'Perempuan', '08965766284', 'Jl. Lamda 3 No. 284', 'Islam', 8, 1, '150000.00', 1, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(285, 3, 'P20223285', 'Cut Naila Fadia Fiadharma 285', '84750239285', '3671010023285', 'Jakarta', '2001-09-02', 'Laki-Laki', '08965766285', 'Jl. Lamda 3 No. 285', 'Islam', 4, 8, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(286, 3, 'P20223286', 'Cut Naila Fadia Fiadharma 286', '84750239286', '3671010023286', 'Tangerang', '2001-12-20', 'Perempuan', '08965766286', 'Jl. Lamda 3 No. 286', 'Islam', 9, 9, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(287, 1, 'P20221287', 'Cut Naila Fadia Fiadharma 287', '84750239287', '3671010023287', 'Tangerang', '2001-10-14', 'Perempuan', '08965766287', 'Jl. Lamda 3 No. 287', 'Islam', 4, 2, '150000.00', 2, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(288, 1, 'P20221288', 'Cut Naila Fadia Fiadharma 288', '84750239288', '3671010023288', 'Tangerang', '2001-10-19', 'Perempuan', '08965766288', 'Jl. Lamda 3 No. 288', 'Islam', 3, 13, '150000.00', 3, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(289, 1, 'P20221289', 'Cut Naila Fadia Fiadharma 289', '84750239289', '3671010023289', 'Tangerang', '2001-09-24', 'Perempuan', '08965766289', 'Jl. Lamda 3 No. 289', 'Islam', 6, 11, '150000.00', 2, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(290, 1, 'P20221290', 'Cut Naila Fadia Fiadharma 290', '84750239290', '3671010023290', 'Jakarta', '2001-10-21', 'Laki-Laki', '08965766290', 'Jl. Lamda 3 No. 290', 'Islam', 2, 4, '150000.00', 3, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(291, 3, 'P20223291', 'Cut Naila Fadia Fiadharma 291', '84750239291', '3671010023291', 'Tangerang', '2001-12-14', 'Perempuan', '08965766291', 'Jl. Lamda 3 No. 291', 'Islam', 1, 5, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(292, 3, 'P20223292', 'Cut Naila Fadia Fiadharma 292', '84750239292', '3671010023292', 'Tangerang', '2001-11-17', 'Perempuan', '08965766292', 'Jl. Lamda 3 No. 292', 'Islam', 12, 13, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(293, 3, 'P20223293', 'Cut Naila Fadia Fiadharma 293', '84750239293', '3671010023293', 'Tangerang', '2001-08-04', 'Perempuan', '08965766293', 'Jl. Lamda 3 No. 293', 'Islam', 3, 6, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(294, 3, 'P20223294', 'Cut Naila Fadia Fiadharma 294', '84750239294', '3671010023294', 'Tangerang', '2001-12-04', 'Perempuan', '08965766294', 'Jl. Lamda 3 No. 294', 'Islam', 13, 5, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(295, 3, 'P20223295', 'Cut Naila Fadia Fiadharma 295', '84750239295', '3671010023295', 'Jakarta', '2001-10-05', 'Laki-Laki', '08965766295', 'Jl. Lamda 3 No. 295', 'Islam', 2, 8, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(296, 1, 'P20221296', 'Cut Naila Fadia Fiadharma 296', '84750239296', '3671010023296', 'Tangerang', '2001-10-23', 'Perempuan', '08965766296', 'Jl. Lamda 3 No. 296', 'Islam', 2, 7, '150000.00', 3, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(297, 3, 'P20223297', 'Cut Naila Fadia Fiadharma 297', '84750239297', '3671010023297', 'Tangerang', '2001-10-01', 'Perempuan', '08965766297', 'Jl. Lamda 3 No. 297', 'Islam', 6, 8, NULL, NULL, '0', '2022-12-11 07:08:15', NULL, NULL, NULL),
(298, 2, 'P20222298', 'Cut Naila Fadia Fiadharma 298', '84750239298', '3671010023298', 'Tangerang', '2001-11-10', 'Perempuan', '08965766298', 'Jl. Lamda 3 No. 298', 'Islam', 10, 8, '150000.00', 3, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(299, 1, 'P20221299', 'Cut Naila Fadia Fiadharma 299', '84750239299', '3671010023299', 'Tangerang', '2001-11-09', 'Perempuan', '08965766299', 'Jl. Lamda 3 No. 299', 'Islam', 6, 6, '150000.00', 4, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(300, 2, 'P20222300', 'Cut Naila Fadia Fiadharma 300', '84750239300', '3671010023300', 'Jakarta', '2001-10-19', 'Laki-Laki', '08965766300', 'Jl. Lamda 3 No. 300', 'Islam', 8, 2, '150000.00', 2, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(301, 2, 'P20222301', 'Cut Naila Fadia Fiadharma 301', '84750239301', '3671010023301', 'Tangerang', '2001-08-24', 'Perempuan', '08965766301', 'Jl. Lamda 3 No. 301', 'Islam', 12, 4, '150000.00', 2, '1', '2022-12-11 07:08:15', NULL, NULL, NULL),
(302, 2, 'P20222302', 'Cut Naila Fadia Fiadharma 302', '84750239302', '3671010023302', 'Tangerang', '2001-07-15', 'Perempuan', '08965766302', 'Jl. Lamda 3 No. 302', 'Islam', 1, 3, '150000.00', 2, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(303, 2, 'P20222303', 'Cut Naila Fadia Fiadharma 303', '84750239303', '3671010023303', 'Tangerang', '2001-07-17', 'Perempuan', '08965766303', 'Jl. Lamda 3 No. 303', 'Islam', 4, 6, '150000.00', 3, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(304, 3, 'P20223304', 'Cut Naila Fadia Fiadharma 304', '84750239304', '3671010023304', 'Tangerang', '2001-10-23', 'Perempuan', '08965766304', 'Jl. Lamda 3 No. 304', 'Islam', 9, 13, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(305, 2, 'P20222305', 'Cut Naila Fadia Fiadharma 305', '84750239305', '3671010023305', 'Jakarta', '2001-06-18', 'Laki-Laki', '08965766305', 'Jl. Lamda 3 No. 305', 'Islam', 3, 9, '150000.00', 1, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(306, 3, 'P20223306', 'Cut Naila Fadia Fiadharma 306', '84750239306', '3671010023306', 'Tangerang', '2001-10-27', 'Perempuan', '08965766306', 'Jl. Lamda 3 No. 306', 'Islam', 12, 3, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(307, 1, 'P20221307', 'Cut Naila Fadia Fiadharma 307', '84750239307', '3671010023307', 'Tangerang', '2001-10-18', 'Perempuan', '08965766307', 'Jl. Lamda 3 No. 307', 'Islam', 12, 9, '150000.00', 2, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(308, 2, 'P20222308', 'Cut Naila Fadia Fiadharma 308', '84750239308', '3671010023308', 'Tangerang', '2001-09-20', 'Perempuan', '08965766308', 'Jl. Lamda 3 No. 308', 'Islam', 6, 7, '150000.00', 4, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(309, 1, 'P20221309', 'Cut Naila Fadia Fiadharma 309', '84750239309', '3671010023309', 'Tangerang', '2001-10-19', 'Perempuan', '08965766309', 'Jl. Lamda 3 No. 309', 'Islam', 11, 1, '150000.00', 2, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(310, 3, 'P20223310', 'Cut Naila Fadia Fiadharma 310', '84750239310', '3671010023310', 'Jakarta', '2001-12-15', 'Laki-Laki', '08965766310', 'Jl. Lamda 3 No. 310', 'Islam', 12, 4, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(311, 2, 'P20222311', 'Cut Naila Fadia Fiadharma 311', '84750239311', '3671010023311', 'Tangerang', '2001-09-13', 'Perempuan', '08965766311', 'Jl. Lamda 3 No. 311', 'Islam', 7, 2, '150000.00', 3, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(312, 1, 'P20221312', 'Cut Naila Fadia Fiadharma 312', '84750239312', '3671010023312', 'Tangerang', '2001-07-23', 'Perempuan', '08965766312', 'Jl. Lamda 3 No. 312', 'Islam', 6, 12, '150000.00', 4, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(313, 1, 'P20221313', 'Cut Naila Fadia Fiadharma 313', '84750239313', '3671010023313', 'Tangerang', '2001-11-25', 'Perempuan', '08965766313', 'Jl. Lamda 3 No. 313', 'Islam', 1, 13, '150000.00', 1, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(314, 3, 'P20223314', 'Cut Naila Fadia Fiadharma 314', '84750239314', '3671010023314', 'Tangerang', '2001-09-11', 'Perempuan', '08965766314', 'Jl. Lamda 3 No. 314', 'Islam', 10, 9, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(315, 2, 'P20222315', 'Cut Naila Fadia Fiadharma 315', '84750239315', '3671010023315', 'Jakarta', '2001-10-06', 'Laki-Laki', '08965766315', 'Jl. Lamda 3 No. 315', 'Islam', 13, 9, '150000.00', 2, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(316, 3, 'P20223316', 'Cut Naila Fadia Fiadharma 316', '84750239316', '3671010023316', 'Tangerang', '2001-09-25', 'Perempuan', '08965766316', 'Jl. Lamda 3 No. 316', 'Islam', 11, 8, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(317, 2, 'P20222317', 'Cut Naila Fadia Fiadharma 317', '84750239317', '3671010023317', 'Tangerang', '2001-10-25', 'Perempuan', '08965766317', 'Jl. Lamda 3 No. 317', 'Islam', 11, 8, '150000.00', 1, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(318, 1, 'P20221318', 'Cut Naila Fadia Fiadharma 318', '84750239318', '3671010023318', 'Tangerang', '2001-12-17', 'Perempuan', '08965766318', 'Jl. Lamda 3 No. 318', 'Islam', 5, 6, '150000.00', 2, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(319, 1, 'P20221319', 'Cut Naila Fadia Fiadharma 319', '84750239319', '3671010023319', 'Tangerang', '2001-09-23', 'Perempuan', '08965766319', 'Jl. Lamda 3 No. 319', 'Islam', 3, 5, '150000.00', 3, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(320, 3, 'P20223320', 'Cut Naila Fadia Fiadharma 320', '84750239320', '3671010023320', 'Jakarta', '2001-09-30', 'Laki-Laki', '08965766320', 'Jl. Lamda 3 No. 320', 'Islam', 1, 1, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(321, 2, 'P20222321', 'Cut Naila Fadia Fiadharma 321', '84750239321', '3671010023321', 'Tangerang', '2001-11-16', 'Perempuan', '08965766321', 'Jl. Lamda 3 No. 321', 'Islam', 13, 1, '150000.00', 2, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(322, 3, 'P20223322', 'Cut Naila Fadia Fiadharma 322', '84750239322', '3671010023322', 'Tangerang', '2001-11-03', 'Perempuan', '08965766322', 'Jl. Lamda 3 No. 322', 'Islam', 12, 3, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(323, 3, 'P20223323', 'Cut Naila Fadia Fiadharma 323', '84750239323', '3671010023323', 'Tangerang', '2001-12-25', 'Perempuan', '08965766323', 'Jl. Lamda 3 No. 323', 'Islam', 10, 11, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(324, 3, 'P20223324', 'Cut Naila Fadia Fiadharma 324', '84750239324', '3671010023324', 'Tangerang', '2001-07-29', 'Perempuan', '08965766324', 'Jl. Lamda 3 No. 324', 'Islam', 13, 8, NULL, NULL, '0', '2022-12-11 07:08:16', NULL, NULL, NULL),
(325, 2, 'P20222325', 'Cut Naila Fadia Fiadharma 325', '84750239325', '3671010023325', 'Jakarta', '2001-09-07', 'Laki-Laki', '08965766325', 'Jl. Lamda 3 No. 325', 'Islam', 1, 5, '150000.00', 4, '1', '2022-12-11 07:08:16', NULL, NULL, NULL),
(326, 1, 'P20221326', 'Cut Naila Fadia Fiadharma 326', '84750239326', '3671010023326', 'Tangerang', '2001-07-21', 'Perempuan', '08965766326', 'Jl. Lamda 3 No. 326', 'Islam', 9, 13, '150000.00', 4, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(327, 1, 'P20221327', 'Cut Naila Fadia Fiadharma 327', '84750239327', '3671010023327', 'Tangerang', '2001-11-19', 'Perempuan', '08965766327', 'Jl. Lamda 3 No. 327', 'Islam', 2, 5, '150000.00', 3, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(328, 2, 'P20222328', 'Cut Naila Fadia Fiadharma 328', '84750239328', '3671010023328', 'Tangerang', '2001-08-23', 'Perempuan', '08965766328', 'Jl. Lamda 3 No. 328', 'Islam', 4, 1, '150000.00', 2, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(329, 2, 'P20222329', 'Cut Naila Fadia Fiadharma 329', '84750239329', '3671010023329', 'Tangerang', '2001-12-16', 'Perempuan', '08965766329', 'Jl. Lamda 3 No. 329', 'Islam', 2, 13, '150000.00', 1, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(330, 3, 'P20223330', 'Cut Naila Fadia Fiadharma 330', '84750239330', '3671010023330', 'Jakarta', '2001-10-25', 'Laki-Laki', '08965766330', 'Jl. Lamda 3 No. 330', 'Islam', 12, 10, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(331, 2, 'P20222331', 'Cut Naila Fadia Fiadharma 331', '84750239331', '3671010023331', 'Tangerang', '2001-11-24', 'Perempuan', '08965766331', 'Jl. Lamda 3 No. 331', 'Islam', 13, 3, '150000.00', 2, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(332, 3, 'P20223332', 'Cut Naila Fadia Fiadharma 332', '84750239332', '3671010023332', 'Tangerang', '2001-06-20', 'Perempuan', '08965766332', 'Jl. Lamda 3 No. 332', 'Islam', 11, 10, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(333, 3, 'P20223333', 'Cut Naila Fadia Fiadharma 333', '84750239333', '3671010023333', 'Tangerang', '2001-09-27', 'Perempuan', '08965766333', 'Jl. Lamda 3 No. 333', 'Islam', 5, 5, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(334, 2, 'P20222334', 'Cut Naila Fadia Fiadharma 334', '84750239334', '3671010023334', 'Tangerang', '2001-12-01', 'Perempuan', '08965766334', 'Jl. Lamda 3 No. 334', 'Islam', 4, 13, '150000.00', 1, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(335, 3, 'P20223335', 'Cut Naila Fadia Fiadharma 335', '84750239335', '3671010023335', 'Jakarta', '2001-12-09', 'Laki-Laki', '08965766335', 'Jl. Lamda 3 No. 335', 'Islam', 10, 12, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(336, 3, 'P20223336', 'Cut Naila Fadia Fiadharma 336', '84750239336', '3671010023336', 'Tangerang', '2001-11-08', 'Perempuan', '08965766336', 'Jl. Lamda 3 No. 336', 'Islam', 12, 5, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(337, 2, 'P20222337', 'Cut Naila Fadia Fiadharma 337', '84750239337', '3671010023337', 'Tangerang', '2001-08-02', 'Perempuan', '08965766337', 'Jl. Lamda 3 No. 337', 'Islam', 12, 9, '150000.00', 1, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(338, 3, 'P20223338', 'Cut Naila Fadia Fiadharma 338', '84750239338', '3671010023338', 'Tangerang', '2001-12-22', 'Perempuan', '08965766338', 'Jl. Lamda 3 No. 338', 'Islam', 3, 12, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(339, 2, 'P20222339', 'Cut Naila Fadia Fiadharma 339', '84750239339', '3671010023339', 'Tangerang', '2001-10-10', 'Perempuan', '08965766339', 'Jl. Lamda 3 No. 339', 'Islam', 6, 8, '150000.00', 3, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(340, 3, 'P20223340', 'Cut Naila Fadia Fiadharma 340', '84750239340', '3671010023340', 'Jakarta', '2001-11-27', 'Laki-Laki', '08965766340', 'Jl. Lamda 3 No. 340', 'Islam', 3, 6, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(341, 2, 'P20222341', 'Cut Naila Fadia Fiadharma 341', '84750239341', '3671010023341', 'Tangerang', '2001-09-19', 'Perempuan', '08965766341', 'Jl. Lamda 3 No. 341', 'Islam', 9, 1, '150000.00', 3, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(342, 3, 'P20223342', 'Cut Naila Fadia Fiadharma 342', '84750239342', '3671010023342', 'Tangerang', '2001-09-10', 'Perempuan', '08965766342', 'Jl. Lamda 3 No. 342', 'Islam', 5, 13, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(343, 3, 'P20223343', 'Cut Naila Fadia Fiadharma 343', '84750239343', '3671010023343', 'Tangerang', '2001-08-06', 'Perempuan', '08965766343', 'Jl. Lamda 3 No. 343', 'Islam', 12, 5, NULL, NULL, '0', '2022-12-11 07:08:17', NULL, NULL, NULL),
(344, 1, 'P20221344', 'Cut Naila Fadia Fiadharma 344', '84750239344', '3671010023344', 'Tangerang', '2001-07-27', 'Perempuan', '08965766344', 'Jl. Lamda 3 No. 344', 'Islam', 9, 5, '150000.00', 4, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(345, 1, 'P20221345', 'Cut Naila Fadia Fiadharma 345', '84750239345', '3671010023345', 'Jakarta', '2001-10-27', 'Laki-Laki', '08965766345', 'Jl. Lamda 3 No. 345', 'Islam', 13, 4, '150000.00', 4, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(346, 2, 'P20222346', 'Cut Naila Fadia Fiadharma 346', '84750239346', '3671010023346', 'Tangerang', '2001-12-01', 'Perempuan', '08965766346', 'Jl. Lamda 3 No. 346', 'Islam', 10, 7, '150000.00', 4, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(347, 2, 'P20222347', 'Cut Naila Fadia Fiadharma 347', '84750239347', '3671010023347', 'Tangerang', '2001-08-28', 'Perempuan', '08965766347', 'Jl. Lamda 3 No. 347', 'Islam', 7, 5, '150000.00', 1, '1', '2022-12-11 07:08:17', NULL, NULL, NULL),
(348, 3, 'P20223348', 'Cut Naila Fadia Fiadharma 348', '84750239348', '3671010023348', 'Tangerang', '2001-07-16', 'Perempuan', '08965766348', 'Jl. Lamda 3 No. 348', 'Islam', 1, 10, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(349, 1, 'P20221349', 'Cut Naila Fadia Fiadharma 349', '84750239349', '3671010023349', 'Tangerang', '2001-12-09', 'Perempuan', '08965766349', 'Jl. Lamda 3 No. 349', 'Islam', 3, 4, '150000.00', 4, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(350, 3, 'P20223350', 'Cut Naila Fadia Fiadharma 350', '84750239350', '3671010023350', 'Jakarta', '2001-11-21', 'Laki-Laki', '08965766350', 'Jl. Lamda 3 No. 350', 'Islam', 1, 4, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(351, 1, 'P20221351', 'Cut Naila Fadia Fiadharma 351', '84750239351', '3671010023351', 'Tangerang', '2001-07-30', 'Perempuan', '08965766351', 'Jl. Lamda 3 No. 351', 'Islam', 11, 2, '150000.00', 3, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(352, 3, 'P20223352', 'Cut Naila Fadia Fiadharma 352', '84750239352', '3671010023352', 'Tangerang', '2001-09-15', 'Perempuan', '08965766352', 'Jl. Lamda 3 No. 352', 'Islam', 5, 4, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(353, 3, 'P20223353', 'Cut Naila Fadia Fiadharma 353', '84750239353', '3671010023353', 'Tangerang', '2001-11-24', 'Perempuan', '08965766353', 'Jl. Lamda 3 No. 353', 'Islam', 12, 1, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(354, 2, 'P20222354', 'Cut Naila Fadia Fiadharma 354', '84750239354', '3671010023354', 'Tangerang', '2001-10-30', 'Perempuan', '08965766354', 'Jl. Lamda 3 No. 354', 'Islam', 3, 12, '150000.00', 3, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(355, 2, 'P20222355', 'Cut Naila Fadia Fiadharma 355', '84750239355', '3671010023355', 'Jakarta', '2001-07-07', 'Laki-Laki', '08965766355', 'Jl. Lamda 3 No. 355', 'Islam', 1, 5, '150000.00', 2, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(356, 2, 'P20222356', 'Cut Naila Fadia Fiadharma 356', '84750239356', '3671010023356', 'Tangerang', '2001-12-01', 'Perempuan', '08965766356', 'Jl. Lamda 3 No. 356', 'Islam', 2, 13, '150000.00', 1, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(357, 1, 'P20221357', 'Cut Naila Fadia Fiadharma 357', '84750239357', '3671010023357', 'Tangerang', '2001-12-13', 'Perempuan', '08965766357', 'Jl. Lamda 3 No. 357', 'Islam', 3, 12, '150000.00', 1, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(358, 1, 'P20221358', 'Cut Naila Fadia Fiadharma 358', '84750239358', '3671010023358', 'Tangerang', '2001-08-21', 'Perempuan', '08965766358', 'Jl. Lamda 3 No. 358', 'Islam', 7, 8, '150000.00', 3, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(359, 2, 'P20222359', 'Cut Naila Fadia Fiadharma 359', '84750239359', '3671010023359', 'Tangerang', '2001-07-21', 'Perempuan', '08965766359', 'Jl. Lamda 3 No. 359', 'Islam', 13, 5, '150000.00', 1, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(360, 1, 'P20221360', 'Cut Naila Fadia Fiadharma 360', '84750239360', '3671010023360', 'Jakarta', '2001-11-13', 'Laki-Laki', '08965766360', 'Jl. Lamda 3 No. 360', 'Islam', 7, 4, '150000.00', 3, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(361, 1, 'P20221361', 'Cut Naila Fadia Fiadharma 361', '84750239361', '3671010023361', 'Tangerang', '2001-10-23', 'Perempuan', '08965766361', 'Jl. Lamda 3 No. 361', 'Islam', 11, 12, '150000.00', 4, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(362, 3, 'P20223362', 'Cut Naila Fadia Fiadharma 362', '84750239362', '3671010023362', 'Tangerang', '2001-06-19', 'Perempuan', '08965766362', 'Jl. Lamda 3 No. 362', 'Islam', 13, 6, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(363, 3, 'P20223363', 'Cut Naila Fadia Fiadharma 363', '84750239363', '3671010023363', 'Tangerang', '2001-08-05', 'Perempuan', '08965766363', 'Jl. Lamda 3 No. 363', 'Islam', 11, 7, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(364, 2, 'P20222364', 'Cut Naila Fadia Fiadharma 364', '84750239364', '3671010023364', 'Tangerang', '2001-09-28', 'Perempuan', '08965766364', 'Jl. Lamda 3 No. 364', 'Islam', 1, 9, '150000.00', 1, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(365, 2, 'P20222365', 'Cut Naila Fadia Fiadharma 365', '84750239365', '3671010023365', 'Jakarta', '2001-11-18', 'Laki-Laki', '08965766365', 'Jl. Lamda 3 No. 365', 'Islam', 5, 11, '150000.00', 3, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(366, 1, 'P20221366', 'Cut Naila Fadia Fiadharma 366', '84750239366', '3671010023366', 'Tangerang', '2001-08-22', 'Perempuan', '08965766366', 'Jl. Lamda 3 No. 366', 'Islam', 11, 5, '150000.00', 4, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(367, 2, 'P20222367', 'Cut Naila Fadia Fiadharma 367', '84750239367', '3671010023367', 'Tangerang', '2001-11-23', 'Perempuan', '08965766367', 'Jl. Lamda 3 No. 367', 'Islam', 5, 5, '150000.00', 3, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(368, 3, 'P20223368', 'Cut Naila Fadia Fiadharma 368', '84750239368', '3671010023368', 'Tangerang', '2001-11-27', 'Perempuan', '08965766368', 'Jl. Lamda 3 No. 368', 'Islam', 12, 4, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(369, 3, 'P20223369', 'Cut Naila Fadia Fiadharma 369', '84750239369', '3671010023369', 'Tangerang', '2001-12-18', 'Perempuan', '08965766369', 'Jl. Lamda 3 No. 369', 'Islam', 2, 5, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(370, 3, 'P20223370', 'Cut Naila Fadia Fiadharma 370', '84750239370', '3671010023370', 'Jakarta', '2001-10-13', 'Laki-Laki', '08965766370', 'Jl. Lamda 3 No. 370', 'Islam', 13, 8, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(371, 2, 'P20222371', 'Cut Naila Fadia Fiadharma 371', '84750239371', '3671010023371', 'Tangerang', '2001-08-13', 'Perempuan', '08965766371', 'Jl. Lamda 3 No. 371', 'Islam', 1, 5, '150000.00', 1, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(372, 2, 'P20222372', 'Cut Naila Fadia Fiadharma 372', '84750239372', '3671010023372', 'Tangerang', '2001-11-14', 'Perempuan', '08965766372', 'Jl. Lamda 3 No. 372', 'Islam', 6, 10, '150000.00', 4, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(373, 3, 'P20223373', 'Cut Naila Fadia Fiadharma 373', '84750239373', '3671010023373', 'Tangerang', '2001-11-09', 'Perempuan', '08965766373', 'Jl. Lamda 3 No. 373', 'Islam', 3, 4, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(374, 1, 'P20221374', 'Cut Naila Fadia Fiadharma 374', '84750239374', '3671010023374', 'Tangerang', '2001-09-14', 'Perempuan', '08965766374', 'Jl. Lamda 3 No. 374', 'Islam', 12, 9, '150000.00', 4, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(375, 1, 'P20221375', 'Cut Naila Fadia Fiadharma 375', '84750239375', '3671010023375', 'Jakarta', '2001-10-27', 'Laki-Laki', '08965766375', 'Jl. Lamda 3 No. 375', 'Islam', 9, 12, '150000.00', 2, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(376, 3, 'P20223376', 'Cut Naila Fadia Fiadharma 376', '84750239376', '3671010023376', 'Tangerang', '2001-12-08', 'Perempuan', '08965766376', 'Jl. Lamda 3 No. 376', 'Islam', 2, 11, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(377, 1, 'P20221377', 'Cut Naila Fadia Fiadharma 377', '84750239377', '3671010023377', 'Tangerang', '2001-09-14', 'Perempuan', '08965766377', 'Jl. Lamda 3 No. 377', 'Islam', 1, 5, '150000.00', 1, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(378, 2, 'P20222378', 'Cut Naila Fadia Fiadharma 378', '84750239378', '3671010023378', 'Tangerang', '2001-10-04', 'Perempuan', '08965766378', 'Jl. Lamda 3 No. 378', 'Islam', 1, 7, '150000.00', 1, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(379, 1, 'P20221379', 'Cut Naila Fadia Fiadharma 379', '84750239379', '3671010023379', 'Tangerang', '2001-09-10', 'Perempuan', '08965766379', 'Jl. Lamda 3 No. 379', 'Islam', 5, 1, '150000.00', 3, '1', '2022-12-11 07:08:18', NULL, NULL, NULL),
(380, 3, 'P20223380', 'Cut Naila Fadia Fiadharma 380', '84750239380', '3671010023380', 'Jakarta', '2001-07-30', 'Laki-Laki', '08965766380', 'Jl. Lamda 3 No. 380', 'Islam', 9, 13, NULL, NULL, '0', '2022-12-11 07:08:18', NULL, NULL, NULL),
(381, 2, 'P20222381', 'Cut Naila Fadia Fiadharma 381', '84750239381', '3671010023381', 'Tangerang', '2001-07-25', 'Perempuan', '08965766381', 'Jl. Lamda 3 No. 381', 'Islam', 11, 2, '150000.00', 4, '1', '2022-12-11 07:08:19', NULL, NULL, NULL),
(382, 3, 'P20223382', 'Cut Naila Fadia Fiadharma 382', '84750239382', '3671010023382', 'Tangerang', '2001-10-02', 'Perempuan', '08965766382', 'Jl. Lamda 3 No. 382', 'Islam', 7, 7, NULL, NULL, '0', '2022-12-11 07:08:19', NULL, NULL, NULL),
(383, 1, 'P20221383', 'Cut Naila Fadia Fiadharma 383', '84750239383', '3671010023383', 'Tangerang', '2001-08-14', 'Perempuan', '08965766383', 'Jl. Lamda 3 No. 383', 'Islam', 8, 7, '150000.00', 1, '1', '2022-12-11 07:08:19', NULL, NULL, NULL),
(384, 3, 'P20223384', 'Cut Naila Fadia Fiadharma 384', '84750239384', '3671010023384', 'Tangerang', '2001-08-09', 'Perempuan', '08965766384', 'Jl. Lamda 3 No. 384', 'Islam', 8, 1, NULL, NULL, '0', '2022-12-11 07:08:19', NULL, NULL, NULL),
(385, 1, 'P20221385', 'Cut Naila Fadia Fiadharma 385', '84750239385', '3671010023385', 'Jakarta', '2001-10-28', 'Laki-Laki', '08965766385', 'Jl. Lamda 3 No. 385', 'Islam', 13, 2, '150000.00', 2, '1', '2022-12-11 07:08:19', NULL, NULL, NULL),
(386, 3, 'P20223386', 'Cut Naila Fadia Fiadharma 386', '84750239386', '3671010023386', 'Tangerang', '2001-07-18', 'Perempuan', '08965766386', 'Jl. Lamda 3 No. 386', 'Islam', 9, 10, NULL, NULL, '0', '2022-12-11 07:08:19', NULL, NULL, NULL),
(387, 3, 'P20223387', 'Cut Naila Fadia Fiadharma 387', '84750239387', '3671010023387', 'Tangerang', '2001-12-15', 'Perempuan', '08965766387', 'Jl. Lamda 3 No. 387', 'Islam', 4, 5, NULL, NULL, '0', '2022-12-11 07:08:19', NULL, NULL, NULL),
(388, 3, 'P20223388', 'Cut Naila Fadia Fiadharma 388', '84750239388', '3671010023388', 'Tangerang', '2001-11-05', 'Perempuan', '08965766388', 'Jl. Lamda 3 No. 388', 'Islam', 13, 4, NULL, NULL, '0', '2022-12-11 07:08:19', NULL, NULL, NULL),
(389, 2, 'P20222389', 'Cut Naila Fadia Fiadharma 389', '84750239389', '3671010023389', 'Tangerang', '2001-11-19', 'Perempuan', '08965766389', 'Jl. Lamda 3 No. 389', 'Islam', 5, 1, '150000.00', 3, '1', '2022-12-11 07:08:19', NULL, NULL, NULL),
(390, 2, 'P20222390', 'Cut Naila Fadia Fiadharma 390', '84750239390', '3671010023390', 'Jakarta', '2001-08-21', 'Laki-Laki', '08965766390', 'Jl. Lamda 3 No. 390', 'Islam', 1, 2, '150000.00', 3, '1', '2022-12-11 07:08:19', NULL, NULL, NULL),
(391, 2, 'P20222391', 'Cut Naila Fadia Fiadharma 391', '84750239391', '3671010023391', 'Tangerang', '2001-08-11', 'Perempuan', '08965766391', 'Jl. Lamda 3 No. 391', 'Islam', 13, 6, '150000.00', 4, '1', '2022-12-11 07:08:19', NULL, NULL, NULL),
(392, 3, 'P20223392', 'Cut Naila Fadia Fiadharma 392', '84750239392', '3671010023392', 'Tangerang', '2001-12-17', 'Perempuan', '08965766392', 'Jl. Lamda 3 No. 392', 'Islam', 3, 1, NULL, NULL, '0', '2022-12-11 07:08:19', NULL, NULL, NULL),
(393, 1, 'P20221393', 'Cut Naila Fadia Fiadharma 393', '84750239393', '3671010023393', 'Tangerang', '2001-11-11', 'Perempuan', '08965766393', 'Jl. Lamda 3 No. 393', 'Islam', 13, 7, '150000.00', 3, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(394, 2, 'P20222394', 'Cut Naila Fadia Fiadharma 394', '84750239394', '3671010023394', 'Tangerang', '2001-07-08', 'Perempuan', '08965766394', 'Jl. Lamda 3 No. 394', 'Islam', 10, 13, '150000.00', 2, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(395, 1, 'P20221395', 'Cut Naila Fadia Fiadharma 395', '84750239395', '3671010023395', 'Jakarta', '2001-12-23', 'Laki-Laki', '08965766395', 'Jl. Lamda 3 No. 395', 'Islam', 7, 12, '150000.00', 3, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(396, 1, 'P20221396', 'Cut Naila Fadia Fiadharma 396', '84750239396', '3671010023396', 'Tangerang', '2001-06-16', 'Perempuan', '08965766396', 'Jl. Lamda 3 No. 396', 'Islam', 1, 3, '150000.00', 3, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(397, 2, 'P20222397', 'Cut Naila Fadia Fiadharma 397', '84750239397', '3671010023397', 'Tangerang', '2001-08-30', 'Perempuan', '08965766397', 'Jl. Lamda 3 No. 397', 'Islam', 11, 12, '150000.00', 4, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(398, 1, 'P20221398', 'Cut Naila Fadia Fiadharma 398', '84750239398', '3671010023398', 'Tangerang', '2001-11-24', 'Perempuan', '08965766398', 'Jl. Lamda 3 No. 398', 'Islam', 10, 2, '150000.00', 1, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(399, 1, 'P20221399', 'Cut Naila Fadia Fiadharma 399', '84750239399', '3671010023399', 'Tangerang', '2001-08-15', 'Perempuan', '08965766399', 'Jl. Lamda 3 No. 399', 'Islam', 5, 12, '150000.00', 3, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(400, 3, 'P20223400', 'Cut Naila Fadia Fiadharma 400', '84750239400', '3671010023400', 'Jakarta', '2001-09-08', 'Laki-Laki', '08965766400', 'Jl. Lamda 3 No. 400', 'Islam', 8, 8, NULL, NULL, '0', '2022-12-11 07:08:20', NULL, NULL, NULL),
(401, 1, 'P20221401', 'Cut Naila Fadia Fiadharma 401', '84750239401', '3671010023401', 'Tangerang', '2001-07-20', 'Perempuan', '08965766401', 'Jl. Lamda 3 No. 401', 'Islam', 1, 7, '150000.00', 2, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(402, 1, 'P20221402', 'Cut Naila Fadia Fiadharma 402', '84750239402', '3671010023402', 'Tangerang', '2001-11-01', 'Perempuan', '08965766402', 'Jl. Lamda 3 No. 402', 'Islam', 3, 10, '150000.00', 1, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(403, 3, 'P20223403', 'Cut Naila Fadia Fiadharma 403', '84750239403', '3671010023403', 'Tangerang', '2001-07-06', 'Perempuan', '08965766403', 'Jl. Lamda 3 No. 403', 'Islam', 7, 3, NULL, NULL, '0', '2022-12-11 07:08:20', NULL, NULL, NULL),
(404, 3, 'P20223404', 'Cut Naila Fadia Fiadharma 404', '84750239404', '3671010023404', 'Tangerang', '2001-09-03', 'Perempuan', '08965766404', 'Jl. Lamda 3 No. 404', 'Islam', 10, 1, NULL, NULL, '0', '2022-12-11 07:08:20', NULL, NULL, NULL),
(405, 3, 'P20223405', 'Cut Naila Fadia Fiadharma 405', '84750239405', '3671010023405', 'Jakarta', '2001-08-22', 'Laki-Laki', '08965766405', 'Jl. Lamda 3 No. 405', 'Islam', 5, 8, NULL, NULL, '0', '2022-12-11 07:08:20', NULL, NULL, NULL),
(406, 2, 'P20222406', 'Cut Naila Fadia Fiadharma 406', '84750239406', '3671010023406', 'Tangerang', '2001-09-11', 'Perempuan', '08965766406', 'Jl. Lamda 3 No. 406', 'Islam', 13, 11, '150000.00', 3, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(407, 2, 'P20222407', 'Cut Naila Fadia Fiadharma 407', '84750239407', '3671010023407', 'Tangerang', '2001-06-30', 'Perempuan', '08965766407', 'Jl. Lamda 3 No. 407', 'Islam', 10, 3, '150000.00', 3, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(408, 1, 'P20221408', 'Cut Naila Fadia Fiadharma 408', '84750239408', '3671010023408', 'Tangerang', '2001-09-03', 'Perempuan', '08965766408', 'Jl. Lamda 3 No. 408', 'Islam', 9, 1, '150000.00', 1, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(409, 2, 'P20222409', 'Cut Naila Fadia Fiadharma 409', '84750239409', '3671010023409', 'Tangerang', '2001-10-28', 'Perempuan', '08965766409', 'Jl. Lamda 3 No. 409', 'Islam', 7, 12, '150000.00', 4, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(410, 1, 'P20221410', 'Cut Naila Fadia Fiadharma 410', '84750239410', '3671010023410', 'Jakarta', '2001-07-25', 'Laki-Laki', '08965766410', 'Jl. Lamda 3 No. 410', 'Islam', 12, 7, '150000.00', 1, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(411, 3, 'P20223411', 'Cut Naila Fadia Fiadharma 411', '84750239411', '3671010023411', 'Tangerang', '2001-11-28', 'Perempuan', '08965766411', 'Jl. Lamda 3 No. 411', 'Islam', 11, 5, NULL, NULL, '0', '2022-12-11 07:08:20', NULL, NULL, NULL),
(412, 1, 'P20221412', 'Cut Naila Fadia Fiadharma 412', '84750239412', '3671010023412', 'Tangerang', '2001-07-21', 'Perempuan', '08965766412', 'Jl. Lamda 3 No. 412', 'Islam', 8, 5, '150000.00', 3, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(413, 3, 'P20223413', 'Cut Naila Fadia Fiadharma 413', '84750239413', '3671010023413', 'Tangerang', '2001-10-23', 'Perempuan', '08965766413', 'Jl. Lamda 3 No. 413', 'Islam', 12, 8, NULL, NULL, '0', '2022-12-11 07:08:20', NULL, NULL, NULL),
(414, 1, 'P20221414', 'Cut Naila Fadia Fiadharma 414', '84750239414', '3671010023414', 'Tangerang', '2001-08-20', 'Perempuan', '08965766414', 'Jl. Lamda 3 No. 414', 'Islam', 13, 1, '150000.00', 1, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(415, 1, 'P20221415', 'Cut Naila Fadia Fiadharma 415', '84750239415', '3671010023415', 'Jakarta', '2001-06-26', 'Laki-Laki', '08965766415', 'Jl. Lamda 3 No. 415', 'Islam', 4, 7, '150000.00', 1, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(416, 2, 'P20222416', 'Cut Naila Fadia Fiadharma 416', '84750239416', '3671010023416', 'Tangerang', '2001-12-08', 'Perempuan', '08965766416', 'Jl. Lamda 3 No. 416', 'Islam', 12, 3, '150000.00', 3, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(417, 2, 'P20222417', 'Cut Naila Fadia Fiadharma 417', '84750239417', '3671010023417', 'Tangerang', '2001-10-15', 'Perempuan', '08965766417', 'Jl. Lamda 3 No. 417', 'Islam', 12, 6, '150000.00', 1, '1', '2022-12-11 07:08:20', NULL, NULL, NULL);
INSERT INTO `pendaftar` (`id_pendaftar`, `id_jalur`, `no_pendaftar`, `nama`, `nisn`, `nik`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `no_hp`, `alamat`, `agama`, `id_prodi1`, `id_prodi2`, `nominal_bayar`, `id_bank`, `is_bayar`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(418, 1, 'P20221418', 'Cut Naila Fadia Fiadharma 418', '84750239418', '3671010023418', 'Tangerang', '2001-10-20', 'Perempuan', '08965766418', 'Jl. Lamda 3 No. 418', 'Islam', 8, 5, '150000.00', 1, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(419, 3, 'P20223419', 'Cut Naila Fadia Fiadharma 419', '84750239419', '3671010023419', 'Tangerang', '2001-11-12', 'Perempuan', '08965766419', 'Jl. Lamda 3 No. 419', 'Islam', 2, 9, NULL, NULL, '0', '2022-12-11 07:08:20', NULL, NULL, NULL),
(420, 3, 'P20223420', 'Cut Naila Fadia Fiadharma 420', '84750239420', '3671010023420', 'Jakarta', '2001-08-21', 'Laki-Laki', '08965766420', 'Jl. Lamda 3 No. 420', 'Islam', 13, 4, NULL, NULL, '0', '2022-12-11 07:08:20', NULL, NULL, NULL),
(421, 2, 'P20222421', 'Cut Naila Fadia Fiadharma 421', '84750239421', '3671010023421', 'Tangerang', '2001-09-23', 'Perempuan', '08965766421', 'Jl. Lamda 3 No. 421', 'Islam', 9, 11, '150000.00', 4, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(422, 2, 'P20222422', 'Cut Naila Fadia Fiadharma 422', '84750239422', '3671010023422', 'Tangerang', '2001-09-23', 'Perempuan', '08965766422', 'Jl. Lamda 3 No. 422', 'Islam', 5, 13, '150000.00', 4, '1', '2022-12-11 07:08:20', NULL, NULL, NULL),
(423, 2, 'P20222423', 'Cut Naila Fadia Fiadharma 423', '84750239423', '3671010023423', 'Tangerang', '2001-07-07', 'Perempuan', '08965766423', 'Jl. Lamda 3 No. 423', 'Islam', 12, 13, '150000.00', 1, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(424, 3, 'P20223424', 'Cut Naila Fadia Fiadharma 424', '84750239424', '3671010023424', 'Tangerang', '2001-08-08', 'Perempuan', '08965766424', 'Jl. Lamda 3 No. 424', 'Islam', 3, 12, NULL, NULL, '0', '2022-12-11 07:08:21', NULL, NULL, NULL),
(425, 2, 'P20222425', 'Cut Naila Fadia Fiadharma 425', '84750239425', '3671010023425', 'Jakarta', '2001-11-13', 'Laki-Laki', '08965766425', 'Jl. Lamda 3 No. 425', 'Islam', 12, 3, '150000.00', 4, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(426, 1, 'P20221426', 'Cut Naila Fadia Fiadharma 426', '84750239426', '3671010023426', 'Tangerang', '2001-11-25', 'Perempuan', '08965766426', 'Jl. Lamda 3 No. 426', 'Islam', 3, 8, '150000.00', 1, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(427, 3, 'P20223427', 'Cut Naila Fadia Fiadharma 427', '84750239427', '3671010023427', 'Tangerang', '2001-07-04', 'Perempuan', '08965766427', 'Jl. Lamda 3 No. 427', 'Islam', 13, 10, NULL, NULL, '0', '2022-12-11 07:08:21', NULL, NULL, NULL),
(428, 3, 'P20223428', 'Cut Naila Fadia Fiadharma 428', '84750239428', '3671010023428', 'Tangerang', '2001-08-31', 'Perempuan', '08965766428', 'Jl. Lamda 3 No. 428', 'Islam', 5, 10, NULL, NULL, '0', '2022-12-11 07:08:21', NULL, NULL, NULL),
(429, 2, 'P20222429', 'Cut Naila Fadia Fiadharma 429', '84750239429', '3671010023429', 'Tangerang', '2001-07-18', 'Perempuan', '08965766429', 'Jl. Lamda 3 No. 429', 'Islam', 6, 12, '150000.00', 3, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(430, 1, 'P20221430', 'Cut Naila Fadia Fiadharma 430', '84750239430', '3671010023430', 'Jakarta', '2001-12-01', 'Laki-Laki', '08965766430', 'Jl. Lamda 3 No. 430', 'Islam', 6, 3, '150000.00', 2, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(431, 2, 'P20222431', 'Cut Naila Fadia Fiadharma 431', '84750239431', '3671010023431', 'Tangerang', '2001-12-07', 'Perempuan', '08965766431', 'Jl. Lamda 3 No. 431', 'Islam', 1, 9, '150000.00', 4, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(432, 1, 'P20221432', 'Cut Naila Fadia Fiadharma 432', '84750239432', '3671010023432', 'Tangerang', '2001-11-26', 'Perempuan', '08965766432', 'Jl. Lamda 3 No. 432', 'Islam', 2, 1, '150000.00', 3, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(433, 2, 'P20222433', 'Cut Naila Fadia Fiadharma 433', '84750239433', '3671010023433', 'Tangerang', '2001-08-03', 'Perempuan', '08965766433', 'Jl. Lamda 3 No. 433', 'Islam', 2, 6, '150000.00', 3, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(434, 2, 'P20222434', 'Cut Naila Fadia Fiadharma 434', '84750239434', '3671010023434', 'Tangerang', '2001-07-18', 'Perempuan', '08965766434', 'Jl. Lamda 3 No. 434', 'Islam', 11, 13, '150000.00', 2, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(435, 2, 'P20222435', 'Cut Naila Fadia Fiadharma 435', '84750239435', '3671010023435', 'Jakarta', '2001-12-22', 'Laki-Laki', '08965766435', 'Jl. Lamda 3 No. 435', 'Islam', 9, 9, '150000.00', 4, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(436, 2, 'P20222436', 'Cut Naila Fadia Fiadharma 436', '84750239436', '3671010023436', 'Tangerang', '2001-10-30', 'Perempuan', '08965766436', 'Jl. Lamda 3 No. 436', 'Islam', 8, 6, '150000.00', 1, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(437, 2, 'P20222437', 'Cut Naila Fadia Fiadharma 437', '84750239437', '3671010023437', 'Tangerang', '2001-11-29', 'Perempuan', '08965766437', 'Jl. Lamda 3 No. 437', 'Islam', 10, 7, '150000.00', 2, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(438, 2, 'P20222438', 'Cut Naila Fadia Fiadharma 438', '84750239438', '3671010023438', 'Tangerang', '2001-10-21', 'Perempuan', '08965766438', 'Jl. Lamda 3 No. 438', 'Islam', 3, 7, '150000.00', 4, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(439, 2, 'P20222439', 'Cut Naila Fadia Fiadharma 439', '84750239439', '3671010023439', 'Tangerang', '2001-07-22', 'Perempuan', '08965766439', 'Jl. Lamda 3 No. 439', 'Islam', 13, 5, '150000.00', 2, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(440, 1, 'P20221440', 'Cut Naila Fadia Fiadharma 440', '84750239440', '3671010023440', 'Jakarta', '2001-10-19', 'Laki-Laki', '08965766440', 'Jl. Lamda 3 No. 440', 'Islam', 12, 8, '150000.00', 3, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(441, 3, 'P20223441', 'Cut Naila Fadia Fiadharma 441', '84750239441', '3671010023441', 'Tangerang', '2001-10-09', 'Perempuan', '08965766441', 'Jl. Lamda 3 No. 441', 'Islam', 3, 1, NULL, NULL, '0', '2022-12-11 07:08:21', NULL, NULL, NULL),
(442, 2, 'P20222442', 'Cut Naila Fadia Fiadharma 442', '84750239442', '3671010023442', 'Tangerang', '2001-11-17', 'Perempuan', '08965766442', 'Jl. Lamda 3 No. 442', 'Islam', 2, 2, '150000.00', 2, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(443, 3, 'P20223443', 'Cut Naila Fadia Fiadharma 443', '84750239443', '3671010023443', 'Tangerang', '2001-08-11', 'Perempuan', '08965766443', 'Jl. Lamda 3 No. 443', 'Islam', 3, 2, NULL, NULL, '0', '2022-12-11 07:08:21', NULL, NULL, NULL),
(444, 1, 'P20221444', 'Cut Naila Fadia Fiadharma 444', '84750239444', '3671010023444', 'Tangerang', '2001-11-17', 'Perempuan', '08965766444', 'Jl. Lamda 3 No. 444', 'Islam', 10, 7, '150000.00', 3, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(445, 1, 'P20221445', 'Cut Naila Fadia Fiadharma 445', '84750239445', '3671010023445', 'Jakarta', '2001-12-07', 'Laki-Laki', '08965766445', 'Jl. Lamda 3 No. 445', 'Islam', 2, 2, '150000.00', 3, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(446, 1, 'P20221446', 'Cut Naila Fadia Fiadharma 446', '84750239446', '3671010023446', 'Tangerang', '2001-08-11', 'Perempuan', '08965766446', 'Jl. Lamda 3 No. 446', 'Islam', 12, 2, '150000.00', 4, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(447, 2, 'P20222447', 'Cut Naila Fadia Fiadharma 447', '84750239447', '3671010023447', 'Tangerang', '2001-11-09', 'Perempuan', '08965766447', 'Jl. Lamda 3 No. 447', 'Islam', 1, 10, '150000.00', 1, '1', '2022-12-11 07:08:21', NULL, NULL, NULL),
(448, 3, 'P20223448', 'Cut Naila Fadia Fiadharma 448', '84750239448', '3671010023448', 'Tangerang', '2001-10-10', 'Perempuan', '08965766448', 'Jl. Lamda 3 No. 448', 'Islam', 7, 10, NULL, NULL, '0', '2022-12-11 07:08:21', NULL, NULL, NULL),
(449, 1, 'P20221449', 'Cut Naila Fadia Fiadharma 449', '84750239449', '3671010023449', 'Tangerang', '2001-06-24', 'Perempuan', '08965766449', 'Jl. Lamda 3 No. 449', 'Islam', 12, 6, '150000.00', 4, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(450, 2, 'P20222450', 'Cut Naila Fadia Fiadharma 450', '84750239450', '3671010023450', 'Jakarta', '2001-09-11', 'Laki-Laki', '08965766450', 'Jl. Lamda 3 No. 450', 'Islam', 1, 4, '150000.00', 3, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(451, 3, 'P20223451', 'Cut Naila Fadia Fiadharma 451', '84750239451', '3671010023451', 'Tangerang', '2001-09-17', 'Perempuan', '08965766451', 'Jl. Lamda 3 No. 451', 'Islam', 7, 8, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(452, 1, 'P20221452', 'Cut Naila Fadia Fiadharma 452', '84750239452', '3671010023452', 'Tangerang', '2001-09-21', 'Perempuan', '08965766452', 'Jl. Lamda 3 No. 452', 'Islam', 12, 8, '150000.00', 1, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(453, 3, 'P20223453', 'Cut Naila Fadia Fiadharma 453', '84750239453', '3671010023453', 'Tangerang', '2001-06-24', 'Perempuan', '08965766453', 'Jl. Lamda 3 No. 453', 'Islam', 1, 4, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(454, 2, 'P20222454', 'Cut Naila Fadia Fiadharma 454', '84750239454', '3671010023454', 'Tangerang', '2001-08-09', 'Perempuan', '08965766454', 'Jl. Lamda 3 No. 454', 'Islam', 8, 4, '150000.00', 4, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(455, 1, 'P20221455', 'Cut Naila Fadia Fiadharma 455', '84750239455', '3671010023455', 'Jakarta', '2001-12-14', 'Laki-Laki', '08965766455', 'Jl. Lamda 3 No. 455', 'Islam', 2, 12, '150000.00', 2, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(456, 2, 'P20222456', 'Cut Naila Fadia Fiadharma 456', '84750239456', '3671010023456', 'Tangerang', '2001-08-26', 'Perempuan', '08965766456', 'Jl. Lamda 3 No. 456', 'Islam', 4, 6, '150000.00', 4, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(457, 2, 'P20222457', 'Cut Naila Fadia Fiadharma 457', '84750239457', '3671010023457', 'Tangerang', '2001-12-22', 'Perempuan', '08965766457', 'Jl. Lamda 3 No. 457', 'Islam', 9, 11, '150000.00', 4, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(458, 2, 'P20222458', 'Cut Naila Fadia Fiadharma 458', '84750239458', '3671010023458', 'Tangerang', '2001-10-03', 'Perempuan', '08965766458', 'Jl. Lamda 3 No. 458', 'Islam', 8, 7, '150000.00', 3, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(459, 1, 'P20221459', 'Cut Naila Fadia Fiadharma 459', '84750239459', '3671010023459', 'Tangerang', '2001-11-30', 'Perempuan', '08965766459', 'Jl. Lamda 3 No. 459', 'Islam', 6, 2, '150000.00', 3, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(460, 3, 'P20223460', 'Cut Naila Fadia Fiadharma 460', '84750239460', '3671010023460', 'Jakarta', '2001-10-21', 'Laki-Laki', '08965766460', 'Jl. Lamda 3 No. 460', 'Islam', 3, 3, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(461, 3, 'P20223461', 'Cut Naila Fadia Fiadharma 461', '84750239461', '3671010023461', 'Tangerang', '2001-10-24', 'Perempuan', '08965766461', 'Jl. Lamda 3 No. 461', 'Islam', 1, 1, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(462, 3, 'P20223462', 'Cut Naila Fadia Fiadharma 462', '84750239462', '3671010023462', 'Tangerang', '2001-12-31', 'Perempuan', '08965766462', 'Jl. Lamda 3 No. 462', 'Islam', 8, 3, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(463, 2, 'P20222463', 'Cut Naila Fadia Fiadharma 463', '84750239463', '3671010023463', 'Tangerang', '2001-12-20', 'Perempuan', '08965766463', 'Jl. Lamda 3 No. 463', 'Islam', 6, 9, '150000.00', 4, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(464, 1, 'P20221464', 'Cut Naila Fadia Fiadharma 464', '84750239464', '3671010023464', 'Tangerang', '2001-06-27', 'Perempuan', '08965766464', 'Jl. Lamda 3 No. 464', 'Islam', 7, 4, '150000.00', 1, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(465, 3, 'P20223465', 'Cut Naila Fadia Fiadharma 465', '84750239465', '3671010023465', 'Jakarta', '2001-11-08', 'Laki-Laki', '08965766465', 'Jl. Lamda 3 No. 465', 'Islam', 4, 13, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(466, 3, 'P20223466', 'Cut Naila Fadia Fiadharma 466', '84750239466', '3671010023466', 'Tangerang', '2001-09-28', 'Perempuan', '08965766466', 'Jl. Lamda 3 No. 466', 'Islam', 1, 13, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(467, 3, 'P20223467', 'Cut Naila Fadia Fiadharma 467', '84750239467', '3671010023467', 'Tangerang', '2001-10-05', 'Perempuan', '08965766467', 'Jl. Lamda 3 No. 467', 'Islam', 13, 7, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(468, 3, 'P20223468', 'Cut Naila Fadia Fiadharma 468', '84750239468', '3671010023468', 'Tangerang', '2001-10-10', 'Perempuan', '08965766468', 'Jl. Lamda 3 No. 468', 'Islam', 13, 8, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(469, 2, 'P20222469', 'Cut Naila Fadia Fiadharma 469', '84750239469', '3671010023469', 'Tangerang', '2001-09-08', 'Perempuan', '08965766469', 'Jl. Lamda 3 No. 469', 'Islam', 1, 12, '150000.00', 1, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(470, 2, 'P20222470', 'Cut Naila Fadia Fiadharma 470', '84750239470', '3671010023470', 'Jakarta', '2001-07-10', 'Laki-Laki', '08965766470', 'Jl. Lamda 3 No. 470', 'Islam', 7, 7, '150000.00', 2, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(471, 3, 'P20223471', 'Cut Naila Fadia Fiadharma 471', '84750239471', '3671010023471', 'Tangerang', '2001-12-21', 'Perempuan', '08965766471', 'Jl. Lamda 3 No. 471', 'Islam', 8, 5, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(472, 3, 'P20223472', 'Cut Naila Fadia Fiadharma 472', '84750239472', '3671010023472', 'Tangerang', '2001-11-16', 'Perempuan', '08965766472', 'Jl. Lamda 3 No. 472', 'Islam', 11, 11, NULL, NULL, '0', '2022-12-11 07:08:22', NULL, NULL, NULL),
(473, 1, 'P20221473', 'Cut Naila Fadia Fiadharma 473', '84750239473', '3671010023473', 'Tangerang', '2001-07-13', 'Perempuan', '08965766473', 'Jl. Lamda 3 No. 473', 'Islam', 3, 1, '150000.00', 1, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(474, 2, 'P20222474', 'Cut Naila Fadia Fiadharma 474', '84750239474', '3671010023474', 'Tangerang', '2001-10-20', 'Perempuan', '08965766474', 'Jl. Lamda 3 No. 474', 'Islam', 8, 2, '150000.00', 1, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(475, 2, 'P20222475', 'Cut Naila Fadia Fiadharma 475', '84750239475', '3671010023475', 'Jakarta', '2001-09-04', 'Laki-Laki', '08965766475', 'Jl. Lamda 3 No. 475', 'Islam', 4, 3, '150000.00', 2, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(476, 1, 'P20221476', 'Cut Naila Fadia Fiadharma 476', '84750239476', '3671010023476', 'Tangerang', '2001-11-23', 'Perempuan', '08965766476', 'Jl. Lamda 3 No. 476', 'Islam', 10, 9, '150000.00', 1, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(477, 1, 'P20221477', 'Cut Naila Fadia Fiadharma 477', '84750239477', '3671010023477', 'Tangerang', '2001-10-03', 'Perempuan', '08965766477', 'Jl. Lamda 3 No. 477', 'Islam', 9, 10, '150000.00', 3, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(478, 1, 'P20221478', 'Cut Naila Fadia Fiadharma 478', '84750239478', '3671010023478', 'Tangerang', '2001-08-17', 'Perempuan', '08965766478', 'Jl. Lamda 3 No. 478', 'Islam', 12, 13, '150000.00', 3, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(479, 2, 'P20222479', 'Cut Naila Fadia Fiadharma 479', '84750239479', '3671010023479', 'Tangerang', '2001-11-27', 'Perempuan', '08965766479', 'Jl. Lamda 3 No. 479', 'Islam', 3, 8, '150000.00', 2, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(480, 2, 'P20222480', 'Cut Naila Fadia Fiadharma 480', '84750239480', '3671010023480', 'Jakarta', '2001-12-02', 'Laki-Laki', '08965766480', 'Jl. Lamda 3 No. 480', 'Islam', 1, 1, '150000.00', 1, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(481, 2, 'P20222481', 'Cut Naila Fadia Fiadharma 481', '84750239481', '3671010023481', 'Tangerang', '2001-07-03', 'Perempuan', '08965766481', 'Jl. Lamda 3 No. 481', 'Islam', 13, 3, '150000.00', 4, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(482, 2, 'P20222482', 'Cut Naila Fadia Fiadharma 482', '84750239482', '3671010023482', 'Tangerang', '2001-07-06', 'Perempuan', '08965766482', 'Jl. Lamda 3 No. 482', 'Islam', 4, 8, '150000.00', 2, '1', '2022-12-11 07:08:22', NULL, NULL, NULL),
(483, 3, 'P20223483', 'Cut Naila Fadia Fiadharma 483', '84750239483', '3671010023483', 'Tangerang', '2001-12-12', 'Perempuan', '08965766483', 'Jl. Lamda 3 No. 483', 'Islam', 4, 10, NULL, NULL, '0', '2022-12-11 07:08:23', NULL, NULL, NULL),
(484, 2, 'P20222484', 'Cut Naila Fadia Fiadharma 484', '84750239484', '3671010023484', 'Tangerang', '2001-08-11', 'Perempuan', '08965766484', 'Jl. Lamda 3 No. 484', 'Islam', 1, 5, '150000.00', 4, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(485, 2, 'P20222485', 'Cut Naila Fadia Fiadharma 485', '84750239485', '3671010023485', 'Jakarta', '2001-08-14', 'Laki-Laki', '08965766485', 'Jl. Lamda 3 No. 485', 'Islam', 13, 4, '150000.00', 3, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(486, 1, 'P20221486', 'Cut Naila Fadia Fiadharma 486', '84750239486', '3671010023486', 'Tangerang', '2001-08-29', 'Perempuan', '08965766486', 'Jl. Lamda 3 No. 486', 'Islam', 6, 1, '150000.00', 2, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(487, 3, 'P20223487', 'Cut Naila Fadia Fiadharma 487', '84750239487', '3671010023487', 'Tangerang', '2001-08-11', 'Perempuan', '08965766487', 'Jl. Lamda 3 No. 487', 'Islam', 3, 7, NULL, NULL, '0', '2022-12-11 07:08:23', NULL, NULL, NULL),
(488, 3, 'P20223488', 'Cut Naila Fadia Fiadharma 488', '84750239488', '3671010023488', 'Tangerang', '2001-07-14', 'Perempuan', '08965766488', 'Jl. Lamda 3 No. 488', 'Islam', 4, 2, NULL, NULL, '0', '2022-12-11 07:08:23', NULL, NULL, NULL),
(489, 1, 'P20221489', 'Cut Naila Fadia Fiadharma 489', '84750239489', '3671010023489', 'Tangerang', '2001-11-23', 'Perempuan', '08965766489', 'Jl. Lamda 3 No. 489', 'Islam', 1, 6, '150000.00', 1, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(490, 2, 'P20222490', 'Cut Naila Fadia Fiadharma 490', '84750239490', '3671010023490', 'Jakarta', '2001-10-21', 'Laki-Laki', '08965766490', 'Jl. Lamda 3 No. 490', 'Islam', 12, 10, '150000.00', 4, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(491, 3, 'P20223491', 'Cut Naila Fadia Fiadharma 491', '84750239491', '3671010023491', 'Tangerang', '2001-10-13', 'Perempuan', '08965766491', 'Jl. Lamda 3 No. 491', 'Islam', 9, 3, NULL, NULL, '0', '2022-12-11 07:08:23', NULL, NULL, NULL),
(492, 2, 'P20222492', 'Cut Naila Fadia Fiadharma 492', '84750239492', '3671010023492', 'Tangerang', '2001-10-28', 'Perempuan', '08965766492', 'Jl. Lamda 3 No. 492', 'Islam', 5, 4, '150000.00', 1, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(493, 2, 'P20222493', 'Cut Naila Fadia Fiadharma 493', '84750239493', '3671010023493', 'Tangerang', '2001-06-30', 'Perempuan', '08965766493', 'Jl. Lamda 3 No. 493', 'Islam', 11, 11, '150000.00', 3, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(494, 1, 'P20221494', 'Cut Naila Fadia Fiadharma 494', '84750239494', '3671010023494', 'Tangerang', '2001-11-01', 'Perempuan', '08965766494', 'Jl. Lamda 3 No. 494', 'Islam', 12, 7, '150000.00', 1, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(495, 1, 'P20221495', 'Cut Naila Fadia Fiadharma 495', '84750239495', '3671010023495', 'Jakarta', '2001-12-01', 'Laki-Laki', '08965766495', 'Jl. Lamda 3 No. 495', 'Islam', 12, 12, '150000.00', 2, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(496, 1, 'P20221496', 'Cut Naila Fadia Fiadharma 496', '84750239496', '3671010023496', 'Tangerang', '2001-10-05', 'Perempuan', '08965766496', 'Jl. Lamda 3 No. 496', 'Islam', 12, 10, '150000.00', 1, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(497, 2, 'P20222497', 'Cut Naila Fadia Fiadharma 497', '84750239497', '3671010023497', 'Tangerang', '2001-09-24', 'Perempuan', '08965766497', 'Jl. Lamda 3 No. 497', 'Islam', 10, 8, '150000.00', 1, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(498, 3, 'P20223498', 'Cut Naila Fadia Fiadharma 498', '84750239498', '3671010023498', 'Tangerang', '2001-07-20', 'Perempuan', '08965766498', 'Jl. Lamda 3 No. 498', 'Islam', 8, 3, NULL, NULL, '0', '2022-12-11 07:08:23', NULL, NULL, NULL),
(499, 2, 'P20222499', 'Cut Naila Fadia Fiadharma 499', '84750239499', '3671010023499', 'Tangerang', '2001-12-27', 'Perempuan', '08965766499', 'Jl. Lamda 3 No. 499', 'Islam', 12, 13, '150000.00', 3, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(500, 3, 'P20223500', 'Cut Naila Fadia Fiadharma 500', '84750239500', '3671010023500', 'Jakarta', '2001-10-01', 'Laki-Laki', '08965766500', 'Jl. Lamda 3 No. 500', 'Islam', 8, 6, NULL, NULL, '0', '2022-12-11 07:08:23', NULL, NULL, NULL),
(501, 1, 'P20221501', 'Cut Naila Fadia Fiadharma 501', '84750239501', '3671010023501', 'Tangerang', '2001-07-29', 'Perempuan', '08965766501', 'Jl. Lamda 3 No. 501', 'Islam', 8, 13, '150000.00', 2, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(502, 2, 'P20222502', 'Cut Naila Fadia Fiadharma 502', '84750239502', '3671010023502', 'Tangerang', '2001-09-14', 'Perempuan', '08965766502', 'Jl. Lamda 3 No. 502', 'Islam', 6, 12, '150000.00', 2, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(503, 2, 'P20222503', 'Cut Naila Fadia Fiadharma 503', '84750239503', '3671010023503', 'Tangerang', '2001-07-29', 'Perempuan', '08965766503', 'Jl. Lamda 3 No. 503', 'Islam', 5, 6, '150000.00', 1, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(504, 2, 'P20222504', 'Cut Naila Fadia Fiadharma 504', '84750239504', '3671010023504', 'Tangerang', '2001-12-23', 'Perempuan', '08965766504', 'Jl. Lamda 3 No. 504', 'Islam', 11, 8, '150000.00', 1, '1', '2022-12-11 07:08:23', NULL, NULL, NULL),
(505, 2, 'P20222505', 'Cut Naila Fadia Fiadharma 505', '84750239505', '3671010023505', 'Jakarta', '2001-10-19', 'Laki-Laki', '08965766505', 'Jl. Lamda 3 No. 505', 'Islam', 3, 11, '150000.00', 4, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(506, 3, 'P20223506', 'Cut Naila Fadia Fiadharma 506', '84750239506', '3671010023506', 'Tangerang', '2001-12-08', 'Perempuan', '08965766506', 'Jl. Lamda 3 No. 506', 'Islam', 2, 7, NULL, NULL, '0', '2022-12-11 07:08:24', NULL, NULL, NULL),
(507, 3, 'P20223507', 'Cut Naila Fadia Fiadharma 507', '84750239507', '3671010023507', 'Tangerang', '2001-06-30', 'Perempuan', '08965766507', 'Jl. Lamda 3 No. 507', 'Islam', 10, 1, NULL, NULL, '0', '2022-12-11 07:08:24', NULL, NULL, NULL),
(508, 1, 'P20221508', 'Cut Naila Fadia Fiadharma 508', '84750239508', '3671010023508', 'Tangerang', '2001-08-29', 'Perempuan', '08965766508', 'Jl. Lamda 3 No. 508', 'Islam', 7, 4, '150000.00', 2, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(509, 1, 'P20221509', 'Cut Naila Fadia Fiadharma 509', '84750239509', '3671010023509', 'Tangerang', '2001-12-30', 'Perempuan', '08965766509', 'Jl. Lamda 3 No. 509', 'Islam', 8, 3, '150000.00', 2, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(510, 3, 'P20223510', 'Cut Naila Fadia Fiadharma 510', '84750239510', '3671010023510', 'Jakarta', '2001-11-07', 'Laki-Laki', '08965766510', 'Jl. Lamda 3 No. 510', 'Islam', 12, 10, NULL, NULL, '0', '2022-12-11 07:08:24', NULL, NULL, NULL),
(511, 3, 'P20223511', 'Cut Naila Fadia Fiadharma 511', '84750239511', '3671010023511', 'Tangerang', '2001-10-04', 'Perempuan', '08965766511', 'Jl. Lamda 3 No. 511', 'Islam', 9, 6, NULL, NULL, '0', '2022-12-11 07:08:24', NULL, NULL, NULL),
(512, 2, 'P20222512', 'Cut Naila Fadia Fiadharma 512', '84750239512', '3671010023512', 'Tangerang', '2001-06-21', 'Perempuan', '08965766512', 'Jl. Lamda 3 No. 512', 'Islam', 7, 3, '150000.00', 1, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(513, 1, 'P20221513', 'Cut Naila Fadia Fiadharma 513', '84750239513', '3671010023513', 'Tangerang', '2001-10-11', 'Perempuan', '08965766513', 'Jl. Lamda 3 No. 513', 'Islam', 3, 7, '150000.00', 3, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(514, 2, 'P20222514', 'Cut Naila Fadia Fiadharma 514', '84750239514', '3671010023514', 'Tangerang', '2001-07-30', 'Perempuan', '08965766514', 'Jl. Lamda 3 No. 514', 'Islam', 4, 7, '150000.00', 1, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(515, 3, 'P20223515', 'Cut Naila Fadia Fiadharma 515', '84750239515', '3671010023515', 'Jakarta', '2001-08-19', 'Laki-Laki', '08965766515', 'Jl. Lamda 3 No. 515', 'Islam', 1, 9, NULL, NULL, '0', '2022-12-11 07:08:24', NULL, NULL, NULL),
(516, 1, 'P20221516', 'Cut Naila Fadia Fiadharma 516', '84750239516', '3671010023516', 'Tangerang', '2001-11-01', 'Perempuan', '08965766516', 'Jl. Lamda 3 No. 516', 'Islam', 2, 8, '150000.00', 2, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(517, 1, 'P20221517', 'Cut Naila Fadia Fiadharma 517', '84750239517', '3671010023517', 'Tangerang', '2001-09-09', 'Perempuan', '08965766517', 'Jl. Lamda 3 No. 517', 'Islam', 11, 12, '150000.00', 4, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(518, 1, 'P20221518', 'Cut Naila Fadia Fiadharma 518', '84750239518', '3671010023518', 'Tangerang', '2001-07-16', 'Perempuan', '08965766518', 'Jl. Lamda 3 No. 518', 'Islam', 1, 2, '150000.00', 4, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(519, 2, 'P20222519', 'Cut Naila Fadia Fiadharma 519', '84750239519', '3671010023519', 'Tangerang', '2001-08-25', 'Perempuan', '08965766519', 'Jl. Lamda 3 No. 519', 'Islam', 6, 2, '150000.00', 2, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(520, 2, 'P20222520', 'Cut Naila Fadia Fiadharma 520', '84750239520', '3671010023520', 'Jakarta', '2001-12-16', 'Laki-Laki', '08965766520', 'Jl. Lamda 3 No. 520', 'Islam', 9, 2, '150000.00', 1, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(521, 2, 'P20222521', 'Cut Naila Fadia Fiadharma 521', '84750239521', '3671010023521', 'Tangerang', '2001-06-29', 'Perempuan', '08965766521', 'Jl. Lamda 3 No. 521', 'Islam', 9, 12, '150000.00', 1, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(522, 2, 'P20222522', 'Cut Naila Fadia Fiadharma 522', '84750239522', '3671010023522', 'Tangerang', '2001-11-20', 'Perempuan', '08965766522', 'Jl. Lamda 3 No. 522', 'Islam', 6, 7, '150000.00', 2, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(523, 1, 'P20221523', 'Cut Naila Fadia Fiadharma 523', '84750239523', '3671010023523', 'Tangerang', '2001-11-17', 'Perempuan', '08965766523', 'Jl. Lamda 3 No. 523', 'Islam', 6, 3, '150000.00', 3, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(524, 2, 'P20222524', 'Cut Naila Fadia Fiadharma 524', '84750239524', '3671010023524', 'Tangerang', '2001-06-15', 'Perempuan', '08965766524', 'Jl. Lamda 3 No. 524', 'Islam', 6, 12, '150000.00', 2, '1', '2022-12-11 07:08:24', NULL, NULL, NULL),
(525, 1, 'P20221525', 'Cut Naila Fadia Fiadharma 525', '84750239525', '3671010023525', 'Jakarta', '2001-08-28', 'Laki-Laki', '08965766525', 'Jl. Lamda 3 No. 525', 'Islam', 3, 12, '150000.00', 3, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(526, 3, 'P20223526', 'Cut Naila Fadia Fiadharma 526', '84750239526', '3671010023526', 'Tangerang', '2001-09-06', 'Perempuan', '08965766526', 'Jl. Lamda 3 No. 526', 'Islam', 4, 6, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(527, 3, 'P20223527', 'Cut Naila Fadia Fiadharma 527', '84750239527', '3671010023527', 'Tangerang', '2001-11-05', 'Perempuan', '08965766527', 'Jl. Lamda 3 No. 527', 'Islam', 7, 9, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(528, 1, 'P20221528', 'Cut Naila Fadia Fiadharma 528', '84750239528', '3671010023528', 'Tangerang', '2001-10-06', 'Perempuan', '08965766528', 'Jl. Lamda 3 No. 528', 'Islam', 11, 3, '150000.00', 2, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(529, 2, 'P20222529', 'Cut Naila Fadia Fiadharma 529', '84750239529', '3671010023529', 'Tangerang', '2001-08-28', 'Perempuan', '08965766529', 'Jl. Lamda 3 No. 529', 'Islam', 1, 5, '150000.00', 2, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(530, 2, 'P20222530', 'Cut Naila Fadia Fiadharma 530', '84750239530', '3671010023530', 'Jakarta', '2001-09-28', 'Laki-Laki', '08965766530', 'Jl. Lamda 3 No. 530', 'Islam', 8, 7, '150000.00', 1, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(531, 2, 'P20222531', 'Cut Naila Fadia Fiadharma 531', '84750239531', '3671010023531', 'Tangerang', '2001-07-20', 'Perempuan', '08965766531', 'Jl. Lamda 3 No. 531', 'Islam', 5, 13, '150000.00', 1, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(532, 2, 'P20222532', 'Cut Naila Fadia Fiadharma 532', '84750239532', '3671010023532', 'Tangerang', '2001-06-16', 'Perempuan', '08965766532', 'Jl. Lamda 3 No. 532', 'Islam', 1, 2, '150000.00', 2, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(533, 2, 'P20222533', 'Cut Naila Fadia Fiadharma 533', '84750239533', '3671010023533', 'Tangerang', '2001-06-28', 'Perempuan', '08965766533', 'Jl. Lamda 3 No. 533', 'Islam', 11, 12, '150000.00', 1, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(534, 1, 'P20221534', 'Cut Naila Fadia Fiadharma 534', '84750239534', '3671010023534', 'Tangerang', '2001-08-15', 'Perempuan', '08965766534', 'Jl. Lamda 3 No. 534', 'Islam', 4, 6, '150000.00', 4, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(535, 3, 'P20223535', 'Cut Naila Fadia Fiadharma 535', '84750239535', '3671010023535', 'Jakarta', '2001-08-13', 'Laki-Laki', '08965766535', 'Jl. Lamda 3 No. 535', 'Islam', 9, 10, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(536, 2, 'P20222536', 'Cut Naila Fadia Fiadharma 536', '84750239536', '3671010023536', 'Tangerang', '2001-07-21', 'Perempuan', '08965766536', 'Jl. Lamda 3 No. 536', 'Islam', 13, 5, '150000.00', 1, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(537, 2, 'P20222537', 'Cut Naila Fadia Fiadharma 537', '84750239537', '3671010023537', 'Tangerang', '2001-12-19', 'Perempuan', '08965766537', 'Jl. Lamda 3 No. 537', 'Islam', 10, 12, '150000.00', 1, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(538, 2, 'P20222538', 'Cut Naila Fadia Fiadharma 538', '84750239538', '3671010023538', 'Tangerang', '2001-06-29', 'Perempuan', '08965766538', 'Jl. Lamda 3 No. 538', 'Islam', 5, 4, '150000.00', 4, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(539, 1, 'P20221539', 'Cut Naila Fadia Fiadharma 539', '84750239539', '3671010023539', 'Tangerang', '2001-07-31', 'Perempuan', '08965766539', 'Jl. Lamda 3 No. 539', 'Islam', 6, 2, '150000.00', 1, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(540, 2, 'P20222540', 'Cut Naila Fadia Fiadharma 540', '84750239540', '3671010023540', 'Jakarta', '2001-10-20', 'Laki-Laki', '08965766540', 'Jl. Lamda 3 No. 540', 'Islam', 6, 12, '150000.00', 2, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(541, 3, 'P20223541', 'Cut Naila Fadia Fiadharma 541', '84750239541', '3671010023541', 'Tangerang', '2001-12-21', 'Perempuan', '08965766541', 'Jl. Lamda 3 No. 541', 'Islam', 11, 9, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(542, 3, 'P20223542', 'Cut Naila Fadia Fiadharma 542', '84750239542', '3671010023542', 'Tangerang', '2001-09-29', 'Perempuan', '08965766542', 'Jl. Lamda 3 No. 542', 'Islam', 9, 2, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(543, 2, 'P20222543', 'Cut Naila Fadia Fiadharma 543', '84750239543', '3671010023543', 'Tangerang', '2001-06-25', 'Perempuan', '08965766543', 'Jl. Lamda 3 No. 543', 'Islam', 9, 11, '150000.00', 1, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(544, 1, 'P20221544', 'Cut Naila Fadia Fiadharma 544', '84750239544', '3671010023544', 'Tangerang', '2001-10-01', 'Perempuan', '08965766544', 'Jl. Lamda 3 No. 544', 'Islam', 7, 5, '150000.00', 4, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(545, 2, 'P20222545', 'Cut Naila Fadia Fiadharma 545', '84750239545', '3671010023545', 'Jakarta', '2001-07-13', 'Laki-Laki', '08965766545', 'Jl. Lamda 3 No. 545', 'Islam', 11, 8, '150000.00', 3, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(546, 1, 'P20221546', 'Cut Naila Fadia Fiadharma 546', '84750239546', '3671010023546', 'Tangerang', '2001-10-16', 'Perempuan', '08965766546', 'Jl. Lamda 3 No. 546', 'Islam', 2, 8, '150000.00', 4, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(547, 2, 'P20222547', 'Cut Naila Fadia Fiadharma 547', '84750239547', '3671010023547', 'Tangerang', '2001-09-27', 'Perempuan', '08965766547', 'Jl. Lamda 3 No. 547', 'Islam', 7, 5, '150000.00', 3, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(548, 2, 'P20222548', 'Cut Naila Fadia Fiadharma 548', '84750239548', '3671010023548', 'Tangerang', '2001-07-13', 'Perempuan', '08965766548', 'Jl. Lamda 3 No. 548', 'Islam', 10, 9, '150000.00', 2, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(549, 3, 'P20223549', 'Cut Naila Fadia Fiadharma 549', '84750239549', '3671010023549', 'Tangerang', '2001-10-19', 'Perempuan', '08965766549', 'Jl. Lamda 3 No. 549', 'Islam', 10, 13, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(550, 2, 'P20222550', 'Cut Naila Fadia Fiadharma 550', '84750239550', '3671010023550', 'Jakarta', '2001-08-03', 'Laki-Laki', '08965766550', 'Jl. Lamda 3 No. 550', 'Islam', 12, 12, '150000.00', 3, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(551, 1, 'P20221551', 'Cut Naila Fadia Fiadharma 551', '84750239551', '3671010023551', 'Tangerang', '2001-12-16', 'Perempuan', '08965766551', 'Jl. Lamda 3 No. 551', 'Islam', 13, 9, '150000.00', 3, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(552, 2, 'P20222552', 'Cut Naila Fadia Fiadharma 552', '84750239552', '3671010023552', 'Tangerang', '2001-07-29', 'Perempuan', '08965766552', 'Jl. Lamda 3 No. 552', 'Islam', 3, 2, '150000.00', 3, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(553, 3, 'P20223553', 'Cut Naila Fadia Fiadharma 553', '84750239553', '3671010023553', 'Tangerang', '2001-10-12', 'Perempuan', '08965766553', 'Jl. Lamda 3 No. 553', 'Islam', 4, 12, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(554, 2, 'P20222554', 'Cut Naila Fadia Fiadharma 554', '84750239554', '3671010023554', 'Tangerang', '2001-12-24', 'Perempuan', '08965766554', 'Jl. Lamda 3 No. 554', 'Islam', 11, 1, '150000.00', 1, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(555, 2, 'P20222555', 'Cut Naila Fadia Fiadharma 555', '84750239555', '3671010023555', 'Jakarta', '2001-12-15', 'Laki-Laki', '08965766555', 'Jl. Lamda 3 No. 555', 'Islam', 9, 2, '150000.00', 3, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(556, 3, 'P20223556', 'Cut Naila Fadia Fiadharma 556', '84750239556', '3671010023556', 'Tangerang', '2001-10-26', 'Perempuan', '08965766556', 'Jl. Lamda 3 No. 556', 'Islam', 8, 11, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(557, 3, 'P20223557', 'Cut Naila Fadia Fiadharma 557', '84750239557', '3671010023557', 'Tangerang', '2001-07-22', 'Perempuan', '08965766557', 'Jl. Lamda 3 No. 557', 'Islam', 12, 8, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(558, 1, 'P20221558', 'Cut Naila Fadia Fiadharma 558', '84750239558', '3671010023558', 'Tangerang', '2001-12-30', 'Perempuan', '08965766558', 'Jl. Lamda 3 No. 558', 'Islam', 8, 11, '150000.00', 3, '1', '2022-12-11 07:08:25', NULL, NULL, NULL),
(559, 3, 'P20223559', 'Cut Naila Fadia Fiadharma 559', '84750239559', '3671010023559', 'Tangerang', '2001-10-06', 'Perempuan', '08965766559', 'Jl. Lamda 3 No. 559', 'Islam', 6, 10, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(560, 3, 'P20223560', 'Cut Naila Fadia Fiadharma 560', '84750239560', '3671010023560', 'Jakarta', '2001-07-20', 'Laki-Laki', '08965766560', 'Jl. Lamda 3 No. 560', 'Islam', 9, 12, NULL, NULL, '0', '2022-12-11 07:08:25', NULL, NULL, NULL),
(561, 3, 'P20223561', 'Cut Naila Fadia Fiadharma 561', '84750239561', '3671010023561', 'Tangerang', '2001-08-25', 'Perempuan', '08965766561', 'Jl. Lamda 3 No. 561', 'Islam', 1, 7, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(562, 2, 'P20222562', 'Cut Naila Fadia Fiadharma 562', '84750239562', '3671010023562', 'Tangerang', '2001-06-26', 'Perempuan', '08965766562', 'Jl. Lamda 3 No. 562', 'Islam', 11, 8, '150000.00', 4, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(563, 2, 'P20222563', 'Cut Naila Fadia Fiadharma 563', '84750239563', '3671010023563', 'Tangerang', '2001-07-01', 'Perempuan', '08965766563', 'Jl. Lamda 3 No. 563', 'Islam', 2, 12, '150000.00', 2, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(564, 3, 'P20223564', 'Cut Naila Fadia Fiadharma 564', '84750239564', '3671010023564', 'Tangerang', '2001-10-03', 'Perempuan', '08965766564', 'Jl. Lamda 3 No. 564', 'Islam', 3, 8, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(565, 2, 'P20222565', 'Cut Naila Fadia Fiadharma 565', '84750239565', '3671010023565', 'Jakarta', '2001-08-26', 'Laki-Laki', '08965766565', 'Jl. Lamda 3 No. 565', 'Islam', 10, 3, '150000.00', 3, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(566, 1, 'P20221566', 'Cut Naila Fadia Fiadharma 566', '84750239566', '3671010023566', 'Tangerang', '2001-07-05', 'Perempuan', '08965766566', 'Jl. Lamda 3 No. 566', 'Islam', 6, 5, '150000.00', 3, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(567, 1, 'P20221567', 'Cut Naila Fadia Fiadharma 567', '84750239567', '3671010023567', 'Tangerang', '2001-09-03', 'Perempuan', '08965766567', 'Jl. Lamda 3 No. 567', 'Islam', 9, 7, '150000.00', 1, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(568, 3, 'P20223568', 'Cut Naila Fadia Fiadharma 568', '84750239568', '3671010023568', 'Tangerang', '2001-07-04', 'Perempuan', '08965766568', 'Jl. Lamda 3 No. 568', 'Islam', 4, 4, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(569, 2, 'P20222569', 'Cut Naila Fadia Fiadharma 569', '84750239569', '3671010023569', 'Tangerang', '2001-12-21', 'Perempuan', '08965766569', 'Jl. Lamda 3 No. 569', 'Islam', 12, 7, '150000.00', 4, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(570, 1, 'P20221570', 'Cut Naila Fadia Fiadharma 570', '84750239570', '3671010023570', 'Jakarta', '2001-12-10', 'Laki-Laki', '08965766570', 'Jl. Lamda 3 No. 570', 'Islam', 13, 11, '150000.00', 4, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(571, 1, 'P20221571', 'Cut Naila Fadia Fiadharma 571', '84750239571', '3671010023571', 'Tangerang', '2001-07-01', 'Perempuan', '08965766571', 'Jl. Lamda 3 No. 571', 'Islam', 4, 10, '150000.00', 3, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(572, 3, 'P20223572', 'Cut Naila Fadia Fiadharma 572', '84750239572', '3671010023572', 'Tangerang', '2001-07-12', 'Perempuan', '08965766572', 'Jl. Lamda 3 No. 572', 'Islam', 9, 2, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(573, 3, 'P20223573', 'Cut Naila Fadia Fiadharma 573', '84750239573', '3671010023573', 'Tangerang', '2001-12-02', 'Perempuan', '08965766573', 'Jl. Lamda 3 No. 573', 'Islam', 7, 5, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(574, 1, 'P20221574', 'Cut Naila Fadia Fiadharma 574', '84750239574', '3671010023574', 'Tangerang', '2001-10-25', 'Perempuan', '08965766574', 'Jl. Lamda 3 No. 574', 'Islam', 3, 5, '150000.00', 3, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(575, 2, 'P20222575', 'Cut Naila Fadia Fiadharma 575', '84750239575', '3671010023575', 'Jakarta', '2001-12-16', 'Laki-Laki', '08965766575', 'Jl. Lamda 3 No. 575', 'Islam', 2, 5, '150000.00', 3, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(576, 1, 'P20221576', 'Cut Naila Fadia Fiadharma 576', '84750239576', '3671010023576', 'Tangerang', '2001-12-30', 'Perempuan', '08965766576', 'Jl. Lamda 3 No. 576', 'Islam', 2, 4, '150000.00', 1, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(577, 2, 'P20222577', 'Cut Naila Fadia Fiadharma 577', '84750239577', '3671010023577', 'Tangerang', '2001-10-05', 'Perempuan', '08965766577', 'Jl. Lamda 3 No. 577', 'Islam', 13, 5, '150000.00', 2, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(578, 1, 'P20221578', 'Cut Naila Fadia Fiadharma 578', '84750239578', '3671010023578', 'Tangerang', '2001-07-05', 'Perempuan', '08965766578', 'Jl. Lamda 3 No. 578', 'Islam', 10, 9, '150000.00', 4, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(579, 3, 'P20223579', 'Cut Naila Fadia Fiadharma 579', '84750239579', '3671010023579', 'Tangerang', '2001-07-08', 'Perempuan', '08965766579', 'Jl. Lamda 3 No. 579', 'Islam', 12, 3, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(580, 1, 'P20221580', 'Cut Naila Fadia Fiadharma 580', '84750239580', '3671010023580', 'Jakarta', '2001-08-21', 'Laki-Laki', '08965766580', 'Jl. Lamda 3 No. 580', 'Islam', 3, 4, '150000.00', 3, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(581, 2, 'P20222581', 'Cut Naila Fadia Fiadharma 581', '84750239581', '3671010023581', 'Tangerang', '2001-08-31', 'Perempuan', '08965766581', 'Jl. Lamda 3 No. 581', 'Islam', 4, 7, '150000.00', 1, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(582, 2, 'P20222582', 'Cut Naila Fadia Fiadharma 582', '84750239582', '3671010023582', 'Tangerang', '2001-07-18', 'Perempuan', '08965766582', 'Jl. Lamda 3 No. 582', 'Islam', 6, 13, '150000.00', 4, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(583, 1, 'P20221583', 'Cut Naila Fadia Fiadharma 583', '84750239583', '3671010023583', 'Tangerang', '2001-09-27', 'Perempuan', '08965766583', 'Jl. Lamda 3 No. 583', 'Islam', 8, 2, '150000.00', 1, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(584, 3, 'P20223584', 'Cut Naila Fadia Fiadharma 584', '84750239584', '3671010023584', 'Tangerang', '2001-08-21', 'Perempuan', '08965766584', 'Jl. Lamda 3 No. 584', 'Islam', 3, 10, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(585, 1, 'P20221585', 'Cut Naila Fadia Fiadharma 585', '84750239585', '3671010023585', 'Jakarta', '2001-09-23', 'Laki-Laki', '08965766585', 'Jl. Lamda 3 No. 585', 'Islam', 2, 2, '150000.00', 4, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(586, 3, 'P20223586', 'Cut Naila Fadia Fiadharma 586', '84750239586', '3671010023586', 'Tangerang', '2001-10-23', 'Perempuan', '08965766586', 'Jl. Lamda 3 No. 586', 'Islam', 9, 2, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(587, 2, 'P20222587', 'Cut Naila Fadia Fiadharma 587', '84750239587', '3671010023587', 'Tangerang', '2001-07-20', 'Perempuan', '08965766587', 'Jl. Lamda 3 No. 587', 'Islam', 4, 13, '150000.00', 2, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(588, 3, 'P20223588', 'Cut Naila Fadia Fiadharma 588', '84750239588', '3671010023588', 'Tangerang', '2001-10-29', 'Perempuan', '08965766588', 'Jl. Lamda 3 No. 588', 'Islam', 9, 1, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(589, 1, 'P20221589', 'Cut Naila Fadia Fiadharma 589', '84750239589', '3671010023589', 'Tangerang', '2001-08-18', 'Perempuan', '08965766589', 'Jl. Lamda 3 No. 589', 'Islam', 10, 12, '150000.00', 3, '1', '2022-12-11 07:08:26', NULL, NULL, NULL),
(590, 3, 'P20223590', 'Cut Naila Fadia Fiadharma 590', '84750239590', '3671010023590', 'Jakarta', '2001-09-16', 'Laki-Laki', '08965766590', 'Jl. Lamda 3 No. 590', 'Islam', 11, 3, NULL, NULL, '0', '2022-12-11 07:08:26', NULL, NULL, NULL),
(591, 1, 'P20221591', 'Cut Naila Fadia Fiadharma 591', '84750239591', '3671010023591', 'Tangerang', '2001-09-23', 'Perempuan', '08965766591', 'Jl. Lamda 3 No. 591', 'Islam', 12, 11, '150000.00', 2, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(592, 2, 'P20222592', 'Cut Naila Fadia Fiadharma 592', '84750239592', '3671010023592', 'Tangerang', '2001-10-25', 'Perempuan', '08965766592', 'Jl. Lamda 3 No. 592', 'Islam', 12, 12, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(593, 1, 'P20221593', 'Cut Naila Fadia Fiadharma 593', '84750239593', '3671010023593', 'Tangerang', '2001-06-25', 'Perempuan', '08965766593', 'Jl. Lamda 3 No. 593', 'Islam', 9, 8, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(594, 3, 'P20223594', 'Cut Naila Fadia Fiadharma 594', '84750239594', '3671010023594', 'Tangerang', '2001-08-19', 'Perempuan', '08965766594', 'Jl. Lamda 3 No. 594', 'Islam', 5, 2, NULL, NULL, '0', '2022-12-11 07:08:27', NULL, NULL, NULL),
(595, 2, 'P20222595', 'Cut Naila Fadia Fiadharma 595', '84750239595', '3671010023595', 'Jakarta', '2001-10-21', 'Laki-Laki', '08965766595', 'Jl. Lamda 3 No. 595', 'Islam', 8, 3, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(596, 1, 'P20221596', 'Cut Naila Fadia Fiadharma 596', '84750239596', '3671010023596', 'Tangerang', '2001-08-23', 'Perempuan', '08965766596', 'Jl. Lamda 3 No. 596', 'Islam', 13, 8, '150000.00', 1, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(597, 1, 'P20221597', 'Cut Naila Fadia Fiadharma 597', '84750239597', '3671010023597', 'Tangerang', '2001-11-12', 'Perempuan', '08965766597', 'Jl. Lamda 3 No. 597', 'Islam', 6, 12, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(598, 1, 'P20221598', 'Cut Naila Fadia Fiadharma 598', '84750239598', '3671010023598', 'Tangerang', '2001-07-27', 'Perempuan', '08965766598', 'Jl. Lamda 3 No. 598', 'Islam', 10, 12, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(599, 1, 'P20221599', 'Cut Naila Fadia Fiadharma 599', '84750239599', '3671010023599', 'Tangerang', '2001-12-22', 'Perempuan', '08965766599', 'Jl. Lamda 3 No. 599', 'Islam', 9, 11, '150000.00', 2, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(600, 2, 'P20222600', 'Cut Naila Fadia Fiadharma 600', '84750239600', '3671010023600', 'Jakarta', '2001-12-07', 'Laki-Laki', '08965766600', 'Jl. Lamda 3 No. 600', 'Islam', 8, 5, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(601, 2, 'P20222601', 'Cut Naila Fadia Fiadharma 601', '84750239601', '3671010023601', 'Tangerang', '2001-12-07', 'Perempuan', '08965766601', 'Jl. Lamda 3 No. 601', 'Islam', 13, 7, '150000.00', 2, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(602, 1, 'P20221602', 'Cut Naila Fadia Fiadharma 602', '84750239602', '3671010023602', 'Tangerang', '2001-11-30', 'Perempuan', '08965766602', 'Jl. Lamda 3 No. 602', 'Islam', 13, 10, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(603, 3, 'P20223603', 'Cut Naila Fadia Fiadharma 603', '84750239603', '3671010023603', 'Tangerang', '2001-07-21', 'Perempuan', '08965766603', 'Jl. Lamda 3 No. 603', 'Islam', 5, 2, NULL, NULL, '0', '2022-12-11 07:08:27', NULL, NULL, NULL),
(604, 1, 'P20221604', 'Cut Naila Fadia Fiadharma 604', '84750239604', '3671010023604', 'Tangerang', '2001-12-22', 'Perempuan', '08965766604', 'Jl. Lamda 3 No. 604', 'Islam', 2, 11, '150000.00', 1, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(605, 3, 'P20223605', 'Cut Naila Fadia Fiadharma 605', '84750239605', '3671010023605', 'Jakarta', '2001-11-18', 'Laki-Laki', '08965766605', 'Jl. Lamda 3 No. 605', 'Islam', 8, 2, NULL, NULL, '0', '2022-12-11 07:08:27', NULL, NULL, NULL),
(606, 2, 'P20222606', 'Cut Naila Fadia Fiadharma 606', '84750239606', '3671010023606', 'Tangerang', '2001-12-31', 'Perempuan', '08965766606', 'Jl. Lamda 3 No. 606', 'Islam', 10, 6, '150000.00', 1, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(607, 3, 'P20223607', 'Cut Naila Fadia Fiadharma 607', '84750239607', '3671010023607', 'Tangerang', '2001-12-22', 'Perempuan', '08965766607', 'Jl. Lamda 3 No. 607', 'Islam', 3, 9, NULL, NULL, '0', '2022-12-11 07:08:27', NULL, NULL, NULL),
(608, 1, 'P20221608', 'Cut Naila Fadia Fiadharma 608', '84750239608', '3671010023608', 'Tangerang', '2001-10-12', 'Perempuan', '08965766608', 'Jl. Lamda 3 No. 608', 'Islam', 10, 5, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(609, 1, 'P20221609', 'Cut Naila Fadia Fiadharma 609', '84750239609', '3671010023609', 'Tangerang', '2001-09-23', 'Perempuan', '08965766609', 'Jl. Lamda 3 No. 609', 'Islam', 13, 1, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(610, 1, 'P20221610', 'Cut Naila Fadia Fiadharma 610', '84750239610', '3671010023610', 'Jakarta', '2001-07-14', 'Laki-Laki', '08965766610', 'Jl. Lamda 3 No. 610', 'Islam', 11, 1, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(611, 1, 'P20221611', 'Cut Naila Fadia Fiadharma 611', '84750239611', '3671010023611', 'Tangerang', '2001-06-16', 'Perempuan', '08965766611', 'Jl. Lamda 3 No. 611', 'Islam', 5, 12, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(612, 2, 'P20222612', 'Cut Naila Fadia Fiadharma 612', '84750239612', '3671010023612', 'Tangerang', '2001-10-10', 'Perempuan', '08965766612', 'Jl. Lamda 3 No. 612', 'Islam', 3, 12, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(613, 1, 'P20221613', 'Cut Naila Fadia Fiadharma 613', '84750239613', '3671010023613', 'Tangerang', '2001-08-20', 'Perempuan', '08965766613', 'Jl. Lamda 3 No. 613', 'Islam', 11, 13, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(614, 2, 'P20222614', 'Cut Naila Fadia Fiadharma 614', '84750239614', '3671010023614', 'Tangerang', '2001-08-31', 'Perempuan', '08965766614', 'Jl. Lamda 3 No. 614', 'Islam', 5, 13, '150000.00', 1, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(615, 2, 'P20222615', 'Cut Naila Fadia Fiadharma 615', '84750239615', '3671010023615', 'Jakarta', '2001-12-22', 'Laki-Laki', '08965766615', 'Jl. Lamda 3 No. 615', 'Islam', 4, 3, '150000.00', 1, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(616, 2, 'P20222616', 'Cut Naila Fadia Fiadharma 616', '84750239616', '3671010023616', 'Tangerang', '2001-11-11', 'Perempuan', '08965766616', 'Jl. Lamda 3 No. 616', 'Islam', 13, 4, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(617, 3, 'P20223617', 'Cut Naila Fadia Fiadharma 617', '84750239617', '3671010023617', 'Tangerang', '2001-08-25', 'Perempuan', '08965766617', 'Jl. Lamda 3 No. 617', 'Islam', 7, 4, NULL, NULL, '0', '2022-12-11 07:08:27', NULL, NULL, NULL),
(618, 1, 'P20221618', 'Cut Naila Fadia Fiadharma 618', '84750239618', '3671010023618', 'Tangerang', '2001-10-30', 'Perempuan', '08965766618', 'Jl. Lamda 3 No. 618', 'Islam', 6, 7, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(619, 3, 'P20223619', 'Cut Naila Fadia Fiadharma 619', '84750239619', '3671010023619', 'Tangerang', '2001-09-01', 'Perempuan', '08965766619', 'Jl. Lamda 3 No. 619', 'Islam', 2, 5, NULL, NULL, '0', '2022-12-11 07:08:27', NULL, NULL, NULL),
(620, 2, 'P20222620', 'Cut Naila Fadia Fiadharma 620', '84750239620', '3671010023620', 'Jakarta', '2001-06-20', 'Laki-Laki', '08965766620', 'Jl. Lamda 3 No. 620', 'Islam', 11, 11, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(621, 1, 'P20221621', 'Cut Naila Fadia Fiadharma 621', '84750239621', '3671010023621', 'Tangerang', '2001-06-26', 'Perempuan', '08965766621', 'Jl. Lamda 3 No. 621', 'Islam', 12, 12, '150000.00', 3, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(622, 2, 'P20222622', 'Cut Naila Fadia Fiadharma 622', '84750239622', '3671010023622', 'Tangerang', '2001-11-02', 'Perempuan', '08965766622', 'Jl. Lamda 3 No. 622', 'Islam', 4, 13, '150000.00', 4, '1', '2022-12-11 07:08:27', NULL, NULL, NULL),
(623, 3, 'P20223623', 'Cut Naila Fadia Fiadharma 623', '84750239623', '3671010023623', 'Tangerang', '2001-06-25', 'Perempuan', '08965766623', 'Jl. Lamda 3 No. 623', 'Islam', 12, 9, NULL, NULL, '0', '2022-12-11 07:08:27', NULL, NULL, NULL);
INSERT INTO `pendaftar` (`id_pendaftar`, `id_jalur`, `no_pendaftar`, `nama`, `nisn`, `nik`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `no_hp`, `alamat`, `agama`, `id_prodi1`, `id_prodi2`, `nominal_bayar`, `id_bank`, `is_bayar`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(624, 2, 'P20222624', 'Cut Naila Fadia Fiadharma 624', '84750239624', '3671010023624', 'Tangerang', '2001-11-27', 'Perempuan', '08965766624', 'Jl. Lamda 3 No. 624', 'Islam', 3, 12, '150000.00', 1, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(625, 1, 'P20221625', 'Cut Naila Fadia Fiadharma 625', '84750239625', '3671010023625', 'Jakarta', '2001-07-22', 'Laki-Laki', '08965766625', 'Jl. Lamda 3 No. 625', 'Islam', 4, 12, '150000.00', 1, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(626, 2, 'P20222626', 'Cut Naila Fadia Fiadharma 626', '84750239626', '3671010023626', 'Tangerang', '2001-07-01', 'Perempuan', '08965766626', 'Jl. Lamda 3 No. 626', 'Islam', 2, 4, '150000.00', 2, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(627, 3, 'P20223627', 'Cut Naila Fadia Fiadharma 627', '84750239627', '3671010023627', 'Tangerang', '2001-11-23', 'Perempuan', '08965766627', 'Jl. Lamda 3 No. 627', 'Islam', 2, 1, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(628, 2, 'P20222628', 'Cut Naila Fadia Fiadharma 628', '84750239628', '3671010023628', 'Tangerang', '2001-10-02', 'Perempuan', '08965766628', 'Jl. Lamda 3 No. 628', 'Islam', 3, 9, '150000.00', 2, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(629, 2, 'P20222629', 'Cut Naila Fadia Fiadharma 629', '84750239629', '3671010023629', 'Tangerang', '2001-06-22', 'Perempuan', '08965766629', 'Jl. Lamda 3 No. 629', 'Islam', 13, 9, '150000.00', 1, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(630, 3, 'P20223630', 'Cut Naila Fadia Fiadharma 630', '84750239630', '3671010023630', 'Jakarta', '2001-10-21', 'Laki-Laki', '08965766630', 'Jl. Lamda 3 No. 630', 'Islam', 8, 12, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(631, 3, 'P20223631', 'Cut Naila Fadia Fiadharma 631', '84750239631', '3671010023631', 'Tangerang', '2001-09-27', 'Perempuan', '08965766631', 'Jl. Lamda 3 No. 631', 'Islam', 7, 10, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(632, 3, 'P20223632', 'Cut Naila Fadia Fiadharma 632', '84750239632', '3671010023632', 'Tangerang', '2001-08-17', 'Perempuan', '08965766632', 'Jl. Lamda 3 No. 632', 'Islam', 7, 10, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(633, 3, 'P20223633', 'Cut Naila Fadia Fiadharma 633', '84750239633', '3671010023633', 'Tangerang', '2001-10-16', 'Perempuan', '08965766633', 'Jl. Lamda 3 No. 633', 'Islam', 2, 13, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(634, 3, 'P20223634', 'Cut Naila Fadia Fiadharma 634', '84750239634', '3671010023634', 'Tangerang', '2001-10-26', 'Perempuan', '08965766634', 'Jl. Lamda 3 No. 634', 'Islam', 1, 2, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(635, 3, 'P20223635', 'Cut Naila Fadia Fiadharma 635', '84750239635', '3671010023635', 'Jakarta', '2001-09-12', 'Laki-Laki', '08965766635', 'Jl. Lamda 3 No. 635', 'Islam', 13, 3, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(636, 2, 'P20222636', 'Cut Naila Fadia Fiadharma 636', '84750239636', '3671010023636', 'Tangerang', '2001-12-17', 'Perempuan', '08965766636', 'Jl. Lamda 3 No. 636', 'Islam', 7, 6, '150000.00', 3, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(637, 1, 'P20221637', 'Cut Naila Fadia Fiadharma 637', '84750239637', '3671010023637', 'Tangerang', '2001-10-17', 'Perempuan', '08965766637', 'Jl. Lamda 3 No. 637', 'Islam', 2, 13, '150000.00', 1, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(638, 3, 'P20223638', 'Cut Naila Fadia Fiadharma 638', '84750239638', '3671010023638', 'Tangerang', '2001-10-13', 'Perempuan', '08965766638', 'Jl. Lamda 3 No. 638', 'Islam', 3, 12, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(639, 3, 'P20223639', 'Cut Naila Fadia Fiadharma 639', '84750239639', '3671010023639', 'Tangerang', '2001-10-13', 'Perempuan', '08965766639', 'Jl. Lamda 3 No. 639', 'Islam', 9, 3, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(640, 2, 'P20222640', 'Cut Naila Fadia Fiadharma 640', '84750239640', '3671010023640', 'Jakarta', '2001-07-25', 'Laki-Laki', '08965766640', 'Jl. Lamda 3 No. 640', 'Islam', 5, 8, '150000.00', 3, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(641, 1, 'P20221641', 'Cut Naila Fadia Fiadharma 641', '84750239641', '3671010023641', 'Tangerang', '2001-08-05', 'Perempuan', '08965766641', 'Jl. Lamda 3 No. 641', 'Islam', 6, 9, '150000.00', 1, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(642, 3, 'P20223642', 'Cut Naila Fadia Fiadharma 642', '84750239642', '3671010023642', 'Tangerang', '2001-08-12', 'Perempuan', '08965766642', 'Jl. Lamda 3 No. 642', 'Islam', 10, 10, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(643, 2, 'P20222643', 'Cut Naila Fadia Fiadharma 643', '84750239643', '3671010023643', 'Tangerang', '2001-10-14', 'Perempuan', '08965766643', 'Jl. Lamda 3 No. 643', 'Islam', 7, 8, '150000.00', 4, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(644, 1, 'P20221644', 'Cut Naila Fadia Fiadharma 644', '84750239644', '3671010023644', 'Tangerang', '2001-07-20', 'Perempuan', '08965766644', 'Jl. Lamda 3 No. 644', 'Islam', 12, 4, '150000.00', 1, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(645, 1, 'P20221645', 'Cut Naila Fadia Fiadharma 645', '84750239645', '3671010023645', 'Jakarta', '2001-11-29', 'Laki-Laki', '08965766645', 'Jl. Lamda 3 No. 645', 'Islam', 12, 7, '150000.00', 2, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(646, 1, 'P20221646', 'Cut Naila Fadia Fiadharma 646', '84750239646', '3671010023646', 'Tangerang', '2001-10-06', 'Perempuan', '08965766646', 'Jl. Lamda 3 No. 646', 'Islam', 13, 7, '150000.00', 1, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(647, 1, 'P20221647', 'Cut Naila Fadia Fiadharma 647', '84750239647', '3671010023647', 'Tangerang', '2001-09-02', 'Perempuan', '08965766647', 'Jl. Lamda 3 No. 647', 'Islam', 13, 2, '150000.00', 1, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(648, 1, 'P20221648', 'Cut Naila Fadia Fiadharma 648', '84750239648', '3671010023648', 'Tangerang', '2001-10-03', 'Perempuan', '08965766648', 'Jl. Lamda 3 No. 648', 'Islam', 11, 11, '150000.00', 4, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(649, 1, 'P20221649', 'Cut Naila Fadia Fiadharma 649', '84750239649', '3671010023649', 'Tangerang', '2001-11-12', 'Perempuan', '08965766649', 'Jl. Lamda 3 No. 649', 'Islam', 4, 13, '150000.00', 3, '1', '2022-12-11 07:08:28', NULL, NULL, NULL),
(650, 3, 'P20223650', 'Cut Naila Fadia Fiadharma 650', '84750239650', '3671010023650', 'Jakarta', '2001-07-13', 'Laki-Laki', '08965766650', 'Jl. Lamda 3 No. 650', 'Islam', 9, 13, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(651, 3, 'P20223651', 'Cut Naila Fadia Fiadharma 651', '84750239651', '3671010023651', 'Tangerang', '2001-10-25', 'Perempuan', '08965766651', 'Jl. Lamda 3 No. 651', 'Islam', 8, 10, NULL, NULL, '0', '2022-12-11 07:08:28', NULL, NULL, NULL),
(652, 2, 'P20222652', 'Cut Naila Fadia Fiadharma 652', '84750239652', '3671010023652', 'Tangerang', '2001-12-19', 'Perempuan', '08965766652', 'Jl. Lamda 3 No. 652', 'Islam', 7, 6, '150000.00', 4, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(653, 3, 'P20223653', 'Cut Naila Fadia Fiadharma 653', '84750239653', '3671010023653', 'Tangerang', '2001-09-12', 'Perempuan', '08965766653', 'Jl. Lamda 3 No. 653', 'Islam', 4, 2, NULL, NULL, '0', '2022-12-11 07:08:29', NULL, NULL, NULL),
(654, 3, 'P20223654', 'Cut Naila Fadia Fiadharma 654', '84750239654', '3671010023654', 'Tangerang', '2001-08-30', 'Perempuan', '08965766654', 'Jl. Lamda 3 No. 654', 'Islam', 8, 9, NULL, NULL, '0', '2022-12-11 07:08:29', NULL, NULL, NULL),
(655, 1, 'P20221655', 'Cut Naila Fadia Fiadharma 655', '84750239655', '3671010023655', 'Jakarta', '2001-08-22', 'Laki-Laki', '08965766655', 'Jl. Lamda 3 No. 655', 'Islam', 7, 7, '150000.00', 3, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(656, 2, 'P20222656', 'Cut Naila Fadia Fiadharma 656', '84750239656', '3671010023656', 'Tangerang', '2001-07-18', 'Perempuan', '08965766656', 'Jl. Lamda 3 No. 656', 'Islam', 8, 10, '150000.00', 4, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(657, 2, 'P20222657', 'Cut Naila Fadia Fiadharma 657', '84750239657', '3671010023657', 'Tangerang', '2001-08-05', 'Perempuan', '08965766657', 'Jl. Lamda 3 No. 657', 'Islam', 11, 8, '150000.00', 4, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(658, 3, 'P20223658', 'Cut Naila Fadia Fiadharma 658', '84750239658', '3671010023658', 'Tangerang', '2001-11-04', 'Perempuan', '08965766658', 'Jl. Lamda 3 No. 658', 'Islam', 3, 13, NULL, NULL, '0', '2022-12-11 07:08:29', NULL, NULL, NULL),
(659, 2, 'P20222659', 'Cut Naila Fadia Fiadharma 659', '84750239659', '3671010023659', 'Tangerang', '2001-09-17', 'Perempuan', '08965766659', 'Jl. Lamda 3 No. 659', 'Islam', 11, 2, '150000.00', 1, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(660, 3, 'P20223660', 'Cut Naila Fadia Fiadharma 660', '84750239660', '3671010023660', 'Jakarta', '2001-12-09', 'Laki-Laki', '08965766660', 'Jl. Lamda 3 No. 660', 'Islam', 6, 2, NULL, NULL, '0', '2022-12-11 07:08:29', NULL, NULL, NULL),
(661, 1, 'P20221661', 'Cut Naila Fadia Fiadharma 661', '84750239661', '3671010023661', 'Tangerang', '2001-08-09', 'Perempuan', '08965766661', 'Jl. Lamda 3 No. 661', 'Islam', 6, 4, '150000.00', 4, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(662, 2, 'P20222662', 'Cut Naila Fadia Fiadharma 662', '84750239662', '3671010023662', 'Tangerang', '2001-06-26', 'Perempuan', '08965766662', 'Jl. Lamda 3 No. 662', 'Islam', 2, 9, '150000.00', 3, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(663, 2, 'P20222663', 'Cut Naila Fadia Fiadharma 663', '84750239663', '3671010023663', 'Tangerang', '2001-06-22', 'Perempuan', '08965766663', 'Jl. Lamda 3 No. 663', 'Islam', 13, 11, '150000.00', 4, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(664, 2, 'P20222664', 'Cut Naila Fadia Fiadharma 664', '84750239664', '3671010023664', 'Tangerang', '2001-09-08', 'Perempuan', '08965766664', 'Jl. Lamda 3 No. 664', 'Islam', 6, 3, '150000.00', 3, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(665, 2, 'P20222665', 'Cut Naila Fadia Fiadharma 665', '84750239665', '3671010023665', 'Jakarta', '2001-09-17', 'Laki-Laki', '08965766665', 'Jl. Lamda 3 No. 665', 'Islam', 8, 10, '150000.00', 1, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(666, 2, 'P20222666', 'Cut Naila Fadia Fiadharma 666', '84750239666', '3671010023666', 'Tangerang', '2001-08-18', 'Perempuan', '08965766666', 'Jl. Lamda 3 No. 666', 'Islam', 8, 11, '150000.00', 4, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(667, 2, 'P20222667', 'Cut Naila Fadia Fiadharma 667', '84750239667', '3671010023667', 'Tangerang', '2001-09-11', 'Perempuan', '08965766667', 'Jl. Lamda 3 No. 667', 'Islam', 9, 4, '150000.00', 2, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(668, 3, 'P20223668', 'Cut Naila Fadia Fiadharma 668', '84750239668', '3671010023668', 'Tangerang', '2001-09-04', 'Perempuan', '08965766668', 'Jl. Lamda 3 No. 668', 'Islam', 1, 10, NULL, NULL, '0', '2022-12-11 07:08:29', NULL, NULL, NULL),
(669, 2, 'P20222669', 'Cut Naila Fadia Fiadharma 669', '84750239669', '3671010023669', 'Tangerang', '2001-08-07', 'Perempuan', '08965766669', 'Jl. Lamda 3 No. 669', 'Islam', 10, 12, '150000.00', 4, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(670, 3, 'P20223670', 'Cut Naila Fadia Fiadharma 670', '84750239670', '3671010023670', 'Jakarta', '2001-11-29', 'Laki-Laki', '08965766670', 'Jl. Lamda 3 No. 670', 'Islam', 12, 7, NULL, NULL, '0', '2022-12-11 07:08:29', NULL, NULL, NULL),
(671, 2, 'P20222671', 'Cut Naila Fadia Fiadharma 671', '84750239671', '3671010023671', 'Tangerang', '2001-09-13', 'Perempuan', '08965766671', 'Jl. Lamda 3 No. 671', 'Islam', 12, 10, '150000.00', 1, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(672, 1, 'P20221672', 'Cut Naila Fadia Fiadharma 672', '84750239672', '3671010023672', 'Tangerang', '2001-07-15', 'Perempuan', '08965766672', 'Jl. Lamda 3 No. 672', 'Islam', 10, 9, '150000.00', 1, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(673, 1, 'P20221673', 'Cut Naila Fadia Fiadharma 673', '84750239673', '3671010023673', 'Tangerang', '2001-11-18', 'Perempuan', '08965766673', 'Jl. Lamda 3 No. 673', 'Islam', 11, 9, '150000.00', 3, '1', '2022-12-11 07:08:29', NULL, NULL, NULL),
(674, 3, 'P20223674', 'Cut Naila Fadia Fiadharma 674', '84750239674', '3671010023674', 'Tangerang', '2001-11-10', 'Perempuan', '08965766674', 'Jl. Lamda 3 No. 674', 'Islam', 10, 10, NULL, NULL, '0', '2022-12-11 07:08:29', NULL, NULL, NULL),
(675, 3, 'P20223675', 'Cut Naila Fadia Fiadharma 675', '84750239675', '3671010023675', 'Jakarta', '2001-06-25', 'Laki-Laki', '08965766675', 'Jl. Lamda 3 No. 675', 'Islam', 3, 12, NULL, NULL, '0', '2022-12-11 07:08:30', NULL, NULL, NULL),
(676, 3, 'P20223676', 'Cut Naila Fadia Fiadharma 676', '84750239676', '3671010023676', 'Tangerang', '2001-07-01', 'Perempuan', '08965766676', 'Jl. Lamda 3 No. 676', 'Islam', 13, 4, NULL, NULL, '0', '2022-12-11 07:08:30', NULL, NULL, NULL),
(677, 2, 'P20222677', 'Cut Naila Fadia Fiadharma 677', '84750239677', '3671010023677', 'Tangerang', '2001-09-19', 'Perempuan', '08965766677', 'Jl. Lamda 3 No. 677', 'Islam', 10, 10, '150000.00', 3, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(678, 3, 'P20223678', 'Cut Naila Fadia Fiadharma 678', '84750239678', '3671010023678', 'Tangerang', '2001-07-11', 'Perempuan', '08965766678', 'Jl. Lamda 3 No. 678', 'Islam', 7, 1, NULL, NULL, '0', '2022-12-11 07:08:30', NULL, NULL, NULL),
(679, 1, 'P20221679', 'Cut Naila Fadia Fiadharma 679', '84750239679', '3671010023679', 'Tangerang', '2001-09-16', 'Perempuan', '08965766679', 'Jl. Lamda 3 No. 679', 'Islam', 12, 3, '150000.00', 1, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(680, 2, 'P20222680', 'Cut Naila Fadia Fiadharma 680', '84750239680', '3671010023680', 'Jakarta', '2001-12-18', 'Laki-Laki', '08965766680', 'Jl. Lamda 3 No. 680', 'Islam', 13, 12, '150000.00', 1, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(681, 3, 'P20223681', 'Cut Naila Fadia Fiadharma 681', '84750239681', '3671010023681', 'Tangerang', '2001-07-04', 'Perempuan', '08965766681', 'Jl. Lamda 3 No. 681', 'Islam', 9, 5, NULL, NULL, '0', '2022-12-11 07:08:30', NULL, NULL, NULL),
(682, 1, 'P20221682', 'Cut Naila Fadia Fiadharma 682', '84750239682', '3671010023682', 'Tangerang', '2001-08-04', 'Perempuan', '08965766682', 'Jl. Lamda 3 No. 682', 'Islam', 2, 9, '150000.00', 3, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(683, 3, 'P20223683', 'Cut Naila Fadia Fiadharma 683', '84750239683', '3671010023683', 'Tangerang', '2001-10-30', 'Perempuan', '08965766683', 'Jl. Lamda 3 No. 683', 'Islam', 5, 5, NULL, NULL, '0', '2022-12-11 07:08:30', NULL, NULL, NULL),
(684, 2, 'P20222684', 'Cut Naila Fadia Fiadharma 684', '84750239684', '3671010023684', 'Tangerang', '2001-08-24', 'Perempuan', '08965766684', 'Jl. Lamda 3 No. 684', 'Islam', 8, 13, '150000.00', 3, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(685, 1, 'P20221685', 'Cut Naila Fadia Fiadharma 685', '84750239685', '3671010023685', 'Jakarta', '2001-10-05', 'Laki-Laki', '08965766685', 'Jl. Lamda 3 No. 685', 'Islam', 9, 9, '150000.00', 2, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(686, 2, 'P20222686', 'Cut Naila Fadia Fiadharma 686', '84750239686', '3671010023686', 'Tangerang', '2001-10-12', 'Perempuan', '08965766686', 'Jl. Lamda 3 No. 686', 'Islam', 10, 10, '150000.00', 2, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(687, 2, 'P20222687', 'Cut Naila Fadia Fiadharma 687', '84750239687', '3671010023687', 'Tangerang', '2001-11-07', 'Perempuan', '08965766687', 'Jl. Lamda 3 No. 687', 'Islam', 1, 1, '150000.00', 3, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(688, 3, 'P20223688', 'Cut Naila Fadia Fiadharma 688', '84750239688', '3671010023688', 'Tangerang', '2001-08-14', 'Perempuan', '08965766688', 'Jl. Lamda 3 No. 688', 'Islam', 6, 7, NULL, NULL, '0', '2022-12-11 07:08:30', NULL, NULL, NULL),
(689, 2, 'P20222689', 'Cut Naila Fadia Fiadharma 689', '84750239689', '3671010023689', 'Tangerang', '2001-07-15', 'Perempuan', '08965766689', 'Jl. Lamda 3 No. 689', 'Islam', 4, 6, '150000.00', 1, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(690, 1, 'P20221690', 'Cut Naila Fadia Fiadharma 690', '84750239690', '3671010023690', 'Jakarta', '2001-10-22', 'Laki-Laki', '08965766690', 'Jl. Lamda 3 No. 690', 'Islam', 7, 8, '150000.00', 2, '1', '2022-12-11 07:08:30', NULL, NULL, NULL),
(691, 3, 'P20223691', 'Cut Naila Fadia Fiadharma 691', '84750239691', '3671010023691', 'Tangerang', '2001-11-07', 'Perempuan', '08965766691', 'Jl. Lamda 3 No. 691', 'Islam', 7, 13, NULL, NULL, '0', '2022-12-11 07:08:30', NULL, NULL, NULL),
(692, 1, 'P20221692', 'Cut Naila Fadia Fiadharma 692', '84750239692', '3671010023692', 'Tangerang', '2001-11-15', 'Perempuan', '08965766692', 'Jl. Lamda 3 No. 692', 'Islam', 5, 7, '150000.00', 3, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(693, 1, 'P20221693', 'Cut Naila Fadia Fiadharma 693', '84750239693', '3671010023693', 'Tangerang', '2001-07-27', 'Perempuan', '08965766693', 'Jl. Lamda 3 No. 693', 'Islam', 5, 4, '150000.00', 1, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(694, 3, 'P20223694', 'Cut Naila Fadia Fiadharma 694', '84750239694', '3671010023694', 'Tangerang', '2001-10-26', 'Perempuan', '08965766694', 'Jl. Lamda 3 No. 694', 'Islam', 3, 1, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(695, 1, 'P20221695', 'Cut Naila Fadia Fiadharma 695', '84750239695', '3671010023695', 'Jakarta', '2001-10-28', 'Laki-Laki', '08965766695', 'Jl. Lamda 3 No. 695', 'Islam', 11, 1, '150000.00', 3, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(696, 1, 'P20221696', 'Cut Naila Fadia Fiadharma 696', '84750239696', '3671010023696', 'Tangerang', '2001-07-06', 'Perempuan', '08965766696', 'Jl. Lamda 3 No. 696', 'Islam', 10, 7, '150000.00', 1, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(697, 3, 'P20223697', 'Cut Naila Fadia Fiadharma 697', '84750239697', '3671010023697', 'Tangerang', '2001-11-22', 'Perempuan', '08965766697', 'Jl. Lamda 3 No. 697', 'Islam', 7, 1, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(698, 2, 'P20222698', 'Cut Naila Fadia Fiadharma 698', '84750239698', '3671010023698', 'Tangerang', '2001-07-01', 'Perempuan', '08965766698', 'Jl. Lamda 3 No. 698', 'Islam', 7, 11, '150000.00', 1, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(699, 3, 'P20223699', 'Cut Naila Fadia Fiadharma 699', '84750239699', '3671010023699', 'Tangerang', '2001-11-13', 'Perempuan', '08965766699', 'Jl. Lamda 3 No. 699', 'Islam', 4, 1, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(700, 2, 'P20222700', 'Cut Naila Fadia Fiadharma 700', '84750239700', '3671010023700', 'Jakarta', '2001-09-02', 'Laki-Laki', '08965766700', 'Jl. Lamda 3 No. 700', 'Islam', 10, 1, '150000.00', 1, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(701, 2, 'P20222701', 'Cut Naila Fadia Fiadharma 701', '84750239701', '3671010023701', 'Tangerang', '2001-08-28', 'Perempuan', '08965766701', 'Jl. Lamda 3 No. 701', 'Islam', 11, 11, '150000.00', 1, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(702, 3, 'P20223702', 'Cut Naila Fadia Fiadharma 702', '84750239702', '3671010023702', 'Tangerang', '2001-09-06', 'Perempuan', '08965766702', 'Jl. Lamda 3 No. 702', 'Islam', 9, 8, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(703, 3, 'P20223703', 'Cut Naila Fadia Fiadharma 703', '84750239703', '3671010023703', 'Tangerang', '2001-07-08', 'Perempuan', '08965766703', 'Jl. Lamda 3 No. 703', 'Islam', 12, 1, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(704, 3, 'P20223704', 'Cut Naila Fadia Fiadharma 704', '84750239704', '3671010023704', 'Tangerang', '2001-09-06', 'Perempuan', '08965766704', 'Jl. Lamda 3 No. 704', 'Islam', 5, 3, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(705, 3, 'P20223705', 'Cut Naila Fadia Fiadharma 705', '84750239705', '3671010023705', 'Jakarta', '2001-06-24', 'Laki-Laki', '08965766705', 'Jl. Lamda 3 No. 705', 'Islam', 12, 3, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(706, 3, 'P20223706', 'Cut Naila Fadia Fiadharma 706', '84750239706', '3671010023706', 'Tangerang', '2001-12-24', 'Perempuan', '08965766706', 'Jl. Lamda 3 No. 706', 'Islam', 8, 13, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(707, 3, 'P20223707', 'Cut Naila Fadia Fiadharma 707', '84750239707', '3671010023707', 'Tangerang', '2001-06-30', 'Perempuan', '08965766707', 'Jl. Lamda 3 No. 707', 'Islam', 2, 13, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(708, 3, 'P20223708', 'Cut Naila Fadia Fiadharma 708', '84750239708', '3671010023708', 'Tangerang', '2001-07-07', 'Perempuan', '08965766708', 'Jl. Lamda 3 No. 708', 'Islam', 5, 1, NULL, NULL, '0', '2022-12-11 07:08:31', NULL, NULL, NULL),
(709, 2, 'P20222709', 'Cut Naila Fadia Fiadharma 709', '84750239709', '3671010023709', 'Tangerang', '2001-10-06', 'Perempuan', '08965766709', 'Jl. Lamda 3 No. 709', 'Islam', 8, 12, '150000.00', 4, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(710, 1, 'P20221710', 'Cut Naila Fadia Fiadharma 710', '84750239710', '3671010023710', 'Jakarta', '2001-09-03', 'Laki-Laki', '08965766710', 'Jl. Lamda 3 No. 710', 'Islam', 9, 6, '150000.00', 1, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(711, 2, 'P20222711', 'Cut Naila Fadia Fiadharma 711', '84750239711', '3671010023711', 'Tangerang', '2001-08-25', 'Perempuan', '08965766711', 'Jl. Lamda 3 No. 711', 'Islam', 10, 9, '150000.00', 2, '1', '2022-12-11 07:08:31', NULL, NULL, NULL),
(712, 2, 'P20222712', 'Cut Naila Fadia Fiadharma 712', '84750239712', '3671010023712', 'Tangerang', '2001-07-18', 'Perempuan', '08965766712', 'Jl. Lamda 3 No. 712', 'Islam', 12, 9, '150000.00', 2, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(713, 3, 'P20223713', 'Cut Naila Fadia Fiadharma 713', '84750239713', '3671010023713', 'Tangerang', '2001-07-15', 'Perempuan', '08965766713', 'Jl. Lamda 3 No. 713', 'Islam', 6, 9, NULL, NULL, '0', '2022-12-11 07:08:32', NULL, NULL, NULL),
(714, 2, 'P20222714', 'Cut Naila Fadia Fiadharma 714', '84750239714', '3671010023714', 'Tangerang', '2001-07-02', 'Perempuan', '08965766714', 'Jl. Lamda 3 No. 714', 'Islam', 3, 11, '150000.00', 2, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(715, 2, 'P20222715', 'Cut Naila Fadia Fiadharma 715', '84750239715', '3671010023715', 'Jakarta', '2001-08-12', 'Laki-Laki', '08965766715', 'Jl. Lamda 3 No. 715', 'Islam', 13, 5, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(716, 3, 'P20223716', 'Cut Naila Fadia Fiadharma 716', '84750239716', '3671010023716', 'Tangerang', '2001-08-05', 'Perempuan', '08965766716', 'Jl. Lamda 3 No. 716', 'Islam', 1, 4, NULL, NULL, '0', '2022-12-11 07:08:32', NULL, NULL, NULL),
(717, 3, 'P20223717', 'Cut Naila Fadia Fiadharma 717', '84750239717', '3671010023717', 'Tangerang', '2001-06-24', 'Perempuan', '08965766717', 'Jl. Lamda 3 No. 717', 'Islam', 9, 8, NULL, NULL, '0', '2022-12-11 07:08:32', NULL, NULL, NULL),
(718, 2, 'P20222718', 'Cut Naila Fadia Fiadharma 718', '84750239718', '3671010023718', 'Tangerang', '2001-06-15', 'Perempuan', '08965766718', 'Jl. Lamda 3 No. 718', 'Islam', 6, 4, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(719, 1, 'P20221719', 'Cut Naila Fadia Fiadharma 719', '84750239719', '3671010023719', 'Tangerang', '2001-10-19', 'Perempuan', '08965766719', 'Jl. Lamda 3 No. 719', 'Islam', 4, 1, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(720, 2, 'P20222720', 'Cut Naila Fadia Fiadharma 720', '84750239720', '3671010023720', 'Jakarta', '2001-12-22', 'Laki-Laki', '08965766720', 'Jl. Lamda 3 No. 720', 'Islam', 3, 5, '150000.00', 3, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(721, 2, 'P20222721', 'Cut Naila Fadia Fiadharma 721', '84750239721', '3671010023721', 'Tangerang', '2001-10-31', 'Perempuan', '08965766721', 'Jl. Lamda 3 No. 721', 'Islam', 5, 1, '150000.00', 1, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(722, 1, 'P20221722', 'Cut Naila Fadia Fiadharma 722', '84750239722', '3671010023722', 'Tangerang', '2001-11-06', 'Perempuan', '08965766722', 'Jl. Lamda 3 No. 722', 'Islam', 6, 8, '150000.00', 1, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(723, 1, 'P20221723', 'Cut Naila Fadia Fiadharma 723', '84750239723', '3671010023723', 'Tangerang', '2001-12-21', 'Perempuan', '08965766723', 'Jl. Lamda 3 No. 723', 'Islam', 7, 4, '150000.00', 3, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(724, 1, 'P20221724', 'Cut Naila Fadia Fiadharma 724', '84750239724', '3671010023724', 'Tangerang', '2001-07-11', 'Perempuan', '08965766724', 'Jl. Lamda 3 No. 724', 'Islam', 6, 9, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(725, 2, 'P20222725', 'Cut Naila Fadia Fiadharma 725', '84750239725', '3671010023725', 'Jakarta', '2001-10-21', 'Laki-Laki', '08965766725', 'Jl. Lamda 3 No. 725', 'Islam', 13, 9, '150000.00', 1, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(726, 1, 'P20221726', 'Cut Naila Fadia Fiadharma 726', '84750239726', '3671010023726', 'Tangerang', '2001-12-19', 'Perempuan', '08965766726', 'Jl. Lamda 3 No. 726', 'Islam', 11, 5, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(727, 2, 'P20222727', 'Cut Naila Fadia Fiadharma 727', '84750239727', '3671010023727', 'Tangerang', '2001-07-25', 'Perempuan', '08965766727', 'Jl. Lamda 3 No. 727', 'Islam', 4, 2, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(728, 1, 'P20221728', 'Cut Naila Fadia Fiadharma 728', '84750239728', '3671010023728', 'Tangerang', '2001-09-30', 'Perempuan', '08965766728', 'Jl. Lamda 3 No. 728', 'Islam', 2, 13, '150000.00', 3, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(729, 1, 'P20221729', 'Cut Naila Fadia Fiadharma 729', '84750239729', '3671010023729', 'Tangerang', '2001-07-01', 'Perempuan', '08965766729', 'Jl. Lamda 3 No. 729', 'Islam', 8, 10, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(730, 1, 'P20221730', 'Cut Naila Fadia Fiadharma 730', '84750239730', '3671010023730', 'Jakarta', '2001-07-21', 'Laki-Laki', '08965766730', 'Jl. Lamda 3 No. 730', 'Islam', 8, 9, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(731, 3, 'P20223731', 'Cut Naila Fadia Fiadharma 731', '84750239731', '3671010023731', 'Tangerang', '2001-07-24', 'Perempuan', '08965766731', 'Jl. Lamda 3 No. 731', 'Islam', 7, 6, NULL, NULL, '0', '2022-12-11 07:08:32', NULL, NULL, NULL),
(732, 1, 'P20221732', 'Cut Naila Fadia Fiadharma 732', '84750239732', '3671010023732', 'Tangerang', '2001-12-06', 'Perempuan', '08965766732', 'Jl. Lamda 3 No. 732', 'Islam', 6, 10, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(733, 3, 'P20223733', 'Cut Naila Fadia Fiadharma 733', '84750239733', '3671010023733', 'Tangerang', '2001-11-24', 'Perempuan', '08965766733', 'Jl. Lamda 3 No. 733', 'Islam', 11, 6, NULL, NULL, '0', '2022-12-11 07:08:32', NULL, NULL, NULL),
(734, 1, 'P20221734', 'Cut Naila Fadia Fiadharma 734', '84750239734', '3671010023734', 'Tangerang', '2001-09-02', 'Perempuan', '08965766734', 'Jl. Lamda 3 No. 734', 'Islam', 1, 13, '150000.00', 2, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(735, 2, 'P20222735', 'Cut Naila Fadia Fiadharma 735', '84750239735', '3671010023735', 'Jakarta', '2001-06-23', 'Laki-Laki', '08965766735', 'Jl. Lamda 3 No. 735', 'Islam', 6, 6, '150000.00', 4, '1', '2022-12-11 07:08:32', NULL, NULL, NULL),
(736, 2, 'P20222736', 'Cut Naila Fadia Fiadharma 736', '84750239736', '3671010023736', 'Tangerang', '2001-11-02', 'Perempuan', '08965766736', 'Jl. Lamda 3 No. 736', 'Islam', 6, 11, '150000.00', 3, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(737, 3, 'P20223737', 'Cut Naila Fadia Fiadharma 737', '84750239737', '3671010023737', 'Tangerang', '2001-06-24', 'Perempuan', '08965766737', 'Jl. Lamda 3 No. 737', 'Islam', 10, 9, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(738, 3, 'P20223738', 'Cut Naila Fadia Fiadharma 738', '84750239738', '3671010023738', 'Tangerang', '2001-08-16', 'Perempuan', '08965766738', 'Jl. Lamda 3 No. 738', 'Islam', 9, 5, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(739, 2, 'P20222739', 'Cut Naila Fadia Fiadharma 739', '84750239739', '3671010023739', 'Tangerang', '2001-08-13', 'Perempuan', '08965766739', 'Jl. Lamda 3 No. 739', 'Islam', 8, 8, '150000.00', 4, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(740, 3, 'P20223740', 'Cut Naila Fadia Fiadharma 740', '84750239740', '3671010023740', 'Jakarta', '2001-09-20', 'Laki-Laki', '08965766740', 'Jl. Lamda 3 No. 740', 'Islam', 6, 12, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(741, 1, 'P20221741', 'Cut Naila Fadia Fiadharma 741', '84750239741', '3671010023741', 'Tangerang', '2001-08-09', 'Perempuan', '08965766741', 'Jl. Lamda 3 No. 741', 'Islam', 6, 6, '150000.00', 3, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(742, 2, 'P20222742', 'Cut Naila Fadia Fiadharma 742', '84750239742', '3671010023742', 'Tangerang', '2001-08-26', 'Perempuan', '08965766742', 'Jl. Lamda 3 No. 742', 'Islam', 3, 4, '150000.00', 3, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(743, 3, 'P20223743', 'Cut Naila Fadia Fiadharma 743', '84750239743', '3671010023743', 'Tangerang', '2001-11-15', 'Perempuan', '08965766743', 'Jl. Lamda 3 No. 743', 'Islam', 3, 6, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(744, 1, 'P20221744', 'Cut Naila Fadia Fiadharma 744', '84750239744', '3671010023744', 'Tangerang', '2001-11-27', 'Perempuan', '08965766744', 'Jl. Lamda 3 No. 744', 'Islam', 1, 11, '150000.00', 2, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(745, 3, 'P20223745', 'Cut Naila Fadia Fiadharma 745', '84750239745', '3671010023745', 'Jakarta', '2001-09-20', 'Laki-Laki', '08965766745', 'Jl. Lamda 3 No. 745', 'Islam', 8, 5, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(746, 1, 'P20221746', 'Cut Naila Fadia Fiadharma 746', '84750239746', '3671010023746', 'Tangerang', '2001-09-20', 'Perempuan', '08965766746', 'Jl. Lamda 3 No. 746', 'Islam', 10, 5, '150000.00', 1, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(747, 2, 'P20222747', 'Cut Naila Fadia Fiadharma 747', '84750239747', '3671010023747', 'Tangerang', '2001-06-30', 'Perempuan', '08965766747', 'Jl. Lamda 3 No. 747', 'Islam', 1, 13, '150000.00', 4, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(748, 3, 'P20223748', 'Cut Naila Fadia Fiadharma 748', '84750239748', '3671010023748', 'Tangerang', '2001-07-01', 'Perempuan', '08965766748', 'Jl. Lamda 3 No. 748', 'Islam', 13, 2, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(749, 3, 'P20223749', 'Cut Naila Fadia Fiadharma 749', '84750239749', '3671010023749', 'Tangerang', '2001-06-25', 'Perempuan', '08965766749', 'Jl. Lamda 3 No. 749', 'Islam', 1, 2, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(750, 2, 'P20222750', 'Cut Naila Fadia Fiadharma 750', '84750239750', '3671010023750', 'Jakarta', '2001-10-04', 'Laki-Laki', '08965766750', 'Jl. Lamda 3 No. 750', 'Islam', 12, 8, '150000.00', 2, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(751, 2, 'P20222751', 'Cut Naila Fadia Fiadharma 751', '84750239751', '3671010023751', 'Tangerang', '2001-06-22', 'Perempuan', '08965766751', 'Jl. Lamda 3 No. 751', 'Islam', 12, 1, '150000.00', 3, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(752, 2, 'P20222752', 'Cut Naila Fadia Fiadharma 752', '84750239752', '3671010023752', 'Tangerang', '2001-09-17', 'Perempuan', '08965766752', 'Jl. Lamda 3 No. 752', 'Islam', 10, 3, '150000.00', 3, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(753, 2, 'P20222753', 'Cut Naila Fadia Fiadharma 753', '84750239753', '3671010023753', 'Tangerang', '2001-12-12', 'Perempuan', '08965766753', 'Jl. Lamda 3 No. 753', 'Islam', 4, 9, '150000.00', 4, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(754, 3, 'P20223754', 'Cut Naila Fadia Fiadharma 754', '84750239754', '3671010023754', 'Tangerang', '2001-12-08', 'Perempuan', '08965766754', 'Jl. Lamda 3 No. 754', 'Islam', 4, 12, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(755, 3, 'P20223755', 'Cut Naila Fadia Fiadharma 755', '84750239755', '3671010023755', 'Jakarta', '2001-09-24', 'Laki-Laki', '08965766755', 'Jl. Lamda 3 No. 755', 'Islam', 12, 5, NULL, NULL, '0', '2022-12-11 07:08:33', NULL, NULL, NULL),
(756, 1, 'P20221756', 'Cut Naila Fadia Fiadharma 756', '84750239756', '3671010023756', 'Tangerang', '2001-06-16', 'Perempuan', '08965766756', 'Jl. Lamda 3 No. 756', 'Islam', 3, 12, '150000.00', 1, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(757, 2, 'P20222757', 'Cut Naila Fadia Fiadharma 757', '84750239757', '3671010023757', 'Tangerang', '2001-10-21', 'Perempuan', '08965766757', 'Jl. Lamda 3 No. 757', 'Islam', 10, 7, '150000.00', 3, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(758, 2, 'P20222758', 'Cut Naila Fadia Fiadharma 758', '84750239758', '3671010023758', 'Tangerang', '2001-07-23', 'Perempuan', '08965766758', 'Jl. Lamda 3 No. 758', 'Islam', 5, 11, '150000.00', 1, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(759, 2, 'P20222759', 'Cut Naila Fadia Fiadharma 759', '84750239759', '3671010023759', 'Tangerang', '2001-12-15', 'Perempuan', '08965766759', 'Jl. Lamda 3 No. 759', 'Islam', 3, 5, '150000.00', 1, '1', '2022-12-11 07:08:33', NULL, NULL, NULL),
(760, 2, 'P20222760', 'Cut Naila Fadia Fiadharma 760', '84750239760', '3671010023760', 'Jakarta', '2001-08-22', 'Laki-Laki', '08965766760', 'Jl. Lamda 3 No. 760', 'Islam', 10, 10, '150000.00', 2, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(761, 1, 'P20221761', 'Cut Naila Fadia Fiadharma 761', '84750239761', '3671010023761', 'Tangerang', '2001-09-22', 'Perempuan', '08965766761', 'Jl. Lamda 3 No. 761', 'Islam', 9, 8, '150000.00', 4, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(762, 2, 'P20222762', 'Cut Naila Fadia Fiadharma 762', '84750239762', '3671010023762', 'Tangerang', '2001-12-24', 'Perempuan', '08965766762', 'Jl. Lamda 3 No. 762', 'Islam', 4, 7, '150000.00', 3, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(763, 3, 'P20223763', 'Cut Naila Fadia Fiadharma 763', '84750239763', '3671010023763', 'Tangerang', '2001-06-26', 'Perempuan', '08965766763', 'Jl. Lamda 3 No. 763', 'Islam', 9, 9, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(764, 3, 'P20223764', 'Cut Naila Fadia Fiadharma 764', '84750239764', '3671010023764', 'Tangerang', '2001-11-29', 'Perempuan', '08965766764', 'Jl. Lamda 3 No. 764', 'Islam', 2, 3, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(765, 2, 'P20222765', 'Cut Naila Fadia Fiadharma 765', '84750239765', '3671010023765', 'Jakarta', '2001-10-16', 'Laki-Laki', '08965766765', 'Jl. Lamda 3 No. 765', 'Islam', 2, 6, '150000.00', 4, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(766, 1, 'P20221766', 'Cut Naila Fadia Fiadharma 766', '84750239766', '3671010023766', 'Tangerang', '2001-07-05', 'Perempuan', '08965766766', 'Jl. Lamda 3 No. 766', 'Islam', 4, 6, '150000.00', 1, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(767, 2, 'P20222767', 'Cut Naila Fadia Fiadharma 767', '84750239767', '3671010023767', 'Tangerang', '2001-07-15', 'Perempuan', '08965766767', 'Jl. Lamda 3 No. 767', 'Islam', 1, 4, '150000.00', 3, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(768, 2, 'P20222768', 'Cut Naila Fadia Fiadharma 768', '84750239768', '3671010023768', 'Tangerang', '2001-10-08', 'Perempuan', '08965766768', 'Jl. Lamda 3 No. 768', 'Islam', 1, 5, '150000.00', 3, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(769, 3, 'P20223769', 'Cut Naila Fadia Fiadharma 769', '84750239769', '3671010023769', 'Tangerang', '2001-09-19', 'Perempuan', '08965766769', 'Jl. Lamda 3 No. 769', 'Islam', 3, 7, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(770, 1, 'P20221770', 'Cut Naila Fadia Fiadharma 770', '84750239770', '3671010023770', 'Jakarta', '2001-11-15', 'Laki-Laki', '08965766770', 'Jl. Lamda 3 No. 770', 'Islam', 10, 5, '150000.00', 4, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(771, 1, 'P20221771', 'Cut Naila Fadia Fiadharma 771', '84750239771', '3671010023771', 'Tangerang', '2001-06-20', 'Perempuan', '08965766771', 'Jl. Lamda 3 No. 771', 'Islam', 12, 3, '150000.00', 4, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(772, 2, 'P20222772', 'Cut Naila Fadia Fiadharma 772', '84750239772', '3671010023772', 'Tangerang', '2001-10-03', 'Perempuan', '08965766772', 'Jl. Lamda 3 No. 772', 'Islam', 9, 6, '150000.00', 2, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(773, 1, 'P20221773', 'Cut Naila Fadia Fiadharma 773', '84750239773', '3671010023773', 'Tangerang', '2001-11-02', 'Perempuan', '08965766773', 'Jl. Lamda 3 No. 773', 'Islam', 13, 1, '150000.00', 3, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(774, 1, 'P20221774', 'Cut Naila Fadia Fiadharma 774', '84750239774', '3671010023774', 'Tangerang', '2001-07-24', 'Perempuan', '08965766774', 'Jl. Lamda 3 No. 774', 'Islam', 3, 9, '150000.00', 1, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(775, 3, 'P20223775', 'Cut Naila Fadia Fiadharma 775', '84750239775', '3671010023775', 'Jakarta', '2001-07-06', 'Laki-Laki', '08965766775', 'Jl. Lamda 3 No. 775', 'Islam', 11, 6, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(776, 1, 'P20221776', 'Cut Naila Fadia Fiadharma 776', '84750239776', '3671010023776', 'Tangerang', '2001-07-19', 'Perempuan', '08965766776', 'Jl. Lamda 3 No. 776', 'Islam', 4, 5, '150000.00', 1, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(777, 3, 'P20223777', 'Cut Naila Fadia Fiadharma 777', '84750239777', '3671010023777', 'Tangerang', '2001-12-09', 'Perempuan', '08965766777', 'Jl. Lamda 3 No. 777', 'Islam', 11, 2, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(778, 3, 'P20223778', 'Cut Naila Fadia Fiadharma 778', '84750239778', '3671010023778', 'Tangerang', '2001-08-27', 'Perempuan', '08965766778', 'Jl. Lamda 3 No. 778', 'Islam', 8, 13, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(779, 2, 'P20222779', 'Cut Naila Fadia Fiadharma 779', '84750239779', '3671010023779', 'Tangerang', '2001-10-04', 'Perempuan', '08965766779', 'Jl. Lamda 3 No. 779', 'Islam', 1, 3, '150000.00', 1, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(780, 2, 'P20222780', 'Cut Naila Fadia Fiadharma 780', '84750239780', '3671010023780', 'Jakarta', '2001-07-03', 'Laki-Laki', '08965766780', 'Jl. Lamda 3 No. 780', 'Islam', 8, 1, '150000.00', 3, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(781, 3, 'P20223781', 'Cut Naila Fadia Fiadharma 781', '84750239781', '3671010023781', 'Tangerang', '2001-07-25', 'Perempuan', '08965766781', 'Jl. Lamda 3 No. 781', 'Islam', 4, 2, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(782, 2, 'P20222782', 'Cut Naila Fadia Fiadharma 782', '84750239782', '3671010023782', 'Tangerang', '2001-06-29', 'Perempuan', '08965766782', 'Jl. Lamda 3 No. 782', 'Islam', 7, 4, '150000.00', 2, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(783, 2, 'P20222783', 'Cut Naila Fadia Fiadharma 783', '84750239783', '3671010023783', 'Tangerang', '2001-07-24', 'Perempuan', '08965766783', 'Jl. Lamda 3 No. 783', 'Islam', 8, 3, '150000.00', 3, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(784, 1, 'P20221784', 'Cut Naila Fadia Fiadharma 784', '84750239784', '3671010023784', 'Tangerang', '2001-10-24', 'Perempuan', '08965766784', 'Jl. Lamda 3 No. 784', 'Islam', 11, 2, '150000.00', 2, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(785, 3, 'P20223785', 'Cut Naila Fadia Fiadharma 785', '84750239785', '3671010023785', 'Jakarta', '2001-09-21', 'Laki-Laki', '08965766785', 'Jl. Lamda 3 No. 785', 'Islam', 4, 2, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(786, 1, 'P20221786', 'Cut Naila Fadia Fiadharma 786', '84750239786', '3671010023786', 'Tangerang', '2001-10-31', 'Perempuan', '08965766786', 'Jl. Lamda 3 No. 786', 'Islam', 1, 13, '150000.00', 1, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(787, 3, 'P20223787', 'Cut Naila Fadia Fiadharma 787', '84750239787', '3671010023787', 'Tangerang', '2001-12-30', 'Perempuan', '08965766787', 'Jl. Lamda 3 No. 787', 'Islam', 7, 6, NULL, NULL, '0', '2022-12-11 07:08:34', NULL, NULL, NULL),
(788, 2, 'P20222788', 'Cut Naila Fadia Fiadharma 788', '84750239788', '3671010023788', 'Tangerang', '2001-06-23', 'Perempuan', '08965766788', 'Jl. Lamda 3 No. 788', 'Islam', 5, 8, '150000.00', 3, '1', '2022-12-11 07:08:34', NULL, NULL, NULL),
(789, 3, 'P20223789', 'Cut Naila Fadia Fiadharma 789', '84750239789', '3671010023789', 'Tangerang', '2001-08-10', 'Perempuan', '08965766789', 'Jl. Lamda 3 No. 789', 'Islam', 1, 5, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(790, 2, 'P20222790', 'Cut Naila Fadia Fiadharma 790', '84750239790', '3671010023790', 'Jakarta', '2001-12-10', 'Laki-Laki', '08965766790', 'Jl. Lamda 3 No. 790', 'Islam', 9, 1, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(791, 2, 'P20222791', 'Cut Naila Fadia Fiadharma 791', '84750239791', '3671010023791', 'Tangerang', '2001-08-07', 'Perempuan', '08965766791', 'Jl. Lamda 3 No. 791', 'Islam', 4, 1, '150000.00', 2, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(792, 1, 'P20221792', 'Cut Naila Fadia Fiadharma 792', '84750239792', '3671010023792', 'Tangerang', '2001-06-21', 'Perempuan', '08965766792', 'Jl. Lamda 3 No. 792', 'Islam', 1, 11, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(793, 1, 'P20221793', 'Cut Naila Fadia Fiadharma 793', '84750239793', '3671010023793', 'Tangerang', '2001-07-16', 'Perempuan', '08965766793', 'Jl. Lamda 3 No. 793', 'Islam', 12, 4, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(794, 1, 'P20221794', 'Cut Naila Fadia Fiadharma 794', '84750239794', '3671010023794', 'Tangerang', '2001-12-07', 'Perempuan', '08965766794', 'Jl. Lamda 3 No. 794', 'Islam', 5, 1, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(795, 1, 'P20221795', 'Cut Naila Fadia Fiadharma 795', '84750239795', '3671010023795', 'Jakarta', '2001-06-27', 'Laki-Laki', '08965766795', 'Jl. Lamda 3 No. 795', 'Islam', 9, 13, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(796, 2, 'P20222796', 'Cut Naila Fadia Fiadharma 796', '84750239796', '3671010023796', 'Tangerang', '2001-12-07', 'Perempuan', '08965766796', 'Jl. Lamda 3 No. 796', 'Islam', 9, 9, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(797, 2, 'P20222797', 'Cut Naila Fadia Fiadharma 797', '84750239797', '3671010023797', 'Tangerang', '2001-10-01', 'Perempuan', '08965766797', 'Jl. Lamda 3 No. 797', 'Islam', 1, 9, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(798, 3, 'P20223798', 'Cut Naila Fadia Fiadharma 798', '84750239798', '3671010023798', 'Tangerang', '2001-06-22', 'Perempuan', '08965766798', 'Jl. Lamda 3 No. 798', 'Islam', 6, 9, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(799, 1, 'P20221799', 'Cut Naila Fadia Fiadharma 799', '84750239799', '3671010023799', 'Tangerang', '2001-12-30', 'Perempuan', '08965766799', 'Jl. Lamda 3 No. 799', 'Islam', 7, 8, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(800, 1, 'P20221800', 'Cut Naila Fadia Fiadharma 800', '84750239800', '3671010023800', 'Jakarta', '2001-09-03', 'Laki-Laki', '08965766800', 'Jl. Lamda 3 No. 800', 'Islam', 7, 11, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(801, 3, 'P20223801', 'Cut Naila Fadia Fiadharma 801', '84750239801', '3671010023801', 'Tangerang', '2001-06-23', 'Perempuan', '08965766801', 'Jl. Lamda 3 No. 801', 'Islam', 12, 8, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(802, 1, 'P20221802', 'Cut Naila Fadia Fiadharma 802', '84750239802', '3671010023802', 'Tangerang', '2001-11-03', 'Perempuan', '08965766802', 'Jl. Lamda 3 No. 802', 'Islam', 4, 12, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(803, 3, 'P20223803', 'Cut Naila Fadia Fiadharma 803', '84750239803', '3671010023803', 'Tangerang', '2001-10-14', 'Perempuan', '08965766803', 'Jl. Lamda 3 No. 803', 'Islam', 10, 9, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(804, 1, 'P20221804', 'Cut Naila Fadia Fiadharma 804', '84750239804', '3671010023804', 'Tangerang', '2001-10-22', 'Perempuan', '08965766804', 'Jl. Lamda 3 No. 804', 'Islam', 8, 6, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(805, 3, 'P20223805', 'Cut Naila Fadia Fiadharma 805', '84750239805', '3671010023805', 'Jakarta', '2001-10-30', 'Laki-Laki', '08965766805', 'Jl. Lamda 3 No. 805', 'Islam', 7, 8, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(806, 3, 'P20223806', 'Cut Naila Fadia Fiadharma 806', '84750239806', '3671010023806', 'Tangerang', '2001-08-09', 'Perempuan', '08965766806', 'Jl. Lamda 3 No. 806', 'Islam', 8, 10, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(807, 1, 'P20221807', 'Cut Naila Fadia Fiadharma 807', '84750239807', '3671010023807', 'Tangerang', '2001-07-31', 'Perempuan', '08965766807', 'Jl. Lamda 3 No. 807', 'Islam', 10, 11, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(808, 3, 'P20223808', 'Cut Naila Fadia Fiadharma 808', '84750239808', '3671010023808', 'Tangerang', '2001-09-11', 'Perempuan', '08965766808', 'Jl. Lamda 3 No. 808', 'Islam', 4, 11, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(809, 3, 'P20223809', 'Cut Naila Fadia Fiadharma 809', '84750239809', '3671010023809', 'Tangerang', '2001-11-30', 'Perempuan', '08965766809', 'Jl. Lamda 3 No. 809', 'Islam', 6, 1, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(810, 3, 'P20223810', 'Cut Naila Fadia Fiadharma 810', '84750239810', '3671010023810', 'Jakarta', '2001-07-07', 'Laki-Laki', '08965766810', 'Jl. Lamda 3 No. 810', 'Islam', 9, 6, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(811, 1, 'P20221811', 'Cut Naila Fadia Fiadharma 811', '84750239811', '3671010023811', 'Tangerang', '2001-08-24', 'Perempuan', '08965766811', 'Jl. Lamda 3 No. 811', 'Islam', 6, 13, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(812, 1, 'P20221812', 'Cut Naila Fadia Fiadharma 812', '84750239812', '3671010023812', 'Tangerang', '2001-08-19', 'Perempuan', '08965766812', 'Jl. Lamda 3 No. 812', 'Islam', 5, 5, '150000.00', 2, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(813, 3, 'P20223813', 'Cut Naila Fadia Fiadharma 813', '84750239813', '3671010023813', 'Tangerang', '2001-10-12', 'Perempuan', '08965766813', 'Jl. Lamda 3 No. 813', 'Islam', 6, 13, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(814, 2, 'P20222814', 'Cut Naila Fadia Fiadharma 814', '84750239814', '3671010023814', 'Tangerang', '2001-08-06', 'Perempuan', '08965766814', 'Jl. Lamda 3 No. 814', 'Islam', 12, 11, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(815, 2, 'P20222815', 'Cut Naila Fadia Fiadharma 815', '84750239815', '3671010023815', 'Jakarta', '2001-07-27', 'Laki-Laki', '08965766815', 'Jl. Lamda 3 No. 815', 'Islam', 2, 1, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(816, 3, 'P20223816', 'Cut Naila Fadia Fiadharma 816', '84750239816', '3671010023816', 'Tangerang', '2001-08-20', 'Perempuan', '08965766816', 'Jl. Lamda 3 No. 816', 'Islam', 9, 11, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(817, 3, 'P20223817', 'Cut Naila Fadia Fiadharma 817', '84750239817', '3671010023817', 'Tangerang', '2001-08-12', 'Perempuan', '08965766817', 'Jl. Lamda 3 No. 817', 'Islam', 7, 13, NULL, NULL, '0', '2022-12-11 07:08:35', NULL, NULL, NULL),
(818, 2, 'P20222818', 'Cut Naila Fadia Fiadharma 818', '84750239818', '3671010023818', 'Tangerang', '2001-11-01', 'Perempuan', '08965766818', 'Jl. Lamda 3 No. 818', 'Islam', 8, 5, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(819, 2, 'P20222819', 'Cut Naila Fadia Fiadharma 819', '84750239819', '3671010023819', 'Tangerang', '2001-08-05', 'Perempuan', '08965766819', 'Jl. Lamda 3 No. 819', 'Islam', 10, 8, '150000.00', 2, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(820, 1, 'P20221820', 'Cut Naila Fadia Fiadharma 820', '84750239820', '3671010023820', 'Jakarta', '2001-10-24', 'Laki-Laki', '08965766820', 'Jl. Lamda 3 No. 820', 'Islam', 11, 5, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(821, 1, 'P20221821', 'Cut Naila Fadia Fiadharma 821', '84750239821', '3671010023821', 'Tangerang', '2001-11-01', 'Perempuan', '08965766821', 'Jl. Lamda 3 No. 821', 'Islam', 7, 6, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(822, 1, 'P20221822', 'Cut Naila Fadia Fiadharma 822', '84750239822', '3671010023822', 'Tangerang', '2001-10-18', 'Perempuan', '08965766822', 'Jl. Lamda 3 No. 822', 'Islam', 6, 9, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(823, 2, 'P20222823', 'Cut Naila Fadia Fiadharma 823', '84750239823', '3671010023823', 'Tangerang', '2001-11-15', 'Perempuan', '08965766823', 'Jl. Lamda 3 No. 823', 'Islam', 9, 5, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(824, 2, 'P20222824', 'Cut Naila Fadia Fiadharma 824', '84750239824', '3671010023824', 'Tangerang', '2001-08-13', 'Perempuan', '08965766824', 'Jl. Lamda 3 No. 824', 'Islam', 5, 12, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(825, 1, 'P20221825', 'Cut Naila Fadia Fiadharma 825', '84750239825', '3671010023825', 'Jakarta', '2001-08-05', 'Laki-Laki', '08965766825', 'Jl. Lamda 3 No. 825', 'Islam', 6, 13, '150000.00', 4, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(826, 2, 'P20222826', 'Cut Naila Fadia Fiadharma 826', '84750239826', '3671010023826', 'Tangerang', '2001-07-28', 'Perempuan', '08965766826', 'Jl. Lamda 3 No. 826', 'Islam', 9, 3, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(827, 2, 'P20222827', 'Cut Naila Fadia Fiadharma 827', '84750239827', '3671010023827', 'Tangerang', '2001-08-31', 'Perempuan', '08965766827', 'Jl. Lamda 3 No. 827', 'Islam', 5, 5, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(828, 1, 'P20221828', 'Cut Naila Fadia Fiadharma 828', '84750239828', '3671010023828', 'Tangerang', '2001-11-21', 'Perempuan', '08965766828', 'Jl. Lamda 3 No. 828', 'Islam', 13, 10, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(829, 2, 'P20222829', 'Cut Naila Fadia Fiadharma 829', '84750239829', '3671010023829', 'Tangerang', '2001-10-17', 'Perempuan', '08965766829', 'Jl. Lamda 3 No. 829', 'Islam', 7, 1, '150000.00', 2, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(830, 2, 'P20222830', 'Cut Naila Fadia Fiadharma 830', '84750239830', '3671010023830', 'Jakarta', '2001-12-28', 'Laki-Laki', '08965766830', 'Jl. Lamda 3 No. 830', 'Islam', 12, 3, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL);
INSERT INTO `pendaftar` (`id_pendaftar`, `id_jalur`, `no_pendaftar`, `nama`, `nisn`, `nik`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `no_hp`, `alamat`, `agama`, `id_prodi1`, `id_prodi2`, `nominal_bayar`, `id_bank`, `is_bayar`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(831, 2, 'P20222831', 'Cut Naila Fadia Fiadharma 831', '84750239831', '3671010023831', 'Tangerang', '2001-07-09', 'Perempuan', '08965766831', 'Jl. Lamda 3 No. 831', 'Islam', 13, 2, '150000.00', 1, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(832, 2, 'P20222832', 'Cut Naila Fadia Fiadharma 832', '84750239832', '3671010023832', 'Tangerang', '2001-07-20', 'Perempuan', '08965766832', 'Jl. Lamda 3 No. 832', 'Islam', 7, 4, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(833, 1, 'P20221833', 'Cut Naila Fadia Fiadharma 833', '84750239833', '3671010023833', 'Tangerang', '2001-07-24', 'Perempuan', '08965766833', 'Jl. Lamda 3 No. 833', 'Islam', 7, 9, '150000.00', 3, '1', '2022-12-11 07:08:35', NULL, NULL, NULL),
(834, 3, 'P20223834', 'Cut Naila Fadia Fiadharma 834', '84750239834', '3671010023834', 'Tangerang', '2001-07-15', 'Perempuan', '08965766834', 'Jl. Lamda 3 No. 834', 'Islam', 8, 2, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(835, 1, 'P20221835', 'Cut Naila Fadia Fiadharma 835', '84750239835', '3671010023835', 'Jakarta', '2001-08-28', 'Laki-Laki', '08965766835', 'Jl. Lamda 3 No. 835', 'Islam', 1, 9, '150000.00', 3, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(836, 3, 'P20223836', 'Cut Naila Fadia Fiadharma 836', '84750239836', '3671010023836', 'Tangerang', '2001-10-28', 'Perempuan', '08965766836', 'Jl. Lamda 3 No. 836', 'Islam', 3, 10, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(837, 1, 'P20221837', 'Cut Naila Fadia Fiadharma 837', '84750239837', '3671010023837', 'Tangerang', '2001-10-08', 'Perempuan', '08965766837', 'Jl. Lamda 3 No. 837', 'Islam', 2, 2, '150000.00', 1, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(838, 1, 'P20221838', 'Cut Naila Fadia Fiadharma 838', '84750239838', '3671010023838', 'Tangerang', '2001-09-01', 'Perempuan', '08965766838', 'Jl. Lamda 3 No. 838', 'Islam', 13, 4, '150000.00', 4, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(839, 3, 'P20223839', 'Cut Naila Fadia Fiadharma 839', '84750239839', '3671010023839', 'Tangerang', '2001-10-11', 'Perempuan', '08965766839', 'Jl. Lamda 3 No. 839', 'Islam', 6, 6, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(840, 2, 'P20222840', 'Cut Naila Fadia Fiadharma 840', '84750239840', '3671010023840', 'Jakarta', '2001-08-21', 'Laki-Laki', '08965766840', 'Jl. Lamda 3 No. 840', 'Islam', 2, 5, '150000.00', 3, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(841, 1, 'P20221841', 'Cut Naila Fadia Fiadharma 841', '84750239841', '3671010023841', 'Tangerang', '2001-10-26', 'Perempuan', '08965766841', 'Jl. Lamda 3 No. 841', 'Islam', 5, 6, '150000.00', 4, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(842, 3, 'P20223842', 'Cut Naila Fadia Fiadharma 842', '84750239842', '3671010023842', 'Tangerang', '2001-06-17', 'Perempuan', '08965766842', 'Jl. Lamda 3 No. 842', 'Islam', 2, 4, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(843, 2, 'P20222843', 'Cut Naila Fadia Fiadharma 843', '84750239843', '3671010023843', 'Tangerang', '2001-10-08', 'Perempuan', '08965766843', 'Jl. Lamda 3 No. 843', 'Islam', 1, 2, '150000.00', 1, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(844, 1, 'P20221844', 'Cut Naila Fadia Fiadharma 844', '84750239844', '3671010023844', 'Tangerang', '2001-09-09', 'Perempuan', '08965766844', 'Jl. Lamda 3 No. 844', 'Islam', 9, 9, '150000.00', 1, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(845, 1, 'P20221845', 'Cut Naila Fadia Fiadharma 845', '84750239845', '3671010023845', 'Jakarta', '2001-06-24', 'Laki-Laki', '08965766845', 'Jl. Lamda 3 No. 845', 'Islam', 6, 4, '150000.00', 4, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(846, 1, 'P20221846', 'Cut Naila Fadia Fiadharma 846', '84750239846', '3671010023846', 'Tangerang', '2001-06-27', 'Perempuan', '08965766846', 'Jl. Lamda 3 No. 846', 'Islam', 10, 12, '150000.00', 1, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(847, 3, 'P20223847', 'Cut Naila Fadia Fiadharma 847', '84750239847', '3671010023847', 'Tangerang', '2001-08-15', 'Perempuan', '08965766847', 'Jl. Lamda 3 No. 847', 'Islam', 8, 10, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(848, 3, 'P20223848', 'Cut Naila Fadia Fiadharma 848', '84750239848', '3671010023848', 'Tangerang', '2001-11-18', 'Perempuan', '08965766848', 'Jl. Lamda 3 No. 848', 'Islam', 8, 9, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(849, 3, 'P20223849', 'Cut Naila Fadia Fiadharma 849', '84750239849', '3671010023849', 'Tangerang', '2001-11-03', 'Perempuan', '08965766849', 'Jl. Lamda 3 No. 849', 'Islam', 10, 1, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(850, 3, 'P20223850', 'Cut Naila Fadia Fiadharma 850', '84750239850', '3671010023850', 'Jakarta', '2001-08-04', 'Laki-Laki', '08965766850', 'Jl. Lamda 3 No. 850', 'Islam', 2, 3, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(851, 3, 'P20223851', 'Cut Naila Fadia Fiadharma 851', '84750239851', '3671010023851', 'Tangerang', '2001-09-17', 'Perempuan', '08965766851', 'Jl. Lamda 3 No. 851', 'Islam', 12, 5, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(852, 2, 'P20222852', 'Cut Naila Fadia Fiadharma 852', '84750239852', '3671010023852', 'Tangerang', '2001-11-12', 'Perempuan', '08965766852', 'Jl. Lamda 3 No. 852', 'Islam', 13, 7, '150000.00', 2, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(853, 1, 'P20221853', 'Cut Naila Fadia Fiadharma 853', '84750239853', '3671010023853', 'Tangerang', '2001-08-16', 'Perempuan', '08965766853', 'Jl. Lamda 3 No. 853', 'Islam', 10, 3, '150000.00', 4, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(854, 1, 'P20221854', 'Cut Naila Fadia Fiadharma 854', '84750239854', '3671010023854', 'Tangerang', '2001-07-12', 'Perempuan', '08965766854', 'Jl. Lamda 3 No. 854', 'Islam', 2, 9, '150000.00', 4, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(855, 1, 'P20221855', 'Cut Naila Fadia Fiadharma 855', '84750239855', '3671010023855', 'Jakarta', '2001-08-28', 'Laki-Laki', '08965766855', 'Jl. Lamda 3 No. 855', 'Islam', 5, 7, '150000.00', 1, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(856, 3, 'P20223856', 'Cut Naila Fadia Fiadharma 856', '84750239856', '3671010023856', 'Tangerang', '2001-10-28', 'Perempuan', '08965766856', 'Jl. Lamda 3 No. 856', 'Islam', 4, 5, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(857, 1, 'P20221857', 'Cut Naila Fadia Fiadharma 857', '84750239857', '3671010023857', 'Tangerang', '2001-09-27', 'Perempuan', '08965766857', 'Jl. Lamda 3 No. 857', 'Islam', 13, 5, '150000.00', 4, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(858, 1, 'P20221858', 'Cut Naila Fadia Fiadharma 858', '84750239858', '3671010023858', 'Tangerang', '2001-08-01', 'Perempuan', '08965766858', 'Jl. Lamda 3 No. 858', 'Islam', 1, 6, '150000.00', 1, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(859, 3, 'P20223859', 'Cut Naila Fadia Fiadharma 859', '84750239859', '3671010023859', 'Tangerang', '2001-11-10', 'Perempuan', '08965766859', 'Jl. Lamda 3 No. 859', 'Islam', 12, 5, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(860, 1, 'P20221860', 'Cut Naila Fadia Fiadharma 860', '84750239860', '3671010023860', 'Jakarta', '2001-07-16', 'Laki-Laki', '08965766860', 'Jl. Lamda 3 No. 860', 'Islam', 8, 11, '150000.00', 2, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(861, 1, 'P20221861', 'Cut Naila Fadia Fiadharma 861', '84750239861', '3671010023861', 'Tangerang', '2001-09-13', 'Perempuan', '08965766861', 'Jl. Lamda 3 No. 861', 'Islam', 9, 5, '150000.00', 3, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(862, 2, 'P20222862', 'Cut Naila Fadia Fiadharma 862', '84750239862', '3671010023862', 'Tangerang', '2001-09-26', 'Perempuan', '08965766862', 'Jl. Lamda 3 No. 862', 'Islam', 5, 9, '150000.00', 3, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(863, 3, 'P20223863', 'Cut Naila Fadia Fiadharma 863', '84750239863', '3671010023863', 'Tangerang', '2001-10-04', 'Perempuan', '08965766863', 'Jl. Lamda 3 No. 863', 'Islam', 12, 4, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(864, 3, 'P20223864', 'Cut Naila Fadia Fiadharma 864', '84750239864', '3671010023864', 'Tangerang', '2001-06-21', 'Perempuan', '08965766864', 'Jl. Lamda 3 No. 864', 'Islam', 9, 3, NULL, NULL, '0', '2022-12-11 07:08:36', NULL, NULL, NULL),
(865, 1, 'P20221865', 'Cut Naila Fadia Fiadharma 865', '84750239865', '3671010023865', 'Jakarta', '2001-10-31', 'Laki-Laki', '08965766865', 'Jl. Lamda 3 No. 865', 'Islam', 3, 1, '150000.00', 4, '1', '2022-12-11 07:08:36', NULL, NULL, NULL),
(866, 2, 'P20222866', 'Cut Naila Fadia Fiadharma 866', '84750239866', '3671010023866', 'Tangerang', '2001-10-06', 'Perempuan', '08965766866', 'Jl. Lamda 3 No. 866', 'Islam', 9, 5, '150000.00', 2, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(867, 1, 'P20221867', 'Cut Naila Fadia Fiadharma 867', '84750239867', '3671010023867', 'Tangerang', '2001-06-22', 'Perempuan', '08965766867', 'Jl. Lamda 3 No. 867', 'Islam', 13, 2, '150000.00', 3, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(868, 1, 'P20221868', 'Cut Naila Fadia Fiadharma 868', '84750239868', '3671010023868', 'Tangerang', '2001-08-01', 'Perempuan', '08965766868', 'Jl. Lamda 3 No. 868', 'Islam', 10, 9, '150000.00', 2, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(869, 2, 'P20222869', 'Cut Naila Fadia Fiadharma 869', '84750239869', '3671010023869', 'Tangerang', '2001-11-13', 'Perempuan', '08965766869', 'Jl. Lamda 3 No. 869', 'Islam', 4, 11, '150000.00', 3, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(870, 2, 'P20222870', 'Cut Naila Fadia Fiadharma 870', '84750239870', '3671010023870', 'Jakarta', '2001-09-19', 'Laki-Laki', '08965766870', 'Jl. Lamda 3 No. 870', 'Islam', 6, 7, '150000.00', 1, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(871, 3, 'P20223871', 'Cut Naila Fadia Fiadharma 871', '84750239871', '3671010023871', 'Tangerang', '2001-11-03', 'Perempuan', '08965766871', 'Jl. Lamda 3 No. 871', 'Islam', 12, 4, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(872, 3, 'P20223872', 'Cut Naila Fadia Fiadharma 872', '84750239872', '3671010023872', 'Tangerang', '2001-06-24', 'Perempuan', '08965766872', 'Jl. Lamda 3 No. 872', 'Islam', 5, 5, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(873, 2, 'P20222873', 'Cut Naila Fadia Fiadharma 873', '84750239873', '3671010023873', 'Tangerang', '2001-08-27', 'Perempuan', '08965766873', 'Jl. Lamda 3 No. 873', 'Islam', 3, 6, '150000.00', 2, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(874, 1, 'P20221874', 'Cut Naila Fadia Fiadharma 874', '84750239874', '3671010023874', 'Tangerang', '2001-08-15', 'Perempuan', '08965766874', 'Jl. Lamda 3 No. 874', 'Islam', 12, 9, '150000.00', 2, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(875, 2, 'P20222875', 'Cut Naila Fadia Fiadharma 875', '84750239875', '3671010023875', 'Jakarta', '2001-10-05', 'Laki-Laki', '08965766875', 'Jl. Lamda 3 No. 875', 'Islam', 13, 5, '150000.00', 2, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(876, 2, 'P20222876', 'Cut Naila Fadia Fiadharma 876', '84750239876', '3671010023876', 'Tangerang', '2001-10-25', 'Perempuan', '08965766876', 'Jl. Lamda 3 No. 876', 'Islam', 12, 9, '150000.00', 4, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(877, 3, 'P20223877', 'Cut Naila Fadia Fiadharma 877', '84750239877', '3671010023877', 'Tangerang', '2001-07-31', 'Perempuan', '08965766877', 'Jl. Lamda 3 No. 877', 'Islam', 12, 10, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(878, 1, 'P20221878', 'Cut Naila Fadia Fiadharma 878', '84750239878', '3671010023878', 'Tangerang', '2001-12-23', 'Perempuan', '08965766878', 'Jl. Lamda 3 No. 878', 'Islam', 6, 11, '150000.00', 3, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(879, 3, 'P20223879', 'Cut Naila Fadia Fiadharma 879', '84750239879', '3671010023879', 'Tangerang', '2001-10-26', 'Perempuan', '08965766879', 'Jl. Lamda 3 No. 879', 'Islam', 4, 3, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(880, 1, 'P20221880', 'Cut Naila Fadia Fiadharma 880', '84750239880', '3671010023880', 'Jakarta', '2001-12-21', 'Laki-Laki', '08965766880', 'Jl. Lamda 3 No. 880', 'Islam', 11, 7, '150000.00', 4, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(881, 3, 'P20223881', 'Cut Naila Fadia Fiadharma 881', '84750239881', '3671010023881', 'Tangerang', '2001-08-04', 'Perempuan', '08965766881', 'Jl. Lamda 3 No. 881', 'Islam', 12, 13, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(882, 2, 'P20222882', 'Cut Naila Fadia Fiadharma 882', '84750239882', '3671010023882', 'Tangerang', '2001-08-28', 'Perempuan', '08965766882', 'Jl. Lamda 3 No. 882', 'Islam', 9, 12, '150000.00', 4, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(883, 3, 'P20223883', 'Cut Naila Fadia Fiadharma 883', '84750239883', '3671010023883', 'Tangerang', '2001-11-28', 'Perempuan', '08965766883', 'Jl. Lamda 3 No. 883', 'Islam', 10, 4, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(884, 3, 'P20223884', 'Cut Naila Fadia Fiadharma 884', '84750239884', '3671010023884', 'Tangerang', '2001-10-10', 'Perempuan', '08965766884', 'Jl. Lamda 3 No. 884', 'Islam', 13, 11, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(885, 3, 'P20223885', 'Cut Naila Fadia Fiadharma 885', '84750239885', '3671010023885', 'Jakarta', '2001-06-18', 'Laki-Laki', '08965766885', 'Jl. Lamda 3 No. 885', 'Islam', 6, 9, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(886, 3, 'P20223886', 'Cut Naila Fadia Fiadharma 886', '84750239886', '3671010023886', 'Tangerang', '2001-10-21', 'Perempuan', '08965766886', 'Jl. Lamda 3 No. 886', 'Islam', 3, 8, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(887, 3, 'P20223887', 'Cut Naila Fadia Fiadharma 887', '84750239887', '3671010023887', 'Tangerang', '2001-07-16', 'Perempuan', '08965766887', 'Jl. Lamda 3 No. 887', 'Islam', 9, 5, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(888, 3, 'P20223888', 'Cut Naila Fadia Fiadharma 888', '84750239888', '3671010023888', 'Tangerang', '2001-06-23', 'Perempuan', '08965766888', 'Jl. Lamda 3 No. 888', 'Islam', 11, 8, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(889, 3, 'P20223889', 'Cut Naila Fadia Fiadharma 889', '84750239889', '3671010023889', 'Tangerang', '2001-09-17', 'Perempuan', '08965766889', 'Jl. Lamda 3 No. 889', 'Islam', 2, 3, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(890, 1, 'P20221890', 'Cut Naila Fadia Fiadharma 890', '84750239890', '3671010023890', 'Jakarta', '2001-11-02', 'Laki-Laki', '08965766890', 'Jl. Lamda 3 No. 890', 'Islam', 5, 9, '150000.00', 3, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(891, 2, 'P20222891', 'Cut Naila Fadia Fiadharma 891', '84750239891', '3671010023891', 'Tangerang', '2001-09-12', 'Perempuan', '08965766891', 'Jl. Lamda 3 No. 891', 'Islam', 13, 6, '150000.00', 3, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(892, 3, 'P20223892', 'Cut Naila Fadia Fiadharma 892', '84750239892', '3671010023892', 'Tangerang', '2001-12-29', 'Perempuan', '08965766892', 'Jl. Lamda 3 No. 892', 'Islam', 3, 1, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(893, 1, 'P20221893', 'Cut Naila Fadia Fiadharma 893', '84750239893', '3671010023893', 'Tangerang', '2001-11-16', 'Perempuan', '08965766893', 'Jl. Lamda 3 No. 893', 'Islam', 12, 2, '150000.00', 2, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(894, 1, 'P20221894', 'Cut Naila Fadia Fiadharma 894', '84750239894', '3671010023894', 'Tangerang', '2001-08-01', 'Perempuan', '08965766894', 'Jl. Lamda 3 No. 894', 'Islam', 2, 3, '150000.00', 2, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(895, 2, 'P20222895', 'Cut Naila Fadia Fiadharma 895', '84750239895', '3671010023895', 'Jakarta', '2001-10-13', 'Laki-Laki', '08965766895', 'Jl. Lamda 3 No. 895', 'Islam', 1, 6, '150000.00', 3, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(896, 3, 'P20223896', 'Cut Naila Fadia Fiadharma 896', '84750239896', '3671010023896', 'Tangerang', '2001-08-17', 'Perempuan', '08965766896', 'Jl. Lamda 3 No. 896', 'Islam', 7, 13, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(897, 2, 'P20222897', 'Cut Naila Fadia Fiadharma 897', '84750239897', '3671010023897', 'Tangerang', '2001-12-26', 'Perempuan', '08965766897', 'Jl. Lamda 3 No. 897', 'Islam', 13, 13, '150000.00', 3, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(898, 1, 'P20221898', 'Cut Naila Fadia Fiadharma 898', '84750239898', '3671010023898', 'Tangerang', '2001-10-30', 'Perempuan', '08965766898', 'Jl. Lamda 3 No. 898', 'Islam', 9, 7, '150000.00', 1, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(899, 3, 'P20223899', 'Cut Naila Fadia Fiadharma 899', '84750239899', '3671010023899', 'Tangerang', '2001-09-22', 'Perempuan', '08965766899', 'Jl. Lamda 3 No. 899', 'Islam', 6, 3, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(900, 1, 'P20221900', 'Cut Naila Fadia Fiadharma 900', '84750239900', '3671010023900', 'Jakarta', '2001-07-09', 'Laki-Laki', '08965766900', 'Jl. Lamda 3 No. 900', 'Islam', 2, 1, '150000.00', 1, '1', '2022-12-11 07:08:37', NULL, NULL, NULL),
(901, 3, 'P20223901', 'Cut Naila Fadia Fiadharma 901', '84750239901', '3671010023901', 'Tangerang', '2001-08-02', 'Perempuan', '08965766901', 'Jl. Lamda 3 No. 901', 'Islam', 10, 5, NULL, NULL, '0', '2022-12-11 07:08:37', NULL, NULL, NULL),
(902, 1, 'P20221902', 'Cut Naila Fadia Fiadharma 902', '84750239902', '3671010023902', 'Tangerang', '2001-08-10', 'Perempuan', '08965766902', 'Jl. Lamda 3 No. 902', 'Islam', 3, 7, '150000.00', 3, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(903, 1, 'P20221903', 'Cut Naila Fadia Fiadharma 903', '84750239903', '3671010023903', 'Tangerang', '2001-09-13', 'Perempuan', '08965766903', 'Jl. Lamda 3 No. 903', 'Islam', 6, 2, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(904, 3, 'P20223904', 'Cut Naila Fadia Fiadharma 904', '84750239904', '3671010023904', 'Tangerang', '2001-12-25', 'Perempuan', '08965766904', 'Jl. Lamda 3 No. 904', 'Islam', 6, 6, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(905, 1, 'P20221905', 'Cut Naila Fadia Fiadharma 905', '84750239905', '3671010023905', 'Jakarta', '2001-09-25', 'Laki-Laki', '08965766905', 'Jl. Lamda 3 No. 905', 'Islam', 8, 13, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(906, 3, 'P20223906', 'Cut Naila Fadia Fiadharma 906', '84750239906', '3671010023906', 'Tangerang', '2001-09-21', 'Perempuan', '08965766906', 'Jl. Lamda 3 No. 906', 'Islam', 3, 11, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(907, 2, 'P20222907', 'Cut Naila Fadia Fiadharma 907', '84750239907', '3671010023907', 'Tangerang', '2001-12-06', 'Perempuan', '08965766907', 'Jl. Lamda 3 No. 907', 'Islam', 2, 1, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(908, 2, 'P20222908', 'Cut Naila Fadia Fiadharma 908', '84750239908', '3671010023908', 'Tangerang', '2001-08-26', 'Perempuan', '08965766908', 'Jl. Lamda 3 No. 908', 'Islam', 12, 9, '150000.00', 4, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(909, 2, 'P20222909', 'Cut Naila Fadia Fiadharma 909', '84750239909', '3671010023909', 'Tangerang', '2001-09-18', 'Perempuan', '08965766909', 'Jl. Lamda 3 No. 909', 'Islam', 9, 13, '150000.00', 3, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(910, 3, 'P20223910', 'Cut Naila Fadia Fiadharma 910', '84750239910', '3671010023910', 'Jakarta', '2001-10-07', 'Laki-Laki', '08965766910', 'Jl. Lamda 3 No. 910', 'Islam', 7, 2, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(911, 3, 'P20223911', 'Cut Naila Fadia Fiadharma 911', '84750239911', '3671010023911', 'Tangerang', '2001-11-16', 'Perempuan', '08965766911', 'Jl. Lamda 3 No. 911', 'Islam', 9, 10, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(912, 2, 'P20222912', 'Cut Naila Fadia Fiadharma 912', '84750239912', '3671010023912', 'Tangerang', '2001-10-03', 'Perempuan', '08965766912', 'Jl. Lamda 3 No. 912', 'Islam', 7, 12, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(913, 1, 'P20221913', 'Cut Naila Fadia Fiadharma 913', '84750239913', '3671010023913', 'Tangerang', '2001-10-26', 'Perempuan', '08965766913', 'Jl. Lamda 3 No. 913', 'Islam', 1, 3, '150000.00', 3, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(914, 1, 'P20221914', 'Cut Naila Fadia Fiadharma 914', '84750239914', '3671010023914', 'Tangerang', '2001-12-22', 'Perempuan', '08965766914', 'Jl. Lamda 3 No. 914', 'Islam', 10, 9, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(915, 2, 'P20222915', 'Cut Naila Fadia Fiadharma 915', '84750239915', '3671010023915', 'Jakarta', '2001-08-10', 'Laki-Laki', '08965766915', 'Jl. Lamda 3 No. 915', 'Islam', 10, 11, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(916, 2, 'P20222916', 'Cut Naila Fadia Fiadharma 916', '84750239916', '3671010023916', 'Tangerang', '2001-07-10', 'Perempuan', '08965766916', 'Jl. Lamda 3 No. 916', 'Islam', 5, 4, '150000.00', 3, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(917, 3, 'P20223917', 'Cut Naila Fadia Fiadharma 917', '84750239917', '3671010023917', 'Tangerang', '2001-08-01', 'Perempuan', '08965766917', 'Jl. Lamda 3 No. 917', 'Islam', 5, 2, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(918, 3, 'P20223918', 'Cut Naila Fadia Fiadharma 918', '84750239918', '3671010023918', 'Tangerang', '2001-10-31', 'Perempuan', '08965766918', 'Jl. Lamda 3 No. 918', 'Islam', 7, 12, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(919, 2, 'P20222919', 'Cut Naila Fadia Fiadharma 919', '84750239919', '3671010023919', 'Tangerang', '2001-10-25', 'Perempuan', '08965766919', 'Jl. Lamda 3 No. 919', 'Islam', 9, 11, '150000.00', 4, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(920, 1, 'P20221920', 'Cut Naila Fadia Fiadharma 920', '84750239920', '3671010023920', 'Jakarta', '2001-07-17', 'Laki-Laki', '08965766920', 'Jl. Lamda 3 No. 920', 'Islam', 8, 13, '150000.00', 3, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(921, 1, 'P20221921', 'Cut Naila Fadia Fiadharma 921', '84750239921', '3671010023921', 'Tangerang', '2001-08-24', 'Perempuan', '08965766921', 'Jl. Lamda 3 No. 921', 'Islam', 13, 11, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(922, 2, 'P20222922', 'Cut Naila Fadia Fiadharma 922', '84750239922', '3671010023922', 'Tangerang', '2001-09-24', 'Perempuan', '08965766922', 'Jl. Lamda 3 No. 922', 'Islam', 4, 12, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(923, 3, 'P20223923', 'Cut Naila Fadia Fiadharma 923', '84750239923', '3671010023923', 'Tangerang', '2001-11-17', 'Perempuan', '08965766923', 'Jl. Lamda 3 No. 923', 'Islam', 6, 1, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(924, 1, 'P20221924', 'Cut Naila Fadia Fiadharma 924', '84750239924', '3671010023924', 'Tangerang', '2001-08-31', 'Perempuan', '08965766924', 'Jl. Lamda 3 No. 924', 'Islam', 11, 5, '150000.00', 3, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(925, 1, 'P20221925', 'Cut Naila Fadia Fiadharma 925', '84750239925', '3671010023925', 'Jakarta', '2001-11-20', 'Laki-Laki', '08965766925', 'Jl. Lamda 3 No. 925', 'Islam', 4, 9, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(926, 3, 'P20223926', 'Cut Naila Fadia Fiadharma 926', '84750239926', '3671010023926', 'Tangerang', '2001-07-17', 'Perempuan', '08965766926', 'Jl. Lamda 3 No. 926', 'Islam', 5, 9, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(927, 1, 'P20221927', 'Cut Naila Fadia Fiadharma 927', '84750239927', '3671010023927', 'Tangerang', '2001-07-18', 'Perempuan', '08965766927', 'Jl. Lamda 3 No. 927', 'Islam', 5, 6, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(928, 2, 'P20222928', 'Cut Naila Fadia Fiadharma 928', '84750239928', '3671010023928', 'Tangerang', '2001-09-25', 'Perempuan', '08965766928', 'Jl. Lamda 3 No. 928', 'Islam', 7, 3, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(929, 2, 'P20222929', 'Cut Naila Fadia Fiadharma 929', '84750239929', '3671010023929', 'Tangerang', '2001-12-27', 'Perempuan', '08965766929', 'Jl. Lamda 3 No. 929', 'Islam', 12, 9, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(930, 3, 'P20223930', 'Cut Naila Fadia Fiadharma 930', '84750239930', '3671010023930', 'Jakarta', '2001-07-03', 'Laki-Laki', '08965766930', 'Jl. Lamda 3 No. 930', 'Islam', 11, 11, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(931, 1, 'P20221931', 'Cut Naila Fadia Fiadharma 931', '84750239931', '3671010023931', 'Tangerang', '2001-10-22', 'Perempuan', '08965766931', 'Jl. Lamda 3 No. 931', 'Islam', 2, 10, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(932, 1, 'P20221932', 'Cut Naila Fadia Fiadharma 932', '84750239932', '3671010023932', 'Tangerang', '2001-10-24', 'Perempuan', '08965766932', 'Jl. Lamda 3 No. 932', 'Islam', 10, 2, '150000.00', 4, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(933, 2, 'P20222933', 'Cut Naila Fadia Fiadharma 933', '84750239933', '3671010023933', 'Tangerang', '2001-10-26', 'Perempuan', '08965766933', 'Jl. Lamda 3 No. 933', 'Islam', 7, 1, '150000.00', 4, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(934, 1, 'P20221934', 'Cut Naila Fadia Fiadharma 934', '84750239934', '3671010023934', 'Tangerang', '2001-07-28', 'Perempuan', '08965766934', 'Jl. Lamda 3 No. 934', 'Islam', 6, 6, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(935, 2, 'P20222935', 'Cut Naila Fadia Fiadharma 935', '84750239935', '3671010023935', 'Jakarta', '2001-06-23', 'Laki-Laki', '08965766935', 'Jl. Lamda 3 No. 935', 'Islam', 4, 7, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(936, 2, 'P20222936', 'Cut Naila Fadia Fiadharma 936', '84750239936', '3671010023936', 'Tangerang', '2001-11-04', 'Perempuan', '08965766936', 'Jl. Lamda 3 No. 936', 'Islam', 8, 10, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(937, 3, 'P20223937', 'Cut Naila Fadia Fiadharma 937', '84750239937', '3671010023937', 'Tangerang', '2001-07-28', 'Perempuan', '08965766937', 'Jl. Lamda 3 No. 937', 'Islam', 7, 7, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(938, 3, 'P20223938', 'Cut Naila Fadia Fiadharma 938', '84750239938', '3671010023938', 'Tangerang', '2001-12-07', 'Perempuan', '08965766938', 'Jl. Lamda 3 No. 938', 'Islam', 4, 5, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(939, 3, 'P20223939', 'Cut Naila Fadia Fiadharma 939', '84750239939', '3671010023939', 'Tangerang', '2001-09-11', 'Perempuan', '08965766939', 'Jl. Lamda 3 No. 939', 'Islam', 2, 4, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(940, 3, 'P20223940', 'Cut Naila Fadia Fiadharma 940', '84750239940', '3671010023940', 'Jakarta', '2001-08-07', 'Laki-Laki', '08965766940', 'Jl. Lamda 3 No. 940', 'Islam', 6, 9, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(941, 1, 'P20221941', 'Cut Naila Fadia Fiadharma 941', '84750239941', '3671010023941', 'Tangerang', '2001-11-07', 'Perempuan', '08965766941', 'Jl. Lamda 3 No. 941', 'Islam', 2, 1, '150000.00', 1, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(942, 1, 'P20221942', 'Cut Naila Fadia Fiadharma 942', '84750239942', '3671010023942', 'Tangerang', '2001-10-11', 'Perempuan', '08965766942', 'Jl. Lamda 3 No. 942', 'Islam', 7, 1, '150000.00', 2, '1', '2022-12-11 07:08:38', NULL, NULL, NULL),
(943, 3, 'P20223943', 'Cut Naila Fadia Fiadharma 943', '84750239943', '3671010023943', 'Tangerang', '2001-12-16', 'Perempuan', '08965766943', 'Jl. Lamda 3 No. 943', 'Islam', 12, 1, NULL, NULL, '0', '2022-12-11 07:08:38', NULL, NULL, NULL),
(944, 3, 'P20223944', 'Cut Naila Fadia Fiadharma 944', '84750239944', '3671010023944', 'Tangerang', '2001-11-01', 'Perempuan', '08965766944', 'Jl. Lamda 3 No. 944', 'Islam', 13, 12, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(945, 1, 'P20221945', 'Cut Naila Fadia Fiadharma 945', '84750239945', '3671010023945', 'Jakarta', '2001-11-19', 'Laki-Laki', '08965766945', 'Jl. Lamda 3 No. 945', 'Islam', 5, 13, '150000.00', 3, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(946, 3, 'P20223946', 'Cut Naila Fadia Fiadharma 946', '84750239946', '3671010023946', 'Tangerang', '2001-06-15', 'Perempuan', '08965766946', 'Jl. Lamda 3 No. 946', 'Islam', 12, 2, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(947, 2, 'P20222947', 'Cut Naila Fadia Fiadharma 947', '84750239947', '3671010023947', 'Tangerang', '2001-07-28', 'Perempuan', '08965766947', 'Jl. Lamda 3 No. 947', 'Islam', 3, 4, '150000.00', 2, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(948, 1, 'P20221948', 'Cut Naila Fadia Fiadharma 948', '84750239948', '3671010023948', 'Tangerang', '2001-10-15', 'Perempuan', '08965766948', 'Jl. Lamda 3 No. 948', 'Islam', 6, 3, '150000.00', 1, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(949, 2, 'P20222949', 'Cut Naila Fadia Fiadharma 949', '84750239949', '3671010023949', 'Tangerang', '2001-09-23', 'Perempuan', '08965766949', 'Jl. Lamda 3 No. 949', 'Islam', 1, 11, '150000.00', 4, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(950, 1, 'P20221950', 'Cut Naila Fadia Fiadharma 950', '84750239950', '3671010023950', 'Jakarta', '2001-12-24', 'Laki-Laki', '08965766950', 'Jl. Lamda 3 No. 950', 'Islam', 7, 3, '150000.00', 4, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(951, 2, 'P20222951', 'Cut Naila Fadia Fiadharma 951', '84750239951', '3671010023951', 'Tangerang', '2001-06-22', 'Perempuan', '08965766951', 'Jl. Lamda 3 No. 951', 'Islam', 6, 4, '150000.00', 4, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(952, 2, 'P20222952', 'Cut Naila Fadia Fiadharma 952', '84750239952', '3671010023952', 'Tangerang', '2001-10-23', 'Perempuan', '08965766952', 'Jl. Lamda 3 No. 952', 'Islam', 11, 9, '150000.00', 2, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(953, 1, 'P20221953', 'Cut Naila Fadia Fiadharma 953', '84750239953', '3671010023953', 'Tangerang', '2001-06-26', 'Perempuan', '08965766953', 'Jl. Lamda 3 No. 953', 'Islam', 7, 2, '150000.00', 1, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(954, 3, 'P20223954', 'Cut Naila Fadia Fiadharma 954', '84750239954', '3671010023954', 'Tangerang', '2001-08-04', 'Perempuan', '08965766954', 'Jl. Lamda 3 No. 954', 'Islam', 9, 9, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(955, 3, 'P20223955', 'Cut Naila Fadia Fiadharma 955', '84750239955', '3671010023955', 'Jakarta', '2001-07-01', 'Laki-Laki', '08965766955', 'Jl. Lamda 3 No. 955', 'Islam', 2, 10, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(956, 1, 'P20221956', 'Cut Naila Fadia Fiadharma 956', '84750239956', '3671010023956', 'Tangerang', '2001-08-24', 'Perempuan', '08965766956', 'Jl. Lamda 3 No. 956', 'Islam', 11, 9, '150000.00', 3, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(957, 1, 'P20221957', 'Cut Naila Fadia Fiadharma 957', '84750239957', '3671010023957', 'Tangerang', '2001-06-17', 'Perempuan', '08965766957', 'Jl. Lamda 3 No. 957', 'Islam', 8, 9, '150000.00', 1, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(958, 2, 'P20222958', 'Cut Naila Fadia Fiadharma 958', '84750239958', '3671010023958', 'Tangerang', '2001-06-17', 'Perempuan', '08965766958', 'Jl. Lamda 3 No. 958', 'Islam', 2, 4, '150000.00', 1, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(959, 2, 'P20222959', 'Cut Naila Fadia Fiadharma 959', '84750239959', '3671010023959', 'Tangerang', '2001-09-22', 'Perempuan', '08965766959', 'Jl. Lamda 3 No. 959', 'Islam', 2, 7, '150000.00', 4, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(960, 3, 'P20223960', 'Cut Naila Fadia Fiadharma 960', '84750239960', '3671010023960', 'Jakarta', '2001-12-28', 'Laki-Laki', '08965766960', 'Jl. Lamda 3 No. 960', 'Islam', 8, 1, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(961, 1, 'P20221961', 'Cut Naila Fadia Fiadharma 961', '84750239961', '3671010023961', 'Tangerang', '2001-09-06', 'Perempuan', '08965766961', 'Jl. Lamda 3 No. 961', 'Islam', 12, 1, '150000.00', 1, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(962, 1, 'P20221962', 'Cut Naila Fadia Fiadharma 962', '84750239962', '3671010023962', 'Tangerang', '2001-11-05', 'Perempuan', '08965766962', 'Jl. Lamda 3 No. 962', 'Islam', 12, 13, '150000.00', 4, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(963, 3, 'P20223963', 'Cut Naila Fadia Fiadharma 963', '84750239963', '3671010023963', 'Tangerang', '2001-11-28', 'Perempuan', '08965766963', 'Jl. Lamda 3 No. 963', 'Islam', 13, 8, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(964, 2, 'P20222964', 'Cut Naila Fadia Fiadharma 964', '84750239964', '3671010023964', 'Tangerang', '2001-12-13', 'Perempuan', '08965766964', 'Jl. Lamda 3 No. 964', 'Islam', 6, 9, '150000.00', 4, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(965, 3, 'P20223965', 'Cut Naila Fadia Fiadharma 965', '84750239965', '3671010023965', 'Jakarta', '2001-08-13', 'Laki-Laki', '08965766965', 'Jl. Lamda 3 No. 965', 'Islam', 8, 8, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(966, 1, 'P20221966', 'Cut Naila Fadia Fiadharma 966', '84750239966', '3671010023966', 'Tangerang', '2001-08-22', 'Perempuan', '08965766966', 'Jl. Lamda 3 No. 966', 'Islam', 7, 10, '150000.00', 1, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(967, 3, 'P20223967', 'Cut Naila Fadia Fiadharma 967', '84750239967', '3671010023967', 'Tangerang', '2001-07-26', 'Perempuan', '08965766967', 'Jl. Lamda 3 No. 967', 'Islam', 4, 7, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(968, 1, 'P20221968', 'Cut Naila Fadia Fiadharma 968', '84750239968', '3671010023968', 'Tangerang', '2001-09-25', 'Perempuan', '08965766968', 'Jl. Lamda 3 No. 968', 'Islam', 6, 13, '150000.00', 4, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(969, 3, 'P20223969', 'Cut Naila Fadia Fiadharma 969', '84750239969', '3671010023969', 'Tangerang', '2001-09-09', 'Perempuan', '08965766969', 'Jl. Lamda 3 No. 969', 'Islam', 9, 2, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(970, 2, 'P20222970', 'Cut Naila Fadia Fiadharma 970', '84750239970', '3671010023970', 'Jakarta', '2001-08-23', 'Laki-Laki', '08965766970', 'Jl. Lamda 3 No. 970', 'Islam', 12, 2, '150000.00', 1, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(971, 3, 'P20223971', 'Cut Naila Fadia Fiadharma 971', '84750239971', '3671010023971', 'Tangerang', '2001-12-23', 'Perempuan', '08965766971', 'Jl. Lamda 3 No. 971', 'Islam', 1, 12, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(972, 3, 'P20223972', 'Cut Naila Fadia Fiadharma 972', '84750239972', '3671010023972', 'Tangerang', '2001-08-01', 'Perempuan', '08965766972', 'Jl. Lamda 3 No. 972', 'Islam', 10, 10, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(973, 3, 'P20223973', 'Cut Naila Fadia Fiadharma 973', '84750239973', '3671010023973', 'Tangerang', '2001-06-20', 'Perempuan', '08965766973', 'Jl. Lamda 3 No. 973', 'Islam', 6, 3, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(974, 1, 'P20221974', 'Cut Naila Fadia Fiadharma 974', '84750239974', '3671010023974', 'Tangerang', '2001-08-16', 'Perempuan', '08965766974', 'Jl. Lamda 3 No. 974', 'Islam', 10, 2, '150000.00', 4, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(975, 2, 'P20222975', 'Cut Naila Fadia Fiadharma 975', '84750239975', '3671010023975', 'Jakarta', '2001-09-25', 'Laki-Laki', '08965766975', 'Jl. Lamda 3 No. 975', 'Islam', 11, 9, '150000.00', 2, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(976, 1, 'P20221976', 'Cut Naila Fadia Fiadharma 976', '84750239976', '3671010023976', 'Tangerang', '2001-08-06', 'Perempuan', '08965766976', 'Jl. Lamda 3 No. 976', 'Islam', 4, 10, '150000.00', 2, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(977, 3, 'P20223977', 'Cut Naila Fadia Fiadharma 977', '84750239977', '3671010023977', 'Tangerang', '2001-08-01', 'Perempuan', '08965766977', 'Jl. Lamda 3 No. 977', 'Islam', 7, 11, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(978, 3, 'P20223978', 'Cut Naila Fadia Fiadharma 978', '84750239978', '3671010023978', 'Tangerang', '2001-07-17', 'Perempuan', '08965766978', 'Jl. Lamda 3 No. 978', 'Islam', 8, 7, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(979, 3, 'P20223979', 'Cut Naila Fadia Fiadharma 979', '84750239979', '3671010023979', 'Tangerang', '2001-09-27', 'Perempuan', '08965766979', 'Jl. Lamda 3 No. 979', 'Islam', 6, 12, NULL, NULL, '0', '2022-12-11 07:08:39', NULL, NULL, NULL),
(980, 1, 'P20221980', 'Cut Naila Fadia Fiadharma 980', '84750239980', '3671010023980', 'Jakarta', '2001-06-26', 'Laki-Laki', '08965766980', 'Jl. Lamda 3 No. 980', 'Islam', 5, 7, '150000.00', 2, '1', '2022-12-11 07:08:39', NULL, NULL, NULL),
(981, 1, 'P20221981', 'Cut Naila Fadia Fiadharma 981', '84750239981', '3671010023981', 'Tangerang', '2001-12-26', 'Perempuan', '08965766981', 'Jl. Lamda 3 No. 981', 'Islam', 10, 5, '150000.00', 3, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(982, 2, 'P20222982', 'Cut Naila Fadia Fiadharma 982', '84750239982', '3671010023982', 'Tangerang', '2001-09-05', 'Perempuan', '08965766982', 'Jl. Lamda 3 No. 982', 'Islam', 3, 7, '150000.00', 1, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(983, 1, 'P20221983', 'Cut Naila Fadia Fiadharma 983', '84750239983', '3671010023983', 'Tangerang', '2001-07-07', 'Perempuan', '08965766983', 'Jl. Lamda 3 No. 983', 'Islam', 13, 8, '150000.00', 4, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(984, 1, 'P20221984', 'Cut Naila Fadia Fiadharma 984', '84750239984', '3671010023984', 'Tangerang', '2001-12-09', 'Perempuan', '08965766984', 'Jl. Lamda 3 No. 984', 'Islam', 7, 3, '150000.00', 4, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(985, 3, 'P20223985', 'Cut Naila Fadia Fiadharma 985', '84750239985', '3671010023985', 'Jakarta', '2001-11-30', 'Laki-Laki', '08965766985', 'Jl. Lamda 3 No. 985', 'Islam', 8, 6, NULL, NULL, '0', '2022-12-11 07:08:40', NULL, NULL, NULL),
(986, 3, 'P20223986', 'Cut Naila Fadia Fiadharma 986', '84750239986', '3671010023986', 'Tangerang', '2001-11-03', 'Perempuan', '08965766986', 'Jl. Lamda 3 No. 986', 'Islam', 5, 7, NULL, NULL, '0', '2022-12-11 07:08:40', NULL, NULL, NULL),
(987, 2, 'P20222987', 'Cut Naila Fadia Fiadharma 987', '84750239987', '3671010023987', 'Tangerang', '2001-07-31', 'Perempuan', '08965766987', 'Jl. Lamda 3 No. 987', 'Islam', 6, 8, '150000.00', 3, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(988, 1, 'P20221988', 'Cut Naila Fadia Fiadharma 988', '84750239988', '3671010023988', 'Tangerang', '2001-11-21', 'Perempuan', '08965766988', 'Jl. Lamda 3 No. 988', 'Islam', 13, 9, '150000.00', 1, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(989, 3, 'P20223989', 'Cut Naila Fadia Fiadharma 989', '84750239989', '3671010023989', 'Tangerang', '2001-12-06', 'Perempuan', '08965766989', 'Jl. Lamda 3 No. 989', 'Islam', 11, 12, NULL, NULL, '0', '2022-12-11 07:08:40', NULL, NULL, NULL),
(990, 2, 'P20222990', 'Cut Naila Fadia Fiadharma 990', '84750239990', '3671010023990', 'Jakarta', '2001-10-07', 'Laki-Laki', '08965766990', 'Jl. Lamda 3 No. 990', 'Islam', 5, 9, '150000.00', 2, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(991, 1, 'P20221991', 'Cut Naila Fadia Fiadharma 991', '84750239991', '3671010023991', 'Tangerang', '2001-07-28', 'Perempuan', '08965766991', 'Jl. Lamda 3 No. 991', 'Islam', 11, 7, '150000.00', 3, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(992, 1, 'P20221992', 'Cut Naila Fadia Fiadharma 992', '84750239992', '3671010023992', 'Tangerang', '2001-12-11', 'Perempuan', '08965766992', 'Jl. Lamda 3 No. 992', 'Islam', 13, 5, '150000.00', 4, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(993, 2, 'P20222993', 'Cut Naila Fadia Fiadharma 993', '84750239993', '3671010023993', 'Tangerang', '2001-08-31', 'Perempuan', '08965766993', 'Jl. Lamda 3 No. 993', 'Islam', 4, 8, '150000.00', 4, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(994, 2, 'P20222994', 'Cut Naila Fadia Fiadharma 994', '84750239994', '3671010023994', 'Tangerang', '2001-11-27', 'Perempuan', '08965766994', 'Jl. Lamda 3 No. 994', 'Islam', 4, 11, '150000.00', 4, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(995, 1, 'P20221995', 'Cut Naila Fadia Fiadharma 995', '84750239995', '3671010023995', 'Jakarta', '2001-09-23', 'Laki-Laki', '08965766995', 'Jl. Lamda 3 No. 995', 'Islam', 9, 3, '150000.00', 3, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(996, 1, 'P20221996', 'Cut Naila Fadia Fiadharma 996', '84750239996', '3671010023996', 'Tangerang', '2001-12-23', 'Perempuan', '08965766996', 'Jl. Lamda 3 No. 996', 'Islam', 3, 1, '150000.00', 2, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(997, 2, 'P20222997', 'Cut Naila Fadia Fiadharma 997', '84750239997', '3671010023997', 'Tangerang', '2001-07-07', 'Perempuan', '08965766997', 'Jl. Lamda 3 No. 997', 'Islam', 10, 11, '150000.00', 2, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(998, 3, 'P20223998', 'Cut Naila Fadia Fiadharma 998', '84750239998', '3671010023998', 'Tangerang', '2001-11-03', 'Perempuan', '08965766998', 'Jl. Lamda 3 No. 998', 'Islam', 7, 3, NULL, NULL, '0', '2022-12-11 07:08:40', NULL, NULL, NULL),
(999, 1, 'P20221999', 'Cut Naila Fadia Fiadharma 999', '84750239999', '3671010023999', 'Tangerang', '2001-12-09', 'Perempuan', '08965766999', 'Jl. Lamda 3 No. 999', 'Islam', 5, 13, '150000.00', 1, '1', '2022-12-11 07:08:40', NULL, NULL, NULL),
(1000, 2, 'P202221000', 'Cut Naila Fadia Fiadharma 1000', '847502391000', '36710100231000', 'Jakarta', '2001-09-04', 'Laki-Laki', '089657661000', 'Jl. Lamda 3 No. 1000', 'Islam', 10, 6, '150000.00', 2, '1', '2022-12-11 07:08:40', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pendaftar_prestasi`
--

CREATE TABLE `pendaftar_prestasi` (
  `id` int(11) NOT NULL,
  `id_pendaftar` int(11) NOT NULL DEFAULT 0,
  `tingkat_prestasi` enum('NASIONAL','INTERNASIONAL') NOT NULL DEFAULT 'NASIONAL',
  `nama_prestasi` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL,
  `url_dokumen` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pendaftar_prestasi`
--

INSERT INTO `pendaftar_prestasi` (`id`, `id_pendaftar`, `tingkat_prestasi`, `nama_prestasi`, `tahun`, `url_dokumen`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 4, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 4', 2022, 'public/uploads/prestasi/4', '2022-12-11 07:08:05', NULL, NULL, NULL),
(2, 10, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 10', 2022, 'public/uploads/prestasi/10', '2022-12-11 07:08:05', NULL, NULL, NULL),
(3, 13, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 13', 2022, 'public/uploads/prestasi/13', '2022-12-11 07:08:05', NULL, NULL, NULL),
(4, 16, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 16', 2022, 'public/uploads/prestasi/16', '2022-12-11 07:08:06', NULL, NULL, NULL),
(5, 17, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 17', 2022, 'public/uploads/prestasi/17', '2022-12-11 07:08:06', NULL, NULL, NULL),
(6, 18, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 18', 2022, 'public/uploads/prestasi/18', '2022-12-11 07:08:06', NULL, NULL, NULL),
(7, 19, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 19', 2022, 'public/uploads/prestasi/19', '2022-12-11 07:08:06', NULL, NULL, NULL),
(8, 21, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 21', 2022, 'public/uploads/prestasi/21', '2022-12-11 07:08:06', NULL, NULL, NULL),
(9, 23, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 23', 2022, 'public/uploads/prestasi/23', '2022-12-11 07:08:06', NULL, NULL, NULL),
(10, 24, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 24', 2022, 'public/uploads/prestasi/24', '2022-12-11 07:08:06', NULL, NULL, NULL),
(11, 25, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 25', 2022, 'public/uploads/prestasi/25', '2022-12-11 07:08:06', NULL, NULL, NULL),
(12, 26, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 26', 2022, 'public/uploads/prestasi/26', '2022-12-11 07:08:06', NULL, NULL, NULL),
(13, 29, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 29', 2022, 'public/uploads/prestasi/29', '2022-12-11 07:08:06', NULL, NULL, NULL),
(14, 33, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 33', 2022, 'public/uploads/prestasi/33', '2022-12-11 07:08:06', NULL, NULL, NULL),
(15, 37, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 37', 2022, 'public/uploads/prestasi/37', '2022-12-11 07:08:07', NULL, NULL, NULL),
(16, 41, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 41', 2022, 'public/uploads/prestasi/41', '2022-12-11 07:08:07', NULL, NULL, NULL),
(17, 42, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 42', 2022, 'public/uploads/prestasi/42', '2022-12-11 07:08:07', NULL, NULL, NULL),
(18, 47, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 47', 2022, 'public/uploads/prestasi/47', '2022-12-11 07:08:07', NULL, NULL, NULL),
(19, 49, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 49', 2022, 'public/uploads/prestasi/49', '2022-12-11 07:08:07', NULL, NULL, NULL),
(20, 50, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 50', 2022, 'public/uploads/prestasi/50', '2022-12-11 07:08:07', NULL, NULL, NULL),
(21, 54, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 54', 2022, 'public/uploads/prestasi/54', '2022-12-11 07:08:07', NULL, NULL, NULL),
(22, 56, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 56', 2022, 'public/uploads/prestasi/56', '2022-12-11 07:08:07', NULL, NULL, NULL),
(23, 57, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 57', 2022, 'public/uploads/prestasi/57', '2022-12-11 07:08:07', NULL, NULL, NULL),
(24, 59, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 59', 2022, 'public/uploads/prestasi/59', '2022-12-11 07:08:07', NULL, NULL, NULL),
(25, 61, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 61', 2022, 'public/uploads/prestasi/61', '2022-12-11 07:08:07', NULL, NULL, NULL),
(26, 63, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 63', 2022, 'public/uploads/prestasi/63', '2022-12-11 07:08:07', NULL, NULL, NULL),
(27, 64, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 64', 2022, 'public/uploads/prestasi/64', '2022-12-11 07:08:07', NULL, NULL, NULL),
(28, 68, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 68', 2022, 'public/uploads/prestasi/68', '2022-12-11 07:08:07', NULL, NULL, NULL),
(29, 73, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 73', 2022, 'public/uploads/prestasi/73', '2022-12-11 07:08:07', NULL, NULL, NULL),
(30, 77, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 77', 2022, 'public/uploads/prestasi/77', '2022-12-11 07:08:08', NULL, NULL, NULL),
(31, 79, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 79', 2022, 'public/uploads/prestasi/79', '2022-12-11 07:08:08', NULL, NULL, NULL),
(32, 80, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 80', 2022, 'public/uploads/prestasi/80', '2022-12-11 07:08:08', NULL, NULL, NULL),
(33, 81, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 81', 2022, 'public/uploads/prestasi/81', '2022-12-11 07:08:08', NULL, NULL, NULL),
(34, 82, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 82', 2022, 'public/uploads/prestasi/82', '2022-12-11 07:08:08', NULL, NULL, NULL),
(35, 83, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 83', 2022, 'public/uploads/prestasi/83', '2022-12-11 07:08:08', NULL, NULL, NULL),
(36, 87, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 87', 2022, 'public/uploads/prestasi/87', '2022-12-11 07:08:09', NULL, NULL, NULL),
(37, 88, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 88', 2022, 'public/uploads/prestasi/88', '2022-12-11 07:08:09', NULL, NULL, NULL),
(38, 92, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 92', 2022, 'public/uploads/prestasi/92', '2022-12-11 07:08:09', NULL, NULL, NULL),
(39, 93, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 93', 2022, 'public/uploads/prestasi/93', '2022-12-11 07:08:09', NULL, NULL, NULL),
(40, 96, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 96', 2022, 'public/uploads/prestasi/96', '2022-12-11 07:08:09', NULL, NULL, NULL),
(41, 97, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 97', 2022, 'public/uploads/prestasi/97', '2022-12-11 07:08:09', NULL, NULL, NULL),
(42, 99, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 99', 2022, 'public/uploads/prestasi/99', '2022-12-11 07:08:09', NULL, NULL, NULL),
(43, 100, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 100', 2022, 'public/uploads/prestasi/100', '2022-12-11 07:08:09', NULL, NULL, NULL),
(44, 102, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 102', 2022, 'public/uploads/prestasi/102', '2022-12-11 07:08:09', NULL, NULL, NULL),
(45, 103, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 103', 2022, 'public/uploads/prestasi/103', '2022-12-11 07:08:09', NULL, NULL, NULL),
(46, 104, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 104', 2022, 'public/uploads/prestasi/104', '2022-12-11 07:08:09', NULL, NULL, NULL),
(47, 107, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 107', 2022, 'public/uploads/prestasi/107', '2022-12-11 07:08:09', NULL, NULL, NULL),
(48, 110, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 110', 2022, 'public/uploads/prestasi/110', '2022-12-11 07:08:09', NULL, NULL, NULL),
(49, 112, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 112', 2022, 'public/uploads/prestasi/112', '2022-12-11 07:08:09', NULL, NULL, NULL),
(50, 113, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 113', 2022, 'public/uploads/prestasi/113', '2022-12-11 07:08:10', NULL, NULL, NULL),
(51, 114, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 114', 2022, 'public/uploads/prestasi/114', '2022-12-11 07:08:10', NULL, NULL, NULL),
(52, 125, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 125', 2022, 'public/uploads/prestasi/125', '2022-12-11 07:08:10', NULL, NULL, NULL),
(53, 128, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 128', 2022, 'public/uploads/prestasi/128', '2022-12-11 07:08:10', NULL, NULL, NULL),
(54, 132, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 132', 2022, 'public/uploads/prestasi/132', '2022-12-11 07:08:10', NULL, NULL, NULL),
(55, 133, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 133', 2022, 'public/uploads/prestasi/133', '2022-12-11 07:08:10', NULL, NULL, NULL),
(56, 147, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 147', 2022, 'public/uploads/prestasi/147', '2022-12-11 07:08:11', NULL, NULL, NULL),
(57, 151, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 151', 2022, 'public/uploads/prestasi/151', '2022-12-11 07:08:11', NULL, NULL, NULL),
(58, 152, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 152', 2022, 'public/uploads/prestasi/152', '2022-12-11 07:08:11', NULL, NULL, NULL),
(59, 153, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 153', 2022, 'public/uploads/prestasi/153', '2022-12-11 07:08:11', NULL, NULL, NULL),
(60, 157, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 157', 2022, 'public/uploads/prestasi/157', '2022-12-11 07:08:11', NULL, NULL, NULL),
(61, 160, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 160', 2022, 'public/uploads/prestasi/160', '2022-12-11 07:08:11', NULL, NULL, NULL),
(62, 163, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 163', 2022, 'public/uploads/prestasi/163', '2022-12-11 07:08:11', NULL, NULL, NULL),
(63, 167, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 167', 2022, 'public/uploads/prestasi/167', '2022-12-11 07:08:11', NULL, NULL, NULL),
(64, 174, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 174', 2022, 'public/uploads/prestasi/174', '2022-12-11 07:08:11', NULL, NULL, NULL),
(65, 175, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 175', 2022, 'public/uploads/prestasi/175', '2022-12-11 07:08:11', NULL, NULL, NULL),
(66, 179, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 179', 2022, 'public/uploads/prestasi/179', '2022-12-11 07:08:11', NULL, NULL, NULL),
(67, 181, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 181', 2022, 'public/uploads/prestasi/181', '2022-12-11 07:08:11', NULL, NULL, NULL),
(68, 183, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 183', 2022, 'public/uploads/prestasi/183', '2022-12-11 07:08:11', NULL, NULL, NULL),
(69, 190, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 190', 2022, 'public/uploads/prestasi/190', '2022-12-11 07:08:11', NULL, NULL, NULL),
(70, 191, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 191', 2022, 'public/uploads/prestasi/191', '2022-12-11 07:08:11', NULL, NULL, NULL),
(71, 192, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 192', 2022, 'public/uploads/prestasi/192', '2022-12-11 07:08:11', NULL, NULL, NULL),
(72, 194, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 194', 2022, 'public/uploads/prestasi/194', '2022-12-11 07:08:11', NULL, NULL, NULL),
(73, 195, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 195', 2022, 'public/uploads/prestasi/195', '2022-12-11 07:08:12', NULL, NULL, NULL),
(74, 198, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 198', 2022, 'public/uploads/prestasi/198', '2022-12-11 07:08:12', NULL, NULL, NULL),
(75, 205, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 205', 2022, 'public/uploads/prestasi/205', '2022-12-11 07:08:12', NULL, NULL, NULL),
(76, 209, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 209', 2022, 'public/uploads/prestasi/209', '2022-12-11 07:08:12', NULL, NULL, NULL),
(77, 210, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 210', 2022, 'public/uploads/prestasi/210', '2022-12-11 07:08:12', NULL, NULL, NULL),
(78, 221, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 221', 2022, 'public/uploads/prestasi/221', '2022-12-11 07:08:12', NULL, NULL, NULL),
(79, 222, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 222', 2022, 'public/uploads/prestasi/222', '2022-12-11 07:08:12', NULL, NULL, NULL),
(80, 223, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 223', 2022, 'public/uploads/prestasi/223', '2022-12-11 07:08:12', NULL, NULL, NULL),
(81, 224, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 224', 2022, 'public/uploads/prestasi/224', '2022-12-11 07:08:13', NULL, NULL, NULL),
(82, 226, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 226', 2022, 'public/uploads/prestasi/226', '2022-12-11 07:08:13', NULL, NULL, NULL),
(83, 236, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 236', 2022, 'public/uploads/prestasi/236', '2022-12-11 07:08:13', NULL, NULL, NULL),
(84, 238, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 238', 2022, 'public/uploads/prestasi/238', '2022-12-11 07:08:13', NULL, NULL, NULL),
(85, 242, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 242', 2022, 'public/uploads/prestasi/242', '2022-12-11 07:08:13', NULL, NULL, NULL),
(86, 243, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 243', 2022, 'public/uploads/prestasi/243', '2022-12-11 07:08:13', NULL, NULL, NULL),
(87, 245, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 245', 2022, 'public/uploads/prestasi/245', '2022-12-11 07:08:13', NULL, NULL, NULL),
(88, 251, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 251', 2022, 'public/uploads/prestasi/251', '2022-12-11 07:08:13', NULL, NULL, NULL),
(89, 252, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 252', 2022, 'public/uploads/prestasi/252', '2022-12-11 07:08:13', NULL, NULL, NULL),
(90, 256, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 256', 2022, 'public/uploads/prestasi/256', '2022-12-11 07:08:13', NULL, NULL, NULL),
(91, 257, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 257', 2022, 'public/uploads/prestasi/257', '2022-12-11 07:08:14', NULL, NULL, NULL),
(92, 258, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 258', 2022, 'public/uploads/prestasi/258', '2022-12-11 07:08:14', NULL, NULL, NULL),
(93, 262, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 262', 2022, 'public/uploads/prestasi/262', '2022-12-11 07:08:14', NULL, NULL, NULL),
(94, 265, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 265', 2022, 'public/uploads/prestasi/265', '2022-12-11 07:08:14', NULL, NULL, NULL),
(95, 266, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 266', 2022, 'public/uploads/prestasi/266', '2022-12-11 07:08:14', NULL, NULL, NULL),
(96, 268, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 268', 2022, 'public/uploads/prestasi/268', '2022-12-11 07:08:14', NULL, NULL, NULL),
(97, 269, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 269', 2022, 'public/uploads/prestasi/269', '2022-12-11 07:08:14', NULL, NULL, NULL),
(98, 271, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 271', 2022, 'public/uploads/prestasi/271', '2022-12-11 07:08:14', NULL, NULL, NULL),
(99, 272, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 272', 2022, 'public/uploads/prestasi/272', '2022-12-11 07:08:15', NULL, NULL, NULL),
(100, 273, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 273', 2022, 'public/uploads/prestasi/273', '2022-12-11 07:08:15', NULL, NULL, NULL),
(101, 275, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 275', 2022, 'public/uploads/prestasi/275', '2022-12-11 07:08:15', NULL, NULL, NULL),
(102, 276, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 276', 2022, 'public/uploads/prestasi/276', '2022-12-11 07:08:15', NULL, NULL, NULL),
(103, 279, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 279', 2022, 'public/uploads/prestasi/279', '2022-12-11 07:08:15', NULL, NULL, NULL),
(104, 281, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 281', 2022, 'public/uploads/prestasi/281', '2022-12-11 07:08:15', NULL, NULL, NULL),
(105, 283, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 283', 2022, 'public/uploads/prestasi/283', '2022-12-11 07:08:15', NULL, NULL, NULL),
(106, 285, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 285', 2022, 'public/uploads/prestasi/285', '2022-12-11 07:08:15', NULL, NULL, NULL),
(107, 286, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 286', 2022, 'public/uploads/prestasi/286', '2022-12-11 07:08:15', NULL, NULL, NULL),
(108, 291, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 291', 2022, 'public/uploads/prestasi/291', '2022-12-11 07:08:15', NULL, NULL, NULL),
(109, 292, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 292', 2022, 'public/uploads/prestasi/292', '2022-12-11 07:08:15', NULL, NULL, NULL),
(110, 293, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 293', 2022, 'public/uploads/prestasi/293', '2022-12-11 07:08:15', NULL, NULL, NULL),
(111, 294, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 294', 2022, 'public/uploads/prestasi/294', '2022-12-11 07:08:15', NULL, NULL, NULL),
(112, 295, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 295', 2022, 'public/uploads/prestasi/295', '2022-12-11 07:08:15', NULL, NULL, NULL),
(113, 297, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 297', 2022, 'public/uploads/prestasi/297', '2022-12-11 07:08:15', NULL, NULL, NULL),
(114, 304, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 304', 2022, 'public/uploads/prestasi/304', '2022-12-11 07:08:16', NULL, NULL, NULL),
(115, 306, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 306', 2022, 'public/uploads/prestasi/306', '2022-12-11 07:08:16', NULL, NULL, NULL),
(116, 310, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 310', 2022, 'public/uploads/prestasi/310', '2022-12-11 07:08:16', NULL, NULL, NULL),
(117, 314, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 314', 2022, 'public/uploads/prestasi/314', '2022-12-11 07:08:16', NULL, NULL, NULL),
(118, 316, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 316', 2022, 'public/uploads/prestasi/316', '2022-12-11 07:08:16', NULL, NULL, NULL),
(119, 320, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 320', 2022, 'public/uploads/prestasi/320', '2022-12-11 07:08:16', NULL, NULL, NULL),
(120, 322, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 322', 2022, 'public/uploads/prestasi/322', '2022-12-11 07:08:16', NULL, NULL, NULL),
(121, 323, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 323', 2022, 'public/uploads/prestasi/323', '2022-12-11 07:08:16', NULL, NULL, NULL),
(122, 324, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 324', 2022, 'public/uploads/prestasi/324', '2022-12-11 07:08:16', NULL, NULL, NULL),
(123, 330, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 330', 2022, 'public/uploads/prestasi/330', '2022-12-11 07:08:17', NULL, NULL, NULL),
(124, 332, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 332', 2022, 'public/uploads/prestasi/332', '2022-12-11 07:08:17', NULL, NULL, NULL),
(125, 333, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 333', 2022, 'public/uploads/prestasi/333', '2022-12-11 07:08:17', NULL, NULL, NULL),
(126, 335, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 335', 2022, 'public/uploads/prestasi/335', '2022-12-11 07:08:17', NULL, NULL, NULL),
(127, 336, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 336', 2022, 'public/uploads/prestasi/336', '2022-12-11 07:08:17', NULL, NULL, NULL),
(128, 338, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 338', 2022, 'public/uploads/prestasi/338', '2022-12-11 07:08:17', NULL, NULL, NULL),
(129, 340, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 340', 2022, 'public/uploads/prestasi/340', '2022-12-11 07:08:17', NULL, NULL, NULL),
(130, 342, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 342', 2022, 'public/uploads/prestasi/342', '2022-12-11 07:08:17', NULL, NULL, NULL),
(131, 343, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 343', 2022, 'public/uploads/prestasi/343', '2022-12-11 07:08:17', NULL, NULL, NULL),
(132, 348, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 348', 2022, 'public/uploads/prestasi/348', '2022-12-11 07:08:18', NULL, NULL, NULL),
(133, 350, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 350', 2022, 'public/uploads/prestasi/350', '2022-12-11 07:08:18', NULL, NULL, NULL),
(134, 352, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 352', 2022, 'public/uploads/prestasi/352', '2022-12-11 07:08:18', NULL, NULL, NULL),
(135, 353, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 353', 2022, 'public/uploads/prestasi/353', '2022-12-11 07:08:18', NULL, NULL, NULL),
(136, 362, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 362', 2022, 'public/uploads/prestasi/362', '2022-12-11 07:08:18', NULL, NULL, NULL),
(137, 363, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 363', 2022, 'public/uploads/prestasi/363', '2022-12-11 07:08:18', NULL, NULL, NULL),
(138, 368, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 368', 2022, 'public/uploads/prestasi/368', '2022-12-11 07:08:18', NULL, NULL, NULL),
(139, 369, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 369', 2022, 'public/uploads/prestasi/369', '2022-12-11 07:08:18', NULL, NULL, NULL),
(140, 370, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 370', 2022, 'public/uploads/prestasi/370', '2022-12-11 07:08:18', NULL, NULL, NULL),
(141, 373, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 373', 2022, 'public/uploads/prestasi/373', '2022-12-11 07:08:18', NULL, NULL, NULL),
(142, 376, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 376', 2022, 'public/uploads/prestasi/376', '2022-12-11 07:08:18', NULL, NULL, NULL),
(143, 380, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 380', 2022, 'public/uploads/prestasi/380', '2022-12-11 07:08:19', NULL, NULL, NULL),
(144, 382, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 382', 2022, 'public/uploads/prestasi/382', '2022-12-11 07:08:19', NULL, NULL, NULL),
(145, 384, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 384', 2022, 'public/uploads/prestasi/384', '2022-12-11 07:08:19', NULL, NULL, NULL),
(146, 386, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 386', 2022, 'public/uploads/prestasi/386', '2022-12-11 07:08:19', NULL, NULL, NULL),
(147, 387, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 387', 2022, 'public/uploads/prestasi/387', '2022-12-11 07:08:19', NULL, NULL, NULL),
(148, 388, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 388', 2022, 'public/uploads/prestasi/388', '2022-12-11 07:08:19', NULL, NULL, NULL),
(149, 392, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 392', 2022, 'public/uploads/prestasi/392', '2022-12-11 07:08:19', NULL, NULL, NULL),
(150, 400, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 400', 2022, 'public/uploads/prestasi/400', '2022-12-11 07:08:20', NULL, NULL, NULL),
(151, 403, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 403', 2022, 'public/uploads/prestasi/403', '2022-12-11 07:08:20', NULL, NULL, NULL),
(152, 404, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 404', 2022, 'public/uploads/prestasi/404', '2022-12-11 07:08:20', NULL, NULL, NULL),
(153, 405, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 405', 2022, 'public/uploads/prestasi/405', '2022-12-11 07:08:20', NULL, NULL, NULL),
(154, 411, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 411', 2022, 'public/uploads/prestasi/411', '2022-12-11 07:08:20', NULL, NULL, NULL),
(155, 413, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 413', 2022, 'public/uploads/prestasi/413', '2022-12-11 07:08:20', NULL, NULL, NULL),
(156, 419, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 419', 2022, 'public/uploads/prestasi/419', '2022-12-11 07:08:20', NULL, NULL, NULL),
(157, 420, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 420', 2022, 'public/uploads/prestasi/420', '2022-12-11 07:08:20', NULL, NULL, NULL),
(158, 424, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 424', 2022, 'public/uploads/prestasi/424', '2022-12-11 07:08:21', NULL, NULL, NULL),
(159, 427, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 427', 2022, 'public/uploads/prestasi/427', '2022-12-11 07:08:21', NULL, NULL, NULL),
(160, 428, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 428', 2022, 'public/uploads/prestasi/428', '2022-12-11 07:08:21', NULL, NULL, NULL),
(161, 441, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 441', 2022, 'public/uploads/prestasi/441', '2022-12-11 07:08:21', NULL, NULL, NULL),
(162, 443, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 443', 2022, 'public/uploads/prestasi/443', '2022-12-11 07:08:21', NULL, NULL, NULL),
(163, 448, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 448', 2022, 'public/uploads/prestasi/448', '2022-12-11 07:08:22', NULL, NULL, NULL),
(164, 451, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 451', 2022, 'public/uploads/prestasi/451', '2022-12-11 07:08:22', NULL, NULL, NULL),
(165, 453, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 453', 2022, 'public/uploads/prestasi/453', '2022-12-11 07:08:22', NULL, NULL, NULL),
(166, 460, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 460', 2022, 'public/uploads/prestasi/460', '2022-12-11 07:08:22', NULL, NULL, NULL),
(167, 461, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 461', 2022, 'public/uploads/prestasi/461', '2022-12-11 07:08:22', NULL, NULL, NULL),
(168, 462, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 462', 2022, 'public/uploads/prestasi/462', '2022-12-11 07:08:22', NULL, NULL, NULL),
(169, 465, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 465', 2022, 'public/uploads/prestasi/465', '2022-12-11 07:08:22', NULL, NULL, NULL),
(170, 466, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 466', 2022, 'public/uploads/prestasi/466', '2022-12-11 07:08:22', NULL, NULL, NULL),
(171, 467, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 467', 2022, 'public/uploads/prestasi/467', '2022-12-11 07:08:22', NULL, NULL, NULL),
(172, 468, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 468', 2022, 'public/uploads/prestasi/468', '2022-12-11 07:08:22', NULL, NULL, NULL),
(173, 471, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 471', 2022, 'public/uploads/prestasi/471', '2022-12-11 07:08:22', NULL, NULL, NULL),
(174, 472, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 472', 2022, 'public/uploads/prestasi/472', '2022-12-11 07:08:22', NULL, NULL, NULL),
(175, 483, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 483', 2022, 'public/uploads/prestasi/483', '2022-12-11 07:08:23', NULL, NULL, NULL),
(176, 487, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 487', 2022, 'public/uploads/prestasi/487', '2022-12-11 07:08:23', NULL, NULL, NULL),
(177, 488, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 488', 2022, 'public/uploads/prestasi/488', '2022-12-11 07:08:23', NULL, NULL, NULL),
(178, 491, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 491', 2022, 'public/uploads/prestasi/491', '2022-12-11 07:08:23', NULL, NULL, NULL),
(179, 498, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 498', 2022, 'public/uploads/prestasi/498', '2022-12-11 07:08:23', NULL, NULL, NULL),
(180, 500, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 500', 2022, 'public/uploads/prestasi/500', '2022-12-11 07:08:23', NULL, NULL, NULL),
(181, 506, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 506', 2022, 'public/uploads/prestasi/506', '2022-12-11 07:08:24', NULL, NULL, NULL),
(182, 507, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 507', 2022, 'public/uploads/prestasi/507', '2022-12-11 07:08:24', NULL, NULL, NULL),
(183, 510, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 510', 2022, 'public/uploads/prestasi/510', '2022-12-11 07:08:24', NULL, NULL, NULL),
(184, 511, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 511', 2022, 'public/uploads/prestasi/511', '2022-12-11 07:08:24', NULL, NULL, NULL),
(185, 515, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 515', 2022, 'public/uploads/prestasi/515', '2022-12-11 07:08:24', NULL, NULL, NULL),
(186, 526, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 526', 2022, 'public/uploads/prestasi/526', '2022-12-11 07:08:25', NULL, NULL, NULL),
(187, 527, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 527', 2022, 'public/uploads/prestasi/527', '2022-12-11 07:08:25', NULL, NULL, NULL),
(188, 535, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 535', 2022, 'public/uploads/prestasi/535', '2022-12-11 07:08:25', NULL, NULL, NULL),
(189, 541, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 541', 2022, 'public/uploads/prestasi/541', '2022-12-11 07:08:25', NULL, NULL, NULL),
(190, 542, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 542', 2022, 'public/uploads/prestasi/542', '2022-12-11 07:08:25', NULL, NULL, NULL),
(191, 549, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 549', 2022, 'public/uploads/prestasi/549', '2022-12-11 07:08:25', NULL, NULL, NULL),
(192, 553, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 553', 2022, 'public/uploads/prestasi/553', '2022-12-11 07:08:25', NULL, NULL, NULL),
(193, 556, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 556', 2022, 'public/uploads/prestasi/556', '2022-12-11 07:08:25', NULL, NULL, NULL),
(194, 557, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 557', 2022, 'public/uploads/prestasi/557', '2022-12-11 07:08:25', NULL, NULL, NULL),
(195, 559, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 559', 2022, 'public/uploads/prestasi/559', '2022-12-11 07:08:25', NULL, NULL, NULL),
(196, 560, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 560', 2022, 'public/uploads/prestasi/560', '2022-12-11 07:08:25', NULL, NULL, NULL),
(197, 561, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 561', 2022, 'public/uploads/prestasi/561', '2022-12-11 07:08:26', NULL, NULL, NULL),
(198, 564, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 564', 2022, 'public/uploads/prestasi/564', '2022-12-11 07:08:26', NULL, NULL, NULL),
(199, 568, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 568', 2022, 'public/uploads/prestasi/568', '2022-12-11 07:08:26', NULL, NULL, NULL),
(200, 572, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 572', 2022, 'public/uploads/prestasi/572', '2022-12-11 07:08:26', NULL, NULL, NULL),
(201, 573, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 573', 2022, 'public/uploads/prestasi/573', '2022-12-11 07:08:26', NULL, NULL, NULL),
(202, 579, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 579', 2022, 'public/uploads/prestasi/579', '2022-12-11 07:08:26', NULL, NULL, NULL),
(203, 584, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 584', 2022, 'public/uploads/prestasi/584', '2022-12-11 07:08:26', NULL, NULL, NULL),
(204, 586, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 586', 2022, 'public/uploads/prestasi/586', '2022-12-11 07:08:26', NULL, NULL, NULL),
(205, 588, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 588', 2022, 'public/uploads/prestasi/588', '2022-12-11 07:08:26', NULL, NULL, NULL),
(206, 590, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 590', 2022, 'public/uploads/prestasi/590', '2022-12-11 07:08:26', NULL, NULL, NULL),
(207, 594, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 594', 2022, 'public/uploads/prestasi/594', '2022-12-11 07:08:27', NULL, NULL, NULL),
(208, 603, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 603', 2022, 'public/uploads/prestasi/603', '2022-12-11 07:08:27', NULL, NULL, NULL),
(209, 605, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 605', 2022, 'public/uploads/prestasi/605', '2022-12-11 07:08:27', NULL, NULL, NULL),
(210, 607, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 607', 2022, 'public/uploads/prestasi/607', '2022-12-11 07:08:27', NULL, NULL, NULL),
(211, 617, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 617', 2022, 'public/uploads/prestasi/617', '2022-12-11 07:08:27', NULL, NULL, NULL),
(212, 619, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 619', 2022, 'public/uploads/prestasi/619', '2022-12-11 07:08:27', NULL, NULL, NULL),
(213, 623, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 623', 2022, 'public/uploads/prestasi/623', '2022-12-11 07:08:28', NULL, NULL, NULL),
(214, 627, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 627', 2022, 'public/uploads/prestasi/627', '2022-12-11 07:08:28', NULL, NULL, NULL),
(215, 630, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 630', 2022, 'public/uploads/prestasi/630', '2022-12-11 07:08:28', NULL, NULL, NULL),
(216, 631, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 631', 2022, 'public/uploads/prestasi/631', '2022-12-11 07:08:28', NULL, NULL, NULL),
(217, 632, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 632', 2022, 'public/uploads/prestasi/632', '2022-12-11 07:08:28', NULL, NULL, NULL),
(218, 633, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 633', 2022, 'public/uploads/prestasi/633', '2022-12-11 07:08:28', NULL, NULL, NULL),
(219, 634, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 634', 2022, 'public/uploads/prestasi/634', '2022-12-11 07:08:28', NULL, NULL, NULL),
(220, 635, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 635', 2022, 'public/uploads/prestasi/635', '2022-12-11 07:08:28', NULL, NULL, NULL),
(221, 638, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 638', 2022, 'public/uploads/prestasi/638', '2022-12-11 07:08:28', NULL, NULL, NULL),
(222, 639, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 639', 2022, 'public/uploads/prestasi/639', '2022-12-11 07:08:28', NULL, NULL, NULL),
(223, 642, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 642', 2022, 'public/uploads/prestasi/642', '2022-12-11 07:08:28', NULL, NULL, NULL),
(224, 650, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 650', 2022, 'public/uploads/prestasi/650', '2022-12-11 07:08:28', NULL, NULL, NULL),
(225, 651, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 651', 2022, 'public/uploads/prestasi/651', '2022-12-11 07:08:28', NULL, NULL, NULL),
(226, 653, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 653', 2022, 'public/uploads/prestasi/653', '2022-12-11 07:08:29', NULL, NULL, NULL),
(227, 654, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 654', 2022, 'public/uploads/prestasi/654', '2022-12-11 07:08:29', NULL, NULL, NULL),
(228, 658, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 658', 2022, 'public/uploads/prestasi/658', '2022-12-11 07:08:29', NULL, NULL, NULL),
(229, 660, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 660', 2022, 'public/uploads/prestasi/660', '2022-12-11 07:08:29', NULL, NULL, NULL),
(230, 668, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 668', 2022, 'public/uploads/prestasi/668', '2022-12-11 07:08:29', NULL, NULL, NULL),
(231, 670, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 670', 2022, 'public/uploads/prestasi/670', '2022-12-11 07:08:29', NULL, NULL, NULL),
(232, 674, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 674', 2022, 'public/uploads/prestasi/674', '2022-12-11 07:08:29', NULL, NULL, NULL),
(233, 675, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 675', 2022, 'public/uploads/prestasi/675', '2022-12-11 07:08:30', NULL, NULL, NULL),
(234, 676, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 676', 2022, 'public/uploads/prestasi/676', '2022-12-11 07:08:30', NULL, NULL, NULL),
(235, 678, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 678', 2022, 'public/uploads/prestasi/678', '2022-12-11 07:08:30', NULL, NULL, NULL),
(236, 681, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 681', 2022, 'public/uploads/prestasi/681', '2022-12-11 07:08:30', NULL, NULL, NULL),
(237, 683, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 683', 2022, 'public/uploads/prestasi/683', '2022-12-11 07:08:30', NULL, NULL, NULL),
(238, 688, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 688', 2022, 'public/uploads/prestasi/688', '2022-12-11 07:08:30', NULL, NULL, NULL),
(239, 691, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 691', 2022, 'public/uploads/prestasi/691', '2022-12-11 07:08:31', NULL, NULL, NULL),
(240, 694, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 694', 2022, 'public/uploads/prestasi/694', '2022-12-11 07:08:31', NULL, NULL, NULL),
(241, 697, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 697', 2022, 'public/uploads/prestasi/697', '2022-12-11 07:08:31', NULL, NULL, NULL),
(242, 699, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 699', 2022, 'public/uploads/prestasi/699', '2022-12-11 07:08:31', NULL, NULL, NULL),
(243, 702, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 702', 2022, 'public/uploads/prestasi/702', '2022-12-11 07:08:31', NULL, NULL, NULL),
(244, 703, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 703', 2022, 'public/uploads/prestasi/703', '2022-12-11 07:08:31', NULL, NULL, NULL),
(245, 704, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 704', 2022, 'public/uploads/prestasi/704', '2022-12-11 07:08:31', NULL, NULL, NULL),
(246, 705, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 705', 2022, 'public/uploads/prestasi/705', '2022-12-11 07:08:31', NULL, NULL, NULL),
(247, 706, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 706', 2022, 'public/uploads/prestasi/706', '2022-12-11 07:08:31', NULL, NULL, NULL),
(248, 707, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 707', 2022, 'public/uploads/prestasi/707', '2022-12-11 07:08:31', NULL, NULL, NULL),
(249, 708, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 708', 2022, 'public/uploads/prestasi/708', '2022-12-11 07:08:31', NULL, NULL, NULL),
(250, 713, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 713', 2022, 'public/uploads/prestasi/713', '2022-12-11 07:08:32', NULL, NULL, NULL),
(251, 716, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 716', 2022, 'public/uploads/prestasi/716', '2022-12-11 07:08:32', NULL, NULL, NULL),
(252, 717, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 717', 2022, 'public/uploads/prestasi/717', '2022-12-11 07:08:32', NULL, NULL, NULL),
(253, 731, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 731', 2022, 'public/uploads/prestasi/731', '2022-12-11 07:08:32', NULL, NULL, NULL),
(254, 733, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 733', 2022, 'public/uploads/prestasi/733', '2022-12-11 07:08:32', NULL, NULL, NULL),
(255, 737, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 737', 2022, 'public/uploads/prestasi/737', '2022-12-11 07:08:33', NULL, NULL, NULL),
(256, 738, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 738', 2022, 'public/uploads/prestasi/738', '2022-12-11 07:08:33', NULL, NULL, NULL),
(257, 740, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 740', 2022, 'public/uploads/prestasi/740', '2022-12-11 07:08:33', NULL, NULL, NULL),
(258, 743, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 743', 2022, 'public/uploads/prestasi/743', '2022-12-11 07:08:33', NULL, NULL, NULL),
(259, 745, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 745', 2022, 'public/uploads/prestasi/745', '2022-12-11 07:08:33', NULL, NULL, NULL),
(260, 748, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 748', 2022, 'public/uploads/prestasi/748', '2022-12-11 07:08:33', NULL, NULL, NULL),
(261, 749, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 749', 2022, 'public/uploads/prestasi/749', '2022-12-11 07:08:33', NULL, NULL, NULL),
(262, 754, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 754', 2022, 'public/uploads/prestasi/754', '2022-12-11 07:08:33', NULL, NULL, NULL),
(263, 755, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 755', 2022, 'public/uploads/prestasi/755', '2022-12-11 07:08:33', NULL, NULL, NULL),
(264, 763, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 763', 2022, 'public/uploads/prestasi/763', '2022-12-11 07:08:34', NULL, NULL, NULL),
(265, 764, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 764', 2022, 'public/uploads/prestasi/764', '2022-12-11 07:08:34', NULL, NULL, NULL),
(266, 769, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 769', 2022, 'public/uploads/prestasi/769', '2022-12-11 07:08:34', NULL, NULL, NULL),
(267, 775, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 775', 2022, 'public/uploads/prestasi/775', '2022-12-11 07:08:34', NULL, NULL, NULL),
(268, 777, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 777', 2022, 'public/uploads/prestasi/777', '2022-12-11 07:08:34', NULL, NULL, NULL),
(269, 778, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 778', 2022, 'public/uploads/prestasi/778', '2022-12-11 07:08:34', NULL, NULL, NULL),
(270, 781, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 781', 2022, 'public/uploads/prestasi/781', '2022-12-11 07:08:34', NULL, NULL, NULL),
(271, 785, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 785', 2022, 'public/uploads/prestasi/785', '2022-12-11 07:08:34', NULL, NULL, NULL),
(272, 787, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 787', 2022, 'public/uploads/prestasi/787', '2022-12-11 07:08:34', NULL, NULL, NULL),
(273, 789, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 789', 2022, 'public/uploads/prestasi/789', '2022-12-11 07:08:35', NULL, NULL, NULL),
(274, 798, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 798', 2022, 'public/uploads/prestasi/798', '2022-12-11 07:08:35', NULL, NULL, NULL),
(275, 801, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 801', 2022, 'public/uploads/prestasi/801', '2022-12-11 07:08:35', NULL, NULL, NULL),
(276, 803, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 803', 2022, 'public/uploads/prestasi/803', '2022-12-11 07:08:35', NULL, NULL, NULL),
(277, 805, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 805', 2022, 'public/uploads/prestasi/805', '2022-12-11 07:08:35', NULL, NULL, NULL),
(278, 806, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 806', 2022, 'public/uploads/prestasi/806', '2022-12-11 07:08:35', NULL, NULL, NULL),
(279, 808, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 808', 2022, 'public/uploads/prestasi/808', '2022-12-11 07:08:35', NULL, NULL, NULL),
(280, 809, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 809', 2022, 'public/uploads/prestasi/809', '2022-12-11 07:08:35', NULL, NULL, NULL),
(281, 810, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 810', 2022, 'public/uploads/prestasi/810', '2022-12-11 07:08:35', NULL, NULL, NULL),
(282, 813, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 813', 2022, 'public/uploads/prestasi/813', '2022-12-11 07:08:35', NULL, NULL, NULL),
(283, 816, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 816', 2022, 'public/uploads/prestasi/816', '2022-12-11 07:08:35', NULL, NULL, NULL),
(284, 817, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 817', 2022, 'public/uploads/prestasi/817', '2022-12-11 07:08:35', NULL, NULL, NULL),
(285, 834, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 834', 2022, 'public/uploads/prestasi/834', '2022-12-11 07:08:36', NULL, NULL, NULL),
(286, 836, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 836', 2022, 'public/uploads/prestasi/836', '2022-12-11 07:08:36', NULL, NULL, NULL),
(287, 839, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 839', 2022, 'public/uploads/prestasi/839', '2022-12-11 07:08:36', NULL, NULL, NULL),
(288, 842, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 842', 2022, 'public/uploads/prestasi/842', '2022-12-11 07:08:36', NULL, NULL, NULL),
(289, 847, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 847', 2022, 'public/uploads/prestasi/847', '2022-12-11 07:08:36', NULL, NULL, NULL),
(290, 848, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 848', 2022, 'public/uploads/prestasi/848', '2022-12-11 07:08:36', NULL, NULL, NULL),
(291, 849, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 849', 2022, 'public/uploads/prestasi/849', '2022-12-11 07:08:36', NULL, NULL, NULL),
(292, 850, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 850', 2022, 'public/uploads/prestasi/850', '2022-12-11 07:08:36', NULL, NULL, NULL),
(293, 851, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 851', 2022, 'public/uploads/prestasi/851', '2022-12-11 07:08:36', NULL, NULL, NULL),
(294, 856, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 856', 2022, 'public/uploads/prestasi/856', '2022-12-11 07:08:36', NULL, NULL, NULL),
(295, 859, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 859', 2022, 'public/uploads/prestasi/859', '2022-12-11 07:08:36', NULL, NULL, NULL),
(296, 863, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 863', 2022, 'public/uploads/prestasi/863', '2022-12-11 07:08:36', NULL, NULL, NULL),
(297, 864, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 864', 2022, 'public/uploads/prestasi/864', '2022-12-11 07:08:36', NULL, NULL, NULL),
(298, 871, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 871', 2022, 'public/uploads/prestasi/871', '2022-12-11 07:08:37', NULL, NULL, NULL),
(299, 872, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 872', 2022, 'public/uploads/prestasi/872', '2022-12-11 07:08:37', NULL, NULL, NULL),
(300, 877, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 877', 2022, 'public/uploads/prestasi/877', '2022-12-11 07:08:37', NULL, NULL, NULL),
(301, 879, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 879', 2022, 'public/uploads/prestasi/879', '2022-12-11 07:08:37', NULL, NULL, NULL),
(302, 881, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 881', 2022, 'public/uploads/prestasi/881', '2022-12-11 07:08:37', NULL, NULL, NULL),
(303, 883, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 883', 2022, 'public/uploads/prestasi/883', '2022-12-11 07:08:37', NULL, NULL, NULL),
(304, 884, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 884', 2022, 'public/uploads/prestasi/884', '2022-12-11 07:08:37', NULL, NULL, NULL),
(305, 885, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 885', 2022, 'public/uploads/prestasi/885', '2022-12-11 07:08:37', NULL, NULL, NULL),
(306, 886, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 886', 2022, 'public/uploads/prestasi/886', '2022-12-11 07:08:37', NULL, NULL, NULL),
(307, 887, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 887', 2022, 'public/uploads/prestasi/887', '2022-12-11 07:08:37', NULL, NULL, NULL),
(308, 888, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 888', 2022, 'public/uploads/prestasi/888', '2022-12-11 07:08:37', NULL, NULL, NULL),
(309, 889, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 889', 2022, 'public/uploads/prestasi/889', '2022-12-11 07:08:37', NULL, NULL, NULL),
(310, 892, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 892', 2022, 'public/uploads/prestasi/892', '2022-12-11 07:08:37', NULL, NULL, NULL),
(311, 896, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 896', 2022, 'public/uploads/prestasi/896', '2022-12-11 07:08:37', NULL, NULL, NULL),
(312, 899, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 899', 2022, 'public/uploads/prestasi/899', '2022-12-11 07:08:37', NULL, NULL, NULL),
(313, 901, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 901', 2022, 'public/uploads/prestasi/901', '2022-12-11 07:08:38', NULL, NULL, NULL),
(314, 904, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 904', 2022, 'public/uploads/prestasi/904', '2022-12-11 07:08:38', NULL, NULL, NULL),
(315, 906, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 906', 2022, 'public/uploads/prestasi/906', '2022-12-11 07:08:38', NULL, NULL, NULL),
(316, 910, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 910', 2022, 'public/uploads/prestasi/910', '2022-12-11 07:08:38', NULL, NULL, NULL),
(317, 911, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 911', 2022, 'public/uploads/prestasi/911', '2022-12-11 07:08:38', NULL, NULL, NULL),
(318, 917, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 917', 2022, 'public/uploads/prestasi/917', '2022-12-11 07:08:38', NULL, NULL, NULL),
(319, 918, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 918', 2022, 'public/uploads/prestasi/918', '2022-12-11 07:08:38', NULL, NULL, NULL),
(320, 923, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 923', 2022, 'public/uploads/prestasi/923', '2022-12-11 07:08:38', NULL, NULL, NULL),
(321, 926, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 926', 2022, 'public/uploads/prestasi/926', '2022-12-11 07:08:38', NULL, NULL, NULL),
(322, 930, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 930', 2022, 'public/uploads/prestasi/930', '2022-12-11 07:08:38', NULL, NULL, NULL),
(323, 937, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 937', 2022, 'public/uploads/prestasi/937', '2022-12-11 07:08:38', NULL, NULL, NULL),
(324, 938, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 938', 2022, 'public/uploads/prestasi/938', '2022-12-11 07:08:38', NULL, NULL, NULL),
(325, 939, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 939', 2022, 'public/uploads/prestasi/939', '2022-12-11 07:08:38', NULL, NULL, NULL),
(326, 940, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 940', 2022, 'public/uploads/prestasi/940', '2022-12-11 07:08:38', NULL, NULL, NULL),
(327, 943, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 943', 2022, 'public/uploads/prestasi/943', '2022-12-11 07:08:39', NULL, NULL, NULL),
(328, 944, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 944', 2022, 'public/uploads/prestasi/944', '2022-12-11 07:08:39', NULL, NULL, NULL);
INSERT INTO `pendaftar_prestasi` (`id`, `id_pendaftar`, `tingkat_prestasi`, `nama_prestasi`, `tahun`, `url_dokumen`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(329, 946, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 946', 2022, 'public/uploads/prestasi/946', '2022-12-11 07:08:39', NULL, NULL, NULL),
(330, 954, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 954', 2022, 'public/uploads/prestasi/954', '2022-12-11 07:08:39', NULL, NULL, NULL),
(331, 955, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 955', 2022, 'public/uploads/prestasi/955', '2022-12-11 07:08:39', NULL, NULL, NULL),
(332, 960, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 960', 2022, 'public/uploads/prestasi/960', '2022-12-11 07:08:39', NULL, NULL, NULL),
(333, 963, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 963', 2022, 'public/uploads/prestasi/963', '2022-12-11 07:08:39', NULL, NULL, NULL),
(334, 965, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 965', 2022, 'public/uploads/prestasi/965', '2022-12-11 07:08:39', NULL, NULL, NULL),
(335, 967, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 967', 2022, 'public/uploads/prestasi/967', '2022-12-11 07:08:39', NULL, NULL, NULL),
(336, 969, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 969', 2022, 'public/uploads/prestasi/969', '2022-12-11 07:08:39', NULL, NULL, NULL),
(337, 971, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 971', 2022, 'public/uploads/prestasi/971', '2022-12-11 07:08:39', NULL, NULL, NULL),
(338, 972, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 972', 2022, 'public/uploads/prestasi/972', '2022-12-11 07:08:39', NULL, NULL, NULL),
(339, 973, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 973', 2022, 'public/uploads/prestasi/973', '2022-12-11 07:08:39', NULL, NULL, NULL),
(340, 977, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 977', 2022, 'public/uploads/prestasi/977', '2022-12-11 07:08:39', NULL, NULL, NULL),
(341, 978, 'INTERNASIONAL', 'Prestasi INTERNASIONAL Cut Naila Fadia Fiadharma 978', 2022, 'public/uploads/prestasi/978', '2022-12-11 07:08:39', NULL, NULL, NULL),
(342, 979, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 979', 2022, 'public/uploads/prestasi/979', '2022-12-11 07:08:39', NULL, NULL, NULL),
(343, 985, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 985', 2022, 'public/uploads/prestasi/985', '2022-12-11 07:08:40', NULL, NULL, NULL),
(344, 986, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 986', 2022, 'public/uploads/prestasi/986', '2022-12-11 07:08:40', NULL, NULL, NULL),
(345, 989, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 989', 2022, 'public/uploads/prestasi/989', '2022-12-11 07:08:40', NULL, NULL, NULL),
(346, 998, 'NASIONAL', 'Prestasi NASIONAL Cut Naila Fadia Fiadharma 998', 2022, 'public/uploads/prestasi/998', '2022-12-11 07:08:40', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perguruan_tinggi`
--

CREATE TABLE `perguruan_tinggi` (
  `id_perguruan_tinggi` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perguruan_tinggi`
--

INSERT INTO `perguruan_tinggi` (`id_perguruan_tinggi`, `nama`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 'AMD Academy', '2022-12-07 04:58:50', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(11) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `nama_prodi` varchar(255) NOT NULL,
  `jenjang` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `id_fakultas`, `nama_prodi`, `jenjang`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 1, 'Teknik Informatika', 'S1', '2022-12-07 05:11:46', NULL, NULL, '2022-12-07 05:26:33'),
(2, 1, 'Teknik Industri', 'S1', '2022-12-07 05:11:46', NULL, NULL, '2022-12-07 05:22:51'),
(3, 1, 'Teknin Mesin', 'S1', '2022-12-07 05:17:31', NULL, NULL, '2022-12-07 05:22:55'),
(4, 1, 'Teknik Elektro', 'S1', '2022-12-07 05:17:31', NULL, NULL, '2022-12-07 05:22:58'),
(5, 2, 'Sastra Inggris', 'S1', '2022-12-07 05:18:25', NULL, NULL, '2022-12-07 05:23:01'),
(6, 3, 'Sistem Infromasi', 'S1', '2022-12-07 05:18:25', NULL, NULL, '2022-12-07 05:23:04'),
(7, 4, 'Manajemen', 'S1', '2022-12-07 05:20:04', NULL, NULL, '2022-12-07 05:23:07'),
(8, 4, 'Akuntansi', 'S1', '2022-12-07 05:20:04', NULL, NULL, '2022-12-07 05:23:10'),
(9, 4, 'Ilmu Ekonomi', 'S1', '2022-12-07 05:22:28', NULL, NULL, '2022-12-07 05:23:14'),
(10, 5, 'Psikologi', 'S1', '2022-12-07 05:22:28', NULL, NULL, '2022-12-07 05:23:19'),
(11, 5, 'Psikologi', 'S2', '2022-12-07 05:25:10', NULL, NULL, '2022-12-07 05:25:31'),
(12, 2, 'Sastra Inggris', 'S2', '2022-12-07 05:25:10', NULL, NULL, '2022-12-07 05:26:55'),
(13, 1, 'Teknik Mesin', 'S2', '2022-12-07 05:26:01', NULL, NULL, '2022-12-07 05:27:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`),
  ADD KEY `id_perguruan_tinggi` (`id_perguruan_tinggi`),
  ADD KEY `id_perguruan_tinggi_2` (`id_perguruan_tinggi`);

--
-- Indexes for table `jalur_masuk`
--
ALTER TABLE `jalur_masuk`
  ADD PRIMARY KEY (`id_jalur`);

--
-- Indexes for table `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD PRIMARY KEY (`id_pendaftar`),
  ADD UNIQUE KEY `UNI` (`no_pendaftar`),
  ADD KEY `MUL` (`id_jalur`),
  ADD KEY `id_prodi1` (`id_prodi1`),
  ADD KEY `id_prodi2` (`id_prodi2`),
  ADD KEY `id_bank` (`id_bank`);

--
-- Indexes for table `pendaftar_prestasi`
--
ALTER TABLE `pendaftar_prestasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pendaftar` (`id_pendaftar`);

--
-- Indexes for table `perguruan_tinggi`
--
ALTER TABLE `perguruan_tinggi`
  ADD PRIMARY KEY (`id_perguruan_tinggi`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD KEY `id_fakultas` (`id_fakultas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jalur_masuk`
--
ALTER TABLE `jalur_masuk`
  MODIFY `id_jalur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pendaftar`
--
ALTER TABLE `pendaftar`
  MODIFY `id_pendaftar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `pendaftar_prestasi`
--
ALTER TABLE `pendaftar_prestasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT for table `perguruan_tinggi`
--
ALTER TABLE `perguruan_tinggi`
  MODIFY `id_perguruan_tinggi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD CONSTRAINT `fakultas_ibfk_1` FOREIGN KEY (`id_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`id_perguruan_tinggi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD CONSTRAINT `pendaftar_ibfk_1` FOREIGN KEY (`id_prodi1`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pendaftar_ibfk_2` FOREIGN KEY (`id_prodi2`) REFERENCES `prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pendaftar_ibfk_3` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pendaftar_ibfk_4` FOREIGN KEY (`id_jalur`) REFERENCES `jalur_masuk` (`id_jalur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pendaftar_prestasi`
--
ALTER TABLE `pendaftar_prestasi`
  ADD CONSTRAINT `pendaftar_prestasi_ibfk_1` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
