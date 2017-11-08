-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2017 at 04:04 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydatabase`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `sp1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp1` (IN `id` VARCHAR(20), OUT `fname` VARCHAR(20))  BEGIN
DECLARE mytime time;
SELECT vname into fname FROM vendorreg WHERE vid=id;
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `FNChk`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `FNChk` (`id` INT(11)) RETURNS VARCHAR(40) CHARSET latin1 BEGIN
DECLARE name varchar(40);
SELECT vname INTO name FROM vendorreg WHERE vid=id;
RETURN(name);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
CREATE TABLE IF NOT EXISTS `adminlogin` (
  `id` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `pass`) VALUES
('aasif001', 'khan123');

-- --------------------------------------------------------

--
-- Table structure for table `ordertbl`
--

DROP TABLE IF EXISTS `ordertbl`;
CREATE TABLE IF NOT EXISTS `ordertbl` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `remark` varchar(50) DEFAULT 'GOOD',
  `odate` date DEFAULT '1995-02-01',
  `rdate` date DEFAULT '1995-03-03',
  `email` varchar(250) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `tnxid` varchar(25) NOT NULL,
  `amt` decimal(10,2) NOT NULL,
  `cc` varchar(10) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `tnxid` (`tnxid`),
  KEY `fk_pid` (`pid`),
  KEY `fk_pname` (`pname`),
  KEY `fk_email` (`email`),
  KEY `fk_fname` (`fname`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertbl`
--

INSERT INTO `ordertbl` (`oid`, `pid`, `pname`, `remark`, `odate`, `rdate`, `email`, `fname`, `status`, `tnxid`, `amt`, `cc`) VALUES
(1, 2, 'AC 1.5 ton', 'GOOD', '1995-02-01', '1995-03-03', 'aasifk757@gmail.com', 'Aasif', 'Completed', '92M79511SB988102R', '100.67', 'USD'),
(6, 6, 'Vu 109cm (43 inch) Full HD LED TV  ', 'GOOD', '2017-11-08', '1995-03-03', 'aasifk757@gmail.com', 'Aasif', 'Completed', '7K64674313263860X', '50.00', 'USD'),
(4, 5, 'Vu 80cm (32 inch) HD Ready LED TV  ', 'GOOD', '1995-02-01', '1995-03-03', 'aasifk757@gmail.com', 'Aasif', 'Completed', '63B55495BX2569904', '30.00', 'USD'),
(5, 9, 'LG(24 inch) FHD TV 1080P', 'GOOD', '2017-11-02', '1995-03-03', 'aasifk757@gmail.com', 'Aasif', 'Completed', '3UG04822SC578954D', '65.00', 'USD'),
(7, 35, 'Micromax 81cm (32 inch) HD Ready LED TV  (32T8361HD)', 'GOOD', '2017-11-08', '1995-03-03', 'sohel@gmail.com', 'sohel', 'Completed', '5EB87817505701539', '95.00', 'USD'),
(8, 36, 'Voltas 1.5 Ton 3 Star Window AC - White  (183 EYe)', 'GOOD', '2017-11-08', '1995-03-03', 'sohel@gmail.com', 'sohel', 'Completed', '7PE22800UG181124U', '75.00', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `txn_id` varchar(255) NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `qty` int(5) NOT NULL,
  `entrydate` date NOT NULL,
  `pdesc` varchar(1000) NOT NULL,
  `purl` varchar(250) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `ptype` varchar(20) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `vid`, `pname`, `price`, `qty`, `entrydate`, `pdesc`, `purl`, `remark`, `ptype`) VALUES
