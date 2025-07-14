# ************************************************************
# Sequel Ace SQL dump
# Version 20094
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.25)
# Database: simoreg_db
# Generation Time: 2025-07-07 18:29:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bagsubags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bagsubags`;

CREATE TABLE `bagsubags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `bagsubags` WRITE;
/*!40000 ALTER TABLE `bagsubags` DISABLE KEYS */;

INSERT INTO `bagsubags` (`id`, `kode`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,'KABAG KERMA','Kepala Bagian Kerja Sama','2025-06-29 13:49:58','2025-06-29 13:54:35'),
	(2,'KASUBBAG RENMIN','Kepala Sub Bagian Perencanaan dan Administrasi','2025-06-29 13:51:47','2025-06-29 13:54:08'),
	(3,'KABAG DALOPS','Kepala Bagian Pengendalian Operasi','2025-06-29 13:53:17','2025-06-29 13:53:17'),
	(4,'KABAG BINOPS','Kepala Bagian Pembinaan Operasi','2025-06-29 13:54:28','2025-06-29 13:54:28'),
	(5,'KA SPKT','Kepala Sentra Pelayanan Kepolisian Terpadu','2025-06-29 13:56:01','2025-06-29 13:56:01');

/*!40000 ALTER TABLE `bagsubags` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cache_locks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table detailuraians
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detailuraians`;

CREATE TABLE `detailuraians` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kodeakun_id` bigint unsigned NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagu` bigint DEFAULT NULL,
  `bagsubag_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detailuraians_kodeakun_id_foreign` (`kodeakun_id`),
  CONSTRAINT `detailuraians_kodeakun_id_foreign` FOREIGN KEY (`kodeakun_id`) REFERENCES `kodeakuns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `detailuraians` WRITE;
/*!40000 ALTER TABLE `detailuraians` DISABLE KEYS */;

INSERT INTO `detailuraians` (`id`, `kodeakun_id`, `kode`, `nama`, `pagu`, `bagsubag_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'-','Monev MoU Integras CCTV Pemda dengan Command Centre Poin',5400000,1,'2025-06-27 13:49:01','2025-06-27 13:49:01'),
	(2,2,'-','Honor Operator SAI',1800000,2,'2025-06-27 14:02:07','2025-06-27 14:02:07'),
	(3,2,'-','Honor Operator SIRENA dan E MONEV',3600000,2,'2025-06-27 14:03:31','2025-06-27 14:03:31'),
	(4,3,'-','Kegiatan Rapat di Luar kantor Susun Anggaran T.A 2025',22750000,2,'2025-06-27 14:10:51','2025-06-27 14:10:51'),
	(5,3,'-','Dukmin Penyusunan Program, Anggaran dan Rencana Kerja T.A 2025',6425200,2,'2025-06-27 14:13:03','2025-06-27 14:13:03'),
	(6,3,'-','Cetak Anggaran Masing-Masing Bagian 2025',400000,2,'2025-06-27 14:14:45','2025-06-27 14:14:45'),
	(7,4,'-','Rapat Pimpinan',51378000,3,'2025-06-27 14:17:49','2025-06-27 14:17:49'),
	(8,4,'-','Gelar Operasional',200640000,3,'2025-06-27 14:18:53','2025-06-27 14:18:53'),
	(9,4,'-','Anew Rutin Perkambangan Sitkamtibmas Tahun 2025',3000000,3,'2025-06-27 14:21:23','2025-06-27 14:21:23'),
	(10,5,'-','Latpra Kewilayahan 2025',61218000,4,'2025-06-27 14:24:23','2025-07-02 18:19:05'),
	(11,5,'-','Sosialisasi Pengamanan Keramaian Bersifat Komersial',36357000,4,'2025-06-27 14:26:19','2025-06-27 14:26:19'),
	(12,5,'-','Rapat Kesiapan Operasi LILIN 2025',74778000,4,'2025-06-27 14:28:05','2025-07-02 18:18:34'),
	(13,5,'-','Rapat Kesiapan Operasi KETUPAT 2025',74678000,4,'2025-06-27 14:29:17','2025-06-27 14:29:17'),
	(14,5,'-','Apel Gelar Pasukan  Operasi LILIN 2025',25007000,4,'2025-06-27 14:30:46','2025-07-02 18:17:59'),
	(15,5,'-','Penggandaan dan Jilid Rencana Kontijensi',9597000,4,'2025-06-27 14:32:56','2025-06-27 14:32:56'),
	(16,5,'-','Penggandaan Bijak Operasional Tahun 2025',4725000,4,'2025-06-27 14:36:01','2025-06-27 14:36:01'),
	(17,5,'-','Kegiatan Insidentil/Rapat',62203800,4,'2025-06-27 14:37:09','2025-06-27 14:37:09'),
	(18,5,'-','Apel Kesiapan Bencana Alam',27000000,4,'2025-06-27 14:38:03','2025-07-02 18:17:29'),
	(19,6,'-','Rapat Pertemuan Diluar Kantor/Peket Hotel',23500000,1,'2025-06-27 14:41:12','2025-07-02 18:16:54'),
	(20,6,'-','ATK',1683000,1,'2025-06-27 14:41:39','2025-07-02 18:16:29'),
	(21,7,'-','Pelaksanaan Supervisi',86700000,5,'2025-06-27 14:46:50','2025-06-27 14:46:50'),
	(22,7,'-','Rapat Evaluasi Piket Fungsi, Siaga SPKT dan Operator Layanan Polisi 110',4800000,5,'2025-06-27 14:49:01','2025-06-27 14:49:01'),
	(23,7,'-','Penyajian Informasi dan Tupoksi',5680000,5,'2025-06-27 14:50:38','2025-07-02 18:15:52'),
	(24,7,'-','Kegiatan Rakemis ( Giat Diluar Kantor )',1500000,5,'2025-06-27 14:52:24','2025-06-27 14:52:24'),
	(25,8,'-','ULP Non Organik Roops',127750000,3,'2025-06-27 14:59:19','2025-06-27 14:59:19'),
	(26,8,'-','ULP Non Organik Command Center',229950000,3,'2025-06-27 15:00:28','2025-06-27 15:00:28'),
	(27,8,'-','ULP Non Organik SPKT',153300000,5,'2025-06-27 15:01:18','2025-06-27 15:01:18'),
	(28,9,'-','Operator Komputer ROOPS',4788000,2,'2025-06-27 15:08:25','2025-06-27 15:08:25'),
	(29,9,'-','Operator Komputer SPKT',3192000,5,'2025-06-27 15:09:21','2025-06-27 15:09:21'),
	(30,10,'-','Rapat',7200000,2,'2025-06-27 15:15:31','2025-06-27 15:15:31'),
	(31,11,'-','Pembayaran Gaji dan Tunjangan',9110110000,2,'2025-06-27 15:27:14','2025-06-27 15:27:14'),
	(32,11,'-','Lembur',20760000,2,'2025-06-27 15:27:46','2025-06-27 15:27:46'),
	(33,12,'-','Kerja Sama Dengan Kementrian Pendidikan',1800000,1,'2025-06-27 15:35:43','2025-06-27 15:35:43'),
	(34,12,'-','Kerja Sama Dengan Pemerintah',1800000,1,'2025-06-27 15:37:27','2025-07-02 18:14:11'),
	(35,12,'-','Kerja Sama Dengan Swasta',1800000,1,'2025-06-27 15:38:28','2025-07-02 18:13:36'),
	(36,12,'-','Monitoring dan Evaluasi Kerjasama Instansi dan Swasta',9900000,1,'2025-06-27 15:39:49','2025-06-27 15:39:49'),
	(37,12,'-','Asistensi Monev Kerma',33818000,1,'2025-06-27 15:41:31','2025-07-02 18:12:50'),
	(38,13,'-','Bekal Kantor ROOPS',102510000,2,'2025-06-27 15:48:23','2025-06-27 15:48:23'),
	(39,13,'-','Bekal Kantor SPKT',53550000,5,'2025-06-27 15:49:21','2025-06-27 15:49:21'),
	(40,14,'-','Operasi Antik Lipu 2025',250000000,4,'2025-06-27 16:05:06','2025-07-02 18:11:37'),
	(41,14,'-','Operasi Sikat Lipu 2025',250000000,4,'2025-06-27 16:05:58','2025-07-02 18:11:09'),
	(42,14,'-','Operasi Pekat Lipu 2025',250000000,4,'2025-06-27 16:06:43','2025-07-02 18:10:38'),
	(43,15,'-','Operasi Lilin 2025',748594000,4,'2025-06-27 16:10:23','2025-07-02 18:08:45'),
	(44,16,'-','Operasi Ketupat 2025',1219659000,4,'2025-06-27 16:14:35','2025-06-27 16:14:35'),
	(45,17,'-','pengamanan Sepak Bola',1182146400,4,'2025-06-27 16:26:38','2025-06-27 16:26:38'),
	(46,17,'-','Pengamanan Konser Musik 1',439444800,4,'2025-06-27 16:28:35','2025-06-27 16:28:35'),
	(47,17,'-','Pengamanan Konser Musik 2',116570000,4,'2025-06-27 16:29:59','2025-06-27 16:29:59'),
	(48,17,'-','Pengamanan Konser Musik 3',31396800,4,'2025-06-27 16:30:46','2025-06-27 16:30:46'),
	(49,17,'-','ATK',1294000,4,'2025-06-27 16:31:55','2025-06-27 16:31:55'),
	(50,18,'-','Har Rujab Karoops',46410000,2,'2025-06-27 16:46:02','2025-06-27 16:46:02'),
	(51,18,'-','Har Gedung Kantor',10115000,5,'2025-06-27 16:46:51','2025-06-27 16:46:51'),
	(52,19,'-','Har Ranmor Roda 4 Roops',34980000,2,'2025-06-27 16:50:54','2025-06-27 16:50:54'),
	(53,19,'-','Har Ranmor Roda 4 SPKT',48000000,5,'2025-06-27 16:51:41','2025-06-27 16:51:41'),
	(54,20,'-','Har Ranmor Roda 2',3800000,2,'2025-06-27 16:56:00','2025-06-27 16:56:00'),
	(55,21,'-','Har Personal Komputer ROOPS',21900000,2,'2025-06-27 17:07:21','2025-06-27 17:07:21'),
	(56,21,'-','Har Printer ROOPS',8970000,2,'2025-06-27 17:08:50','2025-06-27 17:08:50'),
	(57,21,'-','Har AC ROOPS',6100000,2,'2025-06-27 17:12:32','2025-06-27 17:12:32'),
	(58,21,'-','Har Inventaris Kantor ROOPS',3120000,2,'2025-06-27 17:13:39','2025-06-27 17:13:39'),
	(59,21,'-','Har Personal Komputer SPKT',5110000,5,'2025-06-27 17:14:30','2025-06-27 17:14:30'),
	(60,21,'-','Har Printer SPKT',3450000,5,'2025-06-27 17:15:10','2025-06-27 17:15:10'),
	(61,21,'-','Har AC SPKT',3050000,5,'2025-06-27 17:15:43','2025-06-27 17:15:43'),
	(62,22,'-','Har Handy Talk (HT)',1300000,2,'2025-06-27 17:19:06','2025-06-27 17:19:06'),
	(63,22,'-','SENPI',140000,2,'2025-06-27 17:19:58','2025-07-02 18:06:44');

/*!40000 ALTER TABLE `detailuraians` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table job_batches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table kegiatans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kegiatans`;

CREATE TABLE `kegiatans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `program_id` bigint unsigned NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kegiatans_program_id_foreign` (`program_id`),
  CONSTRAINT `kegiatans_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `kegiatans` WRITE;
/*!40000 ALTER TABLE `kegiatans` DISABLE KEYS */;

