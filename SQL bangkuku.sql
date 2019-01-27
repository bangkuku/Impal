

TABEL CUSTOMER



CREATE TABLE `customer` (
  `id_customer` varchar(5) NOT NULL,
  `password_customer` varchar(20) NOT NULL,
  `nama_customer` varchar(30) NOT NULL,
  `alamat_customer` varchar(30) NOT NULL,
  `no_telpon_customer` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




INSERT INTO `customer` (`id_customer`, `password_customer`, `nama_customer`, `alamat_customer`, `no_telpon_customer`) VALUES
('30301', '213ab', 'ica', 'sukabirus', '081222354768'),
('30302', '313ca', 'Funny', 'sukapura', '085678432124'),
('30303', '413da', 'alwi', 'cikoneng', '088765234908'),
('30304', '535fa', 'amel', 'cihideung', '088654789234'),
('30305', '432yt', 'nurul', 'cibodas', '081223456765');

TABEL MENU



CREATE TABLE `menu` (
  `id_menu` varchar(5) NOT NULL,
  `id_restaurant` varchar(5) NOT NULL,
  `nama_menu` varchar(30) NOT NULL,
  `harga_menu` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `menu` (`id_menu`, `id_restaurant`, `nama_menu`, `harga_menu`) VALUES
('40301', '60301', 'Burger Deluxe', 21000),
('40302', '60301', 'Hot Chicken', 17000),
('40303', '60301', 'Spageti', 18000),
('40304', '60302', 'Hot Chicken', 17000),
('40305', '60302', 'Spicy Chicken', 15000),
('40306', '60302', 'Fusili', 16000),
('40307', '60304', 'Ayam Teriyaki', 17500),
('40308', '60304', 'Pizza', 58000),
('40309', '60304', 'Lasagna', 27000);


TABEL ORDERS




CREATE TABLE `orders` (
  `id_order` varchar(5) NOT NULL,
  `id_customer` varchar(5) NOT NULL,
  `id_tempatduduk` varchar(5) NOT NULL,
  `tanggal_order` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






INSERT INTO `orders` (`id_order`, `id_customer`, `id_tempatduduk`, `tanggal_order`) VALUES
('50301', '30301', '70302', '2019-01-26'),
('50302', '30302', '70301', '2019-01-27'),
('50303', '30303', '70303', '2019-01-28'),
('50304', '30304', '70304', '2019-01-29'),
('50305', '30305', '70305', '2019-01-30');



TABEL RESTAURANT





CREATE TABLE `restaurant` (
  `id_restaurant` varchar(5) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_restaurant` varchar(30) NOT NULL,
  `jumlah_tempatduduk_2` int(2) NOT NULL DEFAULT '0',
  `jumlah_tempatduduk_4` int(2) NOT NULL DEFAULT '0',
  `jumlah_tempatduduk_6` int(2) NOT NULL DEFAULT '0',
  `alamat_restaurant` varchar(30) NOT NULL,
  `no_telpon_restaurant` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





INSERT INTO `restaurant` (`id_restaurant`, `password`, `nama_restaurant`, `jumlah_tempatduduk_2`, `jumlah_tempatduduk_4`, `jumlah_tempatduduk_6`, `alamat_restaurant`, `no_telpon_restaurant`) VALUES
('60301', '123ab', 'MCd', 2, 4, 4, 'Buah Batu', '022654678'),
('60302', '234cd', 'KFC', 3, 2, 4, 'Karapitan', '022678765'),
('60304', '456gh', 'PHD', 2, 3, 2, 'Kiaracondong', '022690432');


TABEL TEMPAT DUDUK



CREATE TABLE `tempat_duduk` (
  `id_tempatduduk` varchar(5) NOT NULL,
  `id_restaurant` varchar(5) NOT NULL,
  `isi_tempatduduk` int(2) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





INSERT INTO `tempat_duduk` (`id_tempatduduk`, `id_restaurant`, `isi_tempatduduk`, `Status`) VALUES
('70301', '60301', 2, 1),
('70302', '60302', 4, 1),
('70303', '60304', 6, 1),
('70304', '60304', 4, 1),
('70305', '60301', 6, 1),
('70306', '60301', 2, 1),
('70307', '60301', 4, 1),
('70308', '60301', 4, 1),
('70309', '60301', 4, 1),
('70310', '60301', 4, 1),
('70311', '60301', 6, 1),
('70312', '60301', 6, 1),
('70313', '60301', 6, 1),
('70315', '60302', 2, 1),
('70316', '60302', 2, 1),
('70317', '60302', 2, 1),
('70318', '60302', 4, 1),
('70319', '60302', 6, 1),
('70320', '60302', 6, 1),
('70321', '60302', 6, 1),
('70322', '60302', 6, 1),
('70323', '60304', 6, 1),
('70324', '60304', 4, 1),
('70325', '60304', 4, 1),
('70326', '60304', 2, 1),
('70327', '60304', 2, 1);


INDEX TABEL

CUSTOMER

ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);




MENU


ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_restaurant` (`id_restaurant`);


ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`);

ORDERS


ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_tempatduduk` (`id_tempatduduk`);



ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_tempatduduk`) REFERENCES `tempat_duduk` (`id_tempatduduk`);

RESTAURANT


ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id_restaurant`);




TEMPAT_DUDUK


ALTER TABLE `tempat_duduk`
  ADD PRIMARY KEY (`id_tempatduduk`),
  ADD KEY `id_restaurant` (`id_restaurant`);




ALTER TABLE `tempat_duduk`
  ADD CONSTRAINT `tempat_duduk_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


select * from restaurant;
select * from menu;
select * from tempat_duduk;
select * from orders;