(1, 1, 'VOLTAS 2 Ton Window AC', 1, 1, '2017-09-12', 'The peace full sleep at anytime and the fight to hot summer..\r\nperfect choice for home and offices', 'bootstrap/image/ac1.jpeg', 'AC', 'AC'),
(2, 2, 'AC 1.5 ton', 100.67, 1, '2017-09-04', 'Looking for an AC that''s both reliable and effective? Then meet the Micromax Split AC - the AC that understands you and your family and offers effective cooling to make summers comfortable. ', 'bootstrap/image/ac2.jpeg', 'dqwdqwdqw', 'AC'),
(3, 3, 'AC 2.5 ton voltas', 20, 1, '2017-09-20', 'Your Answer to Blissful Sleep\r\n\r\nHow many times have you woken up in the middle of the night to switch the AC off because it got too cold? Well, gone are those days, thanks to the Kamin function of this AC. By warming the room by up to 1°C every hour (for a max of four hours), this AC not only helps you enjoy an ideal temperature, but also undisturbed sleep all night long.\r\nPerfect Cooling Experience\r\n\r\nFeeling hot and humid? Say no more, you just got lucky. The Auto Climate technology and Auto Humid control feature in the AC sense the ambient heat and humidity of your room and adjust the temperature and fan speed accordingly, helping you relax.\r\n', 'bootstrap/image/ac3.jpeg', 'nice ac', 'AC'),
(4, 4, 'Onida 1.5 Ton 5 Star ', 10, 1, '2017-09-20', '1.5 Ton : Great for medium sized rooms (110-150 sq ft)\r\n5 Star : For energy savings upto 25% (compared to Non-Inverter 1 Star)\r\nAuto Restart: No need to manually reset the settings post power-cut', 'bootstrap/image/ac5.jpg', 'Onida window AC', 'AC'),
(5, 5, 'Vu 80cm (32 inch) HD Ready LED TV  ', 30, 1, '2017-09-15', 'Awesome Viewing from All Angles\r\n\r\nIs there a single spot in your living room that everyone fights for as it offers the best viewing angle for your TV? Well, you can say goodbye to that fight, thanks to the 178-degree viewing angle of this TV. Now, you can get an enjoyable experience from almost anywhere in the room.\r\n', 'bootstrap/image/tv2.jpeg', 'good tv', 'TV'),
(6, 6, 'Vu 109cm (43 inch) Full HD LED TV  ', 50, 2, '2017-09-18', 'Movies, games, music, and sports events, you can catch them all in stunning clarity on this Full-HD LED TV from Vu. Its IPS panel technology protects the TV ''s display from external pressure and gives you ripple-free images. This TV also packs an Advanced Micro Lens Optical design IPS panel which facilitates high transmittance of every picture to bring you a truly High Definition feel. To add to your experience is this TV’s jumbo-sized box-type design speakers which create stereo separation, thereby allowing it to deliver a stadium-like surround-sound experience.', 'bootstrap/image/tv3.jpeg', 'good tv', 'TV'),
(7, 7, 'Noble Skiodo 55cm (22 inch) Full HD LED TV  ', 80, 1, '2017-09-15', 'Experience entertainment in its pure form on this Noble Skiodo TV’s large 55 cm (22) screen. This TV’s zero dot screen eliminates unnecessary noise so you can enjoy crystal-clear images. This is backed by its powerful speakers which offer you an immersive audio-visual experience. ', 'bootstrap/image/tv1.jpeg', 'nice tv', 'TV'),
(9, 9, 'LG(24 inch) FHD TV 1080P', 65, 1, '2017-09-05', 'The Heart of a Beast\r\n\r\nDo you want higher levels of colour, contrast and clarity on your TV, along with the best possible picture, quality and performance? If yes, then this TV is perfect for you. It comes with LG’s Triple XD Engine, so you can experience your favourite action or superhero movies in better quality.\r\n\r\nGame On\r\n\r\nLove playing games occasionally, but don’t wish to invest on a console? Then this TV might be the answer. Bundled with a bunch of games already installed in it, you’ll have a wonderful time playing them. If not you, why not let your kids have some fun?\r\n\r\n', 'bootstrap/image/tv4.jpeg', 'FHD TV', 'TV'),
(38, 2, 'Nikon D5300 DSLR Camera Body with Single Lens: AF-P DX NIKKOR 18-55 mm f/3.5-5.6G VR Kit', 50, 1, '2017-11-01', 'Effective Angle of View (Nikon DX Format, Focal Length Equivalent to 1.5x that of Lenses with FX Format Angle of View), Monitor (100% Frame Coverage and Brightness Adjustment), Playback (Full-frame and Thumbnail (4, 12, or 80 Images or Calendar) Playback with Playback Zoom, Movie Playback, Photo and/or Movie Slide Shows, Histogram Display, Highlights, Auto Image Rotation, Picture Rating and Image Comment (upto 36 Characters)', 'bootstrap/image/camera6.jpeg', 'CAMERA', 'camera'),
(35, 2, 'Micromax 81cm (32 inch) HD Ready LED TV  (32T8361HD)', 95, 2, '2017-10-06', 'Delight your senses with the Micromax HD Ready LED TV that has CLCP technology and SRS surround sound incorporated. Experience vividness and ultimate clarity without worrying about your electricity bills going up. ', 'bootstrap/image/tv5.jpg', 'Nice Tv', 'TV'),
(36, 2, 'Voltas 1.5 Ton 3 Star Window AC - White  (183 EYe)', 75, 1, '2017-10-06', 'We highly recommend that you get the product installed by the brand/Flipkart authorized service engineers to prevent the warranty from getting void. As the capacity is in the range of 1 to 1.5 tons, it is recommended that you use a 4 KVA (10 Amps) stabilizer with this Air Conditioner in order to prevent damage from power fluctuations. To avoid any physical damage to the product while unboxing, please ensure that only an authorised installation service engineer opens the packaging.', 'bootstrap/image/ac6.jpg', 'Nice AC', 'AC'),
(39, 4, 'Nikon Coolpix A10 Point & Shoot Camera  (Silver)', 70, 1, '2017-11-01', 'Featuring a 16.1 MP image sensor, up to 5x optical zoom and a host of innovative features, the Nikon Coolpix A10 point and shoot camera helps you shoot stunning photos. This camera comes with a Scene Auto selector that picks the appropriate scene mode automatically once you turn the camera on. The 6.7 cm bright TFT LCD monitor displays your shots in crisp detail. The special effects of this point and shoot camera help you enhance your photos before you upload them on social media. Its sleek and compact design makes it portable enough to accompany you on all your trips.', 'bootstrap/image/camera2.jpeg', 'Camera', 'Camera'),
(44, 2, 'Nikon Instax Mini 8 Instant Camera  (Raspberry)', 90, 5, '2017-11-01', 'Capacity: 10 Film Packs, Exposure Counter (Number of Unexposed Films), Film Pack Confirmation Window, Dimensions: 116 X 118.3 X 68.2 mm, Picture Size: 62 x 46 mm\r\nOther Flash Features\r\nConstant Firing Flash (Automatic Light Adjustment), Recycle Time: 0.2 sec to 6 sec (When Using New Batteries)', 'bootstrap/image/camera4.jpeg', 'Camera', 'camera'),
(45, 1, 'Sony Instax Mini 70 Instant Camera (Blue)  (Blue)', 60, 1, '2017-11-01', 'Capture, print, and share photos instantaneously with the Fujifilm Instax Mini 70 Instant Camera.\r\nDesign\r\nYou can also be a part of a group photo as this camera lets you capture one or two frames in continuous shooting.', 'bootstrap/image/camera5.jpeg', 'Camera', 'camera'),
(42, 1, 'Nikon Coolpix A10 Point & Shoot Camera  (Silver)', 70, 1, '2017-11-01', 'Featuring a 16.1 MP image sensor, up to 5x optical zoom and a host of innovative features, the Nikon Coolpix A10 point and shoot camera helps you shoot stunning photos. This camera comes with a Scene Auto selector that picks the appropriate scene mode automatically once you turn the camera on. The 6.7 cm bright TFT LCD monitor displays your shots in crisp detail. The special effects of this point and shoot camera help you enhance your photos before you upload them on social media. Its sleek and compact design makes it portable enough to accompany you on all your trips.', 'bootstrap/image/camera2.jpeg', 'Camera', 'Camera'),
(43, 2, 'Sony DSC-WX500/RCIN5 Camera Point & Shoot Camera  (Red)', 50, 2, '2017-11-01', 'Effective Pixels: 18.2 MP\r\nOptical Zoom: 30\r\nSensor Type: CMOS | LCD Size: 3 inch\r\nMax Shutter Speed: iAuto (4" - 1/2000)/ Program Auto (1" - 1/2000)/ Aperture Priority (8" - 1/2000)/ Shutter Priority (30" - 1/2000)/ Manual (30" - 1/2000) *8', 'bootstrap/image/camera3.jpeg', 'Camera', 'camera');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `pass` varchar(30) NOT NULL,
  `repass` varchar(30) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `country` varchar(15) NOT NULL,
  `utype` varchar(6) NOT NULL DEFAULT 'NORMAL',
  PRIMARY KEY (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`fname`, `lname`, `email`, `mobile`, `pass`, `repass`, `gender`, `country`, `utype`) VALUES