INSERT INTO `kegiatans` (`id`, `program_id`, `kode`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,1,'3120','Kerja Sama Keamanan dan Ketertiban K /L','2025-06-27 13:39:59','2025-06-27 13:39:59'),
	(2,1,'3128','Dukungan Manajemen dan Teknis Keamanan dan Ketertiban Masyarakat','2025-06-27 13:50:04','2025-06-27 13:50:04'),
	(3,1,'5079','Pembinaan Operasi Kepolisian','2025-06-27 15:52:02','2025-06-27 15:52:02'),
	(4,1,'5080','Pengendalian Operasi Kepolisian','2025-06-27 16:17:07','2025-06-27 16:17:07'),
	(5,2,'5059','Dukungan Manajemen dan Teknik Sarpras','2025-06-27 16:36:08','2025-06-27 16:36:08');

/*!40000 ALTER TABLE `kegiatans` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kodeakuns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kodeakuns`;

CREATE TABLE `kodeakuns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subkomponen_id` bigint unsigned NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kodeakuns_subkomponen_id_foreign` (`subkomponen_id`),
  CONSTRAINT `kodeakuns_subkomponen_id_foreign` FOREIGN KEY (`subkomponen_id`) REFERENCES `subkomponens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `kodeakuns` WRITE;
/*!40000 ALTER TABLE `kodeakuns` DISABLE KEYS */;

INSERT INTO `kodeakuns` (`id`, `subkomponen_id`, `kode`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,1,'521119','Belanjan Barang Operasional Lainnya','2025-06-27 13:47:50','2025-06-27 13:47:50'),
	(2,2,'521115','Belanja Honor Operasional Satuan Kerja','2025-06-27 14:01:05','2025-06-27 14:01:05'),
	(3,3,'XXXJF1','Kegiatan Renmin Ops','2025-06-27 14:08:53','2025-06-27 14:08:53'),
	(4,3,'XXXJF2','Kegiatan Dalops','2025-06-27 14:16:24','2025-06-27 14:16:24'),
	(5,3,'XXXJF3','Kegiatan Binops','2025-06-27 14:22:47','2025-06-27 14:22:47'),
	(6,3,'XXXJF4','Kegiatan Kerma','2025-06-27 14:39:53','2025-06-27 14:39:53'),
	(7,3,'XXXJF5','Dukops SPKT','2025-06-27 14:45:42','2025-06-27 14:45:42'),
	(8,4,'521112','Belanja Pengadaan Bahan Makanan','2025-06-27 14:58:09','2025-06-27 14:58:09'),
	(9,5,'521113','Belanja Penambah Daya Tahan Tubuh','2025-06-27 15:04:51','2025-06-27 15:04:51'),
	(10,6,'521211','Belanja Bahan','2025-06-27 15:14:47','2025-06-27 15:14:47'),
	(11,7,'511161','Gaji','2025-06-27 15:26:15','2025-06-27 15:26:15'),
	(12,8,'521119','Belanja Barang Operasional Lainnya','2025-06-27 15:32:13','2025-06-27 15:32:13'),
	(13,9,'521811','Belanja Barang Persediaan Barang Konsumsi','2025-06-27 15:47:18','2025-06-27 15:47:18'),
	(14,10,'521119','Belanja Barang Operasional Lainnya','2025-06-27 16:02:33','2025-06-27 16:02:33'),
	(15,11,'521119','Belanja Barang Operasional Lainnya','2025-06-27 16:09:02','2025-06-27 16:09:02'),
	(16,12,'521119','Belanja Barang Operasional Lainnya','2025-06-27 16:13:43','2025-06-27 16:13:43'),
	(17,13,'521119','Belanja Barang Operasional Lainnya','2025-06-27 16:25:01','2025-06-27 16:25:01'),
	(18,14,'523111','Belanja Pemeliharaan Gedung dan Bangunan','2025-06-27 16:45:01','2025-06-27 16:45:01'),
	(19,15,'523121','Belanja Pemeliharaan Peralatan dan Mesin','2025-06-27 16:49:46','2025-06-27 16:49:46'),
	(20,16,'523121','Belanja Pemeliharaan Peralatan dan Mesin','2025-06-27 16:54:55','2025-06-27 16:54:55'),
	(21,17,'523121','Belanja Pemeliharaan Peralatan dan Mesin','2025-06-27 17:05:32','2025-06-27 17:05:32'),
	(22,18,'523121','Belanja Pemeliharaan Peralatan dan Mesin','2025-06-27 17:18:01','2025-06-27 17:18:01');

/*!40000 ALTER TABLE `kodeakuns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table komponens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `komponens`;

CREATE TABLE `komponens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ro_id` bigint unsigned NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `komponens_ro_id_foreign` (`ro_id`),
  CONSTRAINT `komponens_ro_id_foreign` FOREIGN KEY (`ro_id`) REFERENCES `ros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `komponens` WRITE;
/*!40000 ALTER TABLE `komponens` DISABLE KEYS */;

INSERT INTO `komponens` (`id`, `ro_id`, `kode`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,1,'003','Dukungan Operasional Pertahanan Keamanan','2025-06-27 13:42:22','2025-06-27 13:42:22'),
	(2,2,'003','Dukungan Operasional Pertahanan dan Keamanan','2025-06-27 13:55:44','2025-06-27 13:55:44'),
	(3,3,'001','Gaji dan Tunjangan','2025-06-27 15:24:20','2025-06-27 15:24:20'),
	(4,3,'002','Operasional dan Pemeliharaan Kantor','2025-06-27 15:29:12','2025-06-27 15:29:12'),
	(5,4,'003','Dukungan Operasional Pertahanan dan Keamanan','2025-06-27 15:59:19','2025-06-27 15:59:19'),
	(6,5,'003','Dukungan Operasional Pertahanan dan Keamanan','2025-06-27 16:22:15','2025-06-27 16:22:15'),
	(7,6,'002','Operasional dan Pemeliharaan Kantor','2025-06-27 16:42:15','2025-06-27 16:42:15');

/*!40000 ALTER TABLE `komponens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kros
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kros`;

CREATE TABLE `kros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kegiatan_id` bigint unsigned NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kros_kegiatan_id_foreign` (`kegiatan_id`),
  CONSTRAINT `kros_kegiatan_id_foreign` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `kros` WRITE;
/*!40000 ALTER TABLE `kros` DISABLE KEYS */;

INSERT INTO `kros` (`id`, `kegiatan_id`, `kode`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,1,'3120.AEC','Kerja Sama','2025-06-27 13:40:32','2025-06-27 13:40:32'),
	(2,2,'3128.EBA','Layanan Dukungan Manajemen INternal','2025-06-27 13:50:49','2025-06-27 13:50:49'),
	(3,3,'5079.BHB','Operasi Bidang Keamanan','2025-06-27 15:54:27','2025-06-27 15:54:27'),
	(4,4,'5080.EBA','Pelayanan Publik Lainnya','2025-06-27 16:18:24','2025-06-27 16:18:24'),
	(5,5,'5059.EBA','Layanan Dukungan Manajemen Internal','2025-06-27 16:37:58','2025-06-27 16:37:58');

/*!40000 ALTER TABLE `kros` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `main_menu` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_parent` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `parent` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index` int NOT NULL DEFAULT '100',
  `sort` tinyint NOT NULL DEFAULT '1',
  `active` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `main_menu`, `sub_parent`, `parent`, `name`, `icon`, `url`, `index`, `sort`, `active`, `created_at`, `updated_at`)
VALUES
	(1,'APPS','0',0,'APPS','','#',1,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(2,'APPS','0',0,'DATA MASTER','','#',2,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(3,'APPS','0',0,'USER','','#',3,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(4,'APPS','0',0,'USER SETTING','','#',4,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(5,'APPS','1',1,'Input Rencana Kegiatan','bi-stack','rencana-kegiatan',1,1,'1','2025-04-29 21:44:31','2025-06-27 13:14:35'),
	(6,'APPS','0',2,'Program','bi-stack','program',1,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(7,'APPS','0',2,'Kegiatan','bi-stack','kegiatan',2,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(8,'APPS','0',2,'K R O','bi-stack','kro',3,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(9,'APPS','0',2,'R O','bi-stack','ro',4,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(10,'APPS','0',2,'Komponen','bi-stack','komponen',5,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(11,'APPS','0',2,'Sub Komponen','bi-stack','sub-komponen',6,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(12,'APPS','0',2,'Kode Akun','bi-stack','kode-akun',7,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(13,'APPS','1',2,'Detail Uraian','bi-stack','detail-uraian',8,1,'1','2025-04-29 21:44:31','2025-06-23 09:12:37'),
	(14,'APPS','0',3,'User','bi-people-fill','users',0,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(15,'APPS','0',4,'Role','bi-gear-wide','roles',0,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(16,'APPS','0',4,'Menu','bi-card-list','menus',0,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(17,'APPS','0',4,'User Menu','bi-gear-fill','user-menus',0,1,'1','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(18,'Master','1',2,'Bagian / Sub Bagian','bi-stack','bagsubag',0,1,'1','2025-06-29 13:34:33','2025-06-29 13:34:33'),
	(19,'APPS','1',1,'Test Menu','bi-people-fill','testing',99,1,'1','2025-06-30 11:58:16','2025-06-30 11:58:16'),
	(20,'APPS','1',1,'Detail Rencana Kegiatan','bi-stack','detail-kegiatan',2,1,'1','2025-07-01 16:41:57','2025-07-01 16:41:57');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'0001_01_01_000000_create_users_table',1),
	(2,'0001_01_01_000001_create_cache_table',1),
	(3,'0001_01_01_000002_create_jobs_table',1),
	(4,'2024_07_11_235714_create_roles_table',1),
	(5,'2024_07_11_235801_create_menus_table',1),
	(6,'2024_07_11_235922_create_user_menus_table',1),
	(7,'2025_04_28_111817_create_programs_table',1),
	(8,'2025_04_29_085818_create_kegiatans_table',1),
	(9,'2025_04_30_000946_create_kros_table',2),
	(10,'2025_05_08_181725_create_ros_table',3),
	(11,'2025_05_08_195607_create_komponens_table',4),
	(12,'2025_05_09_210507_create_subkomponens_table',5),
	(13,'2025_05_10_152554_create_kodeakuns_table',6),
	(14,'2025_06_23_090807_create_detailuraians_table',6),
	(15,'2025_06_27_172438_create_bagsubags_table',7),
	(16,'2025_06_27_130517_create_rencana_kegiatans_table',8);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table programs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programs`;

CREATE TABLE `programs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;

INSERT INTO `programs` (`id`, `kode`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,'060.01.BQ','Pemeliharaan Keamanan dan Ketertiban Masyarakat','2025-06-27 13:39:21','2025-06-27 13:39:21'),
	(2,'060.01.BP','Modernisasi Almatsus dan Sarana Prasarana POLRI','2025-06-27 16:34:32','2025-06-27 16:34:32');

/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rencana_kegiatans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rencana_kegiatans`;

CREATE TABLE `rencana_kegiatans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `program_id` bigint unsigned NOT NULL,
  `kegiatan_id` bigint unsigned NOT NULL,
  `kro_id` bigint unsigned NOT NULL,
  `ro_id` bigint unsigned NOT NULL,
  `komponen_id` bigint unsigned NOT NULL,
  `subkomponen_id` bigint unsigned NOT NULL,
  `kodeakun_id` bigint unsigned NOT NULL,
  `detailuraian_id` bigint unsigned NOT NULL,
  `pagu` bigint DEFAULT NULL,
  `bulan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bagsubag_id` bigint unsigned NOT NULL,
  `tgl_realisasi` date DEFAULT NULL,
  `biaya` bigint DEFAULT '0',
  `catatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rencana_kegiatans_program_id_foreign` (`program_id`),
  KEY `rencana_kegiatans_kegiatan_id_foreign` (`kegiatan_id`),
  KEY `rencana_kegiatans_kro_id_foreign` (`kro_id`),
  KEY `rencana_kegiatans_ro_id_foreign` (`ro_id`),
  KEY `rencana_kegiatans_komponen_id_foreign` (`komponen_id`),
  KEY `rencana_kegiatans_subkomponen_id_foreign` (`subkomponen_id`),
  KEY `rencana_kegiatans_kodeakun_id_foreign` (`kodeakun_id`),
  KEY `rencana_kegiatans_detailuraian_id_foreign` (`detailuraian_id`),
  KEY `rencana_kegiatans_bagsubag_id_foreign` (`bagsubag_id`),
  CONSTRAINT `rencana_kegiatans_bagsubag_id_foreign` FOREIGN KEY (`bagsubag_id`) REFERENCES `bagsubags` (`id`),
  CONSTRAINT `rencana_kegiatans_detailuraian_id_foreign` FOREIGN KEY (`detailuraian_id`) REFERENCES `detailuraians` (`id`),
  CONSTRAINT `rencana_kegiatans_kegiatan_id_foreign` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatans` (`id`),
  CONSTRAINT `rencana_kegiatans_kodeakun_id_foreign` FOREIGN KEY (`kodeakun_id`) REFERENCES `kodeakuns` (`id`),
  CONSTRAINT `rencana_kegiatans_komponen_id_foreign` FOREIGN KEY (`komponen_id`) REFERENCES `komponens` (`id`),
  CONSTRAINT `rencana_kegiatans_kro_id_foreign` FOREIGN KEY (`kro_id`) REFERENCES `kros` (`id`),
  CONSTRAINT `rencana_kegiatans_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  CONSTRAINT `rencana_kegiatans_ro_id_foreign` FOREIGN KEY (`ro_id`) REFERENCES `ros` (`id`),
  CONSTRAINT `rencana_kegiatans_subkomponen_id_foreign` FOREIGN KEY (`subkomponen_id`) REFERENCES `subkomponens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rencana_kegiatans` WRITE;
/*!40000 ALTER TABLE `rencana_kegiatans` DISABLE KEYS */;

