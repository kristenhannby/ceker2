-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 07:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bengkelwat`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_layanan`
--

CREATE TABLE `detail_layanan` (
  `id` int(11) NOT NULL,
  `transaksi_id` int(11) DEFAULT NULL,
  `layanan_id` int(11) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_layanan`
--

INSERT INTO `detail_layanan` (`id`, `transaksi_id`, `layanan_id`, `harga`, `keterangan`) VALUES
(4, 3, 4, 200000.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detail_sparepart`
--

CREATE TABLE `detail_sparepart` (
  `id` int(11) NOT NULL,
  `transaksi_id` int(11) DEFAULT NULL,
  `sparepart_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_satuan` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_sparepart`
--

INSERT INTO `detail_sparepart` (`id`, `transaksi_id`, `sparepart_id`, `jumlah`, `harga_satuan`, `subtotal`) VALUES
(3, 3, 1, 1, 50000.00, 50000.00);

-- --------------------------------------------------------

--
-- Table structure for table `history_service`
--

CREATE TABLE `history_service` (
  `id` int(11) NOT NULL,
  `kendaraan_id` int(11) NOT NULL,
  `pelanggan_id` int(11) NOT NULL,
  `transaksi_servis_id` int(11) NOT NULL,
  `tanggal_service` date NOT NULL,
  `kilometer_kendaraan` int(11) DEFAULT NULL,
  `jenis_service` enum('berkala','perbaikan','ganti_part') NOT NULL,
  `keluhan` text DEFAULT NULL,
  `diagnosa` text DEFAULT NULL,
  `tindakan` text DEFAULT NULL,
  `mekanik_id` int(11) NOT NULL,
  `catatan_teknisi` text DEFAULT NULL,
  `rekomendasi` text DEFAULT NULL,
  `status` enum('selesai','berjalan','dibatalkan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history_service`
--

INSERT INTO `history_service` (`id`, `kendaraan_id`, `pelanggan_id`, `transaksi_servis_id`, `tanggal_service`, `kilometer_kendaraan`, `jenis_service`, `keluhan`, `diagnosa`, `tindakan`, `mekanik_id`, `catatan_teknisi`, `rekomendasi`, `status`) VALUES
(3, 6, 2, 3, '2025-05-02', NULL, 'perbaikan', NULL, NULL, NULL, 1, NULL, NULL, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_sparepart`
--

CREATE TABLE `kategori_sparepart` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_sparepart`
--

INSERT INTO `kategori_sparepart` (`id`, `nama_kategori`, `deskripsi`) VALUES
(1, 'Mesin', 'Sparepart untuk mesin Kendaraan'),
(3, 'Oli dan Cairan', 'Berbagai jenis oli dan cairan kendaraan');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` int(11) NOT NULL,
  `pelanggan_id` int(11) DEFAULT NULL,
  `no_polisi` varchar(20) NOT NULL,
  `jenis_kendaraan` varchar(50) DEFAULT NULL,
  `merk_kendaraan` varchar(50) DEFAULT NULL,
  `tipe_kendaraan` varchar(50) DEFAULT NULL,
  `warna_kendaraan` varchar(30) DEFAULT NULL,
  `tahun_pembuatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `pelanggan_id`, `no_polisi`, `jenis_kendaraan`, `merk_kendaraan`, `tipe_kendaraan`, `warna_kendaraan`, `tahun_pembuatan`) VALUES
(6, 2, 'B 9876 OIU', 'Mobil', 'Toyota', 'Avanza', 'biru', 2014);

-- --------------------------------------------------------

--
-- Table structure for table `keuangan`
--

CREATE TABLE `keuangan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_transaksi` enum('pemasukan','pengeluaran') NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `jumlah` decimal(12,2) NOT NULL,
  `referensi_transaksi_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `layanan_servis`
--

CREATE TABLE `layanan_servis` (
  `id` int(11) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga_layanan` decimal(10,2) DEFAULT NULL,
  `estimasi_waktu` varchar(50) DEFAULT NULL,
  `status` enum('aktif','tidak_aktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `layanan_servis`
--

INSERT INTO `layanan_servis` (`id`, `nama_layanan`, `deskripsi`, `harga_layanan`, `estimasi_waktu`, `status`) VALUES
(4, 'Servis AC', 'Pemeriksaan dan perbaikan AC mobil', 200000.00, '2-4 jam', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `log_sparepart`
--

CREATE TABLE `log_sparepart` (
  `id` int(11) NOT NULL,
  `sparepart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `aktivitas` enum('tambah_stok','kurangi_stok','ubah_harga','tambah_item_baru') NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `stok_sebelum` int(11) DEFAULT NULL,
  `stok_sesudah` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mekanik`
--

CREATE TABLE `mekanik` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nama_mekanik` varchar(100) NOT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `spesialisasi` varchar(100) DEFAULT NULL,
  `status` enum('aktif','tidak_aktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mekanik`
--

INSERT INTO `mekanik` (`id`, `user_id`, `nama_mekanik`, `no_telp`, `alamat`, `spesialisasi`, `status`) VALUES
(1, 3, 'Agus Setiawan', '0812132144', 'Jl Pandawa', 'Mesin', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_daftar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama_pelanggan`, `no_telp`, `alamat`, `tgl_daftar`) VALUES
(2, 'Indra', '08138724123', 'Jl Bacang', '2025-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `sparepart`
--

CREATE TABLE `sparepart` (
  `id` int(11) NOT NULL,
  `kode_part` varchar(50) NOT NULL,
  `nama_part` varchar(100) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT 0,
  `harga_beli` decimal(10,2) DEFAULT NULL,
  `harga_jual` decimal(10,2) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `stok_minimal` int(11) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sparepart`
--

INSERT INTO `sparepart` (`id`, `kode_part`, `nama_part`, `kategori_id`, `stok`, `harga_beli`, `harga_jual`, `satuan`, `stok_minimal`) VALUES
(1, 'OLI-001', 'Oli Mesin 1L', 3, 27, 35000.00, 50000.00, 'Liter', 5),
(2, 'FLT-001', 'Filter Oli', 1, 67, 20000.00, 35000.00, 'Pcs', 5);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nama_supplier`, `alamat`, `no_telp`) VALUES
(1, 'PT ABC', 'jl asia afrika', '01281274');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_servis`
--

CREATE TABLE `transaksi_servis` (
  `id` int(11) NOT NULL,
  `no_invoice` varchar(50) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `pelanggan_id` int(11) DEFAULT NULL,
  `kendaraan_id` int(11) DEFAULT NULL,
  `mekanik_id` int(11) DEFAULT NULL,
  `status_servis` enum('dikerjakan','selesai','dibatalkan') DEFAULT 'dikerjakan',
  `keluhan` text DEFAULT NULL,
  `total_biaya` decimal(10,2) DEFAULT NULL,
  `diskon` decimal(10,2) DEFAULT 0.00,
  `total_bayar` decimal(10,2) DEFAULT NULL,
  `status_pembayaran` enum('belum_bayar','dp','lunas') DEFAULT 'belum_bayar',
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_servis`
--

INSERT INTO `transaksi_servis` (`id`, `no_invoice`, `tanggal_masuk`, `tanggal_selesai`, `pelanggan_id`, `kendaraan_id`, `mekanik_id`, `status_servis`, `keluhan`, `total_biaya`, `diskon`, `total_bayar`, `status_pembayaran`, `keterangan`) VALUES
(3, 'INV/SRV/20250502/9124', '2025-05-02', '2025-05-02', 2, 6, 1, 'selesai', NULL, 250000.00, 0.00, 250000.00, 'lunas', '');

--
-- Triggers `transaksi_servis`
--
DELIMITER $$
CREATE TRIGGER `after_transaksi_service_update` AFTER UPDATE ON `transaksi_servis` FOR EACH ROW BEGIN
    IF NEW.status_servis = 'selesai' AND OLD.status_servis != 'selesai' THEN
        INSERT INTO bengkelwat.history_service (
            kendaraan_id,
            pelanggan_id,
            transaksi_servis_id,
            tanggal_service,
            jenis_service,
            keluhan,
            mekanik_id,
            status
        )
        VALUES (
            NEW.kendaraan_id,
            NEW.pelanggan_id,
            NEW.id,
            CURRENT_DATE(),
            'perbaikan', -- Default jenis_service
            NEW.keluhan,
            NEW.mekanik_id,
            'selesai'
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('pemilik','admin','mekanik','staff') NOT NULL,
  `status` enum('aktif','tidak_aktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama_lengkap`, `role`, `status`) VALUES
(1, 'pemilik', 'pemilik123', 'Budi Santoso', 'pemilik', 'aktif'),
(2, 'admin', 'admin123', 'Siti Rahayu', 'admin', 'aktif'),
(3, 'mekanik1', 'mekanik123', 'Agus Setiawan', 'mekanik', 'aktif'),
(4, 'staff', 'password123', 'Nama Staff Inventory', '', 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_layanan`
--
ALTER TABLE `detail_layanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `layanan_id` (`layanan_id`);

--
-- Indexes for table `detail_sparepart`
--
ALTER TABLE `detail_sparepart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `sparepart_id` (`sparepart_id`);

--
-- Indexes for table `history_service`
--
ALTER TABLE `history_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_history_kendaraan_idx` (`kendaraan_id`),
  ADD KEY `fk_history_pelanggan_idx` (`pelanggan_id`),
  ADD KEY `fk_history_transaksi_idx` (`transaksi_servis_id`),
  ADD KEY `fk_history_mekanik_idx` (`mekanik_id`);

--
-- Indexes for table `kategori_sparepart`
--
ALTER TABLE `kategori_sparepart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_id` (`pelanggan_id`);

--
-- Indexes for table `keuangan`
--
ALTER TABLE `keuangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referensi_transaksi_id` (`referensi_transaksi_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `layanan_servis`
--
ALTER TABLE `layanan_servis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_sparepart`
--
ALTER TABLE `log_sparepart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_sparepart_sparepart_idx` (`sparepart_id`),
  ADD KEY `fk_log_sparepart_user_idx` (`user_id`),
  ADD KEY `fk_log_sparepart_supplier` (`supplier_id`);

--
-- Indexes for table `mekanik`
--
ALTER TABLE `mekanik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sparepart`
--
ALTER TABLE `sparepart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_part` (`kode_part`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_servis`
--
ALTER TABLE `transaksi_servis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_invoice` (`no_invoice`),
  ADD KEY `pelanggan_id` (`pelanggan_id`),
  ADD KEY `kendaraan_id` (`kendaraan_id`),
  ADD KEY `mekanik_id` (`mekanik_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_layanan`
--
ALTER TABLE `detail_layanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_sparepart`
--
ALTER TABLE `detail_sparepart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `history_service`
--
ALTER TABLE `history_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kategori_sparepart`
--
ALTER TABLE `kategori_sparepart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `keuangan`
--
ALTER TABLE `keuangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `layanan_servis`
--
ALTER TABLE `layanan_servis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `log_sparepart`
--
ALTER TABLE `log_sparepart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mekanik`
--
ALTER TABLE `mekanik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sparepart`
--
ALTER TABLE `sparepart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi_servis`
--
ALTER TABLE `transaksi_servis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_layanan`
--
ALTER TABLE `detail_layanan`
  ADD CONSTRAINT `detail_layanan_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi_servis` (`id`),
  ADD CONSTRAINT `detail_layanan_ibfk_2` FOREIGN KEY (`layanan_id`) REFERENCES `layanan_servis` (`id`);

--
-- Constraints for table `detail_sparepart`
--
ALTER TABLE `detail_sparepart`
  ADD CONSTRAINT `detail_sparepart_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi_servis` (`id`),
  ADD CONSTRAINT `detail_sparepart_ibfk_2` FOREIGN KEY (`sparepart_id`) REFERENCES `sparepart` (`id`);

--
-- Constraints for table `history_service`
--
ALTER TABLE `history_service`
  ADD CONSTRAINT `fk_history_kendaraan` FOREIGN KEY (`kendaraan_id`) REFERENCES `kendaraan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_history_mekanik` FOREIGN KEY (`mekanik_id`) REFERENCES `mekanik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_history_pelanggan` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_history_transaksi` FOREIGN KEY (`transaksi_servis_id`) REFERENCES `transaksi_servis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`);

--
-- Constraints for table `keuangan`
--
ALTER TABLE `keuangan`
  ADD CONSTRAINT `keuangan_ibfk_1` FOREIGN KEY (`referensi_transaksi_id`) REFERENCES `transaksi_servis` (`id`),
  ADD CONSTRAINT `keuangan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `log_sparepart`
--
ALTER TABLE `log_sparepart`
  ADD CONSTRAINT `fk_log_sparepart_sparepart` FOREIGN KEY (`sparepart_id`) REFERENCES `sparepart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_sparepart_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_log_sparepart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mekanik`
--
ALTER TABLE `mekanik`
  ADD CONSTRAINT `mekanik_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sparepart`
--
ALTER TABLE `sparepart`
  ADD CONSTRAINT `sparepart_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_sparepart` (`id`);

--
-- Constraints for table `transaksi_servis`
--
ALTER TABLE `transaksi_servis`
  ADD CONSTRAINT `transaksi_servis_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`),
  ADD CONSTRAINT `transaksi_servis_ibfk_2` FOREIGN KEY (`kendaraan_id`) REFERENCES `kendaraan` (`id`),
  ADD CONSTRAINT `transaksi_servis_ibfk_3` FOREIGN KEY (`mekanik_id`) REFERENCES `mekanik` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
