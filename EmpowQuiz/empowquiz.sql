-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 19, 2025 at 05:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empowquiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_answer` text DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `answered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level_name`) VALUES
(1, 'Kelas 6 SD'),
(2, 'Kelas 7 SMP');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `question_type` enum('multiple_choice','short_answer','true_false') NOT NULL,
  `options_data` text DEFAULT NULL,
  `correct_answer_data` text DEFAULT NULL,
  `explanation` text DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `difficulty_level` enum('easy','medium','hard') NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `next_if_correct` int(11) DEFAULT NULL,
  `next_if_wrong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `subject_id`, `level_id`, `question_text`, `question_type`, `options_data`, `correct_answer_data`, `explanation`, `video_link`, `video_url`, `difficulty_level`, `is_active`, `next_if_correct`, `next_if_wrong`) VALUES
(11, 1, 1, 'Apa arti dari sila pertama Pancasila?', 'multiple_choice', '{\"A\": \"Ketuhanan Yang Maha Esa\", \"B\": \"Kemanusiaan yang adil dan beradab\", \"C\": \"Persatuan Indonesia\", \"D\": \"Keadilan sosial\"}', '\"A\"', 'Sila pertama Pancasila adalah “Ketuhanan Yang Maha Esa” yang berarti setiap warga negara Indonesia percaya dan bertakwa kepada Tuhan sesuai agama dan kepercayaannya.', 'https://www.youtube.com/watch?v=GQ0eU4zU_C0', NULL, 'medium', 1, NULL, NULL),
(12, 1, 1, 'Manakah contoh perilaku yang sesuai dengan sila kedua Pancasila?', 'multiple_choice', '{\"A\": \"Membantu teman yang kesusahan\", \"B\": \"Menghina orang berbeda agama\", \"C\": \"Melawan orang tua\", \"D\": \"Mencoret dinding sekolah\"}', '\"A\"', 'Sila kedua mengajarkan nilai kemanusiaan, yaitu memperlakukan sesama dengan adil dan beradab, contohnya membantu teman.', 'https://www.youtube.com/watch?v=dNK8RCQ9MkU', NULL, 'medium', 1, NULL, NULL),
(13, 1, 1, 'Apa bunyi sila ketiga Pancasila?', 'short_answer', NULL, '\"persatuan indonesia\"', 'Sila ketiga berbunyi “Persatuan Indonesia” yang menekankan pentingnya menjaga kesatuan dan keutuhan bangsa.', 'https://www.youtube.com/watch?v=13mWIq4K7aE', NULL, 'medium', 1, NULL, NULL),
(14, 1, 1, 'Sikap mana yang mencerminkan sila keempat?', 'multiple_choice', '{\"A\": \"Menyelesaikan masalah lewat musyawarah\", \"B\": \"Memaksakan kehendak sendiri\", \"C\": \"Bertengkar dalam rapat\", \"D\": \"Diam saja dalam diskusi\"}', '\"A\"', 'Sila keempat menekankan pada demokrasi dan musyawarah mufakat untuk mengambil keputusan bersama.', 'https://www.youtube.com/watch?v=wtLFx3gVwPo', NULL, 'medium', 1, NULL, NULL),
(15, 1, 1, 'Apa simbol dari sila kelima Pancasila?', 'multiple_choice', '{\"A\": \"Bintang\", \"B\": \"Rantai\", \"C\": \"Pohon Beringin\", \"D\": \"Padi dan Kapas\"}', '\"D\"', 'Padi dan kapas adalah simbol dari sila kelima yang berarti keadilan sosial bagi seluruh rakyat Indonesia.', 'https://www.youtube.com/watch?v=GQ0eU4zU_C0', NULL, 'easy', 1, NULL, NULL),
(16, 1, 1, 'Benar atau salah: Pancasila terdiri dari lima sila.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Pancasila adalah dasar negara Indonesia yang terdiri dari lima sila.', 'https://www.youtube.com/watch?v=HqYQeORRR7I', NULL, 'easy', 1, NULL, NULL),
(17, 1, 1, 'Apa lambang negara Indonesia?', 'multiple_choice', '{\"A\": \"Singa\", \"B\": \"Harimau\", \"C\": \"Garuda\", \"D\": \"Merpati\"}', '\"C\"', 'Lambang negara Indonesia adalah Garuda Pancasila, yang mencerminkan kekuatan dan kebangsaan.', 'https://www.youtube.com/watch?v=ypf6HTexZRE', NULL, 'easy', 1, NULL, NULL),
(18, 1, 1, 'Siapakah yang mencetuskan dasar negara Pancasila?', 'short_answer', NULL, '\"ir. soekarno\"', 'Ir. Soekarno adalah tokoh proklamator dan presiden pertama Indonesia yang mencetuskan Pancasila sebagai dasar negara.', 'https://www.youtube.com/watch?v=RtVjvLnxFSo', NULL, 'hard', 1, NULL, NULL),
(19, 1, 1, 'Simbol apa yang melambangkan hubungan manusia dan perempuan pada lambang Pancasila?', 'short_answer', NULL, '\"rantai\"', 'Pada sila kedua Pancasila, yaitu “Kemanusiaan yang Adil dan Beradab,” terdapat gambar rantai yang terdiri dari mata rantai bulat dan persegi. Mata rantai bulat melambangkan perempuan, sedangkan mata rantai persegi melambangkan laki-laki. Rantai ini melambangkan hubungan yang erat dan saling terkait antara manusia, khususnya antara laki-laki dan perempuan, yang membentuk ikatan sosial yang kuat dan harmonis dalam kehidupan bermasyarakat. Simbol ini menegaskan pentingnya keadilan dan kesetaraan dalam hubungan kemanusiaan.', 'https://www.youtube.com/watch?v=DKFVQ3uUI6s', NULL, 'hard', 1, NULL, NULL),
(20, 1, 1, 'Apa yang dijunjung oleh sila kelima Pancasila?', 'short_answer', NULL, '\"keadilan sosial\"', 'Sila kelima Pancasila, yaitu “Keadilan Sosial bagi Seluruh Rakyat Indonesia,” menekankan pentingnya memberikan keadilan dalam segala aspek kehidupan masyarakat. Hal ini berarti setiap warga negara berhak mendapatkan perlakuan yang adil, kesempatan yang sama, dan kesejahteraan yang merata tanpa diskriminasi. Dengan menjunjung keadilan sosial, masyarakat bisa hidup harmonis dan sejahtera bersama.\r\n', 'https://www.youtube.com/watch?v=WnEcbBkGpJM', NULL, 'hard', 1, NULL, NULL),
(21, 2, 1, 'Apa kewajiban utama seorang warga negara Indonesia?', 'multiple_choice', '{\"A\": \"Membayar pajak\", \"B\": \"Meminta bantuan\", \"C\": \"Bermalas-malasan\", \"D\": \"Mendapat perlindungan\"}', '\"A\"', 'Setiap warga negara memiliki kewajiban membayar pajak sebagai bentuk kontribusi terhadap pembangunan negara.', 'https://www.youtube.com/watch?v=bEBIcNNaNfs', NULL, 'medium', 1, NULL, NULL),
(22, 2, 1, 'Apa arti semboyan “Bhinneka Tunggal Ika”?', 'short_answer', NULL, '\"berbeda-beda tetapi tetap satu\"', 'Semboyan ini melambangkan persatuan dalam keberagaman bangsa Indonesia.', 'https://www.youtube.com/watch?v=ZT8tLPuAYAM', NULL, 'medium', 1, NULL, NULL),
(23, 2, 1, 'Mengapa kita harus menaati peraturan?', 'multiple_choice', '{\"A\": \"Agar tidak dihukum\", \"B\": \"Agar hidup tertib dan aman\", \"C\": \"Agar mendapat hadiah\", \"D\": \"Agar terlihat keren\"}', '\"B\"', 'Menaati peraturan adalah tanggung jawab warga negara agar tercipta keteraturan dan keamanan bersama.', 'https://www.youtube.com/watch?v=U6H2rI4aJ2A', NULL, 'medium', 1, NULL, NULL),
(24, 2, 1, 'Siapa yang berhak memilih dalam pemilu?', 'multiple_choice', '{\"A\": \"Anak-anak\", \"B\": \"Orang asing\", \"C\": \"Warga negara yang sudah cukup umur\", \"D\": \"Semua orang\"}', '\"C\"', 'Warga negara Indonesia yang sudah cukup umur (minimal 17 tahun atau sudah menikah) memiliki hak untuk memilih.', 'https://www.youtube.com/watch?v=H1R_5HDJ9cE', NULL, 'medium', 1, NULL, NULL),
(25, 2, 1, 'Benar atau salah: Indonesia menganut sistem pemerintahan kerajaan.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"B\"', 'Indonesia adalah negara republik, bukan kerajaan.', 'https://www.youtube.com/watch?v=RSoFTAYAcEo', NULL, 'easy', 1, NULL, NULL),
(26, 2, 1, 'Apa status seseorang yang diakui sebagai bagian dari suatu negara?', 'short_answer', NULL, '\"warga negara\"', 'Warga negara adalah seseorang yang secara hukum diakui sebagai bagian dari suatu negara. Status ini memberikan hak dan kewajiban, seperti hak mendapat perlindungan hukum, hak memilih dalam pemilu, dan kewajiban menaati aturan negara. Misalnya, orang yang memiliki kewarganegaraan Indonesia berarti dia adalah warga negara Indonesia, yang berhak dan wajib sesuai dengan hukum Indonesia.', 'https://www.youtube.com/watch?v=PUc_GInmVTs', NULL, 'easy', 1, NULL, NULL),
(27, 2, 1, 'Salah satu contoh hak anak di rumah adalah?', 'multiple_choice', '{\"A\": \"Mendapat kasih sayang\", \"B\": \"Membantah orang tua\", \"C\": \"Berkelahi\", \"D\": \"Tidak mandi\"}', '\"A\"', 'Anak berhak mendapatkan kasih sayang dan perlindungan dari orang tua.', 'https://www.youtube.com/watch?v=6Pwwm9OKB4s', NULL, 'easy', 1, NULL, NULL),
(28, 2, 1, 'Apa yang terjadi jika warga negara tidak menaati hukum?', 'short_answer', NULL, '\"mendapat hukuman\"', 'Jika warga tidak menaati hukum, maka dapat dikenai sanksi atau hukuman sesuai aturan yang berlaku.', 'https://www.youtube.com/watch?v=r63cZacW2nk', NULL, 'hard', 1, NULL, NULL),
(29, 2, 1, 'Apa bentuk partisipasi warga negara dalam kehidupan demokrasi?', 'multiple_choice', '{\"A\": \"Golput\", \"B\": \"Menonton TV\", \"C\": \"Ikut pemilu\", \"D\": \"Tidur saat pemilu\"}', '\"C\"', 'Partisipasi warga negara seperti ikut serta dalam pemilu mencerminkan kehidupan demokrasi yang aktif.', 'https://www.youtube.com/watch?v=9PvthLF1dfU', NULL, 'hard', 1, NULL, NULL),
(30, 2, 1, 'Apa kewajiban utama warga negara?', 'short_answer', NULL, '\"mematuhi hukum\"', 'Mematuhi hukum adalah kewajiban utama warga negara karena hukum dibuat untuk menjaga ketertiban dan keadilan dalam masyarakat. Dengan mematuhi hukum, warga negara membantu menciptakan lingkungan yang aman dan tertib, sehingga hak dan kebebasan semua orang dapat terlindungi dengan baik. Jika hukum diabaikan, maka akan terjadi kekacauan dan ketidakadilan.', 'https://www.youtube.com/watch?v=on3K9O4U1sM', NULL, 'hard', 1, NULL, NULL),
(31, 3, 1, 'Apa arti toleransi dalam kehidupan beragama?', 'multiple_choice', '{\"A\": \"Menganggap agama sendiri paling benar\", \"B\": \"Menghormati perbedaan agama\", \"C\": \"Tidak bergaul dengan orang beda agama\", \"D\": \"Mengikuti semua agama\"}', '\"B\"', 'Toleransi berarti menghormati dan menerima perbedaan, termasuk dalam keyakinan agama.', 'https://www.youtube.com/watch?v=lY0X6J6RRNw', NULL, 'medium', 1, NULL, NULL),
(32, 3, 1, 'Mengapa kita harus berdoa sebelum melakukan aktivitas?', 'short_answer', NULL, '\"agar diberi kelancaran dan perlindungan\"', 'Berdoa adalah cara kita memohon perlindungan dan keberkahan dari Tuhan sebelum beraktivitas.', 'https://www.youtube.com/watch?v=TeC5gM8oovM', NULL, 'medium', 1, NULL, NULL),
(33, 3, 1, 'Benar atau salah: Membantu teman tanpa pamrih adalah perbuatan terpuji menurut ajaran agama.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Semua agama mengajarkan untuk saling membantu dengan ikhlas.', 'https://www.youtube.com/watch?v=UvBuvUDDW2E', NULL, 'medium', 1, NULL, NULL),
(34, 3, 1, 'Apa yang sebaiknya dilakukan saat melihat teman dari agama lain sedang beribadah?', 'multiple_choice', '{\"A\": \"Mengganggu mereka\", \"B\": \"Meninggalkan tempat\", \"C\": \"Menghormatinya\", \"D\": \"Menirukan cara ibadahnya\"}', '\"C\"', 'Menghormati ibadah orang lain adalah bentuk sikap toleransi dan sesuai nilai agama.', 'https://www.youtube.com/watch?v=yMJwAC2CsdA', NULL, 'medium', 1, NULL, NULL),
(35, 3, 1, 'Tempat beribadah umat Islam disebut...', 'short_answer', NULL, '\"masjid\"', 'Masjid adalah tempat ibadah umat Islam.', 'https://www.youtube.com/watch?v=_lm2ybm9In4', NULL, 'easy', 1, NULL, NULL),
(36, 3, 1, 'Apa kewajiban anak terhadap orang tua menurut ajaran agama?', 'multiple_choice', '{\"A\": \"Membantah jika tidak setuju\", \"B\": \"Mengabaikan nasihatnya\", \"C\": \"Berbuat baik dan taat\", \"D\": \"Meminta hadiah\"}', '\"C\"', 'Berbakti kepada orang tua adalah kewajiban utama menurut semua agama.', 'https://www.youtube.com/watch?v=s6GCvvjE3Xg', NULL, 'easy', 1, NULL, NULL),
(37, 3, 1, 'Benar atau salah: Semua agama mengajarkan kasih sayang.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Setiap agama menekankan pentingnya kasih sayang dalam kehidupan.', 'https://www.youtube.com/watch?v=q8LOOEeBqXk', NULL, 'easy', 1, NULL, NULL),
(38, 3, 1, 'Apa tujuan utama dari menjalankan ibadah?', 'short_answer', NULL, '\"mendekatkan diri kepada tuhan\"', 'Ibadah dilakukan untuk menunjukkan ketaatan dan rasa syukur kepada Tuhan.', 'https://www.youtube.com/watch?v=1_Zm7r3TOyQ', NULL, 'hard', 1, NULL, NULL),
(39, 3, 1, 'Manakah contoh sikap saling menghormati dalam keberagaman agama di sekolah?', 'multiple_choice', '{\"A\": \"Tidak berteman dengan berbeda agama\", \"B\": \"Mengganggu saat beribadah\", \"C\": \"Memberi ucapan hari raya\", \"D\": \"Mencemooh perayaan agama lain\"}', '\"C\"', 'Memberi ucapan hari raya adalah contoh nyata menghargai kepercayaan orang lain.', 'https://www.youtube.com/watch?v=2KMqY7-VdZ0', NULL, 'hard', 1, NULL, NULL),
(40, 3, 1, 'Apa arti nilai spiritual dalam agama?', 'short_answer', NULL, '\"kepercayaan kepada tuhan\"', 'Nilai spiritual adalah nilai yang menumbuhkan kesadaran beragama dan hubungan dengan Tuhan.', 'https://www.youtube.com/watch?v=K2KxNVtclG4', NULL, 'hard', 1, NULL, NULL),
(41, 4, 1, 'Apa tujuan dari membuat ringkasan teks bacaan?', 'multiple_choice', '{\"A\": \"Menghapus bagian penting\", \"B\": \"Memperbanyak kalimat\", \"C\": \"Mengambil inti informasi\", \"D\": \"Mengubah cerita\"}', '\"C\"', 'Ringkasan dibuat untuk menyampaikan inti informasi dari suatu bacaan secara singkat dan jelas.', 'https://www.youtube.com/watch?v=zB0RtE3mS9I', NULL, 'medium', 1, NULL, NULL),
(42, 4, 1, 'Benar atau salah: Kalimat utama biasanya terdapat di awal paragraf.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Kalimat utama sering kali terletak di awal paragraf untuk memperkenalkan isi paragraf tersebut.', 'https://www.youtube.com/watch?v=wh_LKk4nWqI', NULL, 'medium', 1, NULL, NULL),
(43, 4, 1, 'Apa fungsi dari tanda titik dalam kalimat?', 'multiple_choice', '{\"A\": \"Menggabungkan kalimat\", \"B\": \"Menunjukkan pertanyaan\", \"C\": \"Mengakhiri kalimat\", \"D\": \"Menyatakan kekaguman\"}', '\"C\"', 'Tanda titik digunakan untuk mengakhiri kalimat pernyataan.', 'https://www.youtube.com/watch?v=O9vjSaDhPoU', NULL, 'medium', 1, NULL, NULL),
(44, 4, 1, 'Buatlah kalimat ajakan yang hanya mengajak untuk belajar dan diawali dengan kata “Ayo”!', 'short_answer', NULL, '\"ayo belajar\"', 'Kalimat ajakan biasanya diawali dengan kata “ayo”, “mari”, atau “marilah”.', 'https://www.youtube.com/watch?v=wMmiAoz6YlQ', NULL, 'medium', 1, NULL, NULL),
(45, 4, 1, 'Sinonim dari kata “besar” dengan huruf awalan G___ adalah...', 'short_answer', NULL, '\"gede\"', 'Kata “gede” adalah sinonim dari “besar” dalam bahasa sehari-hari, terutama dalam bahasa Indonesia informal atau bahasa daerah seperti Jawa. Keduanya memiliki arti ukuran yang luas, panjang, atau tinggi yang melebihi ukuran biasa. Jadi, ketika seseorang mengatakan sesuatu itu “gede”, artinya sama dengan “besar”.', 'https://www.youtube.com/watch?v=PfQepxAo5Fo', NULL, 'easy', 1, NULL, NULL),
(46, 4, 1, 'Benar atau salah: Huruf kapital digunakan pada awal kalimat.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Huruf kapital digunakan untuk huruf pertama dalam kalimat.', 'https://www.youtube.com/watch?v=sNRdAj1UbxQ', NULL, 'easy', 1, NULL, NULL),
(47, 4, 1, 'Kata tanya “mengapa” digunakan untuk...', 'multiple_choice', '{\"A\": \"Menanyakan tempat\", \"B\": \"Menanyakan alasan\", \"C\": \"Menanyakan orang\", \"D\": \"Menanyakan waktu\"}', '\"B\"', 'Kata tanya “mengapa” digunakan untuk menanyakan alasan dari suatu kejadian.', 'https://www.youtube.com/watch?v=9YkhN6-7K5o', NULL, 'easy', 1, NULL, NULL),
(48, 4, 1, 'Apa yang dimaksud dengan paragraf deduktif?', 'multiple_choice', '{\"A\": \"Kalimat utamanya di tengah\", \"B\": \"Kalimat utamanya di akhir\", \"C\": \"Kalimat utamanya di awal\", \"D\": \"Tanpa kalimat utama\"}', '\"C\"', 'Paragraf deduktif adalah paragraf yang kalimat utamanya terletak di awal.', 'https://www.youtube.com/watch?v=HNu2QmvEBhc', NULL, 'hard', 1, NULL, NULL),
(49, 4, 1, 'Kalimat majas personifikasi apa yang menyebutkan “angin berbisik lem___ di teli_____”?', 'short_answer', NULL, '\"angin berbisik lembut di telingaku\"', 'Majas personifikasi memberikan sifat manusia kepada benda mati.', 'https://www.youtube.com/watch?v=Wn5Up08CF8s', NULL, 'hard', 1, NULL, NULL),
(50, 4, 1, 'Apa itu fakta dalam teks?', 'short_answer', NULL, '\"informasi yang benar dan dapat dibuktikan.\"', 'Fakta adalah informasi yang benar dan bisa dibuktikan kebenarannya lewat data, bukti, atau kejadian nyata. Dalam teks, fakta menyampaikan hal-hal yang objektif tanpa pendapat pribadi. Contohnya, “Air mendidih pada suhu 100 derajat Celsius” adalah fakta karena bisa diuji dan dibuktikan.\r\n\r\n', 'https://www.youtube.com/watch?v=DsNSZJDKv3E', NULL, 'hard', 1, NULL, NULL),
(51, 5, 1, 'What is the English word for \"buku\"?', 'multiple_choice', '{\"A\": \"Book\", \"B\": \"Pen\", \"C\": \"Bag\", \"D\": \"Pencil\"}', '\"A\"', '\"Buku\" dalam Bahasa Inggris adalah \"Book\".', 'https://www.youtube.com/watch?v=TRN86I6pBeU', NULL, 'medium', 1, NULL, NULL),
(52, 5, 1, 'Choose the correct sentence.', 'multiple_choice', '{\"A\": \"She is plays soccer.\", \"B\": \"She play soccer.\", \"C\": \"She playing soccer.\", \"D\": \"She plays soccer.\"}', '\"D\"', 'Kalimat yang benar secara tata bahasa adalah \"She plays soccer.\"', 'https://www.youtube.com/watch?v=MjcZ0Mi5W8M', NULL, 'medium', 1, NULL, NULL),
(53, 5, 1, 'True or False: \"He go to school every day.\"', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"B\"', 'Kalimat yang benar adalah \"He goes to school every day.\" karena subjek \"he\" menggunakan \"goes\".', 'https://www.youtube.com/watch?v=RXK4KxRPHjY', NULL, 'medium', 1, NULL, NULL),
(54, 5, 1, 'Translate to English: \"Saya suka apel.\"', 'short_answer', NULL, '\"i like apple\"', 'Terjemahan \"Saya suka apel\" dalam Bahasa Inggris adalah \"I like apples\".', 'https://www.youtube.com/watch?v=ZkbkLSgveaE', NULL, 'medium', 1, NULL, NULL),
(55, 5, 1, 'What color is the sky on a clear day?', 'multiple_choice', '{\"A\": \"Red\", \"B\": \"Blue\", \"C\": \"Green\", \"D\": \"Yellow\"}', '\"B\"', 'Langit pada hari cerah berwarna biru.', 'https://www.youtube.com/watch?v=ILpqYtJSyzM', NULL, 'easy', 1, NULL, NULL),
(56, 5, 1, 'True or False: \"Cat\" is an animal.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', '\"Cat\" berarti kucing, dan kucing adalah hewan.', 'https://www.youtube.com/watch?v=2QaprsEv4Tc', NULL, 'easy', 1, NULL, NULL),
(57, 5, 1, 'Translate to English: \"Ayah saya bekerja di kantor.\"', 'short_answer', NULL, '\"my father works in an office\"', 'Kalimat \"Ayah saya bekerja di kantor.\" artinya \"My father works in an office.\"\r\n\"Ayah saya\" berarti \"My father.\"\r\n\"bekerja\" berarti \"works.\"\r\n\"di kantor\" berarti \"in an office.\"\r\nJadi, kalimat ini menjelaskan bahwa ayah saya bekerja di sebuah kantor.', 'https://www.youtube.com/watch?v=OH9A0F3AijY', NULL, 'easy', 1, NULL, NULL),
(58, 5, 1, 'What is the past tense of \"go\"?', 'multiple_choice', '{\"A\": \"Goed\", \"B\": \"Go\", \"C\": \"Went\", \"D\": \"Goes\"}', '\"C\"', 'Bentuk past tense (lampau) dari \"go\" adalah \"went\".', 'https://www.youtube.com/watch?v=F9SIE4PCbdk', NULL, 'hard', 1, NULL, NULL),
(59, 5, 1, 'What is the capital city of Indonesia?', 'short_answer', NULL, '\"jakarta\"', 'Jakarta adalah ibu kota Indonesia, yaitu pusat pemerintahan dan kota terbesar di negara ini. Sebagai ibu kota, Jakarta menjadi tempat kantor pemerintahan, pusat bisnis, serta kegiatan ekonomi dan budaya utama Indonesia. Oleh karena itu, jawaban untuk pertanyaan “What is the capital city of Indonesia?” adalah “Jakarta”.', 'https://www.youtube.com/watch?v=El9bAT2Q1L0', NULL, 'hard', 1, NULL, NULL),
(60, 5, 1, 'Which sentence shows someone doing something right now?', 'multiple_choice', '{\"A\": \"They play basketball every day.\", \"B\": \"She is watching TV at the moment.\", \"C\": \"I go to school by bus.\", \"D\": \"He eats lunch at noon.\"}', '\"B\"', 'Kalimat yang menggunakan present continuous tense menunjukkan aktivitas yang sedang berlangsung saat ini atau “right now”.\r\nPilihan B, \"She is watching TV at the moment.\", menggunakan bentuk is + verb-ing, yang tepat untuk present continuous.\r\nPilihan lain menggunakan simple present tense yang menunjukkan kebiasaan atau fakta, bukan aktivitas yang sedang terjadi saat ini.\r\nJadi, jawaban yang benar adalah pilihan B.', 'https://www.youtube.com/watch?v=OxPUh_bM9qE', NULL, 'hard', 1, NULL, NULL),
(61, 1, 2, 'Apa isi dari sila keempat Pancasila?', 'multiple_choice', '{\"A\": \"Kerakyatan yang dipimpin oleh hikmat kebijaksanaan\", \"B\": \"Kemanusiaan yang adil dan beradab\", \"C\": \"Persatuan Indonesia\", \"D\": \"Ketuhanan Yang Maha Esa\"}', '\"A\"', 'Sila keempat adalah “Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan” yang mencerminkan prinsip demokrasi di Indonesia.', 'https://www.youtube.com/watch?v=zM6gdR6BF0s', NULL, 'medium', 1, NULL, NULL),
(62, 1, 2, 'Manakah yang mencerminkan pengamalan sila kelima Pancasila?', 'multiple_choice', '{\"A\": \"Menghargai pendapat orang lain\", \"B\": \"Menolong tetangga yang kesusahan\", \"C\": \"Memberikan beasiswa kepada siswa kurang mampu\", \"D\": \"Beribadah sesuai agama masing-masing\"}', '\"C\"', 'Memberikan beasiswa adalah bentuk keadilan sosial yang tercermin dalam sila kelima Pancasila.', 'https://www.youtube.com/watch?v=Fu01BNgd5Ho', NULL, 'medium', 1, NULL, NULL),
(63, 1, 2, 'True or False: Sila keempat mengajarkan kita untuk mengambil keputusan sendiri tanpa musyawarah.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"B\"', 'Sila keempat menekankan pentingnya musyawarah untuk mufakat, bukan keputusan sepihak.', 'https://www.youtube.com/watch?v=G2NIOwyy0n8', NULL, 'medium', 1, NULL, NULL),
(64, 1, 2, 'Mengapa kita perlu menerapkan sila kedua dalam kehidupan sehari-hari?', 'short_answer', NULL, '\"agar kita bersikap adil\"', 'Sila kedua mengajarkan kita untuk menghargai martabat manusia dan menjunjung keadilan serta kemanusiaan.', 'https://www.youtube.com/watch?v=fwXr8NQ_sVA', NULL, 'medium', 1, NULL, NULL),
(65, 1, 2, 'Apa lambang dari sila pertama Pancasila?', 'multiple_choice', '{\"A\": \"Bintang\", \"B\": \"Pohon Beringin\", \"C\": \"Rantai\", \"D\": \"Kepala Banteng\"}', '\"A\"', 'Lambang sila pertama adalah bintang emas yang melambangkan Ketuhanan Yang Maha Esa.', 'https://www.youtube.com/watch?v=HnDcnqMdVXQ', NULL, 'easy', 1, NULL, NULL),
(66, 1, 2, 'True or False: Persatuan Indonesia adalah sila ketiga.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Sila ketiga Pancasila adalah “Persatuan Indonesia”.', 'https://www.youtube.com/watch?v=0N1OgHAbAh0', NULL, 'easy', 1, NULL, NULL),
(67, 1, 2, 'Tuliskan bunyi dari sila kedua Pancasila.', 'short_answer', NULL, '\"kemanusiaan yang adil dan beradab\"', 'Bunyi sila kedua adalah “Kemanusiaan yang adil dan beradab”.', 'https://www.youtube.com/watch?v=QUXKtvX6H7U', NULL, 'easy', 1, NULL, NULL),
(68, 1, 2, 'Bagaimana cara kita menerapkan sila keempat dalam organisasi sekolah?', 'short_answer', NULL, '\"bermusyawarah untuk mengambil keputusan bersama\"', 'Musyawarah dalam organisasi mencerminkan penerapan sila keempat Pancasila.', 'https://www.youtube.com/watch?v=DbU8NDlI-zk', NULL, 'hard', 1, NULL, NULL),
(69, 1, 2, 'Pilih kalimat yang paling tepat menunjukkan pengamalan sila ketiga.', 'multiple_choice', '{\"A\": \"Membiarkan teman tidak ikut upacara\", \"B\": \"Ikut upacara bendera dengan khidmat\", \"C\": \"Berbicara saat pembacaan Pancasila\", \"D\": \"Menolak kerjasama kelompok\"}', '\"B\"', 'Mengikuti upacara dengan khidmat menunjukkan rasa persatuan dan nasionalisme sesuai sila ketiga.', 'https://www.youtube.com/watch?v=Abpyyx7q4R8', NULL, 'hard', 1, NULL, NULL),
(70, 1, 2, 'True or False: Sila kelima berarti setiap orang harus menerima perlakuan yang sama.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Sila kelima tentang keadilan sosial berarti tidak ada diskriminasi dan semua warga diperlakukan adil.', 'https://www.youtube.com/watch?v=ksWJ2FIPRO0', NULL, 'hard', 1, NULL, NULL),
(71, 2, 2, 'Apa arti dari kata “warga negara”?', 'multiple_choice', '{\"A\": \"Orang yang tinggal di negara lain\", \"B\": \"Orang yang dilahirkan di desa\", \"C\": \"Orang yang secara hukum menjadi bagian dari suatu negara\", \"D\": \"Orang yang tidak memiliki pekerjaan\"}', '\"C\"', 'Warga negara adalah orang yang secara hukum diakui sebagai anggota suatu negara.', 'https://www.youtube.com/watch?v=PHbdsTKCNpg', NULL, 'medium', 1, NULL, NULL),
(72, 2, 2, 'Apa kewajiban utama warga negara dalam sistem demokrasi?', 'multiple_choice', '{\"A\": \"Menjadi tentara\", \"B\": \"Membayar pajak dan mematuhi hukum\", \"C\": \"Menjadi pejabat\", \"D\": \"Pergi ke luar negeri\"}', '\"B\"', 'Dalam sistem demokrasi, warga negara wajib mematuhi hukum dan membayar pajak.', 'https://www.youtube.com/watch?v=sIJyTkBJ6_A', NULL, 'medium', 1, NULL, NULL),
(73, 2, 2, 'True or False: Keadilan sosial adalah tujuan dari negara demokratis.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Dalam demokrasi, keadilan sosial penting agar setiap warga mendapat hak yang setara.', 'https://www.youtube.com/watch?v=ViNuZyY3Eyk', NULL, 'medium', 1, NULL, NULL),
(74, 2, 2, 'Mengapa kita harus menghargai pendapat orang lain dalam musyawarah?', 'short_answer', NULL, '\"karena setiap orang punya hak berpendapat\"', 'Menghargai pendapat mencerminkan sikap demokratis dan menghormati hak orang lain.', 'https://www.youtube.com/watch?v=TR74rsq2xzA', NULL, 'medium', 1, NULL, NULL),
(75, 2, 2, 'Apa warna dasar bendera Indonesia?', 'multiple_choice', '{\"A\": \"Merah Putih\", \"B\": \"Merah Biru\", \"C\": \"Putih Kuning\", \"D\": \"Hijau Merah\"}', '\"A\"', 'Bendera Indonesia berwarna merah di atas dan putih di bawah.', 'https://www.youtube.com/watch?v=oqv1Xg0_MOw', NULL, 'easy', 1, NULL, NULL),
(76, 2, 2, 'True or False: Kita boleh membuang sampah sembarangan di taman kota.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"B\"', 'Membuang sampah sembarangan merusak lingkungan dan melanggar aturan.', 'https://www.youtube.com/watch?v=yMOWVq2_JZs', NULL, 'easy', 1, NULL, NULL),
(77, 2, 2, 'Apa salah satu hak warga negara Indonesia di bidang pendidikan?', 'short_answer', NULL, '\"hak mendapatkan pendidikan\"', 'Warga negara Indonesia memiliki hak untuk mendapat pendidikan, kesehatan, dan kebebasan beragama.', 'https://www.youtube.com/watch?v=SrZ9oKjUCJc', NULL, 'easy', 1, NULL, NULL),
(78, 2, 2, 'Apa fungsi konstitusi dalam suatu negara?', 'multiple_choice', '{\"A\": \"Menetapkan harga barang\", \"B\": \"Mengatur kehidupan rumah tangga\", \"C\": \"Menjadi dasar hukum tertinggi\", \"D\": \"Menentukan mata uang\"}', '\"C\"', 'Konstitusi adalah dasar hukum tertinggi yang menjadi pedoman dalam menjalankan negara.', 'https://www.youtube.com/watch?v=f8zYLa2gzRc', NULL, 'hard', 1, NULL, NULL),
(79, 2, 2, 'True or False: Hak dan kewajiban warga negara tidak perlu dilakukan secara seimbang.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"B\"', 'Warga negara harus melaksanakan hak dan kewajiban secara seimbang agar kehidupan berbangsa harmonis.', 'https://www.youtube.com/watch?v=AhZKIt58KHk', NULL, 'hard', 1, NULL, NULL),
(80, 2, 2, 'Jelaskan mengapa pemilu penting dalam sistem pemerintahan demokrasi.', 'short_answer', NULL, '\"karena pemilu menentukan pemimpin berdasarkan suara rakyat\"', 'Pemilu memberikan kesempatan kepada rakyat untuk memilih pemimpin secara adil dan terbuka.', 'https://www.youtube.com/watch?v=WRvGTxRC8Ro', NULL, 'hard', 1, NULL, NULL),
(81, 3, 2, 'Apa arti dari kata “iman” dalam agama Islam?', 'multiple_choice', '{\"A\": \"Berdoa kepada Allah\", \"B\": \"Keyakinan dalam hati, diucapkan dengan lisan, diamalkan dengan perbuatan\", \"C\": \"Membaca Al-Qur’an\", \"D\": \"Bersedekah setiap hari\"}', '\"B\"', 'Iman adalah keyakinan dalam hati, diucapkan dengan lisan, dan diamalkan dengan perbuatan.', 'https://www.youtube.com/watch?v=Kt7KDjRh4lY', NULL, 'medium', 1, NULL, NULL),
(82, 3, 2, 'Sebutkan 3 rukun iman!', 'short_answer', NULL, '\"iman kepada Allah\"', 'Rukun iman berjumlah 6, namun jika ditanya 3, cukup sebutkan sebagian.', 'https://www.youtube.com/watch?v=U1pQ1rS1eVg', NULL, 'medium', 1, NULL, NULL),
(83, 3, 2, 'True or False: Al-Qur’an adalah kitab suci umat Islam.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Al-Qur’an adalah kitab suci yang diturunkan kepada Nabi Muhammad SAW.', 'https://www.youtube.com/watch?v=aME44ZPyGqE', NULL, 'medium', 1, NULL, NULL),
(84, 3, 2, 'Apa perbedaan antara zakat dan sedekah?', 'short_answer', NULL, '\"zakat wajib, sedekah sunnah\"', 'Zakat adalah kewajiban dengan ketentuan tertentu, sedangkan sedekah bersifat sukarela.', 'https://www.youtube.com/watch?v=7hbeLFhz83I', NULL, 'medium', 1, NULL, NULL),
(85, 3, 2, 'Berapa jumlah rukun Islam?', 'multiple_choice', '{\"A\": \"3\", \"B\": \"4\", \"C\": \"5\", \"D\": \"6\"}', '\"C\"', 'Rukun Islam berjumlah lima, dimulai dari syahadat hingga haji bagi yang mampu.', 'https://www.youtube.com/watch?v=eBx6rmeZY-A', NULL, 'easy', 1, NULL, NULL),
(86, 3, 2, 'True or False: Nabi Muhammad SAW adalah nabi terakhir.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Menurut ajaran Islam, Nabi Muhammad SAW adalah penutup para nabi.', 'https://www.youtube.com/watch?v=NaH9DxFndIA', NULL, 'easy', 1, NULL, NULL),
(87, 3, 2, 'Apa yang sebaiknya dilakukan jika menemukan uang milik orang lain?', 'short_answer', NULL, '\"mengembalikan uang yang bukan miliknya\"', 'Soal ini dibuat agar jawaban yang paling tepat hanya satu, yaitu \"mengembalikan uang yang bukan miliknya.\" Fokus soal diarahkan ke situasi tertentu menemukan uang milik orang lain sehingga peserta didik tidak memberi jawaban lain yang terlalu umum seperti \"berkata jujur\" atau \"tidak menipu.\" Ini membantu melatih pemahaman konkret tentang perilaku jujur dalam kehidupan nyata.', 'https://www.youtube.com/watch?v=poBQiC18clM', NULL, 'easy', 1, NULL, NULL),
(88, 3, 2, 'Apa isi utama dari surat Al-Fatihah?', 'multiple_choice', '{\"A\": \"Tentang penciptaan manusia\", \"B\": \"Doa dan pujian kepada Allah\", \"C\": \"Hukum warisan\", \"D\": \"Larangan makan riba\"}', '\"B\"', 'Al-Fatihah berisi pujian dan permohonan petunjuk kepada Allah.', 'https://www.youtube.com/watch?v=mhVDzFiAja0', NULL, 'hard', 1, NULL, NULL),
(89, 3, 2, 'True or False: Puasa Ramadan hanya wajib bagi anak-anak.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"B\"', 'Puasa Ramadan wajib bagi Muslim yang sudah baligh dan mampu.', 'https://www.youtube.com/watch?v=1Nyn3tEiw2c', NULL, 'hard', 1, NULL, NULL),
(90, 3, 2, 'Sebutkan satu cara menjaga shalat agar selalu khusyuk!', 'short_answer', NULL, '\"menghindari hal yang mengganggu saat shalat.\"', 'Shalat khusyuk berarti shalat dengan penuh konsentrasi dan rasa takut kepada Allah. Agar bisa khusyuk, kita perlu menghindari segala hal yang bisa mengalihkan perhatian saat shalat, seperti suara bising, pikiran yang kacau, atau gadget. Dengan fokus hanya kepada Allah dan tidak terganggu oleh hal lain, shalat menjadi lebih bermakna dan diterima. Jadi, cara menjaga shalat agar khusyuk adalah dengan menghindari gangguan selama shalat berlangsung.', 'https://www.youtube.com/watch?v=5vOlM10xfhI', NULL, 'hard', 1, NULL, NULL),
(91, 4, 2, 'Apa tujuan dari teks prosedur?', 'multiple_choice', '{\"A\": \"Memberi informasi\", \"B\": \"Menghibur\", \"C\": \"Memberi petunjuk melakukan sesuatu\", \"D\": \"Mendeskripsikan benda\"}', '\"C\"', 'Teks prosedur bertujuan memberikan langkah-langkah untuk melakukan suatu kegiatan.', 'https://www.youtube.com/watch?v=yfKrkOHj9ro', NULL, 'medium', 1, NULL, NULL),
(92, 4, 2, 'Apa ciri utama paragraf deduktif?', 'multiple_choice', '{\"A\": \"Kalimat utama di akhir paragraf\", \"B\": \"Berisi pertanyaan\", \"C\": \"Kalimat utama di awal paragraf\", \"D\": \"Tidak memiliki kalimat utama\"}', '\"C\"', 'Paragraf deduktif dimulai dengan kalimat utama di awal paragraf.', 'https://www.youtube.com/watch?v=mfnv4G2N-3I', NULL, 'medium', 1, NULL, NULL),
(93, 4, 2, 'True or False: Kata baku adalah kata yang sesuai dengan kaidah bahasa Indonesia.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Kata baku digunakan dalam situasi resmi dan sesuai EYD/KBBI.', 'https://www.youtube.com/watch?v=MQhA1EX_0HY', NULL, 'medium', 1, NULL, NULL),
(94, 4, 2, 'Sebutkan satu contoh kata tidak baku dan bentuk bakunya!', 'short_answer', NULL, '\"ngga - tidak\"', 'Kata Tidak Baku adalah kata atau bentuk kata yang tidak sesuai dengan kaidah atau aturan bahasa Indonesia yang benar menurut Kamus Besar Bahasa Indonesia (KBBI). Contohnya adalah kata “gak” yang sering digunakan dalam percakapan sehari-hari sebagai pengganti kata “tidak”.', 'https://www.youtube.com/watch?v=k37w1tCrzdo', NULL, 'medium', 1, NULL, NULL),
(95, 4, 2, 'Apa sinonim dari kata “indah”?', 'multiple_choice', '{\"A\": \"Buruk\", \"B\": \"Cantik\", \"C\": \"Jelek\", \"D\": \"Gelap\"}', '\"B\"', 'Sinonim berarti persamaan kata, “indah” bersinonim dengan “cantik”.', 'https://www.youtube.com/watch?v=zIvoIekDWgA', NULL, 'easy', 1, NULL, NULL),
(96, 4, 2, 'True or False: Kalimat tanya biasanya diakhiri dengan tanda tanya.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', 'Kalimat tanya selalu diakhiri tanda tanya karena fungsinya menanyakan informasi.', 'https://www.youtube.com/watch?v=Bybm02wgmNY', NULL, 'easy', 1, NULL, NULL),
(97, 4, 2, 'Sebutkan salah satu jenis teks yang menceritakan suatu kejadian atau cerita!', 'short_answer', NULL, '\"teks narasi\"', 'Teks narasi adalah jenis teks yang bertujuan untuk menceritakan suatu peristiwa, kejadian, atau cerita secara berurutan dan kronologis. Biasanya, teks narasi berisi rangkaian kejadian yang menarik, baik fiksi maupun nonfiksi, dengan tujuan menghibur, memberi informasi, atau menyampaikan pesan moral. Contohnya adalah cerita pendek, dongeng, atau kisah pengalaman.\r\n\r\nDengan mengetahui jenis teks narasi, kita bisa lebih mudah memahami isi cerita dan cara penyampaian peristiwa dalam bahasa Indonesia.\r\n\r\n', 'https://www.youtube.com/watch?v=ku5Z6cK1CGo', NULL, 'easy', 1, NULL, NULL),
(98, 4, 2, 'Apa fungsi konjungsi dalam paragraf?', 'multiple_choice', '{\"A\": \"Menjelaskan kata benda\", \"B\": \"Menyambungkan kalimat atau paragraf\", \"C\": \"Mengulang kata\", \"D\": \"Memisahkan kalimat\"}', '\"B\"', 'Konjungsi adalah kata penghubung untuk menyambungkan ide atau gagasan.', 'https://www.youtube.com/watch?v=PNh3aQkYbso', NULL, 'hard', 1, NULL, NULL),
(99, 4, 2, 'True or False: Teks eksposisi bersifat subjektif dan mengutamakan perasaan penulis.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"B\"', 'Teks eksposisi bersifat objektif dan bertujuan memberi informasi.', 'https://www.youtube.com/watch?v=fF7jI2lwWnc', NULL, 'hard', 1, NULL, NULL),
(100, 4, 2, 'Buatlah satu kalimat yang menunjukkan sikap disiplin di sekolah!', 'short_answer', NULL, '\"siswa harus datang tepat waktu\"', 'Kalimat ini menunjukkan sikap disiplin dengan menekankan pentingnya ketepatan waktu. Disiplin adalah salah satu sikap yang harus dimiliki siswa agar kegiatan belajar berjalan lancar dan tertib. Dengan datang tepat waktu, siswa menghargai waktu, mempersiapkan diri belajar, dan menunjukkan tanggung jawab terhadap kewajibannya. Kalimat tersebut singkat, jelas, dan efektif menggambarkan sikap disiplin yang diharapkan di sekolah.\r\n\r\n', 'https://www.youtube.com/watch?v=9TAKULKLYjM', NULL, 'hard', 1, NULL, NULL),
(101, 5, 2, 'What is the plural form of “child”?', 'multiple_choice', '{\"A\": \"childs\", \"B\": \"children\", \"C\": \"childes\", \"D\": \"childen\"}', '\"B\"', 'The plural of “child” is “children”, which is an irregular noun.', 'https://www.youtube.com/watch?v=2dliUvwle_g', NULL, 'medium', 1, NULL, NULL),
(102, 5, 2, 'Choose the correct meaning of the word \"generous\" in the sentence below:\r\n\"My uncle is very generous; he always helps people in need.\"', 'multiple_choice', '{\r\n  \"A\": \"selfish\",\r\n  \"B\": \"kind and willing to give\",\r\n  \"C\": \"angry\",\r\n  \"D\": \"lazy\"\r\n}\r\n', '\"B\"', 'Kata “generous” berarti seseorang yang murah hati, baik hati, dan suka memberi kepada orang lain. Dalam kalimat tersebut, “My uncle is very generous; he always helps people in need,” menunjukkan bahwa paman tersebut suka membantu orang yang membutuhkan. Oleh karena itu, arti yang paling tepat adalah “kind and willing to give”.\r\n\r\nPilihan lain seperti “selfish” (egois), “angry” (marah), dan “lazy” (malas) tidak sesuai dengan makna kata “generous” dalam konteks kalimat tersebut.\r\n\r\n', 'https://www.youtube.com/watch?v=c8HN9hHcYKI', NULL, 'medium', 1, NULL, NULL),
(103, 5, 2, 'True or False: \"Their\" is used to show possession.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', '\"Their\" is a possessive adjective used to show something belongs to them.', 'https://www.youtube.com/watch?v=0mc4nVCt9JY', NULL, 'medium', 1, NULL, NULL),
(104, 5, 2, 'Translate into English: “Saya makan nasi.”', 'short_answer', NULL, '\"i eat rice\"', '“Saya” means “I”, “makan” means “eat”, “nasi” means “rice”.', 'https://www.youtube.com/watch?v=v5Q2-9Uy3y0', NULL, 'medium', 1, NULL, NULL),
(105, 5, 2, 'What is the English word for “rumah”?', 'multiple_choice', '{\"A\": \"School\", \"B\": \"House\", \"C\": \"Car\", \"D\": \"Garden\"}', '\"B\"', '“Rumah” in English is “house”.', 'https://www.youtube.com/watch?v=I6jE-5r_Obg', NULL, 'easy', 1, NULL, NULL),
(106, 5, 2, 'True or False: \"Apple\" is a fruit.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', '\"Apple\" is indeed a fruit.', 'https://www.youtube.com/watch?v=8wB4Q_y1p-8', NULL, 'easy', 1, NULL, NULL),
(107, 5, 2, 'Write the English word for “air”.', 'short_answer', NULL, '\"water\"', '“Air” in Indonesian translates to “water” in English.', 'https://www.youtube.com/watch?v=PlP5a2Ml2co', NULL, 'easy', 1, NULL, NULL),
(108, 5, 2, 'Which sentence shows someone doing something right now?', 'multiple_choice', '{\"A\": \"He play football\", \"B\": \"He played football\", \"C\": \"He is playing football\", \"D\": \"He will play football\"}', '\"C\"', 'Kalimat ini menggunakan Present Continuous Tense, yang dipakai untuk menyatakan kegiatan yang sedang berlangsung saat ini. Kata kerja “is playing” menunjukkan aktivitas yang sedang dilakukan sekarang.\r\n\r\nPilihan lain:\r\nA) “He play football” salah secara tata bahasa (seharusnya “He plays football” untuk simple present).\r\nB) “He played football” adalah past tense (lampau).\r\nD) “He will play football” menunjukkan masa depan.', 'https://www.youtube.com/watch?v=5bJboSPK-pc', NULL, 'hard', 1, NULL, NULL),
(109, 5, 2, 'True or False: \"Could\" is used to express past ability.', 'true_false', '{\"A\": \"Benar\", \"B\": \"Salah\"}', '\"A\"', '\"Could\" is the past form of \"can\", used to show past ability.', 'https://www.youtube.com/watch?v=5P0KBDMNJrE', NULL, 'hard', 1, NULL, NULL),
(110, 5, 2, 'Complete the sentence: “If I had money, I ___ travel the world.”', 'short_answer', NULL, '\"would\"', 'Conditional sentence type 2 uses “would” for imagined situations.', 'https://www.youtube.com/watch?v=_7guY49rp6g', NULL, 'hard', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`) VALUES
(1, 'Pancasila'),
(2, 'Kewarganegaraan'),
(3, 'Agama'),
(4, 'Bahasa Indonesia'),
(5, 'Bahasa Inggris');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `quizzes_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
