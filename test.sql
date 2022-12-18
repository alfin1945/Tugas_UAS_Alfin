-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Des 2022 pada 14.42
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi_akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dosen`
--

CREATE TABLE `tb_dosen` (
  `nidn` varchar(10) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_dosen`
--

INSERT INTO `tb_dosen` (`nidn`, `nama_dosen`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`) VALUES
('201', 'Harmaen, S.Kom.', 'Laki-Laki', 'Kertasari', '2001-09-07', 'kertasari, desa sukarema'),
('202', 'Alfan Habib, S.Kom.M.Cs.M', 'Laki-Laki', 'Labuhan Haji', '1994-09-07', 'Labuhan'),
('2020', 'Hilda Guspiarni', 'Perempuan', 'Sukamulia', '1995-08-05', 'Sukamulia'),
('203', 'Muhammad Azmi, M.Kom.', 'Laki-Laki', 'Sepit', '1990-03-14', 'Gapuk'),
('204', 'Fitriani, S.Kom', 'Perempuan', 'Masbagek', '1992-09-19', 'Masbagek'),
('205', 'Zulkarnaen, M.Kom.', 'Laki-Laki', 'Selong', '1991-01-28', 'Selong'),
('206', 'Sri Handayani, M.Kom.', 'Perempuan', 'Selong', '1987-09-12', 'Selong'),
('207', 'Irwan Kevin, M.Pd', 'Laki-Laki', 'Anjani', '1983-03-20', 'Anjani'),
('208', 'LL Puji Indra Kharisma, S.Kom., M.Cs.', 'Laki-Laki', 'Praya', '1992-05-15', 'Praya'),
('209', 'Dedi Efendi,S.Ag., S.H., M.Pd.', 'Laki-Laki', 'Anjani', '1991-01-28', 'Anjani'),
('210', 'Nukman, S.Kom.,M.Kom.', 'Laki-Laki', 'Kalijaga', '1991-01-28', 'Kalijaga');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `kode_jurusan` varchar(7) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `kaprodi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`kode_jurusan`, `jurusan`, `kaprodi`) VALUES
('', '', ''),
('P001', 'Teknik Informatika', 'Lalu Puji Indra Kharisma, S.Kom.,M.Cs.'),
('P002', 'Sistem Informasi', 'Puspita, S.Kom.,M.Cs.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `nim` varchar(15) NOT NULL,
  `kode_jurusan` varchar(7) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`nim`, `kode_jurusan`, `nama_mahasiswa`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`) VALUES
('204855040', 'P001', 'abdurrahman', 'Laki-Laki', 'Dasan Menak', '2000-09-07', 'Dasan Menak'),
('204855041', 'P001', 'kurniawan', 'Laki-Laki', 'sakra', '1994-09-07', 'sakra');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mata_kuliah`
--

CREATE TABLE `tb_mata_kuliah` (
  `kode_mata_kuliah` varchar(7) NOT NULL,
  `nidn` varchar(10) NOT NULL,
  `mata_kuliah` varchar(50) NOT NULL,
  `sks` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_mata_kuliah`
--

INSERT INTO `tb_mata_kuliah` (`kode_mata_kuliah`, `nidn`, `mata_kuliah`, `sks`) VALUES
('MK001', '201', 'Pemrogaman 1', 3),
('MK002', '202', 'RPL', 3),
('MK003', '203', 'Jaringan Komputer', 3),
('MK004', '204', 'Pengolahan Citra', 2),
('MK005', '205', 'Analisis Perancangan Sistem', 3),
('MK006', '206', 'Pengaman Data', 2),
('MK007', '207', 'Aljabar Linear & Matriks', 2),
('MK008', '208', 'Metode Penelitian', 2),
('MK009', '209', 'Seminar', 2),
('MK010', '210', 'Desain Web', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `id_nilai` int(10) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `kode_mata_kuliah` varchar(7) NOT NULL,
  `absen` decimal(10,0) NOT NULL,
  `tugas` decimal(10,0) NOT NULL,
  `uts` decimal(10,0) NOT NULL,
  `uas` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_nilai`
--

INSERT INTO `tb_nilai` (`id_nilai`, `nim`, `kode_mata_kuliah`, `absen`, `tugas`, `uts`, `uas`) VALUES
(1, '204855040', 'MK001', '80', '80', '90', '80'),
(5, '204855041', 'MK002', '90', '90', '90', '90'),
(7, '204855040', 'MK003', '90', '90', '90', '90'),
(8, '204855040', 'MK002', '90', '90', '90', '90'),
(9, '204855040', 'MK004', '90', '90', '90', '90'),
(10, '204855040', 'MK005', '90', '90', '90', '90'),
(11, '204855040', 'MK006', '90', '90', '90', '90'),
(12, '204855040', 'MK007', '90', '90', '90', '90'),
(13, '204855040', 'MK008', '90', '90', '90', '90'),
(14, '204855040', 'MK009', '90', '90', '90', '90'),
(15, '204855040', 'MK010', '90', '90', '90', '90');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`nidn`);

--
-- Indeks untuk tabel `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indeks untuk tabel `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `tb_mahasiswa_ibfk_1` (`kode_jurusan`);

--
-- Indeks untuk tabel `tb_mata_kuliah`
--
ALTER TABLE `tb_mata_kuliah`
  ADD PRIMARY KEY (`kode_mata_kuliah`),
  ADD KEY `tb_mata_kuliah_ibfk_1` (`nidn`);

--
-- Indeks untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `tb_nilai_ibfk_1` (`nim`),
  ADD KEY `tb_nilai_ibfk_2` (`kode_mata_kuliah`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD CONSTRAINT `tb_mahasiswa_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `tb_jurusan` (`kode_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_mata_kuliah`
--
ALTER TABLE `tb_mata_kuliah`
  ADD CONSTRAINT `tb_mata_kuliah_ibfk_1` FOREIGN KEY (`nidn`) REFERENCES `tb_dosen` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD CONSTRAINT `tb_nilai_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tb_mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_nilai_ibfk_2` FOREIGN KEY (`kode_mata_kuliah`) REFERENCES `tb_mata_kuliah` (`kode_mata_kuliah`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
Footer