('Aasif', 'pathan', 'aasifk757@gmail.com', '9033363354', '111', '111', 'male', 'India', 'Normal'),
('Aasif', 'Pathan', 'admin@admin.in', '8460624304', 'adm', 'adm', 'male', 'India', 'ADMIN'),
('sohel', 'Pathan', 'sohel@gmail.com', '9033123124', '123', '123', 'male', 'US', 'Normal'),
('javed', 'Pathan', 'javed@gmail.com', '9033123125', '123', '123', 'male', 'US', 'Normal'),
('nisha', 'mistry', 'nisha@gmail.com', '9033123128', '123', '123', 'female', 'india', 'Normal'),
('neha', 'agrawal', 'neha@gmail.com', '9033123122', '123', '123', 'female', 'india', 'Normal'),
('mark', 'steve', 'mark@gmail.com', '9033128981', '123', '123', 'male', 'AUS', 'Normal'),
('Ishrat', 'Chowwala', 'ishu@gmail.com', '9464425251', 'ishu143', 'ishu143', 'female', 'India', 'Normal'),
('Nasrin', 'Pathan', 'nasrin@gmail.com', '9016489524', 'angel143', 'angel143', 'female', 'India', 'Normal'),
('Sahena', 'Mansuri', 'sahena@gmail.com', '9076543346', 'sahu', 'sahu', 'female', 'US', 'Normal'),
('Fahim', 'Hotelwala', 'fahim@gmail.com', '9723135101', 'fahim11', 'fahim11', 'male', 'India', 'Normal'),
('Muffasil', 'Lightwala', 'mufa@gmail.com', '9723249664', 'mufa111', 'mufa111', 'male', 'India', 'Normal'),
('Saddam', 'Chauhan', 'saddam@yahoo.in', '9979812345', 'saddam99', 'saddam99', 'male', 'India', 'Normal'),
('Idris', 'Shaikh', 'idris09@gmail.com', '9879896477', 'idris09', 'idris089', 'male', 'India', 'Normal'),
('Gautam', 'Shrama', 'gautam@ymail.com', '9012345678', '123', '123', 'male', 'India', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `vendorreg`
--

DROP TABLE IF EXISTS `vendorreg`;
CREATE TABLE IF NOT EXISTS `vendorreg` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vname` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `regdate` date NOT NULL,
  `utype` varchar(6) NOT NULL DEFAULT 'VENDOR',
  `pass` varchar(30) NOT NULL,
  `repass` varchar(30) NOT NULL,
  PRIMARY KEY (`vid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendorreg`
--

INSERT INTO `vendorreg` (`vid`, `vname`, `address`, `city`, `state`, `email`, `mobile`, `regdate`, `utype`, `pass`, `repass`) VALUES
(1, 'Nasrin', 'Wadi, Near Chokhandi', 'Vadodara', 'Gujarat', 'nasrin@gmail.com', '9016489524', '2017-11-02', 'VENDOR', 'angel', 'angel');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
