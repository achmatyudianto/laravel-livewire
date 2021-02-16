-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2021 at 09:25 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jerseyonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ligas`
--

CREATE TABLE `ligas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `negara` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ligas`
--

INSERT INTO `ligas` (`id`, `nama`, `negara`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Bundes Liga', 'Jerman', 'bundesliga.png', NULL, NULL),
(2, 'Premier League', 'Inggris', 'premierleague.png', NULL, NULL),
(3, 'La Liga', 'Spanyol', 'laliga.png', NULL, NULL),
(4, 'Serie A', 'Itali', 'seriea.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_02_15_021152_create_ligas_table', 1),
(5, '2021_02_15_021515_create_products_table', 1),
(8, '2021_02_15_021545_create_pesanans_table', 2),
(9, '2021_02_15_021616_create_pesanan_details_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanans`
--

CREATE TABLE `pesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `kode_pemesanan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_harga` int(11) NOT NULL,
  `kode_unik` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanans`
--

INSERT INTO `pesanans` (`id`, `user_id`, `kode_pemesanan`, `status`, `total_harga`, `kode_unik`, `created_at`, `updated_at`) VALUES
(4, 1, 'JP-4', '1', 1250000, 698, '2021-02-15 23:56:51', '2021-02-16 00:53:11'),
(5, 1, 'JP-5', '1', 3750000, 855, '2021-02-16 00:53:20', '2021-02-16 00:53:26'),
(6, 1, 'JP-6', '1', 16300000, 779, '2021-02-16 01:21:22', '2021-02-16 01:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_details`
--

CREATE TABLE `pesanan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pesanan_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `namaset` tinyint(1) NOT NULL DEFAULT 0,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_pesanan` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanan_details`
--

INSERT INTO `pesanan_details` (`id`, `pesanan_id`, `product_id`, `namaset`, `nama`, `nomor`, `jumlah_pesanan`, `total_harga`, `created_at`, `updated_at`) VALUES
(10, 4, 3, 0, NULL, NULL, 1, 1250000, '2021-02-15 23:56:51', '2021-02-15 23:56:51'),
(11, 5, 4, 0, NULL, NULL, 3, 3750000, '2021-02-16 00:53:20', '2021-02-16 00:53:20'),
(12, 6, 3, 0, NULL, NULL, 12, 15000000, '2021-02-16 01:21:22', '2021-02-16 01:21:22'),
(13, 6, 4, 1, 'AAA', '12', 1, 1300000, '2021-02-16 01:21:32', '2021-02-16 01:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `liga_id` int(11) NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL DEFAULT 1250000,
  `harga_nameset` int(11) NOT NULL DEFAULT 50000,
  `is_ready` tinyint(1) NOT NULL DEFAULT 1,
  `jenis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Replika Ori',
  `berat` double(8,2) NOT NULL DEFAULT 0.25,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `liga_id`, `nama`, `harga`, `harga_nameset`, `is_ready`, `jenis`, `berat`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 2, 'CHELSEA ORIGINAL 3RD 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'chelsea.png', NULL, NULL),
(2, 2, 'LEICESTER CITY HOME 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'leicester.png', NULL, NULL),
(3, 2, 'MAN. UNITED AWAY 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'mu.png', NULL, NULL),
(4, 2, 'LIVERPOOL ORIGINAL AWAY 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'liverpool.png', NULL, NULL),
(5, 2, 'TOTTENHAM ORIGINAL 3RD 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'tottenham.png', NULL, NULL),
(6, 1, 'DORTMUND ORIGINAL AWAY 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'dortmund.png', NULL, NULL),
(7, 1, 'BAYERN MUNCHEN ORIGINAL 3RD 2018 2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'munchen.png', NULL, NULL),
(8, 4, 'JUVENTUS ORIGINAL AWAY 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'juve.png', NULL, NULL),
(9, 4, 'AS ROMA ORIGINAL HOME 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'asroma.png', NULL, NULL),
(10, 4, 'AC MILAN ORIGINAL HOME 2018 2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'acmilan.png', NULL, NULL),
(11, 4, 'LAZIO ORIGINAL HOME 2018-2019', 1250000, 50000, 1, 'Replika Ori', 0.25, 'lazio.png', NULL, NULL),
(12, 3, 'REAL MADRID ORIGINAL 3RD 2018-2019', 1250000, 50000, 0, 'Replika Ori', 0.25, 'madrid.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nohp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `alamat`, `nohp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'yudi', 'yudi@gmail.com', NULL, '$2y$10$5gbd2FMy59c4XLl2HGG2eOJ3/DtiZB4v1rub6EfY5g/jVFWJWp1hm', 'Jl. Malang', '24234234', NULL, '2021-02-14 20:20:58', '2021-02-16 00:49:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ligas`
--
ALTER TABLE `ligas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan_details`
--
ALTER TABLE `pesanan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ligas`
--
ALTER TABLE `ligas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pesanan_details`
--
ALTER TABLE `pesanan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