INSERT INTO `rencana_kegiatans` (`id`, `program_id`, `kegiatan_id`, `kro_id`, `ro_id`, `komponen_id`, `subkomponen_id`, `kodeakun_id`, `detailuraian_id`, `pagu`, `bulan`, `bagsubag_id`, `tgl_realisasi`, `biaya`, `catatan`, `keterangan`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,1,1,1,1,1,5400000,'1',1,'2025-02-14',0,'terlambat satu bulan',NULL,'2025-06-29 15:34:51','2025-07-02 22:35:55'),
	(2,1,2,2,2,2,2,2,2,1800000,'1',2,'2025-01-08',1000000,NULL,NULL,'2025-06-29 15:41:27','2025-07-03 19:46:49'),
	(3,1,2,2,2,2,2,2,3,3600000,'1',2,NULL,0,NULL,NULL,'2025-06-29 15:42:57','2025-06-29 15:42:57'),
	(4,1,2,2,2,2,3,3,5,6425200,'1',2,NULL,0,NULL,NULL,'2025-06-29 15:45:14','2025-06-29 15:45:14'),
	(5,1,2,2,2,2,3,3,6,400000,'1',2,NULL,0,NULL,NULL,'2025-06-29 15:49:03','2025-06-29 15:49:03'),
	(6,1,2,2,2,2,3,4,9,3000000,'1',3,NULL,0,NULL,NULL,'2025-06-29 15:50:07','2025-06-29 15:50:07'),
	(7,1,2,2,2,2,3,5,17,62203800,'1',4,NULL,0,NULL,NULL,'2025-06-29 15:51:15','2025-06-29 15:51:15'),
	(8,1,2,2,2,2,4,8,25,127750000,'1',3,NULL,0,NULL,NULL,'2025-06-29 15:53:15','2025-06-29 15:53:15'),
	(9,1,2,2,2,2,4,8,26,229950000,'1',3,NULL,0,NULL,NULL,'2025-06-29 15:54:24','2025-06-29 15:54:24'),
	(10,1,2,2,2,2,4,8,27,153300000,'1',5,NULL,0,NULL,NULL,'2025-06-29 15:55:22','2025-06-29 15:55:22'),
	(11,1,2,2,2,2,5,9,29,3192000,'1',5,NULL,0,NULL,NULL,'2025-06-29 15:56:27','2025-06-29 15:56:27'),
	(12,1,2,2,2,2,6,10,30,7200000,'1',2,NULL,0,NULL,NULL,'2025-06-29 15:57:24','2025-06-29 15:57:24'),
	(13,1,2,2,3,3,7,11,31,9110110000,'1',2,NULL,0,NULL,NULL,'2025-06-29 15:58:37','2025-06-29 15:58:37'),
	(14,1,2,2,3,3,7,11,32,20760000,'1',2,NULL,0,NULL,NULL,'2025-06-29 15:59:31','2025-06-29 15:59:31'),
	(15,1,2,2,3,4,8,12,36,9900000,'1',1,NULL,0,NULL,NULL,'2025-06-29 16:00:33','2025-06-29 16:00:33'),
	(16,1,2,2,3,4,9,13,38,102510000,'1',2,NULL,0,NULL,NULL,'2025-06-29 16:01:56','2025-06-29 16:01:56'),
	(17,1,2,2,3,4,9,13,39,53550000,'1',5,'2025-03-12',1000000,'catatah',NULL,'2025-06-29 16:02:55','2025-07-04 06:05:42'),
	(18,2,5,5,6,7,15,19,52,34980000,'1',2,NULL,0,NULL,NULL,'2025-06-29 16:05:19','2025-06-29 16:05:19'),
	(19,1,2,2,2,2,2,2,2,1800000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:08:21','2025-06-29 16:08:21'),
	(20,1,2,2,2,2,2,2,3,3600000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:09:27','2025-06-29 16:09:27'),
	(21,1,2,2,2,2,3,3,4,22750000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:10:44','2025-06-29 16:10:44'),
	(22,1,2,2,2,2,3,3,5,6425200,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:12:05','2025-06-29 16:12:05'),
	(23,1,2,2,2,2,3,4,7,51378000,'2',3,NULL,0,NULL,NULL,'2025-06-29 16:13:09','2025-06-29 16:13:09'),
	(24,1,2,2,2,2,3,4,9,3000000,'2',3,NULL,0,NULL,NULL,'2025-06-29 16:14:21','2025-06-29 16:14:21'),
	(25,1,2,2,2,2,3,5,11,36357000,'2',4,NULL,0,NULL,NULL,'2025-06-29 16:15:35','2025-06-29 16:15:35'),
	(26,1,2,2,2,2,3,5,15,9597000,'2',4,NULL,0,NULL,NULL,'2025-06-29 16:16:47','2025-06-29 16:16:47'),
	(27,1,2,2,2,2,3,5,17,62203800,'2',4,NULL,0,NULL,NULL,'2025-06-29 16:17:57','2025-06-29 16:17:57'),
	(28,1,2,2,2,2,4,8,25,127750000,'2',3,NULL,0,NULL,NULL,'2025-06-29 16:19:26','2025-06-29 16:19:26'),
	(29,1,2,2,2,2,4,8,26,229950000,'2',3,NULL,0,NULL,NULL,'2025-06-29 16:20:24','2025-06-29 16:20:24'),
	(30,1,2,2,2,2,4,8,27,153300000,'2',5,NULL,0,NULL,NULL,'2025-06-29 16:21:32','2025-06-29 16:21:32'),
	(31,1,2,2,2,2,5,9,28,4788000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:23:00','2025-06-29 16:23:00'),
	(32,1,2,2,2,2,5,9,29,3192000,'2',5,NULL,0,NULL,NULL,'2025-06-29 16:24:11','2025-06-29 16:24:11'),
	(33,1,2,2,2,2,6,10,30,7200000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:25:10','2025-06-29 16:25:10'),
	(34,1,2,2,3,3,7,11,31,9110110000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:26:28','2025-06-29 16:26:28'),
	(35,1,2,2,3,3,7,11,32,20760000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:27:32','2025-06-29 16:27:32'),
	(36,1,2,2,3,4,8,12,33,1800000,'2',1,NULL,0,NULL,NULL,'2025-06-29 16:28:37','2025-06-29 16:28:37'),
	(37,1,2,2,3,4,8,12,36,9900000,'2',1,NULL,0,NULL,NULL,'2025-06-29 16:30:01','2025-06-29 16:30:01'),
	(38,1,2,2,3,4,9,13,38,105510000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:31:25','2025-06-29 16:31:25'),
	(39,1,2,2,3,4,9,13,39,53550000,'2',5,NULL,0,NULL,NULL,'2025-06-29 16:32:29','2025-06-29 16:32:29'),
	(40,1,4,4,5,6,13,17,45,1182146400,'2',4,NULL,0,NULL,NULL,'2025-06-29 16:34:40','2025-06-29 16:34:40'),
	(41,1,4,4,5,6,13,17,46,439444800,'2',4,NULL,0,NULL,NULL,'2025-06-29 16:36:42','2025-06-29 16:36:42'),
	(42,1,4,4,5,6,13,17,47,116570000,'2',4,NULL,0,NULL,NULL,'2025-06-29 16:38:10','2025-06-29 16:38:10'),
	(43,1,4,4,5,6,13,17,48,31396800,'2',4,NULL,0,NULL,NULL,'2025-06-29 16:39:04','2025-06-29 16:39:04'),
	(44,1,4,4,5,6,13,17,49,1294000,'2',4,NULL,0,NULL,NULL,'2025-06-29 16:40:01','2025-06-29 16:40:01'),
	(45,2,5,5,6,7,16,20,54,3800000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:41:43','2025-06-29 16:41:43'),
	(46,2,5,5,6,7,17,21,58,3120000,'2',2,NULL,0,NULL,NULL,'2025-06-29 16:43:02','2025-06-29 16:43:02'),
	(47,1,2,2,2,2,2,2,2,1800000,'3',2,NULL,0,NULL,NULL,'2025-06-29 16:45:08','2025-06-29 16:45:08'),
	(48,1,2,2,2,2,2,2,3,3600000,'3',2,NULL,0,NULL,NULL,'2025-06-29 16:46:35','2025-06-29 16:46:35'),
	(49,1,2,2,2,2,3,3,5,6425200,'3',2,NULL,0,NULL,NULL,'2025-06-29 16:47:39','2025-06-29 16:47:39'),
	(50,1,2,2,2,2,3,4,9,3000000,'3',3,NULL,0,NULL,NULL,'2025-06-29 16:48:39','2025-06-29 16:48:39'),
	(51,1,2,2,2,2,3,5,17,62203800,'3',4,NULL,0,NULL,NULL,'2025-06-29 16:49:57','2025-06-29 16:49:57'),
	(52,1,2,2,2,2,3,7,21,86700000,'3',5,NULL,0,NULL,NULL,'2025-06-29 16:51:11','2025-06-29 16:51:11'),
	(53,1,2,2,2,2,3,7,22,4800000,'3',5,NULL,0,NULL,NULL,'2025-06-29 16:51:56','2025-06-29 16:51:56'),
	(54,1,2,2,2,2,3,7,24,1500000,'3',5,NULL,0,NULL,NULL,'2025-06-29 16:52:51','2025-06-29 16:52:51'),
	(55,1,2,2,2,2,4,8,25,127750000,'3',3,NULL,0,NULL,NULL,'2025-06-29 16:53:53','2025-06-29 16:53:53'),
	(56,1,2,2,2,2,4,8,26,229950000,'3',3,NULL,0,NULL,NULL,'2025-06-29 16:54:58','2025-06-29 16:54:58'),
	(57,1,2,2,2,2,4,8,27,153300000,'3',5,NULL,0,NULL,NULL,'2025-06-29 16:56:02','2025-06-29 16:56:02'),
	(58,1,2,2,2,2,5,9,28,4788000,'3',2,NULL,0,NULL,NULL,'2025-06-29 16:57:15','2025-06-29 16:57:15'),
	(59,1,2,2,2,2,5,9,29,3192000,'3',5,NULL,0,NULL,NULL,'2025-06-29 16:58:05','2025-06-29 16:58:05'),
	(60,1,2,2,2,2,6,10,30,7200000,'3',2,NULL,0,NULL,NULL,'2025-06-29 16:58:56','2025-06-29 16:58:56'),
	(61,1,2,2,3,3,7,11,31,9110110000,'3',2,NULL,0,NULL,NULL,'2025-06-29 17:00:02','2025-06-29 17:00:02'),
	(62,1,2,2,3,3,7,11,32,20760000,'3',2,NULL,0,NULL,NULL,'2025-06-29 17:01:01','2025-06-29 17:01:01'),
	(63,1,2,2,3,4,8,12,36,9900000,'3',1,NULL,0,NULL,NULL,'2025-06-29 17:03:10','2025-06-29 17:03:10'),
	(64,1,2,2,3,4,9,13,38,102510000,'3',2,NULL,0,NULL,NULL,'2025-06-29 17:04:27','2025-06-29 17:04:27'),
	(65,1,2,2,3,4,9,13,39,53550000,'3',5,NULL,0,NULL,NULL,'2025-06-29 17:05:25','2025-06-29 17:05:25'),
	(66,1,3,3,4,5,12,16,44,1219659000,'3',4,NULL,0,NULL,NULL,'2025-06-29 17:07:42','2025-06-29 17:07:42'),
	(67,2,5,5,6,7,15,19,52,34980000,'3',2,NULL,0,NULL,NULL,'2025-06-29 17:08:59','2025-06-29 17:08:59'),
	(68,2,5,5,6,7,17,21,55,21900000,'3',2,NULL,0,NULL,NULL,'2025-06-29 17:09:57','2025-06-29 17:09:57'),
	(69,2,5,5,6,7,17,21,56,8970000,'3',2,NULL,0,NULL,NULL,'2025-06-29 17:10:50','2025-06-29 17:10:50'),
	(70,2,5,5,6,7,17,21,57,6100000,'3',2,NULL,0,NULL,NULL,'2025-06-29 17:11:32','2025-06-29 17:11:32'),
	(73,2,5,5,6,7,17,21,59,5110000,'3',5,NULL,0,NULL,NULL,'2025-06-29 17:17:56','2025-06-29 17:17:56'),
	(74,2,5,5,6,7,17,21,60,3450000,'3',5,NULL,0,NULL,NULL,'2025-06-29 17:19:01','2025-06-29 17:19:01'),
	(75,1,2,2,2,2,2,2,2,1800000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:25:50','2025-06-29 17:25:50'),
	(76,1,2,2,2,2,2,2,3,3600000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:27:08','2025-06-29 17:27:08'),
	(77,1,2,2,2,2,3,3,4,22750000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:28:35','2025-06-29 17:28:35'),
	(78,1,2,2,2,2,3,4,8,200640000,'4',3,NULL,0,NULL,NULL,'2025-06-29 17:29:56','2025-06-29 17:29:56'),
	(79,1,2,2,2,2,3,4,9,3000000,'4',3,NULL,0,NULL,NULL,'2025-06-29 17:30:52','2025-06-29 17:30:52'),
	(80,1,2,2,2,2,3,5,13,74678000,'4',4,NULL,0,NULL,NULL,'2025-06-29 17:32:15','2025-06-29 17:32:15'),
	(81,1,2,2,2,2,3,5,16,4725000,'4',4,NULL,0,NULL,NULL,'2025-06-29 17:33:17','2025-06-29 17:33:17'),
	(82,1,2,2,2,2,3,5,17,62203800,'4',4,NULL,0,NULL,NULL,'2025-06-29 17:34:32','2025-06-29 17:34:32'),
	(83,1,2,2,2,2,4,8,25,127750000,'4',3,NULL,0,NULL,NULL,'2025-06-29 17:35:48','2025-06-29 17:35:48'),
	(84,1,2,2,2,2,4,8,26,229950000,'4',3,NULL,0,NULL,NULL,'2025-06-29 17:36:54','2025-06-29 17:36:54'),
	(85,1,2,2,2,2,4,8,27,153300000,'4',5,NULL,0,NULL,NULL,'2025-06-29 17:37:52','2025-06-29 17:37:52'),
	(86,1,2,2,2,2,5,9,28,4788800,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:39:24','2025-06-29 17:39:24'),
	(87,1,2,2,2,2,5,9,29,3192000,'4',5,NULL,0,NULL,NULL,'2025-06-29 17:40:13','2025-06-29 17:40:13'),
	(88,1,2,2,2,2,6,10,30,7200000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:41:15','2025-06-29 17:41:15'),
	(89,1,2,2,3,3,7,11,31,9110110000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:42:21','2025-06-29 17:42:21'),
	(90,1,2,2,3,3,7,11,32,20760000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:44:21','2025-06-29 17:44:21'),
	(91,1,2,2,3,4,8,12,36,9900000,'4',1,NULL,0,NULL,NULL,'2025-06-29 17:45:46','2025-06-29 17:45:46'),
	(92,1,2,2,3,4,9,13,38,102510000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:47:45','2025-06-29 17:47:45'),
	(93,1,2,2,3,4,9,13,39,53550000,'4',5,NULL,0,NULL,NULL,'2025-06-29 17:48:36','2025-06-29 17:48:36'),
	(94,1,4,4,5,6,13,17,45,1182146400,'4',4,NULL,0,NULL,NULL,'2025-06-29 17:49:56','2025-06-29 17:49:56'),
	(95,1,4,4,5,6,13,17,46,439444800,'4',4,NULL,0,NULL,NULL,'2025-06-29 17:50:44','2025-06-29 17:50:44'),
	(96,1,4,4,5,6,13,17,47,116570000,'4',4,NULL,0,NULL,NULL,'2025-06-29 17:51:47','2025-06-29 17:51:47'),
	(97,1,4,4,5,6,13,17,48,31396800,'4',4,NULL,0,NULL,NULL,'2025-06-29 17:52:43','2025-06-29 17:52:43'),
	(98,1,4,4,5,6,13,17,49,1294000,'4',4,NULL,0,NULL,NULL,'2025-06-29 17:53:34','2025-06-29 17:53:34'),
	(99,2,5,5,6,7,14,18,50,46410000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:55:02','2025-06-29 17:55:02'),
	(100,2,5,5,6,7,14,18,51,10115000,'4',5,NULL,0,NULL,NULL,'2025-06-29 17:56:04','2025-06-29 17:56:04'),
	(101,2,5,5,6,7,15,19,53,48000000,'4',5,NULL,0,NULL,NULL,'2025-06-29 17:57:15','2025-06-29 17:57:15'),
	(102,2,5,5,6,7,16,20,54,3800000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:58:13','2025-06-29 17:58:13'),
	(103,2,5,5,6,7,17,21,58,3120000,'4',2,NULL,0,NULL,NULL,'2025-06-29 17:59:17','2025-06-29 17:59:17'),
	(104,2,5,5,6,7,17,21,59,5110000,'4',5,NULL,0,NULL,NULL,'2025-06-29 18:00:20','2025-06-29 18:00:20'),
	(105,2,5,5,6,7,17,21,60,3450000,'4',5,NULL,0,NULL,NULL,'2025-06-29 18:01:05','2025-06-29 18:01:05'),
	(106,2,5,5,6,7,17,21,61,3050000,'4',5,'2025-07-04',120000,'dccX',NULL,'2025-06-29 18:01:50','2025-07-02 22:30:51'),
	(107,2,5,5,6,7,18,22,62,1300000,'4',2,'2025-04-08',1000000,'anu',NULL,'2025-06-29 18:02:48','2025-07-03 19:38:22'),
	(108,1,2,2,2,2,2,2,2,1800000,'5',2,'2025-07-01',180000,'hemat',NULL,'2025-07-01 11:09:06','2025-07-03 19:32:46'),
	(109,1,2,2,2,2,2,2,3,NULL,'5',2,'2025-05-21',1000000,'anu',NULL,'2025-07-03 16:08:47','2025-07-03 20:01:56'),
	(110,2,5,5,6,7,18,22,63,NULL,'12',2,NULL,0,NULL,NULL,'2025-07-03 19:53:16','2025-07-03 19:53:16'),
	(111,1,2,2,3,4,8,12,35,NULL,'9',1,NULL,0,NULL,NULL,'2025-07-03 19:59:47','2025-07-03 19:59:47'),
	(112,1,3,3,4,5,11,15,43,NULL,'12',4,NULL,0,NULL,NULL,'2025-07-04 06:06:47','2025-07-04 06:06:47'),
	(113,1,2,2,2,2,2,2,2,NULL,'6',2,NULL,0,NULL,NULL,'2025-07-04 06:54:41','2025-07-04 06:54:41');

/*!40000 ALTER TABLE `rencana_kegiatans` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `code`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'SU','SuperUser','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(2,'A','Admin','2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(3,'U','User','2025-04-29 21:44:31','2025-04-29 21:44:31');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ros
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ros`;

CREATE TABLE `ros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kro_id` bigint unsigned NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ros_kro_id_foreign` (`kro_id`),
  CONSTRAINT `ros_kro_id_foreign` FOREIGN KEY (`kro_id`) REFERENCES `kros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `ros` WRITE;
/*!40000 ALTER TABLE `ros` DISABLE KEYS */;

INSERT INTO `ros` (`id`, `kro_id`, `kode`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,1,'3120.AEC.002','Kerja Sama Dalam Negeri','2025-06-27 13:41:18','2025-06-27 13:41:18'),
	(2,2,'3128.EBA.962','Layanan Umum','2025-06-27 13:52:02','2025-06-27 13:53:07'),
	(3,2,'3128.EBA.994','Layanan Perkantoran','2025-06-27 15:22:17','2025-06-27 15:22:17'),
	(4,3,'5079.BHB.001','Layanan Data dan Informasi Situasi Keamanan Ketertiban Masyarakat','2025-06-27 15:57:44','2025-06-27 15:57:44'),
	(5,4,'5080.EBA.003','Rekomendasi Ijin Keramaian','2025-06-27 16:20:16','2025-06-27 16:20:16'),
	(6,5,'5059.EBA.994','Layanan Perkantoran','2025-06-27 16:40:02','2025-06-27 16:40:02');

/*!40000 ALTER TABLE `ros` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`)
VALUES
	('AglYNOCCatpVux718MeZ4yiQjyBNY1x9vIJjEoSb',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Safari/605.1.15','YTo4OntzOjY6Il90b2tlbiI7czo0MDoibTRjU1FuRTFZWG1pYUZ5ZTBpRlRKMEZCVHFtUUZqMXl0MjYyOEFBViI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2RldGFpbC1rZWdpYXRhbiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vdGVzdGluZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJtYWluX21lbnUiO2E6NDp7aTo3O2E6MTU6e3M6MjoiaWQiO2k6MTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjA7czo0OiJuYW1lIjtzOjQ6IkFQUFMiO3M6NDoiaWNvbiI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO3M6NToiaW5kZXgiO2k6MTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMCI7czo0OiJlZGl0IjtzOjE6IjAiO3M6NjoiZGVsZXRlIjtzOjE6IjAiO3M6NjoicmVwb3J0IjtzOjE6IjAiO31pOjEwO2E6MTU6e3M6MjoiaWQiO2k6MjtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjA7czo0OiJuYW1lIjtzOjExOiJEQVRBIE1BU1RFUiI7czo0OiJpY29uIjtzOjA6IiI7czozOiJ1cmwiO3M6MToiIyI7czo1OiJpbmRleCI7aToyO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIwIjtzOjQ6ImVkaXQiO3M6MToiMCI7czo2OiJkZWxldGUiO3M6MToiMCI7czo2OiJyZXBvcnQiO3M6MToiMCI7fWk6MTI7YToxNTp7czoyOiJpZCI7aTozO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MDtzOjQ6Im5hbWUiO3M6NDoiVVNFUiI7czo0OiJpY29uIjtzOjA6IiI7czozOiJ1cmwiO3M6MToiIyI7czo1OiJpbmRleCI7aTozO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIwIjtzOjQ6ImVkaXQiO3M6MToiMCI7czo2OiJkZWxldGUiO3M6MToiMCI7czo2OiJyZXBvcnQiO3M6MToiMCI7fWk6MTM7YToxNTp7czoyOiJpZCI7aTo0O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MDtzOjQ6Im5hbWUiO3M6MTI6IlVTRVIgU0VUVElORyI7czo0OiJpY29uIjtzOjA6IiI7czozOiJ1cmwiO3M6MToiIyI7czo1OiJpbmRleCI7aTo0O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIwIjtzOjQ6ImVkaXQiO3M6MToiMCI7czo2OiJkZWxldGUiO3M6MToiMCI7czo2OiJyZXBvcnQiO3M6MToiMCI7fX1zOjQ6Im1lbnUiO2E6MTY6e2k6MDthOjE1OntzOjI6ImlkIjtpOjE1O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6NDtzOjQ6Im5hbWUiO3M6NDoiUm9sZSI7czo0OiJpY29uIjtzOjEyOiJiaS1nZWFyLXdpZGUiO3M6MzoidXJsIjtzOjU6InJvbGVzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxO2E6MTU6e3M6MjoiaWQiO2k6MTY7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTo0O3M6NDoibmFtZSI7czo0OiJNZW51IjtzOjQ6Imljb24iO3M6MTI6ImJpLWNhcmQtbGlzdCI7czozOiJ1cmwiO3M6NToibWVudXMiO3M6NToiaW5kZXgiO2k6MDtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjI7YToxNTp7czoyOiJpZCI7aToxNztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjQ7czo0OiJuYW1lIjtzOjk6IlVzZXIgTWVudSI7czo0OiJpY29uIjtzOjEyOiJiaS1nZWFyLWZpbGwiO3M6MzoidXJsIjtzOjEwOiJ1c2VyLW1lbnVzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aTozO2E6MTU6e3M6MjoiaWQiO2k6MTg7czo5OiJtYWluX21lbnUiO3M6NjoiTWFzdGVyIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjE5OiJCYWdpYW4gLyBTdWIgQmFnaWFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImJhZ3N1YmFnIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aTo0O2E6MTU6e3M6MjoiaWQiO2k6MTQ7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTozO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjQ6Imljb24iO3M6MTQ6ImJpLXBlb3BsZS1maWxsIjtzOjM6InVybCI7czo1OiJ1c2VycyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6NTthOjE1OntzOjI6ImlkIjtpOjU7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIxIjtzOjY6InBhcmVudCI7aToxO3M6NDoibmFtZSI7czoyMjoiSW5wdXQgUmVuY2FuYSBLZWdpYXRhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxNjoicmVuY2FuYS1rZWdpYXRhbiI7czo1OiJpbmRleCI7aToxO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6NjthOjE1OntzOjI6ImlkIjtpOjY7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo3OiJQcm9ncmFtIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjc6InByb2dyYW0iO3M6NToiaW5kZXgiO2k6MTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjg7YToxNTp7czoyOiJpZCI7aTo3O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6ODoiS2VnaWF0YW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6ODoia2VnaWF0YW4iO3M6NToiaW5kZXgiO2k6MjtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjk7YToxNTp7czoyOiJpZCI7aToyMDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjE7czo0OiJuYW1lIjtzOjIzOiJEZXRhaWwgUmVuY2FuYSBLZWdpYXRhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxNToiZGV0YWlsLWtlZ2lhdGFuIjtzOjU6ImluZGV4IjtpOjI7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxMTthOjE1OntzOjI6ImlkIjtpOjg7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo1OiJLIFIgTyI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czozOiJrcm8iO3M6NToiaW5kZXgiO2k6MztzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjE0O2E6MTU6e3M6MjoiaWQiO2k6OTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjM6IlIgTyI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoyOiJybyI7czo1OiJpbmRleCI7aTo0O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTU7YToxNTp7czoyOiJpZCI7aToxMDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjg6IktvbXBvbmVuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImtvbXBvbmVuIjtzOjU6ImluZGV4IjtpOjU7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxNjthOjE1OntzOjI6ImlkIjtpOjExO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6MTI6IlN1YiBLb21wb25lbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxMjoic3ViLWtvbXBvbmVuIjtzOjU6ImluZGV4IjtpOjY7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxNzthOjE1OntzOjI6ImlkIjtpOjEyO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6OToiS29kZSBBa3VuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjk6ImtvZGUtYWt1biI7czo1OiJpbmRleCI7aTo3O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTg7YToxNTp7czoyOiJpZCI7aToxMztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjEzOiJEZXRhaWwgVXJhaWFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjEzOiJkZXRhaWwtdXJhaWFuIjtzOjU6ImluZGV4IjtpOjg7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxOTthOjE1OntzOjI6ImlkIjtpOjE5O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiVGVzdCBNZW51IjtzOjQ6Imljb24iO3M6MTQ6ImJpLXBlb3BsZS1maWxsIjtzOjM6InVybCI7czo3OiJ0ZXN0aW5nIjtzOjU6ImluZGV4IjtpOjk5O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fX1zOjU6InJvbGVzIjthOjE3OntzOjU6InJvbGVzIjthOjE1OntzOjI6ImlkIjtpOjE1O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6NDtzOjQ6Im5hbWUiO3M6NDoiUm9sZSI7czo0OiJpY29uIjtzOjEyOiJiaS1nZWFyLXdpZGUiO3M6MzoidXJsIjtzOjU6InJvbGVzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo1OiJtZW51cyI7YToxNTp7czoyOiJpZCI7aToxNjtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjQ7czo0OiJuYW1lIjtzOjQ6Ik1lbnUiO3M6NDoiaWNvbiI7czoxMjoiYmktY2FyZC1saXN0IjtzOjM6InVybCI7czo1OiJtZW51cyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6MTA6InVzZXItbWVudXMiO2E6MTU6e3M6MjoiaWQiO2k6MTc7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTo0O3M6NDoibmFtZSI7czo5OiJVc2VyIE1lbnUiO3M6NDoiaWNvbiI7czoxMjoiYmktZ2Vhci1maWxsIjtzOjM6InVybCI7czoxMDoidXNlci1tZW51cyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6ODoiYmFnc3ViYWciO2E6MTU6e3M6MjoiaWQiO2k6MTg7czo5OiJtYWluX21lbnUiO3M6NjoiTWFzdGVyIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjE5OiJCYWdpYW4gLyBTdWIgQmFnaWFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImJhZ3N1YmFnIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo1OiJ1c2VycyI7YToxNTp7czoyOiJpZCI7aToxNDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjM7czo0OiJuYW1lIjtzOjQ6IlVzZXIiO3M6NDoiaWNvbiI7czoxNDoiYmktcGVvcGxlLWZpbGwiO3M6MzoidXJsIjtzOjU6InVzZXJzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoxNjoicmVuY2FuYS1rZWdpYXRhbiI7YToxNTp7czoyOiJpZCI7aTo1O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6MjI6IklucHV0IFJlbmNhbmEgS2VnaWF0YW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6MTY6InJlbmNhbmEta2VnaWF0YW4iO3M6NToiaW5kZXgiO2k6MTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31zOjc6InByb2dyYW0iO2E6MTU6e3M6MjoiaWQiO2k6NjtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjc6IlByb2dyYW0iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6NzoicHJvZ3JhbSI7czo1OiJpbmRleCI7aToxO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6MToiIyI7YToxNTp7czoyOiJpZCI7aTo0O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MDtzOjQ6Im5hbWUiO3M6MTI6IlVTRVIgU0VUVElORyI7czo0OiJpY29uIjtzOjA6IiI7czozOiJ1cmwiO3M6MToiIyI7czo1OiJpbmRleCI7aTo0O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIwIjtzOjQ6ImVkaXQiO3M6MToiMCI7czo2OiJkZWxldGUiO3M6MToiMCI7czo2OiJyZXBvcnQiO3M6MToiMCI7fXM6ODoia2VnaWF0YW4iO2E6MTU6e3M6MjoiaWQiO2k6NztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjg6IktlZ2lhdGFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImtlZ2lhdGFuIjtzOjU6ImluZGV4IjtpOjI7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoxNToiZGV0YWlsLWtlZ2lhdGFuIjthOjE1OntzOjI6ImlkIjtpOjIwO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6MjM6IkRldGFpbCBSZW5jYW5hIEtlZ2lhdGFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjE1OiJkZXRhaWwta2VnaWF0YW4iO3M6NToiaW5kZXgiO2k6MjtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31zOjM6ImtybyI7YToxNTp7czoyOiJpZCI7aTo4O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6NToiSyBSIE8iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6Mzoia3JvIjtzOjU6ImluZGV4IjtpOjM7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoyOiJybyI7YToxNTp7czoyOiJpZCI7aTo5O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6MzoiUiBPIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjI6InJvIjtzOjU6ImluZGV4IjtpOjQ7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo4OiJrb21wb25lbiI7YToxNTp7czoyOiJpZCI7aToxMDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjg6IktvbXBvbmVuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImtvbXBvbmVuIjtzOjU6ImluZGV4IjtpOjU7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoxMjoic3ViLWtvbXBvbmVuIjthOjE1OntzOjI6ImlkIjtpOjExO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6MTI6IlN1YiBLb21wb25lbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxMjoic3ViLWtvbXBvbmVuIjtzOjU6ImluZGV4IjtpOjY7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo5OiJrb2RlLWFrdW4iO2E6MTU6e3M6MjoiaWQiO2k6MTI7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo5OiJLb2RlIEFrdW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6OToia29kZS1ha3VuIjtzOjU6ImluZGV4IjtpOjc7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoxMzoiZGV0YWlsLXVyYWlhbiI7YToxNTp7czoyOiJpZCI7aToxMztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjEzOiJEZXRhaWwgVXJhaWFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjEzOiJkZXRhaWwtdXJhaWFuIjtzOjU6ImluZGV4IjtpOjg7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo3OiJ0ZXN0aW5nIjthOjE1OntzOjI6ImlkIjtpOjE5O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiVGVzdCBNZW51IjtzOjQ6Imljb24iO3M6MTQ6ImJpLXBlb3BsZS1maWxsIjtzOjM6InVybCI7czo3OiJ0ZXN0aW5nIjtzOjU6ImluZGV4IjtpOjk5O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fX19',1751911599),
	('vLJHvNnZpbRvfNixkW9moWkRW2Eqozs0zDTgEQEC',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Safari/605.1.15','YTo4OntzOjY6Il90b2tlbiI7czo0MDoiZWJqQ2JpY1I0NVZLTDVtMG05a2dvQjhjemNoQ2hCNWNoRm1YVDhIdyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2RldGFpbC1rZWdpYXRhbiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6OToibWFpbl9tZW51IjthOjQ6e2k6NzthOjE1OntzOjI6ImlkIjtpOjE7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTowO3M6NDoibmFtZSI7czo0OiJBUFBTIjtzOjQ6Imljb24iO3M6MDoiIjtzOjM6InVybCI7czoxOiIjIjtzOjU6ImluZGV4IjtpOjE7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjAiO3M6NDoiZWRpdCI7czoxOiIwIjtzOjY6ImRlbGV0ZSI7czoxOiIwIjtzOjY6InJlcG9ydCI7czoxOiIwIjt9aToxMDthOjE1OntzOjI6ImlkIjtpOjI7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTowO3M6NDoibmFtZSI7czoxMToiREFUQSBNQVNURVIiO3M6NDoiaWNvbiI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO3M6NToiaW5kZXgiO2k6MjtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMCI7czo0OiJlZGl0IjtzOjE6IjAiO3M6NjoiZGVsZXRlIjtzOjE6IjAiO3M6NjoicmVwb3J0IjtzOjE6IjAiO31pOjEyO2E6MTU6e3M6MjoiaWQiO2k6MztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjA7czo0OiJuYW1lIjtzOjQ6IlVTRVIiO3M6NDoiaWNvbiI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO3M6NToiaW5kZXgiO2k6MztzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMCI7czo0OiJlZGl0IjtzOjE6IjAiO3M6NjoiZGVsZXRlIjtzOjE6IjAiO3M6NjoicmVwb3J0IjtzOjE6IjAiO31pOjEzO2E6MTU6e3M6MjoiaWQiO2k6NDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjA7czo0OiJuYW1lIjtzOjEyOiJVU0VSIFNFVFRJTkciO3M6NDoiaWNvbiI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO3M6NToiaW5kZXgiO2k6NDtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMCI7czo0OiJlZGl0IjtzOjE6IjAiO3M6NjoiZGVsZXRlIjtzOjE6IjAiO3M6NjoicmVwb3J0IjtzOjE6IjAiO319czo0OiJtZW51IjthOjE2OntpOjA7YToxNTp7czoyOiJpZCI7aToxNTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjQ7czo0OiJuYW1lIjtzOjQ6IlJvbGUiO3M6NDoiaWNvbiI7czoxMjoiYmktZ2Vhci13aWRlIjtzOjM6InVybCI7czo1OiJyb2xlcyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTthOjE1OntzOjI6ImlkIjtpOjE2O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6NDtzOjQ6Im5hbWUiO3M6NDoiTWVudSI7czo0OiJpY29uIjtzOjEyOiJiaS1jYXJkLWxpc3QiO3M6MzoidXJsIjtzOjU6Im1lbnVzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToyO2E6MTU6e3M6MjoiaWQiO2k6MTc7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTo0O3M6NDoibmFtZSI7czo5OiJVc2VyIE1lbnUiO3M6NDoiaWNvbiI7czoxMjoiYmktZ2Vhci1maWxsIjtzOjM6InVybCI7czoxMDoidXNlci1tZW51cyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MzthOjE1OntzOjI6ImlkIjtpOjE4O3M6OToibWFpbl9tZW51IjtzOjY6Ik1hc3RlciI7czoxMDoic3ViX3BhcmVudCI7czoxOiIxIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czoxOToiQmFnaWFuIC8gU3ViIEJhZ2lhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czo4OiJiYWdzdWJhZyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6NDthOjE1OntzOjI6ImlkIjtpOjE0O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MztzOjQ6Im5hbWUiO3M6NDoiVXNlciI7czo0OiJpY29uIjtzOjE0OiJiaS1wZW9wbGUtZmlsbCI7czozOiJ1cmwiO3M6NToidXNlcnMiO3M6NToiaW5kZXgiO2k6MDtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjU7YToxNTp7czoyOiJpZCI7aTo1O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6MjI6IklucHV0IFJlbmNhbmEgS2VnaWF0YW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6MTY6InJlbmNhbmEta2VnaWF0YW4iO3M6NToiaW5kZXgiO2k6MTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjY7YToxNTp7czoyOiJpZCI7aTo2O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6NzoiUHJvZ3JhbSI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czo3OiJwcm9ncmFtIjtzOjU6ImluZGV4IjtpOjE7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aTo4O2E6MTU6e3M6MjoiaWQiO2k6NztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjg6IktlZ2lhdGFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImtlZ2lhdGFuIjtzOjU6ImluZGV4IjtpOjI7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aTo5O2E6MTU6e3M6MjoiaWQiO2k6MjA7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIxIjtzOjY6InBhcmVudCI7aToxO3M6NDoibmFtZSI7czoyMzoiRGV0YWlsIFJlbmNhbmEgS2VnaWF0YW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6MTU6ImRldGFpbC1rZWdpYXRhbiI7czo1OiJpbmRleCI7aToyO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTE7YToxNTp7czoyOiJpZCI7aTo4O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6NToiSyBSIE8iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6Mzoia3JvIjtzOjU6ImluZGV4IjtpOjM7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxNDthOjE1OntzOjI6ImlkIjtpOjk7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czozOiJSIE8iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6Mjoicm8iO3M6NToiaW5kZXgiO2k6NDtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjE1O2E6MTU6e3M6MjoiaWQiO2k6MTA7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo4OiJLb21wb25lbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czo4OiJrb21wb25lbiI7czo1OiJpbmRleCI7aTo1O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTY7YToxNTp7czoyOiJpZCI7aToxMTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjEyOiJTdWIgS29tcG9uZW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6MTI6InN1Yi1rb21wb25lbiI7czo1OiJpbmRleCI7aTo2O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTc7YToxNTp7czoyOiJpZCI7aToxMjtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjk6IktvZGUgQWt1biI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czo5OiJrb2RlLWFrdW4iO3M6NToiaW5kZXgiO2k6NztzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjE4O2E6MTU6e3M6MjoiaWQiO2k6MTM7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIxIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czoxMzoiRGV0YWlsIFVyYWlhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxMzoiZGV0YWlsLXVyYWlhbiI7czo1OiJpbmRleCI7aTo4O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTk7YToxNTp7czoyOiJpZCI7aToxOTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjE7czo0OiJuYW1lIjtzOjk6IlRlc3QgTWVudSI7czo0OiJpY29uIjtzOjE0OiJiaS1wZW9wbGUtZmlsbCI7czozOiJ1cmwiO3M6NzoidGVzdGluZyI7czo1OiJpbmRleCI7aTo5OTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO319czo1OiJyb2xlcyI7YToxNzp7czo1OiJyb2xlcyI7YToxNTp7czoyOiJpZCI7aToxNTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjQ7czo0OiJuYW1lIjtzOjQ6IlJvbGUiO3M6NDoiaWNvbiI7czoxMjoiYmktZ2Vhci13aWRlIjtzOjM6InVybCI7czo1OiJyb2xlcyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6NToibWVudXMiO2E6MTU6e3M6MjoiaWQiO2k6MTY7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTo0O3M6NDoibmFtZSI7czo0OiJNZW51IjtzOjQ6Imljb24iO3M6MTI6ImJpLWNhcmQtbGlzdCI7czozOiJ1cmwiO3M6NToibWVudXMiO3M6NToiaW5kZXgiO2k6MDtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31zOjEwOiJ1c2VyLW1lbnVzIjthOjE1OntzOjI6ImlkIjtpOjE3O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6NDtzOjQ6Im5hbWUiO3M6OToiVXNlciBNZW51IjtzOjQ6Imljb24iO3M6MTI6ImJpLWdlYXItZmlsbCI7czozOiJ1cmwiO3M6MTA6InVzZXItbWVudXMiO3M6NToiaW5kZXgiO2k6MDtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31zOjg6ImJhZ3N1YmFnIjthOjE1OntzOjI6ImlkIjtpOjE4O3M6OToibWFpbl9tZW51IjtzOjY6Ik1hc3RlciI7czoxMDoic3ViX3BhcmVudCI7czoxOiIxIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czoxOToiQmFnaWFuIC8gU3ViIEJhZ2lhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czo4OiJiYWdzdWJhZyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6NToidXNlcnMiO2E6MTU6e3M6MjoiaWQiO2k6MTQ7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTozO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjQ6Imljb24iO3M6MTQ6ImJpLXBlb3BsZS1maWxsIjtzOjM6InVybCI7czo1OiJ1c2VycyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6MTY6InJlbmNhbmEta2VnaWF0YW4iO2E6MTU6e3M6MjoiaWQiO2k6NTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjE7czo0OiJuYW1lIjtzOjIyOiJJbnB1dCBSZW5jYW5hIEtlZ2lhdGFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjE2OiJyZW5jYW5hLWtlZ2lhdGFuIjtzOjU6ImluZGV4IjtpOjE7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo3OiJwcm9ncmFtIjthOjE1OntzOjI6ImlkIjtpOjY7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo3OiJQcm9ncmFtIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjc6InByb2dyYW0iO3M6NToiaW5kZXgiO2k6MTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31zOjE6IiMiO2E6MTU6e3M6MjoiaWQiO2k6NDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjA7czo0OiJuYW1lIjtzOjEyOiJVU0VSIFNFVFRJTkciO3M6NDoiaWNvbiI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO3M6NToiaW5kZXgiO2k6NDtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMCI7czo0OiJlZGl0IjtzOjE6IjAiO3M6NjoiZGVsZXRlIjtzOjE6IjAiO3M6NjoicmVwb3J0IjtzOjE6IjAiO31zOjg6ImtlZ2lhdGFuIjthOjE1OntzOjI6ImlkIjtpOjc7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo4OiJLZWdpYXRhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czo4OiJrZWdpYXRhbiI7czo1OiJpbmRleCI7aToyO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6MTU6ImRldGFpbC1rZWdpYXRhbiI7YToxNTp7czoyOiJpZCI7aToyMDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjE7czo0OiJuYW1lIjtzOjIzOiJEZXRhaWwgUmVuY2FuYSBLZWdpYXRhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxNToiZGV0YWlsLWtlZ2lhdGFuIjtzOjU6ImluZGV4IjtpOjI7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czozOiJrcm8iO2E6MTU6e3M6MjoiaWQiO2k6ODtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjU6IksgUiBPIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjM6ImtybyI7czo1OiJpbmRleCI7aTozO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6Mjoicm8iO2E6MTU6e3M6MjoiaWQiO2k6OTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjM6IlIgTyI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoyOiJybyI7czo1OiJpbmRleCI7aTo0O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6ODoia29tcG9uZW4iO2E6MTU6e3M6MjoiaWQiO2k6MTA7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo4OiJLb21wb25lbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czo4OiJrb21wb25lbiI7czo1OiJpbmRleCI7aTo1O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6MTI6InN1Yi1rb21wb25lbiI7YToxNTp7czoyOiJpZCI7aToxMTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjEyOiJTdWIgS29tcG9uZW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6MTI6InN1Yi1rb21wb25lbiI7czo1OiJpbmRleCI7aTo2O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6OToia29kZS1ha3VuIjthOjE1OntzOjI6ImlkIjtpOjEyO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6OToiS29kZSBBa3VuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjk6ImtvZGUtYWt1biI7czo1OiJpbmRleCI7aTo3O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6MTM6ImRldGFpbC11cmFpYW4iO2E6MTU6e3M6MjoiaWQiO2k6MTM7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIxIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czoxMzoiRGV0YWlsIFVyYWlhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxMzoiZGV0YWlsLXVyYWlhbiI7czo1OiJpbmRleCI7aTo4O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6NzoidGVzdGluZyI7YToxNTp7czoyOiJpZCI7aToxOTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjE7czo0OiJuYW1lIjtzOjk6IlRlc3QgTWVudSI7czo0OiJpY29uIjtzOjE0OiJiaS1wZW9wbGUtZmlsbCI7czozOiJ1cmwiO3M6NzoidGVzdGluZyI7czo1OiJpbmRleCI7aTo5OTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO319fQ==',1751657020),
	('vywJSo9fM3y9q7sL8uNghDVsl1GMiFFIXs07ae8Z',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Safari/605.1.15','YTo4OntzOjY6Il90b2tlbiI7czo0MDoiSU1HNlRGYUEzaDMyOEVXQmd6WEd6UWdtd0pGMktWRzZSeGVueWQ5UCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJtYWluX21lbnUiO2E6NDp7aTo3O2E6MTU6e3M6MjoiaWQiO2k6MTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjA7czo0OiJuYW1lIjtzOjQ6IkFQUFMiO3M6NDoiaWNvbiI7czowOiIiO3M6MzoidXJsIjtzOjE6IiMiO3M6NToiaW5kZXgiO2k6MTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMCI7czo0OiJlZGl0IjtzOjE6IjAiO3M6NjoiZGVsZXRlIjtzOjE6IjAiO3M6NjoicmVwb3J0IjtzOjE6IjAiO31pOjEwO2E6MTU6e3M6MjoiaWQiO2k6MjtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjA7czo0OiJuYW1lIjtzOjExOiJEQVRBIE1BU1RFUiI7czo0OiJpY29uIjtzOjA6IiI7czozOiJ1cmwiO3M6MToiIyI7czo1OiJpbmRleCI7aToyO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIwIjtzOjQ6ImVkaXQiO3M6MToiMCI7czo2OiJkZWxldGUiO3M6MToiMCI7czo2OiJyZXBvcnQiO3M6MToiMCI7fWk6MTI7YToxNTp7czoyOiJpZCI7aTozO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MDtzOjQ6Im5hbWUiO3M6NDoiVVNFUiI7czo0OiJpY29uIjtzOjA6IiI7czozOiJ1cmwiO3M6MToiIyI7czo1OiJpbmRleCI7aTozO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIwIjtzOjQ6ImVkaXQiO3M6MToiMCI7czo2OiJkZWxldGUiO3M6MToiMCI7czo2OiJyZXBvcnQiO3M6MToiMCI7fWk6MTM7YToxNTp7czoyOiJpZCI7aTo0O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MDtzOjQ6Im5hbWUiO3M6MTI6IlVTRVIgU0VUVElORyI7czo0OiJpY29uIjtzOjA6IiI7czozOiJ1cmwiO3M6MToiIyI7czo1OiJpbmRleCI7aTo0O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIwIjtzOjQ6ImVkaXQiO3M6MToiMCI7czo2OiJkZWxldGUiO3M6MToiMCI7czo2OiJyZXBvcnQiO3M6MToiMCI7fX1zOjQ6Im1lbnUiO2E6MTY6e2k6MDthOjE1OntzOjI6ImlkIjtpOjE1O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6NDtzOjQ6Im5hbWUiO3M6NDoiUm9sZSI7czo0OiJpY29uIjtzOjEyOiJiaS1nZWFyLXdpZGUiO3M6MzoidXJsIjtzOjU6InJvbGVzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxO2E6MTU6e3M6MjoiaWQiO2k6MTY7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTo0O3M6NDoibmFtZSI7czo0OiJNZW51IjtzOjQ6Imljb24iO3M6MTI6ImJpLWNhcmQtbGlzdCI7czozOiJ1cmwiO3M6NToibWVudXMiO3M6NToiaW5kZXgiO2k6MDtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjI7YToxNTp7czoyOiJpZCI7aToxNztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjQ7czo0OiJuYW1lIjtzOjk6IlVzZXIgTWVudSI7czo0OiJpY29uIjtzOjEyOiJiaS1nZWFyLWZpbGwiO3M6MzoidXJsIjtzOjEwOiJ1c2VyLW1lbnVzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aTozO2E6MTU6e3M6MjoiaWQiO2k6MTg7czo5OiJtYWluX21lbnUiO3M6NjoiTWFzdGVyIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjE5OiJCYWdpYW4gLyBTdWIgQmFnaWFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImJhZ3N1YmFnIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aTo0O2E6MTU6e3M6MjoiaWQiO2k6MTQ7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTozO3M6NDoibmFtZSI7czo0OiJVc2VyIjtzOjQ6Imljb24iO3M6MTQ6ImJpLXBlb3BsZS1maWxsIjtzOjM6InVybCI7czo1OiJ1c2VycyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6NTthOjE1OntzOjI6ImlkIjtpOjU7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIxIjtzOjY6InBhcmVudCI7aToxO3M6NDoibmFtZSI7czoyMjoiSW5wdXQgUmVuY2FuYSBLZWdpYXRhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxNjoicmVuY2FuYS1rZWdpYXRhbiI7czo1OiJpbmRleCI7aToxO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6NjthOjE1OntzOjI6ImlkIjtpOjY7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo3OiJQcm9ncmFtIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjc6InByb2dyYW0iO3M6NToiaW5kZXgiO2k6MTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjg7YToxNTp7czoyOiJpZCI7aTo3O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6ODoiS2VnaWF0YW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6ODoia2VnaWF0YW4iO3M6NToiaW5kZXgiO2k6MjtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjk7YToxNTp7czoyOiJpZCI7aToyMDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjE7czo0OiJuYW1lIjtzOjIzOiJEZXRhaWwgUmVuY2FuYSBLZWdpYXRhbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxNToiZGV0YWlsLWtlZ2lhdGFuIjtzOjU6ImluZGV4IjtpOjI7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxMTthOjE1OntzOjI6ImlkIjtpOjg7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo1OiJLIFIgTyI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czozOiJrcm8iO3M6NToiaW5kZXgiO2k6MztzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31pOjE0O2E6MTU6e3M6MjoiaWQiO2k6OTtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjM6IlIgTyI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoyOiJybyI7czo1OiJpbmRleCI7aTo0O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTU7YToxNTp7czoyOiJpZCI7aToxMDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjg6IktvbXBvbmVuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImtvbXBvbmVuIjtzOjU6ImluZGV4IjtpOjU7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxNjthOjE1OntzOjI6ImlkIjtpOjExO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6MTI6IlN1YiBLb21wb25lbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxMjoic3ViLWtvbXBvbmVuIjtzOjU6ImluZGV4IjtpOjY7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxNzthOjE1OntzOjI6ImlkIjtpOjEyO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6OToiS29kZSBBa3VuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjk6ImtvZGUtYWt1biI7czo1OiJpbmRleCI7aTo3O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fWk6MTg7YToxNTp7czoyOiJpZCI7aToxMztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjEzOiJEZXRhaWwgVXJhaWFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjEzOiJkZXRhaWwtdXJhaWFuIjtzOjU6ImluZGV4IjtpOjg7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9aToxOTthOjE1OntzOjI6ImlkIjtpOjE5O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiVGVzdCBNZW51IjtzOjQ6Imljb24iO3M6MTQ6ImJpLXBlb3BsZS1maWxsIjtzOjM6InVybCI7czo3OiJ0ZXN0aW5nIjtzOjU6ImluZGV4IjtpOjk5O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fX1zOjU6InJvbGVzIjthOjE3OntzOjU6InJvbGVzIjthOjE1OntzOjI6ImlkIjtpOjE1O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6NDtzOjQ6Im5hbWUiO3M6NDoiUm9sZSI7czo0OiJpY29uIjtzOjEyOiJiaS1nZWFyLXdpZGUiO3M6MzoidXJsIjtzOjU6InJvbGVzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo1OiJtZW51cyI7YToxNTp7czoyOiJpZCI7aToxNjtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjQ7czo0OiJuYW1lIjtzOjQ6Ik1lbnUiO3M6NDoiaWNvbiI7czoxMjoiYmktY2FyZC1saXN0IjtzOjM6InVybCI7czo1OiJtZW51cyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6MTA6InVzZXItbWVudXMiO2E6MTU6e3M6MjoiaWQiO2k6MTc7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aTo0O3M6NDoibmFtZSI7czo5OiJVc2VyIE1lbnUiO3M6NDoiaWNvbiI7czoxMjoiYmktZ2Vhci1maWxsIjtzOjM6InVybCI7czoxMDoidXNlci1tZW51cyI7czo1OiJpbmRleCI7aTowO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6ODoiYmFnc3ViYWciO2E6MTU6e3M6MjoiaWQiO2k6MTg7czo5OiJtYWluX21lbnUiO3M6NjoiTWFzdGVyIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjE5OiJCYWdpYW4gLyBTdWIgQmFnaWFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImJhZ3N1YmFnIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo1OiJ1c2VycyI7YToxNTp7czoyOiJpZCI7aToxNDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjM7czo0OiJuYW1lIjtzOjQ6IlVzZXIiO3M6NDoiaWNvbiI7czoxNDoiYmktcGVvcGxlLWZpbGwiO3M6MzoidXJsIjtzOjU6InVzZXJzIjtzOjU6ImluZGV4IjtpOjA7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoxNjoicmVuY2FuYS1rZWdpYXRhbiI7YToxNTp7czoyOiJpZCI7aTo1O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6MjI6IklucHV0IFJlbmNhbmEgS2VnaWF0YW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6MTY6InJlbmNhbmEta2VnaWF0YW4iO3M6NToiaW5kZXgiO2k6MTtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31zOjc6InByb2dyYW0iO2E6MTU6e3M6MjoiaWQiO2k6NjtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjc6IlByb2dyYW0iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6NzoicHJvZ3JhbSI7czo1OiJpbmRleCI7aToxO3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fXM6MToiIyI7YToxNTp7czoyOiJpZCI7aTo0O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MDtzOjQ6Im5hbWUiO3M6MTI6IlVTRVIgU0VUVElORyI7czo0OiJpY29uIjtzOjA6IiI7czozOiJ1cmwiO3M6MToiIyI7czo1OiJpbmRleCI7aTo0O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIwIjtzOjQ6ImVkaXQiO3M6MToiMCI7czo2OiJkZWxldGUiO3M6MToiMCI7czo2OiJyZXBvcnQiO3M6MToiMCI7fXM6ODoia2VnaWF0YW4iO2E6MTU6e3M6MjoiaWQiO2k6NztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjg6IktlZ2lhdGFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImtlZ2lhdGFuIjtzOjU6ImluZGV4IjtpOjI7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoxNToiZGV0YWlsLWtlZ2lhdGFuIjthOjE1OntzOjI6ImlkIjtpOjIwO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6MjM6IkRldGFpbCBSZW5jYW5hIEtlZ2lhdGFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjE1OiJkZXRhaWwta2VnaWF0YW4iO3M6NToiaW5kZXgiO2k6MjtzOjQ6InNvcnQiO2k6MTtzOjY6ImFjdGl2ZSI7czoxOiIxIjtzOjQ6InJlYWQiO3M6MToiMSI7czo2OiJjcmVhdGUiO3M6MToiMSI7czo0OiJlZGl0IjtzOjE6IjEiO3M6NjoiZGVsZXRlIjtzOjE6IjEiO3M6NjoicmVwb3J0IjtzOjE6IjEiO31zOjM6ImtybyI7YToxNTp7czoyOiJpZCI7aTo4O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6NToiSyBSIE8iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6Mzoia3JvIjtzOjU6ImluZGV4IjtpOjM7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoyOiJybyI7YToxNTp7czoyOiJpZCI7aTo5O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6MzoiUiBPIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjI6InJvIjtzOjU6ImluZGV4IjtpOjQ7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo4OiJrb21wb25lbiI7YToxNTp7czoyOiJpZCI7aToxMDtzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjAiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjg6IktvbXBvbmVuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjg6ImtvbXBvbmVuIjtzOjU6ImluZGV4IjtpOjU7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoxMjoic3ViLWtvbXBvbmVuIjthOjE1OntzOjI6ImlkIjtpOjExO3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMCI7czo2OiJwYXJlbnQiO2k6MjtzOjQ6Im5hbWUiO3M6MTI6IlN1YiBLb21wb25lbiI7czo0OiJpY29uIjtzOjg6ImJpLXN0YWNrIjtzOjM6InVybCI7czoxMjoic3ViLWtvbXBvbmVuIjtzOjU6ImluZGV4IjtpOjY7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo5OiJrb2RlLWFrdW4iO2E6MTU6e3M6MjoiaWQiO2k6MTI7czo5OiJtYWluX21lbnUiO3M6NDoiQVBQUyI7czoxMDoic3ViX3BhcmVudCI7czoxOiIwIjtzOjY6InBhcmVudCI7aToyO3M6NDoibmFtZSI7czo5OiJLb2RlIEFrdW4iO3M6NDoiaWNvbiI7czo4OiJiaS1zdGFjayI7czozOiJ1cmwiO3M6OToia29kZS1ha3VuIjtzOjU6ImluZGV4IjtpOjc7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czoxMzoiZGV0YWlsLXVyYWlhbiI7YToxNTp7czoyOiJpZCI7aToxMztzOjk6Im1haW5fbWVudSI7czo0OiJBUFBTIjtzOjEwOiJzdWJfcGFyZW50IjtzOjE6IjEiO3M6NjoicGFyZW50IjtpOjI7czo0OiJuYW1lIjtzOjEzOiJEZXRhaWwgVXJhaWFuIjtzOjQ6Imljb24iO3M6ODoiYmktc3RhY2siO3M6MzoidXJsIjtzOjEzOiJkZXRhaWwtdXJhaWFuIjtzOjU6ImluZGV4IjtpOjg7czo0OiJzb3J0IjtpOjE7czo2OiJhY3RpdmUiO3M6MToiMSI7czo0OiJyZWFkIjtzOjE6IjEiO3M6NjoiY3JlYXRlIjtzOjE6IjEiO3M6NDoiZWRpdCI7czoxOiIxIjtzOjY6ImRlbGV0ZSI7czoxOiIxIjtzOjY6InJlcG9ydCI7czoxOiIxIjt9czo3OiJ0ZXN0aW5nIjthOjE1OntzOjI6ImlkIjtpOjE5O3M6OToibWFpbl9tZW51IjtzOjQ6IkFQUFMiO3M6MTA6InN1Yl9wYXJlbnQiO3M6MToiMSI7czo2OiJwYXJlbnQiO2k6MTtzOjQ6Im5hbWUiO3M6OToiVGVzdCBNZW51IjtzOjQ6Imljb24iO3M6MTQ6ImJpLXBlb3BsZS1maWxsIjtzOjM6InVybCI7czo3OiJ0ZXN0aW5nIjtzOjU6ImluZGV4IjtpOjk5O3M6NDoic29ydCI7aToxO3M6NjoiYWN0aXZlIjtzOjE6IjEiO3M6NDoicmVhZCI7czoxOiIxIjtzOjY6ImNyZWF0ZSI7czoxOiIxIjtzOjQ6ImVkaXQiO3M6MToiMSI7czo2OiJkZWxldGUiO3M6MToiMSI7czo2OiJyZXBvcnQiO3M6MToiMSI7fX19',1751744299);

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subkomponens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subkomponens`;

CREATE TABLE `subkomponens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `komponen_id` bigint unsigned NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subkomponens_komponen_id_foreign` (`komponen_id`),
  CONSTRAINT `subkomponens_komponen_id_foreign` FOREIGN KEY (`komponen_id`) REFERENCES `komponens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `subkomponens` WRITE;
/*!40000 ALTER TABLE `subkomponens` DISABLE KEYS */;

INSERT INTO `subkomponens` (`id`, `komponen_id`, `kode`, `nama`, `created_at`, `updated_at`)
VALUES
	(1,1,'IT','Kerja Sama ANtar INstansi Pemerintah/Swasta/Lembaga Terkait','2025-06-27 13:44:20','2025-06-27 13:44:20'),
	(2,2,'D','Honorarium Sai/Sakpa/Simak/Smap/Pengelola Keuangan','2025-06-27 13:59:06','2025-06-27 13:59:06'),
	(3,2,'JF','Dukungan Operasional Satker','2025-06-27 14:05:13','2025-06-27 14:05:13'),
	(4,2,'JW','ULP Non Organik/Jaga Fungsi','2025-06-27 14:55:16','2025-06-27 14:55:16'),
	(5,2,'JZ','Pengadaan Makanan/Minuman Penambah Daya Tahan Tubuh/Uang Makan PNS','2025-06-27 15:03:32','2025-06-27 15:03:32'),
	(6,2,'KG','Rapat-Rapat Koordinasi/Kerja/Dinas/Pimpinan Kelompok Kerja/Konsultasi','2025-06-27 15:12:41','2025-06-27 15:12:41'),
	(7,3,'A','Pembayaran Gaji dan Tunjangan','2025-06-27 15:25:21','2025-06-27 15:25:21'),
	(8,4,'EV','Pembinaan Keamanan','2025-06-27 15:30:04','2025-06-27 15:30:04'),
	(9,4,'OC','Pengadaan Peralatan/Perlengkapan Kantor','2025-06-27 15:44:26','2025-06-27 15:44:26'),
	(10,5,'JK','Menyelenggarakan Operasi Kepolisian','2025-06-27 16:00:40','2025-06-27 16:00:40'),
	(11,5,'JO','Operasi Terpusat Lilin','2025-06-27 16:07:47','2025-06-27 16:07:47'),
	(12,5,'JP','Operasi Terpusat Ketupat','2025-06-27 16:11:49','2025-06-27 16:11:49'),
	(13,6,'FJ','Penyelenggaraan Keamanan Kepolisian','2025-06-27 16:23:38','2025-06-27 16:23:38'),
	(14,7,'AO','Pemeliharaan Gedung Negara','2025-06-27 16:43:21','2025-06-27 16:43:21'),
	(15,7,'AY','Pemeliharaan Kendaraan Bermotor Roda 4/6/10','2025-06-27 16:47:45','2025-06-27 16:47:45'),
	(16,7,'BB','Pemeliharaan Kendaraan Bermotor Roda 2','2025-06-27 16:53:11','2025-06-27 16:53:11'),
	(17,7,'BH','Pemeliharaan Peralatan Kantor','2025-06-27 16:57:04','2025-06-27 16:57:04'),
	(18,7,'BI','Pemeliharaan Peralatan Fungsional','2025-06-27 17:16:51','2025-06-27 17:16:51');

/*!40000 ALTER TABLE `subkomponens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_menus`;

CREATE TABLE `user_menus` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_role` bigint unsigned NOT NULL,
  `id_menu` bigint unsigned NOT NULL,
  `read` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edit` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_menus_id_role_foreign` (`id_role`),
  KEY `user_menus_id_menu_foreign` (`id_menu`),
  CONSTRAINT `user_menus_id_menu_foreign` FOREIGN KEY (`id_menu`) REFERENCES `menus` (`id`),
  CONSTRAINT `user_menus_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user_menus` WRITE;
/*!40000 ALTER TABLE `user_menus` DISABLE KEYS */;

INSERT INTO `user_menus` (`id`, `id_role`, `id_menu`, `read`, `create`, `edit`, `delete`, `report`, `created_at`, `updated_at`)
VALUES
	('07568452-e3e7-4e4f-b933-a34be5c37856',1,7,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('090e565b-2385-4802-90d0-de177ed2a61b',2,10,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('0bab2bec-a2c6-4569-85c1-bf96b2ab1b1d',1,4,'1','0','0','0','0','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('17addbe2-1384-4e3a-a03f-1921e80faaea',2,7,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('207a26b5-b92f-4af0-8ce3-50348ee1acfe',2,3,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('20ba4b8e-e200-463f-8ce2-ad7c01e22bd2',1,19,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('23003f1c-5d90-48e2-9677-e7a2d095ea50',1,9,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('26dce350-af1e-44ff-8f5e-fd2471e35f64',1,10,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('270039e5-ac8a-46f9-93bb-19da2fc40897',1,20,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('28221d0b-3353-4eb4-a09d-0a220035b189',2,11,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('33d740f5-a840-4c56-9aa9-d0255449ca33',1,12,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('382dc723-075a-4f33-adf4-ff28f3d980c1',2,13,'1','1','1','1','1','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('460f3406-f6d2-4663-bb35-1bbf2ba98870',2,8,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('4e41e53a-8440-4433-8f9e-cdf5ba001918',2,1,'1','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('4f0c9b18-75f8-4cdb-8a0c-7901b79e35f5',2,4,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('734048b2-091a-4368-85e7-fddd4685543e',1,15,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('75ee10b5-db33-4242-8a3f-42926c08dbae',1,16,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('7b4b6256-6d1a-48fe-aaee-583af56b8d2e',1,13,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('7badeb8f-1c8b-4225-beaf-c16d8819a41b',2,6,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('7fa70f55-89de-4479-8c75-2fa3ff623213',2,9,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('9b355f44-a693-429d-b338-933f83e0a851',2,12,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('9f29d254-4b8b-4da7-8a04-dc7a655eb897',2,5,'1','1','1','1','1','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('a3d5669f-a6ab-4fc5-9778-526ed8f4d796',2,14,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('b32a70f3-a8ec-4ac5-8887-9b5398e464e3',1,8,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('b3fbaa8b-7736-4764-88b1-93ea30eda0ea',2,2,'1','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('b6cbf65c-9938-4436-abf5-e184ea435b6a',1,17,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('bb37cae5-747b-4582-bc73-71c8aa98a5e5',1,5,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('c45dc5c2-8a92-4646-99a3-7981ac125b36',1,18,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('d06e9ef1-2df0-4968-86c6-0322989b4663',1,14,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('d125d96f-7e34-4caf-ada9-8c173ad25034',2,17,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('d506e6dd-d115-465a-9fc3-d46af592fc65',1,2,'1','0','0','0','0','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('d66d7e13-5bdf-4838-802b-464fe7578db4',2,15,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('d6e62670-488d-4034-b2cb-7b34a79bad75',1,6,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('d9bc10ca-5982-4e77-9c26-1b91ef4c637d',2,16,'0','0','0','0','0','2025-06-19 13:21:47','2025-06-19 13:21:47'),
	('dc7c77fc-165e-476f-8578-5ae5582e0b55',1,3,'1','0','0','0','0','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('df42d644-c1b6-419a-ae09-0221edd6a6d0',1,11,'1','1','1','1','1','2025-07-01 16:42:15','2025-07-01 16:42:15'),
	('f59842c9-ce2c-401a-be12-3c4647e19278',1,1,'1','0','0','0','0','2025-07-01 16:42:15','2025-07-01 16:42:15');

/*!40000 ALTER TABLE `user_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_role` bigint unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_role_foreign` (`id_role`),
  CONSTRAINT `users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `id_role`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin','admin@gmail.com',NULL,'$2y$12$OB/b2HxyMv2zvZoSYtPC..rn6STl84Vq1jJ2Ejkzh3MnT.x/CuzMi',1,NULL,'2025-04-29 21:44:31','2025-04-29 21:44:31'),
	(2,'Biro Operasi','birooperasi',NULL,NULL,'$2y$12$OFX9yfI9T5Hjg6Kqa67zl.ku./OK4BW7P4Pc2O3aPBx0ifJiLRXGC',2,NULL,'2025-06-19 13:21:11','2025-06-19 13:21:11');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
